Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37546C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFhZJZhKIJoBwubG96Gr9GFd+Q4ER2r68EzBmy92NHs=; b=l16gt8bGSgnCbM
	wHBFToTRISk/i9JgGvBLNgThds/V3SFmmRfUj/JHrXLrvsor9iLAJtD25aFBfAH4J9+lL/M7fgU06
	WhKvSe1NnZYRHZvMaAdeOOnNI6niVbrFjGJxfnBDZOw8l4vDycHT5z5BuZAsZPKJM0wl+1IdXY+X1
	J7VFmX7vvzOUATMED8mwrC+cVzCnQgnXuhdCs1lB6lx6U/kg3SKU8ZUhojbEKHsMx2l5wegn8ODun
	1WJz7GMNhTkIHVcAMANvutExLqqbO06cu2DTodnx4ouoQbi5W/O0ABEnkV1KKavozKNmbM+vrhZ1d
	ZTBtwvZQFAC2kwarU39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Co-0000000DrF2-30xv;
	Fri, 25 Sep 2026 15:51:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Cl-0000000DrEf-3lgS
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:51:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PFHal82554019
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfo
	gl31Oeao=; b=RsQkcJLsAmUF2WOEhb0EweNUBr4RJEtO4fwE1g3EbSb0whsZ1wA
	Judwm4Tnle/phQvDBCurK5vRrfqpMEqAXACuAxpUpNEWsElgcUEabj2+YwcgRTa1
	OfjJyryi+tdRpSlsjHVULX2Iga6dg54Q+/+/v0w6ZGPFoTwQobEj08zkGTnzEsw9
	1QhvqT5emLhIl9SppJYVBAP9+BqUKeUM00JhY4PLK+QQyTnJgZ2+q24EeIACsmF1
	AEVYrvdzIXkpXEPLwzSMt/BvdzUTUYoolPiSM47k8Pa+rlK0lBy3o+g9erFhHoau
	nlfp0N+jvXeHqXtx+4LqvbEKf5HLBA2ozfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk04cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:51:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so192270585a.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351478; x=1790956278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfogl31Oeao=;
        b=BDHsrM1O/rnikZNXU4fND+Basl/Tcs96r/kJXvfxA20UZCUqV/OJtvusOoom/84dqU
         1/W3oNH7oOIYheG6fLCt2AjrQuDuEinLEfkCtoHEsEBP/aNcj2M8jVBZhz20phoLdwhw
         X+bgsgjUSMR4jnUwhn8Sxr8gI9OL4BXw17+U8FrCFk/fjFMN3Jpt/s5GFAT45ptJjir0
         VD7HGiiuuISz6fkAZ/JF3F2Hs3HPAyp2WLL+EqA2MZ/u05Ng4BzqUDmd/FG76rp5uHpI
         LDIR+7djiHEePhDpKwPIP5k6umU4YUOSNKKllkd02gPN80shCtMoDy1txC/6dM3Rzkh1
         +Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351478; x=1790956278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfogl31Oeao=;
        b=RWj5wUL7q/CGokBpd9cRjZgq6mxO2ElTsmKc4KqKaZtL7j4LLRMcn0GUYpt00Vs0PC
         nose1JqVia9vrhmINTye5cg/L9nzyMXUCZAPRApYC4ONBJbedlH4qDPq2/mV7S03D+z3
         4t3XEVQyTHlRN2hdfyFQLAQjrtgjBd66AAuUTJ27TISVFFjjZsxZBuMtk0fTSfE5bHZK
         O2tblXeRNqfY4o6aIcMv2jPCLgGicY1Cprp8dca60prejsTE5O10gcY9E7VZ0n1XZbuw
         JCX5HObNHXsVvMwmiJ9rE39e4QrTZEw1KwZFUkntoSl+QuT2N3fqdXn9novGDM3ae7tg
         LqOA==
X-Forwarded-Encrypted: i=1; AKwUvBzCwJ1SbHIlfC8jx3xjOM5tJC61sCHX7qnnNp+6faYkb1c3ULtIqG+1LkkWo7bZelS9psEd4mn8/5zDyA==@lists.infradead.org
X-Gm-Message-State: AFuF++lbThEf5DSJ82dgLtOEkYvwuaC1UYFU9LrkxsoVaU43lwsnlT3e
	KTCpmSCPfyk8NSXOBu/33P8f89+RtNgXC0gwNGxj7tt/w46PsbMgbwU3uo8rNkITMUIVZPjcAjy
	2Z9mvgSuuFaTFb0HbaonkTCbpsdPT1I6rTkY0ZCuHz9S27dhOai55t+kibRpbl+XyA6pndwA=
X-Gm-Gg: AYBFou0lo41buyR+wExsehpukT0PvGVojcpGTC2f+t3zve5vvQMOvVMaWyQ9C20sHy/
	4DdIZdRRUBlsIJVaBe3HeK+eNz5s7BSiffx8ZieeLiyFsOq3Py3v7fopGVdsVIQibtkR2nwfNPX
	sAS5JH+Yc7meuaqfDk51tZ1NnGdUjXe0kkCfwvsn4MR3e5xNGoenzoFpv6rM7JJNC63ngkz4RcG
	Xexrn9re6AuI7uHbp5Lgq3vrbCatNEvl5DXEfnOdOys7z4akV4r3JonigIgNL+MURP1RCfCkT5p
	skcxKRPx+aGmxLVVuF1YtMPceQtKltZSeLG1iysdsOY09NJSpy3N1wDKreeuxlqJI6u2faRNPWB
	WJ7OpV3VfIicXS64fm5i8zS5oYIpRD4qm3QcEdw==
X-Received: by 2002:a05:620a:1724:b0:939:72cb:bae5 with SMTP id af79cd13be357-93c43d6c35amr489399385a.28.1790351478203;
        Fri, 25 Sep 2026 08:51:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:939:72cb:bae5 with SMTP id af79cd13be357-93c43d6c35amr489395285a.28.1790351477616;
        Fri, 25 Sep 2026 08:51:17 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60cc72sm49048745e9.3.2026.09.25.08.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:51:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
        palmer@dabbelt.com, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
Date: Fri, 25 Sep 2026 17:51:16 +0200
Message-ID: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: SYjwQL5hyFmkzLjyL9LW_jPjJUk5Le61
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXzsun7O3giI/q
 n7spfBXO4Nc0R8QAFohYRKSk3FAHjabOWw8LKpUNk47SRYZtzDDwwxJAzHdL0XI6rTmlOxkpgBZ
 1zg19m5tDxgMLBElNjTXdsJaw0NdisM=
X-Proofpoint-ORIG-GUID: SYjwQL5hyFmkzLjyL9LW_jPjJUk5Le61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX+ThpASrF01ZU
 MxU/Sj3kuCPhymqQlIkUviuAzfK5g2KJrR48HNlVfxdj+b6c3v5L31g4GtpP7hE22ssayd6/hPh
 kAyrRlUG6lFgbpcnWwUi0Qcb1nM8SQnyroLwjXihRRltwVz9ypiaqX4FhjPDYzie4SVQrjunLN0
 bSlvD7MIiXhPuUBUkkV/ymBvzKF1A/Nzfw+YGkSgeTzNFhJozmmtvh6bQFmadgBVcxMlUiN6/np
 aEt4tVOo2Q9LqYe9JNJbnlAg15Wd/+AZLTKs+duwnEH7TIYhFyR0fZl9PP3Ehu8KieIFDJpNy7P
 52A4jKq1K+f85L9MYhwSLnn3z5pqR6QLPF1jxhVHjJKivL0vVYhuMtPZXYnTYUzWn6osnA9vsrc
 d2Vs272s78IKjkJJJk5VbsQMIjHADLeziYA/19LFxu6qDNtgphEzygQ5ihbWnMNjOBXU5dRmG/k
 lJX7lS4MwXls3nPe2uw==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab69877 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vaztLdeRwP-UqatcU2kA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085119_970062_C57B0238 
X-CRM114-Status: GOOD (  16.26  )
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

kvm_riscv_vcpu_aia_imsic_put() can run from the scheduler preemption
notifier while the raw runqueue lock is held. Taking vsfile_lock, an
rwlock_t, there violates the lockdep wait-context rules.

Protect the CPU/HGEI pair with a separate raw spinlock. All updates to
that pair retain vsfile_lock and take the new lock, while scheduler-out
uses only the new lock around the HGEIE update. This keeps the wakeup
setup serialized with VS-file publication and release without bringing
wider IMSIC operations into a raw critical section.

Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/kvm/aia_imsic.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79ae0..1ccb7eac9f45 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -48,6 +48,8 @@ struct imsic {
 
 	/* IMSIC VS-file */
 	rwlock_t vsfile_lock;
+	/* Writers hold both locks; scheduler-out only takes hgei_lock. */
+	raw_spinlock_t hgei_lock;
 	int vsfile_cpu;
 	int vsfile_hgei;
 	void __iomem *vsfile_va;
@@ -582,6 +584,17 @@ static void imsic_vsfile_local_update(int vsfile_hgei, u32 nr_eix,
 	csr_write(CSR_VSISELECT, old_vsiselect);
 }
 
+static void imsic_vsfile_set_hgei(struct imsic *imsic, int cpu, int hgei)
+{
+	unsigned long flags;
+
+	/* Serialize the CPU/HGEI pair with scheduler-out's wakeup setup. */
+	raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
+	imsic->vsfile_cpu = cpu;
+	imsic->vsfile_hgei = hgei;
+	raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
+}
+
 static void imsic_vsfile_cleanup(struct imsic *imsic)
 {
 	int old_vsfile_hgei, old_vsfile_cpu;
@@ -596,7 +609,7 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
+	imsic_vsfile_set_hgei(imsic, -1, -1);
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -727,10 +740,10 @@ void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
 	if (imsic->vsfile_cpu > -1)
 		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
 }
 
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
@@ -747,7 +760,7 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
+	imsic_vsfile_set_hgei(imsic, -1, -1);
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -861,8 +874,7 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 
 	/* Update new IMSIC VS-file details in IMSIC context */
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
-	imsic->vsfile_hgei = new_vsfile_hgei;
-	imsic->vsfile_cpu = vcpu->cpu;
+	imsic_vsfile_set_hgei(imsic, vcpu->cpu, new_vsfile_hgei);
 	imsic->vsfile_va = new_vsfile_va;
 	imsic->vsfile_pa = new_vsfile_pa;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -1112,6 +1124,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	/* Setup IMSIC context  */
 	imsic->nr_msis = kvm->arch.aia.nr_ids + 1;
 	rwlock_init(&imsic->vsfile_lock);
+	raw_spin_lock_init(&imsic->hgei_lock);
 	imsic->nr_eix = BITS_TO_U64(imsic->nr_msis);
 	imsic->nr_hw_eix = BITS_TO_U64(kvm_riscv_aia_max_ids);
 	imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
