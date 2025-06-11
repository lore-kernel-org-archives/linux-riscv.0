Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E379C71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aq0qZQ6l1w+k0Zc7EjOzshbhogUJTNZfRjw1ezeGnr0=; b=tzRRo5Vfrn2geQ
	nGq66kWUb69lCmLkIeb6aNcHAFtze/bvHkWPDEfPlqZdACRRT5Y8Cf3YtMVnvLoCyrTURw5Ixg/xQ
	2OyoPQJ7irw6t5zLG07lRRH+Fk23Rqd+pUg7jP9OPjhZjtMugLosp4v/ofJX7hkdlU2k01m+xoMxi
	Sa0u1rJH7d/NbQ+ZC1M5hCZRbXZKfZvdgW9tqG7VOLTSvTfEb/MHetOeVbwhXZ1RhPETvnyTUnEDP
	mKqYOJ0+3fTDsfALWZ0WzxTTukapiF+n7II9pkzECIXxE8ucLHpl6ywzFT/n72w5Zxpk9kjM7IE5f
	EEfLcLeJh0ZnZ7gFgoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPk2-0000000AmRV-118P;
	Wed, 11 Jun 2025 18:00:02 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLrR-0000000A0XE-2oF9
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:51:26 +0000
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7C8C2340D31;
	Wed, 11 Jun 2025 13:51:24 +0000 (UTC)
Date: Wed, 11 Jun 2025 13:51:16 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, emil.renner.berthing@canonical.com,
	inochiama@gmail.com, geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/8] dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
Message-ID: <20250611135116-GYB125008@gentoo>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-8-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611125723.181711-8-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_065125_726646_2B70FCED 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Guodong,
  I'd suggest moving this patch after 4/8, as both of them should go
via DMA susbystem tree, or simply squash them?

On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> Extend the MMP_PDMA driver to support the SpacemiT architecture
> by adding ARCH_SPACEMIT as a dependency in Kconfig.
> 
> This allows the driver to be built for SpacemiT-based platforms
> alongside existing ARCH_MMP and ARCH_PXA architectures.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index db87dd2a07f7..fff70f66c773 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -451,7 +451,7 @@ config MILBEAUT_XDMAC
>  
>  config MMP_PDMA
>  	tristate "MMP PDMA support"
> -	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
> +	depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
>  	select DMA_ENGINE
>  	help
>  	  Support the MMP PDMA engine for PXA and MMP platform.
> -- 
> 2.43.0
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
