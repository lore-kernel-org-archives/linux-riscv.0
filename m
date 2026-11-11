Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC78606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ygX6Wowv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFcBSnlX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W4nD3EPiOlg3/o57qVcmXMlViM/ciZxZ2InGZbY+1l0=; b=ygX6WowvAH2/4j4tDW/DYxMTQ/
	9BljgSFDNTPQkvawo4d8fdHEpeDPP3QldWIiMjDZ6Rhlq30MKpIcNSlqXzB2KhfnUeIyY9MODI3Cp
	BErOkxNM38eqYmuuh1fgldcrUqqE1bSitDZrwFm+uSoxPQCmWRhlB1EG4J4Vtr38KXLppA/WQYZdO
	trEZ17U6xKhP0t8nOH6g10dVFj+q0/+IodU0lD+xETBmG0sRdwIsgNhx4+3xYTo92p2gZzTlNhxmT
	CBjnfuFMKEDsudNb0Hr3yjd2+KfbEmUV+ktz/OpFpBWn1V7me3UlZQ8VJCgNAqWYjVBwsE9eQbU60
	BCRcV3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAKv-000000075uK-0R7C;
	Wed, 11 Nov 2026 15:34:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAKu-000000075u8-11Mf
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 15:34:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 676C56303A;
	Wed, 11 Nov 2026 15:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB91F00A05;
	Wed, 11 Nov 2026 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794411247;
	bh=9JlNjHirCVWH99wFwQH2LJGXZe/SnOsVPEb5Vf7MsSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fFcBSnlXYX/jbfgbOjSy9lvwBVycfb+t/SDn+CgujFi6jt3tMpWdDfw5sgx15UUFl
	 u0FASPIdqlGwtdkRulmIzDYBjz3quHjv9/VkHcgUfIV9W1JRKhN1PuBzKPD//+shlf
	 gOGMDB0HFxDyGi30RW3j2yBIPNcF7Vfqk8OIS0NIEyVDjgQUE9MUqjBdUMDpMRyF5N
	 RHE4Udii2LwV72hD0yRwLgkXBMKqUIVq7dv951W5gl/lRxe+zJg/f1lDcf4fLy4rYq
	 lu28cY7bm86Mu1iYMsvdmNcKYQAO2AX1jLjOwHu8IpvOBOYmgUc1qdI665JO8kVVH4
	 fz+c2paIzvCDw==
Date: Wed, 11 Nov 2026 23:13:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, andybnac@gmail.com,
	dfustini@oss.tenstorrent.com, greentime.hu@sifive.com
Subject: Re: [PATCH v1] riscv: kconfig: enable -mtune built kernel
Message-ID: <avSGMnFGCw-oKdsP@xhacker>
References: <20261110200800.1073859-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110200800.1073859-1-tchiu@tenstorrent.com>
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

On Tue, Nov 10, 2026 at 02:07:59PM -0600, Andy Chiu wrote:
> On a machine that supports native unaligned access, enabling unaligned
> access code-gen can result in a significant speedup on certain workloads.
> As the adoption of application-level core increases, it has become
> essential to build a kernel utilizing what's available on the platform.
> 
> Here are the examples of throughput improvement when the build is
> configured to utilize misaligned access code-gen:
> 
> LZ4 compress: +90.6% (Ascalon-X), +35.1% (K3-X100)
> LZ4 decompress: +9.8% (Ascalon-X), +76.6% (K3-X100)
> ZSTD compress: +35.4% (Ascaloon-X), +19.4% (K3-X100)
> ZSTD decompress: +26.0% (Ascalon-X), +7.5% (K3-X100)
> 
> btrfs create: +7.4% (Ascalon-X), +4.5% (K3-X100)
> btrfs unlink: +7.2% (Ascalon-X), +2.6% (K3-X100)

how much improvement is from unaliagned access, and how much is from
-mtune. So these numbers don't explain why -mtune is neceesary.
> 
> To enable such code-gen, the build system not only has to remove
> -mstrict-align restriction, but also needs to set the proper -mtune cost
> model to emit such accesses. -mstrict-align is gated by NONPORTABLE and
> RISCV_EFFICIENT_UNALIGNED_ACCESS, and -mtune=generic-ooo enables the


Following the same reason as arm64, I don't think we should introduce
per-cpu -mtune options into arch/riscv/Kconfig.

IIRC, arm64 intentionally avoided adding -mtune options to Kconfig to
prevent endless per-vendor or even per-cpu option bloat, toolchain
flag churn, and fragmention away from a sigle Image.

From another side, when someone needs a custom -mtune for a fixed
target, they can pass the already well supported KCFLAGS="-mtune ..."
at build time without needing dedicated Kconfig symbols for every
core.

Furthermore, having an -mtune option silently select NONPORTABLE and
RISCV_EFFICIENT_UNALIGNED_ACCESS breaks user expectations. NONPORTABLE
breaks cross platform compatibility, while -mtune is just a compiler
scheduling hint

thanks

> code-gen to emit misaligned accesses.
> 
> Add an entry in Kconfig so it allows the build system to select different
> mtune options. Also, select NONPORTABLE and
> RISCV_EFFICIENT_UNALIGNED_ACCESS when building with "generic-ooo", and
> "tt-ascalon-d8".
> 
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
> ---
>  arch/riscv/Kconfig  | 62 +++++++++++++++++++++++++++++++++++++++++++++
>  arch/riscv/Makefile | 14 ++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e7891a2a89da..d53225fead4a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -980,8 +980,67 @@ config RISCV_SBI_FWFT_DELEGATE_MISALIGNED
>  
>  	  If you don't know what to do here, say N.
>  
> +config TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
> +	def_bool $(cc-option,-mtune=tt-ascalon-d8)
> +
> +choice
> +	prompt "CPU tuning (-mtune)"
> +	default RISCV_MTUNE_TOOLCHAIN_DEFAULT
> +	help
> +	  Select the microarchitecture the compiler should tune the kernel
> +	  for. This only affects instruction scheduling and cost models, not
> +	  the ISA, but some choices also assume fast unaligned accesses and
> +	  therefore result in a non-portable kernel.
> +
> +config RISCV_MTUNE_TOOLCHAIN_DEFAULT
> +	bool "Toolchain default"
> +	help
> +	  Do not pass -mtune; use whatever the toolchain was configured with.
> +
> +config RISCV_MTUNE_GENERIC_OOO
> +	bool "generic-ooo"
> +	depends on $(cc-option,-mtune=generic-ooo)
> +	select NONPORTABLE
> +	select RISCV_MTUNE_FAST_UNALIGNED
> +	help
> +	  Tune for a generic out-of-order core (-mtune=generic-ooo). This
> +	  also assumes fast unaligned scalar accesses.
> +
> +config RISCV_MTUNE_TT_ASCALON
> +	bool "Tenstorrent Ascalon"
> +	depends on TOOLCHAIN_HAS_MTUNE_TT_ASCALON_D8
> +	select NONPORTABLE
> +	select RISCV_MTUNE_FAST_UNALIGNED
> +	help
> +	  Tune for the Tenstorrent Ascalon core (-mtune=tt-ascalon-d8). This
> +	  also assumes fast unaligned scalar accesses.
> +
> +config RISCV_MTUNE_CUSTOM
> +	bool "Custom"
> +	help
> +	  Pass -mtune=<RISCV_MTUNE> to the compiler.
> +
> +endchoice
> +
> +config RISCV_MTUNE
> +	string "Custom -mtune value" if RISCV_MTUNE_CUSTOM
> +	default "generic-ooo" if RISCV_MTUNE_GENERIC_OOO
> +	default "tt-ascalon-d8" if RISCV_MTUNE_TT_ASCALON
> +	default ""
> +	help
> +	  The value passed to -mtune=, e.g. "sifive-7-series". Only
> +	  editable when the "Custom" CPU tuning is selected, in which case
> +	  it must not be empty or the build will fail.
> +
> +config RISCV_MTUNE_FAST_UNALIGNED
> +	bool
> +	help
> +	  Selected by -mtune choices that imply fast unaligned scalar
> +	  accesses. Forces RISCV_EFFICIENT_UNALIGNED_ACCESS.
> +
>  choice
>  	prompt "Unaligned Accesses Support"
> +	default RISCV_EFFICIENT_UNALIGNED_ACCESS if RISCV_MTUNE_FAST_UNALIGNED
>  	default RISCV_PROBE_UNALIGNED_ACCESS
>  	help
>  	  This determines the level of support for unaligned accesses. This
> @@ -991,6 +1050,7 @@ choice
>  
>  config RISCV_PROBE_UNALIGNED_ACCESS
>  	bool "Probe for hardware unaligned access support"
> +	depends on !RISCV_MTUNE_FAST_UNALIGNED
>  	select RISCV_SCALAR_MISALIGNED
>  	help
>  	  During boot, the kernel will run a series of tests to determine the
> @@ -1002,6 +1062,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
>  
>  config RISCV_EMULATED_UNALIGNED_ACCESS
>  	bool "Emulate unaligned access where system support is missing"
> +	depends on !RISCV_MTUNE_FAST_UNALIGNED
>  	select RISCV_SCALAR_MISALIGNED
>  	help
>  	  If unaligned memory accesses trap into the kernel as they are not
> @@ -1012,6 +1073,7 @@ config RISCV_EMULATED_UNALIGNED_ACCESS
>  config RISCV_SLOW_UNALIGNED_ACCESS
>  	bool "Assume the system supports slow unaligned memory accesses"
>  	depends on NONPORTABLE
> +	depends on !RISCV_MTUNE_FAST_UNALIGNED
>  	help
>  	  Assume that the system supports slow unaligned memory accesses. The
>  	  kernel and userspace programs may not be able to run at all on systems
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 44f5a439741a..08f1a32228ef 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -89,6 +89,11 @@ CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
>  
>  KBUILD_CFLAGS += -mno-save-restore
>  
> +riscv-mtune := $(CONFIG_RISCV_MTUNE:"%"=%)
> +ifneq ($(riscv-mtune),)
> +KBUILD_CFLAGS += -mtune=$(riscv-mtune)
> +endif
> +
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>  	KBUILD_CFLAGS += -mcmodel=medlow
>  endif
> @@ -149,6 +154,15 @@ KBUILD_IMAGE				:= $(boot)/$(boot-image-y)
>  libs-y += arch/riscv/lib/
>  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>  
> +archprepare: checkmtune
> +PHONY += checkmtune
> +checkmtune:
> +ifeq ($(CONFIG_RISCV_MTUNE_CUSTOM)$(riscv-mtune),y)
> +	@echo '*** CONFIG_RISCV_MTUNE_CUSTOM is set but CONFIG_RISCV_MTUNE is empty.' >&2
> +	@echo '*** Set the custom -mtune value or pick another CPU tuning.' >&2
> +	@false
> +endif
> +
>  ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)
>  prepare: vdso_prepare
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
