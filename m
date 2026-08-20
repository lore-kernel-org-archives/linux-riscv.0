Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F2C5DF90
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7V428d90S/b/l2NRYec6GDF3rVh40PEWU5RBoZpRnhw=; b=Y5B+Br0df6phCw
	9QnT8szl6Q0GhXNgmnJsxS9n7xQ/DbrncA8x5w2xTFrNW14QOftGk8i3FPqD7LPO38X8g/xnGKqyz
	UPErbzx8cwRv+RMa8QekuEtKbRO3oEYjH37LgHubCC1sgkjN4pAA8aElu2nCu7XLUd1VGNcfyql7a
	vk+eXRLEJzSHbzCmnOTrX/CeVHxAkhB5LTfWhmn1zNb8aCANbqDG4J+vHtkYxzSGSVZhT1k36voxH
	S7UTcrvusAR4JgX7Nb/B0h/2W2iZVMPo1vVzqGH6aFZBs40Na61tsJEkaXU6C7OqcPZw3DpnHve4v
	smAOvbSxRAtlrW3YYwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWV-0000000CDdH-3IgQ;
	Thu, 20 Aug 2026 21:42:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWT-0000000CDap-1Ali
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7aWP587707
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qwULhjudGmx
	SOoYi+ERFWqMhOqB03wQScF80uC4a0ZI=; b=RfvY8Wcs3qLdq8oowJMXcR7z1nt
	JNP+PoPdC49U4oITFwviPEmlqZl/9CRhQkS+r4BkjIz5yhhmty6TPI475GXt2RBQ
	99H/h8uDrrc8AbS7hWceCdDQObMx0CZ3TX6KeFbN0BtBi1jHxG0bcq+guN5xIQFS
	fRX4AlUa0O5AgFDuf6zKUb6WGoEOuf7gz836iDigUoSHyp3MUt4e2eT9h9jWxsfs
	etcL+Byl9SRzkYQwlt4d0+5hNiJ/zpDbrTb3N8Oy4QSeIyf+YD7AENanCtGTaXoJ
	2qVktuRWtTAUmDNJsZf6DmoiwxYecuLyk3/FuZ3WcRd0z4mqr5uCz31o7LA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8b23g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so49595885a.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262123; x=1787866923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwULhjudGmxSOoYi+ERFWqMhOqB03wQScF80uC4a0ZI=;
        b=Aa6HD/6B7FlgZ7e6aEVl8UNWaRHFmYbWeIANTbX68tpnzr/pJsBMPVPYhaCmVGuxY2
         A3QoK4u+SkSBuri6FFTcpWEqkZuI8hpRaj2cMDGdnijaCaFQa6taB+YD2vEBSC/KUghe
         g8yW/ybL+dHX+6SOi+BcTzbUzsrLb0au4QBAfdbogPUNtsfGvIC0L6+CxCjz/VROiIYo
         PA5d1lBaBJBIhWfP0H8+hnj2EwOOLq5VfjdgDLuRFsHbpTvmvXNm7q2G5rIBTsK3veDP
         bHsJxzc8eMGkogyi124AwoGDN+B96+iuqDtv/nNUF0x9gwk5HYYbRdP2EmPY/+dOwpKQ
         fjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262123; x=1787866923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwULhjudGmxSOoYi+ERFWqMhOqB03wQScF80uC4a0ZI=;
        b=i9WMMLfDmWGvBdJVt3RUhbqylPLZ50MeFjT31IG4yN0oiMku5oEqzwVmKRvzIZ/DCP
         kYkRkaO7o6QBU96UG9BEmA03zRhhnefQh3Wi4W22GSFTAAOUE6ZUuKBpLdOkCgf+MyAj
         A2yIuctiGB3haBeI5h14KvB+vamF7ecvdC+hnIaxLeU0OQN5jyuXvwKjD2lIo3ZR6Odv
         m7/wEwQ9zbkmkiiw39V37UFfggGqcS9VSWCN1utK3Q9lH4xtadc7P8E6EuDxIfPpKJwg
         3AAr9mHtYjOTkk344asSpX+CbAoRDZZR/6Wrdpa6RTXpH2WzKi0T1y6htV6lb2jZAAlB
         EONQ==
X-Gm-Message-State: AOJu0Yy1TmwtgXOKRMzxpWUkcNlQ+tKBpBGnKHWUho7mRt4H3uDQ/d5P
	1mL5igIU3Z5MwaCkVYfVcFHtg0duH+cZXU4FfXelXSHiATEIQ+/XE7MHfNkplUNYkfYIxfAydU5
	Emqjxu4xeVGXdTc4dT7RCdbvC3/b2Iwd+HuQ0jN4MsX0fYtWW646H5Om9QuADRUNuewpxfxD2bB
	Rm8Fo=
X-Gm-Gg: AR+sD10D+wAAdADhRnAUmJPRTBH1TnWOHyNe5psdRZ3Uo0qNSV7ebCwAQ3F0WnhFl3+
	cipikKHjpl4yp0FJEEdrbGI8z4Nv8P+CURLeNoyKaTAshfqxCmSN5hYkX+uAV08umg+yH/r5DQH
	c0sNbCm9qtFzHCWU3BnaflTx+RAeZbJ6FJCMhtyKrG+DuzJK+K4mudx0zVzu9u5y15XJ6y0vsaH
	WddH0iDsVOJ4JXR3MnEysH4f+nM3JJ+8DKa+xpN+Gk8GkWsWq2wXJEfz2Nlhm5XRFzIDrfYozF5
	rUVLx/JwR5b9T4MyTWeQYS12YhC10pyrPjHnRRPnmGtRfifh3GyY9McOXKgwjBSP5dFbLKJPfu+
	Q5LuotNXb
X-Received: by 2002:a05:620a:3952:b0:937:39a0:a15d with SMTP id af79cd13be357-93739a0a4e7mr100182385a.41.1787262123579;
        Thu, 20 Aug 2026 14:42:03 -0700 (PDT)
X-Received: by 2002:a05:620a:3952:b0:937:39a0:a15d with SMTP id af79cd13be357-93739a0a4e7mr100176985a.41.1787262123167;
        Thu, 20 Aug 2026 14:42:03 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9bb47b3sm293655e9.3.2026.08.20.14.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:02 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 05/21] iommu: Document MSI mapping during domain replacement
Date: Thu, 20 Aug 2026 23:41:34 +0200
Message-ID: <20260820214150.545737-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX4vIKOY3GmU+u
 4YVN1pNZDmQCJasW0w4gro2J1bXoMiv5eCd58Vs9Nd3MqR4nJaaDvZMkObJA9b2pDcCAGQScyoE
 2ARwpYpqtSgWFDSEY1FC8lqRLGiyWTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX4TvmupfTu/gC
 MkxT9AC0nOApGknzFS4oYI1cvBFsvtGuFHc6Lds4mlpccjk8tcEC8Mcj2uCcQolGzTJHV+s4fJL
 0xk4VocYeVeyBbTLDLitDSlmyWRCc4XpK0fWfjx/jxsZ+hsb8eTakpqV5PSF2ILbqYxX1Opj94v
 R9c6Asz1mrplo4DLcj0ILZpL/Yz6ZwMjysEy8RipSofOqiJx0TWFAEEoDCa+tPjoFtwbjQX3ZaR
 UFD+nDZGPDLbDQucGIdo0Hp4mYVwp1wc1F9A50i/QRJJpMkWt9+2BXIt8snE8cy7Sb1EUsms2LC
 W3/IV6x76u0k/j+Nuq5kh4QsTfR8ub56AgIXPTMZf2d8GnU5Tk36Q1ksFSPR7LaBVbk3nXegmgc
 UEq3A0aKwsK4RV+54Z7Mvrm9Kpq6ce30EVsINrx5wL7jIuuYFPLcIdM1RF6tNSmz/w9t0xDTRMM
 cwGkt2PHTkI/tIiIcZA==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a8774ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dE3YUn1xrUNcRiCJ4h8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: MK9MHTierOW7YnXaH2V-H5GOS3oVt8ZB
X-Proofpoint-ORIG-GUID: MK9MHTierOW7YnXaH2V-H5GOS3oVt8ZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144205_440721_EBA31BA3 
X-CRM114-Status: GOOD (  21.13  )
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

Interrupt-remapping drivers may need to prepare software MSI mappings
for an incoming domain from their attach_dev() callback. At that point
the device is not yet attached to the supplied domain and, for an
iommufd replacement, the current attach handle still describes the old
domain.

Document that iommu_dma_map_msi() supports this use. Clarify the DMA
backend only requires a compatible device and that the iommufd backend
intentionally combines context from the current handle with the
explicitly supplied destination HWPT.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c      | 7 ++++---
 drivers/iommu/iommu.c          | 5 +++++
 drivers/iommu/iommufd/driver.c | 8 +++++---
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 39ee5f0b1da9..030948a7e6b9 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2252,9 +2252,10 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
  * mapping granule. Used for pre-mapping MSI targets before any MSI
  * descriptor has been set.
  *
- * The caller must pass a device attached to @domain and hold @dev's IOMMU
- * group mutex. If @required_size is non-zero then it must exactly match the
- * domain's MSI mapping granule. @msi_iova and @msi_shift must be non-NULL.
+ * The caller must pass a device compatible with @domain and hold @dev's IOMMU
+ * group mutex. @domain may be the incoming domain of an attach_dev() callback.
+ * If @required_size is non-zero then it must exactly match the domain's MSI
+ * mapping granule. @msi_iova and @msi_shift must be non-NULL.
  */
 int iommu_dma_sw_map_msi(struct iommu_domain *domain,
 			 struct device *dev, phys_addr_t msi_addr,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 84b60d0f8c23..389d67c4bda3 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -4272,6 +4272,11 @@ EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_done);
  * stop the domain from changing between iterations, leaving the table
  * inconsistent. The caller locks once around the whole loop instead.
  *
+ * @domain may be the incoming domain of an attach_dev() callback. In that
+ * case, @dev need not be attached to @domain yet, but it must be compatible
+ * with @domain and the caller must keep the current group attachment stable
+ * until the callback completes.
+ *
  * Return: 0 on success or negative error code if the mapping failed.
  */
 int iommu_dma_map_msi(struct iommu_domain *domain,
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index b39796bc7251..358cc6d87941 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -281,9 +281,11 @@ int iommufd_sw_map_msi(struct iommu_domain *domain, struct device *dev,
 		return -EOPNOTSUPP;
 
 	/*
-	 * It is safe to call iommu_attach_handle_get() here because the iommu
-	 * core code invokes this under the group mutex which also prevents any
-	 * change of the attach handle for the duration of this function.
+	 * During a domain replacement this returns the current handle, not the
+	 * handle for @domain. That is intentional: the current handle supplies
+	 * the stable iommufd context and group MSI window, while @domain selects
+	 * the HWPT where the mapping is installed. The group mutex prevents the
+	 * current handle from changing for the duration of this function.
 	 */
 	iommu_group_mutex_assert(dev);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
