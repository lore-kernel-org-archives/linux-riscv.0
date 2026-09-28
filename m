Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A89ECA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Y8vQe7QQswCLNgZCRu2W6kwBKMij/yb+aAm24GZPS4=; b=KDQNrZGkBGROpR
	cK2mC1rC5VxrWZG67gZWOKvC4CrmrURb1bmNyrkFXsNMIWMADUx4rqBX5a6bZy2yaQbWj/Bb4bcVp
	IIUtvoCsEyvpyopkDPymYzEO4aEYYLvK1NSxNAr9AgWrNgNp3xWefvsmBj9XIWfWav+KnTojplc6N
	cDObx4q4MYOxVulz2ZNeHzwcptNQIw+bxzFeON7s5MmqQMW6DtOkdbyAwdF5ATgyykjSPNJKAWSmx
	0JVSHZVIdyEJi9Lw3Z0fyItxMII4s3lGEH9212ha6Z6c15iqKurjSBM/n1OckPSMzTzpUsW7C5KuO
	fKAopYmffaOHli/Ku+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCTR-00000000mZP-2l8f;
	Mon, 28 Sep 2026 14:36:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCTP-00000000mYu-2TaJ
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:36:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAPA6558663
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qxLv+wRWUPQ
	akyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=; b=PhsmkViQJCQemOPtl3iSwfqxLSx
	H1fsXQFhaw0QaJgQtyvDTJgSLVVQuvDwsotMKk2pwtHckkciUEGML0xfKcPf98Wp
	vin8jKqi1SaP3eleGdOEg7yBW5QbMfx7RF+6LAzz/jgrPP/GPEPtVaDOS9ztH4Tv
	Oc0Jh4N4HkqvGf+tQV6HRr8Fr2WrrUVzV+N3FFwOGYpg25m09BYu/iyOM49vJfdX
	VepGC9OC6VN1I5a7UxNpNlab3ygBmiSIrbtw/zbYKGyKNusJj+NdOWILbS+hVQmF
	t3OrWlUdMCKh/SwOazWzwIoNyuHMOHjZJvuMPy3K9+N+QE8cTGWzVdm4HLw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq2krv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:36:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-791463ed29dso2781412137.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606214; x=1791211014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxLv+wRWUPQakyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=;
        b=ckb2oV9AOgIdPFV+0+BQyhLKqOpsNGXfszlokSLld7RXkpajfpOaxq7wJjrD3HPaO5
         QodPdETPK8P3def3c7Hxuwz/4z5N7TfIa/v/ALIk+xTVchpMZP1BWTvX5pAvzbE/RgZp
         TFNPusijk/jRK4MUPJZVvvIsWdNnWhM8R7cSUTRzZiaKan6iyufX5r5Qg428cLLVk2MC
         k6wv7Jo8p0QdkdOBjA91ReFZVLdtjtG0UV1V49YIJQmqh4s96QjxzX+dmA9V737EqoLg
         8Q5KCEWvcA4lQ/T1jwfS0qeFobowwRBXt1oIMP80jiPe6tHgMsK//HVzIoiL0DqKB+6D
         txeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606214; x=1791211014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qxLv+wRWUPQakyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=;
        b=Nk2w1KY0vU5jyMC6dklVMb8XvYwrhDQnqOTN4hxH5CDi4+BpiNKnays0Fn48Zv5Uia
         WEOUZmKz7/pDGGjkDDolfrFIiownlF6SWx+qTtpIp49jXaZXePzZYa0yS55sKIX/Pbbj
         8gR024e8Y1heMGqNSksPTwTUzNVSZkF8mezsj9g2cRzP1eeNwKNO4FruoDDh9H66IUPF
         hotEj/KtV7ma7jaKeBkEo6KghIMuOPK1xY2uET+1I1sgsH4eMClnHh3Ngr9OpMtANjC5
         J7PP/tVeDf4H5VwT7IIPdbI+uEaqDYIBm6zwRHAhEMFHGXSuzP5G8iz9RRyL4ma6pp3J
         cKrg==
X-Forwarded-Encrypted: i=1; AKwUvBxQB053LS476W2caTnXTBr9A3w6Iyi+V1yohKJU3m9Zn6Hh3mw4Go3nAut+4sXhjmUcotrhh8sFs+KHJQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLZzAq7lVUn5dnuEfygmw3HLjk9y1o1ZNrikLvFDUoKRK0LK2Jv
	vAekrPrVy0lJh7lQkii4Tru3N2mWSPUBNjXb4QTQpUxQ/qh/mqeD8dE6IH22HW7OzG+t7Q/hl92
	JaxZhJeTupk2O5fwKtD1g5/dSdBtiriVBe+TkePTcvHkw6XuD+o8fSRRaImG0/CtogRnyl/pyR0
	R4YC4=
X-Gm-Gg: AYBFou17paBu0vzk5aQGuh6ZsSAMwwnsA1Ghwz8QycW9MeP+3ibee+8vwghd0Xo1Cui
	7JwuSscKjmubciI7SHCwtZarXQ7d5iH05Ux63/w0CSjZ+VViY1wYQAJyPRCY79I62DMXwL5N0V3
	9twEBEeJ8SEZkxCxRqFa8lxWe0ZD76OKTCl9v5Pt896IbTk30vdsocxPIDMCoidjzD3qmdWpVGn
	LNc5ejgGvFdnI31tFbAxJYAsB6mkL8+zX6ET5/OnLF6gEYl7O+2Wx2bfSVDETFGgMGDr3xRyIwy
	SImqVi86EbejdNggJZ9QNkAJgzCBexcxoZ0gbqK1Xbw/yzIx1HgA9HRBQoKQyP3cSsV8Am3xQzC
	EioslwY9wO4Hra5v/F2PzOOKA2mFEza2O15MFeA==
X-Received: by 2002:a05:6102:5693:b0:7a7:198a:c2b4 with SMTP id ada2fe7eead31-7af1dddb48emr5062312137.28.1790606213761;
        Mon, 28 Sep 2026 07:36:53 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7b27aac8d4bmr3265770137.29.1790605900321;
        Mon, 28 Sep 2026 07:31:40 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaecf2f62esm4040194a12.27.2026.09.28.07.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:39 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 04/14] iommu/riscv: Reject live S2 replacement with forwarded IRQs
Date: Mon, 28 Sep 2026 16:31:03 +0200
Message-ID: <20260928143113.49838-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: DUkpQD8If0OaYcR7uP_hcst5w-YmqjZQ
X-Proofpoint-GUID: DUkpQD8If0OaYcR7uP_hcst5w-YmqjZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXxaznPwnVXsG0
 HFgt9XfhEy8xE3oyh30Dt48Gcb7sMnI9jf+MiIOG1W34HeoEHtcNxYsdtE3F0P3BqGBPPivq1Ux
 9oDINjbFC39ELq4obETcSlhT5JVNhbs=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba7b86 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=t97w11WlQ40Dee02AfYA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX/gJFCxUuG2Vs
 3OxBVqyNRWFpKpX5txkkZvnL13bcQCG+/P4f7dPmJZl8THpTQ8uj+4TtIWJeqIb/aQyqanEY5He
 UgEiagpmDIMDMouqIEYXFQqEeigA58PBmANwPx1xSenAivezB7UPLWAzgLGwRa/H569W6wFrDjV
 NzlEHn6XMPdxtE3WKophwWVetyKd8BUOkKz73W/nQ1AyEqxc+vGhzRtYCZVqx1kaoKdX7TwJFUV
 giWnxN6CRTdLVFnz6qzcI6w162CIcKwGQ3bEA1qjOw2/7/n45qVzp+iob+SaSRHlo0dPSZSoE+R
 Qv/VPLyF6j4oWtqE35Ovof+UICo02V8GcGll9vJeEDd77x45sRVIF5QEdU+xr3S769EeyxzPxJ+
 w6td/eIBy94RVacyG4VJ56uLh2PvbZVkP0leVjgoRTZRq5+8hTjBIr+0nVe+l7o47rJT4oqGL35
 oQTCZy4DgYY2R+ZfVmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073655_659087_82C9D655 
X-CRM114-Status: GOOD (  16.96  )
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

MSI forwarding state is tied to the S2 domain MSI table. Replacing a
device's S2 domain while one of its IRQs is forwarded would leave the
IRQ state referring to the detached table.

Reject direct S2-to-S2 replacement when the moving device has forwarded
IRQs. Introduce a per-device nr_forwarded_irqs counter, rather than
domain-wide accounting, so other devices in the same IOMMU group can
still move and can be rolled back if a later device fails.

Later patches which introduce interrupt remapping support will manage
the newly introduced nr_forwarded_irqs counter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 57f2884dec42..d48667112cd9 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -872,6 +872,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
+	unsigned int nr_forwarded_irqs;
 };
 
 static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
@@ -1432,6 +1433,36 @@ static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
 	return 0;
 }
 
+static bool riscv_iommu_can_attach_paging_domain(struct iommu_domain *iommu_domain,
+						 struct device *dev,
+						 struct iommu_domain *old)
+{
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	bool new_is_s2 = domain->gscid;
+	struct riscv_iommu_msi_table *new_msi_table, *old_msi_table;
+
+	if (iommu_domain == old)
+		return true;
+
+	new_msi_table = riscv_iommu_domain_msi_table(iommu_domain);
+	old_msi_table = riscv_iommu_domain_msi_table(old);
+
+	if (new_msi_table)
+		lockdep_assert_held(&new_msi_table->lock);
+	if (old_msi_table)
+		lockdep_assert_held(&old_msi_table->lock);
+
+	/*
+	 * Per-device accounting allows other devices in the same IOMMU group
+	 * to move or roll back while this device has forwarded interrupts.
+	 */
+	if (new_is_s2 && old_msi_table && info->nr_forwarded_irqs)
+		return false;
+
+	return true;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1477,6 +1508,11 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	bond->dev = dev;
 
 	flags = riscv_iommu_msi_tables_lock(old, iommu_domain);
+	if (!riscv_iommu_can_attach_paging_domain(iommu_domain, dev, old)) {
+		riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
+		kfree(bond);
+		return -EBUSY;
+	}
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
