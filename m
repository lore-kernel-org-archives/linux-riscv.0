Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEBDC2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgzlALV9S7dtDVFGgMIgB77Xfb42UYhw5C5V3AWU4U0=; b=hB67riOtyAwwG4
	koMxpQ3lHXW4ZeUApLw3pQuEwFOnBHIJ5sNFPy5cipqBoA82xre//byfiQRoc+/5DkGesTji99sA1
	OiKCohId9xxxNgFWaQR6HkvtfqiF3EEf1vnYVRvGFBrmKPDjQ/wFQVYnSdLdXbCfOyoovSNbTQ6iN
	N3rKxebiVwTO9hPQag/oBAVN8gUW6H3wez5/yGLKNIkwfBvUpCBzhjOnuN+Vvo8E+3wTbv/FIc7J2
	EPduo3DoXHMH4FpoM4IPdJC8TSG480vxqquIZqTFA8zzIuzF51XNna+82sMmL3abs/Exivdac6pF6
	EkPqENcYflRboaoboneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8c-00000008ZUp-0knt;
	Fri, 07 Aug 2026 18:17:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8Y-00000008ZP8-42qm
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GO9RD1545156
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iTv0jCwO912
	wmcL8qqcNPEkS/nj6dxhaU8WhrnHkojQ=; b=mklB5TndssjbeLVPCFCfEIhllbA
	AreDqEw4gr3Mwgw+YqGgOBNyfIsYx55VKpVUmUex3GvikjRw043eonkgweLZyIBi
	VvjrpLY88qVKZPR3zAfdkXTXxHOEqxiOfRJGyfgCyRY2cfIICLYIthjhnw2Q3+WV
	4aFSekA+gO2jQI3HvZW1gs5Nxi5zGH3G5u6oINJKW8LjvwpJ1iwC7xbJgNZRz8jZ
	xjIlStMlWknBUGBHTxW46YF0UYC56Kavo7+4ICFVNQy8wNzZvRwGKGNVObuGGpFi
	5iDndkOEhg1qjhQwzUXpHyWtiG5ZyvYp1LZyUEhnMq4ROnwKt9K7qcLkQXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwege1sbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso43901121cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126661; x=1786731461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTv0jCwO912wmcL8qqcNPEkS/nj6dxhaU8WhrnHkojQ=;
        b=M2+sXxnlyjvXquhssgBxuTSXyv8Q3r5eIQ8URXXv4DHffHGxJrcOv9o27bu2+uXMYC
         8eu4mU/iMXV2LcsTgZPWyMTsxfEsbyqfOhIURxanwR2qbhCgAMV3K/ixePI1TrwnvtgT
         qQMZbNzckA2qyeSDbG0soBAdWtQXLBIX1H1NuQlm+bgrJp8h/HkV+/M3CCxzRlagddBY
         fLzbmSSccIAnaQF46Yrttnk7HBlPOi/fCyTjz+lFNiDnMalUGRyuieo9ftOzXjTqU0W+
         SDYecLgcg9m5wsUj1c6Qzpk3h1PvVu2d2cyvmNewq3Wq9rfGi6KoWjMK/DU2M0xqpJ/U
         XHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126661; x=1786731461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTv0jCwO912wmcL8qqcNPEkS/nj6dxhaU8WhrnHkojQ=;
        b=Q2Q9Z4tZ0/9IyPNR1tMOpaqFF5/qXDkUuaos0O2R2L+08DHZHwc1ziwcvZwKlImChZ
         0VtWyE7tuILQVitx5wxNCTR0wVQSYkKhnFQNleonX9PJpt7ksNEVn+bYrzkJ21QTpeVZ
         i+jJhwPaozNMERjkgy8AFabwMquYfAIswQ83vsq/dNzHWBHcOkDHTS4MFfNDrcSQH2Vw
         gHylKsekVK314rMZPx62SLSlAZUkP2WHSo3qloi68k22tl7Vkn9FmSZAvJhI+JoeqhWb
         5rtjVJr3MdQe++/lHfUBVIHfBahwmcAlTacMShco0OW55Zh7hYwmQgLX4i4o8ZuA/ExG
         edFA==
X-Gm-Message-State: AOJu0Yz/6hcnyBLj0sAWE//HuQmID2cmfL6TiGxYhVeHmUMhIIaWPkv0
	dzcNx8BZEpak419gCD4MrX8xMZkXkdhqJOYYFdl3u802pvkx2vv3ikjcqMYt2hfLhIOTAUaC0sp
	IF8Aiv1+GoNHvyoTQmHLg1CyaZCFCG9Lpn9w8Hzp+tlfL4gCVIO6vdOedCNiuFa04m7Kkiuz9DD
	VreYg=
X-Gm-Gg: AR+sD125DccNDT0Egvh9HCM1/uYA+GZ8ruXcv6EyKiCGYu5oytaSHjsy2Takr035jZH
	sIKfAsNomvc2eEN0pBwz7K7L0UMwzyjvPDkuD3Tz8tg7Pv/zdFG3YhZV7kE6KqxgfIJ6a3NFEDa
	HIF6BlfJfFrnB+AYTC0JQ5mmD9sDk8QQ/NLLFXpKm1jjha/dToAYOjKE2LLhBjJ2ZxjtLX3IqXU
	Nf8fDaoGMC7tALPQirwl6E1VHPvxmkKlkwb8V4psEQ0ehzkhSoXiaDLNv8/6Kn5U05sCzLYlOpE
	W9SShY5TWNtcEMJUcobwlz/wqF4pU8HUi/+EnycWP8HvGhW4FljSh8zune26udaBmX86dRTOLnV
	mb5cneFLS0X++F/yWGRmIKBu2lir1hh50h9v9DQo=
X-Received: by 2002:ac8:5ad3:0:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-52ce5f612dbmr250076911cf.9.1786126661442;
        Fri, 07 Aug 2026 11:17:41 -0700 (PDT)
X-Received: by 2002:ac8:5ad3:0:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-52ce5f612dbmr250076111cf.9.1786126660848;
        Fri, 07 Aug 2026 11:17:40 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7d48dcasm833503a12.15.2026.08.07.11.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:39 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 12/19] iommu/riscv: Gate identity boundary switches with live MSIs
Date: Fri,  7 Aug 2026 20:17:06 +0200
Message-ID: <20260807181713.228535-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: RjB-m0aS6Q2GAplMU6TAR8j73ElgCVWQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX+yT4lkCNg3IB
 KssWpbuD9+harpgpffBZqmGClAn4Ra8mpXZifq2FKkU0tQoqFvl1YbCDvVprEAYRxp0kl8OL16T
 hOl4HV+1vCC86w16w6lEGRYN/ABwFjM=
X-Proofpoint-GUID: RjB-m0aS6Q2GAplMU6TAR8j73ElgCVWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX8j9DGOZfxKMh
 Xnq5oGDyNUlEGdSAnI3uzyD0ae+zgB7SrMd0nbS9Yav1JkVAKmPpF1/AFASL7Da7BzoI/yo0oMC
 kNGS2WERubZAxoKwDtU9OAhDpK59YN/ARFh6BvCRfyT8xfQV4WoPDaSly4j9oedSaO00zGv2jWK
 6c6kzwVIQxfxGd/v95AMokheogKe881vC5qzBZElpq1lvdyTrZfROPw7d4DGCJs47r1uy8fNT13
 LTNJHHmMdQNajtU6Ls2igYo9wtMDG22DZD5Tg3d9WwZ+klTtEfAUTHO4vYGHcNpYnk8/mtweXvH
 DPqZ9ZoOo3bZL7nqy/D8H6xg8tF+XbQ/MUWTVnyj/F7WUGEd7EuxpmXgUYzgoHg1TaBwGsJpQ+5
 KPanR+jAiWr/eG912AteNz0IQSj87mNQCL3srfwPWT3Gecq2mRgijUho7t9elKMJrVau94n5AzX
 Mdc/dObF7DhCUkiEtQQ==
X-Authority-Analysis: v=2.4 cv=X71i7mTe c=1 sm=1 tr=0 ts=6a762146 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RNHjlBfCUNiOovmqR6wA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111743_015086_9A00819A 
X-CRM114-Status: GOOD (  12.85  )
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

Reject identity-boundary domain transitions while a device still has
allocated MSIs.

The RISC-V IOMMU MSI compose path can run concurrently with domain
attach and derives the MSI address rewrite policy from info->domain.
Across an identity boundary, a stale decision can turn into a wrong
addressing mode (IOVA vs PA), so require nr_msis == 0 when crossing
between paging and identity domains.

This is just a defensive guard since MSI state should be quiesced
before crossing the identity boundary anyway.

Do not gate paging <-> blocking: blocking is the fail-stop mode and
must become available immediately, even with live MSIs.

Do not gate paging -> paging: that path already uses nr_msis to
ensure new-domain MSI table readiness before install.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 07287c0e72e7..f40db2cda417 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1272,10 +1272,14 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	bool old_identity = old && old->type == IOMMU_DOMAIN_IDENTITY;
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	u64 fsc, ta;
 	int ret;
 
+	if (old_identity && info->nr_msis)
+		return -EBUSY;
+
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
 	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
@@ -1394,6 +1398,10 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	bool old_paging = old && (old->type & __IOMMU_DOMAIN_PAGING);
+
+	if (old_paging && info->nr_msis)
+		return -EBUSY;
 
 	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
 	riscv_iommu_bond_unlink(rcu_access_pointer(info->domain), dev);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
