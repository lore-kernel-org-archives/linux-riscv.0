Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8913FECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 22:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kz05bFNUT+i99eVaOdsOFOKtNoe/IdIQT70Fohog5O4=; b=uO4mU/JKCMcgVp
	GYYAPK8OWY5KlDUh+j3Vpac6vs2GZ85FgXUZvg/1fq1ksIk0o/Lt8CII++nGUZtARoAK11PsFYrG6
	f3sFpTyKtPK8ps2s9Mw+NWUrMfwS99LoHiB31B1idq6dO39suHAGLPJFShYXzfPAzY052b568ZX1S
	faEx5xOubbqwK447SyMYMwGQfkiMafbGWydGDC/GGTn9UWXljna7kQpnFqQriy8XeLzO0NbFIOtv6
	kKkZd0YlTtae7vcuMXKW1KeHBlMnMUrEBmKVuY+6EpIGauk1yQV2PXW4SeDNAuLhs1hm8emEeoE2r
	aKWqeFS9g0P9Q0EdesBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxBu-000yCi-Re; Thu, 15 Sep 2022 22:18:38 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxBr-000y4L-Q5
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 22:18:37 +0000
Received: by mail-yb1-xb30.google.com with SMTP id e81so10462796ybb.13
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7rTBa+TZvkiKAMcEE1GZa2Hw9K4HVwTdbY/7JXJfnHE=;
        b=UYAzpgH6jbwevP5kLebZHPqxMQ1b1nKnksij3MYheAodV0Ll6zXsWBtBgWiNvEYXsP
         acVy2vgPBsUTOEkMi2hRfllKSU1jpy58kbDY+COAQUbKr5chRQW47i7cMa2Yg2UUDyCr
         4aC1JVJNdYzjHsFb4xJ7eeKI8Z23zn1Uz1HhxJob6Ap3kElHjMDMJjkjsoABrq2P4pal
         +pNxjeNyd9SU4zSwVvAG12C9bgM+HoOX+IaU/HOc8miy0mJASO52oTZVKtLnrItxhheO
         +xrV86CXjwHwYCmCjSFojngsjRLdkc1hIsiyntmKftI5anSiFv4SoZLC9MQts+ae+Ii0
         SIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7rTBa+TZvkiKAMcEE1GZa2Hw9K4HVwTdbY/7JXJfnHE=;
        b=Qqoi8uht6/3r0q6g0xaik12DDPVHJaehghAgwzUoNFE3C7x7Z8FE3B5dDoe3IbB6AV
         778zPj8Uyu9NMrA0crAD65+uAV/LIHEgDY03WHxQ5LyugrkMzb4YZzvJYG8QKnGC7PeP
         aZnfnGNOBYtNYQRFlbVxuM0D/hlAZsOGWtRiISh655FnxzoueE9CXyDs0Mz/hYzNHsEy
         sqXZIS6gOVt8N/Qup/V65psOdH+vcR1UOVlUhWjfC7ITnpD5vNQaP2ETA51ZrdgxGjHD
         0CszYEle2cd8KFZznstJMP/NsRmXEwRcjHMFsYucAPRwy2tWVv3ljW1w0Jf+8ejf04OF
         XPiQ==
X-Gm-Message-State: ACrzQf2O1rqTtyEmj4Hk4in13iC3qw2LKr6i8LYeAECwsOhaye1HZuMz
	nfpowNgMBWc7G77aOviu0ZG8XEJ79kmIj51N9RU=
X-Google-Smtp-Source: AMsMyM5qkhFr6mYLitJhEUs5llsOwuL8t3fDB1o5pzCFI52+HRBEiKw3M1v3foGS1UjlkCiHW+bL2UrNZJPYVkiP/M8=
X-Received: by 2002:a05:6902:1007:b0:6ae:6cd5:4b0b with SMTP id
 w7-20020a056902100700b006ae6cd54b0bmr1895083ybt.354.1663280310596; Thu, 15
 Sep 2022 15:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <126c611d-b421-cff9-6384-bc468be7ec73@microchip.com>
In-Reply-To: <126c611d-b421-cff9-6384-bc468be7ec73@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Sep 2022 23:18:02 +0100
Message-ID: <CA+V-a8sv9sFwGktxqkWohQF2FfxyQm=Z5GVNjPW9i2hKxtNWpg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
To: Conor.Dooley@microchip.com
Cc: geert+renesas@glider.be, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de, 
	atishp@rivosinc.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_151835_869133_3785982F 
X-CRM114-Status: GOOD (  23.09  )
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

Hi Conor,

Thank you for the review.

On Thu, Sep 15, 2022 at 9:59 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/09/2022 19:15, Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> > (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> > of the Renesas drivers depend on this config option.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2->v3
> > * Included RB tag from Geert
> >
> > v1->v2
> > * No Change
> > ---
> >  arch/riscv/Kconfig.socs | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 69774bb362d6..91b7f38b77a8 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif # SOC_CANAAN
> >
> > +config ARCH_RENESAS
> > +       bool
> > +       select GPIOLIB
> > +       select PINCTRL
> > +       select SOC_BUS
>
> Do you really need to select SOC_BUS?
> Noone else does on RISC-V, hence my curiosity.
>
Yes we do need SOC_BUS due to soc_device_register() call in [0].
Digging further I realized we can drop the above SOC_BUS as
SOC_RENESAS is selecting SOC_BUS [1]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/renesas/renesas-soc.c?h=v6.0-rc5#n487
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/renesas/Kconfig?h=v6.0-rc5#n5

> > +
> > +config SOC_RENESAS_RZFIVE
> > +       bool "Renesas RZ/Five SoC"
> > +       select ARCH_R9A07G043
> > +       select ARCH_RENESAS
> > +       select RESET_CONTROLLER
> > +       help
> > +         This enables support for Renesas RZ/Five SoC.
>
> :thinking: isn't this pretty much what we decided not to do?
> And instead you would redefine ARCH_RENESAS in this file and
> not use SOC_RENESAS* at all? Will save me having to purge the
> the SOC symbol when I do the conversion.
>
I was under the impression we didn't come to a conclusion so kept the
patch as is. I'll just make ARCH_RENESAS visible as Geert suggested
something like below:

        config ARCH_RENESAS
            bool "Renesas RISC-V SoCs"
            select GPIOLIB
            select PINCTRL
            select RESET_CONTROLLER


Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
