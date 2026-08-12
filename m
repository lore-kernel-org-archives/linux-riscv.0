Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24091C5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUHwHLPFAvzIIfQbaYP9DXHQmNp5ApdCnneM4zp9Hmw=; b=ZD5DO+WOSaAi+1
	u1pAeZ95hqxDKDL3cxd0eYgeHIerZARnQNCG7vAcpyQsMWM3foaM56McDg674iTNLanT4mun2jBpz
	GO8jDm3h4dpcesJSUwlndnflGIV7Cq/eR1BLyMfj39y2GKbg0UPbYUuu8OhB2sO2/BmZ1l924Csmi
	gry62DNAlhla9F3JRpc2q8rxJ2QougVLzJmf0vZlHKkc0lcjyOpFzzlsQAuU1qQMR+303EK92j2Bm
	V332xxAY1ziyc0pOr+Qvlx5awHDsLQj8CGzthIVLdAdvOU8r9nLCdSpfK9KNuftvRh9x4mYgHShJt
	O/xICUiA4xLuIwAQSCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUU-0000000H9zs-0wLk;
	Wed, 12 Aug 2026 23:36:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUQ-0000000H9vr-2Udg
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:36:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMPan1024372
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5WS5iWYARi9kG6oTuil8+y9EaeqVQDieXdNH9/m1ls=; b=pLC6pp7DDl8pgHtf
	vhC9+K9TjAA3uyAaqBIQZDJyLoQOytPx1TZQcGNXxPRLXcQySoJutTySs6k/NlcS
	5NQrLNHDIOsfnIuL9lWmhUzpYDojLf3PWuGElw3tA3OJhzD4QohIUqVVJS2Sfook
	hkXL+7oXEK/fH1qXvo2LwYbzAGDbXZdZ3owleJOwoc2G0k9RInjfTT20lPEDpnZA
	ujgRGYAU2zQKU11Sq5dk9uB2H4jmuwHIbpI+IgwCaAgWlwSNDrtiuXKJBS8OsBBf
	KGfNl7NGwa9sKdssX3mnb8Rd/zpoLbZru/9JZOxuItRN4jIjJnpREm7FM+oIc2pv
	tnZBcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0y04gtj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:36:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so31934085ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577765; x=1787182565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5WS5iWYARi9kG6oTuil8+y9EaeqVQDieXdNH9/m1ls=;
        b=BPBAoxPnShUhYIeUp5zNbdnlvEBytsF7k5FSmUZmnbLm/5OiB955bAV9FXx7fhKnVW
         ZsMO3sqfZuWU5dDJEQvkaEoLmd5WWRTvD2IEDRf31+5VP/GVUjT22hQvnWNmYVRBb5wD
         nS32lnnddbanrVrk3cDOfh1RfEwdV8DWQNdr7AEtAeBxgrtHVN8FFM/4TO3vIf2+rBeD
         H4k1G4pcuRNiX/Drfius5ZZdS6hJ6b2jU983yQDVGnUcpEmRfYm0QN7JrhFeN5wWig71
         /HK2QP38KsJHx/V7834FScEo8DFJrLzsMjM9YlVdpok5tm4obtPnMgBAlS069BX8+m4j
         O+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577765; x=1787182565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5WS5iWYARi9kG6oTuil8+y9EaeqVQDieXdNH9/m1ls=;
        b=SXSelEBbD9qoA/myKN1bv7w5z1R+sVjIYy8ChQfKOrAw3B//1cwR/mCV+lkHAjZKvA
         6FcUFvGM4jrqxmG5b27QE8V4X9igdLVemzfKiaDhKh4iS8Y2xTJHw7P92fNYum4WudHN
         BaognsE6SO0GEQ/FYZ98zYgjSbKbFRbejf790a8nzFgHquRbclJ+WEHj+0Hm0AC4xtoa
         aWICIf4ydHVLAp4gd2zjU+1bM6nXHvNuoDP91Yq5XRRK+B1p1YJWG3wbLh/a9tieSi5H
         obvObhO9jwhFsHP6XeLbFGXQ52ZnnsPMk6CYvcer3FTe0PPpUMGU8Edwt2yzplzEox+d
         VH5g==
X-Forwarded-Encrypted: i=1; AHgh+RofHFcV8/bi7RMrNc4J5S0AzeHKhY8QQAe/nA0dQrELmKyPvVnGnhcZ/gTUPaxnNCZggOo1V7q2ANh0fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3mvz1pDEcRJ8LN6vQNW5y1+zSdseflbc/88vgKX0jB3SwV9gJ
	+ujf/D9B0Fgi162UYHzFC2Lqjim6bwnzGvt1ZcEmYMnB8tSs1XvqzCHPvm3n1JmAvi80A+8nQhB
	iOpAJb8re32IxeMmo2BeLTG9aXfILB+FBiX9bdyKPAEvlz7VSqthh7smKNmM3oS6E0Aa0+oo=
X-Gm-Gg: AR+sD12SH+Xz4npW5g78m4kfvDt3o/HsnL3NY0L1af04+iqLzlZ6C4c9IiZO9woe3Q6
	41FJvzlaU39UqGsjnFlG1xILRpX1mG9Md74ScZHiFjus8BMW/KMI7MjVVZ8gvRGuEGqgjeXmns4
	77LcCuuEVxtCY3qXINkP1ag0VQgeHm9a7IL4dfHUTojDB+lrbNdgMTCTkXY2V+LroEp9y5QfzD6
	Slvtd71mJulbBuva846AKYIJF3nSC5r87YmZK8hr+7bu1oyk7FsIdldhPZ6UueI7Tl7DO0DBukv
	N1uBTAmiWjWRNGneodVfG7ZzbPda1Z5bvNtfmXdlxPQgPzdIxZogVTJzCx+t/g==
X-Received: by 2002:a17:903:15c8:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d37d88860emr17678325ad.10.1786577764531;
        Wed, 12 Aug 2026 16:36:04 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d37d88860emr17677735ad.10.1786577764062;
        Wed, 12 Aug 2026 16:36:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:03 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:55 -0400
Subject: [PATCH v6 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-9-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6035;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=KazAJLBF2Gbug16VdlaXr1HCrJN3XQt+AbBE5/+Y6+s=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrHwd6fORpzSSYqqiuvR5k7NFL0uUnxISi/Ax4/b6
 tpqEfeOUhYGMS4GWTFFlsNHW7K3vvKJ9n3O+QNmDisTyBAGLk4BmIhmNyNDs3+8rs6B02zGies8
 ZoR5zp2Y6K8tnpYoc/JZkptu8YwnjAzTpQXyzcPOWUyvmtD4ZKZe0bL9z67UaWWVNj9ZGz1XWYo
 JAA==
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX6+dWo5AfPDze
 iIGB7IReT5kBGRSIKZY77/lLTuxlaXhnFL6kW9HnW8JlQOCSDtm5oh0S44nydga71Wb7dVr+FLB
 N2hKvrzmuKYNscVZKReK/p98bmG7OmycpmWaVOSrtjaCE1wuhxmZn5zImWdwnzDkKT+S5vMtR+m
 9FA3Czwbo3u4uX3mGTr45znFlp2Vki3UjJ4I1LhcTik819CE9xufQy0YiY1iQtnmN0lhLtzSSVZ
 8H2mfVig3fMlf3LgsJN/V9O0hHeta1Pk4Ame7fMVG2IyllneSAMcmp7Fh34MC38dlt334TZk3qC
 dhEuwS8nJM3n9UuoUz6BaEXl2Gwt3b6DCP1QgJkS6oPXwdAcLlpkZ3Uxf1kSE7RNwLAJtVDwUF/
 7vWJEsFPnAt0gWK9Wj23Us1bL9gCgxU7vV/S8a8brO8QGMQ3EoLvqFhmuqgibZn/0O9FDCzvcx8
 77Zf7mF8FFYw8MO/zkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX/jiqdvh906Ha
 MGRteQ/1aqmKi9F1e67QDXTY1Zpqgw3Ks326p9M/Ud15gHKX2zeFxvyLeV49GzWLtyoVAjJk/eW
 lgwIz1Z1czJHZrhxjvGOznNAstiG7QI=
X-Proofpoint-ORIG-GUID: qPFifVnfSo6lJAsyBhzNO-1dsDKFRm1M
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a7d0365 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Eb22hEiy--YgZ995lnMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qPFifVnfSo6lJAsyBhzNO-1dsDKFRm1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163606_766626_23B3C1A4 
X-CRM114-Status: GOOD (  17.87  )
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

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as a subsys_initcall so it executes
after core_initcall(tagged_addr_init), which probes senvcfg.PMM and
populates have_user_pmlen_*.  Without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing. System-wide consistency are ensured.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h | 14 ++++++
 arch/riscv/kernel/cpufeature.c      | 90 +++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b..facc31b2960c 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,10 +25,24 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
+extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
+
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 extern const struct seq_operations cpuinfo_op;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index de7cff5f48c3..2ad8a16a0eff 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -1334,3 +1337,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as subsys_initcall so it runs after
+ * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
+ */
+subsys_initcall(riscv_init_isa_bases);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
