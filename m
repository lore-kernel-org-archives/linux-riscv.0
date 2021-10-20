Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 12:15:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8BF61354
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 12:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A8BF61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpDVeufME0fdo9We3TpcdYf6BKZ/u5n8RFN3aecdNkU=; b=pp8kKIsFUnElZT
	Xm5dYtE2FxsZVURMCa25UhwZbFe76cKJvkzAp9EfVGZ2DEZemmLdeA0GN9/DUbQsKwpJYSd3OgShE
	qrfNad/yHc0sSyetzvuDapoNykXlFBKRYIH1nzsP0+2l35r5GXvZXJOwYYOABhaOTFWqSgw9j7MqO
	468w4u5DLVl4O2yAu6VLZfJyLmBzRccSIIpg0mVs0tykEKFp5t/hxfV7XGW+Oa+8zBYR4XQmt8+xn
	qbnlbcUxDbnjSt80AKbb5TrP93MTq4ta25D/5RO+fjnsyaQA+7zTSngJDFCNkgDvhGKPPXrLNV4nG
	fnurhUPAhDic6mKC21bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdAV2-004TB7-JS; Wed, 20 Oct 2021 12:15:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdAUz-004TAC-Hu
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 12:15:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCE3661361
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634732112;
 bh=k+9pFl2EGHVkIkPj7tUtcCPSW2gtLYiSKVjDm4JVkcM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iuOI3sZblwYTQqrsuaZukaA2vfbgksh7XuU3Gjr4U32HzN50JZWkPu3E/h16zjWSu
 vvSD0ZIljbmTjUw3FxteIkzJm/Ay5NskuNWzpagQWYym7/P2dpzo5JRrd78LS6XLy7
 bib6YJsANMbIR5mvT/88q6GQiuR8OTCtxn/xj5iNhiXflzjPcoyqthW1NOze1tW/x0
 g84jZqKuzTtND8bvZA54YjpXds9thwwg4E3SCtxs5jivFOfU5ae0nugRG2F0/fuJW6
 +2VILqxclL2nWQZGyg0rSICuiMZhyQxrgnZ/SIr4Cr/xvho6VxRJ8q1RC1U7Ek79zD
 T47wcaTx+aY0A==
Received: by mail-ua1-f46.google.com with SMTP id r22so6088571uat.11
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 05:15:12 -0700 (PDT)
X-Gm-Message-State: AOAM533RwdkbSDct9Pfc8ILLjA5+G99GuBoMqFdjS0GizZd/7q3+t8il
 H3BYTlu8Tj7yZmj3Bw7GdIhzHa2R5XW9jT5ukTA=
X-Google-Smtp-Source: ABdhPJxgUb8+6ER63HYdUCPIFWG4KKTPoKUDp9wCetG2hIfR1P6KLq4rtuoSXsIXApaDQ7UmUocA6Atnj3SHIG6X4V4=
X-Received: by 2002:a05:6102:32cd:: with SMTP id
 o13mr42529588vss.50.1634732111782; 
 Wed, 20 Oct 2021 05:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <2216787.nSqPeTNalD@phil>
 <CAJF2gTQKc1DGcCy_sFjSs8p+VMNGHFrjO2uLZrHnjdD1pZ2RZg@mail.gmail.com>
 <1708236.01x493v0YS@phil>
In-Reply-To: <1708236.01x493v0YS@phil>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Oct 2021 20:15:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR0CYLLWPHDKd27Uj+AUHtcJEcBvZWmigbYno_BunKBMw@mail.gmail.com>
Message-ID: <CAJF2gTR0CYLLWPHDKd27Uj+AUHtcJEcBvZWmigbYno_BunKBMw@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
To: Heiko Stuebner <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_051513_684249_61141832 
X-CRM114-Status: GOOD (  33.80  )
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

On Sun, Oct 17, 2021 at 12:31 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Samstag, 16. Oktober 2021, 14:56:51 CEST schrieb Guo Ren:
> > On Sat, Oct 16, 2021 at 6:35 PM Heiko Stuebner <heiko@sntech.de> wrote:
> > >
> > > Hi Guo,
> > >
> > > Am Samstag, 16. Oktober 2021, 05:21:59 CEST schrieb guoren@kernel.org:
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > >
> > > > Add the compatible string "thead,c900-plic" to the riscv plic
> > > > bindings to support allwinner d1 SOC which contains c906 core.
> > >
> > > The compatible strings sound good now, but some things below
> > >
> > > >
> > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > > Cc: Anup Patel <anup@brainfault.org>
> > > > Cc: Atish Patra <atish.patra@wdc.com>
> > > >
> > > > ---
> > > >
> > > > Changes since V4:
> > > >  - Update description in errata style
> > > >  - Update enum suggested by Anup, Heiko, Samuel
> > > >
> > > > Changes since V3:
> > > >  - Rename "c9xx" to "c900"
> > > >  - Add thead,c900-plic in the description section
> > > > ---
> > > >  .../interrupt-controller/sifive,plic-1.0.0.yaml       | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > index 08d5a57ce00f..272f29540135 100644
> > > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > @@ -35,6 +35,12 @@ description:
> > > >    contains a specific memory layout, which is documented in chapter 8 of the
> > > >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> > > >
> > > > +  The C9xx PLIC does not comply with the interrupt claim/completion process defined
> > > > +  by the RISC-V PLIC specification because C9xx PLIC will mask an IRQ when it is
> > > > +  claimed by PLIC driver (i.e. readl(claim) and the IRQ will be unmasked upon
> > > > +  completion by PLIC driver (i.e. writel(claim). This behaviour breaks the handling
> > > > +  of IRQS_ONESHOT by the generic handle_fasteoi_irq() used in the PLIC driver.
> > > > +
> > > >  maintainers:
> > > >    - Sagar Kadam <sagar.kadam@sifive.com>
> > > >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > > > @@ -46,7 +52,10 @@ properties:
> > > >        - enum:
> > > >            - sifive,fu540-c000-plic
> > > >            - canaan,k210-plic
> > > > -      - const: sifive,plic-1.0.0
> > > > +      - enmu:
> > >
> > >         ^ spelling enum
> > >
> > > > +          - sifive,plic-1.0.0
> > > > +          - thead,c900-plic
> > > > +          - allwinner,sun20i-d1-plic
> > >
> > > but in general I'd think that you want something like
> > >
> > >   compatible:
> > >     oneOf:
> > >       - items:
> > >           - enum:
> > >               - sifive,fu540-c000-plic
> > >               - canaan,k210-plic
> > >           - const: sifive,plic-1.0.0
> > >       - items:
> > >           - enum:
> > >               - allwinner,sun20i-d1-plic
> > >           - const: thead,c900-plic
> > >
> > > Having only one item list would allow as valid combinations like
> > > "sifive,fu540-c000-plic", "thead,c900-plic" when checking the schema.
> > >
> > > With the oneOf and separate lists we can make sure that such
> > > "illegal" combinations get flagged by the dtbs_check
> > >
> > > [the enum with the single allwinner entry already leaves
> > >  room for later addition to the c900-plic variant]
> > Thx, I'll fix it in the next version.
> >
> > another question: Is the allwinner_sun20i_d1_plic needed to IRQCHIP_DECLARE?
> >
> > +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> > +IRQCHIP_DECLARE(allwinner_sun20i_d1_plic, "allwinner,sun20i-d1-plic",
> > thead_c900_plic_init);
>
> Doing
>         IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> should be enough for now.
>
> Compatible-parsing happens from left to right, from most-specific to
> most-generic. So having the allwinner-d1 compatible in there is sort of a
> safeguard.
>
> If at some _later point in time_ , some specific new quirk of the D1
> implementation comes to light, we can _then_ just add a
>         IRQCHIP_DECLARE(allwinner_d1_plic, "allwinner,sun20i-d1-plic", allwinner_d1_plic_init);
>
> Devicetrees should be stable and newer kernels should work with old
> devicetrees, so having the soc-specific compatible in there just makes it
> future proof :-)
Nice tip, thx.

>
>
> Heiko
>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
