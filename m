Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EBFC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5r0F/AJe4sgovRHA2gjubXVga5eqNOksS/iSzx3xko=; b=gDj9OyrLHxL2SwdVIAkmo3cdE/
	ba7KZE7+Y2XUZctze6WodgO/1IPTPXV8iN+h+a6vEJcW31p/tQrWa09azbQXf0wvXoubGcCusxc+7
	0LF1396REhf3UjePWWo9I9TAyb8lj/DhoRuXN30YVage/ToXfjREpHxe2iS/xiJ9d4sg4JEUD9yhQ
	Nd4jHbPc8LwprJFkIxfhhZOfJgkNYIZPY01G+9gUgMGjbVNfAHhdf2KbiOh03V6bH3O+qEv2OnhZG
	91PMk5FB6Y5uKGD6OPiiWPv++pH16k0wIqfHt59PUzwe5d2Y06KKa5hLfmvqt7jhidgHWpM6RLJPb
	Tz4i/0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKRX-0000000A7H6-39fW;
	Fri, 25 Jul 2025 15:34:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJKu-0000000A0MN-2F1V
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Jul 2025 14:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gskfuFSjcZ1f9NqzVyfbU+2SXj6gH6Vy4UjfTOJinxk=; b=DW5cUYvHBdmAim6Ch30JZZEY4W
	0E0UUO+GXmcEecHXH6qt/Rks6sypYfCFnMVbfkHu9VFad0UI55UYOvumQmoiDqj+ZNFJc7XgJdxNG
	5gcYePe7FcARSo5wEB/c7sGuPKlveF2kNsjUDTJ2MyUH0eRU1Y0etsahD5mQqJD/7Fh3ME5e40paN
	/5Szsfju3W4SdlVZJGUKS1cXi7KhdLG+kfXO1PW1rPb5/vXglf4Qumi/YX8skGq/5r9DBB1PLc/ZY
	tNK4hUn66STjd96EzJcGhC0ieEZ5mYrX/4CPOlF2VJ8/2Q+ULMfoVk6E5hBAkex3CJNBePdBe4JCx
	5v6euVYw==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJKq-0000000Bq8p-4Ah0
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:23:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23694cec0feso20968145ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753453423; x=1754058223; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gskfuFSjcZ1f9NqzVyfbU+2SXj6gH6Vy4UjfTOJinxk=;
        b=k0vDZxM77LXzl8gcAxpBk9zDqoPMODKBvQTTZmonYCb5k+9wxz7rGDaCGODnG9brBK
         NgwWlT5MUkPpIDDfrsO/UtbVc1HJfNZeHbqJzu48vBrkswRhZjkq+4zbqn4VmCUOyf4c
         cpmUju56EUyZRueM2LgbovcsY8kK+smDah8E0UaOH6ZUTR/xOs52v+T5hoUm5yXmq0sg
         BXsPajbuH5SWIMCmqhclxJnmEa4VH4Q0IEWeWmpdYxHtZ3X/hOzp0Y0q8v2Qmxhsh7Js
         1LJ6YEVO5zWe8gHOLxbWSBcBLKs/2/HnVjXHqyIdVm1DmgM5w1hE6hx3Sn+J13SvfyVt
         N9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753453423; x=1754058223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gskfuFSjcZ1f9NqzVyfbU+2SXj6gH6Vy4UjfTOJinxk=;
        b=jfqY6xSUgmGykpZR4W8jI5fn9zNw5LNpmS8ekYXHY661qp2nAtbTMNYWKJFkWst+L3
         NU3Y0Xc5fDVPJuoNsmzlDsRmC+z+erhv60d0n9VcGAKOCC3+61H8Y95XrCx91RSfw98j
         Ck6l2pwGFyRoJvCSI2Q81RPKzPziu0Y8uBRCA5sMxv2Rd8AecGiG+wSLBPJZOKzpcJUb
         82uAkSgKgNTtibppzhXjSsAlht9Fa4uDKTFNtQU0SLBiXpK3pBS0QH5UWoOTBRczIhsu
         6PVuQKWvAznPd24EdANGHHYvXDB7orq06FMf4xmFOdh2NcBYZxVnTfNieN1xcPOwwjgE
         r83w==
X-Gm-Message-State: AOJu0Yz0UN+RtIrptU4bDdODIVQ16crhScCEKE1qujgk6K5jJyDTIno+
	nGmIaMY6pWIP8i8GCumkUPV2aB3WIdfUM5UL/1IU0F9UP5/Bh75ohwkghjXXqAgh7ao=
X-Gm-Gg: ASbGnctZTzhgGNIM+Vp3kW1Xt6FEXMeI7GAV73L1Uxdw0EhmevWrVDYWUlabIszTExy
	/oiUN4VioJC23shENsSNP5K3GAhPZq3yn0h7MAevNRZcI1JRTPQFmx6cd64addvyOZfrQ13rwnu
	giI9ZsoEmaxwUHL9KICGEnyJS0u8h+vZuB6IdPsQi6cKjLiRbkzx5yod28b0yVstxGNKYeLthRQ
	Y4aRhmo4iBsqCMqmjrRAZ9lxYdq2r9nPygN+pggE8YfN8kbPO0FrzLH69PbxBLqRq4CEx7ZX/0P
	BBqEVJ8cZhZrmUu3KfPFg0i/Oeq00u77ZCLys7s99D4T7o/czK1nCKbWQ2Kye6rvanR9kzxrFnJ
	TITW/23MT9svogEhUK0+2sDsRuoh9bCsu
X-Google-Smtp-Source: AGHT+IHRz5CbRE8i2UjdGDZpkxqOW3JD/QQJLFQFs49c4cRaClHO120ReCkQeIjI0YUgC/xMTK32oQ==
X-Received: by 2002:a17:902:f252:b0:234:ed31:fc94 with SMTP id d9443c01a7336-23fb30bb5edmr15941955ad.26.1753453422841;
        Fri, 25 Jul 2025 07:23:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fb3f2a5a8sm13203045ad.94.2025.07.25.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:23:42 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:23:38 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, andrew@sifive.com, ved@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH 11/11] riscv: Kconfig & Makefile for riscv kernel control
 flow integrity
Message-ID: <aIOTauktSYmw2LUV@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-11-04b8fa44c98c@rivosinc.com>
 <b50da4ef-53ca-4edf-bd74-f5e037a14f99@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b50da4ef-53ca-4edf-bd74-f5e037a14f99@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_152345_452930_725337E8 
X-CRM114-Status: GOOD (  18.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 25, 2025 at 01:26:44PM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:37, Deepak Gupta wrote:
>>Defines `CONFIG_RISCV_KERNEL_CFI` and selects SHADOW_CALL_STACK
>>and ARCH_HAS_KERNEL_SHADOW_STACK both so that zicfiss can be wired up.
>>
>>Makefile checks if CONFIG_RISCV_KERNEL_CFI is enabled, then light
>>up zicfiss and zicfilp compiler flags. CONFIG_RISCV_KERNEL_CFI is
>>dependent on CONFIG_RISCV_USER_CFI. There is no reason for user to
>>not select support for user cfi while enabling for kernel.
>>
>>compat vdso don't need fcf-protection (toolchain lacks support).
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/Kconfig                     | 37 +++++++++++++++++++++++++++++++++-
>>  arch/riscv/Makefile                    |  8 ++++++++
>>  arch/riscv/kernel/compat_vdso/Makefile |  2 +-
>>  arch/riscv/kernel/vdso/Makefile        |  2 +-
>>  4 files changed, 46 insertions(+), 3 deletions(-)
>>
>>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>index 385c3d93e378..305ba5787f74 100644
>>--- a/arch/riscv/Kconfig
>>+++ b/arch/riscv/Kconfig
>>@@ -245,7 +245,7 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
>>  	depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C
>>  config HAVE_SHADOW_CALL_STACK
>>-	def_bool $(cc-option,-fsanitize=shadow-call-stack)
>>+	def_bool $(cc-option,-fsanitize=shadow-call-stack) || $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
>>  	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
>>  	depends on $(ld-option,--no-relax-gp)
>>@@ -864,6 +864,16 @@ config RISCV_ISA_ZICBOP
>>  	  If you don't know what to do here, say Y.
>>+config TOOLCHAIN_HAS_ZICFILP
>>+	bool
>>+	default y
>>+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp)
>>+
>>+config TOOLCHAIN_HAS_ZICFISS
>>+	bool
>>+	default y
>>+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
>>+
>>  config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>>  	def_bool y
>>  	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
>>@@ -1182,6 +1192,31 @@ config RISCV_USER_CFI
>>  	  space does not get protection "for free".
>>  	  default n.
>>+config RISCV_KERNEL_CFI
>>+	def_bool n
>>+	bool "hw assisted riscv kernel control flow integrity (kcfi)"
>>+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
>>+	depends on RISCV_USER_CFI
>>+	select ARCH_SUPPORTS_SHADOW_CALL_STACK
>>+	select SHADOW_CALL_STACK
>>+	select ARCH_HAS_KERNEL_SHADOW_STACK
>>+	help
>>+	  Provides CPU assisted control flow integrity to for riscv kernel.
>>+	  Control flow integrity is provided by implementing shadow stack for
>>+	  backward edge and indirect branch tracking for forward edge. Shadow
>>+	  stack protection is a hardware feature that detects function return
>>+	  address corruption. This helps mitigate ROP attacks. RISCV_KERNEL_CFI
>>+	  selects CONFIG_SHADOW_CALL_STACK which uses software based shadow
>>+	  stack but is unprotected against stray writes. Selecting RISCV_KERNEL_CFI
>>+	  will select CONFIG_DYNAMIC_SCS and will enable hardware assisted shadow
>>+	  stack protection against stray writes.
>
>Please, consider adding a blank line for better readability.

Noted. Will do.

>
>>+	  Indirect branch tracking enforces that all indirect branches must land
>>+	  on a landing pad instruction else CPU will fault. This enables forward
>>+	  control flow (call/jmp) protection in kernel and restricts all indirect
>>+	  call or jump in kernel to a landing pad instruction which mostly likely
>>+	  will be start of the function.
>>+	  default n
>
>For Linux distributions it is important that the same kernel can run 
>both on hardware both with and without CFI support. The description 
>provided does not help to understand if RISCV_KERNEL_CFI=y will result 
>in such a kernel. Please, enumerate the minimum set of extensions 
>needed for supporting a kernel built with RISCV_KERNEL_CFI=y. I guess 
>this will at least include Zimop.

Yes, it is expected anyone selecting this config is going to take this kernel to
a RVA23 hardware. RVA23 mandates zimop and thus shouldn't be an issue on such a
hardware. Anyone selecting this config and trying to run this kernel on hardware
prior to RVA23 will run into issues. I can add a comment here to highlight that.

I assume you wanted that awareness and goal is not maintain compat of same
kernel between RVA20 and RVA23 hardware, right?

>
>Best regards
>
>Heinrich
>
>>+
>>  endmenu # "Kernel features"
>>  menu "Boot options"
>>diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>>index 7128df832b28..6ef30a3d2bc4 100644
>>--- a/arch/riscv/Makefile
>>+++ b/arch/riscv/Makefile
>>@@ -61,8 +61,10 @@ else ifeq ($(CONFIG_LTO_CLANG),y)
>>  endif
>>  ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
>>+ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>  	KBUILD_LDFLAGS += --no-relax-gp
>>  endif
>>+endif
>>  # ISA string setting
>>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>>@@ -91,6 +93,12 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
>>  KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>>  export KBUILD_BASE_ISA
>>+ifeq ($(CONFIG_RISCV_KERNEL_CFI),y)
>>+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFILP) := $(riscv-march-y)_zicfilp
>>+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFISS) := $(riscv-march-y)_zicfiss
>>+KBUILD_CFLAGS += -fcf-protection=full
>>+KBUILD_AFLAGS += -fcf-protection=full
>>+endif
>>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>>  # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>>  KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
>>diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
>>index 24e37d1ef7ec..552131bc34d7 100644
>>--- a/arch/riscv/kernel/compat_vdso/Makefile
>>+++ b/arch/riscv/kernel/compat_vdso/Makefile
>>@@ -69,4 +69,4 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
>>  # actual build commands
>>  quiet_cmd_compat_vdsoas = VDSOAS  $@
>>-      cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<
>>+      cmd_compat_vdsoas = $(COMPAT_CC) $(filter-out -fcf-protection=full, $(a_flags)) $(COMPAT_CC_FLAGS) -c -o $@ $<
>>diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>>index 2b528d82fa7d..7b1446b63ebc 100644
>>--- a/arch/riscv/kernel/vdso/Makefile
>>+++ b/arch/riscv/kernel/vdso/Makefile
>>@@ -17,7 +17,7 @@ ifdef CONFIG_VDSO_GETRANDOM
>>  vdso-syms += getrandom
>>  endif
>>-ifdef CONFIG_RISCV_USER_CFI
>>+ifneq ($(CONFIG_RISCV_USER_CFI), $(CONFIG_RISCV_KERNEL_CFI))
>>  CFI_MARCH = _zicfilp_zicfiss
>>  CFI_FULL = -fcf-protection=full
>>  endif
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
