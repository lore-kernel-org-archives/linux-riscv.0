Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01257606A882
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1jS7prf3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XjKpJXXj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x/uidNZqt0kFviJykfR4nwefLVwJXYijh+lWf9DxYVo=; b=1jS7prf3Cmuuh76BvgfF4NK8/S
	5ULT/4pqhFwILYOjyM9OmdGO5PtTsBlL4cl37hHz0vhzGqKlFdS1bPYiMhbiKNjjxQW7xZB31Mb7h
	cZWmczIEogleXf8A0ExtUMNWXAk6H/VBYGYE8z4yMsz5LgMFsd/Fa/fenocyxsPxU9rQdCB4Yo7th
	1lhcXbUc01CKvTvtYFmNzjSBI3BmBtx+Y8xc/JIUSqojsDcLdD/wQm3c/A4z6xB8PQNeFxIHuFbAG
	Dj5CSTE47v8EjeEkGVrfSfr8c+4qLTxxPCbCSu5v93VuHRmiUKaXB8fePGQrI77nl7ZZKhRJU2H7d
	xcOvQlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt7Q-0000000DO27-19VX;
	Fri, 13 Nov 2026 15:23:12 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt7M-0000000DNwM-1dry;
	Fri, 13 Nov 2026 15:23:09 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8934520215A;
	Fri, 13 Nov 2026 16:22:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794583374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96d7rXyRoBWG/8fCv9Y/Bl4rLafDhcPE/agEQqITANg=;
	b=XjKpJXXjyICTClmTDekFig7pk7sXE8Ln8nC5rPnkE/jXN/q8or26hgleNdx+7KmNHXBcoq
	ZtaPj+v9sGI1n6fSA8p0WqsNCoAjAZeguuN+5WmCKjMktODRKi4oGQGD4aeiMR9puQTWqM
	JYBrXNQHxU3am3lmP38F+vcP7Q6evson1xSbdm2gWZfj4R0Jp59Z58J278w5QCP2706kwx
	tpCrIPo7N+gQ9KIvZuP8+ijGqW13Q6xtbyCrubt9vdh7NpaTjLRbqQSEpGGnoCbM9x9raU
	wumR6oEp2GZ0DE1UE3gwhctm1uj5E+9iT1kT5hT0OIhSlG1SzR13g7dzkK/3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794583374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96d7rXyRoBWG/8fCv9Y/Bl4rLafDhcPE/agEQqITANg=;
	b=JDWV+fP3hzmzv/V0oew3qal05UUmfLCXfHvPSTapnHfmokx/Uxg3RfFhFbCt6skyC2Td2m
	YHFXHST/RM0hRc0zazl2NvZuIcGeVmw3sRY0NNggqMwiVf+Vuq7YnTmBUVtZhOEZPqHxrG
	W68lUzGZbf9QzhX0/4sy5jGlLVjealMaVs6W3sfgg7pdIgGBGOnsMfIyIzLzDD/u5f+vdX
	2ei9YvTK37c+q/h1q2pcefzmWba8K74OqJhOH7ySbn5+6FGb1o2Ew89gDMV3AqiFQ7P6bb
	3Egsu2hiHmtW89u8mjQatDo/DFlC+4ixBNa+hiiexLbQMw6peQrNzXZaxLESpg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794583374; a=rsa-sha256;
	cv=none;
	b=Y93HUGG9IIGXbhDVKXGZLgfbhIoON9AbJNL7AS7vMgwaVjpN36B9te8I6kxWebjqG0zoUn
	KwhNIILKG33jur6V8RXREN4K6MmRZeXvVnIBobPeWNvz4BSo/Cu6nCcKSphLozpAUYRKHL
	mnXCLYtDg+VpOvU0+4pHuCB3Aob3dFYMG3cs5hNb938TzXUpCBqxmj+Y52b36RrLy7ShtP
	D6PSWrQC/Yqh/vOtk3OCFIkORpa+bRYTm3RzxmGvK4c6FRTS1KCE/M0q+D40+V4P+u5zjM
	fzo8qK4U+5eAXLdbRMbXGbWYx7XAY+HK3oSaBEDwSPl4hw1p6CaHecRWDZDGfg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <7baedb8836f538707d008b03e259780bc4fc8bd9.camel@pengutronix.de>
Subject: Re: [PATCH] reset: Remove ARCH_HAS_RESET_CONTROLLER Kconfig symbol
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Davis <afd@ti.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark
 Rutland	 <mark.rutland@arm.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann	 <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 16:22:54 +0100
In-Reply-To: <20261112214223.765100-1-afd@ti.com>
References: <20261112214223.765100-1-afd@ti.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_072308_585459_5D89D05F 
X-CRM114-Status: GOOD (  20.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Do, 2026-11-12 at 15:42 -0600, Andrew Davis wrote:
> Many ARCH_HAS_* symbols change some behavior based on what an ARCH
> supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
> for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
> middleman and directly select RESET_CONTROLLER, and many already do.
> 
> Replace all selection of this symbol with a direct selection of
> RESET_CONTROLLER when it is not already in the selection list. In the
> latter case when RESET_CONTROLLER is also already selected we can simply

"In the latter case" and "when RESET_CONTROLLER is also already
selected" are saying the same thing. I'd choose one and drop the other.

> remove the ARCH_HAS_RESET_CONTROLLER without changing existing behavior.
> 
> Some ARCHs "select" this symbol when they actually "depend on" the
> RESET_CONTROLLER framework to build, in those cases the indirect select
> could lead to broken randconfig builds. In cases when it is not needed
> for building the ARCH code, these selections can be switched to the weaker
> "imply" to allow it deselected for minimal builds without reset support.

Can't it just be dropped completely for those? See for example mach-
gemini below.

> Additional checking will be needed to find such cases.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  arch/arm/Kconfig               | 2 +-
>  arch/arm/Kconfig.platforms     | 1 -
>  arch/arm/mach-bcm/Kconfig      | 4 ++--
>  arch/arm/mach-berlin/Kconfig   | 2 +-
>  arch/arm/mach-ep93xx/Kconfig   | 2 +-
>  arch/arm/mach-gemini/Kconfig   | 2 +-
>  arch/arm/mach-imx/Kconfig      | 2 +-
>  arch/arm/mach-keystone/Kconfig | 2 +-
>  arch/arm/mach-mmp/Kconfig      | 6 +++---
>  arch/arm/mach-omap2/Kconfig    | 1 -
>  arch/arm/mach-rockchip/Kconfig | 2 +-
>  arch/arm/mach-socfpga/Kconfig  | 1 -
>  arch/arm/mach-sti/Kconfig      | 1 -
>  arch/arm/mach-stm32/Kconfig    | 1 -
>  arch/arm/mach-sunxi/Kconfig    | 1 -
>  arch/arm/mach-tegra/Kconfig    | 1 -
>  arch/arm/mach-zynq/Kconfig     | 2 +-
>  arch/arm64/Kconfig.platforms   | 9 +++------
>  arch/mips/Kconfig              | 6 ++----
>  arch/riscv/Kconfig.socs        | 2 +-
>  drivers/reset/Kconfig          | 4 ----
>  21 files changed, 19 insertions(+), 35 deletions(-)
> 
[...]
> diff --git a/arch/arm/mach-gemini/Kconfig b/arch/arm/mach-gemini/Kconfig
> index f436a2009eca3..11e0e966c3bb6 100644
> --- a/arch/arm/mach-gemini/Kconfig
> +++ b/arch/arm/mach-gemini/Kconfig
> @@ -3,7 +3,7 @@ menuconfig ARCH_GEMINI
>  	bool "Cortina Systems Gemini"
>  	depends on ARCH_MULTI_V4
>  	depends on CPU_LITTLE_ENDIAN
> -	select ARCH_HAS_RESET_CONTROLLER
> +	select RESET_CONTROLLER

I don't think this is required. There is no reset controller
implementation in arch/arm/mach-gemini ...

>  	select ARM_AMBA
>  	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
>  	select COMMON_CLK_GEMINI

... and COMMON_CLK_GEMINI already selects RESET_CONTROLLER in
drivers/clk/Kconfig.


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
