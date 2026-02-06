Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA26ECD9B5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ak9ptnR/94YGf/uAlIZGdmCu/5s1I1fv7AnggOOHm2w=; b=mNs4/zPOa2xhaC
	26PP38mUEP4zsi127GIqyjfIp4ZZJqW7y5MJFXgVIiCcq7Ix9vSzpmYOW+KorPsSOB07cuGEkHZUY
	108iJqAz80ASPPYqQzRav1Og3HCK+KWp90+wOuOxB+7Hnf5flZfKouAOdV1WuF20KMs77OgTt8P3y
	9ORo5PyP6sqqrU34UGlYAlHbrFlqlyhDIG3ana1c4fT+sE3xB4ZTSDaEI18e8hwGKqIs4ijTG3lBz
	VcLbvI8oB4MuEdp7siVggTJpnvGVS73oAJAi7qJUtBTBAz464xK8V7iPa7klcFFPPwC4+7/rBG4O6
	bpFJSVR4RJqxCG4hlAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9e0-0000000AeLv-0Xh5;
	Fri, 06 Feb 2026 00:24:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9du-0000000AeBn-10zO
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615M7uJt334988
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JNKkXK1IuAx
	oq7yd0EcUDSry0NVmKFN38/3Ra1dPK+o=; b=OoAujrzOOqEMw9FOBcfqq5pCjbM
	jKe/P79zjJDkI1Vrs0tfsX2g12Odzim5LHTXdlnMswgQi4epTj9zuQ+8KJ2RHm+g
	bQ/tsouMCtUU5mKA2ZE4C4oggTVW9jUG6j2/syeiclqbE9+FCJxm0EZ+gW1aLtbp
	3KdzyMs1xCbcJ2Bd1NHzgjwQ6IGNCNBWYiJjKi5rwlYIolCU3XvfgvzpnQ2QPmGU
	clRX18aSbVX8DYW8OeUKjCr3uIcgBlxYW8hPjISwKWHDgtVHUzDRRLvioM3fLWpa
	1qm35fwrcXgy8XULQ4zkwUVXe7D1gzEPc3REEjRB1Si8t6IALl+198aJxKw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qv8bj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b71bdcd037so1047961eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337452; x=1770942252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNKkXK1IuAxoq7yd0EcUDSry0NVmKFN38/3Ra1dPK+o=;
        b=L2nYMdxFsBelGaatZNkXRlOo9vUs3Wnf/5HjKW9Y3X9/qy3TeRrvpz7c5Q7urQ73uH
         Tz81XfPXk8dtijrlM1hfMbmvPxeRTWsechq17Qi63Cpg0fibeYnOYSdhNMCHoBeJ43WK
         kVGNqEVBYfiY2jqxKN0v3g41F1+T/kUbGOcJ0Jx93DwOCbT34UkTkquDyBqZkmb2JXZ3
         wJAsGBxwX6VFaOcW6qOoo0s7Eri75w2ZQ4HsOah3vnGtunBIS255RkiPL+auBlKAarT6
         gpMtLppPif/x00AueH6RtXmSupa6jFZkHzXqeu/8ZTh3O91P0Yph67mxI2kwEflBkDzV
         kD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337452; x=1770942252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JNKkXK1IuAxoq7yd0EcUDSry0NVmKFN38/3Ra1dPK+o=;
        b=nSmmfB70VGvqG95iraHWDI1XQrwNWMJItXsooFuY86dqXziFTT6gj1w/Yz2Xakgvqt
         xeP9nKchszJPIt3P1ilZ5+BS/ucNmD96UU5uja6EoC37MEMkSo77nkhl0RXamVaPTypR
         U6YMw4NpHQU6Q6VYLe5ash+dyfBWSrW7GNe49P8F0ILw0DG4dwhVx7RhOlqRV08cORtk
         h3ri0/ey0dni9YqjyH9K+QcwJ7ptnfWWIPiVoiq5AcHTfan2UrATAoPEz79v1k+DHaKL
         8UxuUDtWQkrrbpI0fEtdXOayax5TgZhASmkfwoBVYqFkfKHSlH7lIK0rQiGHxpd4Mez4
         f3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCX2o3dvACmYJNjs/Gnd2M/+v96vOThsyLeIU1QIDuRBEUAiZ1N7q+0yURRxFgtA7vNfUyg9EuySBz48Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA+3kKhm+4XPS60f2ZZU2zAnnN1tIdVwzmj4x54Q4cq66nm7DN
	sxAixArbuGrpZywVJUXHMxfhEfjqCQnXbfDcOdHINmtbAKBr0aYEC6wNejMcDLBwINhSNKbN0Kg
	HvZgOSzn7oUDfHxnBdJ9yAVElJQWSxTarHal3jOL6bVC6mINxTUlwwgUzdkMTAEmT6ml9kc4=
X-Gm-Gg: AZuq6aKCZzvW1Zcwh6Sm2FIC2A58nAs+F+dJd+kLDgXaLlN6oemtnqwsxn3OdN7QtrY
	gnUxQFt7B6JxeqqMkp6ee78M5vaDLgbl0ROsTGmcMG5qlIpVz+CgxG+28dNnKVPIMh9Pz6Aenk3
	uPIunu1VZXv2TI8L0H60tzq/JLJ0oGO+ucn2cRThS2O+NAGo0nAVJWgpvih/a2tnGJf5Mm/mlfo
	Wazkchw09/7Q78CLbshEPuTRbrjvy9FihVnl2vJRV9qHyx4PIYad4uz9dZQtaZgzZRwpFc3MsrM
	sL8aVH2XAwYx6QrBhvwZkazHXWEIPM6LakPoG754B/OeKIjldF0aDAJQ2uX5azBJ7eUQL96gSBo
	AcM+zzismrHrBEq8rcr8=
X-Received: by 2002:a05:693c:6319:b0:2b8:2a49:9562 with SMTP id 5a478bee46e88-2b845b8915dmr1898343eec.6.1770337452220;
        Thu, 05 Feb 2026 16:24:12 -0800 (PST)
X-Received: by 2002:a05:693c:6319:b0:2b8:2a49:9562 with SMTP id 5a478bee46e88-2b845b8915dmr1898327eec.6.1770337451642;
        Thu, 05 Feb 2026 16:24:11 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm715381c88.11.2026.02.05.16.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:11 -0800 (PST)
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
Subject: [RFC PATCH v1 11/11] riscv: /proc/cpuinfo: Also output rva20 and rva22 isa bases
Date: Thu,  5 Feb 2026 18:23:49 -0600
Message-ID: <20260206002349.96740-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=698534ad cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=WA6HLS5aTPehd6cD-b4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: KYwzylK1O_gjoNORTmr2c6xbKCov526U
X-Proofpoint-GUID: KYwzylK1O_gjoNORTmr2c6xbKCov526U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX5LHa0zHY3qV+
 bm4VkoBA/z0KOuVuhkMyZbxwp1P3nyvEC3l8YzHGkXb7nk/7hcyGREIHIAEHET2u0dCs/KZVoe9
 JdM4Q6S427W+c85Mll4dyv5fA4g+wz2zoBVVrk/Kh1JzMmyY8mRfysPA92CxVlj2WMxPDZ14fXS
 uQzUPnJyNqSLgFg1i0C+As90GBReSpd3pUzYDmySxgfKFZnwe3G8daQHYqK/GU0P0rW4qRAxzuU
 onVERcN3FP5hAVDGv5rGzaakXIWoWmF98E5DGXxTXS/yFHJRd3xXApFFL8Ub/AB8iqzgwiM+hR3
 WFRmmedQSkTQNfzeEkj3tAFE/vcP565Yvc8is8Ev9wmOfaBOWC6w1vDWRS/eRE6l3cpHrRwKOS4
 J3bbhb9iJWvGhPn2/+FhPZYTyR0WEsIeTazAdxxSDkyOwaw0ooEaP4HTM2qBmCsvnipBHORUlCF
 um2hU5BcMISoIuVfqlw==
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
X-CRM114-CacheID: sfid-20260205_162414_431591_20E040AE 
X-CRM114-Status: GOOD (  14.89  )
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

Include rva(20|22)(u|s)64 isa bases in the output when they are
detected.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/include/asm/cpufeature.h |  4 ++
 arch/riscv/kernel/cpu.c             |  4 ++
 arch/riscv/kernel/cpufeature.c      | 65 +++++++++++++++++++++++------
 3 files changed, 61 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index e750735c5686..41431e89bb3b 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -27,6 +27,10 @@ struct riscv_cpuinfo {
 
 enum {
 	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA20U64,
+	RISCV_ISA_BASE_RVA20S64,
+	RISCV_ISA_BASE_RVA22U64,
+	RISCV_ISA_BASE_RVA22S64,
 	RISCV_ISA_BASE_RVA23U64,
 	RISCV_ISA_BASE_RVA23S64,
 	RISCV_NR_ISA_BASES,
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 228867d7dc00..007958744ae5 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -313,6 +313,10 @@ static const char * const riscv_isa_base_names[] = {
 #else
 	[RISCV_ISA_BASE_IMA] = "rv64ima",
 #endif
+	[RISCV_ISA_BASE_RVA20U64] = "rva20u64",
+	[RISCV_ISA_BASE_RVA20S64] = "rva20s64",
+	[RISCV_ISA_BASE_RVA22U64] = "rva22u64",
+	[RISCV_ISA_BASE_RVA22S64] = "rva22s64",
 	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
 	[RISCV_ISA_BASE_RVA23S64] = "rva23s64",
 };
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 07a42545e9e0..ac46b974e5e4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1281,33 +1281,74 @@ void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
 
 	set_bit(RISCV_ISA_BASE_IMA, bases);
 
-	/* RVA23U64 */
-
-	/* Zic64b and Supm with PMLEN=7 */
-	if (riscv_cbom_block_size != 64 ||
-	    riscv_cbop_block_size != 64 ||
-	    riscv_cboz_block_size != 64 ||
-	    !riscv_have_user_pmlen_7)
-		return;
-
+	/* RVA20U64 */
 	set_bit(RISCV_ISA_EXT_F, ext_mask);
 	set_bit(RISCV_ISA_EXT_D, ext_mask);
 	set_bit(RISCV_ISA_EXT_C, ext_mask);
-	set_bit(RISCV_ISA_EXT_B, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
-	set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
-	set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	/* Spec says Za128rs, but Za64rs is compatible and mandated by later profiles */
 	set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+
+	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA20U64, bases);
+
+	/* RVA20S64 */
+	set_bit(RISCV_ISA_EXT_ZIFENCEI, ext_mask);
+	/* TODO: Ss1p11 */
+	/* Svbare, Sv39 -- assumed */
+	set_bit(RISCV_ISA_EXT_SVADE, ext_mask);
+	/* TODO: Ssccptr, Sstvecd, Sstvala */
+
+	if (/*TODO*/ false && !bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		set_bit(RISCV_ISA_BASE_RVA20S64, bases);
+
+	/* RVA22U64 */
+
+	/* Zic64b */
+	if (riscv_cbom_block_size != 64 ||
+	    riscv_cbop_block_size != 64 ||
+	    riscv_cboz_block_size != 64)
+		return;
+
+	set_bit(RISCV_ISA_EXT_B, ext_mask);
+	set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+
+	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA22U64, bases);
+
+	/* RVA22S64 */
+	set_bit(RISCV_ISA_EXT_ZIFENCEI, ext_mask);
+	/* TODO: Ss1p12 */
+	/* Svbare, Sv39 -- assumed */
+	set_bit(RISCV_ISA_EXT_SVADE, ext_mask);
+	/* TODO: Ssccptr, Sstvecd, Sstvala, Sscounterenw */
+	set_bit(RISCV_ISA_EXT_SVPBMT, ext_mask);
+	set_bit(RISCV_ISA_EXT_SVINVAL, ext_mask);
+
+	if (/*TODO*/ false && !bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
+		set_bit(RISCV_ISA_BASE_RVA22S64, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen_7)
+		return;
+
 	set_bit(RISCV_ISA_EXT_V, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
 	set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
