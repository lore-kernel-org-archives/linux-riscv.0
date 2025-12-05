Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E85D339B5
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulzxxIOrRM41DXxDG71PiKcn1kz7l7JpGzJbBsIyENg=; b=B18OxydbV26wdP
	TuOF7MXP6R8Ej32krj/EfL9acvjSbToMDkCEShiQNkVQJ/fxTWyyE7Cg4tlvDWeov5t0ZwRqpvGxo
	GFXNJoXtxERF8lXuJ07+LjxTbO+lu82wOf8xLvxBlSu2guRM8ki+xdZQamUv8HkmaOcaAQGwc+mS+
	x9Eg+VNV+lb6IxwtVkubTexV6u7zhNLpcLnozy0aE1P40HzlQ0I1iZ0DVbKhqZqWAYp+Et6A61UWT
	GOFsFmP7tbjet/9J4p7pY+AuHptl3llarg5gtn8Kk1knLhSmhK0o4tvBqXJkfg4Rtl8HaFl+93J0G
	AAzmNIxWf6M4pEcZ87og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafr-00000009p5L-47mL;
	Fri, 05 Dec 2025 18:36:59 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafp-00000009p3V-2N5J
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:36:58 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so1604207a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959817; x=1765564617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dse2BU+tFA5XFpg+kLbFKrS+f5gCoIar5kBy1XNyEFE=;
        b=EYdvqZXnwYd6ianUn33gDCe5DIOZ8f2uuDSLT+S+Mv2U/j51obgAeT4Eix/kwhwEDw
         YQepb4w8xV00Q4ZmuF5iZpd0oYABi90YcfMGGL5mKRvoTU1H3AFx/2+h2sZHtkoD4908
         nkKMykucRs/dvVHG2NazIyp0jCtcrOjAFDyD/wgaN5derTlvMkp/6Bhyw5DYibvNCGn+
         uP9I4TFwD3KWYPlIIQgkDNrcWkvNIwe9QtRpTWu0dSq6cQ8jKY/QFdAzpEmnw2Hpl+Sq
         3ywGBwFlOYoFbEsDliEVtvysYnMLTLzmAhxbx6bQcXdyKyRsJAVdm/kJTlfiEf7JByuG
         g36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959817; x=1765564617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dse2BU+tFA5XFpg+kLbFKrS+f5gCoIar5kBy1XNyEFE=;
        b=Xqd04Ws0tbDwjdL+1rfbx5HzWNnvuP3yBZQJu0F9D46K4wym3lE2hS/XCag+VRnlUs
         /z5GWhjq/GbIXkwGKUicNtrGv9xvvBvu7fci6Xgr0QtPd3ucvX1i1MSkKljKzZtMtyJh
         wfPeC7InNyAkARcHaWo1JBaMStFxu7nK5unUVnJEaAWQGL2yafm38HmDstPc8iQFxTeY
         SN86Av2FuX97AVl/EPMRl3KGqRy8/VjNvaPpdUvfydYxKlmC9ZDqWo/XcRiyn3VfBjye
         7enT8FvzyvP5ZN/7TSOQhGGRDP9nH/gz+OKnxvL7D5/JfdyuAdtmzaRyRDmQUrl2tL+5
         IXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1SUzxD8mFTePsDrCd7hBqf1u0+8N329OI4Hnw+qLfgkADV+pomN1dDNJ6Rf5ehs+u0H1nUtk5+Ao7zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyxwmhKnNovVEkBtPMoXDdOwgjBDJg7WEWXkG6U+4sb29JOtEG
	72jqonzHB030oZvx//KFvbVRgIj5PlHW1rfE1AhXMwWJnhbc1bfNBdcnEIk6MvxwB7M=
X-Gm-Gg: ASbGncvCqSACU9Tdx7plh6RfQMQJNXi64I9l8x8Qxhc/DNui4Uw8We9PrZndvA7qR5U
	I6KY3zJGXIPED4XOEy57oVo5RSklUf5Kjost8hPB4DRSfNuHH+pAOWJ6hGfCutwNTSvV+qIX254
	DqwdhsJTeysuAgNWuZ0wmPVL7/gP/SGP27my35QafH/FuKZicN5D6q97PdmIb365Aasgz+aD4ei
	1Exr7qJ1zLxg2i9Y2aUlir9k6kXxw6kclQ4VnQNAql1Haz0bvSqyPxraKQE8KFENFqYxPhb/ijL
	dfTgKkr+yiogoEWCI/LTwVxl1Aoywh7PGkIzV2KhowchbLCyAw6WCJewSoHbKKAQz3C0idtM50O
	Vqy7X8+589g6Y65lT8tUWeVbf0x9pT4kqz4VjmbHJNAedGyAuEps+XEW6wRFlRiONwf2Gq4fJDE
	tIyF+qJE84kql3Z/70bvuC
X-Google-Smtp-Source: AGHT+IFyM1iqMXt+qSrwno3qrNX4RPHWfEVVmVOUeAMA6kfv6cT+uLIoklBexS5RYMXJgxPECC8Iuw==
X-Received: by 2002:a05:7300:e916:b0:2a4:5a26:25e1 with SMTP id 5a478bee46e88-2abc720560emr74735eec.30.1764959816568;
        Fri, 05 Dec 2025 10:36:56 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:36:56 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:49 -0800
Subject: [PATCH v25 03/28] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-3-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=3702;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=ZNC9a/En39m8CKIDJtxwHFeTcpc9wzeOUsHgDemdXXU=;
 b=CKnG5DfBkhW3eeubJ0rh/DdIBdxV1q/U+YHdRfoYgzWhJJIPEPPX9RsQ4SKbZaD16hCGQTrkw
 Ly4EGhODA2TBk6N0k+rFvqtbSJeUjXlZqiTKuE/5YDUsrnziMdkP0MK
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103657_657939_EEA82567 
X-CRM114-Status: GOOD (  14.50  )
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
