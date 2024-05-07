Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68755C25B5C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 01:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uj8e15UR7pweCsOH3MWOLs0tuR2A+XI1nZ8eTDgC7ak=; b=eu9yYbkmtFumGt
	WASFMnid+Om4fC1GmfIR5qpys51yTcD/zXsL70kb2BG84zQ/qlHUL+I4wkFG8u8vp59zsRpNWO77S
	nCEjJN7N/tml45/5NrPpqaz+1DE/MURISCBpk7du8REGcrfAN5jBCh6IK+uQ8i5Jr9CFbNsrZuALx
	ZpROuWP/cB96Vx+d6ynlNqu1gxVjzsq2oKZVC1vi83MBiuPV79rMyDs22qVkdkuX9D0G3Ckm1letg
	uEuKbXI2Q8Hp32X9farGDWIJJjeldqQAbxwwRfbGTkKMsLj9yDhhy6cVR34tBCFqW00lms2S6Qlcs
	zxc2GJgCEqaGNsgPwHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49rC-00000009H9E-0AbN;
	Tue, 07 May 2024 01:43:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r2-00000009H3r-3F3M
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 01:42:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ee42b97b32so9312705ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 18:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715046172; x=1715650972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mrbuhf8lERW/x3AUUGdC3eD15JM+519sglQ52hQ7AhA=;
        b=YUOpVyFis4qV4q3g/83KuwRqHBwX1uXz4deGbDNGMc/lif+BFDLOWf2UfVwkiCiFEb
         2YIlY5ot8I7ifVqqGSLlVCv/ySoejgBmIyTfv2CoOBNjfJ3uX/nqEYKkmN+zDy0An7Ij
         cp0E7Tr5bbUNKoC2QdqumfV7uDOUQsQXSMNf/jr7t/elGS053EZrmXrw9Y9vZFydT7aK
         GYWWAw64OhhySkfMdZzI24489up09Lz2SXPErOU6Kwa5c64gp8D5IliHhAkVAeD6O8FU
         fHTZ5oPVrkfiIOGfy78PKmmdgybfh7DhXLzeaLKfsyvOdnDw7IX+Rk04lQOWaQyVZK8H
         vl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715046172; x=1715650972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mrbuhf8lERW/x3AUUGdC3eD15JM+519sglQ52hQ7AhA=;
        b=qSutI7k7eBc4Cx/GfJSPaFYXrChMLMKcpqRXXbmLFCerjMrzlB0ZZ5D3qOZ8xhqNDm
         gzTQ8o8bdtaUq156/uczf9VgyiVWsn0Ku0Vw7OXNf3wNO3TeMrZbJWUuoZ4uSGP2fvO6
         w0P6ZBHc/EnNE6sGW8igUApdkGDOYqscURQZ54x+D68zwJsRxewCe3jr7ugGDlTVUtxG
         7j+8txEJ//jJJWsvKFfIWvMDfDWwK1YI66OxDyYRJTfIxde5ld4t4AYyGcgOUbP+BcvO
         eifN+hDBJLOhF/iAdAh2Sh07c2OeBTWNhEztiEPabYkrbGjML6vLOGnSl6wfJGA93zl4
         SwGg==
X-Gm-Message-State: AOJu0YwwIXTxhL2AKN5UHA/tUak9tGURsZS9xe/lpp1636QWtKG0UVeK
	DFdUXFNvq2+FdR+UNk2g52y8rOGdz99UdNkgVvt6OcC0dMA5R5PurLC/vQJJhKE=
X-Google-Smtp-Source: AGHT+IGF+LSyNFek/MjWREJIb2DvsG1B8cdEZTM4HWcwxV91ymmqopcN94RSVuM+E6tI2esVsff8YA==
X-Received: by 2002:a17:902:e548:b0:1e5:5ccd:30e1 with SMTP id n8-20020a170902e54800b001e55ccd30e1mr13723687plf.65.1715046171913;
        Mon, 06 May 2024 18:42:51 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b001eb3f705ddasm8915311plx.255.2024.05.06.18.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:42:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 06 May 2024 18:40:49 -0700
Subject: [PATCH 8/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBS Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240506-compile_kernel_with_extensions-v1-8-5c25c134c097@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715046158; l=3086;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VSGPqebqjCkV+Jce+IU74T8AjKJ/iHF/vPW/Bia4uwk=;
 b=PDnuVsyyK0HUPATpcCiqShVPqzG7qsmDrxcNZxQQptU20Eb8nLdqbPfj2AbCgNK4RPsM26oGZ
 gmZwE2MylTPC4jC6xpkZtKachs4HLLUOAvrnLkA+xKmCeSbzFLq0q8f
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_184252_970321_64099B13 
X-CRM114-Status: GOOD (  13.37  )
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

Zbs can optimize kernel instruction sequences. Add a config option
PLATFORM_SUPPORTS_RISCV_ISA_ZBS that allows arbitrary Zbs instruction
sequences to be emitted by the compiler.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.isa | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile    |  1 +
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
index b7399f236bba..60ae1bf71c70 100644
--- a/arch/riscv/Kconfig.isa
+++ b/arch/riscv/Kconfig.isa
@@ -340,3 +340,54 @@ config PLATFORM_SUPPORTS_RISCV_ISA_ZBC
 	  systems that do not support the Zbc extension.
 
 endchoice
+
+config TOOLCHAIN_HAS_ZBS
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbs)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbs)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBS
+	bool
+
+choice
+	prompt "Zbs extension for bit manipulation instructions support"
+	default PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBS
+	help
+	  This selects the level of support for Zbs instructions to be
+	  built into the Linux Kernel. This does not impact whether Zbs
+	  instructions are allowed to be emitted by user-space code.
+
+	  The Zbs extension provides instructions to accelerate carry-less
+	  multiplication.
+
+config PROHIBIT_RISCV_ISA_ZBS
+	bool "Prohibit Zbs instruction sequences"
+	depends on NONPORTABLE
+	help
+	  Regardless of if the platform supports Zbs instructions,
+	  prohibit the kernel from emitting Zbs instructions.
+
+config PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBS
+	bool "Allow Zbs instruction sequences if supported"
+	depends on TOOLCHAIN_HAS_ZBS
+	depends on RISCV_ALTERNATIVE
+	select RISCV_ISA_ZBS
+	help
+	  Add support for enabling optimisations in the kernel when the
+	  Zbs extension is detected at boot.
+
+config PLATFORM_SUPPORTS_RISCV_ISA_ZBS
+	bool "Emit Zbs instructions when building Linux"
+	depends on TOOLCHAIN_HAS_ZBS
+	depends on NONPORTABLE
+	select RISCV_ISA_ZBS
+	help
+	  Adds "zbs" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in Zbs instructions in the
+	  Linux binary. This option produces a kernel that will not run on
+	  systems that do not support the Zbs extension.
+
+endchoice
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 30be0fec976a..7519b68c3bd5 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -70,6 +70,7 @@ riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_V)	:= $(riscv-march-y)v
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBC)	:= $(riscv-march-y)_zbc
+riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBS)	:= $(riscv-march-y)_zbs
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
