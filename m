Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2074C624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEN1OaZuv67+4eeXGudKXkwo0aSoHiIYHB7X1Vb5f6s=; b=gJvWUuCIaJY8Jn
	o0Xit0iFKxZDs/WihrnlLxCCLQPtRsX+Yf+MAxGKG/rY1ILUrg/QcH4lH6CtvdDsl2lCT6lqpYVDO
	yG8vEvoN+AYMVPNW/vDIZPo4KNPbmyhVhGnY4hgN5tydq+k6GLJY0MMu5hDJkY01nIlQZnMyVFSHx
	svJ6xlwttxdO5E87FIkpRvecLfCzKWXe9/rpTRAebWYFAnRGxoNzuZJ7RXfk4NOFGBxtZHFodwfcO
	qO+DJxLKbXnoWyjWJo8jFzJG6aNCm1pvLLbbw+czCpfYtXqod+3fOjH0M5fCzUuYJwX3/ptAHHywt
	yqeeeMGkUjBhEW6neW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UO-00000009kVC-47jh;
	Mon, 31 Aug 2026 15:00:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UL-00000009kRz-0QxY
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 14:59:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETWUc3807941
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6jRs6t/MtD4
	/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=; b=Tvpmr3b/n+gH1qkQjzEane+onHE
	HJl3j7XKS+R696JDcCDt4SHnUsqGxikRmmw1nK/2Fgqgap48ngrFUssta3/Y2a73
	umAiJmxB09hNcDqIjNIGCMwZy+P08Za92pZL5bp8U5LmkzgUNvhOK6WiBj6z4S0Q
	RU1GbGj/r3sipkXmtGr2BYAAIR1F2mRdt8TmPVQp7VtHrGgWiLe0PsyimsimfeXr
	qogjxLOPt1JhcXBdY4MSx0/w0da8nM5v9d8vAEk+jKLGje3IH2DOKXbOXILWDCT3
	hcnd5G+fsa6SxtAJgvBGEviLlSZTOUMvygIe5/3zoj1vDXXJRQGYuTRe/JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbaj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939281526e1so122423485a.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188395; x=1788793195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jRs6t/MtD4/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=;
        b=dQoqF9L/taib+4gutc54kb4TfcvD9VSCI3eyktnjcNjDqZ5PvtnW0FvWXocZGgAs13
         sJp0YuYzpRJwwmPV55cSQKs7DQ0pQ3x5eG9fKNYP3zX8GXoIqfNmfxGokAYAszEDf4S1
         +ULdEDlEUYEgBhYr6YS7EE08+glgF5zWvYM0pD2Uh8ig4oTzOTTTMjV5mJJ6qTgU8x08
         JSuONGt6TXkc+Pstm1n2FFayq2loDwdZHGOszW/DRQ83cDtJyS+Ri8n7OEWppkSvH/o0
         RdpKucup+9/UQ+Lphg6RJTIjyo7k754YDZLxbGA7OeBkuiBSi+wAQEitek8uonHc6uzu
         p5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188395; x=1788793195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jRs6t/MtD4/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=;
        b=jNmP/v9jBYVsovyZ2so48OxwU3UDEr9n+QhclvQ3KjQqECXskc1o6bXo9Uvdi/eFA6
         xorWDRXJIXBQzsT+QyjLpWeQqU3S/J8B1db9CAPLEmZ0G8wf2y3CQeT/amjAq1/GJ6Ig
         1w2XWHmLWveM0eflnsSQjo8n3D7146CxYMhPDjNRmPGo7CRE645n41RS19JXtJk1p12R
         hd94LAOvC8PxEilpDNrZoAkgz4OB+njeK+fpGMYA+5RFIkiAjNSmWes8XdVuowMjcCtn
         HyNXHhcNmrqsJJ4O7wyyoLuSx5VnQfwYLaWVVmJJJFmu4LJMTDUknLyzjGrVxg/+Eqbx
         qyBQ==
X-Gm-Message-State: AFuF++muSkJjIhLf3Us+7K57/BXpg1lJ4KofjROneTXTrpQaMevZBamN
	ciNDOGpwJ4TvUbjQS8mfiN7lCwZRwU/MEp4S6RsfJUCZ8O6mCfbnHxd9b0RF3thCIBGTSL12ht5
	3FoVv9UJFVIe2VAFRCh8VbcpnFbhf7qXygqpbtbJm6S0OLmJuIKF4gMsKewNMM9D3OSxQ1MzFff
	RzEHI=
X-Gm-Gg: AR+sD11OSvcPMe5sdLBGl6amJqm5RU/V2ueimusJI3IQ/1mJ8jQ6Z/LxhnYGN9Xmx4E
	Dc6xMhjAVnxLEci/CIJ+7SQ+qU+NLt4MOBqj362cM6KQUo8wiZfaociq1CZ0wj9l13gWtmKFBoF
	vwUjPk0O9J3M3ULR6LjWtq14s7uTp9CBhRZDoJyuFT6mVjXlq8Kwprlf1yW9uLjk2ZrFNoQc7Ji
	Sz7HUNjDwfFtaQBmU+E8B2dac6veA+WXeFx65CLQr5B95pJ+8jg3yR/Q5BvO2UMbDDUhfBo/jOG
	VkVXAhJanAdLWNCdxACzHatD3H+Wcz361asUsE3ndJNtalcj5e/pjWamsaMIcNZVH1oG7oR6vMQ
	4jJu5ncxnyP2d5o7h1T39+pO8vninZoOcwiE=
X-Received: by 2002:a05:620a:470c:b0:936:e99c:4fc0 with SMTP id af79cd13be357-939137c8742mr2984826785a.12.1788188395493;
        Mon, 31 Aug 2026 07:59:55 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:936:e99c:4fc0 with SMTP id af79cd13be357-939137c8742mr2984772485a.12.1788188390253;
        Mon, 31 Aug 2026 07:59:50 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33070sm23895053f8f.36.2026.08.31.07.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:49 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 03/17] iommufd: Split software MSI map lookup and allocation
Date: Mon, 31 Aug 2026 16:59:29 +0200
Message-ID: <20260831145943.313726-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9596ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_mR3RRazA89hjPCjrIEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXyKtHojEjtrA0
 HpVMS1/tzLDTwyc8TL1mJTDQqfYO3k2d+G3qhNsfJyWPSs+sz4i4gePoU3w5tts10YeG9HPjwkt
 Zxvy+1wk9GXVv11lKQ7q1erS+C/DPJ8=
X-Proofpoint-ORIG-GUID: 0otSGJHTefDqLr-2FvvJ_DQn_UJPh3ZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXwwkR0jRP7hsm
 jKUfiCV+JbgL1faU8ybHOEYWmIG71htYiiZvl1Q8ZrI3F7oFDOprNznDANj+ch/YzmIqvCMoT8S
 ylTO6vzyMv/MyeA9E9jimpoHuZoYx5/ROty11EManvP1GlAINk6Srvb3/k9lrz97hAfcbBW1M7S
 DbAOSxjiUKac4HtV6DfTMlHQ63YDy2jIFJl6+rSLrfsdQB92S/WHjatQQRHJpTtTtNBarvLTYrU
 xRtDBs3HHkkII2wUR+48lDczKY9IHMSzv6SI6HwBGbz+d2rQEsQBlslYq8os9POspBJdwl4MVbG
 dIlfwVx5HM+Q/+xEF9yjnUkpU9BIhGIu52tKPvAKRO/1XAqyQiiIkomggFWKGUFiqoVxoJSsFL4
 P3Bal5vQ/xl14yvzTZbUs0dex+G0sOivJ66da13zek6eZo21qcSB58UxF0j6Sn/4rbO7Euk6uR9
 K+VptElOZsqaAsnWzSw==
X-Proofpoint-GUID: 0otSGJHTefDqLr-2FvvJ_DQn_UJPh3ZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075957_260761_34F59F80 
X-CRM114-Status: GOOD (  16.05  )
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

Separate lookup of an existing software MSI mapping from allocation of a
new mapping. This prepares the code for allocating multiple mappings for
an MSI physical address list.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/driver.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index d0b05b1fda42..3856989f5c4b 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -189,6 +189,23 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 		       phys_addr_t sw_msi_start)
 {
 	struct iommufd_sw_msi_map *cur;
+
+	lockdep_assert_held(&ictx->sw_msi_lock);
+
+	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
+		if (cur->sw_msi_start != sw_msi_start)
+			continue;
+		if (cur->msi_addr == msi_addr)
+			return cur;
+	}
+	return NULL;
+}
+
+static struct iommufd_sw_msi_map *
+iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
+			 phys_addr_t sw_msi_start)
+{
+	struct iommufd_sw_msi_map *cur;
 	unsigned int max_pgoff = 0;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
@@ -199,8 +216,6 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 		if (cur->pgoff == UINT_MAX)
 			return ERR_PTR(-EOVERFLOW);
 		max_pgoff = max(max_pgoff, cur->pgoff + 1);
-		if (cur->msi_addr == msi_addr)
-			return cur;
 	}
 
 	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
@@ -293,6 +308,10 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
 					 msi_addr & PAGE_MASK,
 					 handle->idev->igroup->sw_msi_start);
+	if (!msi_map)
+		msi_map = iommufd_sw_msi_alloc_map(handle->idev->ictx,
+						   msi_addr & PAGE_MASK,
+						   handle->idev->igroup->sw_msi_start);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
