Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C831C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TF2M/Rf9ssSw8WItbUQtIhLBCFDYWYfhTj7l009lJo0=; b=SZVaratQX01OwG
	qSLQbbRwIvHhy9kITiHmiveAzhy1wXWtbx8JvS8mM3MsoAR4rXkEkYIltlUq5Qz7og5vW2D/Tajqa
	tvRaPXwygNndblgmqYa37lq3TNPqnwDistTcz7V9xpoThoCErjcst7/8LJocqWwixJfHVA9YnITlI
	+Sti/rUG6OAWhtoxHRmA+lIFrUYFiyPMdj5+mr7BilSRH2yJ43bGsPQ6u/zKZ0cH2Ksyz5ISVytR3
	fjxFGIgyk5nXAQm89uxrbfF9Mb7GhjpphaD95DtoUm713nGPI+iFlcQ7UGuUKXV1VdNKQyobtMqGw
	HvGI+3rDz96pz+0XjvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEs-0000000Df5A-3emj;
	Wed, 08 May 2024 01:36:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEm-0000000Dezi-1Ohd
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:54 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6f4551f2725so3643753b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132210; x=1715737010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myHzOOjViF8S4NmNBR6ubwFIqcNqWX5HRrdoX2U4mxE=;
        b=lSJfZMtDTjr0UyAPS9XS23MGqeCPxYLQj7yPo1OaRqzgH0Dp3NgXHzVnV/47JI+S/M
         KUEW+yAXyR/xoNq3K+4l3d4S42qSBeRHn24ao5iQyeUdG6Ftoz8mkz1vNDn2kRAT7IzX
         xKoNsxposO4Foy9tW72F5MQnw6rj5VmAj6w7q+FS40/1331I06kLNGOhyJU2TDzsofzN
         jlh+ZvbbargB6g33HEbHX9b8f4KGZy1Dt8QiUfrS4i/B0M1z4bdoGMahm4t6CdFdX39e
         iObg5RNWSIUOjnMLnwl+rXkeBcJDiCzG58/UyB6OwMR4XqFLx09t4UhS9Lp4hkDM0eES
         sQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132210; x=1715737010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myHzOOjViF8S4NmNBR6ubwFIqcNqWX5HRrdoX2U4mxE=;
        b=agBwBpBU6hvXmp+XftzEi84wU8cv/aYTMbhZkl79or1bUcNvdfPiMGOe+mXyZVhpN6
         Mxva58KPWcpDGdT6IXEN4kxffvComzyh5n2r9aY3KnNkpbxwhVZcLkK865CdhUWOr3T9
         oE50pA898LTZNaZS3ngm3O8A84ZbnFn34Ose6bXNwgXQDKI1aUWTWpmk67ZFwlUcotbj
         9GHXe1qJvhlpiayJnBV0yq3d/AsOpF/B585PSUc4NKaBDBCJFCO5PWa/aBQzdfbmSHs5
         dipf5+JBff12UKBooi0cs9/bPXHEW/Y5SfDAS4X5zRJLmNKezQB+TRqZL0BoJSa64kaz
         Gc9g==
X-Gm-Message-State: AOJu0YzEHy9dME47Pd9cHHgz9i0jtfqvkdAF6s8zi3NhISkkaoeQD4BJ
	hx5tastZuE7k5gCnSApEgsm2PfIKFt1/5c+NI8FHTNBBeOF4iMKiDyZbXFcvK+8=
X-Google-Smtp-Source: AGHT+IHmyiekyum4bwoOJjosIJw7Z4DfDemwOXxUCyVbwuXuMPDsZBlduhwLXl3Z+XO6EPfAoMsxiA==
X-Received: by 2002:a05:6a21:191:b0:1a7:2ceb:e874 with SMTP id adf61e73a8af0-1afc8d5b8fcmr1553729637.37.1715132210381;
        Tue, 07 May 2024 18:36:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 May 2024 18:36:32 -0700
Subject: [PATCH v2 6/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBA Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240507-compile_kernel_with_extensions-v2-6-722c21c328c6@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=3295;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Ue5TDLMRl4Jg133jL9t6n44Efl7WVoijxTwvOh6lOb4=;
 b=VPIFtHfzr8Xor7UIxI0uyPtvmdLuA5naS2Aa3xz4lMr3TZ261O7CupIAtnVu2wEleN1W4S7jL
 MeRK4vLEM5jDcGk96yhQiSL1n+P1wTsp6mS9ZW8caczG/bll99sxiRn
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183652_492195_DCFF7A42 
X-CRM114-Status: GOOD (  15.36  )
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

Zba can optimize kernel instruction sequences. Add a config option
PLATFORM_SUPPORTS_RISCV_ISA_ZBA that allows arbitrary Zba instruction
sequences to be emitted by the compiler.

The existing "RISCV_ISA_ZBA" option is repurposed to be used to by kernel
code to determine if either PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBA or
PLATFORM_SUPPORTS_RISCV_ISA_ZBA has been set.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.isa | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile    |  1 +
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
index 49bed8c75263..e7f28dc44137 100644
--- a/arch/riscv/Kconfig.isa
+++ b/arch/riscv/Kconfig.isa
@@ -186,6 +186,58 @@ config PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+
+config TOOLCHAIN_HAS_ZBA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBA
+	bool
+
+choice
+	prompt "Zba extension for address generation instructions support"
+	default PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBA
+	help
+	  This selects the level of support for Zba instructions to be
+	  built into the Linux Kernel. This does not impact whether Zba
+	  instructions are allowed to be emitted by user-space code.
+
+	  The Zba extension provides instructions to accelerate a number
+	  of address generation instruction sequences.
+
+config PROHIBIT_RISCV_ISA_ZBA
+	bool "Prohibit Zba instruction sequences"
+	depends on NONPORTABLE
+	help
+	  Regardless of if the platform supports Zba instructions,
+	  prohibit the kernel from emitting Zba instructions.
+
+config PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBA
+	bool "Allow Zba instruction sequences if supported"
+	depends on TOOLCHAIN_HAS_ZBB
+	depends on RISCV_ALTERNATIVE
+	select RISCV_ISA_ZBA
+	help
+	  Add support for enabling optimisations in the kernel when the
+	  Zba extension is detected at boot.
+
+config PLATFORM_SUPPORTS_RISCV_ISA_ZBA
+	bool "Emit Zba instructions when building Linux"
+	depends on TOOLCHAIN_HAS_ZBB
+	depends on NONPORTABLE
+	select RISCV_ISA_ZBA
+	help
+	  Adds "zba" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in Zba instructions in the
+	  Linux binary. This option produces a kernel that will not run on
+	  systems that do not support the Zba extension.
+
+endchoice
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6b0c3a782f99..c8ec38b9880a 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -66,6 +66,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
