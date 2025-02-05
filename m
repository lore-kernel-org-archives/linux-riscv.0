Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE73DC0219C
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ch3SOYhf0Xz+GEYt937GpoIpBnGh5moWbubsuIlLl/Q=; b=R6PsNUYiW4GQnH
	Er6teThkkG5FQxXTKzu28JT21IqT2ot1ZsNbUO43mMHvl3ze3okvalL+OfIR+TU4wpRQ1YzO8Q6Xo
	AcZVmmWbNkcZNn7jvozX8Ou/0YsxCxr5ZKw6+0D/qVbM/6mTkiObC8Y8voKqpevsF2JbOG+hEplv+
	MG2yziyoC2Dknjq1qzs/d/ccNdRiydsc32uDha2FjmcDXCANPAySD2cYuRdMptktlJqd5Q/Cd8hRW
	rn5D5Z/SQiI+VKnuh+M11Gcy7hXM/t5tL0Nxwte0kKKMBzLdF8uRD7cCVVBUF68X1ETOl588Aui85
	bO1toz+N6cDIIyF0iUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVBw-000000028UJ-2YPw;
	Wed, 05 Feb 2025 02:31:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU76-0000000218y-2YWK
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-216426b0865so109106865ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718520; x=1739323320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tcFAXVAWiQrY6HWFsnaHkFz6kw+io7jzixAAtP9lAg=;
        b=FgparNrxODkcGfOKozrWEohGYS4O13CPoW3/LSApucsjg2Zys43Gtd2MIVR4SdzEWv
         cl7FyqyyMc7lfTzHjAljf8pL1nTmTC5aLYIMEFBhn37qjBdpfYjOSBJW246sNr2B46oe
         6yoPWawo3WGxdaDzLkaITjit3qKqaagZ4j7JMq+is3AyBuyTiZe1h8V4bu+vc5Cc9a/O
         SsmScKijfTrBslCnnwNSHOQaO/n4jPtwkBt2qLO65IOgvIGEqJGotjCvw9iHxduxfSxS
         NESBR12wMgjpsyiTilhxXgevKDXwa+VoppV6W8B3BOn8RM5HSLj2JlNkdOA2hSfWOlAc
         vmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718520; x=1739323320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tcFAXVAWiQrY6HWFsnaHkFz6kw+io7jzixAAtP9lAg=;
        b=jw+CJZcSGp939J6xcWCdhLZScamJG8bApThPFtvlXewS/NCkO4TYGS+l4zjENnw0/z
         sL+IQs8mzgAhy0qsQHQWqnN8dOI/lgIxeKkQkMNZMM0OCMPNX8Zppp1MJ8gNJF/9IDsI
         MQDyRy6I2K4YrTr3LqsTQ4PfMmWSPQebLEPxsSHw1EfiH/HQvJMiYqOsfrg6MNn9T0qQ
         0prz1QxN1iEST3NaPl8iBeTzsJ+Kg1eluJyAJr0NzEsVZbRmhuwLAfuFwqryfxNB8bKt
         1epVPWmswxMRO9tuV/GowcObLOBpU8dDn8lyv0TZdtmRdok1J04NYo7MnWfUESlIy6qi
         Tjsg==
X-Forwarded-Encrypted: i=1; AJvYcCWoFr4p3nEsBG1m0BesYTdEk8y4YSFN6V6yWKh34Cn/bQaja8oosJWElHgEVFawlj+iw7kqyFJeusc+Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFPrWsHN7OfF0hfS6p5uLsfu8nm3oWfhgHGOXeTxvGqt4ZCGZs
	1+UNTLSp75yT/V+7pXHcn5xrlVDmvtoPpisl0TOrT0i8R3xdpixJ/lsfnI1q9m2T4uXMdgcr/5J
	K
X-Gm-Gg: ASbGnctWqLkr3R/cAj9XUI34s/TYUTN3aJZwyNg5KP5mmZF+zEF9QbkAkHqhfYgI0IL
	cofsDL2cJoP5/yEBvoHHawmvT317g4cEzdw48vxoogNEfCtd1i7dPyLBOMfN+4Jz0Gds9cONVyl
	oce6UIhh5zfm2ED7/rnflLR2hBJijLrHEA2sMQMZY7+WxqsTX0Q0L1lxrZ5CJCJsgU1L7VWDfQ/
	mEucjvnNig0eh7IWXbl7BcrXf1RoANxTzCIn6RddmHeuBhUQRonrDH9N9fZUddn0AgNe9LEFcwa
	a40bkfOqLSPNNa0AkEoGYB4pXw==
X-Google-Smtp-Source: AGHT+IGcLpXN7H1Vb3ytJk/GwyCBkowKecTGXsuuIYbq2cDK4TUx8xLv1sxd9tib0WLuvG/ZPY9AqQ==
X-Received: by 2002:a05:6a00:acc:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-730350e50c2mr1616706b3a.4.1738718519861;
        Tue, 04 Feb 2025 17:21:59 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:21:59 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:50 -0800
Subject: [PATCH v9 03/26] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-3-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_172200_654153_CF82E874 
X-CRM114-Status: GOOD (  14.52  )
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

This patch adds support for detecting zicfiss and zicfilp. zicfiss and
zicfilp stands for unprivleged integer spec extension for shadow stack
and branch tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy
lights up bit in cpu feature bitmap. Furthermore this patch adds detection
utility functions to return whether shadow stack or landing pads are
supported by cpu.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 13 +++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/kernel/cpufeature.c      |  2 ++
 4 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 569140d6e639..69007b8100ca 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -12,6 +12,7 @@
 #include <linux/kconfig.h>
 #include <linux/percpu-defs.h>
 #include <linux/threads.h>
+#include <linux/smp.h>
 #include <asm/hwcap.h>
 #include <asm/cpufeature-macros.h>
 
@@ -137,4 +138,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a..2dc4232bdb3e 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,8 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_ZICFILP		94
+#define RISCV_ISA_EXT_ZICFISS		95
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..e3aba3336e63 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,7 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/hwcap.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6ba750536c3..e72de12e5b99 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -333,6 +333,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
 					  riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_SUPERSET(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
