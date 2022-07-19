Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8717BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LGnMQavcBCRVCEk1l+USZwj1j7JAZzfGsC4Ne7HU7E=; b=otwAbiSEZO9PI1
	ZE/lHJi4dEQIC4q52/8H9RStU7IeDx+YxhUj/5/4O8LAd4T7tPDbOcrCqOxdmn3LFQm0PuNhtegEr
	DLcetahW9rU3INr9uFhBM8BOMs/2oS88umTC+jJ6q6MjPmKM5roMc3YWF1a6cbstopIYTBtGuCkPm
	6n/pXswTe7L2hoNp4fROexkTZFRHn1Qgp5zsag0SiIXaNfpSncZ5nFhGuXCLwuxTSIx4oPVmEnvAU
	uFyeilSBA+CY4RdS1VYxshTteTAuVB1v2L7t4RpIP07v2FZAUOP0J4LtBo5esfNd7iunGKFQ4MZxS
	xVmSxu1p88Q7TCA+T1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDqGE-00AYR8-Gd; Tue, 19 Jul 2022 16:39:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDqGB-00AYP8-3Q
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 16:39:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 754F8B81C0F
	for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 16:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27523C341CB
	for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658248784;
	bh=0W/QCIeJd/PTxapDGvllkrZS/++cW7WMKwFqOsxn48A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h1/TR9XC0U9T6KEybM7/vYJRPkl3WNGPVrjZ/PrEsMGeQQE6EodjPK5Dqz0a/YiZI
	 +gO8J/yVtI51Q9rRyx7eQKiEhdE33c52waKA+LfyMeOuGvZoYePJ9m5WPnQJZ3vHYd
	 I257gq5tQKJH8gZQsy/r3zn/bt7rK7VeTf0Ct7BVTV5wmXCQrth6WG2e2ynSp2eHTn
	 PrxP+uMK6+F/mrQu9Kz1RmYh2sUVlIJ9rSbvcQhv2r4OqDtBTSB3ZJTJuhnKjfbwjN
	 cmE8haYiMpHIVYxDpdartSFYDx3G3tjSzEL/8LFI8ZBQp8PghliTBa8nkRNZc65Z1o
	 cz9lOmZ6whnpg==
Received: by mail-lf1-f50.google.com with SMTP id e28so25738193lfj.4
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 09:39:44 -0700 (PDT)
X-Gm-Message-State: AJIora8Pj9Wnu5y4l81GmV2ghXXtCPZ0tptgW1SwWq10qeo0a7h/aHCs
	sFz49wtZEPAf2J87KVE0KnWVqcGmcULsHjIm+xY=
X-Google-Smtp-Source: AGRyM1tGlEoLlq0vaN8ZQ4Lwp/heWhD5P5eOt1OBUNKhi09KvhnPgIo5SDU3upZxUXCqkMIafVH1GEvqUxYDj6kPEbs=
X-Received: by 2002:a19:9101:0:b0:489:4f34:8c29 with SMTP id
 t1-20020a199101000000b004894f348c29mr16699932lfd.620.1658248782077; Tue, 19
 Jul 2022 09:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220719132400.75407-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20220719132400.75407-1-emil.renner.berthing@canonical.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Jul 2022 00:39:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQW8BJKjnku8nSCTk5Ann8AdRde_g7fqA8d6GDd2MnAYg@mail.gmail.com>
Message-ID: <CAJF2gTQW8BJKjnku8nSCTk5Ann8AdRde_g7fqA8d6GDd2MnAYg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: compat: vdso: Fix vdso_install target
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_093947_313643_1511D54D 
X-CRM114-Status: GOOD (  19.18  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

@Palmer Dabbelt
Please have a look at the patch which fixes up the "make vdso_install"
problem. I recommend it could be fixed in 5.19.

On Tue, Jul 19, 2022 at 9:24 PM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> When CONFIG_COMPAT=y the vdso_install target fails:
>
> $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- vdso_install
>   INSTALL vdso.so
> make[1]: *** No rule to make target 'vdso_install'.  Stop.
> make: *** [arch/riscv/Makefile:112: vdso_install] Error 2
>
> The problem is that arch/riscv/kernel/compat_vdso/Makefile doesn't
> have a vdso_install target, but instead calls it compat_vdso_install.
>
> Fixes: 0715372a06ce ("riscv: compat: vdso: Add COMPAT_VDSO base code implementation")
> Reported-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
> v2: Add Fixes and Reported-by tags
>
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..5cfbef613e34 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -110,7 +110,7 @@ PHONY += vdso_install
>  vdso_install:
>         $(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>         $(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> -               $(build)=arch/riscv/kernel/compat_vdso $@)
> +               $(build)=arch/riscv/kernel/compat_vdso compat_$@)
>
>  ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)
> --
> 2.37.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
