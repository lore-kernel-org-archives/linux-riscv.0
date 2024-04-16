Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8D5C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdiAC48AYsu5deASb/5xUqPMDeZ31kX0HOIehaRM/Vo=; b=og1kpJbto9BLe6
	FgRCOSEgC8rIe0bhp1lf2jEPtlgXPSza7CkK3yo4LFoNYLjrnXsqYKc/n7WNFki41mWgDlKuf7Gxw
	KxxptSx0dX97fWkCfF+si5/AER0u2wirPtuCkIWJZHOnt8eIJV2ges0N/XnRP+VAdG06IOIrnDxEx
	mczfhbwyLBJnmqSmjwf1YVdfQhMU876q1vqPjUvtvJ6qRU+r5gtVl+wi6I7mSJyScwnyma5DLQSEF
	TJlDAkW4dMCmrLuVzYefjX+p3/KJeUCWsqemHlbKVnEbtkT0JMbj3+4+HD3+Gmxb+05xz929HYsqe
	3YVl8vrELhkS1tZUB9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBP-0000000AkkG-2pQX;
	Tue, 16 Apr 2024 04:12:35 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaB1-0000000AkN1-2loN
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so2612125b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240723; x=1713845523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++xZy+ObBNE3KB89/8huI8TuSwtQKmJYk1fAnGCjGI8=;
        b=GA0ObLpYHuNIvqKcehzhW6d5uuTAValy8cwQF7pwjFVh942gmPSVB9aXx+lhoBbP1W
         hWCD+6aK6gggB7jwhXE5pximZrboVxYXe4AKxGX1AjOKM9ouvZRskYiOtvxPjF9Ktb5B
         hMHxMZ96bgAKUBHi7guewjGH4DxwJblRPawmOlfic57M1Yb02aF+C8CU7FcjAKmfk+vA
         PPvMtkpLg9TBAt+E7m118GP/s4ir3xadrvZ68XyOKLNRItd1x0NzWnoFHk/guB9xB8H0
         /kTchF77jvvpMJwraO3dek3cva5/qhEvIzzDwCAxmKRM2FelRGJDF+B0HUWQIqgy13BT
         In/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240723; x=1713845523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++xZy+ObBNE3KB89/8huI8TuSwtQKmJYk1fAnGCjGI8=;
        b=tz0wDt4OYn3G9Z5o2u1mcXd/RDz6I1p8x0OO0JbC39I4CtMt+xVRPg360Oe960CJ/w
         V40yJ1L4FT1phBl297Yx1RVx0MVc8ykIyRxjlXTikMHKlzTwdNX9gKzNV6UkLoHwJk0G
         uNRYmplKDkUYgR26g87hwkqwz53isJVc2iXibqE5bPbOr8ypqxd25Sv4E/tkIJC2Shg+
         SB6vG1pcM7ccGeIXmLv7guATiKbGtL2eBO6HM51S3DCG5XX6tzab2mLmtXlHI5T93C+8
         l/v5csR4AqEDPp9x0k/tXm3vXN/0uTROCqTI8t4+dBVwv+pFVPBLuioYyKnH1DTxI3J5
         HIYg==
X-Gm-Message-State: AOJu0YwV7CFvrKfcuv+8/bfNKGF6Mg+C3kyQ1BaJTDNzA2hs8OwM3L9S
	3O+8mkZebDciwxmBFsxzsyN3q8cGty3f5ZH7EDMgavuV0l15PIH6PUHPDGaiCqL680DQzOBYTH2
	k
X-Google-Smtp-Source: AGHT+IE2UM7qn9JHRra5nKKHDFw99Yc3X79Ggnd1bXAn1KOp+/ILKMs3FsaPY9rCdou0XHBhmNW78w==
X-Received: by 2002:a05:6a00:2382:b0:6ed:ca65:68b with SMTP id f2-20020a056a00238200b006edca65068bmr2125216pfc.4.1713240722785;
        Mon, 15 Apr 2024 21:12:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:11:58 -0700
Subject: [PATCH v2 01/17] riscv: cpufeature: Fix thead vector hwcap removal
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-1-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=4708;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=dkmMwSQhSZqqA7hvCp11OQAJEfKHO37CqENn3GjjXso=;
 b=RyAuMqKhMsNmgEPKgOmQFKT3iEAhF8iXw8f0UHK9Bdd0JU5h75VVCNI96WA048tjLZiiqaCDT
 Uw/yH0Jd01nCawauWBIhP1sdCDA+K4rGlevzJ9wvQyEf7//qeTPo3ZQ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211213_471872_36ADBF08 
X-CRM114-Status: GOOD (  15.47  )
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
 arch/riscv/kernel/cpu.c        | 36 ++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 12 ++++++++++--
 3 files changed, 44 insertions(+), 6 deletions(-)

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
index d11d6320fb0d..8c8250b98752 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -139,6 +139,34 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+unsigned long __init riscv_get_marchid(void)
+{
+	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
+
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	ci->marchid = csr_read(CSR_MARCHID);
+#else
+	ci->marchid = 0;
+#endif
+	return ci->marchid;
+}
+
+unsigned long __init riscv_get_mvendorid(void)
+{
+	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
+
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	ci->mvendorid = csr_read(CSR_MVENDORID);
+#else
+	ci->mvendorid = 0;
+#endif
+	return ci->mvendorid;
+}
+
 DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
@@ -170,12 +198,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
 	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
 
 #if IS_ENABLED(CONFIG_RISCV_SBI)
-	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
-	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+	ci->mvendorid = ci->mvendorid ? ci->mvendorid : sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+	ci->marchid = ci->marchid ? ci->marchid : sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
 	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
 #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
-	ci->mvendorid = csr_read(CSR_MVENDORID);
-	ci->marchid = csr_read(CSR_MARCHID);
+	ci->mvendorid = ci->mvendorid ? ci->mvendorid : csr_read(CSR_MVENDORID);
+	ci->marchid = ci->marchid ? ci->marchid : csr_read(CSR_MARCHID);
 	ci->mimpid = csr_read(CSR_MIMPID);
 #else
 	ci->mvendorid = 0;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..c6e27b45e192 100644
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
@@ -497,6 +499,13 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 			return;
 	}
 
+	/*
+	 * Naively assume that all harts have the same mvendorid/marchid as the
+	 * boot hart.
+	 */
+	boot_vendorid = riscv_get_mvendorid();
+	boot_archid = riscv_get_marchid();
+
 	for_each_possible_cpu(cpu) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 		unsigned long this_hwcap = 0;
@@ -544,8 +553,7 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * CPU cores with the ratified spec will contain non-zero
 		 * marchid.
 		 */
-		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
-		    riscv_cached_marchid(cpu) == 0x0) {
+		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
 			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
 			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
 		}

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
