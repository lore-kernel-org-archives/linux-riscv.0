Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5F3E92733
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 16:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0fVhK61DsXeZ2RlzbqXPSEV0UieksgP1ITG2rQNhiQ=; b=p5NferxEiucEKP
	7jELxlq5BiT4Yge3fjuyfZ9T2lOsAC0gBerBihBgp5zM5o8MWVwS49lcBwsldBMlnjso+XElIqhv+
	BnCStvpBraI+RW5Z2Nbx3tnADyI+jfzGCnFj0vgbec12u/smWqtVZHgVcjd2t7ZZQZpgEa6dhRVuK
	u+TSakyRukWREMjdzLsyOt1fAOQWmEldY8oqAWBFAMGU/9s4DSt04EXo6OAvSdq7mptTAtxtz76us
	nUmcdtSQ0vyy9ChtwghU41FWE1a13qPmvmkbkiAm6nz2h+wgtc2DPX0+TKfHdLHaZ7SsFrHHLZhYN
	fMqLWX4RJx0X4d0yS0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaGYl-00000003tsy-11Dr;
	Mon, 29 Dec 2025 16:57:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaGYj-00000003tsg-0Ihl;
	Mon, 29 Dec 2025 16:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C67B56000A;
	Mon, 29 Dec 2025 16:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2FDC4CEF7;
	Mon, 29 Dec 2025 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767027447;
	bh=E31HvJ363TN6uC42P4kucOdswqsyvsSaSZ0lYlrqR60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYkjZnyjbUNU1ZuEUrB60QMEk/agiFMuDq/kzH5DjVqjUAUsDJplkWocvO52YflxZ
	 M17XK4wGeuX5IYgtfzwT35ybC1J35161gZv7W0MY2tHkiFGuuNRmoUugugVRUxQ+5F
	 10ZIgnWf4SkjOJyW70R0SOliR8kDiic4Q/eJ2hapMEJT7ACQtteXKTWQtvowPRn4Fm
	 GYfUV/UWQxeqhq6i7S3cOqzSwviVDoXrc3Bm9C069aHdb9bMxzXdyR/vZcblwzw7d9
	 +waVlMkS8OEuspbLuEJ4s4mDZ4ZjjhXZihHqtxj00AfovJM9WC6AxCx+JTwFYL7MQP
	 XgaE3NOkt7WKw==
Date: Mon, 29 Dec 2025 22:27:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: neil.armstrong@linaro.org, dlan@gentoo.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	guodong@riscstar.com, linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
Message-ID: <aVKy87c7afpWIx33@vaman>
References: <20251226173228.2020411-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226173228.2020411-1-elder@riscstar.com>
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

On 26-12-25, 11:32, Alex Elder wrote:
> The SpacemiT PCIe PHY driver depends on the common clock framework.
> Not specifying that led to a failure when doing a COMPILE_TEST build
> for the SPARC architecture.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> Note:  This is based on phy/next, which I find doesn't currently build
>        cleanly using "arch/riscv/configs/defconfig".

I dont build rsicv, I should add that. What is the failure you see,
looking at changes I dont see anything that might break this

> 
>  drivers/phy/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index aa2d30e0e3261..3bc7378ea8658 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -104,6 +104,7 @@ config PHY_NXP_PTN3222
>  config PHY_SPACEMIT_K1_PCIE
>  	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on COMMON_CLK
>  	depends on HAS_IOMEM
>  	depends on OF
>  	select GENERIC_PHY
> 
> base-commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074
> -- 
> 2.48.1

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
