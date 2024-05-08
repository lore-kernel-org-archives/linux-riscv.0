Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3797C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cbi+StZ93cu4fYOJHUE5VyTmQYfikcHP/N9iJ1d9gYs=; b=oFlh4DzMHO7YXc
	L6fRJrrgOu7fP9LMKHQJbRObmzzopZluw3FqVuW5RZL1GzJ3zpsuz6PYbU0WgDWBzVP7RwGaKTi0x
	/eaCDBE64t/whqP3zfLU9cEeuHbr0kel1jwGCIpC/xIvoRCP69++xtModIuVjZ8qXg7PIyaXZqGjt
	6DO/dHFuLVgyz0BsCuloi1oX1gw4RG73efXF9oI0nenfyDAnTqRbmbieZn0WsMJQkJv8lSiuodnTT
	cr01vmgK7sXCOhKcXshOekjpWHAI9NcTcEgodo1P9xj8Gmi+3bM+RvrBWGuKJZep7nZjk5wTuARRj
	yZA3SdxMd/Yj5jVhochw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEt-0000000Df5X-3CaR;
	Wed, 08 May 2024 01:36:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEo-0000000Df0g-0Blc
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:56 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2b4a7671abaso2593231a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132212; x=1715737012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G63nKFkjY3qHnS0X1QIzt6sf9vbSpbh90Xj2nxjAK3E=;
        b=IChYqDQqs0DVbwJnxOMrOAHEx6suurBzUq1N9HXLWRh3B7wZ7CAJLv3ppJqTcsfIf7
         DHQL9f23Yic+6AE1yWoUeBs03bd2/QVv9QM237Hnc+WMR1fYsQHL9uLj4z0ukRDIf/mW
         /Q8FnIW03cxdCJ3flv76oTKGwzGPFbgZjxlfcb2H/nDMsQbSdPdsY0/ILDctKjJFjgWW
         rMGMl4T+JHCdpztnrVXk1VkOwODJb/1uDHe8QX/Va8FdA5KWlj/JBAllGK0QdPDKSvJQ
         rARngbmVnoB2oJ+yglcn57Y21elNOUrK8L7xoVVZ4VTplGaZDjCJCtAaIFmHWRUYNETl
         ZRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132212; x=1715737012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G63nKFkjY3qHnS0X1QIzt6sf9vbSpbh90Xj2nxjAK3E=;
        b=QKZzhAQe7sLbZmS33sgcvB9JeVC1RYQhebYQ3jXuZhABxBllZZJ4yN9kz7AhmuLaKX
         OpKG54G/E9SEI1WkIxueZ5/UfpuPrb+l5KMmpi38tDFd3yn8Aqf6MbJRYhC+LIn2bpZ0
         Z2kYERQfKEBsUVX7x+RGxrPVvWb2EVtdVrf42ea3cTMbB0HWfaRx8LY/4wUdgdtLgwE2
         UUVXjGkKENzVnWjJIcpG0O3QWuEGbCifipyyOfK4D1ehQp+Fz++/QmFQm66C9IUNJtia
         v6hPBdlGlzYFToW50233wsIIzGvrOJDal4eEhNG+DdCPYjTsri4GlO7iqDFHfgYakdYX
         gnig==
X-Gm-Message-State: AOJu0Yx6JR0DL9qCopl7qT4kxDgaJZO5OdHTRSVukcUWel14eLViFX63
	YVgr2lvosn74CJ3MSEXZqa/0ycco/fxHby65dr5ZOqF4ycRm1sJ01nOecQbs/DRJi+KoWdJw7L8
	A
X-Google-Smtp-Source: AGHT+IFiGPyl3zNyE/SYLjw5BlcdAyzafc6IKgnN2PalwWvftlru0VCVPMVwGkF+0UEGKI78AFsrvQ==
X-Received: by 2002:a17:90a:5d06:b0:2b2:7c42:bf6e with SMTP id 98e67ed59e1d1-2b6165aa078mr1175508a91.12.1715132211950;
        Tue, 07 May 2024 18:36:51 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 May 2024 18:36:33 -0700
Subject: [PATCH v2 7/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBC Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240507-compile_kernel_with_extensions-v2-7-722c21c328c6@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=3248;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=mhWqJj1RP0LVjsRT3VtWySRs+UTs7hL4pCht9UF8zQ0=;
 b=sOz5JQJkzaPJCxTxqkvkSdeiQG9Ioekkp/cr6I56ZbEo4JJzatL3p2LLjxH4sfk9h/40qVxWB
 OEQki4PEQ2ECjcdqQ6LE0ponkjrcIiw/2Oy+cAKFQ+URoJ4CqY/pRsA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183654_426661_D8C42A11 
X-CRM114-Status: GOOD (  14.56  )
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

The existing "RISCV_ISA_ZBC" option is repurposed to be used to by kernel
code to determine if either PLATFORM_MAY_SUPPORT_RISCV_ISA_ZBC or
PLATFORM_SUPPORTS_RISCV_ISA_ZBC has been set.

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
index c8ec38b9880a..57457d15e9a4 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -68,6 +68,7 @@ riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C)	:= $(riscv-march-y)c
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
