Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB7BC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxQxJxHhY5RB+veJz1iVonMyc5NSMC5trcJTu9FBD3A=; b=tBhhr3biB+Eci+
	crIm8QdSW7x8MU6Yi2UamjPjHT7BaxjqcBqOWmRAhFUW+mpP4CVb3JP9y8e/EhnVADAKkfvSKlEFT
	7MBVt3V9r3+qlRhvq1RU1hhcanU1rMXE3gJzj9yP5hNzRssy99QEfAd+FTVlG/ly8C8+/RmOjsdll
	zyAQzA5CunANXBQ9c6uarMbDENC30PemcvwuSgiA1YErruY6Um4EJRaRHY5domhs8sbDjo40GYVDa
	2TriQHKNI8J3c7ZpNIiS7J8IOXtMM/sftBILgXEh5wGw/OFSXe2YI/NlvjfYQpRE7ecxrY2QUYqI2
	dfcmfzgD5CEfRjPXHeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzfNx-00000004vhd-478C;
	Wed, 24 Apr 2024 16:22:18 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzfNs-00000004vg2-3ozg
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 16:22:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so834145a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713975731; x=1714580531; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BENOyooeW2luxuF+LXOR9WbhBmtYhQIWC+pDPXsnnYI=;
        b=cLLl5/WgrZtsps7tEPtXJWqr10teXumpEf8t3QArFjGQrc2Bsonxuekf55eyKmcUtd
         yPTbitiEWkcorXzw/7KOy9v4NnTXbIJoz2FL7k31fB28qWLJRcTcpo4zWOLunO3W3NEz
         J5BfFTE7lc1yG8N3eDkK3niE5xxsZZ4gyrSBji+WT0idFds+89WA4s4u9/a68tYqKVLs
         1/sl7wLDN4S66rejzbizr3Z1WIe1siAX0OxYwEpLrNwNRF+IzQLg6JXRL5CcJGuJH7JE
         lqNuLJBJLDdRl7KkCRMQeXmiVkRcNLeC4qjVMi8ycTONAMR/QJ3bQNfCSXZQvnqY3Cea
         JAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713975731; x=1714580531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BENOyooeW2luxuF+LXOR9WbhBmtYhQIWC+pDPXsnnYI=;
        b=DeUhrLFKQAEJJB0WaIfYUlJ4BXnZxQ0pXWL+82TYHhQjPHEWVO+C4O6pHuTYizHg2h
         1Vu0P2TomrDPVA3X5ccdftH+i5McRWfKpQJ2Iex1ppTQWDT5XembPD8gSbIthyxsRqCz
         H7MA7vTo02HQ9xaNOiLg4ZiBchROLM2EH4TIqJMikpXPPAYdkh9N1bYEeWPzFgheb7JT
         og9wd4s1QjjRck7WrTBdonD9ghT546ORrygZid/+PzhKbmeIHd2TFHc+BXb1/jHRyVbI
         YQadiF2C/eLomVDNvavxj5byerYePAE6D/FTtewK9RaLxMd3zJE0Hl3L294JcZKfN23C
         GimA==
X-Forwarded-Encrypted: i=1; AJvYcCUM55rDLEMW2M8XviXoWlIldFRzxyqIwGqcYuBr/pumgGXs3Qu5zFSthbDrx/3ZSoIYt55i01YLpYBYtWZA5NSnvDRnG1rjENL9RwGyBx6A
X-Gm-Message-State: AOJu0Yz88ZlcFeg2O270AY9HM3qn3YKaanOnEDOMyG1p6TkJZdRCjafC
	jAxRigwUhdBuXJE8pRoz0M9zAVtb/nG/tbp06Idr21w0XuETB3URMpqFDRjlFew=
X-Google-Smtp-Source: AGHT+IFy51HOVhIEM/eh7Cd29tDH1zvQ+lgJJc8nhhzkP5ryuB0/Bp+pR3o8++W2DQQ5jXJSvvIjwg==
X-Received: by 2002:a17:90b:3bd0:b0:2af:9d00:e84b with SMTP id ph16-20020a17090b3bd000b002af9d00e84bmr211653pjb.15.1713975731422;
        Wed, 24 Apr 2024 09:22:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a1c0800b002a610ef880bsm14505760pjs.6.2024.04.24.09.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 09:22:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Apr 2024 09:19:54 -0700
Subject: [PATCH 1/2] riscv: cpufeature: Fix thead vector hwcap removal
MIME-Version: 1.0
Message-Id: <20240424-cpufeature_fixes-v1-1-585e73d2226b@rivosinc.com>
References: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
In-Reply-To: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713975728; l=4740;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=PYZfCtA79Xr5VNJKr9n7fy84USLuN54khgYv4wgcjQo=;
 b=rlVl8T/xGO1/2xV6GwKE/PvkrwKe/pC57MOBlWz8JPpE33mWa2+YfUXu+QONVTmwtYaEmjPaJ
 4/ZqnqEUBHKCCDC5PDpWOnN/B1tU8IeenzR0EJegRx6uMc6C9M5AhLm
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_092212_980683_2FA4142B 
X-CRM114-Status: GOOD (  14.10  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 12 ++++++++++--
 3 files changed, 48 insertions(+), 6 deletions(-)

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
index d11d6320fb0d..c1f3655238fd 100644
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
@@ -170,12 +198,16 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
 	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
 
 #if IS_ENABLED(CONFIG_RISCV_SBI)
-	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
-	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+	if (!ci->mvendorid)
+		ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+	if (!ci->marchid)
+		ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
 	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
 #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
-	ci->mvendorid = csr_read(CSR_MVENDORID);
-	ci->marchid = csr_read(CSR_MARCHID);
+	if (!ci->mvendorid)
+		ci->mvendorid = csr_read(CSR_MVENDORID);
+	if (!ci->marchid)
+		ci->marchid = csr_read(CSR_MARCHID);
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
