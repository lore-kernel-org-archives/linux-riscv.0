Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40F8C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujyI2i1DwUlkqUGh8yaMTgKETft4KJa0IHqyiEZolDU=; b=lW3PiNkrPHatFk
	ozOn/unuYISYaiz0XLPmJ7hAoIKVfCzqf5ZzL38XtdEROJYoQEN2ZvHvwiLH10ta9s+oDQIz6fkzW
	30XWoIwLIEqo8BwlVzW0S5l5eQRYwPk45eDx4yKOKxtRG2/8mJ6Kecsbnt3dhreGIKMCWX+npEVLL
	Dwp/EnP0S1VwJLYcvI8LP71+Cbw7wkhD2FQxG5eWLk5/P/kGeuOjZWwdq9cn4m657Ahphwyk+PSn1
	7HBasEzY7rCTkxt6Y99rG1Weazed57PB5yAdpx37NnDX0NMiOUnSkKwCPmxa5vw3bziZ4wfNpQ8Q6
	7a/NYG45LufoV2njp5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVJ-0000000C3qC-3lXb;
	Fri, 26 Apr 2024 10:08:29 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVE-0000000C3k4-3SW7
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 10:08:26 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-516d4d80d00so2629269e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714126103; x=1714730903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDRrILn2Yb0nV2jBuOcECI8z5zE7jmWeMbNRJOqe+pg=;
        b=mGNIBEjgT9EYG80SrkLvDxDVfNtPv1C+IqrcCRpcrVZkhi2O2uJ8702zx7p/XrNXXT
         XaVjlZwE3BiJeSecSdqTCSKGJYqZ9CZsgb72Ci4JiJZT7vA039sMmbmsFcxgq99Me8Jz
         0plMtjhZBV73IEicBDvYEPXbMeSgdC/ZI8xvxkS6QjVzpR8hkYSYAelkinrrHrpjaGma
         ooq2x/i/V2xiGN1zAt0ea4sauR8rB7SDGjZoBePk9jihaM6mjToOGnuXRo5dngFkSNAz
         JoBFc5Gm/UBjIoDezEurNol+MbrcSAshNBaK4tx/tZlhL8EBm53BruH7AkWSVw7VEveG
         EV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126103; x=1714730903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDRrILn2Yb0nV2jBuOcECI8z5zE7jmWeMbNRJOqe+pg=;
        b=WCbLrRWUThwqoBBPJDTUUTGuelFwSiG8ICnBtdLHnQUC4B42whKxWqI+8AgMCF3nlR
         eHHfh7UgsAhGmDrmKCyAu5UEzP1X1x5+vLCMUPifpDgnZR7hqzlNKIPCgZIXdXVbB1uX
         RK4sIHtEeMS+MJ5QV4ibpA22dc+7q0L0A24VK3M1dhSuPn/JJef/JdwxqJxsM4JOsdBq
         Hi1aG9Fb/rwtwyaIAuSkXegPbNu1pZaa0V7i6+4fE4wvU0HJuxPznBeKUF5S73AUhWq7
         3Sp6IeE/bQsJrUcSN3/oC27SzsiMOxFxAGxIy7JhOljqwWLPczvLza+RgWcNRVlLYBor
         kREw==
X-Gm-Message-State: AOJu0YxREsO2rOIROZB+MzKUayVjh58BpQZ4QOVnzzFTxIjaHEt51PoH
	R/fATE7eqxnMLxrPGH3wm6giocWlSMxHCRRc87HszgrH+nE/NQIOowpTiyxne/A9/Dwz3vVlres
	XH/E=
X-Google-Smtp-Source: AGHT+IHaD1VcRg+G2d6oDu3yQ2MU2lFuL72a9rslNopWREUEuF0Qk9e1stsspq4ExuKqi3Q2okHOQA==
X-Received: by 2002:ac2:5dd4:0:b0:51c:b95c:910c with SMTP id x20-20020ac25dd4000000b0051cb95c910cmr991564lfq.29.1714126102613;
        Fri, 26 Apr 2024 03:08:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id iv19-20020a05600c549300b004186c58a9b5sm30019533wmb.44.2024.04.26.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:08:22 -0700 (PDT)
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
Subject: [PATCH v3 1/6] riscv: Provide a definition for 'pause'
Date: Fri, 26 Apr 2024 12:08:21 +0200
Message-ID: <20240426100820.14762-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_030824_937613_8EF1ABED 
X-CRM114-Status: GOOD (  12.08  )
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
