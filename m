From: hch@lst.de (Christoph Hellwig)
Date: Tue, 7 Aug 2018 09:20:34 +0200
Subject: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
 documentation
In-Reply-To: <CAL_Jsq+pVzqKUbhErRr15JX2mPUOSTp_ddGvu9KAuf=TtXfduQ@mail.gmail.com>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-4-hch@lst.de>
 <0093fadc-a150-3745-e73d-e579bfdfabfb@wdc.com>
 <CAL_Jsq+pVzqKUbhErRr15JX2mPUOSTp_ddGvu9KAuf=TtXfduQ@mail.gmail.com>
Message-ID: <20180807072034.GA569@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 06, 2018 at 02:59:48PM -0600, Rob Herring wrote:
> > > +Required properties:
> > > +- compatible : "sifive,plic0"
> > > +- #address-cells : should be <0>
> > > +- #interrupt-cells : should be <1>
> > > +- interrupt-controller : Identifies the node as an interrupt controller
> > > +- reg : Should contain 1 register range (address and length)
> >
> > The one in the real device tree has two entries.
> > reg = <0x00000000 0x0c000000 0x00000000 0x04000000>;
> >
> > Is it intentional or just incorrect entry left over from earlier days?
> 
> > > +             reg = <0xc000000 0x4000000>;
> 
> Looks to me like one has #size-cells and #address-cells set to 2 and
> the example is using 1.

Yes.  And it seems like the real life device tree is simply bogus.
