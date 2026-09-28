Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEA5CA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5wzovNy9hgkUq17n4ccnBI3t+C09RSr7MywudUm4Z8=; b=ABYyP9GV7f/8mG
	0Icutz2Kklz4QAc8RQ/yN/LZwS+1a61WHgE0ZHYuxb2AnxgwbCYEmJDj6Ql/IOj0LVTu5VQLwC3wF
	k1PZm9bHCC1IXGiuDkf1gZiAuQHoHXWQ/Re22Z1FSSJfNMJuCWx9bz0JAIQfaJ7U3fU7Mn38K2SQL
	WxAt0Y7uss6m24kvKlRidTzTItAazNh6Ieg+PtKJDZ6TSGoFWpt7gAcGTYOW4yACcmMwC7AofA1Ng
	Ip0Oa9+DMZoQs5VM2JoH+jrYJF6rD9PFxr5bQWXyCBxIJEN8I+XiH5HuawldOFyAyuTcZNGrXX1wR
	UrE3qH5ubwcOuH6qTrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUG-00000000mk6-3YBF;
	Mon, 28 Sep 2026 14:37:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUE-00000000mjC-0y9l
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:37:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAWH3782859
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jvlI2T8w+64
	hQrpum98oA1DnDUfoowHi2+WuxN0638E=; b=ninvSctiq/nMCrPjojeVd+h7piV
	MkS2L0yVYz80LV5d/CefxgMB16lyAZhxotakiwoBSpDK+1NKDQLiDyBCcl6JhcL5
	0cVwUZ2Lgk7ZKuCNfd/Dp/nJAWjYmR7S2mmbcrUcZsprSqQM5fj+HuvbAOXn3x45
	ALQZ2QnrTVXvEtxkzgwL8rVJg/Y9I0Cbzb+LPsN6OrFjDBC8cbcVETgQa/t6y5wX
	wsF8RTOlSs7uYGLAvc3y8W4UF98GAfijitszPClypIQKEN0ib4RvALb9cZ0sxP1H
	/FygaS5wZHxSsf47sjUpIdUEtJEP/+158ZrYE6ERboIsnX1Nb8d6xOMa1wQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4ayjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:37:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33baaba6371so11477926eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606265; x=1791211065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvlI2T8w+64hQrpum98oA1DnDUfoowHi2+WuxN0638E=;
        b=ZHEu9Z1xhhy0Tum+hHa/tosQDBie3BfK4ea+nIGBBtD4EUWIOwRqqy5UJ47lzjbY0/
         Go6J2m5hnCXC6VH361dZmT7/3UOnUdh5tjjGRhPZS4UFZzMPE3ZEor2HxI93DARGPIS2
         OoE1xgX5pj79TtXTv78N4KbdMZZokYKu9h3lU/tdZFZWoXCYbLuuJa2Yk8SyE9i364d2
         ToZ/dNiZB/NRCxa1jgUC0aQkWHkiwD3gktdDe6lm0MJA+rnmn988psvb0nZp2pSvrNaU
         VC7d2cRLQC0/1sjzLKvvNnatEIlAfJokrfhz1H5/NwT+eYfZy5qB1kcgpFeL1tyUY+AZ
         t5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606265; x=1791211065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvlI2T8w+64hQrpum98oA1DnDUfoowHi2+WuxN0638E=;
        b=MobFE/QFynpWD6OTlj13vs1Aq4VOw76roT6mdqAOHfyUMPNAxPXLaRCX88SLkjBXIj
         zQrkBlVa5WtOkAjmtpLhAsDOVZJaii8ZpLuhTceWoxdbkRRnzcKYjROAWxreujmhnV1Z
         26f9d+ty5wWMW4YkWWzx0nDnCLJlc/SpmU6/jZRGWon+ZUrDADrszhgUIaIO22Uzvfhi
         EGjqJ6S4RDw0jNEcIcFr2oJewvnjExq4NOjBppTIbo5AC5lnLKIbkNHHqMQ26ffTpaJP
         vUOnM417FEPcHOuNFF3NYIKfNqn3auoirJrw+ivIFosquaREISLvvbweNaSljoH8Konj
         LMlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw60xblKQVb+FCXcmo4aAo+tJKzY/0+YjFa1417hNZLn1r0041mYfdMV5DUo3EpuLsAeneef1zNRL0NFQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mXejD0NtD5DnwXxyCQNDvR/IUZkj48t1KRS5XekgUiW/rwyPo0
	SiM+K+/ZL/QLyBSso1847o0YMVw0pjBgcaVBGEQAMRYNIqT7LP/Mas98kP0RK6r21/S6Cv2TgSI
	n1STLEy6bBhGjAkclmHlm/0Ig//Ng7OfISp1sUDojPF0wjeGDogxRN6KeIPPP/cz3fff8kUQ=
X-Gm-Gg: AYBFou25MfqJl04QLpK4Gng4idt2tKYng/jN7kiuL1/4XPFSy5e1pmmu29y8zi5Qzxo
	TI8ZaMrFREXDkCfEl7yk/TWJihAFE4752vmsxI7Sp78mCnqZQvnKZUdKLL7fNlrvWEfGka8a6Sz
	biupWiBRO/HLd59sqjX3ldgz6wSJ6DJgvByIgdljiqvQUczLQLTnG3GCUDPiVQg0PJh+gw9zGVE
	BF4QWjb1Uhxeu81fHhnnBUTc3l6Jv++A4mkwdV1BQ7oDqxpj/BEXSy8BQF0xEbOaf7y532/eH3W
	X7zU9bJ3dCkiwzoj9UrnEDBV+sQUBkS8qFO9ImlXkuIPyr5JSDynod/Xgzxj0aqe+/PYWlsM81c
	NweqWIJ+t1iO+qQbKAIDr1Ul9FtXtB49vmZJRHg==
X-Received: by 2002:a05:701b:4205:20b0:144:c12b:4e35 with SMTP id a92af1059eb24-146d077b35bmr10326933c88.42.1790606264940;
        Mon, 28 Sep 2026 07:37:44 -0700 (PDT)
X-Received: by 2002:a05:6102:869c:10b0:7af:81dd:a9d3 with SMTP id ada2fe7eead31-7af81ddbe26mr2436839137.29.1790605898562;
        Mon, 28 Sep 2026 07:31:38 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76ad030sm484086466b.36.2026.09.28.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:37 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 03/14] iommu/riscv: Serialize MSI table publication with domain attachment
Date: Mon, 28 Sep 2026 16:31:02 +0200
Message-ID: <20260928143113.49838-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: WsZvIbW9Ezxjct3xaialbnpdxnTZDcMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX3Hh77tqG2SB0
 dXpRck/6KleiXImloqTj4Jhy72LtHQ/Ds3K3q4cM3ikw58KZrOjzOtfsYCkAtPzgS2PP5Qr/Urm
 1NUrc2wf+CiLfZvYiF4X2vg1rpQzKkifoffVuQereII08Sk+e2seheUqa7WkCOSUcR4ysP/jUQu
 9siOEkDxgtgBKy5emXWewHcNLBfW7m0wfdEOQ+vR/xigOO9LVX+Cj0fw6aVh475q9h6xvBmlaCb
 Sm2wfiqRjIfM297Pg3TteP1zrYH32fTZjjQBsBdT/ovWLyISEMkyYlqnWg8I/oplEAU5R/HG71f
 rA8pViG06N0bsl3Rgehjxn7+dHWgD0GmA75PmF+2ctXUH2oDufmzatnOu9Oz4CvYtqUOQgMXNiY
 WR0IsBwhPh3bipdPnjk7KH4K7g4/9PwyZBSdUR/QaqzUTEOfX9I1sYn79pmxkBOHkGK1FJcGMgG
 /r2PmRmTEShKOUppTjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX/xNLWU2C/b8Z
 or+xThqOIYXlBKa9XL/y/yNMDNyr4gk2mgLLcM9W6sD2qOZ2mgojHk5n6UrhcLp7mKtaIR+tBNA
 LZL6CorAvmeDG+L23W/udlF75NClFl0=
X-Proofpoint-ORIG-GUID: WsZvIbW9Ezxjct3xaialbnpdxnTZDcMc
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba7bb9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BJuWs42claz3fuW2R7YA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073746_348632_3741DDC2 
X-CRM114-Status: GOOD (  19.60  )
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

DMA mappings update entries behind the page-table root installed in each
attached device context. The existing bond and barrier protocol ensures
that attachment either observes a completed page-table update or is
included in its IOTLB invalidation.

MSI forwarding also changes whether the MSI page-table configuration is
installed in each device context. The first forwarded interrupt
publishes the configuration to all devices bonded to the domain, while
the last removes it. These domain-wide updates can run concurrently with
attachment because devices in different IOMMU groups have different
group mutexes.

Serialize attachment to domains with MSI tables against forwarding state
and device-context updates. During domain replacement, lock both old and
new MSI tables because either domain may process forwarding changes for
other attached devices while this device moves. This also prevents an
old-domain RCU walk from overwriting the newly installed device context.

Order the locks by address to prevent opposite-direction replacements
from deadlocking. Domains without MSI tables continue to use only the
bond lock for list updates.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 64 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  2 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 09ec8c3e4a72..57f2884dec42 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -874,6 +874,60 @@ struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
 };
 
+static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
+{
+	struct riscv_iommu_domain *domain;
+
+	if (!iommu_domain || !(iommu_domain->type & __IOMMU_DOMAIN_PAGING))
+		return NULL;
+
+	domain = iommu_domain_to_riscv(iommu_domain);
+	if (!domain->msi_table.nr_ptes)
+		return NULL;
+
+	return &domain->msi_table;
+}
+
+static unsigned long riscv_iommu_msi_tables_lock(struct iommu_domain *domain1,
+						 struct iommu_domain *domain2)
+{
+	struct riscv_iommu_msi_table *first = riscv_iommu_domain_msi_table(domain1);
+	struct riscv_iommu_msi_table *second = riscv_iommu_domain_msi_table(domain2);
+	unsigned long flags = 0;
+
+	/* Address order is stable when the domains reverse roles. */
+	if (!first || (second && first > second))
+		swap(first, second);
+
+	if (!first)
+		return flags;
+
+	raw_spin_lock_irqsave(&first->lock, flags);
+	if (second && second != first)
+		raw_spin_lock_nested(&second->lock, SINGLE_DEPTH_NESTING);
+
+	return flags;
+}
+
+static void riscv_iommu_msi_tables_unlock(struct iommu_domain *domain1,
+					  struct iommu_domain *domain2,
+					  unsigned long flags)
+{
+	struct riscv_iommu_msi_table *first = riscv_iommu_domain_msi_table(domain1);
+	struct riscv_iommu_msi_table *second = riscv_iommu_domain_msi_table(domain2);
+
+	/* Recreate the lock order and release the pair in reverse. */
+	if (!first || (second && first > second))
+		swap(first, second);
+
+	if (!first)
+		return;
+
+	if (second && second != first)
+		raw_spin_unlock(&second->lock);
+	raw_spin_unlock_irqrestore(&first->lock, flags);
+}
+
 /*
  * Linkage between an iommu_domain and attached devices.
  *
@@ -1388,6 +1442,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_bond *bond;
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 	int ret;
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
@@ -1421,10 +1476,12 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		return -ENOMEM;
 	bond->dev = dev;
 
+	flags = riscv_iommu_msi_tables_lock(old, iommu_domain);
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
+	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
 
 	return 0;
 }
@@ -1474,6 +1531,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	raw_spin_lock_init(&domain->lock);
+	raw_spin_lock_init(&domain->msi_table.lock);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
@@ -1569,13 +1627,16 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 
 	dc.fsc = RISCV_IOMMU_FSC_BARE;
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
+	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
+	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
 }
@@ -1594,13 +1655,16 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 
 	dc.fsc = RISCV_IOMMU_FSC_BARE;
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
+	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
+	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
 }
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 6bea9da71ff3..2876703a6698 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -69,6 +69,8 @@ struct riscv_iommu_device {
 };
 
 struct riscv_iommu_msi_table {
+	/* Protects attachment, interrupt forwarding state, and MSI PTE updates. */
+	raw_spinlock_t lock;
 	unsigned int nr_ptes;
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
