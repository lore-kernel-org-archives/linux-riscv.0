Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BC7ECD9B5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RL2y51wVVYbRx1Tqfl/OTdICsx7Rc/fKJh6BQPD+DwM=; b=go7qvL0IufxFoU
	CjNMSPYrDehKQ8jVP8MSR/oN9d7knM75H4Y7lj08bXvRcTEgHVOj6BH6/QHK8BRw7ohfIWi1+6gND
	M5Gay6i4RhSTW0nxrpq29UhB8U71Emi2llSncV/FVFbZU/uaGZ6PVd3CMX5Hin7KG90U70d8Udxsf
	LwANUcPqylcvdAL5IlrGqG/rbzZo5Fj5ElA0EWLiu7NHyOWbk7AwB94953rylg1Od/t1ru2VnuzjQ
	tv+NOCX4hSaRXmSA/ELcOxYsdngwwp1eD6JJQW90WI3uMIV47zpSH7BFZcUVrDoOfb8lOeGklJ7ze
	HN7fohlWWfIw5Mr1OryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dx-0000000AeHc-08xA;
	Fri, 06 Feb 2026 00:24:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9ds-0000000Ae9F-2TnZ
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615MXDbN378702
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P8QpParZv1w
	+CDvvSy5R0lqzNjzdUp8ROHjISVSX81c=; b=jNXb8H1x4NzKu7EsK7MU1kx3NmQ
	ZfmKekFcKzv/VZ6eD58hfy3HQG+FZcLtgq4D9QYHgM0M3ZvvXaEucr5ixseIKkXw
	OS0FdeVtmJgQgTlSufhXCeG0CJFA/PE4PdLhbaCpQuVZLGpqU3fLbNz0qIcVhu1h
	KOb2EZmsD1nEAiDVDCQ3vjyyD+ZgPOzOW/gjK1N32JcbeEyvQa1j4OqSNqQPguIJ
	E9FQbsbNq24pGTuiIeMBhEZkL/9frzgfHndNaxVCBrSOy9WNneEaNMUAQ95c8yZl
	M/oNO7NK8F6IM0gGR4vvHpoeIT2ZIYF7MjD4Hzv0tveJx2IVn9S4/e5kDaA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0t2dqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1233b91de6bso202074c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337450; x=1770942250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8QpParZv1w+CDvvSy5R0lqzNjzdUp8ROHjISVSX81c=;
        b=YFF9Bl1Cz6o6Fh4NGSlVpso/RLZKK3k5OdZZaBV6437ORb2U+Qj17NFwu2ZVp5GoPw
         YpvwRaOZBOAAiF4UIH58fbY1Ij3LXEhOLt9L/D1JWuS8KSKPq6waRejaA4GHxxnJ74f3
         Scmh3v4pXgOkHNJ2SnVgWCpLDCRDLGvx57euk3Lr/dPPIe1kj+vpSknYXQqDtu+RGnVN
         bXGU1JlEhIt4SjlqPe4m3f4lsPVsjaGr5BubHFiMUdsoagaJe0kIfho9f9xbZwLvSa5M
         xYdrIZfaOKpWX5AXIPOUP2A4WwRDnZzSrw2syarfOSHPd/ZlHyQg9w2nTwTWYUvQTArE
         g11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337450; x=1770942250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8QpParZv1w+CDvvSy5R0lqzNjzdUp8ROHjISVSX81c=;
        b=A875Sd2dcKaxAmERrrs4xtTPDQEM4379YxQ2gQPNkr8sbumXz058aXKRxhmdza4Ekz
         zyN/J/IG+CUp61O3r4So5Ue1JzflYmibg+3FkSPEAgRdkjHR/UHSkU8VDXzOchSd5aV6
         BurPU4t+ZH+excYiPCGa2ZHA1Fghf7PutdTW9M3+5j8wovj3ZtbeWfD33z5TeUI7hpuE
         +cL9CjbpW/D7oWIZMg6qL0DJwobyFtz9aeOaEoEKcO/oD+FhjABXFforjZdCZjFH3WYx
         gQt3HI8wvKo6CkHE8rG32MweAMU6JTLzovmJMK1KxXzuI30fekaJFFQ0GOSInVgOxnrU
         qY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs4HnfbkmVEqi/eE8FprwbUJ6yXJpr/qAEwDs+qTR9ZmOAqGj6B67I5oXcNyNyaJ+QLiKq9ERNfRLj0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywacd1M2Yv8gwFYyL2N7UoIO39Z5OlwwuDvc+EnNcFAcTXngCXq
	2IT+Cs1zRnIL0+Ffx+3RTPytmmJYPrUcdj7drjHc6mqknzxX1NTNMrLyPwrmh+K0g81V5k+nQqJ
	ts9RBrlxnyAjnY+6IjkmUiXN2qml7M9gMxMN9hqCux4FzsDx0/Li5zovXxSG4dhD/ntU5r8Y=
X-Gm-Gg: AZuq6aLMG5ZgniYoOPvOszwJlgFWj17AwAuabUj49zeJyC7hKDd3iuZ2OG4Ou4JbFge
	hq0BqAOGbvxzoacshD5bSx/VsRcdyO8WNZ3hhmxDxTXnObCxpzxqWVmI/ng+SeKFCUZyZDuuwG8
	KT1wyJlE6DgzL8TC74uk1sVr09Jk0Btj+yAAFQX7Bsy6Xiqo27U1pnDzOWx+MbwoT0zp9Y7Su70
	T47NHPWcT0z7yjqiPoN5OL4u2qugZF5BChEZl690sdwoTWcSVMaGFEayyJcP+4OrbTWqcolGwK9
	tQSfx07PFbCxQ/AC4HSspAd3WvvodU5MIep+VuFoY7PKKNhjdhGQrgQFXZuJ0jPpZUYJr30Bi9U
	kutn7Rnm2ZALsdKoKuOk=
X-Received: by 2002:a05:7022:418a:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-1270400c96cmr524455c88.34.1770337450417;
        Thu, 05 Feb 2026 16:24:10 -0800 (PST)
X-Received: by 2002:a05:7022:418a:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-1270400c96cmr524432c88.34.1770337449872;
        Thu, 05 Feb 2026 16:24:09 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270434760fsm743511c88.16.2026.02.05.16.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:09 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to output
Date: Thu,  5 Feb 2026 18:23:48 -0600
Message-ID: <20260206002349.96740-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=WZMBqkhX c=1 sm=1 tr=0 ts=698534ab cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Noaj5xvt71MHO7PBPx4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: BnIA3AQJ2EENRwLYOBFvKFnkwd96cQ8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfXxczTdpS/bHlo
 dc7Ou9/4s5x93bl6dWa4QFQO32pqloMzT1PtOTb8LuoffyY++5HEwZdgZGWAUthmBuInXy5Fhs4
 LdS0P1OLPZqzHxyX9wOcJ3kHnjYErAKfz/JusAZLPvAAqEL+NmXKyEuRo904WMm6PkCijN5J3Ie
 xYVgFSGDXu233CW4ovTWvP5neQMVDUIhWHYR5CXRX76mVSokkLq1b9h1ysFtCZ+E72C3IHeK8EM
 STiN4CFCGKrbwXeBkyc5Ie1W/+MhanZVEGgEfORJStozeMimnbM3nphU/BMJROY2Q/rGuqjh/Pe
 a0RP9e9a3P4GUZuq0q64Tdwdm4DX09WN3mNvFOrYlCV/HfDYA1/qLDoN+Duf3bZtMFzzrxtNm2d
 TR8u5kKTk6tPv7vY4sB2Ey0Pns07QTDTsDr9ivMZD4xyDy5iI597dmGzHNcz153jT6banpRSnJv
 cLm8DnnnEquHYvWfT+A==
X-Proofpoint-ORIG-GUID: BnIA3AQJ2EENRwLYOBFvKFnkwd96cQ8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162412_797541_438BEFB4 
X-CRM114-Status: GOOD (  18.41  )
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

Output the rva23(u|s)64 ISA bases that the ISA extensions provide on
new 'isa bases' lines both for the LCD of all harts and per hart, as
shown in the example output below when booting qemu with
-cpu rva23s64,sv39=on,pmp=on:

processor       : 0
hart            : 4
isa bases       : rv64ima rva23u64
isa             : rv64imafdcbvh_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zifencei_zihintntl_zihintpause_zihpm_zimop_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_zvkb_zvkt_smaia_smnpm_smstateen_ssaia_sscofpmf_ssnpm_sstc_svade_svinval_svnapot_svpbmt
mmu             : sv39
mvendorid       : 0x0
marchid         : 0x0
mimpid          : 0x0
hart isa bases  : rv64ima rva23u64
hart isa        : rv64imafdcbvh_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zifencei_zihintntl_zihintpause_zihpm_zimop_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_zvkb_zvkt_smaia_smnpm_smstateen_ssaia_sscofpmf_ssnpm_sstc_svade_svinval_svnapot_svpbmt

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/include/asm/cpufeature.h | 10 ++++
 arch/riscv/kernel/cpu.c             | 34 ++++++++++++
 arch/riscv/kernel/cpufeature.c      | 83 +++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 62837fa981e8..e750735c5686 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,7 +25,15 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_ISA_BASE_RVA23S64,
+	RISCV_NR_ISA_BASES,
+};
+
 struct riscv_isainfo {
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
 };
 
@@ -152,4 +160,6 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+void riscv_set_isa_bases(unsigned long *isa_bases, const unsigned long *isa_bitmap);
+
 #endif
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..228867d7dc00 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,34 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES);
+
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+	[RISCV_ISA_BASE_RVA23S64] = "rva23s64",
+};
+
+static void print_isa_bases(struct seq_file *m,
+			    const unsigned long *isa_bases,
+			    const unsigned long *isa)
+{
+	unsigned int i;
+
+	if (bitmap_empty(isa_bases, RISCV_NR_ISA_BASES))
+		riscv_set_isa_bases((unsigned long *)isa_bases, isa);
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +364,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases, NULL);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +391,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases, hart_isa[cpu_id].isa);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b001e78eecf6..07a42545e9e0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1262,3 +1262,86 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+extern bool riscv_have_user_pmlen_7;
+
+void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+	DECLARE_BITMAP(tmp, RISCV_ISA_EXT_MAX);
+
+	/* IMA */
+	set_bit(RISCV_ISA_EXT_I, ext_mask);
+	set_bit(RISCV_ISA_EXT_M, ext_mask);
+	set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Zic64b and Supm with PMLEN=7 */
+	if (riscv_cbom_block_size != 64 ||
+	    riscv_cbop_block_size != 64 ||
+	    riscv_cboz_block_size != 64 ||
+	    !riscv_have_user_pmlen_7)
+		return;
+
+	set_bit(RISCV_ISA_EXT_F, ext_mask);
+	set_bit(RISCV_ISA_EXT_D, ext_mask);
+	set_bit(RISCV_ISA_EXT_C, ext_mask);
+	set_bit(RISCV_ISA_EXT_B, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	set_bit(RISCV_ISA_EXT_V, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+
+	/* RVA23S64 */
+	set_bit(RISCV_ISA_EXT_ZIFENCEI, ext_mask);
+	/* TODO: Ss1p13 */
+	/* Svbare, Sv39 -- assumed */
+	set_bit(RISCV_ISA_EXT_SVADE, ext_mask);
+	/* TODO: Ssccptr, Sstvecd, Sstvala, Sscounterenw */
+	set_bit(RISCV_ISA_EXT_SVPBMT, ext_mask);
+	set_bit(RISCV_ISA_EXT_SVINVAL, ext_mask);
+	set_bit(RISCV_ISA_EXT_SVNAPOT, ext_mask);
+	set_bit(RISCV_ISA_EXT_SSTC, ext_mask);
+	set_bit(RISCV_ISA_EXT_SSCOFPMF, ext_mask);
+	set_bit(RISCV_ISA_EXT_SSNPM, ext_mask);
+	/* TODO: Ssu64xl */
+	/* TODO: Sha = Ssstateen, Shcounterenw, Shvstvala, Shtvala, Shvstvecd, Shvsatpa, Shgatpa */
+	set_bit(RISCV_ISA_EXT_H, ext_mask);
+
+	if (/*TODO*/ false && !bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		set_bit(RISCV_ISA_BASE_RVA23S64, bases);
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
