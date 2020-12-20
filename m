Return-Path: <SRS0=wI7M=FY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03187C4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Dec 2020 05:30:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E865233CE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Dec 2020 05:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E865233CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s2FbBTLjzHsc3b7zacrngRN/G3yQZlyaJvZHZ9Vzg0E=; b=CaIirJITFg/vfAb1NShhjsoZm
	9NWJii3PztuUt6LSuT30dbo3RCYbSAAyE7d9CmdMcDyty5rLhsmNVAgQC0ySgkjkMC18kfoxl99/X
	ENnC4+nbbx81qLtsqWekZg0+TiX2a5Lyn9HGzeo95FAy1oz4qPzNEmXZDCvzywc4J7Nl9LQOaiGxU
	fIN2ZoZ7fvd/CpBQjDVoiiBBkC8n4h2o73wof/l2Ut8cdaXHpax5OROS4KFSeukax0C4zU2R0USo7
	jy907d2MEx/Eb+/4PyGSXBfPVaPWQBEXe3V/+N5ZVPwGbGHhPp3JVJv0E1ZsNwuQXlgKOrdGidnkU
	qBJVVT3Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqrIg-0006ze-9j; Sun, 20 Dec 2020 05:30:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqrId-0006zD-Vu
 for linux-riscv@lists.infradead.org; Sun, 20 Dec 2020 05:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608442230;
 bh=Qdp7EFwkVoAyU8h9N+P7QV/Zm+mzSlLdhJZueQ/2kCc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sN5VYnuFYQUKtsSck81JTIJ0Q+DmZr9EJ9WoDQ/TCXhktxDUGF2a0BpekviXPmfQX
 nZ1fP4BiU7+DOrRfhd4bowztoqdt4faaE3TD6skhMuJv1LhDwA7IJ0nnigA9cOFxGu
 Y2IdIkzwV0CN8IhhCWLthxxE9sYXyZYB4GUbiA3IANHR8kKcvVe13FI1HkZOZdcZJt
 euwikrbgMa15eokDlvOZH1QuYXGsrLhHB3Gg9z8SqARK5HaJFKJm3I+GNrukQEMsDj
 uA4GWfUfzaWHJLVRFlwgqwX2A2Z6J0Whwz9DVZO48IGpPA0ZywNCCwyFct1yaZTA5w
 E8OQ2FhSh9vJQ==
MIME-Version: 1.0
In-Reply-To: <160842266128.1580929.15786525540819499647@swboyd.mtv.corp.google.com>
References: <20201202123446.21902-1-info@metux.net>
 <160842266128.1580929.15786525540819499647@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3] drivers: clk: make gpio-gated clock support optional
From: Stephen Boyd <sboyd@kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
Date: Sat, 19 Dec 2020 21:30:28 -0800
Message-ID: <160844222880.1580929.12780984836660049815@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_003032_122038_7E1849E1 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Stephen Boyd (2020-12-19 16:04:21)
> Quoting Enrico Weigelt, metux IT consult (2020-12-02 04:34:46)
> > The gpio-gate-clock / gpio-mux-clock driver isn't used much,
> > just by a few ARM SoCs, so there's no need to always include
> > it unconditionally.
> > 
> > Thus make it optional, but keep it enabled by default.
> > 
> > changes v3: default to y when gpiolib enabled
> >             fix depends on gpiolib to uppercase
> > 
> > changes v2: added missing dependency on gpiolib
> > 
> > Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> > ---
> 
> Applied to clk-next

And now reverted

In file included from include/linux/device.h:32:0,
                 from drivers/clk/clk-gpio.c:17:
include/linux/device/driver.h:290:1: warning: data definition has no type or storage class
 device_initcall(__driver##_init);
 ^
include/linux/platform_device.h:258:2: note: in expansion of macro 'builtin_driver'
  builtin_driver(__platform_driver, platform_driver_register)
  ^~~~~~~~~~~~~~
drivers/clk/clk-gpio.c:249:1: note: in expansion of macro 'builtin_platform_driver'
 builtin_platform_driver(gpio_clk_driver);
 ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/device/driver.h:290:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]
 device_initcall(__driver##_init);
 ^
include/linux/platform_device.h:258:2: note: in expansion of macro 'builtin_driver'
  builtin_driver(__platform_driver, platform_driver_register)
  ^~~~~~~~~~~~~~
drivers/clk/clk-gpio.c:249:1: note: in expansion of macro 'builtin_platform_driver'
 builtin_platform_driver(gpio_clk_driver);
 ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/clk-gpio.c:249:1: warning: parameter names (without types) in function declaration
In file included from include/linux/device.h:32:0,
                 from drivers/clk/clk-gpio.c:17:
drivers/clk/clk-gpio.c:249:25: warning: 'gpio_clk_driver_init' defined but not used [-Wunused-function]
 builtin_platform_driver(gpio_clk_driver);
                         ^
include/linux/device/driver.h:286:19: note: in definition of macro 'builtin_driver'
 static int __init __driver##_init(void) \
                   ^~~~~~~~
drivers/clk/clk-gpio.c:249:1: note: in expansion of macro 'builtin_platform_driver'
 builtin_platform_driver(gpio_clk_driver);
 ^~~~~~~~~~~~~~~~~~~~~~~

It looks like it needs to be a bool Kconfig to match how it used to be.
A module would be interesting, but would require more changes
presumably, like getting rid of builtin_platform_driver() and replacing
it with module_platform_driver().

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
