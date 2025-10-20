Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77176CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX9U0onxIUOReY06kdtEWG8FMGLqLXZzNxzZivA4kAM=; b=KH0+RkkTVVZwhy
	8OtrECN8TG7mbQLnHithk79KXbNLjCPfWJbVprxMjdSgeD1AxGBxyTgI0EupZqkXjtPgQwH1sw/bY
	zB1FIY0Pr1VWS/UlBXcmFVvKOgfWek0dM6/5LuWLwFp8RSgyupVdP4IW5Ywy69CmGjLp53W1309Mv
	z6nuk6QQEydD7NFuXcM74/kq494TJULNVbZOY3FQ61odAeoq/DEZ2L6KHNYiAOACJcZFnv+TZJjzx
	EHqDkKb5VFQy849eXPieFoWdHbHmCPjSzTMirb/u1VhG2cfeNIPAi2Oj/4zoOcpNA4dTJYeGVY4u8
	QLo1xL3CsefDV8SuRF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwsx-0000000ExZ5-0SE4;
	Mon, 20 Oct 2025 20:53:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwsv-0000000ExYF-2aS8
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:53:42 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-782e93932ffso4105093b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993621; x=1761598421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=LDxKPzDG8T+diJxBjp4y1DkIqA5/GlXl7sytoY2HpehOCNR8VYdZ4twr52asztotA2
         mHj8K7kFjrHX6ecZ0LxSQubyD3auXMIrXxQOLO1k3kkvzc4/YhHuVVC0Po+yogAZzB0A
         PR5HpowLDNH8ZKWIuBb3vikOgrNhAx3R9tx/xbeb3esrIFqfuUHALvjp/conEUtxkgPx
         YZvNYvr7ybwdKgwCPbtbE4/UWQyu3CEJfgMXlmTJXoETSN/Eskz+dNuxrxXEtvkmfEbf
         Ect9/4vf8c7FC01vX0okDiPQ5HylD658z16tLUB5JW+3jVyCwF0ChdTz4z6AVBq2AALl
         9OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993621; x=1761598421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=MEAaZF9jHN5woO+KWfUL7VoMdKBc9Ymr8sfVV+TfDMDOYJaR7PDnpnpDTJ/GY73CUv
         RiyR52cSJ8HBppIHuaCDm3wo/TTljsnemJtqQ1vMKu7Xse0K2Iuh1Bo22ky2xJhQU7A1
         xH3UEMGkfDgDl1PAJ6z0pZwRBdvb8j+mZZ9OkgGdgbxk6+EqCs3/8tJl62vqPvhi9CwY
         HbAo4+7zog8Pk156jQuig0ikKatieWWk2ftiiCLuATsnqvgwYTg3dSbe5AIPCl5QSzWE
         DBDZi76pORDLA/Wkq8YTFMBDfRTiLaEdCIc/GVI5mMWWiDWAGZEW8A765YI17l53oNtc
         q73g==
X-Forwarded-Encrypted: i=1; AJvYcCXXKt/zxuZfV0KHhBJWf+PMzbbnebJ0Vp+rVwz0/Us2ROaW9gYEFGdcAiPeqQ8RW8MSesfEwpCIe+Vkyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Su/XBIw7i1W1CRClLE5HCTkXj4OJDmRHnBMbtDYJWtrCmHbC
	QN4C04zbqrn6dMBeVSLu4KkATOm/Jmg5ZuLmoKwTM+Zz0T7WZ9+qUjJtbdvJSqjVMXc=
X-Gm-Gg: ASbGncshJDJFVZNTfC8tQCtoMMNw/U4+5plivPhQI8y3vLWhJ4756dvW5yVdgOdU7by
	6VM+MqVYPE/HD1kFrEfyKoxJmlsfJPKAIZKFRlH5IZNcVRBZQIc/mUjS7HYxL9cdAMOrA932OMp
	7ThThk3791py7DpjKEfLbm1Y25lADY0QN4NHk0Amh5K6MtsJg0h+bRjve0qtluxMFLa8d5vurC4
	DqfHjDWUfFpwsEdLjQx7a6IOGdyX0iZhtVLwztrJXMJnBPwZzsVoFVhnbhPdLmAC4hF8cB78vgG
	U+bRGP4l3a9H7G4Slmp0t2hN9SyxmjqOsZLnNsEbYvl+uP9F2TLV24P0OCKnGkTUSMyi4uhzUc4
	g8QZTE9j6aue2LtxuHwUR0vHTNvnspDfLxQMfL4SAwARIlfOvihzN53OwEEMqzI5Ks4KkZRwdzG
	1UK0QX6sQ3OQ==
X-Google-Smtp-Source: AGHT+IGB6G0bjj0maMKHmuua0hMqc4EqHyqktS5DWO/T8lTTtYUZ5oM/r59RE+hpsUE5upyZQqaDWw==
X-Received: by 2002:a05:6a20:72a4:b0:334:974b:6e0f with SMTP id adf61e73a8af0-334a86256c3mr18865281637.40.1760993620849;
        Mon, 20 Oct 2025 13:53:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:32 -0700
Subject: [PATCH v22 03/28] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-3-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_135341_684369_505CC979 
X-CRM114-Status: GOOD (  15.28  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 12 ++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/kernel/cpufeature.c      | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fbd0e4306c93..481f483ebf15 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -150,4 +150,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..7c4619a6d70d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,8 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZICFILP		100
+#define RISCV_ISA_EXT_ZICFISS		101
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67b59699357d..5a1a194e1180 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,6 +274,24 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -461,6 +479,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
+					  riscv_cfilp_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
+					  riscv_cfiss_validate),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
