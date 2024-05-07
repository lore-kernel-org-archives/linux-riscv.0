Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F79C25B10
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 01:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hs6EznmB2BSB8uh82NRk8ciQUPonBDzfEEMwDaCBsFM=; b=sdsQdR3sbuTcJo
	P99aWpLfntI37X/90u92bRiOinraGCde+qgZkx3dK3uOk5GrHa+gVDUN1ohDCFoSRWO0PtgNShL7W
	D3bLPSVFMuga3xY8nlI7iazT1VTG1Dlcq0mUxQFuzLoAFnVg9ca3Gr+3dklku6UZ6SZDbaQCm9Dg1
	Kq299R3f3o9qpxpJi1V4ip3vero2gMzWZvgcuHdDiPQvt1yXRE2uE64OpnbtBHkjfLWlppp6UyXB4
	5CSw9XqeOPlXTj4/xXU9VJIXoYNARlRBpxuakGf9fOHRXs2OG8fDAwOH7hdel+uvDVc6Y/ii3XtMJ
	JA81r/umyY1CrEvdlf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r9-00000009H7f-1QWz;
	Tue, 07 May 2024 01:42:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r1-00000009H2e-0oZe
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 01:42:53 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so13746045ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 18:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715046171; x=1715650971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCTzqIps+ZkkY2OB8nLwr+KIJ7vqS249dCWRcdyLtRQ=;
        b=cXiHlch/N5S9rkmlvrbEjJCaiUlJccGmaetS7gA4F9A0bXg5UW73tyN6RUwJDjWmRl
         OVDaHO4yw0iukOnUZ5Fy+vwa76nYc9KAhGN/z4gGGPpAggfJYB/UUQTsQWFsXZYD0fpX
         zIk4GBV87kmLeYIQJTcPH+uft+i2m2z3/qmLqBAay2fYtyYgiMzBXxB3AgjYsU3zlNE3
         VK0JYN5ypeJdG7NZB2GjCqWlQcDwL0dHarPJ3ycartAQUhL6x7J1CBqdqxsG80BXPRi+
         B2xbTip57q3xwTjWtquN/tz1Cb28jASanejGHHyO4Ldh+5/Knlp9cIaj1HzYrZwdfthJ
         SGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715046171; x=1715650971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCTzqIps+ZkkY2OB8nLwr+KIJ7vqS249dCWRcdyLtRQ=;
        b=vRSNHFQ0AbrqZi0y2qkwgdzjV3C83tcqnrgwaVbTCB3MNGi2GlKsQwSnwanmIJXJMl
         H76uodDcCDEdL/muCO7cIq/nk50cFHEOOVRHgdPD/R1Fxj32jAb7TGY80ImYY+fVa4SF
         XBEcDNDSfFvy9N/5X6mW3SPEitm7kH6ejpTRBxT4uauvTR9W8dqclxrEMH2S55ZwuOA/
         EL8F2gErOs+OSTln80QnFrALxSAw89xC86z/8Q5oNvRmLkdXz96d6eEL4c0UU0JTrtzO
         Lr683y7c/qsNeGEArQC8cYv3N6tocfDCiftDW7BTGslF/CN43twGPUqLEZ1ucfDh9MlS
         mFXw==
X-Gm-Message-State: AOJu0YwelcP/1WIOv01PRNtKz9fy1Cj32hQcfkHo7gr0OkBAI3Dih7de
	o2c8yvzSJBBTvIph+yTBHKLmRCwaNVIfiDlaa+HWeHvcGZxAxpDvozqLJnKTtEs=
X-Google-Smtp-Source: AGHT+IFcNj1lxhLTwHPlCK4GlMUj4Rw8hbj32zTfxKPPgwKugeGp2LOBvsLjEjT1lRXdW+vSCTVKLw==
X-Received: by 2002:a17:903:2b07:b0:1e4:c8b3:dbaf with SMTP id mc7-20020a1709032b0700b001e4c8b3dbafmr13911614plb.33.1715046170305;
        Mon, 06 May 2024 18:42:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b001eb3f705ddasm8915311plx.255.2024.05.06.18.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:42:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 06 May 2024 18:40:48 -0700
Subject: [PATCH 7/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBC Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240506-compile_kernel_with_extensions-v1-7-5c25c134c097@rivosinc.com>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
In-Reply-To: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715046158; l=3081;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=yS+zKcRdHLA3uaeN6uPi5O7/8wOCzM0M3jPlowSQyzw=;
 b=xjEaBxuq9R3saXEJW38LF+s1vw2phgumpvArnblkck0B5vgdDCTA1Fh0JjuHtzXSFyGm8yXBo
 S623mMD7ghMCkD+Oo1IlBznEsB7pihM0BXEqJS/GNaia3IW3xpzsUVf
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_184251_275379_D1B6D4BC 
X-CRM114-Status: GOOD (  13.18  )
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

Zbc can optimize kernel instruction sequences. Add a config option
PLATFORM_SUPPORTS_RISCV_ISA_ZBC that allows arbitrary Zbc instruction
sequences to be emitted by the compiler.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.isa | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile    |  1 +
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
index e7f28dc44137..b7399f236bba 100644
--- a/arch/riscv/Kconfig.isa
+++ b/arch/riscv/Kconfig.isa
@@ -289,3 +289,54 @@ config PLATFORM_SUPPORTS_RISCV_ISA_ZBB
 	  systems that do not support the Zbb extension.
 
 endchoice
+
+config TOOLCHAIN_HAS_ZBC
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBC
+	bool
+
+choice
+	prompt "Zbc extension for bit manipulation instructions support"
+	default PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBC
+	help
+	  This selects the level of support for Zbc instructions to be
+	  built into the Linux Kernel. This does not impact whether Zbc
+	  instructions are allowed to be emitted by user-space code.
+
+	  The Zbc extension provides instructions to accelerate carry-less
+	  multiplication.
+
+config PROHIBIT_RISCV_ISA_ZBC
+	bool "Prohibit Zbc instruction sequences"
+	depends on NONPORTABLE
+	help
+	  Regardless of if the platform supports Zbc instructions,
+	  prohibit the kernel from emitting Zbc instructions.
+
+config PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBC
+	bool "Allow Zbc instruction sequences if supported"
+	depends on TOOLCHAIN_HAS_ZBC
+	depends on RISCV_ALTERNATIVE
+	select RISCV_ISA_ZBC
+	help
+	  Add support for enabling optimisations in the kernel when the
+	  Zbc extension is detected at boot.
+
+config PLATFORM_SUPPORTS_RISCV_ISA_ZBC
+	bool "Emit Zbc instructions when building Linux"
+	depends on TOOLCHAIN_HAS_ZBC
+	depends on NONPORTABLE
+	select RISCV_ISA_ZBC
+	help
+	  Adds "zbc" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in Zbc instructions in the
+	  Linux binary. This option produces a kernel that will not run on
+	  systems that do not support the Zbc extension.
+
+endchoice
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0ab4cc5dfffb..30be0fec976a 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -69,6 +69,7 @@ riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_V)	:= $(riscv-march-y)v
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
+riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBC)	:= $(riscv-march-y)_zbc
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
