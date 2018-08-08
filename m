From: robh+dt@kernel.org (Rob Herring)
Date: Wed, 8 Aug 2018 08:44:41 -0600
Subject: [PATCH 01/11] dt-bindings: Correct RISC-V's timebase-frequency
In-Reply-To: <20180802115008.4031-2-hch@lst.de>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-2-hch@lst.de>
Message-ID: <CAL_JsqLq_JqjbnjSz7+72ssZH1deKU7iCxofn_bLhiKpCEXD=w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 2, 2018 at 5:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> From: Palmer Dabbelt <palmer@sifive.com>
>
> Someone must have read the device tree specification incorrectly,
> because we were putting timebase-frequency in the wrong place.  This
> corrects the issue, moving it from
>
> / {
>         cpus {
>                 timebase-frequency = X;
>         }
> }
>
> to
>
> / {
>         cpus {
>                 cpu at 0 {
>                         timebase-frequency = X;
>                 }
>         }
> }
>
> This is great, because the timer's frequency should really be a per-cpu
> quantity on RISC-V systems since there's a timer per CPU.  This should
> lead to some cleanups in our timer driver.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
