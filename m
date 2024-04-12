Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EFAC04FF8
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oF0YxrO6w2V8R35yVK0PQZo6oavYCGZ0FLW2L3qAFus=; b=ppAzqY6moQ9Zv9
	KoaF0E6+YU93V+CwvSVBDongyum3W36w0dpryKt4DRjFKQntabadhbnO2xA+NvhsyGxya8jW1V+t3
	Z/hzo7AwN9A9Q/EH3iUu909bzLynZGLLxFzWdwx3F8rfHW5gSSWFvsqZCtBWju8fANhiz1r1Ubclc
	cRhncfK8jTAjEIqk1DUhTmRyuoAXbc23NDOYXo6ZdoqbGDivF4JFnNvfd2wi2KTOTEZ3YwpBFALug
	O1qKc52HSQaiSFB06tejXg6xdhjtEG1F7Y2nMpzOaZoCww+A6C0uW69qayJR5bLQG3HCLrJEENTZI
	PhGXwucrX2InnDFaOFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GO-0000000FADA-1p0s;
	Fri, 12 Apr 2024 04:11:44 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GH-0000000FA7i-3wGG
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:40 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso479358b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895097; x=1713499897; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTIOqHyitaw6nLqtSGaAxD1ZAsdnQdkiOW1srtvVpI4=;
        b=sRaU/6l09wuLFnZxHnJICECOtZicj0bkRD9wkOM8Qp5/JKOBVVy6UZcP2nJMfMxeH0
         35dc1ugTasP+YZuMZD9ofhPgS+dCIxsP5svCMHLjYIDZ29ZZk0y0tQ+mVCLCTTm0XsPP
         cF5PDq3qXFU9p3r8t35lE73/6aIWunAZR+cB/kgJtlgLtcBvE5MPYNpkeH5gGEvECdZ1
         XNxz0qXx1WJjz7/UKyf2i8K4tdCPRCqP7VAA0dGp/BDoFVoY9WUnVjfSM5V7k1w+SNTw
         PbmHSo3/SVDEzszlZbMORgXwpMFr5ocP9MaiUfq6nlf9yZpbpCnLSpkK6Gau0525qA4K
         i8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895097; x=1713499897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTIOqHyitaw6nLqtSGaAxD1ZAsdnQdkiOW1srtvVpI4=;
        b=AOET8Il0nuif151A0+vfMLaW2icZid3UMNJT9ykc3LXzrrR2JjGer8sxD2czXluMVQ
         dw0ff+XEs0RxaO7lLWReB9L6Hh3a3uyMX48hkVZc3m7weYcBYJNh5ThTXxM9zKNtWcvY
         K4OMrOGjeFQ+y3c/lNlGhKEzKpeErt+9Hj6f0G/LJP0x9yAVyJVRVKxiuTlIKoBYMUx8
         Vb+El5byyNZQnkSjlhHJ2PQUh6A2Yr4qNt1xmIWvtebNpxEPjJKOAQjjTpCbiQdsaO/w
         4felEp0d9UDzE7xI87JEtpqaY6A14mPUY2EtZphj9K0Sd6i48Bb5A4uyTfaXMuXXK7Nw
         xymg==
X-Gm-Message-State: AOJu0YxSICAp/nL9klMBSVOcTefcRtTMCXwKA1YCE/vdc8jjywTCbOGh
	fBspwM1Awh8X7c8Rkm0HLO/+telWmFL1O+9+sFFO+LtRFRdbRhzEHqQJmrRx8dA=
X-Google-Smtp-Source: AGHT+IGmK+ik5ga/31rI/jNfPQ7GtE4TagEsHRIAkTjciUmdXwpIc0jREUhAojeVSzBFcqdhAblJbQ==
X-Received: by 2002:a05:6a20:3943:b0:1a7:75ee:6062 with SMTP id r3-20020a056a20394300b001a775ee6062mr2043824pzg.54.1712895097299;
        Thu, 11 Apr 2024 21:11:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:36 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:08 -0700
Subject: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=4548;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=TaWdYIxX3mVr3KXwkzLHIXqWT8lH3rbWmT/MrcQcjQs=;
 b=aOQNAV7WlJGQ5TxDuyoKbXL84IAgkHRuEKyVZFxUi4+s64qdCpkNdySAxkP7WxVzO2uWucNmZ
 lM3z3ccbDFjCa8Wi5rrSQZD8cryU0oFUGhoHECrxkhBCfuB9jdZfbZ3
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211138_076912_1F86C944 
X-CRM114-Status: GOOD (  15.74  )
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

The riscv_cpuinfo struct that contains mvendorid and marchid is not
populated until all harts are booted which happens after the DT parsing.
Use the vendorid/archid values from the DT if available or assume all
harts have the same values as the boot hart as a fallback.

Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 20 ++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6e68f8dff76b..0fab508a65b3 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -370,6 +370,8 @@ static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1
 static inline void sbi_init(void) {}
 #endif /* CONFIG_RISCV_SBI */
 
+unsigned long riscv_get_mvendorid(void);
+unsigned long riscv_get_marchid(void);
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id);
 unsigned long riscv_cached_marchid(unsigned int cpu_id);
 unsigned long riscv_cached_mimpid(unsigned int cpu_id);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..08319a819f32 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -139,6 +139,26 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+unsigned long __init riscv_get_marchid(void)
+{
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	return sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	return csr_read(CSR_MARCHID);
+#endif
+	return 0;
+}
+
+unsigned long __init riscv_get_mvendorid(void)
+{
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	return sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	return csr_read(CSR_MVENDORID);
+#endif
+	return 0;
+}
+
 DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..cd156adbeb66 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -490,6 +490,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 	struct acpi_table_header *rhct;
 	acpi_status status;
 	unsigned int cpu;
+	u64 boot_vendorid;
+	u64 boot_archid;
 
 	if (!acpi_disabled) {
 		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
@@ -497,9 +499,14 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 			return;
 	}
 
+	boot_vendorid = riscv_get_mvendorid();
+	boot_archid = riscv_get_marchid();
+
 	for_each_possible_cpu(cpu) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 		unsigned long this_hwcap = 0;
+		u64 this_vendorid;
+		u64 this_archid;
 
 		if (acpi_disabled) {
 			node = of_cpu_device_node_get(cpu);
@@ -514,12 +521,23 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 				continue;
 			}
+			if (of_property_read_u64(node, "riscv,vendorid", &this_vendorid) < 0) {
+				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using boot hart mvendorid instead\n");
+				this_vendorid = boot_vendorid;
+			}
+
+			if (of_property_read_u64(node, "riscv,archid", &this_archid) < 0) {
+				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using boot hart marchid instead\n");
+				this_archid = boot_archid;
+			}
 		} else {
 			rc = acpi_get_riscv_isa(rhct, cpu, &isa);
 			if (rc < 0) {
 				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
 				continue;
 			}
+			this_vendorid = boot_vendorid;
+			this_archid = boot_archid;
 		}
 
 		riscv_parse_isa_string(&this_hwcap, isainfo, isa2hwcap, isa);
@@ -544,8 +562,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * CPU cores with the ratified spec will contain non-zero
 		 * marchid.
 		 */
-		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
-		    riscv_cached_marchid(cpu) == 0x0) {
+		if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
+		    this_archid == 0x0) {
 			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
 			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
 		}

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
