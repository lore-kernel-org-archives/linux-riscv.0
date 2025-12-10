Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB86D3C928
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uv+GadXxuAe+Z7C3M7nxN1cnpjDqiNfLuQya9ranuA=; b=jkNZUbzwLqJeJV
	H+rcTCkUVlKbJ3WTI1PBI97XzB/8zvtKKR+ny8BJonNNiDGz3Z1ekbBnyH/zlqr+WMFpkfO3451kZ
	dx3p61qQmQkKLfqCiUk2m8e9JeKn67PhWc4ojmPWaG6j1vEaDR3FTqjAKHepLBXWvXAX8SBul9MNb
	esHYNKhvIh81s5/ZBjA4RPvpip30lEiZZonGxNBM5TcBiwgxOhSTA645I6NyKUWw1F5iKnELfxymO
	AKaAnPb0YCaVzPL1KcvkmI8Sa0CHi3PURCi08v6D2x3woWgUn7bb/ylzHLG+WO95bj6os+kwc4kvH
	eCcVLzeNbtPZb7YZyuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpM-0000000Fc43-0J54;
	Wed, 10 Dec 2025 16:14:08 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpJ-0000000Fc2v-3O8G
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:14:06 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso5682225b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383245; x=1765988045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTeBxOv2SMEIJm2X1dOR2xoggDwy3sZYySAZ+VrtZTc=;
        b=dwe4rsrEqBbK7VLPjWrXSk1/8bMOKZzpTzQ9Lxg/bs95s8Yenm5ksPi3kILGIhDWpH
         J7lFC2wAZfkkdFc8AKI8KtDd6spp4dDxbmSVM51At9/6h0QsZ4L9EcT2/DkiMtOAZCJM
         nGPbA2z1XrcvPHEfaZc2r7+QR3G/EysCEPbEeEz/eS30ZWVLsXJswkmlCzSRQCn+CjcM
         sz4nDF98xVFatzZ7/jjKeMyaGB+DUR9XU2G2Fktw3NSuZpbgMVLhrRM2Gc40vcQab3Mk
         XSzHzbJEnAt77LNxEfhcfLg4a299VyTCh8Fd9O8ulZ5qN7BcFP5RAvq5SdNgMSJnKEQJ
         3uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383245; x=1765988045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jTeBxOv2SMEIJm2X1dOR2xoggDwy3sZYySAZ+VrtZTc=;
        b=MXXs5f6GJyM/OFBCz6GpIY6M92gnIMZByKWfhkNUTNvVCGhAyvurjcj/7GnA6NkbmU
         LkDbjL4ClWkHZyyjw8GsKhUdREOeJEf6A+isioKiDgXvOU9jvjXDjLz1MExAnEFGpN06
         twoXPzNNhxODln7CYoeYHhsCfv/gycVyg3MGOCadzglcksLbVRARSskGIEEHr16gJ/01
         2rRPmu+kAiaqKZeuYqrgNbOXURGBgYaC4UUk7+Unp1jIUkd0NnTNqAO5aw/HxUiLDFGz
         ruFAgI8ITOgsJrlVChYCkqJ455JqIeXb7utQYyzNc5wyrakQDk2oo1hHGA4YNU5a5BQL
         I1nQ==
X-Gm-Message-State: AOJu0YxVF0JfRopDaDNhd7a4aYg7+wvH3sesr2edc+zvOp7GjKw4q7rq
	6gq4PVfJnCdSc+ooqIu0A5DRVa4V85y+dC1EkIJ90HuIZxMEcHVKaKVTS9AWvqRhvYc=
X-Gm-Gg: ASbGncuPlL6+Ke3VLWEVdAehPKm7Op7g5Zqdy0SNKW74Ip4Rz6vAdACHQh72OPLmtR4
	TrHBQ5704UHptiSBjMbJqQ5OzEqufpf5QKhWNIA02OhENpwrnOX3tB2JlbCF17bEuj5272qbQtb
	v2VQyFl+5ff7mxOyBvD5GTjX51RNam4DGv4fepgU9mgbJbczhng63kdyehRJV4z+4iTgqIDG4lw
	t3+2DMQgOxNkVHudW725+wwqogUq491EVilX4z6cOSWnlLU9kOON5b+hObdDdy/whKd8zNFPm88
	IUmBzbTIiF2ni4Mo6rmPBZl2Gy9Sgxcw4Llxz/u7sbKi6XiwsCJ+X66txh+YGUtqA/gGVan0tJD
	sZYnTefEEMbUV/rhMl4x67XsuqCgBg4x9c2+cpx/7vgdpZ5RkLhoIJa+7XSISTjdMaUEDlYHZD2
	9lQlTXmHf6bsM4ZvUkjS7erRauBUh133LRG8GFkqg9UW7FRJ4ZOTB1SpzAXjynzzHUTq704aSba
	h7j4R4zmges
X-Google-Smtp-Source: AGHT+IEnH2JCzQBXPTwYTipTGasI37dEmVRsGwF2tVJaArwKUp9ryzfhwoIxbl9WMS+Ke/jAN7fjLA==
X-Received: by 2002:a05:7022:6289:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-11f2967d192mr2057361c88.15.1765383244756;
        Wed, 10 Dec 2025 08:14:04 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:04 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:43 -0800
Subject: [PATCH RFC 06/10] riscv: Makefile: Add enabled extensions to
 compiler flags
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-6-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=7578;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=PXm4AG2hGsdYLwwyM2sQFSEI0LSfo1j2CNnPg+fTqTA=;
 b=0kvyOA3UMAW8IGwuP4q/SaToDXNlSkfb6ktLVtbx8kmnGX7Cnn9oikqQ51/0sCC+HvEusUnER
 HzDVolRAfIsAveQLbAR9G8+jDUiBSxWBDEXdwGEg/9W6pYn//C48M0u
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081405_862299_6F051491 
X-CRM114-Status: GOOD (  18.02  )
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

Build an optimized kernel with all extensions that the hardware is
expected to support. Extensions that might be supported by hardware and
will be detected at runtime will be added to the assembler flags but not
to the compiler flags.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Makefile | 135 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 116 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index ef1a7b1bffe8..efe43537e984 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -57,37 +57,134 @@ ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
 	KBUILD_LDFLAGS += --no-relax-gp
 endif
 
-# ISA string setting
-riscv-march-y				:= $(CONFIG_ARCH)
-riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
-riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
-riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
+# Handling of riscv extensions
+# There are a couple of considerations when enabling extensions:
+#	1. Does the toolchain support the extension?
+#	2. Is the extension supported by the hardware the kernel will run on?
+#       3. Does the extension have registers that need to be save/restored on
+#          a context switch?
+#       4. Is this extension emitted by the compiler or only by hand-coded
+#          assembly?
+#
+# This section has helpers to support extensions with varying answers to these questions.
+#
+# The compiler will be allowed to emit an extension if all of the following
+# are satisfied:
+#       - The extension is a "stateless" extension (i.e. doesn't introduce additional
+#         registers)
+#	- The extension is supported by the toolchain (selected by CONFIG_TOOLCHAIN_HAS_*)
+#	- The extension is enabled for use in the kernel (selected by CONFIG_RISCV_ISA_*=y)
+#
+# Assembler support for the instruction will be added if the extension is
+# supported by the assembler (selected by CONFIG_TOOLCHAIN_HAS_*).
+
+# Extensions that the compiler is allowed to emit anywhere.
+riscv-march-standard				:= $(CONFIG_ARCH)
+
+# Extensions that the compiler is allowed to emit in FPU contexts.
+# This should riscv-march-standard plus the FPU-specific extensions.
+riscv-march-fpu					:= $(CONFIG_ARCH)
+
+# All extensions supported by the kernel. Some of these extensions require
+# special care so they cannot be arbitrarily emitted by the compiler.
+riscv-march-full				:= $(CONFIG_ARCH)
+
+# Returns the instruction if it is supported, returns the empty string otherwise.
+# An instruction is only "supported" if RISCV_ISA_*!=n.
+# An instruction that is "supported" can be emitted through alternatives, but an instruction that is
+# "enabled" can be emitted arbitrarily by the compiler.
+# Arguments:
+#	$1 - name of extension
+#	$2 - extension delimiter. Should be empty for base extensions and
+#	     underscore otherwise
+extension_supported=$(if $(and $(or $(filter $(CONFIG_RISCV_ISA_$(shell echo $1 | tr a-z A-Z)),m), $(filter $(CONFIG_RISCV_ISA_$(shell echo $1 | tr a-z A-Z)),y)), $(filter $(CONFIG_TOOLCHAIN_HAS_$(shell echo $1 | tr a-z A-Z)),y)),$2$1)
+
+# Returns the instruction if it is enabled, returns the empty string otherwise.
+# An instruction is only "enabled" if RISCV_ISA_*=y.
+# An instruction that is "supported" can be emitted through alternatives, but an instruction that is
+# "enabled" can be emitted arbitrarily by the compiler.
+# Arguments:
+#	$1 - name of extension
+#	$2 - extension delimiter. Should be empty for base extensions and
+#	     underscore otherwise
+extension_enabled=$(if $(and $(filter $(CONFIG_RISCV_ISA_$(shell echo $1 | tr a-z A-Z)),y), $(filter $(CONFIG_TOOLCHAIN_HAS_$(shell echo $1 | tr a-z A-Z)),y)),$2$1)
+
+# Use this macro to add support for an extension that is stateless.
+# A "stateless" extension is one that does not add additional registers.
+#
+# Arguments:
+#	$1 - name of extension
+#	$2 - extension delimiter. Should be empty for base extensions and
+#	     underscore otherwise
+define add_stateless_extension
+$(eval riscv-march-standard=$(riscv-march-standard)$(call extension_enabled,$1,$2))
+$(eval riscv-march-fpu=$(riscv-march-fpu)$(call extension_enabled,$1,$2))
+$(eval riscv-march-full=$(riscv-march-full)$(call extension_supported,$1,$2))
+endef
 
-ifneq ($(CONFIG_RISCV_ISA_C),y)
-	KBUILD_RUSTFLAGS += -Ctarget-feature=-c
-endif
+# Use this macro to add support for a floating point extension.
+# Floating point extensions are not able to be used in all contexts, so they
+# are kept separate.
+#
+# Arguments:
+#	$1 - name of extension
+#	$2 - extension delimiter. Should be empty for base extensions and
+#	     underscore otherwise
+define add_fpu_extension
+$(eval riscv-march-fpu=$(riscv-march-fpu)$(call extension_enabled,$1,$2))
+$(eval riscv-march-full=$(riscv-march-full)$(call extension_supported,$1,$2))
+endef
+
+# Use this macro to add support for an extension that is stateful.
+# A "stateful" extension is one that adds additional registers, or requires
+# hand-coded assembly (instead of being arbitrarily emitted by the compiler).
+#
+# Arguments:
+#	$1 - name of extension
+#	$2 - extension delimiter. Should be empty for base extensions and
+#	     underscore otherwise
+define add_stateful_extension
+$(eval riscv-march-full=$(riscv-march-full)$(call extension_supported,$1,$2))
+endef
+
+# Extensions must be added in the canonical ISA string order
+
+# Base extensions
+$(call add_fpu_extension,f)
+$(call add_fpu_extension,d)
+$(call add_stateless_extension,c)
+$(call add_stateful_extension,v)
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2
 KBUILD_AFLAGS += -Wa,-misa-spec=2.2
 else
-riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
+$(call add_stateless_extension,zicsr,_)
+$(call add_stateless_extension,zifencei,_)
 endif
 
-# Check if the toolchain supports Zacas
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
+# Standard extensions
+$(call add_stateless_extension,zabha,_)
+$(call add_stateless_extension,zacas,_)
+$(call add_stateless_extension,zba,_)
+$(call add_stateless_extension,zbb,_)
+$(call add_stateless_extension,zbc,_)
+$(call add_stateless_extension,zbkb,_)
 
-# Check if the toolchain supports Zabha
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
+ifneq ($(CONFIG_RISCV_ISA_C),y)
+	KBUILD_RUSTFLAGS += -Ctarget-feature=-c
+endif
 
-# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
-# matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
-KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+# Only include extensions that do not introduce additional state. This
+# "additional state" most often means extra registers.
+KBUILD_CFLAGS += -march=$(riscv-march-standard)
 
-KBUILD_AFLAGS += -march=$(riscv-march-y)
+# Make all instructions available to the assembler
+KBUILD_AFLAGS += -march=$(riscv-march-full)
 
-# For C code built with floating-point support, exclude V but keep F and D.
-CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+# As an extension of the "standard" march string, include any extensions that
+# are able to be used when the FPU is enabled.
+CC_FLAGS_FPU  := -march=$(riscv-march-fpu)
 
 KBUILD_CFLAGS += -mno-save-restore
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
