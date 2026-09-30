Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C545CA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuCqg/1O7T8UnZB9XlC92hD6wKaerTT7idUirL3vqiA=; b=3ZG/kvety4QPHp
	lZdr9l4qceYOELF1Dh3w+h/AI6oP/y0K/ZFoPBsj+e4vUFL6WU5C0OVSjLM8OewK5sPp53qiUE5hd
	PjxbwKyV7yyxTRdx1MRAMjjtDK+YHcR2fxEa13vo6cqb6WGoI2aM22fJr7SWL1PDkxoi63dcFiWzk
	Iq5BAymdSIwfIMeUTVjLoWehjwSNU/0bgWuCPClVmQHhQHAjgfDKUw3ruM/A0/Y1MoNd3mfQKGRzM
	UrVFgJ9TWL3jLa1auswnl4PU3aaJEIIcBqQGT86/wZuJVhsnYUafyKRvMJOqm0wLV5tyP2pRULtBA
	AD9oinQ5WIypDFt5q14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnze-00000005AXu-0CYV;
	Wed, 30 Sep 2026 06:40:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnzc-00000005AWp-3Sx8
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e9SunJHY/49eRz/XxwO9Hm0rNLEpbDgeen5GEOzxiJQ=; b=Gt8xBkbdzcyMJwP7GgjXF4faK2
	ZaN6JRas2chrtPjVifFHnwav84i5M284DfOrGnD4Ast45vP3vg4u5qmjFL5/89p+akCQoT7CtDGez
	O3jFvriQHJmNt/8EpfpvJPPgNAOb9+8xNyAH3oSUuO4w1qCODJhCI6mMibLNmZQr9qFECEZYL+lXI
	QzVzLDLRVyNasB/UX6mdXOrlX6eX9ifUJ30Oy3XsoR92HGdamSawd01S/IirK5Y8kktrLEt+bIsma
	AS3qA221BSHJoij7p/34L0j5ndbL2Ocs9NyyB98JnD+szsDSOyH2j0CsaNISzifeU+xxhGuV6Hzj/
	LrKhX82w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBnyw-00000003QKZ-3mlQ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:40:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1Brmm1967455
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e9SunJHY/49
	eRz/XxwO9Hm0rNLEpbDgeen5GEOzxiJQ=; b=Rlt/F4xFMIe86HlRua1WEZLPU93
	GqbRwtOGO+8PmO2LXSTlC2ERM5a/yk8FYyO1GgYwhGIP+Ihk0g4SxmfC8uQ/88tm
	tQFCDghmS4HyI/xldFweS+6j95aBOriE7rAsZhr0qir44GJiEb41Gm1wHDDCWx3l
	kSd8yKZJaef1NYnP5U+feqbjKvVphCdjFPd+WFQhwRxqNi5KrdJV5AUoNjM/f6/C
	cgnxiiqUXeE4XJ54N7OP4ocfpRSQFhJYYBAIMR4WM2UzEJ/axfDFk5xoNNyaWAb7
	IIKWAU/yO4PqS3IoaFeX3oiX/P9JvTa9lTIVbKW1cRfMbs7aze9qQJQhG2Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2s92q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:57 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-142f4306744so3888467c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750396; x=1791355196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9SunJHY/49eRz/XxwO9Hm0rNLEpbDgeen5GEOzxiJQ=;
        b=Fj/9jkMUpJTEtQq6u0vtIljG+1B8vnrQLZhz2Cu12NkDS6uHWvslEPjL/JnguUMVK3
         Wr28VDk0RG0OJEV+KDs7yTRGlXRrIkebmtm/yzVodEIHxHoenWvMubquzBCi2fmP6suu
         PRP8RZUUedeGy1X5EEzlAH56AOVdz3ZJmK622GSxhJ+twhaeOYFt7XNuyik6fpveFNfT
         FicR8rQcJIQdI4iF/o+2zpxrj1+MtPINT3vZ3rBgWXjpus1AdawG84PN1CwwWNx359gR
         Dd2CWHpOU/lPYa4BaaFLlVSiNMTlSnMylSDMZzLAKYQu8sFgnDFX/I8pdtdi9FO9yK6T
         sBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750396; x=1791355196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9SunJHY/49eRz/XxwO9Hm0rNLEpbDgeen5GEOzxiJQ=;
        b=r1KlSfkVgZdmNg8yGmhaBaQWmPV9U305xo7MmSzXEUz6nJ21ZDqEqURCiSBdncB8u3
         QIk5Shnv0bGqr5RBjU81CbZhUVxmRu6YqpIq/0+yHwWzjVo6nHWKz5EWRXSpU8UaKQGa
         MGcBB5f/xoG1gUFSpUkc+tlkhwdDHmbvO3vsbHj+INhpzis/frITnvZMsDCC4GnpNS+P
         shCIFVECJ7xMRL6FuYJXr1+hh2ElZC4dDcNoV9uLbSuvDUw8tYD3NyTkIKtxfJsbu1UI
         6Zjp73nin0d2az1//EprFxP5CyX2FE2cHaM47bPaEXIOiFTwHR2LoYUH4Fu5+OmQTMmF
         j/4w==
X-Forwarded-Encrypted: i=1; AKwUvBxY97lT97w4o1fqC54zOKLwk8wwOQIYXBBiuS/OIr0tKPHPU/NPp+b6uAwKEMgCWnxUOi7pL2bK9ed8jw==@lists.infradead.org
X-Gm-Message-State: AFuF++khIi36C3KjzN2nzhlw9mx+ot//AyvPJm/fD7MGVICyh5vREtsE
	jfA5y25TecBVWj6Gec2swsNCVXfhf466RO0l/dtGJhXBhkBVcjZx1tcy97bjLtNqYTUGLAwLo0t
	KEIL01rO929i6/JLoSy3PzcytwcUMuMrEVYLiImS+ak5g6b/me0ShcqtR/OiZc3ZhwLrvDBE=
X-Gm-Gg: AYBFou25cYBzbZJC98twj35jNJ38bZiITRFANaAFB8gaNwnI4ALFl7Xv9X2GI9YMfD1
	F6zC4bDF7S3ko5mxe+AsyqAJISMqhZye12I88P34iuEEtrdE+cRvzNorEo8v0vJfZJcA9702X5t
	ojxgJzdSnCrF2lXoVc548BtprdhlbaRXEwGWDp5N2FR5ZCPOmiJduAGx9+9vt4ZYapeYxbTBMtX
	31BHkCbjdadYembgFciXlUTS+uw78DaQ4Y5w4tTcHUI0I5Nt2tP41pxZ38MHzHHyedeWYjNl+/2
	4WqjCAMhy66uhgg2VE21bUx4nt6cBPe/s4GL0TmahS6tJlqPEMY7fKuQQrmb21wcumS22KG1YrH
	/VC5jLNXHeBUnt6l/JZeFOemtxfCmnoYrEllK5huPq8VfRYI9/eLoVCvR3TwLSv6p78FSjtlmiA
	T00t/lXjFNH4lPR53+ynK98vav
X-Received: by 2002:a05:7022:238c:b0:143:46a6:b04f with SMTP id a92af1059eb24-14d32bde173mr538854c88.31.1790750396177;
        Tue, 29 Sep 2026 23:39:56 -0700 (PDT)
X-Received: by 2002:a05:7022:238c:b0:143:46a6:b04f with SMTP id a92af1059eb24-14d32bde173mr538801c88.31.1790750395492;
        Tue, 29 Sep 2026 23:39:55 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:55 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 5/8] RISC-V: Add fetch and decode helpers to a common file
Date: Wed, 30 Sep 2026 12:09:16 +0530
Message-ID: <20260930063919.608911-6-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: mV1xsT7RymDOCVvjwBA6kjJgUrGRNyVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX4CGMItUW2mIk
 Xrx3xz0WUdTWVHHzsEUfwAZwD0b40usAHD4/wB+hBQsS89OwApx9eepiOwjxIFg68ZzTLRUF39o
 gduzR4K5KOag4ruhUxYcxYBSSm+6TVR8XQ2r3oRTap/dB204ZROTGm15NUrbcmShBSYfGwT9oui
 /gKV9T7KNET9xB1US9t1O8F8a0O0HWXdo8bXQs6MqqOjyIvNjYAUIfvWtMKvUoH3Ch7pl+2CrJB
 rBzy50p+XtHFVbv/qIo7B7T/+CFhBYz3161aHys9GYEVVdRoTx0azUq3/5Zz0ShQnSt+FqYEUIX
 usF4A4rPFgStMVJ8ht0+Vqwnm4Z6mpUdKXqOBKVnLLdtk6s08Hd1Fgn/ZooPRs7Rcl6c7v4jmfQ
 HK+ObmNbCHCbSaGAfzI1WOiR5vI3goI92OxYxG4suzz54LUtoLnqIGjKF3l8QJdt6J5K1s+DzGe
 wp7WjaBOxSgiKqnLEPQ==
X-Proofpoint-GUID: mV1xsT7RymDOCVvjwBA6kjJgUrGRNyVs
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abcaebd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=20KFwNOVAAAA:8 a=XkDl4Et5ty8ZtOCQo2QA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfXzDY9oiuLv5FN
 9M6OoaUO2FlgeSf1l4a2T40wONbJfzW7z6YQB1U9Cfr0jzLldegUTrXOqL3LPw/o5meSxaqnQ92
 jSu1MFU+nUcfOwkjpnCsYknCO4SOfFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074009_078344_BE4D7391 
X-CRM114-Status: GOOD (  31.94  )
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

Move get_insn() and __read_insn() from traps_misaligned.c

Add helpers for RISC-V register access and control-flow emulation

Add helpers to retrieve RISC-V register values, calcuate the next
execution address based on current pc, register states and by evaluating
conditional branch instructions. the helpers accommodate both compressed
and standard instructions. Add helper to determine is brach will be taken
by current pc. It supports register-based jumps, immediate jumps, BEQZ/BNEZ
conditional branches, and signed and unsigned comparisons for standard
conditional branch instructions.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Jesse Taube <jtaubepe@redhat.com>
---
 arch/riscv/include/asm/insn.h        |  15 ++
 arch/riscv/kernel/traps_misaligned.c |  52 +-----
 arch/riscv/lib/Makefile              |   1 +
 arch/riscv/lib/insn.c                | 263 +++++++++++++++++++++++++++
 4 files changed, 280 insertions(+), 51 deletions(-)
 create mode 100644 arch/riscv/lib/insn.c

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..b2125728d4e9 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -227,9 +227,16 @@
 #define RVC_MASK_C_EBREAK	0xffff
 #define RVG_MASK_EBREAK		0xffffffff
 #define RVG_MASK_SRET		0xffffffff
+#define RVC_MASK_INSN		GENMASK(15, 0)
 
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
+
+static __always_inline bool riscv_insn_is_compressed(u32 code)
+{
+	return (code & (__INSN_LENGTH_MASK)) != (__INSN_LENGTH_GE_32);
+}
+
 #define __INSN_OPCODE_MASK	_UL(0x7F)
 #define __INSN_BRANCH_OPCODE	_UL(RVG_OPCODE_BRANCH)
 
@@ -600,4 +607,12 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
 	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
 }
+#ifndef __ASSEMBLY__
+#include <asm/ptrace.h>
+
+int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn);
+int get_insn_safe(struct pt_regs *regs, ulong epc, ulong *r_insn);
+unsigned long get_next_insn_address(struct pt_regs *regs, ulong insn, ulong pc);
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 6e8ae6c66322..541e6a5b8039 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -10,6 +10,7 @@
 #include <linux/irq.h>
 #include <linux/stringify.h>
 
+#include <asm/insn.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
@@ -129,57 +130,6 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 #define GET_F32_RS2C(insn, regs) (get_f32_rs(insn, 2, regs))
 #define GET_F32_RS2S(insn, regs) (get_f32_rs(RVC_RS2S(insn), 0, regs))
 
-#define __read_insn(regs, insn, insn_addr, type)	\
-({							\
-	int __ret;					\
-							\
-	if (user_mode(regs)) {				\
-		__ret = get_user(insn, (type __user *) insn_addr); \
-	} else {					\
-		insn = *(type *)insn_addr;		\
-		__ret = 0;				\
-	}						\
-							\
-	__ret;						\
-})
-
-static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
-{
-	ulong insn = 0;
-
-	if (epc & 0x2) {
-		ulong tmp = 0;
-
-		if (__read_insn(regs, insn, epc, u16))
-			return -EFAULT;
-		/* __get_user() uses regular "lw" which sign extend the loaded
-		 * value make sure to clear higher order bits in case we "or" it
-		 * below with the upper 16 bits half.
-		 */
-		insn &= GENMASK(15, 0);
-		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		epc += sizeof(u16);
-		if (__read_insn(regs, tmp, epc, u16))
-			return -EFAULT;
-		*r_insn = (tmp << 16) | insn;
-
-		return 0;
-	} else {
-		if (__read_insn(regs, insn, epc, u32))
-			return -EFAULT;
-		if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		insn &= GENMASK(15, 0);
-		*r_insn = insn;
-
-		return 0;
-	}
-}
 
 union reg_data {
 	u8 data_bytes[8];
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index f668b98970bd..84cdd35afa42 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 lib-y			+= delay.o
+lib-y			+= insn.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
diff --git a/arch/riscv/lib/insn.c b/arch/riscv/lib/insn.c
new file mode 100644
index 000000000000..361cac7abe10
--- /dev/null
+++ b/arch/riscv/lib/insn.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 Qualcomm Technoloies, Inc.
+ */
+
+#include <linux/uaccess.h>
+
+#include <asm/insn.h>
+#include <asm/ptrace.h>
+#include <asm/uaccess.h>
+
+/**
+ * __fetch_insn() - Fetch a RISC-V instruction parcel from memory
+ * @regs: Register state used to determine the access context
+ * @insn: Variable receiving the instruction value
+ * @insn_addr: Address from which to read the instruction parcel
+ * @type: Instruction parcel type, either @u16 or @u32
+ *
+ * Fetches an instruction parcel from user or kernel memory, depending on the
+ * execution context indicated by @regs. RISC-V instruction parcels are
+ * stored in little-endian byte order, so the fetched value is converted from
+ * little-endian to the native CPU representation before being assigned to
+ * @insn.
+ *
+ * The conversion is a no-op on little-endian targets and performs the
+ * required byte swap on big-endian targets.
+ *
+ * Return: 0 on success, or a negative error code if reading user memory
+ *         fails.
+ */
+#define __fetch_insn(regs, insn, insn_addr, type)		\
+({								\
+	type __val;						\
+	int __ret;						\
+								\
+	if (user_mode(regs))					\
+		__ret = get_user(__val,				\
+				 (type __user *)(insn_addr));	\
+	else {							\
+		__val = *(type *)(insn_addr);			\
+		__ret = 0;					\
+	}							\
+								\
+	if (!__ret) {						\
+		if (sizeof(type) == sizeof(u16))			\
+			(insn) = le16_to_cpu((__force __le16)__val);	\
+		else							\
+			(insn) = le32_to_cpu((__force __le32)__val);	\
+	}							\
+								\
+	__ret;							\
+})
+
+/**
+ * get_insn() - Fetch and decode a RISC-V instruction
+ * @regs: Register state used for instruction access
+ * @epc: Address of the instruction to fetch
+ * @r_insn: Pointer to store the fetched instruction encoding
+ *
+ * Fetches the instruction at @epc and stores its encoding in @r_insn.
+ * Both standard 32-bit instructions and compressed 16-bit instructions are
+ * supported. If a 32-bit instruction is split across two 16-bit instruction
+ * accesses, the halfwords are combined into a single instruction encoding.
+ *
+ * Return: 0 on success, or %-EFAULT if instruction access fails.
+ */
+int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
+{
+	ulong insn, tmp;
+
+	if (!(epc & 0x2)) {
+		if (__fetch_insn(regs, insn, epc, u32))
+			return -EFAULT;
+
+		if (riscv_insn_is_compressed(insn))
+			insn &= RVC_MASK_INSN;
+
+		*r_insn = insn;
+		return 0;
+	}
+
+	if (__fetch_insn(regs, insn, epc, u16))
+		return -EFAULT;
+
+	insn &= RVC_MASK_INSN;
+	if (riscv_insn_is_compressed(insn)) {
+		*r_insn = insn;
+		return 0;
+	}
+
+	if (__fetch_insn(regs, tmp, epc + sizeof(u16), u16))
+		return -EFAULT;
+
+	*r_insn = (tmp << 16) | insn;
+
+	return 0;
+}
+
+int get_insn_safe(struct pt_regs *regs, ulong epc, ulong *r_insn)
+{
+	int ret;
+
+	pagefault_disable();
+	ret = get_insn(regs, epc, r_insn);
+	pagefault_enable();
+
+	return ret;
+}
+
+/**
+ * riscv_get_reg_value() - Get the value stored the given RISC-V register number
+ * @regs: Register state containing the saved register values
+ * @regno: RISC-V register number
+ *
+ * Returns the value of the RISC-V register identified by @regno. Register
+ * x0 always returns zero, as required by the RISC-V ISA.
+ *
+ * Return: The register value, or zero if @regno is zero.
+ */
+static unsigned long riscv_get_reg_value(struct pt_regs *regs, unsigned int regno)
+{
+	return regno ? regs_get_register(regs, regno * sizeof(unsigned long)) : 0;
+}
+
+/**
+ * get_next_insn_address_compressed() - Calculate the next address for a compressed
+ * RISC-V instruction
+ * @regs: Register state used to evaluate indirect jumps and conditional
+ *        branches
+ * @insn: Compressed RISC-V instruction encoding
+ * @pc: Current program counter
+ *
+ * Determines the address at which execution should continue after processing
+ * the compressed instruction in @insn. Indirect jumps use the value of the
+ * instruction's source register, unconditional jumps use the encoded
+ * immediate, and conditional branches evaluate the relevant register value.
+ *
+ * For a branch that is not taken, or for an unsupported compressed
+ * instruction, the address of the following 16-bit instruction is returned.
+ *
+ * Return: The next instruction address.
+ */
+static unsigned long get_next_insn_address_compressed(struct pt_regs *regs, u32 insn,
+						      unsigned long pc)
+{
+	unsigned int rs1_num;
+
+	if (riscv_insn_is_c_jalr(insn) || riscv_insn_is_c_jr(insn)) {
+		rs1_num = RV_X(insn, RVC_C2_RS1_OPOFF, 5);
+		return regs_get_register(regs, rs1_num * sizeof(unsigned long));
+	}
+
+	if (riscv_insn_is_c_j(insn) || riscv_insn_is_c_jal(insn))
+		return RVC_EXTRACT_JTYPE_IMM(insn) + pc;
+
+	if (riscv_insn_is_c_beqz(insn)) {
+		rs1_num = RV_X(insn, RVC_C1_RS1_OPOFF, 3) + 8;
+		if (!rs1_num || riscv_get_reg_value(regs, rs1_num) == 0)
+			return RVC_EXTRACT_BTYPE_IMM(insn) + pc;
+		return pc + 2;
+	}
+
+	if (riscv_insn_is_c_bnez(insn)) {
+		rs1_num = RV_X(insn, RVC_C1_RS1_OPOFF, 3) + 8;
+		if (rs1_num && riscv_get_reg_value(regs, rs1_num) != 0)
+			return RVC_EXTRACT_BTYPE_IMM(insn) + pc;
+		return pc + 2;
+	}
+
+	return pc + 2;
+}
+
+/**
+ * riscv_branch_taken() - Determine whether a RISC-V conditional branch is taken
+ * @regs: Register state used to obtain the source operand values
+ * @insn: RISC-V branch instruction encoding
+ *
+ * Evaluates the branch condition encoded in @insn using the values of its
+ * source registers from @regs. Signed comparisons are used for BLT and BGE,
+ * while unsigned comparisons are used for BLTU and BGEU.
+ *
+ * Return: %true if the branch condition is satisfied, or %false otherwise.
+ *         Unsupported branch instructions also return %false.
+ */
+static bool riscv_branch_taken(struct pt_regs *regs, u32 insn)
+{
+	unsigned int rs1_num = RV_X(insn, RVG_RS1_OPOFF, 5);
+	unsigned int rs2_num = RV_X(insn, RVG_RS2_OPOFF, 5);
+	unsigned long rs1_val = riscv_get_reg_value(regs, rs1_num);
+	unsigned long rs2_val = riscv_get_reg_value(regs, rs2_num);
+
+	if (riscv_insn_is_beq(insn))
+		return rs1_val == rs2_val;
+	if (riscv_insn_is_bne(insn))
+		return rs1_val != rs2_val;
+	if (riscv_insn_is_blt(insn))
+		return (long)rs1_val < (long)rs2_val;
+	if (riscv_insn_is_bge(insn))
+		return (long)rs1_val >= (long)rs2_val;
+	if (riscv_insn_is_bltu(insn))
+		return rs1_val < rs2_val;
+	if (riscv_insn_is_bgeu(insn))
+		return rs1_val >= rs2_val;
+
+	return false;
+}
+
+/**
+* get_next_insn_address_standard() - Compute the next PC for standard RISC-V
+* control-flow instructions
+*
+* @regs: Register state of the current context.
+* @insn: Instruction located at @pc.
+* @pc: Address of the current instruction.
+*
+* Determine the address of the next instruction to be executed after @insn.
+* The function evaluates control-flow instructions whose target cannot be
+* obtained by simply advancing the program counter:
+*
+* - Conditional branches: returns either the branch target or @pc + 4
+* depending on the branch outcome.
+* - JAL: returns the jump target encoded in the instruction.
+* - JALR: returns the computed indirect jump target using the instruction
+* immediate and the value of the source register.
+* - SRET: returns @pc, as control transfer is handled by the trap return
+* mechanism.
+*
+* For all other instructions, execution is assumed to continue at the next
+* sequential 32-bit instruction and @pc + 4 is returned.
+*
+* Return: Address of the next instruction to be executed.
+*/
+static unsigned long get_next_insn_address_standard(struct pt_regs *regs, u32 insn,
+						    unsigned long pc)
+{
+	unsigned int rs1_num;
+
+	if ((insn & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE)
+		return riscv_branch_taken(regs, insn) ?
+			RV_EXTRACT_BTYPE_IMM(insn) + pc : pc + 4;
+
+	if (riscv_insn_is_jal(insn))
+		return RV_EXTRACT_JTYPE_IMM(insn) + pc;
+
+	if (riscv_insn_is_jalr(insn)) {
+		rs1_num = RV_X(insn, RVG_RS1_OPOFF, 5);
+		return RV_EXTRACT_ITYPE_IMM(insn) + riscv_get_reg_value(regs, rs1_num);
+	}
+
+	if (riscv_insn_is_sret(insn))
+		return pc;
+
+	return pc + 4;
+}
+
+/* Calculate the new address for after a step */
+unsigned long get_next_insn_address(struct pt_regs *regs, ulong insn, ulong pc)
+{
+	if (riscv_insn_is_compressed(insn))
+		return get_next_insn_address_compressed(regs, insn, pc);
+
+	return get_next_insn_address_standard(regs, insn, pc);
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
