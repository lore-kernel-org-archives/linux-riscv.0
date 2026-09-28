Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2152CCA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0XtpJJF5OV0S4JA/SJuHGDVJ1ykClZ2VoBORBlitKw=; b=NMOlPtg9+rVheV
	FB0oIUGkbzJb/H3a21a1BjQBnv0VyNyVcGsFdz2pLttIQSTVGxg1TeSOmHtNpz+CjyK4Sq6UASozN
	AKcmFrvysNFtmBDTxofsVsVKEdIhLgaybLgh0DSNeQ7/f6+2RY4mLHM1UKNEUBqDSo5h/yR561gyK
	H9Q+JPk3cWmPBAF/w0FDAVoYdXWXzEkKIpg3P/7qCUyhazvfgJOnvhI3GXbJqcOKc8KSZzCvqYKNF
	NaYPPHiFGsFVpVG7Gifb0pVAsZH6i7YRcPyNrldQeFAmVS/5VeIEvF/NUjbgCdgpieD4+7waKF4Zy
	aFQHRtUNSs0+I/S/dnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUi-00000000msP-0VsQ;
	Mon, 28 Sep 2026 14:38:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUf-00000000mrA-3hz3
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:38:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAbQE1450723
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SgBxAUOx84U
	cn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=; b=PeL9p4w26BhoNlRqOvQ3LSV7n/M
	IktOMye2ZvfZB0pICaZ3TBWrcQlguntFEJzgoIjtjths47tJk1xoUZly2IPaQszy
	pNIDDoUjuy9W6cB/mpFxHlby71PtXHVdx0VWz6WtEILSV8JQfkeE87kr7Ib7ZPIG
	TOC7sMO2YdQEslR/txVR634Jw5qrZWxsKyoGjrLuyh/QQjmvwNSaJ/WsFebp67mG
	IImMljNxomfy+bPYM3oRVTQ8paB3pwle9mjd3f8s58TbjX1938Z7pGGKc7eXz9Rg
	gV+3ERanv7za6SCrYk/1jUrCxiIAqpgci3qNcOuCurOWNf5dPF9aV7CCWrw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxhwmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342138eeff2so8019173eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606292; x=1791211092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgBxAUOx84Ucn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=;
        b=GIRW3S6ivlYY4mfMdLZNfrxcAfevAVVIdhdW+vMkD5pLYEmVJ7jKl4ovkWPnJpsLyQ
         GANYG1tFvyRptVkZSZ+4tIZ3AtdX7hHTGWHH48IiojbtCWn0KFk+oC3DVc3nqgYchklU
         Qu6XTrR57AZkCcaHBAzDY5oz/W3vDseS8pfmhib1fX0dgqJR6cmsGFoLxGZT7oN2X5lo
         5RrcuL7pgUAYZleZ+2e40Sf1KuuWS67KtRUgRf8S2YdrtTZe8YQeSDxAIaXR0osPw7Ri
         LErQhXgn8xVb/2COEAXn1tfS26AuqrQ1umjujWj/2pMFaB9LOryAzDde+DUIoR/nCK/h
         5fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606292; x=1791211092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgBxAUOx84Ucn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=;
        b=i0ulQcrCgGn5LmQP/hrjmPO3VERB59ivAcUW5zqWY/ACwYdlD4SA+3NiM8h8d4loPz
         cgDs79kiAvoQfekhDsJzipH2jN/s1Df8JS+O0ZXXVQc/8hb3FeE/qAgZLLo6QyuIIebr
         rZDrnzZaiOqNvUO9zK1OcFn+aZw3/iaLjbPyjiYy4O1nSUBJT/FO16kBRpx7AXECDRmV
         WlFOYdJ515i0Uk3ZCu0ksp1Rf/+d52vf0OOQaKaLBQCIxcHsDO0RE7jvUzapAcAd94Q3
         S6n7gyCyFL5mr/l8G8WrxdsaqNC/BP5rmNkMKqAml9XtR8c6IZMXMWhvam6uh3TGFSzk
         uZSA==
X-Forwarded-Encrypted: i=1; AKwUvBxrM/F8IE7yn5lYob8R0Rv3E777Nps1nYtpGFJyugjmxZYqgmZ9E6dkaqxwsA3OTl1qbeM+WhucAQ5tiQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYI6jc+S52oqW5FB6M/t9lV2HUev5yOqGzswF/3XXrx0ro+RnCm2
	4742vY0dOwL5341N6JlklUJ/UAzS50gbW1W/UtdomJBlvyuvS+lr5CACCr3TeKvZUDpdbYP6/JN
	iwLVyR/4tmusqz4iIQiAICS9qbd8Pfz07aNVlt43+pjBl4gQy6/2Sp/oYKskhAnwAf6K/2ic/ET
	pVjyQ=
X-Gm-Gg: AYBFou38cKsIi3oDy8GSM1+Oe9lG6oRHwHqY/hePYlXVZxA+C/dXFbpdVzcXz+ZVMQl
	jLFKFjhsak69YKp2YEsty+IyDJScFPGhJHiFYL/oVfB2Bszns2XTj32eR281oO3zATCx/sVFL0D
	bxSPuvYWdbkMHx/aYcGLMl0GRN4/QAotTxwwFy6Y0UwY9xGsGikTJWa/Kd0+Str7ZjSJ5bd7my3
	WXFPA9RiVIwSNjbEKuQuENCR2nElF1qDCqmm3G2p6GZl+uRc/zj86h6ccMwIn0WGiMe/J29t+WL
	dCSbh0tXFAYRk+KzQetnjkKSglt04b3UdWTL8kYxlwPtCgn6irnHad5+sakZ31hny9SIPL0N+v6
	4uZCG49WC8OYq8M4zbGAz76IFPQCCk6Yzqx3zig==
X-Received: by 2002:a05:693c:65d6:b0:340:e422:fd3d with SMTP id 5a478bee46e88-342709b3233mr10231328eec.17.1790606290832;
        Mon, 28 Sep 2026 07:38:10 -0700 (PDT)
X-Received: by 2002:a05:6102:4b1a:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7af1e4f8b12mr3623511137.24.1790605896839;
        Mon, 28 Sep 2026 07:31:36 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc097csm4205378a12.12.2026.09.28.07.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:36 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 02/14] iommu/riscv: Prepare domain bonds for outer locking
Date: Mon, 28 Sep 2026 16:31:01 +0200
Message-ID: <20260928143113.49838-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: QCNavci2zl10BBrIgwcKWtI-WG1ar_RB
X-Proofpoint-ORIG-GUID: QCNavci2zl10BBrIgwcKWtI-WG1ar_RB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX+fe7qJMkmJC0
 QnTGh1X5bU0kS+Fji6AoXFZjqXFN0V3tvdxyPhzgRGpBwuN1YCfp+arYlTrhcv/42yiGgVWZiKh
 j6NNbpbQ1og+c9vahLhQoGvsmuDiMtk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX3ujgIbRQE1uL
 b/ZeMtaViu6i7WIftrRvDJzuHkYIsaJyLOjG9rWQmez+ePk7CkizEuyaND5YyGU1CeMZK+5439K
 cp0Srrhn96p9T1gIbqtqpebehdRdFm/JzeF4dg3FWU6C0dOHUgdj18dPgl79+MuMT8KA/YPbtlh
 DMxjlvWv9XMlzKDD4dJ9ueJ2opGGY9iwBhowohQO8aLHvTnoYYVFFdP/BVjss4FJXjFvDqG5usO
 YZHyvJtsuYLAP8B5QOGhytYW1HTHD1MmIn7EZ2+hrH2+iS1H40xrwQ23Oed6GnQp4SFA1ZPvAi6
 mn2IZwHbdXD2C8wiid1Xs5TFyjpFOjGGsVkeFGXIZ2QHBRAQQMf+JUdSP7FYxQXAsFwKVfW1YEF
 5vSkGTpraK8m1VW1o2ry2+8bS9M0iEsAWLOT9QcFhN6w0F70wr8PO9hy1X07hILRCYz4sQ9IgU9
 60sAmjPv63lgBHcEYsw==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba7bd4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=69OsnF3JIPtLgHPxktkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073814_035851_CC0433AB 
X-CRM114-Status: GOOD (  17.76  )
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

IRQ bypass will serialize attachment under a raw spinlock. Bond updates
retain their own lock, so make it raw for safe PREEMPT_RT nesting.

MSI forwarding will acquire the MSI table lock under the hardirq-safe
IRQ descriptor lock. Nesting the bond lock below the MSI table lock
therefore requires IRQ protection even for domains without an MSI
table, where attachment takes only the bond lock. Use irqsave/irqrestore
in both bond helpers to avoid a HARDIRQ-safe to HARDIRQ-unsafe lock
dependency.

Also split allocation from list insertion so a future outer lock can be
taken after the sleeping allocation.

No functional change intended.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 3bbb4d0d0a85..09ec8c3e4a72 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -858,7 +858,7 @@ struct riscv_iommu_domain {
 		struct pt_iommu_riscv_64 riscvpt;
 	};
 	struct list_head bonds;
-	spinlock_t lock;		/* protect bonds list updates. */
+	raw_spinlock_t lock;		/* protect bonds list updates. */
 	struct mutex mutex;		/* serialize domain state updates */
 	int pscid;
 	int gscid;
@@ -896,34 +896,27 @@ struct riscv_iommu_bond {
 	struct device *dev;
 };
 
-static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
-				 struct device *dev)
+static void riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
+				  struct riscv_iommu_bond *bond)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
-	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu = dev_to_iommu(bond->dev);
 	struct list_head *bonds;
-
-	bond = kzalloc_obj(*bond);
-	if (!bond)
-		return -ENOMEM;
-	bond->dev = dev;
+	unsigned long flags;
 
 	/*
 	 * List of devices attached to the domain is arranged based on
 	 * managed IOMMU device.
 	 */
 
-	spin_lock(&domain->lock);
+	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each(bonds, &domain->bonds)
 		if (dev_to_iommu(list_entry(bonds, struct riscv_iommu_bond, list)->dev) == iommu)
 			break;
 	list_add_rcu(&bond->list, bonds);
-	spin_unlock(&domain->lock);
+	raw_spin_unlock_irqrestore(&domain->lock, flags);
 
 	/* Synchronize with riscv_iommu_iotlb_inval() sequence. See comment below. */
 	smp_mb();
-
-	return 0;
 }
 
 static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
@@ -932,12 +925,13 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
+	unsigned long flags;
 	int count = 0;
 
 	if (!domain)
 		return;
 
-	spin_lock(&domain->lock);
+	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each_entry(bond, &domain->bonds, list) {
 		if (found && count)
 			break;
@@ -948,7 +942,7 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	}
 	if (found)
 		list_del_rcu(&found->list);
-	spin_unlock(&domain->lock);
+	raw_spin_unlock_irqrestore(&domain->lock, flags);
 	kfree_rcu(found, rcu);
 
 	/*
@@ -1391,6 +1385,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_bond *bond;
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	struct riscv_iommu_dc dc = {0};
 	int ret;
@@ -1421,9 +1416,12 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 	     RISCV_IOMMU_PC_TA_V;
 
-	if (riscv_iommu_bond_link(domain, dev))
+	bond = kzalloc_obj(*bond);
+	if (!bond)
 		return -ENOMEM;
+	bond->dev = dev;
 
+	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
@@ -1475,7 +1473,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
-	spin_lock_init(&domain->lock);
+	raw_spin_lock_init(&domain->lock);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
