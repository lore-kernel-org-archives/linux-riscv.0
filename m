Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA38D3C922
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WzbAJJsi0mfYkgWBg37gxGCgRAcVX3FKS7sReLmygw=; b=Z5mXttfzbs37w8
	5icbgYUK45yjSqG5DoQ+glbsSAcS/5lcbicOwNqGu8z7iZ4dxnIPubKp8OxzwXDQUz5+gcbZZVw7F
	FLdRqqNKVC1XDI518mvwfZV5CWv2ZgJCuHeuAREmS+lBYMm80pwDeUXwGbD3Kb+rSBC6sa7ajuP+4
	NrbSQEERcb7j+CfseGrMIeM3IVxFwvMn8gpQfCbn7zX2r124s8/U3Ei/WaKuHFAqhN8/vENvJOuXF
	dZ5Gr3CXaeNJIMK+81rGWEC9ZTNdGAQSF92wcJ1EJ8BbLiApwMUzzx2HnqET0EWrNxmz24OUE5UL9
	szAtLN9xz6Z36C6YGvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpU-0000000Fc8V-0aQa;
	Wed, 10 Dec 2025 16:14:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpR-0000000Fc75-3SGl
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:14:14 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so4880559a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383253; x=1765988053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNEHWk4wJomnqXvsrqKRlJFX82RphkNF3SDwqZxDTNU=;
        b=H9BfGHHI/P6EN1JhR04ZmfDhBiW4oS4luL1xLxnn/ifCMgIdAqiIo76avMusPF460R
         yKi34Lx5qe/MATJJ3GY9HEGsomOGjObH0trZfz8TAVHWgYEamuW5BBWLYgDjIuVyHNBe
         fxVeim9hpZDOk72TWmk7MD95cnan1ollM1kpo8jjMVEWZ1/EJ0WRLGTstxJDDWkH8DFQ
         416so8o2dOt5j4vBa4BwQoW7TCdfBq1Ll8XQhNSEgRGDiTtoCytICirGB8JOyXeqY/Ia
         2raUXsWZIKHjAjckYluWen6lJrHckDmln5on521tqsO79Lt76+TZxCd9OMsJkn/WsMLN
         iaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383253; x=1765988053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nNEHWk4wJomnqXvsrqKRlJFX82RphkNF3SDwqZxDTNU=;
        b=EDnAK1xjUjCIdTesy0OZaqLM19oaAL3QZo1EufjXUWPHX39hSd1UYy/cb23bbXLg/Z
         d3+8UoDJoMCtRxsZcqj1Um7QOd8CBV2H1z+MMzZoNt56w2muRNS/D0Wom+0nJPS71gzc
         Hk8iqlci7LEFPHSIkUyzqSAKghES2G2J3VMZPMpivfpLn0wA7Z+4jM9nT2lUSzfvz6LP
         m2wHrdg6T4mGAIBTiViAusWV1jK/jWkyNPuf0aawl2x0Iz/VjDwG5nSK/MTZW4xExS0m
         Up4dN9r1ESRgHDIKUagAQd/uidZoXvTjf+SXuZEf0nWr2CYxuDX14EFkpxxJ5ywi9vaU
         pXvA==
X-Gm-Message-State: AOJu0Yxf+jI+lFYSKPEDD3LjDJfXrRir206hmvsm5u05SEQimhT9R3C9
	l5aZfPnYp9oZzalXGsI7wTcwoCiCbt69mNR2rzwK+W23Zo9PzuEtXe5ZWzXrjL2Z/Qw=
X-Gm-Gg: AY/fxX5E/H1BsU6p0UmEk2LTPNzW4PfDsdVI/9UIoUFtytskBmqtK76/Csh0Y7CnuZc
	7QlWuHrTPdMtp8u5My/qhhMQvUv2zvUuYMj9q3d83dzCJZpQPYqNUFPNJgc+3zN6m+nV3U2EnBM
	J26j9so5st+3u/Gw/DsxyO1XfzfxoXr8zl3A2hr6iKcagRT5ZFhGyhw2rBSFNe7/adg0Q0OLqT8
	i5NdnSbe7ZD+P0PkE2jrQSU0elodBLQ5heF5Z405DnTMV6YZSwYDaKolLzw2zKHQKEN5GZZunAq
	Gte+atwlABEztH14YqpMTBsEHNoaN0Ppxq+lZKpSFXjuRJXWdJEf74SsbTPVodVkywoZ8hjrN0E
	oYmLCtmeZcEGbSC/gskhMooktpwCG7hjUr1uRtMqRGnX7bWCSky3UwF6Er8IIsWvIotYU7zM8z1
	Ea6n8x11Jt5C5Yh41goSXRynBwsk6J2nWTF++jShBAlPLblWDemUfFAzFIaWYHRnkTJA21tOnln
	QWIgytGfdVfCktRTqLYPoI=
X-Google-Smtp-Source: AGHT+IFHgx15gFBJdcNQTOPk23spyuOU4NMQpEjykcDDxREIBO3euekHgkJi5aE2IkHPmTGVSmFLQw==
X-Received: by 2002:a05:7300:e6c6:b0:2a4:3593:c7d3 with SMTP id 5a478bee46e88-2ac054ac50bmr3374223eec.19.1765383252963;
        Wed, 10 Dec 2025 08:14:12 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:12 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:46 -0800
Subject: [PATCH RFC 09/10] riscv: kconfig: Add rva23 config
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-9-315a6ff2ca5a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=11094;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=RdRZS0aP9TmGcChwbptIjsJMmOhoTpCnwW+G44c9f0A=;
 b=IxfntaSVfKQG8mLj1Qg1BmULOJOUaqqxjrNfFM7iWIebYybkydjxxDeZvtPVrQlWiqqf6BwNa
 oJXKJHlMZP6ASp0Is8JSk4m5EzcUU0w1LDBYaWNWOEZnvxntHRQJn13
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081413_880530_47C55760 
X-CRM114-Status: GOOD (  13.79  )
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

Add CONFIG_RISCV_ISA_RVA23 to select all rva23 mandatory extensions.
This also introduces a new class of kernel binaries, portable rva23
compatible binaries. This option does not require NONPORTABLE because
profiles are expected to be portable between systems.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig.extensions | 99 ++++++++++++++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/Kconfig.extensions b/arch/riscv/Kconfig.extensions
index e400fd5574f7..38b655e480a8 100644
--- a/arch/riscv/Kconfig.extensions
+++ b/arch/riscv/Kconfig.extensions
@@ -4,6 +4,33 @@
 # see Documentation/kbuild/kconfig-language.rst.
 #
 
+# Profiles
+
+config RISCV_ISA_RVA23
+	bool "Enable rva23 extensions"
+	default n
+	select RISCV_ISA_SUPM
+	select RISCV_ISA_SVNAPOT
+	select RISCV_ISA_SVPBMT
+	select RISCV_ISA_ZAWRS
+	select RISCV_ISA_ZBA
+	select RISCV_ISA_ZBB
+	select RISCV_ISA_ZBC
+	select RISCV_ISA_ZBKB
+	select RISCV_ISA_ZICBOM
+	select RISCV_ISA_ZICBOZ
+	select RISCV_ISA_ZICBOP
+	select RISCV_ISA_V
+	help
+	  The RVA23 profile is a grouping of extensions that are expected to be
+	  available on server and application CPUs.
+
+	  Enabling this config will cause the kernel to fail to boot on platforms
+	  that are not rva23 compliant.
+
+	  Say "y" here to optimize the kernel for rva23 compliant platforms.
+
+	  If you don't know what to do here, say "n".
 
 # Base extensions
 
@@ -64,7 +91,7 @@ config RISCV_ISA_D
 config RISCV_ISA_SUPM
 	tristate "Supm extension for userspace pointer masking"
 	depends on 64BIT
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  Add support for pointer masking in userspace (Supm) when the
@@ -75,14 +102,15 @@ config RISCV_ISA_SUPM
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
 config RISCV_ISA_SVNAPOT
 	tristate "Svnapot extension support for supervisor mode NAPOT pages"
 	depends on 64BIT && MMU
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The Svnapot extension is used to mark contiguous PTEs as a range
@@ -95,14 +123,15 @@ config RISCV_ISA_SVNAPOT
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
 config RISCV_ISA_SVPBMT
 	tristate "Svpbmt extension support for supervisor mode page-based memory types"
 	depends on 64BIT && MMU
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The memory type for a page contains a combination of attributes
@@ -113,14 +142,15 @@ config RISCV_ISA_SVPBMT
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
 
 config RISCV_ISA_ZAWRS
 	tristate "Zawrs extension support for more efficient busy waiting"
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The Zawrs extension defines instructions to be used in polling loops
@@ -139,7 +169,7 @@ config TOOLCHAIN_HAS_ZABHA
 config RISCV_ISA_ZABHA
 	tristate "Zabha extension support for atomic byte/halfword operations"
 	depends on TOOLCHAIN_HAS_ZABHA
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  Enable the use of the Zabha ISA-extension to implement kernel
@@ -147,7 +177,8 @@ config RISCV_ISA_ZABHA
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
@@ -161,7 +192,7 @@ config TOOLCHAIN_HAS_ZACAS
 config RISCV_ISA_ZACAS
 	tristate "Zacas extension support for atomic CAS"
 	depends on TOOLCHAIN_HAS_ZACAS
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  Enable the use of the Zacas ISA-extension to implement kernel atomic
@@ -169,7 +200,8 @@ config RISCV_ISA_ZACAS
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
@@ -183,7 +215,7 @@ config TOOLCHAIN_HAS_ZBA
 
 config RISCV_ISA_ZBA
 	tristate "Zba extension support for bit manipulation instructions"
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The Zba extension provides instructions to accelerate the generation
@@ -191,7 +223,8 @@ config RISCV_ISA_ZBA
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
@@ -205,7 +238,7 @@ config TOOLCHAIN_HAS_ZBB
 
 config RISCV_ISA_ZBB
 	tristate "Zbb extension support for bit manipulation instructions"
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The Zbb extension provides instructions to accelerate a number
@@ -214,7 +247,8 @@ config RISCV_ISA_ZBB
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
@@ -228,7 +262,7 @@ config TOOLCHAIN_HAS_ZBC
 
 config RISCV_ISA_ZBC
 	tristate "Zbc extension support for carry-less multiplication instructions"
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The Zbc extension could accelerate CRC (cyclic redundancy check)
@@ -236,7 +270,8 @@ config RISCV_ISA_ZBC
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
@@ -250,7 +285,7 @@ config TOOLCHAIN_HAS_ZBKB
 
 config RISCV_ISA_ZBKB
 	tristate "Zbkb extension support for bit manipulation instructions"
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The Zbkb extension provides instructions to accelerate a number
@@ -258,14 +293,15 @@ config RISCV_ISA_ZBKB
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
 	depends on MMU
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	select RISCV_DMA_NONCOHERENT
 	select DMA_DIRECT_REMAP
@@ -275,13 +311,14 @@ config RISCV_ISA_ZICBOM
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
 config RISCV_ISA_ZICBOZ
 	bool "Zicboz extension support for faster zeroing of memory"
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  Enable the use of the Zicboz extension (cbo.zero instruction)
@@ -291,14 +328,15 @@ config RISCV_ISA_ZICBOZ
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
 config RISCV_ISA_ZICBOP
 	bool "Zicbop extension support for cache block prefetch"
 	depends on MMU
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  The Zicbop extension can be used to prefetch cache blocks for
@@ -306,7 +344,8 @@ config RISCV_ISA_ZICBOP
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
@@ -348,7 +387,7 @@ config RISCV_ISA_V
 	depends on FPU
 	select DYNAMIC_SIGFRAME
 	select RISCV_ISA_ZVE32X
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  Say N here if you want to disable all vector related procedure
@@ -356,20 +395,22 @@ config RISCV_ISA_V
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 
 config RISCV_ISA_ZVE32X
 	tristate "zve32x extension support"
-	depends on NONPORTABLE || m
+	depends on NONPORTABLE || RISCV_ISA_RVA23 || m
 	default m
 	help
 	  zve23x is a subset of the vector extension. Can be enabled for minimal vector support.
 
 	  Select "m" for boot-time detection for portability.
 
-	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE
+	  or CONFIG_RISCV_ISA_RVA23.
 
 	  If you don't know what to do here, say m.
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
