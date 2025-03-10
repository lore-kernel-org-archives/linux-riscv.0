Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DFBC28B2E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTSA1S2Hfv043WtYxe5yIlGs5CoYWlSZBQAAb1H98Cs=; b=PsURrSFlIRoeeN
	CJjDXba3HfGozbnKi0P4EZ5yrMWkttKWQtsPgpa8pQq09ThOP4JLqQ/m6G7ewDn9NnfwGIAdxYjBH
	2OyyoVdwWIc0+5JAsiGNJ90Et/sNwEuKAB2BK+sEhZBHRaAewPV/g2tLt4/+zMrhVKXGP0mLq3q5O
	EprJHVLS5GSiped8P+l3087IwXU6rKT+5T/62gSprsWIQmqGVNwY5/GThKb9sL27yLDBmLWHbrY2k
	t0IexLiebGBEfSfLYrvPYKDVl3A6rx4jB4tfj8uqnl+fC16EkFWRC6behD/V1MDyljHOzaPPicR5P
	L+WezLCFvR5TU9X3aP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfGs-00000003DF8-0xQi;
	Mon, 10 Mar 2025 15:42:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUo-000000031UW-45ec
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Mar 2025 14:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dbqILCM4sqAsqnZWR3n0haWRm4rdBukz3/+QEOiXjzw=; b=VIbKnH23qP/e+AXcOM2C5AVrzy
	BtLUacY6vmSkAsy/dTIQlLx7DF9cmVzETba0s8qCnglL+/slNEXA/C3k2RLp3X/YDCcVBOcffdPm8
	FVazuAV12EippDNl7lvVIJgyFDxsGaNNEdC9WDNTyZE5ZV9MFWTCWi5vM8PL49VHnAU3L7uOfF7Bh
	TnQtEKuYHBPh1AM/6j6Ot44coyWIV8K1s/V2/b5+/380FgY2u9buGit3qxz13OBgVjuGXj9c3GCD3
	rpWOzjwCn1UVkziL7MqxeH6yV7H/DbjsknCUQVhy4o4BAlXRCwbWJjQ3XsbluqmJ75vItSGsAuNRW
	xdcY8pUw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUl-00000001sEs-1jKJ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:52:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223a7065ff8so3861995ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618360; x=1742223160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbqILCM4sqAsqnZWR3n0haWRm4rdBukz3/+QEOiXjzw=;
        b=Mwlo1YtuOzVwDu5HBZ4sKeG1NNQdBrpT3VSlsBQ7dDpTA5+hJychJvaoJbapQuoGYQ
         yPRXNDurVmSdkRJrQSS8cdNjECoDqTXAKm9LChfQMtT+GYP3yfKyNNSXaBf54L3mzG+4
         OsywJjoshzyC/yfyZST+EduXDeAtNGLTNyadHeyQLCZzRRxqppRz8VH3Ma2DhIQv9gm7
         uzSbNn+D/+zNG6mJbN+9YlFs/gQxVdwkoXj2rBeH3NQb6sxBV3MO5SQ6ieTSNpLEkvCW
         MeW0pwfjMcElgPxYf3cZhd+aV4tytvm/K4h4CloADNSgO0cf1UaDLKyOW3+gBqhEPo/d
         xQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618360; x=1742223160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbqILCM4sqAsqnZWR3n0haWRm4rdBukz3/+QEOiXjzw=;
        b=mhdKMjp0P6IHK5ZHIFmMbsgmEO7aJoCEfyvF1yrD9sA4H94iaxPObxKSTdnjgjBcbp
         DdyYot8/P3aCJnFd8fOz3Meow2KAd+Ecv8VxOqL2SDqn3yn9rejBprhYCOUb1JAWbjrm
         eCcBK7OOqlafMDVqbrMTIuR5SwqaNg1Tnwuo2m4Mc+Ca6uBOYcr7TxIlE4DjefGBrw4R
         mFuoIzb23doTOg+qA51xScAcVT06zfJuYxIH5NGakH3bNU58ehkFUEiA/ZDZTXO3Rsxm
         czeI7zz9rF2g5ymfFy6hU0YGXROTlpZCga9OxK/NkkdXs1ZzoXi3Z2WfsEiJYTGDdRqG
         DQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV57JMUR88wDC/tWmA0kX0Hdmb0XJdz+hLJkL7BiwZ7bTc7jOFCPGuL9Lq7R70J7enKCMboRBoCJqNVOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdkI6Ad/UyKmpLAqLgCMG3Er9plh8JfW7udKXzgWgTlByNXtlY
	kNKspTfXnSJfWAvI+m6uUUo/HRfXVA0+orkWmBtdiB4GRIar7X1YY8dLvdL+7qo=
X-Gm-Gg: ASbGnctPI0FJGqus64Jq1yiie5qCkYbfSF2t4RRGnv25OHxMigP358C7fQjyszTSX1w
	jxNOJoMb9Fkp16776WvffPfFACEBdln6MvMpf19BqLkr4voHWSfdoWzAKOyoFlQOP2S5P10YQ9J
	zOhsTPbUnNFWC5aPtkEtYiMTygGaQq6BKnsroSYHVnD4rlm8o3RZehFbEkvxK70vfuYvPV9Wwlv
	b9xTVMpz81wLJ8IY0wEam+2cepQney1Xp5QMmQHgaFMJhk3uv5EC7Drml6DlydLI31bqVkjYM47
	7GgKTrwRm7xK0ulyZe5mZ6hb5su5GbuExCmHdyUB5E/GAleNoM447H0=
X-Google-Smtp-Source: AGHT+IGingfz3mCoLXCx4AWjWHsD50K0dzh2NK7v+KMvVV2K5wL6QO4M0vSkH0GvDvftQkvXnd4PuQ==
X-Received: by 2002:a05:6a00:b4d:b0:730:8a0a:9f09 with SMTP id d2e1a72fcca58-736aaaaca0fmr22178030b3a.18.1741618359953;
        Mon, 10 Mar 2025 07:52:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:25 -0700
Subject: [PATCH v11 03/27] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-3-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_145243_668943_F97905C7 
X-CRM114-Status: GOOD (  16.35  )
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
 arch/riscv/kernel/cpufeature.c      | 13 +++++++++++++
 4 files changed, 29 insertions(+)

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
index c6ba750536c3..82065cc55822 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -150,6 +150,15 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfi_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const unsigned int riscv_zk_bundled_exts[] = {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZBKC,
@@ -333,6 +342,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
 					  riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
+					  riscv_cfi_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
+					  riscv_cfi_validate),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
