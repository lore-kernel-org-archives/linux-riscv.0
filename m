Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7071AC83011
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:23:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B665D208C3
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0P/RV2og";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1qK2mm4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B665D208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3fnWWz6wb/cYAby7tZsXYR282lBVGz1PeoUUm4kOIzs=; b=0P/RV2ogjAZgU/E2n4ThwWLzn
	uMK1jzquG7EbUFuyMpuUEe2lhuLunj4eyIuYUhyCJKJ7DWZilPluAmxZ7du1Rr6PLE6+Z7688tZHE
	KOprvmIQNfncbsW4UjmdkRmvJC2HDc3mul47q0dWihQoICQ0i16IhNYCiMJY9naJtWwCk9z5fA/oV
	wUzW8wU11IR1znMF8e3tBKpZ6M0Ubfg4WzxIL8XF5/oEC4GXRHKdeF0JVLtvZLaS6blDhJRyguoR9
	4YkDToM4Kj+QAScVMFNIkHHr6x+itvnXgKiQ0NEphjQSvbyYD0jfS/C5XixtLoXmpSxZM2Wh4v/FK
	CB26qVVow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khq55-000427-HF; Wed, 25 Nov 2020 08:23:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khq53-00041j-47
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 08:23:14 +0000
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3BCD20B80
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 08:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606292591;
 bh=UDJR1BLbf6RMG7AoxVnljKWEU7ulln6VKnFURV8nDN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A1qK2mm4BGujkrO3ktSTyLTMkhI9a5paWANmIEOztQdyBRJDiZH5PC6erT3mvdCGy
 jmFY24qddW0nWaRlxs5PLD/EtPtJ3jrkLaD33qEIYzPpqIfH5zWQBllFYeQ/pzcP2H
 4P+gANvsxst5SunwdcTGBuQFXlRoMRjpWshdkp1E=
Received: by mail-oi1-f173.google.com with SMTP id c80so1970392oib.2
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 00:23:11 -0800 (PST)
X-Gm-Message-State: AOAM530cgqwLEuMvOPTyHvDxL/cyLlbxJ+cuVyAOh5lapVo+lMiKwDes
 Vx90ZKFSPS23CvHZ+yY7wbqW9K6M+jb8bcA+BQA=
X-Google-Smtp-Source: ABdhPJxtGbi7ORieJ16EI0Ax/EH2gPZClTdoWhRAo0OaKzifZhhHkSMxBWi4wBoVlScebUmwCLBFBgHMkV441tMCjeU=
X-Received: by 2002:aca:c657:: with SMTP id w84mr1472592oif.47.1606292590851; 
 Wed, 25 Nov 2020 00:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20201124191646.3559757-1-geert@linux-m68k.org>
 <d3ce2d98a7469eda01a67eae7a26585893a1f757.camel@wdc.com>
In-Reply-To: <d3ce2d98a7469eda01a67eae7a26585893a1f757.camel@wdc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Nov 2020 09:23:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGcQKy2yTKHnd+j2+=YKGRUa58oZJuTaWr-PkaCtJyy1A@mail.gmail.com>
Message-ID: <CAMj1kXGcQKy2yTKHnd+j2+=YKGRUa58oZJuTaWr-PkaCtJyy1A@mail.gmail.com>
Subject: Re: [PATCH] efi: EFI_EARLYCON should depend on EFI
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_032313_275113_8BEA2F6A 
X-CRM114-Status: GOOD (  22.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "mingo@kernel.org" <mingo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 25 Nov 2020 at 09:21, Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On Tue, 2020-11-24 at 20:16 +0100, Geert Uytterhoeven wrote:
> > CONFIG_EFI_EARLYCON defaults to yes, and thus is enabled on systems that
> > do not support EFI, or do not have EFI support enabled, but do satisfy
> > the symbol's other dependencies.
> >
> > While drivers/firmware/efi/ won't be entered during the build phase if
> > CONFIG_EFI=n, and drivers/firmware/efi/earlycon.c itself thus won't be
> > built, enabling EFI_EARLYCON does force-enable CONFIG_FONT_SUPPORT and
> > CONFIG_ARCH_USE_MEMREMAP_PROT, and CONFIG_FONT_8x16, which is
> > undesirable.
> >
> > Fix this by making CONFIG_EFI_EARLYCON depend on CONFIG_EFI.
> >
> > This reduces kernel size on headless systems by more than 4 KiB.
> >
> > Fixes: 69c1f396f25b805a ("efi/x86: Convert x86 EFI earlyprintk into generic earlycon implementation")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  drivers/firmware/efi/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> > index b452cfa2100b401c..1dd1f7784f0888ff 100644
> > --- a/drivers/firmware/efi/Kconfig
> > +++ b/drivers/firmware/efi/Kconfig
> > @@ -270,7 +270,7 @@ config EFI_DEV_PATH_PARSER
> >
> >
> >  config EFI_EARLYCON
> >       def_bool y
> > -     depends on SERIAL_EARLYCON && !ARM && !IA64
> > +     depends on EFI && SERIAL_EARLYCON && !ARM && !IA64
> >       select FONT_SUPPORT
> >       select ARCH_USE_MEMREMAP_PROT
> >
> >
>
> Looks good to me.
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
>

Thanks all

I'll queue this as a fix.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
