Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7FCECD9B9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLJI0SQpn6Z7vWh9nVOYS8/r+0RKWTMP8x97BSu7EBY=; b=SQnE71Z1Fom/lz
	5fFCMGGcvY5FCP1x/rNCw4dPqtBFjiI9EwqQ50y0Nv2CDlmzVqWkN234f/MgViFej/l8I+M8hFew4
	u5IpzScR62q7X1UQn41wZnb4UTl0rBhqc7Uc46GslekO42wJGeCQjeT8XgvhR3NC5Ze/PcvRoXxTa
	kPuZFBtJmep2c3IHpJaMww0pjLfCZVyTzSXECFRgTgFn5sLTxh94gB8Gxnsavg6j7ZST8hF1hl3GJ
	G4IVqtDugQPxQmaOohhptVPywY2nTqGgOfs0rpGE/cvnAc5WXzj1GjcZ1F5d7f7gW25csutOqJZPz
	7QJBSuV17wq+bmz0zr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dr-0000000Ae8b-2999;
	Fri, 06 Feb 2026 00:24:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9do-0000000Ae3s-49fO
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615M7ojP334710
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sbwpOSu2blZ
	uBmMZ8XQFEq8p5mZGYu2zJLM2rrJqZa8=; b=YjrvwlzDvneXTB3dSzpKCCf8akB
	1JrtE2QiXhLTBuoQEwjhAmgGCD7Lh/sSBF3T57zD8u8J10U6Ho/Dd7+wP26sSxk/
	Gt19aZhLnrWUr/ifHNUv0f4yQmi64/b958Bz6Ucl27dkjIUzagK5ljM0BfhNQ8yg
	HhYSKDF7RCU9zxjPK4m/x2Ai/dzQpV9zkYD27NE1yR5P2wj/tLfhPSA5LC6wkZZ1
	oelnglszmthjo3XY4j3MeuUv2CurHnE7F6/NPTh0C1Jd9NVcrOnGKdZ8QTflmNL6
	xVQJ7cDlunThr2Nj9uqfKdGgfQyMey4DzDXH1uqbkbLESRx7wbvazXK8bwQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qv8bj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b8335e64e0so972175eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337447; x=1770942247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbwpOSu2blZuBmMZ8XQFEq8p5mZGYu2zJLM2rrJqZa8=;
        b=LpD9o63W8NxlaVbgaIP2hrWvqjyYpbroJjzTEDoA7jZhutKiyBPzC0YJGeXIENMF/P
         Z/mZuw3QVoYJM1p0nJxxNHeHMzdm4f8L6ZE4CHZK2ZtmzvJCigLa67Pcspk26nDVwzgK
         DnvHejHoUmSB72FXRVhPQRDO3F3gPrlvwzxZzSKNQaJn3IJZbXwhpfiZe/Mr43LHHBQ9
         SMEqj/QC6KYVslyyifdtcYSCcjxCDf8degPgS5WOnORcC2nAO3Ofwg5HLcdO6eVs/8Wy
         SP+6eROys+irlR4YmR277bz7Hiq2nLzYvqkZXYCngsxeZpI9qzNoaqzWkckDqCTue/gp
         B+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337447; x=1770942247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sbwpOSu2blZuBmMZ8XQFEq8p5mZGYu2zJLM2rrJqZa8=;
        b=JiM9JnawcFXOpejjcKIRL5l12HCDpRQenQUnZbHtjYnVEL+atIpGXKKVL+Gne7n4QA
         mzDtL5x9n7nPleD3z/jHzX11Lh2KzDue9yrjGwigdU0jQQTV8WxL7n+80x/Mulvo0hTR
         8fmY2ha64Yim4RQJG7ulB+qUJJaQtT3aCe8yuQ1B97lY+I+VFM9R11B4SPc5hQkIG0Cf
         RpSPPMm/2Kv/PsHaJuudt6rmz2LcGT0wsSdxmkF3216l0XzhyDEfjvWJGQM5sZhZBevE
         aXEKvVOkf3soQsnvAkfafnp+yA0eTUj2ez16cescQkkrY7BXPeQndwlouc5anA3wzYMo
         cYcA==
X-Forwarded-Encrypted: i=1; AJvYcCX7VSCgwThLI+aaGcFZFCLawSUvH+AUgMHYWK55gQs5TWygZ2D9VFjpNYHyjq/6rPLNFJR1tX1PvDs/+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX/V9DL7R/z3V1nIdAVgCVhQFl1ZiRi6HeOV17vqw7bG8yfLS4
	fAWvreXzwgBjXISqaFFSkYbcRreEZpyYUQDhbhhyJJIo8THgg+PxX5/lTN7lc6NFwXgcxdkrqiM
	BEU+D0DCuB4HWNhZzRGv1OTt4fpqFLv/gdPbAeXNS1V12VYrxf0X2qOUgc0HbKuA55fEfe3U=
X-Gm-Gg: AZuq6aJLnbz9xDQ6J+p6j+CT7XnPa6qFALQWiDneDtP3bQpVGYXnr0q+QzkcU8N6VYm
	x9AcOWJXQwcyOUQuR321HYWEH0VSl6702c2p/PJdRLGr14Kmjy1dR0UtVhguW0ytSFTq+WnnE6F
	2PEZDQ/4kqU8MHjVpOOpUCSaAaUrLQTrvDpcZwRSMOIIPJ8coKV3vonbgJs9yLNQeE+eaZWPqoo
	chj+GNPajV6FmecxUt6enopvE6gvQPNALBWvVH6Qe9YWJGKNlhqXymBzlGkKXPo2r5yQyugKzZb
	G8L1bkbtLKmpFoiZnICub/ebw1uPBvC1e3kMI5RfGF5LWC8+KReFyQ+wy2ZuSPvWWq152QKDcp3
	SpebkcBjXuSroDKf+E0E=
X-Received: by 2002:a05:7300:8c03:b0:2b7:fdb6:ccf2 with SMTP id 5a478bee46e88-2b856484d25mr468687eec.13.1770337446894;
        Thu, 05 Feb 2026 16:24:06 -0800 (PST)
X-Received: by 2002:a05:7300:8c03:b0:2b7:fdb6:ccf2 with SMTP id 5a478bee46e88-2b856484d25mr468671eec.13.1770337446284;
        Thu, 05 Feb 2026 16:24:06 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855b0f624sm847825eec.14.2026.02.05.16.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:05 -0800 (PST)
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
Subject: [RFC PATCH v1 08/11] riscv: hwprobe: Introduce rva23u64 base behavior
Date: Thu,  5 Feb 2026 18:23:46 -0600
Message-ID: <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=698534a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=It5_YO3Bqo782jOVlSYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1mS_R-QA2Fi1c0V--PKo_MtE-oLroTG0
X-Proofpoint-GUID: 1mS_R-QA2Fi1c0V--PKo_MtE-oLroTG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX7hC+nMRmBA4W
 78Aj/9KIOow/0MlolwXiDWEJ3IjEka3xwPRS3VHzW7D2CxRzHUMpLLMEjNaDOV3YYvVUGvcpgJM
 T826a4TBPVd+jgO9uRMBGC0H7AA5DyNJfYULEYPaX48ruSdwQ5SMqepoj/XvQMqIqMgKU39s8oq
 WKAr9K6i/MQafoZwghUXcPMdTcoyiWWH/SBSMM18KymsoK6+Vn7HfMgeLhYMhMpROZRPU5XM3mC
 XkdgimccUTYXlXnhw8X1L4QQETA02QY4SnMs0RXhcJL0YARhwoxDv1rpAhn64PPjSNwaZW0cAzD
 Zgc3edZIOPc/xuu0W+gWd1d4HI6dLyWi5H7JLsyKwwDD3OepX6yLRMJedolD6SVqhoiiVrP9alv
 M3ocSBU3QEPwWbljxly5SXp/QIYUMLtu3I+bYfaDR/psqLTQN49Tyowmf1npPGbA1cbnJhtjfiv
 2rkGgZ1FTn8dxq1W4uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162409_180672_A3F8D601 
X-CRM114-Status: GOOD (  22.72  )
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

Provide a bit to conveniently determine when RVA23U64 is supported.
While it's already possible to determine RVA23U64 support with five
hwprobe calls and four prctl calls it would be error-prone to require
anything (and we presume eventually almost everything) that needs to
check for RVA23U64 support to all implement those calls and specific
checks. And, while RVA23U64 is the IMA base with mandated extensions,
most software will consider it a new base. For these reasons, add
the RVA23U64 bit as a base behavior bit.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst          |  8 +++
 arch/riscv/include/uapi/asm/hwprobe.h         |  3 +-
 arch/riscv/kernel/sys_hwprobe.c               | 72 +++++++++++++++++++
 .../selftests/riscv/hwprobe/which-cpus.c      |  2 +-
 4 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 97226b7c5936..6d915e7ba58a 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit b1d80660 ("Updated to ratified state.")
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index fed9ea6fd2b5..72d2a4d0b733 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,7 +21,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 31d222301bf0..4b9981b15ebe 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -23,6 +23,7 @@
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
 
+extern bool riscv_have_user_pmlen_7;
 
 #define EXT_KEY(isa_arg, ext, pv, missing)					\
 	do {										\
@@ -222,6 +223,75 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+#define HWPROBE_EXT0_RVA23U64 (					\
+	/* IMA is always supported */				\
+	RISCV_HWPROBE_IMA_FD				|	\
+	RISCV_HWPROBE_IMA_C				|	\
+	/* B is Zba, Zbb and Zbs */				\
+	RISCV_HWPROBE_EXT_ZBA				|	\
+	RISCV_HWPROBE_EXT_ZBB				|	\
+	RISCV_HWPROBE_EXT_ZBS				|	\
+	/* ZICSR is always supported */				\
+	RISCV_HWPROBE_EXT_ZICNTR			|	\
+	RISCV_HWPROBE_EXT_ZIHPM				|	\
+	/* ZICCIF is in EXT1 */					\
+	/* ZICCRSE is in EXT1 */				\
+	/* ZICCAMOA is in EXT1 */				\
+	RISCV_HWPROBE_EXT_ZICCLSM			|	\
+	/* ZA64RS is in EXT1 */					\
+	RISCV_HWPROBE_EXT_ZIHINTPAUSE			|	\
+	/* ZIC64B (check block sizes are 64b) */		\
+	RISCV_HWPROBE_EXT_ZICBOM			|	\
+	RISCV_HWPROBE_EXT_ZICBOP			|	\
+	RISCV_HWPROBE_EXT_ZICBOZ			|	\
+	RISCV_HWPROBE_EXT_ZFHMIN			|	\
+	RISCV_HWPROBE_EXT_ZKT				|	\
+	RISCV_HWPROBE_IMA_V				|	\
+	RISCV_HWPROBE_EXT_ZVFHMIN			|	\
+	RISCV_HWPROBE_EXT_ZVBB				|	\
+	RISCV_HWPROBE_EXT_ZVKT				|	\
+	RISCV_HWPROBE_EXT_ZIHINTNTL			|	\
+	RISCV_HWPROBE_EXT_ZICOND			|	\
+	RISCV_HWPROBE_EXT_ZIMOP				|	\
+	RISCV_HWPROBE_EXT_ZCMOP				|	\
+	RISCV_HWPROBE_EXT_ZCB				|	\
+	RISCV_HWPROBE_EXT_ZFA				|	\
+	RISCV_HWPROBE_EXT_ZAWRS				|	\
+	RISCV_HWPROBE_EXT_SUPM /* (check PMLEN=7 support) */	\
+)
+
+#define HWPROBE_EXT1_RVA23U64 (					\
+	RISCV_HWPROBE_EXT_ZICCIF			|	\
+	RISCV_HWPROBE_EXT_ZICCRSE			|	\
+	RISCV_HWPROBE_EXT_ZICCAMOA			|	\
+	RISCV_HWPROBE_EXT_ZA64RS				\
+)
+
+static bool hwprobe_has_rva23u64(const struct cpumask *cpus)
+{
+	struct riscv_hwprobe pair;
+
+	if (!IS_ENABLED(CONFIG_64BIT))
+		return false;
+
+	/* Additional mandates for Zic64b and Supm */
+	if (riscv_cbom_block_size != 64 ||
+	    riscv_cbop_block_size != 64 ||
+	    riscv_cboz_block_size != 64 ||
+	    !riscv_have_user_pmlen_7)
+		return false;
+
+	hwprobe_isa_ext0(&pair, cpus);
+	if ((pair.value & HWPROBE_EXT0_RVA23U64) != HWPROBE_EXT0_RVA23U64)
+		return false;
+
+	hwprobe_isa_ext1(&pair, cpus);
+	if ((pair.value & HWPROBE_EXT1_RVA23U64) != HWPROBE_EXT1_RVA23U64)
+		return false;
+
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -312,6 +382,8 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_rva23u64(cpus))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c04..f8c797b1d0fd 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
