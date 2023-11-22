Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850C9C61D99
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 03:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xFPP1fWSBVrtT0LynmiAHZ2wX4WexeE2xGXTs/2p/4=; b=pTB4/75GyuzQ/M
	IOyM83lUhEqQOhe00OuiXwIgUy4LdEFP59HHwcyc2yija6l8MQv5maX7/ip6r5M+V4b0lXA5uFtMt
	p3X3dWPdJ0j1u+b0LkHwF1K+FmH74S+LEtxFu8pssn+jfLBUoG+rGnFLHYx2M2g/mttXyGXxwShLV
	iT8pfp8mv2wWFoxcV/g2CnmU1IrK8IMDSqxwOYTwtN5RnMvajz+6cL2JfA4saI2BMWdBAdfxDa8JI
	9esVT0osDNbMhJ07ai1kslYkXUcmQQyXmn3Fqkb5A7FEMlbUkAPjMy+gJJtv/zwYbT9V4XmTsibYn
	+iMeUzRCPiWmVRORfFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZU-000VlP-2w;
	Wed, 22 Nov 2023 03:06:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZP-000VjW-24
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 03:06:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cbc8199a2aso659633b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 19:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700622390; x=1701227190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBSDlJJdl9cJTZEKARyFff2b3kLrE8gro26mzSoUMfg=;
        b=bIrqZCMRS5klr7Qkk5afACNTIyFNVwvNvUHv2pv8kz+MeR7rFX+fjMt9IM53g89qGD
         SBRATvvwP5mwXIeyMTAbx7XX9pEhaUa7YyoBCKf5WzggWwNcPjZpLGwZO8U//6YhSLxB
         5ysvqUIeXtmOJNNPdw8b1w7kZTuuWp3l9YNMpTqOl8fzZzY2JR22k04QvtuYZFD6TM7O
         uaWGCp3tbUy8HjlZGfMgkdb9wm7P50NoFUVmJNtwzoX2XyRfxPWlTwbAChN9XwUvhbnm
         mVSs5PiQHQuhXmDxUOX5H+5HeMAp1//aaZ00JiYJxsiO6tTciE3GfSarpbhvEm3VkaKD
         Vo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700622390; x=1701227190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBSDlJJdl9cJTZEKARyFff2b3kLrE8gro26mzSoUMfg=;
        b=IjpgNRQDblCa0Zu862h/JkMuq2E/u9GAgB91g28ITcd0CDN2VH88L8DlvgFCmX3yYn
         ZUgdcWff7R9YA+DuW9kBivTSgBrchy6Nh6rVyOW/R2SPS14zKNeazoCjkwQjktTFalcv
         3Z9N76oeZYEk4inYCvhoYoIOZCwJ6JhJa633BENyBzGi2lK08xsRUT+MxO7BgL39LpAb
         +xwI/EJJRrJeI/tz1AZjmowAHG/Mcg+UA/8AgH/oIhBXSg79NfuiyJeaYs/j+lW5yvtt
         VMcSd47Ue05upMJGt4N3dM+1Q44mDrguOk93IEHvFIH08MVaBBhw3TuIrZlayxSKgVw6
         mFNQ==
X-Gm-Message-State: AOJu0YyMiLIeTfph/HykIaPwgCLF2IwOHj8W8+5UpO56xDhJLWSu3BAW
	/WYI3HLPWQMmLIKxsrl1O1tKBg==
X-Google-Smtp-Source: AGHT+IGAWRMig9MTM8HwbUunWOHJsJ/tdXoUczvav4ujcqkNnMcjGyNXeyS3D3MD4r1LtBjigmKHkw==
X-Received: by 2002:a05:6a00:98e:b0:6cb:cdd0:76f7 with SMTP id u14-20020a056a00098e00b006cbcdd076f7mr417804pfg.21.1700622390174;
        Tue, 21 Nov 2023 19:06:30 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78282000000b006a77343b0ccsm8614917pfm.89.2023.11.21.19.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:06:29 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Date: Tue, 21 Nov 2023 19:05:15 -0800
Message-ID: <20231122030621.3759313-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122030621.3759313-1-samuel.holland@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_190631_687543_B7743880 
X-CRM114-Status: GOOD (  11.95  )
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

RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
architectures. Enabling hardware FP requires overriding the ISA string
for the relevant compilation units.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpu/drm/amd/display/Kconfig            | 5 ++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
 drivers/gpu/drm/amd/display/dc/dml/Makefile    | 6 ++++++
 drivers/gpu/drm/amd/display/dc/dml2/Makefile   | 6 ++++++
 4 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 901d1961b739..49b33b2f6701 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,10 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_FP if ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG
+	select DRM_AMD_DC_FP if PPC64 && ALTIVEC
+	select DRM_AMD_DC_FP if RISCV && FPU
+	select DRM_AMD_DC_FP if LOONGARCH || X86
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 4ae4720535a5..834dca0396f1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -35,6 +35,8 @@
 #include <asm/neon.h>
 #elif defined(CONFIG_LOONGARCH)
 #include <asm/fpu.h>
+#elif defined(CONFIG_RISCV)
+#include <asm/switch_to.h>
 #endif
 
 /**
@@ -89,7 +91,7 @@ void dc_fpu_begin(const char *function_name, const int line)
 	depth = __this_cpu_inc_return(fpu_recursion_depth);
 
 	if (depth == 1) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
+#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP))
@@ -122,7 +124,7 @@ void dc_fpu_end(const char *function_name, const int line)
 
 	depth = __this_cpu_dec_return(fpu_recursion_depth);
 	if (depth == 0) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
+#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
 		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP))
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index ea7d60f9a9b4..5c8f840ef323 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -43,6 +43,12 @@ dml_ccflags := -mfpu=64
 dml_rcflags := -msoft-float
 endif
 
+ifdef CONFIG_RISCV
+include $(srctree)/arch/riscv/Makefile.isa
+# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
+dml_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+endif
+
 ifdef CONFIG_CC_IS_GCC
 ifneq ($(call gcc-min-version, 70100),y)
 IS_OLD_GCC = 1
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index acff3449b8d7..15ad6e3a2173 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -42,6 +42,12 @@ dml2_ccflags := -mfpu=64
 dml2_rcflags := -msoft-float
 endif
 
+ifdef CONFIG_RISCV
+include $(srctree)/arch/riscv/Makefile.isa
+# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
+dml2_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+endif
+
 ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
