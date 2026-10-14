Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1366CCC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 04:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a35tVRVi5giM+67RMIyXKriYkL7UQfG3Q4DKaQskPPo=; b=QpVOdKfVv9Zg+l
	Nv59AteYpF4+iG1rnA5Ncvz01+skr5RS2f6CE2DnavgH2Jf+OXS7NxIUKRCHXUGIHVaynGAF9ZA3i
	vU3Bysxke75CFLM4OQpfFW6e52n02/kQFgDjjFmvqgXOeGXxufDgAu9kYqgMxMlusrr2KjJ0mzNWP
	15Qx0pw97Ry9M14Texm/qZ3Qgnoz9WsvNQ1bhddqqAUVzt0wHY5+Jm0kSP68SK+UTRqeIZEidsrZn
	YtpTBgRnWNs8+OR4tMto8R3YKw820viGUBXxJsffcZ1qXfmESgDaVUG9HQVVcSiMC44wZ81mD8e8/
	NEg2Mw0G97x/dPHxpeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqgf-0000000EVSP-3Vt9;
	Wed, 14 Oct 2026 04:33:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqgc-0000000EVS2-2IsX;
	Wed, 14 Oct 2026 04:33:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B509960213;
	Wed, 14 Oct 2026 04:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5541F000FF;
	Wed, 14 Oct 2026 04:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791952433;
	bh=jgrKJENA6Fuo/kBiIZwLHpnxCBpu7F/vcADbosM2nII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bXZ1cR0ReD4VORVk4VdqfFYNw0NqiNoCQxEWXenGRsIR1SJYoUL0iLjQbmilRgtuv
	 KmyEY3Ubi4MKwXDMWA1K2bLUWf5P6jJxcGlz45GJRoRIfbF4ggFCtjyKr3uKtEGLY2
	 iU7WQeT+1QddV0alJIgB+wuyZO2Zu+E0hQYPvcIbGQSfAdRGuXF5sWcA3I81tVSsDp
	 /X7sba4zBQ29cFX+5++4g1nI6Ep98jOi+9Tvp+gv/M0phur0hNIRGqO7kVKAiGBtma
	 RAxZuU4+hVN3DDsMn5ko0pjOpw8XZNhB7v3WdFAVzAZYQoWAFQK9g1PdktCxx21LnN
	 kxzyLfTIXSN4Q==
Date: Wed, 14 Oct 2026 12:13:49 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE
 references
Message-ID: <as8BfaTCxKh72_iC@xhacker>
References: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
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

On Tue, Oct 13, 2026 at 10:38:39AM +0200, Geert Uytterhoeven wrote:
> As riscv always selects RISCV_ALTERNATIVE, the option was removed.
> However, a few references were left, making it impossible to enable
> RZ/Five support (ARCH_R9A07G043).
> 
> Fix this by removing all remaining references.
> 
> Fixes: b924210f542e13c7 ("riscv: remove RISCV_ALTERNATIVE Kconfig option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> To be applied to riscv/for-next, or folded into the original commit.
> ---
>  drivers/perf/Kconfig        | 2 +-
>  drivers/soc/renesas/Kconfig | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 245e7bb763b9947a..8cef4bdef76aecab 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
>  
>  config ANDES_CUSTOM_PMU
>  	bool "Andes custom PMU support"
> -	depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +	depends on ARCH_RENESAS && RISCV_PMU_SBI
>  	default y
>  	help
>  	  The Andes cores implement the PMU overflow extension very
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index a63df28df3b5e7c7..0b6876ef6dca228b 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -461,7 +461,6 @@ config ARCH_R9A07G043
>  	bool "RISC-V Platform support for R9A07G043F (RZ/Five)"
>  	depends on NONPORTABLE
>  	depends on !DMA_DIRECT_REMAP
> -	depends on RISCV_ALTERNATIVE
>  	depends on !RISCV_ISA_ZICBOM
>  	depends on RISCV_SBI
>  	select ARCH_RZG2L
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
