Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D20DC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Tk0xcvVu+64JBMLkShjrwrWONLvCYeoHD0iFPmgHG0=; b=yZ2hfKICFoGmlb
	leJkzK+vOvbtTkqgOrs4R1uR0F2d8F6PHmWgDbmQZjXr3dUyz4YI97qrzuup3ZceMVXk2yXE/Cfpr
	IpI3iZetB/UP1gP3PkG8PHreye3LWQlhuZ6EexT8mBwWhG0ETBU3or/9H0HtenKAJZi1HFqMQbFz+
	HCxzmP3sfyKFm/2lQiO0b9bxaTa+euu1jRNsqR9pIM6SvyAiaWbFYuHY9s9BwibIkt8mnI8Ovu3Fg
	OAYA6JLplrpcbLipURxIRy2hIIEWT47DUYakra5VdsgINuvvK+W2SiS8gj9Sei0n9qImRYGEw/Dr+
	MgZH03BWF758Nxj0K4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTojF-000000087pf-2LnZ;
	Sat, 27 Jan 2024 19:52:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTojC-000000087pK-0hbm
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 19:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F13B761025;
	Sat, 27 Jan 2024 19:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5234DC433C7;
	Sat, 27 Jan 2024 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706385122;
	bh=nNNOg9OGw4VfRgQPR3+oq9lPYHSxhSiGjos34RuwKwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhQ7Z/WpfC6u+Gt7BEU5AzxNheIqn1BiZynbNIvhZE2FqnHPvbc9p0C0TY0Kt6trZ
	 uuATYufIzZBJipqarY5MYAgq/cwRUWrbhoqlBKr5ZPGk29orVU74ch4vQPO0j6Spmj
	 0/EMdTrcqzUM7GvLCFm9aJsC8bsE6qd1klm2rVNQ9zxhbW7V9xFwMflAXU7DspfmBY
	 9gnD2qDIjkwBKrPNlLNDPFnAENURqVvIY71wyRCnkGbNJvcZIXmHhMdkmndmIPenuI
	 HjyT+v+N9yioOd4aSR0VPfJ8wtNRmBb833PMPp0eXhsO9PD9lBdD2Cf968NQJ8p6a9
	 6dgxtErdKbqyA==
Date: Sat, 27 Jan 2024 12:52:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
	llvm@lists.linux.dev, Brandon Wu <brandon.wu@sifive.com>
Subject: Re: [PATCH] RISC-V: fix check for zvkb with tip-of-tree clang
Message-ID: <20240127195200.GA781164@dev-arch.thelio-3990X>
References: <20240127090055.124336-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240127090055.124336-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_115234_277434_10F4BB3A 
X-CRM114-Status: GOOD (  17.24  )
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

On Sat, Jan 27, 2024 at 01:00:54AM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> LLVM commit 8e01042da9d3 ("[RISCV] Add missing dependency check for Zvkb
> (#79467)") broke the check used by the TOOLCHAIN_HAS_VECTOR_CRYPTO
> kconfig symbol because it made zvkb start depending on v or zve*.  Fix
> this by specifying both v and zvkb when checking for support for zvkb.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I also verified this does not regress GCC.

> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b49016bb5077b..912fff31492b9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -581,21 +581,21 @@ config TOOLCHAIN_HAS_ZBB
>  	default y
>  	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
>  	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
>  	depends on AS_HAS_OPTION_ARCH
>  
>  # This symbol indicates that the toolchain supports all v1.0 vector crypto
>  # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
>  # binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
>  config TOOLCHAIN_HAS_VECTOR_CRYPTO
> -	def_bool $(as-instr, .option arch$(comma) +zvkb)
> +	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>  	depends on AS_HAS_OPTION_ARCH
>  
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
>  	depends on TOOLCHAIN_HAS_ZBB
>  	depends on MMU
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Adds support to dynamically detect the presence of the ZBB
> 
> base-commit: cb4ede926134a65bc3bf90ed58dace8451d7e759
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
