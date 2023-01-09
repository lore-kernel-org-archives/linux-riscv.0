Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC0CC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 05:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfJ4iACo7BTp9u0cz/f7l3zJIWp0C5ZjGduTplKxWWI=; b=W4jigYMfqK0KIY
	GWt8YJ9IUmjb+lp50gcTK/ZGKrBrodRC11ikODrXMrNuZ1oHVKKlbalKOaqvyClBDKqKMFvtSJv7U
	l2vrQe4xrf/P+sfvkEskF16TXmmKPO5VNvjGpdgxNg77U3rca2kT+0XdWeJ2vIoKILilcCxupvWLi
	LC/E7P9Fa4mA7Bz1nIuqB1ONEoSP87gELbMBBNDjO1im8Bn2aCXVZK6LbKiBtMJWCexXyJfWNuSs1
	YQDarxq31YWKMRMyAJFPSc7E2ckVfeo91bQuj/k5S8Gp9bVefwLGIAqM0AUilYVcujMixZA5PIRdH
	IJYa9re68/wO7ahNQatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEkPY-00HOhU-Ka; Mon, 09 Jan 2023 05:09:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEkPT-00HOgc-Fj
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 05:09:26 +0000
Received: by mail-ej1-x632.google.com with SMTP id fy8so17210111ejc.13
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jan 2023 21:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gQH0IE3u0wkmAklVZoiydI5Mo0drKV3a8FmyHE+njlo=;
        b=PD4Cr6RmtBmVMqQ+6894VSyIbUZbeFHLeFo9RwkN1TMCAJG24tQV5DCcZgfGbqzo5i
         nORiS6uAg/fxkPBTPz6C3iw1AThEjVSzkcmKxAZcdHGEvO/ekWN+H0w7w6KnYbiK0Wax
         KdpReo4M+zKY8/v575NE68sHQT8u4rMK2ev8eJcfkIKoUcf7ghnHu2Krok7sv45fpNo8
         d3gBK72Vrmj7ozt7KiXXcpz9SHeprPtkHpJDc4qMdgYWZsKXSHp+Ak9he/nmLSUUi9wJ
         yVF/ro9+aJ/+81zYpM73RHvR6O1Ddgnn3xM6uejyK0DYhgeD5Z1SFHYv7K+vTfdEMHxp
         hOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQH0IE3u0wkmAklVZoiydI5Mo0drKV3a8FmyHE+njlo=;
        b=BA8KO/OKGIQWHn1D4v4S9R2iy167AUNxyB+jXBYVyK2jSNuRMexvltQ+BT2cOoZCZj
         AoyZeVbffuTTlqm5QLxRznNtbgmx2ThbPIwB8ZTq/EiIldvofUUvYKbYkj9itR2RQN7a
         BhODKXJoTFZf517lnP88m1MYMCDh2SIgP7aSw+ewbfZwj+vydJCcDcmKawwKzwuSP7+m
         qRAML0ONLwpncyK9BMP/EB0ENJHE+FKgMx8mqbvBIc7quu3o2s8mxQhVJ+3RDRlZyqou
         EqOlBSDV7qczMbjBYIxMCS0KvcuX5gDw3TRHnrsBk5hKwOzb2ICmDNFVQBhRTAIIvWDk
         CiAg==
X-Gm-Message-State: AFqh2krPDj0IwuHjSFAAFQrWAHPI4t9fUaLHzPLlBvNu2Vnuesd//Ega
	kl5laN0bv42mHNDVpy3al50R5+LOL1qUQ/KLDy9QHw==
X-Google-Smtp-Source: AMrXdXsIzihfLVNWVPuUxl3yoyz/+ffKETiVEHV/Bli8Z7zApZlruzh0VgzvBFCjhfBLend9SoSdgJNERtSySPdLfD0=
X-Received: by 2002:a17:906:1481:b0:84d:1760:3981 with SMTP id
 x1-20020a170906148100b0084d17603981mr1189905ejc.705.1673240960233; Sun, 08
 Jan 2023 21:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-2-apatel@ventanamicro.com> <Y7YGp/7ufyRPhkwg@spud>
In-Reply-To: <Y7YGp/7ufyRPhkwg@spud>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jan 2023 10:39:08 +0530
Message-ID: <CAAhSdy2YKJfuxhBmsx9v-OMyxKQjys+J-z_ZqoPJF7q=YrE4Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] RISC-V: Add AIA related CSR defines
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_210925_224196_83186173 
X-CRM114-Status: GOOD (  20.27  )
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

On Thu, Jan 5, 2023 at 4:37 AM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Anup!
>
> On Tue, Jan 03, 2023 at 07:44:01PM +0530, Anup Patel wrote:
> > The RISC-V AIA specification improves handling per-HART local interrupts
> > in a backward compatible manner. This patch adds defines for new RISC-V
> > AIA CSRs.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/csr.h | 92 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 0e571f6483d9..4e1356bad7b2 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -73,7 +73,10 @@
> >  #define IRQ_S_EXT            9
> >  #define IRQ_VS_EXT           10
> >  #define IRQ_M_EXT            11
> > +#define IRQ_S_GEXT           12
> >  #define IRQ_PMU_OVF          13
> > +#define IRQ_LOCAL_MAX                (IRQ_PMU_OVF + 1)
> > +#define IRQ_LOCAL_MASK               ((_AC(1, UL) << IRQ_LOCAL_MAX) - 1)
> >
> >  /* Exception causes */
> >  #define EXC_INST_MISALIGNED  0
> > @@ -156,6 +159,26 @@
> >                                (_AC(1, UL) << IRQ_S_TIMER) | \
> >                                (_AC(1, UL) << IRQ_S_EXT))
> >
> > +/* AIA CSR bits */
> > +#define TOPI_IID_SHIFT               16
> > +#define TOPI_IID_MASK                0xfff
> > +#define TOPI_IPRIO_MASK              0xff
> > +#define TOPI_IPRIO_BITS              8
> > +
> > +#define TOPEI_ID_SHIFT               16
> > +#define TOPEI_ID_MASK                0x7ff
> > +#define TOPEI_PRIO_MASK              0x7ff
> > +
> > +#define ISELECT_IPRIO0               0x30
> > +#define ISELECT_IPRIO15              0x3f
> > +#define ISELECT_MASK         0x1ff
> > +
> > +#define HVICTL_VTI           0x40000000
> > +#define HVICTL_IID           0x0fff0000
> > +#define HVICTL_IID_SHIFT     16
> > +#define HVICTL_IPRIOM                0x00000100
> > +#define HVICTL_IPRIO         0x000000ff
>
> Why not name these as masks, like you did for the other masks?
> Also, the mask/shift defines appear inconsistent. TOPI_IID_MASK is
> intended to be used post-shift AFAICT, but HVICTL_IID_SHIFT is intended
> to be used *pre*-shift.
> Some consistency in naming and function would be great.

The following convention is being followed in asm/csr.h for defining
MASK of any XYZ field in ABC CSR:
1. ABC_XYZ : This name is used for MASK which is intended
   to be used before SHIFT
2. ABC_XYZ_MASK: This name is used for MASK which is
   intended to be used after SHIFT

The existing defines for [M|S]STATUS, HSTATUS, SATP, and xENVCFG
follows the above convention. The only outlier is HGATPx_VMID_MASK
define which I will fix in my next KVM RISC-V series.

I don't see how any of the AIA CSR defines are violating the above
convention.

The choice of ABC_XYZ versus ABC_XYZ_MASK name is upto
the developer as long as the above convention is not violated.

>
>
> > +/* Machine-Level High-Half CSRs (AIA) */
> > +#define CSR_MIDELEGH         0x313
>
> I feel like I could find Midelegh in an Irish dictionary lol
> Anyways, I went through the CSRs and they do all seem correct.
>
> Thanks,
> Conor.
>
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
