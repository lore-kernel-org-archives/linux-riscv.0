Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EE4C4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJgLlslQ0pFkZjX5kTz+zYul5jO3RaLfERH4ZxueXfA=; b=szrVvCEDSsRHXB
	t3AJZeVoBFTdlSzneme2Fu1IICJ+2b4GHEjc8LwZ5wjLmTkgHYKwUxmagkJZozKaoCyMAFRSsynUQ
	oYYfb6JQwJ65m2DCVJwR3jE1/V2Sg9t2ayR8GWVJeA1sPIOY7V9RlBPlgj5h134z6xaU5F3dj4JH0
	nP+PGM4Q29XlYN1CAsN3ZMfWnxLeN9SKIG6a39rh2KLZaYH64AhANios4A4AMjn7GWSSYqoBwKz6b
	Lu/p0Spem6XL/Z8b1RdVfclcI2KkX40qg2c9FtspS5M9ARpMDkH1nqMAYEc3iO7aQz8TXN83ye8Sr
	Mb/tTscu+ibcd4uxgW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxAD-006pw5-NH; Sat, 26 Nov 2022 15:32:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxA1-006ptm-Tm
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 15:32:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 089CD60B6E;
	Sat, 26 Nov 2022 15:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9ECAC433C1;
	Sat, 26 Nov 2022 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669476728;
	bh=2h++QTrAorI59jH3iOzNiOX8uGhWbeZh9J4UkZ1FyzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTiCoNiFxstsiQ35EmguH3iWYVBEe3apPBSsTx3XhGaH6OEnPLE73OcRJDA1TFzzf
	 3G5xP1gC1z9cmAtNIgerhIblRAmPkHDOEfr4XGBzsz9+8BJWW71+71cyduG14ubOxd
	 iCjl6S0MQL2qWIUHflM/amzUvTLsZ/cGBhxbcpX+vX/OprEHM+0sAaQzfeQ84oHdDS
	 tDsZRQvY7SkerNjM6DL9/uAsielxGaDuroSK6k4R262+5K97gDO3EmRQs8R7w7ecn6
	 v/bNBy13uGUtaRaStBGxFq5x3XvB9HBVG2BBSggNAfOrVMhWRPinZjUx0rrQ3To5Je
	 3E/eQnnf9MgOA==
Date: Sat, 26 Nov 2022 15:32:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Fix NR_CPUS range conditions
Message-ID: <Y4IxdOPWhLLg5rwd@spud>
References: <20221126061557.3541-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221126061557.3541-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_073219_210246_FC6A35F3 
X-CRM114-Status: GOOD (  15.02  )
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

On Sat, Nov 26, 2022 at 12:15:56AM -0600, Samuel Holland wrote:
> The conditions reference the symbol SBI_V01, which does not exist. The
> correct symbol is RISCV_SBI_V01.

Huh, good spot.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Fixes: e623715f3d67 ("RISC-V: Increase range and default value of NR_CPUS")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  arch/riscv/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index fec54872ab45..acbfe34c6a00 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -319,9 +319,9 @@ config SMP
>  config NR_CPUS
>  	int "Maximum number of CPUs (2-512)"
>  	depends on SMP
> -	range 2 512 if !SBI_V01
> -	range 2 32 if SBI_V01 && 32BIT
> -	range 2 64 if SBI_V01 && 64BIT
> +	range 2 512 if !RISCV_SBI_V01
> +	range 2 32 if RISCV_SBI_V01 && 32BIT
> +	range 2 64 if RISCV_SBI_V01 && 64BIT
>  	default "32" if 32BIT
>  	default "64" if 64BIT
>  
> -- 
> 2.37.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
