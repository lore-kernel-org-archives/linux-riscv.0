Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B858DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujyI2i1DwUlkqUGh8yaMTgKETft4KJa0IHqyiEZolDU=; b=duP0YiqBR/XfEd
	3APJdec6OiqFwj8MSs6TYlwYfSy7KV/QS1X5SPw8Tq4eaAr2LkIxVjJvGMxDpLKXoTk9drtAquEX4
	zy7pBGLJStHFBY/avEuFx/lmDagaA6WGidWpa2DVx+7V1yM9gZZak60edSOewK6VM8qPaTnikhPoZ
	/syWJbfwpRyDxwU1SHLV3/FmVOL1HX+8dGAZwjWyVT74bnb4LJ87d+3rkxfk6rsTZ674D/8jPHmAX
	c2hTkF193pcf/DUXmfOnUJKiCMzdZCluH5oaHaRHo0ZsefaymeFoWerDPht+HZjfkVq4jqsZ8RN7x
	ZTPgYSyBrFVxbc8GI3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogG-00000005pEW-0wgp;
	Fri, 19 Apr 2024 13:53:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogB-00000005pBD-2iLR
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:53:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a55602507a9so244328766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713534805; x=1714139605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDRrILn2Yb0nV2jBuOcECI8z5zE7jmWeMbNRJOqe+pg=;
        b=pUj22vMRhag1REdHBK4JXQsvCRs+Yc3ZxJrnFdOMKcbswlIDiY526dNJh3u2yeRRmv
         qeGczC1pyWaGY0S8LdY/cBud0UAYu3LSguMHv9BCg4MPeAR3a7tyDO/cU2fT9Tk15y/t
         qfYR1X/somfG3AbvcR1+b5CGmX/NKKhxgusky1+RNcEAZdAabyPvWu2bcqJZBi01szQI
         1KYfx5hi1uwYayofufslGD26X/xu0lQWfUe9PUjYfQAvzO8DPlXkxJ/IlXn50EAqiGhN
         ur1+1yOa67Doj1hpabtNx9JUvKnH7sFcd/PoKDNeq8t6m06ZG62gi8HSM0BQ2PXjURkE
         D5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534805; x=1714139605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDRrILn2Yb0nV2jBuOcECI8z5zE7jmWeMbNRJOqe+pg=;
        b=EOjc2XRI4jpfFZMpUNItlLh/aVoWCe7k2vYndPQsgvMcJzJMsJ0SFeDJZ6R2HLBqAM
         gtSuV259oPVzOwWM2d37/Q4ceRcKbllTGBVTJ5NGuexjIHRZJEii+TdTpEb0+WWD/1Bm
         dTruyQNBgupxq3QVUnHKvyr7LaFEz0hYtRDB8jaAXZglaCXFk4wKT4bGswEmTQxqjUf0
         FUIGG0YtX5jSPv50EpedGwD7ZRC3ORAWvOoNqVH4VSqvFru+Lwt01jtEi/9bCvSYVZ1G
         Y1zN64V9QEmuImQ5mEfl+LlUg3LqdTqovMqwiE0PnwxlJnJcO2flAlE9u18dv2diH5bz
         S72Q==
X-Gm-Message-State: AOJu0YxfIxppJdzWgcp2+W6nzP9Kl+cLCK59xrddFgSwC/+XsLLxhGsh
	Q37V0UIXM4XqAkRY67VZ4f1wo8FE4KNfZw+6n7KwOaOyKW9LSnkC8qiLU9KuVQYU5QC8cYOt/a6
	Y91U=
X-Google-Smtp-Source: AGHT+IFARVA4xqpRTy/M8TR2k0UEp7aiefGEX5Dkgqk03Yuv7B5CSdipP6x4sWl7IEmqFu/rmB4pkQ==
X-Received: by 2002:a17:906:a24c:b0:a55:59e6:13f5 with SMTP id bi12-20020a170906a24c00b00a5559e613f5mr1771899ejb.26.1713534804765;
        Fri, 19 Apr 2024 06:53:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090624d400b00a5575cde7cdsm1948711ejb.220.2024.04.19.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:53:24 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v2 1/6] riscv: Provide a definition for 'pause'
Date: Fri, 19 Apr 2024 15:53:23 +0200
Message-ID: <20240419135321.70781-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_065327_718666_597C5303 
X-CRM114-Status: GOOD (  12.15  )
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

If we're going to provide the encoding for 'pause' in cpu_relax()
anyway, then we can drop the toolchain checks and just always use
it. The advantage of doing this is that other code that need
pause don't need to also define it (yes, another use is coming).
Add the definition to insn-def.h since it's an instruction
definition and also because insn-def.h doesn't include much, so
it's safe to include from asm/vdso/processor.h without concern for
circular dependencies.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig                      | 7 -------
 arch/riscv/Makefile                     | 3 ---
 arch/riscv/include/asm/insn-def.h       | 2 ++
 arch/riscv/include/asm/vdso/processor.h | 8 ++------
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..7427d8088337 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -639,13 +639,6 @@ config RISCV_ISA_ZICBOZ
 
 	   If you don't know what to do here, say Y.
 
-config TOOLCHAIN_HAS_ZIHINTPAUSE
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zihintpause)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zihintpause)
-	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23600
-
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 252d63942f34..f1792ac03335 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -75,9 +75,6 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
-# Check if the toolchain supports Zihintpause extension
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
-
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index e27179b26086..64dffaa21bfa 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -196,4 +196,6 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 
+#define RISCV_PAUSE	".4byte 0x100000f"
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index 96b65a5396df..8f383f05a290 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -5,6 +5,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/barrier.h>
+#include <asm/insn-def.h>
 
 static inline void cpu_relax(void)
 {
@@ -14,16 +15,11 @@ static inline void cpu_relax(void)
 	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
 #endif
 
-#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
 	/*
 	 * Reduce instruction retirement.
 	 * This assumes the PC changes.
 	 */
-	__asm__ __volatile__ ("pause");
-#else
-	/* Encoding of the pause instruction */
-	__asm__ __volatile__ (".4byte 0x100000F");
-#endif
+	__asm__ __volatile__ (RISCV_PAUSE);
 	barrier();
 }
 
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
