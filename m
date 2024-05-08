Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4BEC41513
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJcyeyAlX7IAwyCY8z9UM+PUfCvhzZzuTZStquvGHsk=; b=PiG5JidfZQt3zc
	/6YK7Co8cv3KvxyhO/5dmya+XGov9tp6KeFYoR61WT6S9qdYEGlu6WznHjJaudKWQn9J+8/Xy5s5O
	fF/MnLqm9bS8dOzke4aCrmdgMb91sOw5PWu7aa0hg+hNxMZwySYhJeg+gKpLxeldBQDqpCywSrE6q
	5vemOKABHZBiKaKj9bBE6ViA5g3vBORun4ekyOiYWe1kPrgH7R3r5m879d4NAzNEbKk0yM5zXw8py
	z4c33MVGd8q22q0y+MAwpY2Sr6x9kjOQH77nHZn2rxJbiQGapyTyDTZ+A/Xi2exIlwvrzpZHda557
	X1uuHJxw24hQoH8iX1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEu-0000000Df6O-2G4F;
	Wed, 08 May 2024 01:37:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEq-0000000Df2L-2Y5i
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6f4a817f1e5so97103b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132213; x=1715737013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSebZNH2K21s8abZJ+EPitFsmRQfB0232RHZtpEHlvw=;
        b=Kl4v4DxPlg44EVRi9BWLU1VgYZlzn3ud+mOaqYCw+yJ1TEOWg7Nc5Q3ELenH6NQpfu
         cRLmAnvy2Uc4XJY5wsjpS0mIzy5kkO7hdvHlzyNs9M0d074chqYeSEJEezE2L7y3YCCp
         G8X0eODTTOkjITRVzqh9IRL4oSh3xmwpsVsAuYBH4qHf44KXGHAwFShdRWml1pyjQE/m
         uRsPfJMhlKcGMSxxCyKMiTFhvrxr2GShbscTUpGYS+rcX0Q45JLp650Tl+4SkNknoSTt
         Mr0zP8jukY9Ezk19pLu1fi2NaL63wS80XNDjJH/4joHXkpjUf9oG8KCVl3g6sVkh0E+Y
         8DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132213; x=1715737013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSebZNH2K21s8abZJ+EPitFsmRQfB0232RHZtpEHlvw=;
        b=JLsJdur6kx+2L02ejzaqU8lLFQMol086+Y2L5mM0wDSDAWdA/fuAOWs3V34M9iE6SS
         35w+qt+usUyO1jBi/CzPr3x2Onw124f7g63x9Ip+gjZ/M7JvkJ8JgSZ3VkgtpZoGDEFS
         hxIi7KSuGTvn2m8Rw3MlnSFjnsTlWiSA5eGQ1JtPWUk0+lf8G5IJNwWa42SNKpkyf59Y
         hA1qvegDT4K05jKO3x3uXnO8hYrYmvpgqANQJLFOi5/VCXHqyNRa4XfobE+wg4tMRSla
         YkUOA/lTwnb7biOI65hcm+8PoZg+y54EnhE2artrQgYpdYn5a8ao9oo+XAz559oGc8VS
         7kTw==
X-Gm-Message-State: AOJu0YwngQGvXjgAP73Mjj4WH5HoyfAu8fV0gOleHAOtYb5qBVIZytxE
	cczDBi+YWmUBNXnK+B0J23+H+Nlq2So4IIIBzF7/1XxhpXvmYBGw0z5Q0Pu7vrk=
X-Google-Smtp-Source: AGHT+IHg6ptW80TJdWpfJCJXopHCGmFJ2iuPtPmC3dzzLoosh6XalLDn4t3j0emDTqeCUhoduvuo/g==
X-Received: by 2002:a05:6a20:1001:b0:1a9:c80a:c152 with SMTP id adf61e73a8af0-1afc8d763c8mr1324536637.21.1715132213554;
        Tue, 07 May 2024 18:36:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 May 2024 18:36:34 -0700
Subject: [PATCH v2 8/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBS Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240507-compile_kernel_with_extensions-v2-8-722c21c328c6@rivosinc.com>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
In-Reply-To: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=3277;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=7B3II1X/5OVe4Mrr/uSiLQQPEgDk0UMK2lq4VVxpgKM=;
 b=BOORKVGo69HF+7q44TCG43/RRTkpsAJGBawNHVFpF9jkZ7wAN2u8vXOHTvuJ13Qg1B+/ol51J
 6rief9SvltyDHEUzuVdcAQrC2MGCzumWPDi5HvHzyzoB8a1cNpdR4Vo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183656_780519_15BF3EB8 
X-CRM114-Status: GOOD (  14.49  )
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

The existing "RISCV_ISA_ZBS" option is repurposed to be used to by kernel
code to determine if either PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBS or
PLATFORM_SUPPORTS_RISCV_ISA_ZBS has been set.

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
index 57457d15e9a4..80ff8503196a 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -69,6 +69,7 @@ riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C)	:= $(riscv-march-y)c
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
