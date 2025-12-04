Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6193ED2A524
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulzxxIOrRM41DXxDG71PiKcn1kz7l7JpGzJbBsIyENg=; b=QIhnE8/Zv5wQV0
	panpxOuH2hCjtCEygdwS3USezKobEnEIGxme+7+rn22EENaM8JIkhywt/5Rmcy+jrlkAPnWdvKc+w
	FMJBJ/5mrSCvYbiqgvqZR0XnN52DCjvUwNogWBi/SzkTolozFFiYR6OIFVHY/TwNH0t/mRuKUKGyq
	l3lgLQeP2gHZSebCPQtgJ6Z/bTZNhpaVM44jC5yiG6jd/Bkls4hog/He560IyHcJvcfqvdbeH8fHD
	fxgDOnS4ZqeJTleUSNE39qyE01tkVwsX2waKieC/L195BVrf1HyE6YJE21GXs1loGIii4ukVsOu7X
	lzZY28BPpmP5nJ/zd+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYf-00000008YAV-0fab;
	Thu, 04 Dec 2025 20:04:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYb-00000008Y8D-2yu5
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2092614b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878645; x=1765483445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dse2BU+tFA5XFpg+kLbFKrS+f5gCoIar5kBy1XNyEFE=;
        b=Sp5XjJYv9luBVnftdVcGFpZB2wTirEE1svg3d7Rw83u0Vs2vAsLGGrezgjzpuGnosB
         GLJ3kPZ6nNNTxweGKTwhSO1+8Rnvw+eRJiNCh0aiB9o/AqfJfQ2C9aFOC/eG5rR4LrPR
         Ugvw4vP2Rj3j8rVCpZTp5nuat/Axsg9U/BcPbiyzshxkbhAvQUxPCQs1o+ZWWzre38qj
         nj2HZcr1N6KVWqADaIlNZmgU+0U8lfJXattETvh5aLcIALmIHKIxOijdV9UzogoajeGy
         Iq5VWCwmhk8sWnxxODy7rlFyp33uoMRNQGdXJhpcHybG7wT66OjmNddGjs26uSFLVaQW
         h1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878645; x=1765483445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dse2BU+tFA5XFpg+kLbFKrS+f5gCoIar5kBy1XNyEFE=;
        b=cuEsnATiEnpKqDO+6V6/eAJB9uH6Qg96nGrYTbLo7ojZA/LqhzFjzdPYeAevmLRnVD
         Q0W9EqihhK3owme/Q5qq8HNRLIhPuMxI/Jo8FAiLnVAZBegHx22OJV+l1HaTrz24VXNh
         sq7r4Ef83q9hiUj5C1POql72q78X2suDg/kVG1iWRz9OR191vUFOHiwQnDMwGhCLGUvg
         /eAQoAMLb8QEiox1MrtNrLjTPn9evYhnzcjz9gA+jGMqvJ/dDuTYyUveL39cMikfS1Tw
         tkVSLOY/seNbRmRFUq1y7XoRMpXeVCzqWJ7IjJNx/WksacZlcWVMcr8pvtZkOcnkrRyA
         8KmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+5kT0drfkmeseVg1ZaLUPvBmqDfTsgrUrVNw2BZnajb3s5suMG/FHjUayY4V6wUAZ6O+Nx+VrhalogA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNOx6V34Nagn6wZbvCgXsJEX/K53pIAl7kGJBVMjjSJV34rD93
	TipEXXrGVgACG4+ALXTseyMKEcSrU4GXQP+j+LGQ/+ouhyamxmJr65PmUGwkX7pf4mE=
X-Gm-Gg: ASbGnctTHUQLkEzYNgz8tKvghYglODdMYy/AZOrRElEcymwN5ibpdpm+y/SEIcryxzV
	2UlehJcDD6THhT4BC02nk2u4lOgMDGWEomuWwWWj9+FA32xDFZ2fJuIwt4V75cw2EaW69Yn2JzP
	GvYWeMtopCruhZMp0YEQX/hwt/E/X5OAQGQaypD/5wfYZTN3y8PjcP3wNPDZmXzJi30inIli6T6
	/7FABCwM/fvHp59Wg6dxLp3YJEjqMvbz8q4SQtsv7XfNwkyZDdMOetBFWTv187Lx8NfpqGZ6kwm
	qh7t6iRcH8XEL8svaYDMdTaMRpPtiwEjGamAZRV7ebWxyVoNLg9z9kLnOiwE7tuh+VJuaGN+7+o
	NsmOt0aLfacIN0CZjcz430v6sKRGRh72CUACaJZCqYYxGXZUXpjQjBdBwsxt3v5wwHgOmWQ5h0t
	1KIu/iA+PXMg+FB672HU20
X-Google-Smtp-Source: AGHT+IE6g5en90WXrl3ZEnboKqts+eBcZS3P4Z0a/whlRK6sw4bJgNhh+d5L/+hs3tXCG2T1uDOqfQ==
X-Received: by 2002:a05:701a:c949:b0:11d:f682:e475 with SMTP id a92af1059eb24-11df682e6f1mr1767600c88.40.1764878644680;
        Thu, 04 Dec 2025 12:04:04 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:04 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:52 -0800
Subject: [PATCH v24 03/28] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-3-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=3702;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=ZNC9a/En39m8CKIDJtxwHFeTcpc9wzeOUsHgDemdXXU=;
 b=5o2zU5rsxOxcJKC2p1yqW7GuhtDJPFoThZH8CdeiyFSiUJMGHC8P2JMq2k+6z9+4nWVfwRGik
 1gzSe/qpXZgCW6LPHP+kjurdK3b0lQ02ZbqKtkuHdzcrl2GjgJMK9O/
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120405_765163_8C64744C 
X-CRM114-Status: GOOD (  14.95  )
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
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
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
index 67b59699357d..17b9e77bafc3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,6 +274,24 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
