Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66723C19F4F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJJLdGuQIQrb7GDiTfaoKm1k0ErxhXw57DOj6VKLz94=; b=tCJD6nkE5PjBwN
	jUQTiLyJ+GeCqsVmbLwy0gUlM/ECLVxGX6H91ZMmTBaXY13+Pnx6WGa6MmgyviJUeE4yAkrXXUTpL
	pAyYWTmY9rSLZCg2KzYA0UOQXD87ZPxwBdrFB5kSamr4YqAz8RgDCpzdFoUT4rvLASfHQpbWURRVb
	CDUYzKi0Mo3v3PeZw5URbb0K2QAa8esztS9mF6pzHyRW5r/zuTw8Mn/GDJhTBiL5F1rdnV7dd7k/3
	HgwM0ki7gmJTGsKOCWxI8TCLqoJwBghqN5tPlHwgNFNIU0SlUWtlT6OLfrWWaGcyohDKDGVt1HzpU
	EyP0D/lPtSap017RaquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TbD-0000000EALU-29Bu;
	Fri, 26 Apr 2024 21:59:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Tb5-0000000EAIG-3Vbh
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:59:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e65b29f703so24341915ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714168751; x=1714773551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5z5Mv/2BBvV1JkDAAEQ2eU+L6J6I/Qb2vWkC4DKGuhk=;
        b=QIOhzUiJ5A6IT0zRmG4dCXont9ifsTYpUM+3Q32j91owRXbB1TDdNxXPIcNgNNRStO
         E5kStF/B+MDxX4YFgpTiOgm6I+4hax3nLnD+YURRXK7lR5ZjGygOizTxRU4SmjpJn1o/
         ThixcA69G6Jg0b8L6d8i4HAFCRzHiuoNckeuk0/ulB+X7f8Lu+9X6LLi89bKVJAEOCko
         hmqKSue/koQTir2yrrQYcw1gx0sC22nw07vRxIZMmUfZ0rMtPVHGZK1Bebug06LZmGcX
         q8IaDSwvAc7ba9bYrj180A6A3yQzoZdwLxDZ1bjTKVJtLn52sSZkh9i3PUDZL67OLobq
         mQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714168751; x=1714773551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z5Mv/2BBvV1JkDAAEQ2eU+L6J6I/Qb2vWkC4DKGuhk=;
        b=uGLP4U/tdZqcz0okOHvxOc68U15nkkIVVl4kgfOI65ApTLhoc9VU96ve5IRJGU8Ck6
         pWWlnZ9Z/j+qN2UKGrTSL/R28geaFaYH+6cK9klq85SdKdL/6p5JA6N7duUyul7UR6TY
         8Hr39DjvRT+fTXVPnMpjrEsA3Ap8v6IDW2d3UlxWxCQa3m8XqC9rR7OB3XEL0zLDxvCw
         bh+VMp+pAF8PGhLjN3HVt5VWsaiVNqQzsIn8zMeZvUn0mvqM9RW4PkprkQfTxZqnBO2D
         hiEYJN1yC2KsYcV528Qv2H4hmkA7plwsz7MXzMwD8PXjtMd3/quRuEpx9laQcM5y0jZp
         TRbg==
X-Forwarded-Encrypted: i=1; AJvYcCUfB2ab0VbJG1bfeIL2NgFcdMdxreoAagPdVaasVCjPJKbmmRlzlfEys3Zmd9G1y2I/gy/mGvCvo+XEPl1WSFK0uskNH3KaAabGGU65uEtf
X-Gm-Message-State: AOJu0YyiziTd/pMGmIWfQWaJaZrOYhSACXRqvZXFntlX5flFgP2OeBTA
	u1F/molgMYYI6R97i/wk/gKHHSCSZ0kgP835COunrsyjke5fSXjQDa1pva2OqKU=
X-Google-Smtp-Source: AGHT+IH/pNxhEQGe0VDJp1wwswkelnXqZTWCaOASRoPoEKeCOdPJa738fSUl/pa8dYH6jN1ay6rU5g==
X-Received: by 2002:a17:903:110e:b0:1e5:c0ee:a7f9 with SMTP id n14-20020a170903110e00b001e5c0eea7f9mr4378566plh.14.1714168751046;
        Fri, 26 Apr 2024 14:59:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001e2a7e90321sm15899787plc.224.2024.04.26.14.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:59:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:58:54 -0700
Subject: [PATCH v2 1/2] riscv: cpufeature: Fix thead vector hwcap removal
MIME-Version: 1.0
Message-Id: <20240426-cpufeature_fixes-v2-1-7377442b1327@rivosinc.com>
References: <20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com>
In-Reply-To: <20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714168747; l=4872;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VX1Y1UYuXkBzRvt8gF0IdHZLo9dneKHFhN1a5O4FF2c=;
 b=2xyEAQOLy5fmXV5x9uhPYv9OMvTVGRVCYPF+zx4H0rpNyqhUnYgEbZgt8mBRrBySg0aTxXpen
 rqR3WiqN6m5AHQi3O+uwrG2J1q2dE6G9/87T3TcHlN8jQqAyH/K+j/8
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_145912_023132_C65B11C0 
X-CRM114-Status: GOOD (  15.00  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 11 +++++++++--
 3 files changed, 47 insertions(+), 6 deletions(-)

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
index 3ed2359eae35..500a9bd70f51 100644
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
@@ -497,6 +499,9 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 			return;
 	}
 
+	boot_vendorid = riscv_get_mvendorid();
+	boot_archid = riscv_get_marchid();
+
 	for_each_possible_cpu(cpu) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 		unsigned long this_hwcap = 0;
@@ -543,9 +548,11 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * version of the vector specification put "v" into their DTs.
 		 * CPU cores with the ratified spec will contain non-zero
 		 * marchid.
+		 *
+		 * Assume that if the boot hart is T-Head, then all harts in the
+		 * SoC are also T-Head and have the same archid.
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
