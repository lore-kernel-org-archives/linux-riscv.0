Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7D4C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VToAfIagmcKDO1rNHAkjTFirYD4X79cDM85nYCq6jM=; b=QkchvdPj2Fsfad
	E5LNStNqGHcwQEl/CnAdDhKtbiaxDZwaN90iwpmGk226YM9M0UvtUZLEdiw08/njdPdJPqrJA1uND
	OQ/BDUt1gtblxW8wDhe65ZYm//l+kHi2xQbfUTKfsWxDojM3g2nnlNBr9bzAL0b4ckAIUI9SSNi0P
	eqLO6vfuGbcOcxtSNHBqoNR828QQC9zvvTZ+kWoKcwwDz6qJ0EBfxPnohtY+57xerYYdJkaECaR3I
	hWz1XFRcXgNhj9svD1gL3Yu7+1GCD7uebWlf6uLgSo5tfb7BoQKFRubp8TSR2zVzZ54/TYMXY1Sku
	f0IOfKIqw0XJd06E8Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5fA-00000008iFi-22b2;
	Thu, 24 Jul 2025 23:47:48 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5VD-00000008h6a-2PIh
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:32 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b39011e5f8eso1474563a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400251; x=1754005051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peHOF2kFTCg4ZjEHfH+NsYT+T4LY9ghqoCHBPY5quO0=;
        b=J8u5zLAC8nd2s9N06GObhkQJrUsdnMT4sqdM4JFV+hQHki70i79uHJ41ZNZN3aBGFh
         y75TmnMiVsC2fP0iiN7nUWWITAMwu0JGjtSXZ4HX0h+wuJaR84ho7206BenayJn1HamE
         G81Luu7JHSILB++9UGaX9zWK+PIWzaHeDFGLEVCsvr5ZEskbXoIvDEj3LTICCSV2JrF1
         FoPGOLnVdU9bmpXgubkzub8aI0qdjz3zmXHaQhZOS8eKtYJWGMQB0fuvXxSTVksttH3z
         BHAlD0mnaQ5DT2w/3ilsvi/txKKkUsi+qY9KL9++cBXrT9QHes4q4BIO8qBG6VbPePZd
         wm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400251; x=1754005051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peHOF2kFTCg4ZjEHfH+NsYT+T4LY9ghqoCHBPY5quO0=;
        b=wZysXaoRVrw2mB/Rdxj8Cgohfen17RSz+srH2RhciAQITIgKHSfcvAqDh4bGBqkFdt
         KR2EuO9YSdcwcztdqRfT9lvFa9B8TgIc0dbkuI7/N96+9G4bZS7r00lWF0JY9/ZGamQL
         cy9SsetOWZB8MT+POFbONNp5xWiiYCv4Sil6OnyWcIOtIq2enNRSKBH3UYktyWNRyCdZ
         wgq1DwYjGnnu0HBclQTdAshpi2AVJUltLgtqADd6mRakm+bKdKJO4vpp6Mja3WgLpoIT
         lAoXPvT6NydSVfmzQ34NFnHCM8xLr2z9WJbW+ZrIMN7rX4lbCJbUYQouv79IuWKsPbZw
         40Yw==
X-Gm-Message-State: AOJu0YyRQVkZjegz1fdxcKkwHLPtmyAEEbs+W6nz+h08yATebSD2vBAY
	zdmuIpoMKaJsB8auq7CGpbt3cMHt8prvajUzX85LkydQuqACteIwe/pGXjwqX6YWVcI=
X-Gm-Gg: ASbGnct0BrrmAdE94b/kF7cl+9Xfuzwwx8/ZsbBfK4uZfa3GfYIkLPTkHYT0thMGsB8
	agiLk7cgxqK0Qv99LH6yYt+qzHLNuER+uTUvCsX21VYkBWhSd9ptCwxqGMyVnjeZcvXKE0sfCP1
	I/RVKsYbgQQadpMJS7cU3c9PXxdYaDb0dMLXkan/sqdgU6q5rQctxUdrTzlDOXPwmpco2T6jefr
	5uXN1gMmA8SZywkFRwPJLtTYaiugqcNUfegTBJOvbl8367USdiHKNDM0M5bxG6mn6KUBGIf2Atp
	nbSYt09o6klTSFHMfaKV/RZ4NoYptnHl24Uz+tjXxhnQGTKM4PbmCkEOrpjH+f3A3gspkOYzXTT
	8e1AnjWmAHlqGnulPMCIDbkSWzoJNjqZLFxtxhFR0aIU=
X-Google-Smtp-Source: AGHT+IHWiexaVwmMrfCesAYQvzzDEjUSkMZA8bOmNgM6tMD5UpaI8v8Bzd/POThkVi6Pt2HxfwQt4Q==
X-Received: by 2002:a17:902:cece:b0:234:d431:ec6e with SMTP id d9443c01a7336-23f9813a90emr143907835ad.3.1753400250715;
        Thu, 24 Jul 2025 16:37:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:30 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:04 -0700
Subject: [PATCH 11/11] riscv: Kconfig & Makefile for riscv kernel control
 flow integrity
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-11-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_163731_617176_0D4720B1 
X-CRM114-Status: GOOD (  12.90  )
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

Defines `CONFIG_RISCV_KERNEL_CFI` and selects SHADOW_CALL_STACK
and ARCH_HAS_KERNEL_SHADOW_STACK both so that zicfiss can be wired up.

Makefile checks if CONFIG_RISCV_KERNEL_CFI is enabled, then light
up zicfiss and zicfilp compiler flags. CONFIG_RISCV_KERNEL_CFI is
dependent on CONFIG_RISCV_USER_CFI. There is no reason for user to
not select support for user cfi while enabling for kernel.

compat vdso don't need fcf-protection (toolchain lacks support).

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig                     | 37 +++++++++++++++++++++++++++++++++-
 arch/riscv/Makefile                    |  8 ++++++++
 arch/riscv/kernel/compat_vdso/Makefile |  2 +-
 arch/riscv/kernel/vdso/Makefile        |  2 +-
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 385c3d93e378..305ba5787f74 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -245,7 +245,7 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
 	depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C
 
 config HAVE_SHADOW_CALL_STACK
-	def_bool $(cc-option,-fsanitize=shadow-call-stack)
+	def_bool $(cc-option,-fsanitize=shadow-call-stack) || $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
 	depends on $(ld-option,--no-relax-gp)
 
@@ -864,6 +864,16 @@ config RISCV_ISA_ZICBOP
 
 	  If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZICFILP
+	bool
+	default y
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp)
+
+config TOOLCHAIN_HAS_ZICFISS
+	bool
+	default y
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
@@ -1182,6 +1192,31 @@ config RISCV_USER_CFI
 	  space does not get protection "for free".
 	  default n.
 
+config RISCV_KERNEL_CFI
+	def_bool n
+	bool "hw assisted riscv kernel control flow integrity (kcfi)"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
+	depends on RISCV_USER_CFI
+	select ARCH_SUPPORTS_SHADOW_CALL_STACK
+	select SHADOW_CALL_STACK
+	select ARCH_HAS_KERNEL_SHADOW_STACK
+	help
+	  Provides CPU assisted control flow integrity to for riscv kernel.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge. Shadow
+	  stack protection is a hardware feature that detects function return
+	  address corruption. This helps mitigate ROP attacks. RISCV_KERNEL_CFI
+	  selects CONFIG_SHADOW_CALL_STACK which uses software based shadow
+	  stack but is unprotected against stray writes. Selecting RISCV_KERNEL_CFI
+	  will select CONFIG_DYNAMIC_SCS and will enable hardware assisted shadow
+	  stack protection against stray writes.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This enables forward
+	  control flow (call/jmp) protection in kernel and restricts all indirect
+	  call or jump in kernel to a landing pad instruction which mostly likely
+	  will be start of the function.
+	  default n
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7128df832b28..6ef30a3d2bc4 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -61,8 +61,10 @@ else ifeq ($(CONFIG_LTO_CLANG),y)
 endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
+ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
 	KBUILD_LDFLAGS += --no-relax-gp
 endif
+endif
 
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
@@ -91,6 +93,12 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
 KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
 export KBUILD_BASE_ISA
 
+ifeq ($(CONFIG_RISCV_KERNEL_CFI),y)
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFILP) := $(riscv-march-y)_zicfilp
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFISS) := $(riscv-march-y)_zicfiss
+KBUILD_CFLAGS += -fcf-protection=full
+KBUILD_AFLAGS += -fcf-protection=full
+endif
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 24e37d1ef7ec..552131bc34d7 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -69,4 +69,4 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
 
 # actual build commands
 quiet_cmd_compat_vdsoas = VDSOAS  $@
-      cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<
+      cmd_compat_vdsoas = $(COMPAT_CC) $(filter-out -fcf-protection=full, $(a_flags)) $(COMPAT_CC_FLAGS) -c -o $@ $<
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 2b528d82fa7d..7b1446b63ebc 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -17,7 +17,7 @@ ifdef CONFIG_VDSO_GETRANDOM
 vdso-syms += getrandom
 endif
 
-ifdef CONFIG_RISCV_USER_CFI
+ifneq ($(CONFIG_RISCV_USER_CFI), $(CONFIG_RISCV_KERNEL_CFI))
 CFI_MARCH = _zicfilp_zicfiss
 CFI_FULL = -fcf-protection=full
 endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
