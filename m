Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76591C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GaQYmGT+9/3iWe7SrKtXZ1W/6cwSqr8odvKjErRYZBs=; b=hmAZTPaDdiQDp8
	h5y60M6c2hO216xUUDFUrVrYYFlbc8pI+WBaixyBWyIeyv0iBYJ1mAhghR7w0ZBw+bEr0uwNzFjw6
	XqOUECgjs2OjiGSMehsaoYCyeeNMHRMaGqAmBcUH9Jn64cPcwSD2/22n6/3y8Eru30tsGBECEP/eN
	CKafwKKtngsI+iYl4SrP79d5lh3cvETmzyi7DSRW3nLpfzZZnAZUL+xkpdmHULv/wUQDp2dEYQZRr
	gOStuSfRIiGFDaOUo8cz0UVPCZDDYcANcf2t3ncai2rhuHL3BaMKv5gAiW0UUu1kQFcC7yc+q/DrR
	XZ4h8rZ5OZJFH1QggLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8OA-0000000Dtb0-39CQ;
	Fri, 25 Sep 2026 16:03:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8O8-0000000Dta2-1OXN
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 16:03:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0KA51001998
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 16:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pPUscgiiGEE2Ts6w5N0M5vrxQHmauRrDTsR
	QpGYB8bo=; b=CHIwSdtj/Lo9jqq+QUDkDZGz5er9nK0n/ommKXcOJ3ouoxXBwYZ
	GJFYPJoqGOOQVQY3Ck5zZR0Oe3H5c4P3ZPwA8DgCCts3xY2kyJ2DM2XwL+hCT3vs
	+huoMoGs3NEoGKPtvOUpsHUHgZlXKxnJYhiBajxGYaeWKSaQSisInxkFX/MduxQX
	zoIyo8LGTCLBKBDRI9Q9gKyeAXglMOdn2BFrFeXUOJAsROkDUjY+SUYJSHNP0V/I
	ZAqqvSBAev5cV/NXqOltAuw/MHUKNha2o2n2lAKVgWjEFaLH5hvSSiN3TZEeSQiH
	W6RwmnYSLQfAFYAnoSAaD5yKdTqfZ6tbw3g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e903s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 16:03:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a8e3cc28e6so846073137.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352183; x=1790956983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPUscgiiGEE2Ts6w5N0M5vrxQHmauRrDTsRQpGYB8bo=;
        b=R4U6K5kPacy3sq8HM9UqLF9bGJTmiS4pgDyUvM2jaieh57CwMJXUlbkWZhZkHtXMeA
         tXYzlTenaaxwWug4m0c8LmeEC/UX8ZcEss2hICF+O9GZncZkSvJagjdAsR9Xs2yIdX//
         /8JIr2UN4oU4Fil7NVD1eRst2kRiVguZA7NHSZqfXmvGycSijD5pmlcrr50wpigp6cRU
         AXCVL84MHwKToiD0PW2WI+rrS+wlegs5r6yd4aSP7par2lfuL8tUAATNJTc7rZ9P4mH3
         tUIZyBc8POVOHsQV1mYYDfBOZTRMmlXAnbjhDfXjQ14TvAOrDRnZFJ6N7A8dPjf3c5wF
         jBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352183; x=1790956983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPUscgiiGEE2Ts6w5N0M5vrxQHmauRrDTsRQpGYB8bo=;
        b=WeO2fxHUtgdEp4FDIRrv6JTgFOl7VV3WRYlTqEMgKpRDUQoAbxZvpmbl4xx6jgJeWv
         c1UzzUSeOODeBZRl07SJDYmvMv/BkjgjvZEHm5YsrlnpBUuedyb1+otH3i/9YZxKE5qA
         698XgNsvVsNtzrwgod50M/5sLB8xSbT0Ps9Kf12894+sMbqIHqgHVcxB+lUHTkos/FXy
         B0JxKuu4VDkxw7ch/dxF+z37K551jiP6d+efrLJdreaDrIV35/xjbK1nLSWVyGW/uo5u
         5lIpwzkGq1sz6Y8rgZRLAkFn5Uwa6wLUlrUyVCeUjwLPU8RTHa+KutRU9ju7azoGaq4u
         MUPA==
X-Forwarded-Encrypted: i=1; AKwUvBykDR3bUUjGW72uRKBOwTNONDWbGyz1xiDD9myno/cOf2Bb+8QlTBetUfCrzu3qdrh17ST2ftTDTIfo8w==@lists.infradead.org
X-Gm-Message-State: AFuF++kCf0TEI2vJmeV2ZbwmQYgk83O/VMP+2XwEqEcLBf5k1vt89IHL
	RjUQd3w2nhjkrBMe3T85/yvF2ggmkN+pPcLLJszhrUptCCHKdYSIpGj2EefvPopIUH6W/2QqZWh
	sOhOAWzwn1zQu7hahn41EzwBshy4vdrYm1kTEWhAnJM22rxJkL1tRZ1du9dzCp6d/Ke5jEgw=
X-Gm-Gg: AYBFou3gblazi0x36vs25OftcDeOKT/12CWy1jIz/fCUFdZhG/y75okjRgcsjhKn4RD
	tIu3RO6vmrJmOTyM1iJZduwxGOv4SXnQOMzLJnf610S2Vdkw3k9SOAkMqnsMB2Jxj/VxtTCDJeK
	AVKy3RhgY003x8+DhlFluyL/SuDmouHMMHC6tBMBWg/SYKZv52jgDCO22I5QBhOapM2lSeBh7SP
	CP6YSbWf7gPux/upR/jKXHMZ2OkvGbPwQJMxEOSI1S0OCdvvSS92tXRg+W40bnYXW4xLR4fa0mT
	ikNTvV74uRwcDp9F8BSH6RSKn6+T+P6WIxXKLV4+086XeMYaQ2PyzlYAZ1+p5CcwCu9GvVPN2BE
	xM/vLZg2212Vftvakqf6xSbX/asmV5BvEKRPqnA==
X-Received: by 2002:a67:ef82:0:b0:7a7:69a1:add2 with SMTP id ada2fe7eead31-7af1f1fd553mr1987018137.30.1790352182793;
        Fri, 25 Sep 2026 09:03:02 -0700 (PDT)
X-Received: by 2002:a67:ef82:0:b0:7a7:69a1:add2 with SMTP id ada2fe7eead31-7af1f1fd553mr1986990137.30.1790352182076;
        Fri, 25 Sep 2026 09:03:02 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm8151098f8f.36.2026.09.25.09.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:03:01 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
        palmer@dabbelt.com, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Reject vCPU creation after AIA initialization
Date: Fri, 25 Sep 2026 18:03:00 +0200
Message-ID: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX4S8oxvtwRre2
 BkJ9y+PcS1Ms3TJme73s70EEj8/HwP3VlJ8nXsGNwkITpNRG+fl3RF8o4OLNJiLxe8eXdEhPSkI
 jbWa8v7iBgNoylQcrHtg3Ezan2b7McA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX8vKMa7/mJZu4
 B2dGq/stk38+TTtfb4podSDzWl5th3PwxoMZr3dHJstAZYidNNivCi6W5N8jj34hYuqH+z006oj
 pIuCpkhNqdsZWdl6iJ6Vzj9IvYPgaeU6IjoeDJ7lUQ1OEt4pf8ukGrnKZc5LVkanDE+pmfjjdOR
 4ZJyE4yn1SSglUrP6xqjVqo9VNyTphmYDxK5vBX0AGm/JV1sYk/vhAsr617q93qSs6IC2DaTTe9
 qINto9bH4yJZRCgwsCzc0FaCG7t5YT4NjGd11NpBJGQG0uEB+chRhY71EHxz87WisWlKDfcR7rY
 yvop21iucX04KbzfyI3kFC0B/qUL53P9fb9QGFzIKt/OxDrN00yF4bv4ffFoIyOIPcUdWWR3h+b
 BikiHNNZNdFlZXdB0jNfRUeLTBc0x++rsyy1luzQBugiuL+6cia02kAdBz2A8nGNmNt7HZh+Lih
 H69uySVBgUUzgoDpODw==
X-Proofpoint-GUID: xyqo7J4f99f48LzF_Iz1UT2wZpvrZ1Ld
X-Proofpoint-ORIG-GUID: xyqo7J4f99f48LzF_Iz1UT2wZpvrZ1Ld
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69b37 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=9vyTzsUqMagNZt02PzcA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_090304_375893_96545A0B 
X-CRM114-Status: GOOD (  12.33  )
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

AIA initialization sets up per-vCPU IMSIC state by iterating over all
online vCPUs. Creating another vCPU afterwards leaves it without
initialized IMSIC state, but KVM currently permits that sequence.

Reject KVM_CREATE_VCPU once AIA initialization succeeds. Both paths are
serialized by kvm->lock, so checking the initialized state from
kvm_arch_vcpu_precreate() freezes the vCPU set used by AIA.

Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/kvm/vcpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e062ca19f9d8..ccf2def834f1 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -138,6 +138,9 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu, bool kvm_sbi_reset)
 
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 {
+	if (kvm_riscv_aia_initialized(kvm))
+		return -EBUSY;
+
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
