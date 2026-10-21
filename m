Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B34606A33F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LGRwDB9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=earth.li header.i=@earth.li header.a=rsa-sha256 header.s=the header.b=U3WKM5qY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vs8R/y4L5AqR4VN/TWM2hgzwfnohMDwIP/kBqcYFqso=; b=4LGRwDB9/y0usl
	/Dv/9jC5p6R/owurwSHXmiI638lNOTNKdq4++wWboaHWHB1/Xt0c7712D7d4aX7z8aFCDnfZ7n5To
	8MBDTSWU8vS4KidLEqZs6lIbM4TVUzBBi/M4wSVTvKmPiIiYmwYhYMIsqfMW09ze7Hs4K0Yi8OTqh
	CZ94yFuCnjhcI/zXzkx6bHxyQe+JZOHlKLvwCXY4JJuXn6MbLJaSK7vxap7Crt8q6lobwVERdloB5
	1nAuL8KHKeIFE6fMbz1eqoGqVyn7UlYALTZGuGT6kS9zXZjHCp21wf1Wbr/wG+72x0tfrEWcnfC/N
	+Ot+l/RaNHSv5mFfKYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRq4-0000000BOS0-0Nzw;
	Wed, 21 Oct 2026 08:38:24 +0000
Received: from the.earth.li ([2a00:1098:86:4d:c0ff:ee:15:900d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRq1-0000000BOQP-26KN
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 08:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AOzqjtOMrdyYNSpa99+/UPGhu5nVwE5WpHEubCFaf5I=; b=U3WKM5qYuUTXR4j3PnsdOXCn8d
	hUOrdeBn8f28fXuqP8owg8bfXv0XP52dwZmKyFCp7/uDoH8ijZigjM4ST7QKm2B8oGxJdV8R28Ojh
	weF4yGa/cnqEZhQ+tw0f05NmOz4DlcXcmYCo3TOlVHY0dkNDWesFksDJo5SHkACyjTo8wZJ3+TF76
	FIEmLKlO0haAZjrmihdwsrjSU24hNEXF8/1DRXRM2UNHYMatnRoIm+pDBmtB9pLmkYd4GIFpMwuNs
	olG5oBlqmNEma0F+AVEP9RWpkBh/8bEDcDeKB6W+AfW5CuALH/tv3LvI/KfmXzKmJK615WqYzsReS
	+VVBXHRA==;
Received: from noodles by the.earth.li with local (Exim 4.98.2)
	(envelope-from <noodles@earth.li>)
	id 1xJRpX-00000000gFP-2wKS;
	Wed, 21 Oct 2026 09:37:51 +0100
Date: Wed, 21 Oct 2026 09:37:51 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	zohar@linux.ibm.com, noodles@fb.com,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v2] kexec: Select ima_get/free_kexec_buffer() with
 CONFIG_HAVE_IMA_KEXEC(_OF)
Message-ID: <ath534EEbFntir8j@earth.li>
References: <20261020083727.1906495-1-roberto.sassu@huaweicloud.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020083727.1906495-1-roberto.sassu@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_013821_611441_00535442 
X-CRM114-Status: GOOD (  31.86  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:37:27AM +0200, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> On x86, if CONFIG_OF_FLATTREE is enabled, the kernel uses the device tree
> implementation of ima_get/free_kexec_buffer(). However, x86 passes the IMA
> buffer location through setup_data, not through the device tree, so the
> buffer is never found and the IMA measurement list is not carried over
> across kexec.
> 
> Introduce CONFIG_HAVE_IMA_KEXEC_OF (which selects CONFIG_HAVE_IMA_KEXEC)
> and select it for the architectures that pass the IMA buffer location
> through the device tree, via of_kexec_alloc_and_setup_fdt() (arm64,
> powerpc and riscv). Build the device tree implementation of
> ima_get/free_kexec_buffer() only if the new option is enabled.
> 
> Select the new option also on LoongArch, to preserve the current behavior
> and avoid a link failure. LoongArch does not pass the buffer location to
> the next kernel yet; this will be addressed separately.
> 
> Finally, don't select it for x86, and use x86's own setup_data-based
> implementation regardless of CONFIG_OF_FLATTREE.
> 
> Fixes: b69a2afd5afc ("x86/kexec: Carry forward IMA measurement log on kexec")
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>

Reviewed-By: Jonathan McDowell <noodles@meta.com>

I think my original intent when adding the ACPI x86 passthrough was to 
ensure I didn't break anything for anyone who'd been trying to use OF 
with x86 and pass it through, but if it wasn't even wired up there then 
that's not a concern.

> ---
> 
> v2:
> - Reworded the commit message (no code changes), suggested by Mimi
> 
>  arch/arm64/Kconfig      | 2 +-
>  arch/loongarch/Kconfig  | 2 +-
>  arch/powerpc/Kconfig    | 2 +-
>  arch/riscv/Kconfig      | 2 +-
>  arch/x86/kernel/setup.c | 2 +-
>  drivers/of/kexec.c      | 4 ++--
>  kernel/Kconfig.kexec    | 4 ++++
>  7 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef944..4b7e248b6c91 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1697,7 +1697,7 @@ config ARCH_SUPPORTS_KEXEC_FILE
>  config ARCH_SELECTS_KEXEC_FILE
>  	def_bool y
>  	depends on KEXEC_FILE
> -	select HAVE_IMA_KEXEC if IMA
> +	select HAVE_IMA_KEXEC_OF if IMA
>  
>  config ARCH_SUPPORTS_KEXEC_SIG
>  	def_bool y
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 2067d1f2ad7a..b5420d482da4 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -690,7 +690,7 @@ config ARCH_SELECTS_KEXEC_FILE
>  	depends on KEXEC_FILE
>  	select KEXEC_ELF
>  	select RELOCATABLE
> -	select HAVE_IMA_KEXEC if IMA
> +	select HAVE_IMA_KEXEC_OF if IMA
>  
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool 64BIT
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2580e27e4328..096c6061893b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -643,7 +643,7 @@ config ARCH_SELECTS_KEXEC_FILE
>  	def_bool y
>  	depends on KEXEC_FILE
>  	select KEXEC_ELF
> -	select HAVE_IMA_KEXEC if IMA
> +	select HAVE_IMA_KEXEC_OF if IMA
>  
>  config PPC64_BIG_ENDIAN_ELF_ABI_V2
>  	# Option is available to BFD, but LLD does not support ELFv1 so this is
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f8e26c4bed2b..161bf8a65beb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1118,7 +1118,7 @@ config ARCH_SUPPORTS_KEXEC_FILE
>  config ARCH_SELECTS_KEXEC_FILE
>  	def_bool y
>  	depends on KEXEC_FILE
> -	select HAVE_IMA_KEXEC if IMA
> +	select HAVE_IMA_KEXEC_OF if IMA
>  	select KEXEC_ELF
>  
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index cda6adb9f69c..bc17e353c099 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -421,7 +421,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
>  #endif
>  }
>  
> -#if defined(CONFIG_HAVE_IMA_KEXEC) && !defined(CONFIG_OF_FLATTREE)
> +#ifdef CONFIG_HAVE_IMA_KEXEC
>  int __init ima_free_kexec_buffer(void)
>  {
>  	if (!ima_kexec_buffer_size)
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> index 029903b986cb..724f29fef0c0 100644
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
> @@ -116,7 +116,7 @@ static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
>  	return 0;
>  }
>  
> -#ifdef CONFIG_HAVE_IMA_KEXEC
> +#ifdef CONFIG_HAVE_IMA_KEXEC_OF
>  /**
>   * ima_get_kexec_buffer - get IMA buffer from the previous kernel
>   * @addr:	On successful return, set to point to the buffer contents.
> @@ -196,7 +196,7 @@ static void remove_ima_buffer(void *fdt, int chosen_node)
>  	size_t size;
>  	const void *prop;
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
> +	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC_OF))
>  		return;
>  
>  	prop = fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len);
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 15632358bcf7..c6ed60f04ea4 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -17,6 +17,10 @@ config KEXEC_ELF
>  config HAVE_IMA_KEXEC
>  	bool
>  
> +config HAVE_IMA_KEXEC_OF
> +	bool
> +	select HAVE_IMA_KEXEC
> +
>  config KEXEC
>  	bool "Enable kexec system call"
>  	depends on ARCH_SUPPORTS_KEXEC
> -- 
> 2.43.0

J.

-- 
... "You are in a twisty little maze of lookup tables, all different." --
    Joe Zeff, The Scary Devil Monastery

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
