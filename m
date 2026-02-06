Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E66ECD9B9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBVeuJZO8v8tC7RLXsDFxEqTUGjknwtNUNb4/CYg8Vk=; b=Rh84jBkxhhl3Fi
	5ZfLBIwgInPoLcqVX4DkwnJqot+QruJFjswRyQumtO+RcbQeKQnjskhQe6oAbySm1SHvqqFObA0lZ
	gc01Jq96uxUbLZIBvgOusAKMdzxhvFHSNpmUsqkCr95fqBMT+roGPzljOov0Kl8L9h8p8LgqmIKYV
	6RRFq7CZBnL55yXXARwKBarn66qmHUOWwL9M9UoQk+16NbbSea+YZecFsN0xUm9N2H8ORiFIp9hl9
	WSdQ9NFuVnYIWwBuGF+PQCkHcdcFABlttPe8RQ+SL2+MuQv+lzItzJNZ8mVLCSH8H49d+HhHnlLJe
	J/Wj2aphm1mOC7toGJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dl-0000000AdyV-1FnA;
	Fri, 06 Feb 2026 00:24:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9di-0000000AdvB-1kEp
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615JuOeL176913
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DkB7Ob67zo2
	H0cVB+6PUohLPiXcNGFnT5QvoddvcFAk=; b=CIscHv8Vl4kM43sqkJEBFmJINqB
	jVOnONXtZ0fhnKofFIr/8Kk5W3Qnk0Els4Rkulq/lJHSwISasV+NKyuXC5vz0mJF
	uPlztQOrp49rKkHnLu+Fyd04wUTF0XZDNnjHzmdJIAhvtW7G7vpIsoJgRI0sdoa+
	T/hdwEDFAup7Ce8tqNRMZYyM2ntakAuenfDPakM3oVMQcKf0dE4HhviV/J6EYuAb
	NeizsENeY3oXuScICI5r0OV5H4Kob9HDgqyBolq5fgTFu0x6+6369DhYoOt5WvKY
	3DdgSSeo8QKbebaksc2tAQpoRoIt5v84y3AWoLm08XYIPawt/aA6QytSOkA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p2dqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b82974bd26so148621eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337441; x=1770942241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkB7Ob67zo2H0cVB+6PUohLPiXcNGFnT5QvoddvcFAk=;
        b=Tlqox+j5hKbF0nOkFQRrm4l/J7BZQRieunPRZVcODvmfG9igyrUbk0bZiTYppaUKKB
         rPP7GGcoldKi+xjWbURBYxxBO0wEp7LskdPCm8ZAvSeeUV0yEIRuhoHjt9nFeVX+7FUd
         8PHOd3v+xlx4eGxf/qxZtyFepCC0PCWiYl8D4xpKlYlf9zI7Qswc6xaQHvU3f9DCyyku
         Zi+2I91k7+qOv+EEX30F25BJ+h4OFmCA0NQCO7FkquGhQoEnr4l4QzaxwzDAqKhA8kdP
         44mM89+OkYbVg2xtHgLccxkDFXavPZM0avhkd0m2CelUBjRq+vDKg8OfLdJQ97OANIcE
         ZLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337441; x=1770942241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DkB7Ob67zo2H0cVB+6PUohLPiXcNGFnT5QvoddvcFAk=;
        b=A1wYnpg2ZsnqiF/ICYYLM5mJl9+cQWJyIkjZyPpC1WU03E4Wv+KUSxQvPaKF2BPWI1
         pfWnQmFJfW8RwPLIbBAgnKz++LaU7vuI74EsAKikbtZQobEZRnsTLDxqIhLIckUZsRdX
         nk44cfdqRtju+7Ep+E1nsLtUF7qSLA1dQAsWADmJgf1SVeOkYKde1zjgwvusYuzn2YrE
         tcsAF25VEl8dF1DqnifKrGlwLN9PmuzC0jiZB2Hj6VRYUrxfI3UMDVzsISsQkyhlm56f
         nwLGLSLZAtHhBpiIdjmmiYaTbrusXToYteN9eH9s7yGQEUosDcUmicAIrfo2s5159PEr
         o/8A==
X-Forwarded-Encrypted: i=1; AJvYcCXufxwnx0GeV/MF/deT6GmIfXPXht2dX+xs1M7SHIxDPoD463MY/dgYNjgcUJb4FOQbp5lEbr+vYN8jlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+aDckwLUh9I+dLsj9ZeLtBkBr2zl6PPqBoUASo58wwEGYgV1V
	3oKC+cKnk0kBn0Zt6lJ9K/ZQ6CWYNwxXWl9SCd4w9j5DivMhfhpInh+Bpr7nAgkza3G7yNWgb8G
	1T27ZOK3MVSgHht0rKfyuGEJZU1jdhFQlbBKkn3l69me5MYkTgK3th/qpVtThXXpLu649zKc=
X-Gm-Gg: AZuq6aIVqdnzZpciIeDFqZhf50n5owZupTRM2hkXW0n5v7lfnmIvHWpX//GO/5SEq0a
	bm3Fza4OG+2RG0NOO4teNxTiR54WTyNfEpEFdKHVFVlC6EyjLFc5hiOG5zu1c11QQGYK7p9ZTXk
	zf+vqdELbhTxV7pwGGHlyORvApkKYhyRxmDswTc+yTdzXdtPLaB1aD2J/rZFSh416+A78pylvpt
	+9EcWdkB+pEHd3w8PIs4Ex7P46jvk8xP82pMU3JgPQu4vlvMq5VWRWxcPezLaKMdq4sBRT/VqvK
	LcKNANu4Pq86sNIfLfEWdlV8M0+DccUCYchX+12Jn51iNEv/kLgMVG5nYpoQTEjI7gChhqmQGXf
	HKku0qdMUB3th5G+xsGk=
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr445018eec.32.1770337439883;
        Thu, 05 Feb 2026 16:23:59 -0800 (PST)
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr444996eec.32.1770337439354;
        Thu, 05 Feb 2026 16:23:59 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad8c62sm618387eec.3.2026.02.05.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:23:58 -0800 (PST)
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
Subject: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Date: Thu,  5 Feb 2026 18:23:42 -0600
Message-ID: <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=698534a1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=y3MMSYwnWwWQE3oEGTgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: d1hYpC4HobDGdAa0d-ImCS8qdjRbRrS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX8FykaN1S5qyC
 lItOEKhaUyVU3eXm+GPrHt6dke3EvnGKemtT1l4QLXTX+kjoRa/szK6fsPrkwQz8FsHLP5IfQLi
 YTTVbpTzNGfEuP1nMCycg+Ys0CcW4/pGkodks4jgREmpHBqS0UklD8Yrn8VU/LInd4i3Z1bxjOd
 rdDDdCASV4wEq2cf0fLUcMhV87p9q9SExv+QizHo08QBAm60HhXgpO+Th5YqxgCEn1YIgVnLmvK
 nZ+wXbaKD4+oZXLmR1DQJ6Xd8avrq6iUkJnGxDXXZ9XYJa/wYZbOg3EhYb4kNknhvibu+PNG5ZY
 fpd5ZX+lZhSGTexIKNi+Hd2sKkTzvBu9blg+njLcTiEWL/SocyZ2a/C83CufdtstLl5uBvDQ7lW
 vnLKf4Ky3Ki8DP/ceDwJyoCXNYgp0UCtPf5p3i1QLZPm2bGTgeT0DbSBcqeBpUxbxMDhu5HzmOh
 mBkNnXYoE8rgjFN+Fhw==
X-Proofpoint-GUID: d1hYpC4HobDGdAa0d-ImCS8qdjRbRrS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162402_565459_8371C2ED 
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

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/include/asm/hwcap.h      | 1 +
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 8 ++++++++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 03acd22bbbaa..c17e11caca83 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe..96b7cf854e09 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 25ed1d6958d7..ca7a34f66738 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -429,6 +429,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -476,6 +482,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
@@ -1089,6 +1096,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['b' - 'a'] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
