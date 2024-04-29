Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE7EC19F4F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 22:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjIkVmIgna1/uUVZRA7cHHqs2hvf5qdEd8wCgbHQbUM=; b=t1XjPQsK1nYXhp
	41n5OdsaPhJrtXwaluYGQTwthd13/3Ua/4LA8hA81NAjUElnmGmcFe2F0o7+8fKnADcwfYuwpZGJc
	LJvoXZoTg80IU+eNL2G22OC5SwTGnZ+3OAdFfaUCvrVmNwmG0TA/2iigFWcujgAvkUrQqy2wa7/dZ
	QcThZ+D8vtjBhVCrH4P3WyYX//hxHRUtGyp4t/hksuPPuFdAaNYOq4URpdcyKQCwzdVIE2/k44/H2
	yc7eEplLd9INhtzdDrWfdeCvchDHZJUoWBTVRNrojCvrVULPmlHjuPGvfBfTfAT78UnaJhqoFu1K5
	9aovyNsl+heVnr2KtCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZVg-00000004NX2-37Ex;
	Mon, 29 Apr 2024 22:30:08 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZVd-00000004NVo-1Kc3
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 22:30:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e8bbcbc2b7so45582055ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 15:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714429803; x=1715034603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRzF3Dpp7TOSCdwhyYociPGfChYhZSWehQ64aWjvABY=;
        b=jGHHhzSiyYVszFwJoYYHnwHM6bEUINccYUyRVxynJO99abUVfQPwShVhaB06Vbbs9J
         srPsL0NaImMssQDsnTHj765NjWXFY6T3cAlraKh0pDsUw1TOIZ+4jr4Uu6cu0dhQuWow
         A4+ofjMA0dGlgktiMMLwMVv/SXYAHyYggSB+CWqJqSuk4Cpkj8TI7LKKbBWHGv6dnxqG
         /tRNWBJvhFd9ZI5jcyHBEJIyRgQxO9olMHZp+4Pqv4kreYCsbiyOb7hbLCLwJT6x6VER
         bcVsU6M2eX74pu7e/jEFeXMVNqOXcFopHtN1Efmi0okWRPhDjmOxLw0ixXcqxIe8DCJK
         92oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714429803; x=1715034603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRzF3Dpp7TOSCdwhyYociPGfChYhZSWehQ64aWjvABY=;
        b=PFF0iBt+yc2g/U1lWv9KC7pUgflMAnp8aEIIy5wPrcqAwARipEtCuLU0TwcBvgYtiI
         JfskvCqvspqbEAraPYz0TwcjZHRga7M+XDMidO5CA7kL45rzRR3dMi289YCJzOjKFwXG
         UCeeBAsIKU/DC1UfL+x2FWkd67DRF8BVMTlEhjqY9jLtZsDPSytjMQddG5CTcfgqvFZj
         zyxhNhPn/mlYzm61xurYiC2lG2R9P0L2ONOaPGpjJCyqZOFZJAWLC1s5tM6ZlKMLieXY
         jt+ItWraTHr5+PLV4NsKEDgYMRROvJ6zKWHIx0zPL9MhSt/zczX4HvcxUFmwk6eKf3sT
         jyyw==
X-Forwarded-Encrypted: i=1; AJvYcCUIXMBN1k9bb/fy16uCcVbV/JAlaf3zLz14X8x0reaRYoemaSKdCM0eJh5l7Ozt7t2KTfkik4DeUJ/RncN6nR9Y48kJxLYxYRQa1LvYLJNK
X-Gm-Message-State: AOJu0Yyohg4RtB+SxvsMvFHPHxDmxFB/GzBHoOpSIPsN4NIttfintnVw
	M8NgtFn6BvJ56MR+m4PUYZaDKj77mWbnCnjv1D2STw+OyhwvgVyuubUPuCKauyg=
X-Google-Smtp-Source: AGHT+IGvF6Fs5X7wWRHrAZ4q9rMZSGzKF0F3AdiwvZC6YzRP1CWCMI35w17jpWoXNnf7Yw5MIY3CzA==
X-Received: by 2002:a17:902:d4cd:b0:1eb:77ed:8fba with SMTP id o13-20020a170902d4cd00b001eb77ed8fbamr8414418plg.17.1714429802983;
        Mon, 29 Apr 2024 15:30:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001e0942da6c7sm20794013pls.284.2024.04.29.15.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 15:30:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Apr 2024 15:29:51 -0700
Subject: [PATCH v3 1/2] riscv: cpufeature: Fix thead vector hwcap removal
MIME-Version: 1.0
Message-Id: <20240429-cpufeature_fixes-v3-1-6aa11dde513b@rivosinc.com>
References: <20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com>
In-Reply-To: <20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714429799; l=4794;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=7Qk+r0hY+lSGzO4QuKkjhPXKa0g3xMDQRnHfBKCgIOw=;
 b=+2nEFf9AqjedtM6uvaTMr19dbCCI+Az5OGT9+vcdmI1d4cqQUSYea4mKCVpZSYhyl1fUVl/jV
 ozmKSOUV/cKB0UXVlhKJzLI6/qMfiKqgBNPTdHb/BQU2vIcQCbykLve
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_153005_408605_252D36AC 
X-CRM114-Status: GOOD (  14.85  )
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
Use the mvendorid/marchid from the boot hart to determine if the DT
contains an invalid V.

Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 10 ++++++++--
 3 files changed, 46 insertions(+), 6 deletions(-)

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
index 3ed2359eae35..818adb0d388e 100644
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
@@ -543,9 +548,10 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * version of the vector specification put "v" into their DTs.
 		 * CPU cores with the ratified spec will contain non-zero
 		 * marchid.
+		 *
+		 * Disable vector if the boot hart has a T-Head mvendorid and an marchid of 0.
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
