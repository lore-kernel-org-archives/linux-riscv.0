Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58DAD3940D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 10:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7OdejWIHu8U84diXaR8REzTl1zJYUCGILRcfa0ALTJI=; b=kLwaHd7hGTb7D1
	rWq740PofZmaWza5q9LbasYuUQtpKqP8qNm3ToOT+8vTTwWByc8v3NNo+t9Hyv8ox135t1Ft8g3n8
	OTqi55YxF2x96l0xEu7P0k3udmheN5DZfB7dVFBVnls/syrbuKpcVXrrmQhhIHVXC1xVaaoi/M7YL
	GhhVC+LNj9wg5U7osCbEfC9Bsvi8QFYf8pgVyAwfw9Id4Lt2CZIULok9FO9PJgXbErx+UjYDAFyM4
	0nlkfpHj89vX1DyOv8DO6oizft7C1gJN+cBNKaOO/eZmeyk1sQyclWWYwGI0er3wqiDT4mocaoVwJ
	o3+UQnQZYjRV3CHmmZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FD1-0000000HOpE-12X5;
	Thu, 02 Apr 2026 10:23:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FCz-0000000HOoC-11jl
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 10:23:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326nDr41965355
	for <linux-riscv@lists.infradead.org>; Thu, 2 Apr 2026 10:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpy
	Ts02c6Ms=; b=UlP4958gdS9gDtGGXlkbTIAwReZ8obzELD2H/85Wb9ZPv/YSXr7
	bhVmtqDH1m7FsugU0zpLe2/bHjqLPGfilTh/A2VG4/QuNYEyrcCUBukDdElQrBpz
	2EguKES2Lhn3q/LfSx+tq+8LtQR2SikmyENdnDvusozue9F5cmIUNb6kNdap+3B8
	nZ0j9oZFNh7C0JeVqITCR0jiI4BktJ5D8Px+qLhCoJGVm3INZqHUff0q6hgE/0fz
	cuetOmdYSyRlnCYNC2y302YFVKyR5EvdhTue2NgWhdGG+SRl147r2DrqeRGbApeF
	MmwoywgB/S30uGO8BJjHA20sb0cmqVHo3Mw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h2m4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 10:23:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c714cb672so449478b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125404; x=1775730204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpyTs02c6Ms=;
        b=NplpBkjm8PF5nPtKO8OSxLxeHpLkN6wfa/e4QA6b4v1NdUVCfizP0S1vnvd1FufDXS
         bt9ri2RxdSgXF1zeYitOFgI0aBgeBl30ZWC7c9EV3+o/nzxQZCJx+NRb26HEvk2BW+0E
         7Uyt1HPP1UOvDZR3lv1n1Jf4tp9uC9uRkSeITTP3zFW3A1DTwsZpIIyVDRzLeJZ/FM0j
         XAe8ih4mN7ah9GWKgvLdB87HQ1G2Ekzmj1AONvRLxhPVl+gYIn+LkPsCSIDMkBn3/SEz
         PzOI5v/vTHysqX8UpMQeW3XtvTB/mDm0MOMe6TQS2lAdhOR4SGz5NNFtieYVgE4ZqhxD
         pJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125404; x=1775730204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpyTs02c6Ms=;
        b=CnEyan6fr4K0KSNk5OVRyLgEO1m+tBkXxLSF9VuexgTWrm2nZxHhDD6WJHwj+7MrjC
         JaSMq+0ucayeHmgucDtU5ybdek9nDXsN+NUL1XdPX+ov+jEhmIxakIhzqOpsTajoddvv
         6iYI1nE/h3EJAEfitNEv+Dgm7OS8G/1CkPmr8rq1hyaBbov4y/n9ey4kR4qYP06QeqDA
         rIL3dlVShxHh4ExqqAd1dl9MrvXDyPVgj9xPvH4bpmYk1EIgjcsYTzAwP1DTz8swKisQ
         nfd+PvKW4wlEqIvuhVIosLUoQbqTX5q75OvQS+vpfL72EVIGHWMOo/Kzl2fgfBJmxA6B
         hX0g==
X-Forwarded-Encrypted: i=1; AJvYcCWX5UQGM8SgVpwe+jeYoPo6pTV5sI3T4ZuL0ZgraC7fm/aYvDDFCs9M2TgO5aKAp5+p4fAfiySfPRDbkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQC2mTjklkHnfZIOGe26QJPOxnxC0ZciaYlvIKEFMhmzBc3GqB
	qDYCdhqWW1Mgf0Dev3Ghbl1jWw3JKVrP2wZd5NAFYZ1QQ3dvYHEloGDeVRcw/C6CaKd5dVyh9/+
	cbTf+r4pxrrh3PeZZpbHzX+iWKmDRfaGWkP3ZqmD6TRazBQioP3BOdvUUmLrURoSIr306gTU=
X-Gm-Gg: ATEYQzwSjJ0TEnhk07ojqFimTF7JJnpMtvvKoRfYwS/fVTsBge4LC0vSS0IKpajtamx
	1jUFmaB2TXxOmOGr0hLsoc9r56DRpkxDztX8EXjTmiZk+tSLb6acu53YvbNIQ3uVNpJVdezJ1SE
	i/ujizleZlw7Z9zkoT1RzsyKAmOpmF42b+fLWWYkQI7Uc4XasdMAdtUIK24AX42ZVRNuZcd0Vx/
	BeM3RaQsSyScmSYXN9R/BIVijY58Baee+LZ7ZycV+6ypz5sNms46BaSf7Zw1+7n0h8raH2TDH4c
	5bODULewgrQfZpepBdvv/atsXthFiQnMQltWiN3XB/zg1OGri5xM9MMyqGRB/5u3V/+KQVyJRLg
	sQTAvi/xFv0PKoXhW1WZMkuEyndxDvZhUrlFxu+hNZ1YcAOzF6CPklbu7EFU=
X-Received: by 2002:a05:6a00:12e0:b0:82a:1935:f21b with SMTP id d2e1a72fcca58-82ce8b1505fmr6940229b3a.55.1775125404011;
        Thu, 02 Apr 2026 03:23:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e0:b0:82a:1935:f21b with SMTP id d2e1a72fcca58-82ce8b1505fmr6940195b3a.55.1775125403534;
        Thu, 02 Apr 2026 03:23:23 -0700 (PDT)
Received: from hu-mchitale-hyd.qualcomm.com ([202.46.22.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm2643160b3a.29.2026.04.02.03.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:23:23 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
Date: Thu,  2 Apr 2026 15:48:14 +0530
Message-ID: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce439c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wNTC72m251yRgy6-mc0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: UVDAWbZ0zyMPZqIE0f1eCZx31oLHUcBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfX8A/pfsN99hxF
 j7ukRxkth5BIPFZByekbO9JANGUx5EA3p+zcpNuZg/JNodEJwJEnlkCx5AKmMbDfEfPU/eymNjX
 p/tIjIS+hhaPrRLYFN9P5ZG5wdmflgE3ml7moGQS7fw7SrjW7zx0zO31EJ46/NIc0HXhyBBodF1
 7AlD7GzrHDuQoXmOmVt7XS9YDQm0CtXzVQXU4NwD8QbmxOh+VcD0S6r9nKBcuxYWRl/08Mx7/RL
 /J4rSAFCcRHhlydQ6c5ivKUZxYrzxZ/yEPfBIVBg5963dCPBocxiqDmz4lACb1FxA8nx7fsSBeM
 g6hbnBr9cAYFq0AaNdiYCjyRyYHi6wAPH452tBKanJ90GRQVY/IQCcZbFFWRHSne3MODSVS20r3
 P4d4UgYS++XiZXN5Kvc+aoW9GBk6/ofr3zML8DcbZZNoLa6kW7lLM7+nViWB8qMlDGZAaxmHwLd
 Ty0jdQwVQncsJds0BPg==
X-Proofpoint-GUID: UVDAWbZ0zyMPZqIE0f1eCZx31oLHUcBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_032329_287557_445BA03B 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

kvm_arch_has_default_irqchip is required for irqfd_test and returns
true if an in-kernel interrupt controller is supported.

Fixes: a133052666bed ("KVM: selftests: Fix irqfd_test for non-x86 architectures")
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 51dd455ff52c..067c6b2c15b0 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -566,3 +566,8 @@ unsigned long riscv64_get_satp_mode(void)
 
 	return val;
 }
+
+bool kvm_arch_has_default_irqchip(void)
+{
+	return kvm_check_cap(KVM_CAP_IRQCHIP);
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
