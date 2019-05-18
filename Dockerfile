FROM golang:1.12.5
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    mkdir -p $GOPATH/src/github.com/operator-framework && \
    cd $GOPATH/src/github.com/operator-framework && \
    git clone -b master --single-branch --depth 1 https://github.com/operator-framework/operator-sdk && \
    cd operator-sdk && \
    make dep && \
    make install

FROM golang:1.12.5
COPY --from=0 $GOPATH $GOPATH
