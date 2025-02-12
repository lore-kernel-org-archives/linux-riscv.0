Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995A8C02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nvbte/tmKXcGh5lHtb/QFzpn8oVwGqk14b0/Zzt8QDo=; b=jc5CeH8ZUpT0k/
	Bwy4Q1CW5vR61lD9XOecyEGyFxksCeecB0KQf/dd66AgAqhyaQrx2P6h5OlXb5ukECrSXdVJwvpZw
	3txdA0hqNTVm/b118TuSDmH9G8QLkW6m16eJ7sEvPCa414eX4qvck0e55W6ky0a/utRUTWIPmtYhH
	w+fae3O0eRjxKUQN/PiY/fwfhRfTaHRvhp/22KwcnvVbSAXHMye0rr4MrSUYbmKythxQ37YbYP5NJ
	OA25uv0fA3gnFqnU/c+jhqy4CnZMq7pmWgGOwAm42hOZvQCrU1rjJ5Wdl9Aj/y007v0Lgt6LMuE87
	O8JpCaNTgqJxYsrWUKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDYn-00000007dqw-0HGk;
	Wed, 12 Feb 2025 14:17:53 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDYk-00000007do7-1R9V
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 14:17:51 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0BBAF343065;
	Wed, 12 Feb 2025 14:17:46 +0000 (UTC)
Date: Wed, 12 Feb 2025 14:17:41 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] pinctrl: spacemit: enable config option
Message-ID: <20250212141741-GYA18065@gentoo>
References: <20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org>
 <b67abe31-5647-4450-b025-2bbacee5fa72@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b67abe31-5647-4450-b025-2bbacee5fa72@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_061750_413911_4FC64A15 
X-CRM114-Status: GOOD (  31.24  )
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

Hi Alex:

On 07:50 Wed 12 Feb     , Alex Elder wrote:
> On 2/12/25 2:27 AM, Yixun Lan wrote:
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
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Tested-by: Alex Elder <elder@riscstar.com>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> I just tested this version of the patch.  By default
> PINCTRL_SPACEMIT_K1 is "y".  But since it's tristate,
> perhaps it should be default=m so it's not built in
> for everyone.  Yixun I assume the K1 pinctrl driver
> actually *works* as a kernel module.
> 
in theory, making it built as module, it should work fine if all drivers
can handle "deferred probe" gracefully, but since pinctrl is an essential
 basic driver, I'd prefer to make it built-in ..

I didn't bother to change this module from tristate to bool,
as there is additional COMPILE_TEST option(maybe it want to test as module?)

> Anyway, I suggest this change to be a module; Conor
> should weigh in.  Either way is good for me, and I
> have tested both.
> 
no, I don't think making it as module is a good idea,

I can adjust this driver from tristate to bool if necessary,
also adjust to builtin_platform_driver() in driver..

let me know what you think

> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
> > ---
> > This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> > when using make defconfig, thus fail to initilize uart driver which requst
> > pins during probe stage.
> > ---
> > Changes in v2:
> > - set default as y
> > - Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
> > ---
> >   arch/riscv/Kconfig.socs          | 1 +
> >   drivers/pinctrl/spacemit/Kconfig | 1 +
> >   2 files changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -26,6 +26,7 @@ config ARCH_SOPHGO
> >   
> >   config ARCH_SPACEMIT
> >   	bool "SpacemiT SoCs"
> > +	select PINCTRL
> >   	help
> >   	  This enables support for SpacemiT SoC platform hardware.
> >   
> > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..c18d879274e72df251e0bc82a308603ce23738bd 100644
> > --- a/drivers/pinctrl/spacemit/Kconfig
> > +++ b/drivers/pinctrl/spacemit/Kconfig
> > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> >   	tristate "SpacemiT K1 SoC Pinctrl driver"
> >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> >   	depends on OF
> > +	default y
> >   	select GENERIC_PINCTRL_GROUPS
> >   	select GENERIC_PINMUX_FUNCTIONS
> >   	select GENERIC_PINCONF
> > 
> > ---
> > base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> > change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> > 
> > Best regards,
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
