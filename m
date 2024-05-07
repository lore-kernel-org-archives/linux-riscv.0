Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32F9C41513
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 01:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FITktW2B+CzHd2xNaO/nDJ7RvZhUNlijqsDobvPahrg=; b=V1tMFNdJBpbDQE
	7GhelhVK9j+Hr5y++LZBQIiUk09D+xQu7g8MdqpAzRXCnhR81y8yy+iPS7VdMcnCZBzl9pe4EvVv3
	Ez3w1H5k83EJyiqLs+MECRqU80mQOgSgjsgCJCcPVlDN0PaOyVJxvdIpaHrVCrcttCdfZBiY8Cfwp
	gL3Wm/gkRSXQfjGhQQGOoBUY5w1kgunf64esHf6cs7tXgKrlD+QXsm4A4xAcnbu+v2qu9VjAKf1wQ
	fEdTR8/04b0YmC3mOaxWtRJ6+ClRRUFy9KnIGzoCAiOjDLSkNZBf4JMhY1vgu23IMdtW8nQjq8O+5
	7ZJKaQNB5u0mIUcKEqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r8-00000009H79-2KkR;
	Tue, 07 May 2024 01:42:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49qz-00000009H1Q-3k6J
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 01:42:53 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1edfc57ac0cso12948155ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 18:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715046169; x=1715650969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXKXTMdz9nysIbdQG1zSA/joXoCHsq9b8pUEu+GCNMk=;
        b=wsTc15kHVcM/bgagqQCheYYSD+1X0IZa88OGCoQ3bET6rD5GLR+wwH/3Lf17tYCuj5
         7WQcM4R6eBT5FTxm8dSX+hc+7XnjL0pNvmulinIaGdf0TlqQt7zLsmtuty29rTaCWWfW
         WhCcQBu8U9djgLMoTgRQm3sAC9EqZLf41c9p66PJYuMgER6AZ9cuDyfzU+PfZ+rbJAgm
         ble3GwBvr476cCZtthR7XEHYaReyHTll0bYqru27Xa5KpFCagccgQukFnfj9n8H6ormM
         VgghxW+t+fqhnbiajtcwPX1MFuBZSxUOnZRfydn1En9QsTihaNbPD5End28TBju9X6Gj
         DTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715046169; x=1715650969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXKXTMdz9nysIbdQG1zSA/joXoCHsq9b8pUEu+GCNMk=;
        b=KDevqHJgJqLMcB2S3MxsroLF8ppuKFNq52BxHYtrkgG5Graoq9o/+YSXxtFazOUYz5
         YlDjvZJ7i/90fHRec1KAo1I+yXDfYMqEAzlD/KIjupU1qKTYparOZ/R1I4lrTh92BI6J
         tRbhygjJyHs2njU8+xX2q8XPNG1ukUqIghoLymxhpr8UeHYCIbGkGoN9e0a/RgScwLrq
         nCUnZjFnBlxDGCBvX3msdle7biD/GlORvjnjeDIDcrjNjgTX25dJ0OSHG1HbL1u2SJ4N
         oGQJdZfnxXtZvxAjCDo1iGpM3XMfmqIJvHXIKhSRQLAojTnaZ7jlhX1U+JqgPNQa3jN3
         ca+A==
X-Gm-Message-State: AOJu0YwyIDeu0DO8NzEGjTTm/F/1PzE3zMHI8A6XuHPFn7/baRFq0uWU
	wfEERhibD2p+iMEto2gx2CSQ0mAqjGQ+DFqs/rmMuQxVglQ9CpYgy4zaJzERHdY=
X-Google-Smtp-Source: AGHT+IF6/gGCNdZiWcJ7b5sARR/Cl9CrTBBYDbYOTX+T8auqpQE7eGTz774kKNo5c4AGtbXQtPQoWA==
X-Received: by 2002:a17:903:2344:b0:1ec:2bca:5aa8 with SMTP id c4-20020a170903234400b001ec2bca5aa8mr15677736plh.6.1715046168896;
        Mon, 06 May 2024 18:42:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b001eb3f705ddasm8915311plx.255.2024.05.06.18.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:42:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 06 May 2024 18:40:47 -0700
Subject: [PATCH 6/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBA Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240506-compile_kernel_with_extensions-v1-6-5c25c134c097@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715046158; l=3133;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eQ/auliW0EgsQFJFA6Mf9gTsQnbW6DmSQUwyvcEerUY=;
 b=vVbDWRSZVIHXc2jHg45d5wTT9RTY8XfHDD54NysNRPTWOX9vMbhQ8oCTTttPVmWoqwt9Opkb6
 cUbZF8aoSHaB+t6aIHAZdk7a8PV5YfPobXzlJvvLJWdyZ9gtfm0r4tO
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_184250_509817_B3343659 
X-CRM114-Status: GOOD (  13.95  )
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
index 934e20de576b..0ab4cc5dfffb 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -67,6 +67,7 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_V)	:= $(riscv-march-y)v
+riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
