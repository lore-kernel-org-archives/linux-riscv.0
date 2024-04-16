Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4067C05023
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 05:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ns5i5p8qCJT9GK4ibLXtTBJIbhSQ8U2GU01wbUUk5JE=; b=aiYvXExk453LfE
	XZjOBYIQFOHuuMrowSCZqTLtcdE4sUB9kECO9j0yX1drASmEWZLFjSLhBneSUqBLM6d8dLubflZhu
	Bz8FkBx43qQfjU6zrgW2BhMU9l04p9zl/sYF9xDcA6vFJweKTQh/UIu5oQoyRFzqK9AF45RSktc3O
	6oD/Jm0R8gD9Nc9niMUCw+iMUwXItpmAQQJ3pJAWuZUoRnyz0EdY2y70mXwQnRGSUHCeHnXlpJA7C
	52tUBw3IipQo1+Huv8B3auUMDrW2nWxCxcIiU1xuRWFSyQ08F20vBx8H7pQ7lu98ySc6UQYRGm+c2
	lgIGWU/b7J6SGAE6dz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwbAY-0000000Auu2-3WPf;
	Tue, 16 Apr 2024 05:15:52 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBG-0000000Akb4-2VEF
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:31 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-232f2b86e4fso1927019fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240744; x=1713845544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOetgtyntPM1sQ5OeR35sjTF274eZVTe4hY2Mr7WVUk=;
        b=lXSVYLe2prCs6X4zr7aq+bkC6bi+n4zcI39xe6WMmfR0C8Uv5uz9NkS2KCQgPVoazf
         QZiyFOvs54yxRGeumdQAtSACazWxr7cj+dK8/leFYQycNfmzeql9BXwbSFLoGQf+3+3O
         gjMJGz2Ril2jLp4zphx1vSFl7CJJRDI+lqQJCMuyaL/hPoR8lB2C1hbLFJQT12+nVIxV
         5gZqYgcXOcMGpatPUoLX7H2Q81T3Rvs/R7y8TU1kYcI79Yz4Q6vVnh+oc3TlDWwKVurA
         yRNDy/rec1g7UpRQFitk/f022fR1wsI0Wpm3ma4Ggu+Vs9juOEDKZPAcufQu+XcxlZhT
         IiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240744; x=1713845544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOetgtyntPM1sQ5OeR35sjTF274eZVTe4hY2Mr7WVUk=;
        b=jXt45/BsAywOg5seIp6t6r4HzQ1t5w2fJ2utENrvnDrqVIViuYyM/O3AhxtQu4m1Sg
         6/Dita63zf/rbxRSXV2txOOkM+gGImXcKNIJ0e6EDcN+S4KcxV3zH8LAbYv/gV5aX/we
         33LC1Z3gRtKcI4CllIB5s8pz4pQs9pzdr/ndBFwmfQadlvMG0+sry8vmhZHznSc/szRt
         Svm9KIji6vYnOWFGK/TunTH6LfW6CSB5aOqPH93Q15DHRey1rmW8nDN4qfAHhKo2lXBb
         9qHZCUiSLyzrkg/YUmIeJGgMz4AU1D8h0W/XL1d8X/Tiy3xmG2InluF7ePPJS5Ba72g9
         u+TA==
X-Gm-Message-State: AOJu0Yz6XRKQxLX3PN8S8jwgm+mbuWH7yqTBwYjqVvT7rvZZqSDKM6/+
	2UQUHQSZ09OEub2uMC8b5MxDI0mXLhtfzRf+9U9HpAJKcqoOJJQVx/hy4oUXfCQIRIBBToZuP5C
	v
X-Google-Smtp-Source: AGHT+IERQO5n2Vb9B9QZDYR+KRQH6Iyecu+hDVCp8hPPx8PhhyKH4HSl99iHFZWCmmlfxJDCqqIcFA==
X-Received: by 2002:a05:6870:f10c:b0:22e:bd35:d3fb with SMTP id k12-20020a056870f10c00b0022ebd35d3fbmr12554232oac.22.1713240744106;
        Mon, 15 Apr 2024 21:12:24 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:23 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:11 -0700
Subject: [PATCH v2 14/17] riscv: hwprobe: Add vendor extension probing
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-14-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=5374;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=xqkFWr+oImyzQ0JDwVIFghGiFX1OGy/hCRBHcZtb9a4=;
 b=T7sIxScpT71u4soPN2p/gqkV3qOsg1bk7KkRmGenJjz3ue3nUXSxfY3aZtpys+w4N1hEdTuZ7
 MQrs3G2aalXBXQf7VoQ3FVs9LQKs+dIv7K4wL5F2lCovv+sfsaDuefC
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211226_806950_E49CB950 
X-CRM114-Status: GOOD (  24.63  )
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

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_0" which allows
userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR vendor
extension.

This new key will allow userspace code to probe for which vendor
extensions are supported. This API is modeled to be consistent with
RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
corresponding to a supported vendor extension of the cpumask set. Just
like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program to
determine all of the supported vendor extensions in one call.

The vendor extensions are namespaced per vendor. For example, if the all
of the cpus in the cpumask have an mvendorid of THEAD_VENDOR_ID, bit
0 being set means that RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR is
  supported. If the mvendorid is instead VENDOR2, bit 0 being set will
imply a different available extension. This allows for a single hwprobe
call that can be applicable to any vendor.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/hwprobe.h           |  4 +--
 arch/riscv/include/uapi/asm/hwprobe.h      | 11 ++++++-
 arch/riscv/include/uapi/asm/vendor/thead.h |  3 ++
 arch/riscv/kernel/sys_hwprobe.c            | 50 ++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1378c3c9401a..3bcb291eb386 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _ASM_HWPROBE_H
@@ -9,7 +9,7 @@
 #include <linux/cpumask.h>
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..142b5c37730b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _UAPI_ASM_HWPROBE_H
@@ -67,6 +67,15 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+/*
+ * It is not possible for one CPU to have multiple vendor ids, so each vendor
+ * has its own vendor extension "namespace". The keys for each vendor starts
+ * at zero.
+ *
+ * All vendor extension keys live in a vendor-specific header under
+ * arch/riscv/include/uapi/asm/vendor
+ */
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_0	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/include/uapi/asm/vendor/thead.h
new file mode 100644
index 000000000000..43790ebe5faf
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/thead.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define		RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 394f1343490c..15ce916a7321 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -139,6 +139,52 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
+static void hwprobe_isa_vendor_ext0(struct riscv_hwprobe *pair,
+				    const struct cpumask *cpus)
+{
+	int cpu;
+	u64 missing = 0;
+
+	pair->value = 0;
+
+	struct riscv_hwprobe mvendorid = {
+		.key = RISCV_HWPROBE_KEY_MVENDORID,
+		.value = 0
+	};
+
+	hwprobe_arch_id(&mvendorid, cpus);
+
+	/* Set value to zero if CPUs in the set do not have the same vendor. */
+	if (mvendorid.value == -1ULL)
+		return;
+
+	/*
+	 * Loop through and record vendor extensions that 1) anyone has, and
+	 * 2) anyone doesn't have.
+	 */
+	for_each_cpu(cpu, cpus) {
+		struct riscv_isainfo *isavendorinfo = &hart_isa_vendor[cpu];
+
+#define VENDOR_EXT_KEY(vendor, ext)							\
+	do {										\
+		if (mvendorid.value == (vendor) &&					\
+		    __riscv_isa_vendor_extension_available(isavendorinfo->isa,		\
+							   RISCV_ISA_VENDOR_EXT_##ext))	\
+			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+		else									\
+			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+	} while (false)
+
+		/* T-Head extensions */
+		VENDOR_EXT_KEY(THEAD_VENDOR_ID, XTHEADVECTOR);
+
+#undef VENDOR_EXT_KEY
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
 static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
 {
 	struct riscv_hwprobe pair;
@@ -216,6 +262,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_0:
+		hwprobe_isa_vendor_ext0(pair, cpus);
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
