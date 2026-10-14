Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31618CC6B2A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 23:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/D1HOCESgDyfLXjsHZuoiypMSzUkXsHdO3hth+vH0s=; b=MaiDZ2PD6MZZdE
	1YcLrVefsfqmwQfoQh4cuA88aligSr5ucNoSdOZ//JTE5+4QqdmRQvuW/TU8vdgdKPkcVjaUtYnlJ
	+Nz/MBHTgqTJm421w4aYT3TQ5bTOCguhWrhoA2WfUGA/38vyJym1iR5uU4PxXr/YsiA1JvnmGWcmX
	JGbqvU/ShSMIQB1g5iWH/5MNLYeT76FewxEGiv78JFr6cs1wYYDZDrqy9gPmkS03NeQM9mO+JwjoJ
	4wA/QkXk0Kjs96vNoVxmOLbTP84NWUOxQM0qyByAPmg2QyadZyTru7z0hDaMrq2/l0yjE1yHVL+T5
	LDT/bbkcJk/dNraUiWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8hd-0000000GTP7-21VU;
	Wed, 14 Oct 2026 23:48:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8hb-0000000GTOK-2IvU
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 23:48:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A87656020C;
	Wed, 14 Oct 2026 23:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88571F000C4;
	Wed, 14 Oct 2026 23:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792021686;
	bh=gCyvDUwHt5+cJZfjR8z7IVTBfcPA96zhImRbO5hQhvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8c1hXPuc6oJ37/sT7AEwfa+lnclKmoJcWqIq6sjkeqmbCTYVZC/akKJUNSi0jmI4
	 ux+A/19Y1zKf5YsTINeEhTOIlRbH1ELYhpbYg9OJ4ju4VwACF6Z5y6klVm/ZEEy6Oq
	 31PH+GVMXwqZtxlhYWoY8qPcHGamkx4ULIfFBaibCIniy6kDH6yfXSBpeEk3bpAPU+
	 P3fo5Zfgqo8P80tohMLWwPhtuK5UherJjCGGDoK5SvqbjGrUn/P5giP0tP3HipRtoW
	 1MzCk4T73Ar1JhQwMFpFrxzHI/Qcqk4BCHbvNzhUVzXCPOmmfZunxzRhjIiIEKTr7u
	 J0S66hp/GLocg==
Date: Thu, 15 Oct 2026 07:28:00 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
Message-ID: <atAQAI0WWtwh8kvf@xhacker>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
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

On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> These options are irreleant for nommu systems.
> 
> Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/riscv/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 15f6e67c60410a87..15beeb4690aebcc4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
>  
>  config RISCV_ISA_SV48
>  	bool "Page-Based 48-bit Virtual-Memory System"
> -	depends on 64BIT
> +	depends on 64BIT && MMU
>  	default y
>  	help
>  	  Add support for the Page-Based 48-bit Virtual-Memory System.
> @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
>  
>  config RISCV_ISA_SV57
>  	bool "Page-Based 57-bit Virtual-Memory System"
> -	depends on 64BIT
> +	depends on 64BIT && MMU

hmm, I think we also need to make RISCV_ISA_SV57 depend on
RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
!RISCV_ISA_SV48. Human won't make this wrong combination, but
the random config can.

with that change,
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

>  	default y
>  	help
>  	  Add support for the Page-Based 57-bit Virtual-Memory System.
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
