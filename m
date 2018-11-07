From: paul.walmsley@sifive.com (Paul Walmsley)
Date: Wed, 7 Nov 2018 02:00:30 +0000 (UTC)
Subject: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
In-Reply-To: <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
 <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
Message-ID: <alpine.DEB.2.21.999.1811070159350.29982@utopia.booyaka.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 6 Nov 2018, Stephen Boyd wrote:

> Quoting Paul Walmsley (2018-10-20 06:50:23)
> > diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> > new file mode 100644
> > index 000000000000..d7c1e83fa5ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> > @@ -0,0 +1,43 @@
> > +SiFive FU540 PRCI bindings
> > +
> > +On the FU540 family of SoCs, most system-wide clock and reset integration
> > +is via the PRCI IP block.
> > +
> > +Required properties:
> > +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
> > +              file was written, only one value is supported:
> 
> I don't think we need the "As of the time" sentence. It will become out
> of date almost immediately so why not just say "The list of supported
> values is:"?

Adopted this change.  Thanks for the review.


- Paul
