Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4605C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=erHZL5UjdYlB4Tb6k/fqQsxsREuVuH6BM0PrLbLtJG4=; b=qESFUa44zo+m8N
	ttqitty9UsXD14IuYL1TFgb5y+Qo9iJvXgRE5FylZ/j3BtcNEzf0NEPdwSV68zWryFISAKxXeb3hX
	0ZwM5YnsHjF++fVqeiDEVdcXpMTcs5/Kp3wq6a+srlKAMhR5HgYDwyZNAZidGhElxiB5mTYtnagrf
	vOpxTMaGp1OtEeJDIHYqOp4c4whJX+ZnGGTgn/w3F0Lfn0V5A2+/xRxfqU8n4SFUpt2uoppX3ZOFl
	RZNqISi9+lI7pvrDQXTkqsMHHW+acH8OKushJTRoI3Wp3l53O/ZbrnRtnfoSa4O7FaNH7fck2HNUT
	Ede5+BF04EAHe8opsBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWyM-000000036r1-0JMQ;
	Tue, 04 Jun 2024 16:25:18 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWyI-000000036oo-0vNm
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 16:25:16 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5b5254f9c32so732903eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717518312; x=1718123112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oH66foMXDApALAS1wcAJZSmBTT9bvRQ/ka0fru0lccU=;
        b=R+ltFB8XLV73cKxK2H3DtH7SiGDbonzTK7LkJtn7PRW9e0rCxXOgIaPtKVueAzrOo6
         gxCTJoB0DJaZXc7TKkotpTCwId0nH8UYAG4/puJVkGnEvfRGdtqbc0fAfsdSBJa0FqpP
         /s1/JvB05Ku5wMugV+0P885w2oxT2Lw+RI3991s3Hoa68plcvK35K4bKd1rrHORmi7rR
         Pwcgd/coaMwSJcACkfVovm3RyS6pCXfpVSltNs5YfOAA93Wm5mm/mQRZtZKDlBHzzHFA
         EaZ/woOd4r/i3tSYcC/tyZ590iz2r++bnI4CwWKG/mgJW/WhpBr+7BczJWr1ZhyrXmt/
         MkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518312; x=1718123112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH66foMXDApALAS1wcAJZSmBTT9bvRQ/ka0fru0lccU=;
        b=mh7MyxMGRdoDPL5grYutghXwg91lhEMlxXv0V+tIyufT3lAwTPpB0Jn7XKs5VpkJXK
         SO8vRhZaIjkaesAaTk4KvUe3ds+M7wtogTePI9V+bceFuUhc5Ij5RwOf3sBJ37A84EPN
         0LDVpfevrZ81x3VVwPITB7Ac28Hb+dRTLkByrH8DQKFvingATaQbN0uaAk+AGuK/gTGx
         XysZ1LBe0Wx0SufQ/FWjvvrsk6n7W9fCIxKMcnRlNXWDQ1vHxNwHUPTsT9RwWcZKP6W7
         89KA0wCbltNMuIxyfup+0CVkkbxo16alEo1OhPwiHtGJ4Bd2sMs5/j7lbTL7v0NHPI4E
         ShzA==
X-Gm-Message-State: AOJu0YwvxkjBve8tPCjyOsU5rBazz3OrlYYnLdCwJN066+taiiCNcY56
	Bd+PLGiiNCeSmbkPxrRB33rgVezt+D/9j0MyX51bJ8HawsjoyQbkOhV3md+WYgri7/uf4tpDibe
	tZUiQJA==
X-Google-Smtp-Source: AGHT+IFmH+Ml2VD2pW2eVDFmjqPTVR+Hcny82o26if8fLu1zJGV0X4sRCdPgbDsPodnc/YosBHhUVQ==
X-Received: by 2002:a05:6358:890:b0:19c:4841:30ae with SMTP id e5c5f4694b2df-19c484136aemr221846955d.24.1717518311805;
        Tue, 04 Jun 2024 09:25:11 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35937a496sm6173341a12.73.2024.06.04.09.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:25:11 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Erick Archer <erick.archer@gmx.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v0] RISCV: Report vector unaligned accesses hwprobe
Date: Tue,  4 Jun 2024 12:24:57 -0400
Message-ID: <20240604162457.3757417-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_092514_296926_711DFAEC 
X-CRM114-Status: GOOD (  18.00  )
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

Detected if a system traps into the kernel on an vector unaligned access.
Add the result to a new key in hwprobe.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h        |  3 ++
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      |  6 +++
 arch/riscv/kernel/sys_hwprobe.c            | 34 ++++++++++++
 arch/riscv/kernel/traps_misaligned.c       | 60 ++++++++++++++++++++++
 arch/riscv/kernel/unaligned_access_speed.c |  4 ++
 6 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 347805446151..5ad69cf25b25 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -35,9 +35,12 @@ void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
+bool check_vector_unaligned_access_all_cpus(void);
+
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
+DECLARE_PER_CPU(long, vector_misaligned_access);
 #else
 static inline bool unaligned_ctl_available(void)
 {
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 060212331a03..4474e98d17bd 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -68,6 +68,12 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_VEC_KEY_MISALIGNED_PERF	7
+#define		RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN		0
+#define		RISCV_HWPROBE_VEC_MISALIGNED_EMULATED		1
+#define		RISCV_HWPROBE_VEC_MISALIGNED_SLOW		2
+#define		RISCV_HWPROBE_VEC_MISALIGNED_FAST		3
+#define		RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED	4
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index b286b73e763e..ce641cc6e47a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -184,6 +184,36 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
 }
 #endif
 
+#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
+static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
+{
+	int cpu;
+	u64 perf = -1ULL;
+
+	for_each_cpu(cpu, cpus) {
+		int this_perf = per_cpu(vector_misaligned_access, cpu);
+
+		if (perf == -1ULL)
+			perf = this_perf;
+
+		if (perf != this_perf) {
+			perf = RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
+			break;
+		}
+	}
+
+	if (perf == -1ULL)
+		return RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
+
+	return perf;
+}
+#else
+static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
+{
+	return RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
+}
+#endif
+
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			     const struct cpumask *cpus)
 {
@@ -211,6 +241,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
+	case RISCV_HWPROBE_VEC_KEY_MISALIGNED_PERF:
+		pair->value = hwprobe_vec_misaligned(cpus);
+		break;
+
 	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
 		pair->value = 0;
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 2adb7c3e4dd5..0c07e990e9c5 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -16,6 +16,7 @@
 #include <asm/entry-common.h>
 #include <asm/hwprobe.h>
 #include <asm/cpufeature.h>
+#include <asm/vector.h>
 
 #define INSN_MATCH_LB			0x3
 #define INSN_MASK_LB			0x707f
@@ -426,6 +427,14 @@ int handle_misaligned_load(struct pt_regs *regs)
 	if (get_insn(regs, epc, &insn))
 		return -1;
 
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+	if (*this_cpu_ptr(&vector_misaligned_access) == RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN) {
+		*this_cpu_ptr(&vector_misaligned_access) = RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
+		regs->epc = epc + INSN_LEN(insn);
+		return 0;
+	}
+#endif
+
 	regs->epc = 0;
 
 	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
@@ -625,6 +634,57 @@ static bool check_unaligned_access_emulated(int cpu)
 	return misaligned_emu_detected;
 }
 
+#ifdef CONFIG_RISCV_ISA_V
+static bool check_vector_unaligned_access(int cpu)
+{
+	long *mas_ptr = per_cpu_ptr(&vector_misaligned_access, cpu);
+	struct riscv_isainfo *isainfo = &hart_isa[cpu];
+	unsigned long tmp_var;
+	bool misaligned_vec_suported;
+
+	if (!riscv_isa_extension_available(isainfo->isa, v))
+		return false;
+
+	/* This case will only happen if a unaligned vector load
+	 * was called by the kernel before this check
+	 */
+	if (*mas_ptr != RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN)
+		return false;
+
+	kernel_vector_begin();
+	__asm__ __volatile__ (
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"	li t1, 0x1\n"				//size
+		"       vsetvli t0, t1, e16, m2, ta, ma\n\t"	// Vectors of 16b
+		"       addi t0, %[ptr], 1\n\t"			// Misalign address
+		"	vle16.v v0, (t0)\n\t"			// Load bytes
+		".option pop\n\t"
+		: : [ptr] "r" (&tmp_var) : "v0", "t0", "t1", "memory");
+	kernel_vector_end();
+
+	misaligned_vec_suported = (*mas_ptr == RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN);
+
+	return misaligned_vec_suported;
+}
+#else
+static bool check_vector_unaligned_access(int cpu)
+{
+	return false;
+}
+#endif
+
+bool check_vector_unaligned_access_all_cpus(void)
+{
+	int cpu;
+
+	for_each_online_cpu(cpu)
+		if (!check_vector_unaligned_access(cpu))
+			return false;
+
+	return true;
+}
+
 bool check_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..92a84239beaa 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -20,6 +20,7 @@
 #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
 
 DEFINE_PER_CPU(long, misaligned_access_speed);
+DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
 
 #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 static cpumask_t fast_misaligned_access;
@@ -264,6 +265,8 @@ static int check_unaligned_access_all_cpus(void)
 {
 	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
 
+	check_vector_unaligned_access_all_cpus();
+
 	if (!all_cpus_emulated)
 		return check_unaligned_access_speed_all_cpus();
 
@@ -273,6 +276,7 @@ static int check_unaligned_access_all_cpus(void)
 static int check_unaligned_access_all_cpus(void)
 {
 	check_unaligned_access_emulated_all_cpus();
+	check_vector_unaligned_access_all_cpus();
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
