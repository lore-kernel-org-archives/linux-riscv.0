Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0FCC10F07
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQsFCMW+Enmc83PH1EXFIgHk5yU4hnR0QFSJIULlBFs=; b=ItVeMrP3Xd2JQk
	anwcxoJfYCa7X296I1KC3ypg+trGzpGObF33eWqBSA6wF4vO7RiBTIp5Ouw79TJKb4VXOA7ED9Mva
	YSqdiiqpwSPEeeBV2qaatO9yo6ccNpSTgm9UJ7iGLxqz/oQc3SgX7trnYlWOPsTCfqT7Uk1fPDI6w
	sWZ80huqmUDkCdK9vm7bblavsDKxBwfABOv06choZePM07IZoQibok1KTZMtRZK/UQHr32ZvYa4XO
	A4EiwKu+dtZjaJNr+JQ/zuhf198L8CJUKjLnL3oIPxZcznffLXur8LmJsRNXpIxMfxTjNwepROO/J
	mHt8gVhMGoDSJ4orqAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCfKR-004qVq-2e;
	Mon, 11 Dec 2023 12:24:07 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCfKA-004qOi-1M;
	Mon, 11 Dec 2023 12:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702297420;
	bh=ODAUXRjain77XOmoPnKy1MNIInbnbbNcYLIa9FPn8ks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nIVA8V0yVj+ZMN8x89h2gJxxT4+cCTauZuj8Ht7cflzgnHnN4ITpBMOV1xWo7AIlq
	 Qb+tJKhKhRta6FIYqIPB6IjCP4IRbYllJ3J3dFQkrZ5gBhylzYOFVQ0olRQRq0XFRq
	 mToIUeHe7mjunplXY3/T3inRVriUXVwwqHAyMT8ZrNdDNjb78fGIZ7jZefsf1Xa8DY
	 kagFMIi8wqGn8H2LFlRDsc9/abaI9Ajeo1k+5RyvhTShHF9xXBTFIlBig9ReYi7rDb
	 14jHwg99Lq6Mb4L4gts5PmojrjCNJA0P9GJfiVGM/34KY923DExlNs08GewB4rxZRl
	 xDIjF0NgfU/GA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Spgrp6jZHz4xGM;
	Mon, 11 Dec 2023 23:23:38 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Samuel Holland <samuel.holland@sifive.com>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
 Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arch@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH 10/12] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <20231208055501.2916202-11-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-11-samuel.holland@sifive.com>
Date: Mon, 11 Dec 2023 23:23:35 +1100
Message-ID: <87h6kpdj20.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_042350_855293_6D10ABE2 
X-CRM114-Status: GOOD (  18.69  )
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

Hi Samuel,

Thanks for trying to clean all this up.

One problem below.

Samuel Holland <samuel.holland@sifive.com> writes:
> Now that all previously-supported architectures select
> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
> of the existing list of architectures. It can also take advantage of the
> common kernel-mode FPU API and method of adjusting CFLAGS.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
...
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 4ae4720535a5..b64f917174ca 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -87,20 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
>  	WARN_ON_ONCE(!in_task());
>  	preempt_disable();
>  	depth = __this_cpu_inc_return(fpu_recursion_depth);
> -
>  	if (depth == 1) {
> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> +		BUG_ON(!kernel_fpu_available());
>  		kernel_fpu_begin();
> -#elif defined(CONFIG_PPC64)
> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> -			enable_kernel_vsx();
> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
> -			enable_kernel_altivec();
 
Note altivec.

> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
> -			enable_kernel_fp();
> -#elif defined(CONFIG_ARM64)
> -		kernel_neon_begin();
> -#endif
>  	}
>  
>  	TRACE_DCN_FPU(true, function_name, line, depth);
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index ea7d60f9a9b4..5aad0f572ba3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -25,40 +25,8 @@
>  # It provides the general basic services required by other DAL
>  # subcomponents.
>  
> -ifdef CONFIG_X86
> -dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
> -dml_ccflags := $(dml_ccflags-y) -msse
> -endif
> -
> -ifdef CONFIG_PPC64
> -dml_ccflags := -mhard-float -maltivec
> -endif

And altivec is enabled in the flags there.

That doesn't match your implementation for powerpc in patch 7, which
only deals with float.

I suspect the AMD driver actually doesn't need altivec enabled, but I
don't know that for sure. It compiles without it, but I don't have a GPU
to actually test. I've added Timothy on Cc who added the support for
powerpc to the driver originally, hopefully he has a test system.

Anyway if that's true that it doesn't need altivec we should probably do
a lead-up patch that drops altivec from the AMD driver explicitly, eg.
as below.

cheers


diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 4ae4720535a5..0de16796466b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -92,11 +92,7 @@ void dc_fpu_begin(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			enable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			enable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			enable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_begin();
@@ -125,11 +121,7 @@ void dc_fpu_end(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			disable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			disable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			disable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_end();
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 6042a5a6a44f..554c39024a40 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -31,7 +31,7 @@ dml_ccflags := $(dml_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float -maltivec
+dml_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index acff3449b8d7..7b51364084b5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -30,7 +30,7 @@ dml2_ccflags := $(dml2_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml2_ccflags := -mhard-float -maltivec
+dml2_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
