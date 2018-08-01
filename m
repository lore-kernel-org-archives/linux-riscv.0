From: robh@kernel.org (Rob Herring)
Date: Wed, 1 Aug 2018 12:14:42 -0600
Subject: [PATCH 4/6] dt-bindings: interrupt-controller: RISC-V local
 interrupt controller docs
In-Reply-To: <20180801071307.GA20224@lst.de>
References: <20180725093649.32332-1-hch@lst.de>
 <20180725093649.32332-5-hch@lst.de>
 <20180731223714.GA12168@rob-hp-laptop> <20180801071307.GA20224@lst.de>
Message-ID: <CAL_JsqJdMuWVrPu+eNvVtui-Regs4FBi_5tk2-V1YrDyj9jB9g@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 1, 2018 at 1:08 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jul 31, 2018 at 04:37:14PM -0600, Rob Herring wrote:
> > On Wed, Jul 25, 2018 at 11:36:47AM +0200, Christoph Hellwig wrote:
> > > From: Palmer Dabbelt <palmer@dabbelt.com>
> > >
> > > This patch adds documentation on the RISC-V local interrupt controller,
> > > which is a per-hart interrupt controller that manages all interrupts
> > > entering a RISC-V hart.  This interrupt controller is present on all
> > > RISC-V systems.
> > >
> > > Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> > > ---
> > >  .../interrupt-controller/riscv,cpu-intc.txt   | 41 +++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> >
> > My questions and comments on the prior version from Palmer remain.
>
> Can you point to these questions please?  I don't even rember when this
> was last posted as it must have been a long time ago.

It was just a month ago[1], but in googling for the links some
comments from the 1st posting a year ago[2] aren't addressed either.
That applies to the PLIC too.

Rob

[1] https://lkml.org/lkml/2018/7/3/1001
[2] https://lkml.org/lkml/2017/6/27/24
