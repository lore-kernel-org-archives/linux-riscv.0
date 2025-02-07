Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E80C021A0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 22:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kja0egPVN4tyIkez/aKiBD0bDG4ZL9Y0FoDaAJJjH6o=; b=Q45ELPCPUUNucH
	O9qf4V0TbgTmVGevMK8Kb3p+crF/Pgyui8Di/6Mr6j4PwNe1NfEjQbq9XhgF8g0jf/bLLT09qplHX
	B9JpfwgTQWg+GZwu23Hi0Fq8sEmgALa4OYHMpwmNHaLyrMpZkaymGMFcO6gFMQBIdSf1xqVDOh7S7
	JRlpNZ9BqGw1P85P71Mhh16lfibrZ29VFpmj9Dhxf4MiYrhw6fhmdOA1hPMx35/bIq/zh3B3FyDip
	t+1w0P1EQHc/qDQBFqVAd4hKZUK2uxe/E88aozyZHFKk5q3CyAbxAXt5UOFd4Opq5GN6Y7VhKMd+V
	RF8EWNuu608EFwhXrAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXGs-0000000BSJP-1gW5;
	Fri, 07 Feb 2025 22:56:26 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWyG-0000000BPLe-1llE
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 22:37:13 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7A213342FDC;
	Fri, 07 Feb 2025 22:37:10 +0000 (UTC)
Date: Fri, 7 Feb 2025 22:37:05 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
Message-ID: <20250207223705-GYA7567@gentoo>
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
 <20250207-promenade-hazily-d7900cbc127e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207-promenade-hazily-d7900cbc127e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_143712_483662_8AE8EF05 
X-CRM114-Status: GOOD (  23.15  )
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

Hi Linus Walleij:
 I think you won't mind if I take this patch through SpacemiT's SoC tree,
as it's fairly SpacemiT specific, right? anyway I'd appreciate if you
could give an ACK for this, thanks

Hi Conor:

On 16:49 Fri 07 Feb     , Conor Dooley wrote:
> On Fri, Feb 07, 2025 at 08:11:42PM +0800, Yixun Lan wrote:
> > Pinctrl is an essential driver for SpacemiT's SoC,
> > so let's enable it by default for this SoC.
> > 
> > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > 'make defconfig' to select kernel configuration options.
> > This result in a broken uart driver where fail at probe()
> > stage due to no pins found.
> > 
> > Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> > Reported-by: Alex Elder <elder@kernel.org>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> > when using make defconfig, thus fail to initilize uart driver which requst
> > pins during probe stage.
> > ---
> >  arch/riscv/Kconfig.socs          | 1 +
> >  drivers/pinctrl/spacemit/Kconfig | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -26,6 +26,7 @@ config ARCH_SOPHGO
> >  
> >  config ARCH_SPACEMIT
> >  	bool "SpacemiT SoCs"
> > +	select PINCTRL
> >  	help
> >  	  This enables support for SpacemiT SoC platform hardware.
> >  
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
thanks Conor

> > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
> > --- a/drivers/pinctrl/spacemit/Kconfig
> > +++ b/drivers/pinctrl/spacemit/Kconfig
> > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> >  	tristate "SpacemiT K1 SoC Pinctrl driver"
> >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> >  	depends on OF
> > +	default ARCH_SPACEMIT
> 
> This is effectively just "default y", since ARCH_SPACEMIT is a
> dependency.
> 
right, this is the plan, it make sense to bundle this config to ARCH_SPACEMIT

> >  	select GENERIC_PINCTRL_GROUPS
> >  	select GENERIC_PINMUX_FUNCTIONS
> >  	select GENERIC_PINCONF
> > 
> > ---
> > base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> > change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> > 
> > Best regards,
> > -- 
> > Yixun Lan
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
