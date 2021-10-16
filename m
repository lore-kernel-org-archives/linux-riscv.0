Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20827C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 16:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABAE960462
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 16:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABAE960462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9BmtdVQ+tDAzfIzNLTz71x10wbE7plUhkwKLR20Xj4=; b=hWTfRjGWFNd1+h
	NQBcdWOcYtrIJPNAfyPN8Ny+ldjm+0gzKw8nxghqiCDbiccKH3ohdfMBqYb5RJGHntt6NIvJD1Ndq
	7QW3QVs6ExX6EW3lRclCug4RS5XG09FMDDy8KOulTd28fzEIjeEygzOnO0hk1ktOAzyQqn7+dC/cY
	wmHnDUkTnr2qps4kgCJllyWCCasD5Hh2k+a+mCkrzg3M2//OiKK7wmxDWmFxEvFZ7NubHaVypbOzA
	8aibaCwYzMZvgLaL3Ta8BJcE3J4DWmIWU/3A+bJ1ltdIQnIh3JzL2ttdiPvzj/EcJGBCLOncnxCCJ
	X4LUMgeoLJezG5i2sD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbmbG-00Ayfm-1V; Sat, 16 Oct 2021 16:31:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbmbC-00Ayf5-Uh
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 16:31:56 +0000
Received: from p508fce7c.dip0.t-ipconnect.de ([80.143.206.124]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mbmb6-0007eW-PS; Sat, 16 Oct 2021 18:31:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
Date: Sat, 16 Oct 2021 18:31:47 +0200
Message-ID: <1708236.01x493v0YS@phil>
In-Reply-To: <CAJF2gTQKc1DGcCy_sFjSs8p+VMNGHFrjO2uLZrHnjdD1pZ2RZg@mail.gmail.com>
References: <20211016032200.2869998-1-guoren@kernel.org>
 <2216787.nSqPeTNalD@phil>
 <CAJF2gTQKc1DGcCy_sFjSs8p+VMNGHFrjO2uLZrHnjdD1pZ2RZg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_093155_033032_658CEF15 
X-CRM114-Status: GOOD (  30.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Samstag, 16. Oktober 2021, 14:56:51 CEST schrieb Guo Ren:
> On Sat, Oct 16, 2021 at 6:35 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > Hi Guo,
> >
> > Am Samstag, 16. Oktober 2021, 05:21:59 CEST schrieb guoren@kernel.org:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Add the compatible string "thead,c900-plic" to the riscv plic
> > > bindings to support allwinner d1 SOC which contains c906 core.
> >
> > The compatible strings sound good now, but some things below
> >
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Atish Patra <atish.patra@wdc.com>
> > >
> > > ---
> > >
> > > Changes since V4:
> > >  - Update description in errata style
> > >  - Update enum suggested by Anup, Heiko, Samuel
> > >
> > > Changes since V3:
> > >  - Rename "c9xx" to "c900"
> > >  - Add thead,c900-plic in the description section
> > > ---
> > >  .../interrupt-controller/sifive,plic-1.0.0.yaml       | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > index 08d5a57ce00f..272f29540135 100644
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > @@ -35,6 +35,12 @@ description:
> > >    contains a specific memory layout, which is documented in chapter 8 of the
> > >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> > >
> > > +  The C9xx PLIC does not comply with the interrupt claim/completion process defined
> > > +  by the RISC-V PLIC specification because C9xx PLIC will mask an IRQ when it is
> > > +  claimed by PLIC driver (i.e. readl(claim) and the IRQ will be unmasked upon
> > > +  completion by PLIC driver (i.e. writel(claim). This behaviour breaks the handling
> > > +  of IRQS_ONESHOT by the generic handle_fasteoi_irq() used in the PLIC driver.
> > > +
> > >  maintainers:
> > >    - Sagar Kadam <sagar.kadam@sifive.com>
> > >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > > @@ -46,7 +52,10 @@ properties:
> > >        - enum:
> > >            - sifive,fu540-c000-plic
> > >            - canaan,k210-plic
> > > -      - const: sifive,plic-1.0.0
> > > +      - enmu:
> >
> >         ^ spelling enum
> >
> > > +          - sifive,plic-1.0.0
> > > +          - thead,c900-plic
> > > +          - allwinner,sun20i-d1-plic
> >
> > but in general I'd think that you want something like
> >
> >   compatible:
> >     oneOf:
> >       - items:
> >           - enum:
> >               - sifive,fu540-c000-plic
> >               - canaan,k210-plic
> >           - const: sifive,plic-1.0.0
> >       - items:
> >           - enum:
> >               - allwinner,sun20i-d1-plic
> >           - const: thead,c900-plic
> >
> > Having only one item list would allow as valid combinations like
> > "sifive,fu540-c000-plic", "thead,c900-plic" when checking the schema.
> >
> > With the oneOf and separate lists we can make sure that such
> > "illegal" combinations get flagged by the dtbs_check
> >
> > [the enum with the single allwinner entry already leaves
> >  room for later addition to the c900-plic variant]
> Thx, I'll fix it in the next version.
> 
> another question: Is the allwinner_sun20i_d1_plic needed to IRQCHIP_DECLARE?
> 
> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> +IRQCHIP_DECLARE(allwinner_sun20i_d1_plic, "allwinner,sun20i-d1-plic",
> thead_c900_plic_init);

Doing
	IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
should be enough for now.

Compatible-parsing happens from left to right, from most-specific to
most-generic. So having the allwinner-d1 compatible in there is sort of a
safeguard.

If at some _later point in time_ , some specific new quirk of the D1
implementation comes to light, we can _then_ just add a 
	IRQCHIP_DECLARE(allwinner_d1_plic, "allwinner,sun20i-d1-plic", allwinner_d1_plic_init);

Devicetrees should be stable and newer kernels should work with old
devicetrees, so having the soc-specific compatible in there just makes it
future proof :-)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
