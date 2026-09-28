Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF8ACA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tPtAz0OIHl4kO505r+Is8eEsHLDOF6sLLZWmUcVdc0=; b=xA5qwUTdBdmG9Y
	LnTLpq4XCFe+b8FFmFcaZmHi8z1TyGf0XV+XWngtXBgnPKh+JnVN+MJ38cIY7Tolk9FFcTWbxpBEM
	/NnzjeLGDjq0EPfhjcmjATLoUEFnNfRcXOTciUI2CK5FN70ZLU0/BVPH/HfiaOQ19T+Sa+GMJjj7r
	JL8UcCKMyKfO3u3iemwivXLag9rcJzwOaQ5gXj6EzOn1Vd07DER9MuMwVGkiT0fjBwoyGOjkFh4+H
	5HbNfTKKC1Yac0Y9Q6RnQd5LQ2xg+82n/LBssAC9xbfEJZpPz87Sj0Tu04kA1djqA2u6hr6ANA3ZH
	owbLMhkV93OTiUP5Qb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOz-00000000leI-0L4m;
	Mon, 28 Sep 2026 14:32:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOx-00000000lbu-05K1
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fXARlnUet2MhiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=; b=KoZVegIursrP2hUk6SV68Ao/eF
	HBT3o16yAvlldlgSkzL18jBfiBAqI87Xo9J+OHRLCjsEIuxb2T51xzQUojFxWWHS0AGhcB/sYRt8o
	jM/kBcuv3ytYmwSQYoxB6KV4uiK3Te0iHRLY1hWlx+VCIXNMnB4CxYC/QD2W3p8I/FFoTszcXe44e
	Vr8rhpYEI8amq9Zpq8GqcUrw5Pa0y01zP65gJjY8E0yMIfcs+kbEmaURk/QJBdlgtqNWaplnL+wnS
	EFENlp5k1uNqBsaXBRGGiwh/6CxCw3e4e/ypgZ179xbXLsfbQwxo4oevlqWFiwudxV4mqT2y/5KD4
	dk5j8gCw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCOt-00000001ZRJ-2DlM
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAHbw1189565
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXARlnUet2M
	hiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=; b=OcNy+T6zPRquLP+sx+2pJIVxXAu
	iloExvb24ljR/wERPOc2mqHIz8LSh5TFaOYiAlCBRGWVoAaReKzYUuLKPqEPsSW4
	ZyZZydUCHV/sThrv65cyzoDz//rcoNJINKKxojBoV5TFr+dm/tRHMSPzHKG0cQ8C
	G04wUuB1B3LrYnQGfBxSPJu3G0/uvud5AvS6Q4NLb1sSnnAAjTo5papmWFi7DdT+
	NYxsHuasNvhtRzvWK6hXol4U6jvifKztKU7pLBjO+B0UdDnLCY8q2FKEglAE3gWL
	qjJWYZbmZ7U1pvXCjii1oCyJRcMlmvA+iln5gnyj2UMljM0Nvw+nHqfn3rQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc15ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b36b0a8ab0so201602137.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605931; x=1791210731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXARlnUet2MhiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=;
        b=hM/Pq6bVNEzIjBJk97xBCRWT+OxYSgwRmYiKKMTyxp7faaZpmEywbe7OFyaXD8eTK8
         GkKBJsN/BsPN5h43lHp+eZhTZ0JIBUENkSOMACwEVWHHLhRPs6PQAZaLnhhroE0Oj6h1
         SepYqoKL0CG1nre4ILZBUeEYX9VzYy4nYUPfEHkReIJ+2NCcNV6k5/RZOmbtBvI9M3Q9
         UC5bikA0Hdl55RHpP+rCkNe8tpZro/jBYfM1tiOxasjQkT6gcvoGWgP+9j6D3jNWoilj
         2u05PRiGxyFI/YhaopJOGoAx4yQtHZWggcGmwOg/QFsl4aCa1xz+/LPwFqEnJkV/kky0
         6NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605931; x=1791210731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXARlnUet2MhiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=;
        b=LPtU/OHrdt+J79aH9HZIzyHORbu17pQgC4Yws0RLSsD05xLr58PwHxtvzmaLH8tdbt
         zMtPqon5Hw3rDBVGJUPDxAuxIMd03FpHZ0Kg7cYTaFAXDry6ssiQOxaZ16sjYKSsqZzK
         qqgxJ6DWRj1BUlFOwvrMvL2ltAHyzxLT5LpxQ0eN+DGe7KnEYgNpTvJOGOxzaCQb5KIx
         YFv4q9uJKEAk18mxFdmxjl7L5cDLctUEuPKSiizuuKT/8M+o7Wu84eVw2ktb4fgi5/F8
         42/00O955Fe4Y78fhRh4BIjX6ZqAYZ+GGZm1mTgbWGsiK5r7kVtVe9l0p+NVKPCEaPPr
         fqEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOMLKwRuehmoEY59LedYo6PcVKlkxSOtxR1LB+4L30bd6gXPleJnoadAN8xdNHA+LXwVfNlJeSzMMRJQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJiKdmgiKEb7pO8RC5O+3OzBf+FWHUTFVAp7EmuLvIYM6iRV/No
	Ow0akatToblqvBSsCNUkk5BzgeRI0m4EwemtDkqQEjsadrR3fygYhjAW7kSwdk1FzNpG7oVcLhU
	HcuYtnLE0THF8JsPI3vj8n3B+tJAGyHcDm+CmXT+/9TepbISFFBUgsOfMM8ae/a1vZgPinPU=
X-Gm-Gg: AYBFou0pUadC04BOhmv3hZLIGAgUbHZERTGA7szeKe8uTE8/ls9Qfkwig9Wc97VnUCX
	xoI+/j+48soet7rN1jWEZJ2drW9B7ZHpr9sUgzDJqtaIrtnGqBWHaTeMoOUApDGrJjySKBNhY8K
	5vTxc5LOR9zCLIYw8mmqtVsM2XpnEh2qakG5yIQhwIxlWPSbc6eGI1DYzhmTWJG60JAXZyeP41l
	k5eFqA6l+EAlWgkQCoba14dRgHppukTJZQsqJODThAAVzthqfVCLCCx3TILYhFGMs6CHTbBzt2c
	OGdclS9kW/MKUIzFAHSh9OLJo4fkuPwppa0IJfDojktWomfj6+AwvwRThr3muhi5zRQdPyg5Kve
	EzOcQtvO5eCIfLLWOJEFLR0wSYqwH5fYlF0Bamg==
X-Received: by 2002:a05:6102:3750:b0:79f:eeb7:d643 with SMTP id ada2fe7eead31-7b1c50409d9mr2497065137.10.1790605930266;
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3750:b0:79f:eeb7:d643 with SMTP id ada2fe7eead31-7b1c50409d9mr2497042137.10.1790605929656;
        Mon, 28 Sep 2026 07:32:09 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd110c3esm296984266b.63.2026.09.28.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:08 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 07/14] iommu/riscv: Prepare MSI table updates for interrupt remapping
Date: Mon, 28 Sep 2026 16:31:06 +0200
Message-ID: <20260928143113.49838-8-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba7a6b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=tpFWYQdyHN71iLxetsoA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ImmouwRNRpULx9T_PBrijXiZJsHDvUqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX61T5tGBtSPVE
 5niL1iaPG6JedPzSG5f7hxSImXaHFs3sFNt4lCYX+FeBHZx0+PoHa/6pbWx7eBJZRF8xiwd4jEj
 GOkUongXHhBYOSosFGUoNhfu2sGwB4Ii0wNdGRroMa1FpWIP9+V28FnJvhd9AoThVQGjB2WG8JG
 f8iyO1oHcv4K36NWHHpcZyNZ6qGIkd32F9I+kyMF/PCBRnr6sQ6TZRYBqORZxXKYTvHarl5LLT3
 bR6Uq7OKc1mdm+DVlGy6+CeYt1P+YLu6Q+vYk2dTRFhVHqr472RrVFyZ2TyqodsDG4g1/uG6RXF
 98Whcp02cP0DvKsXoPAA5sKApzo4l95HuDAwOB/ktYcp/56uLyePn+Jalm1Lv9u2J4YpxAcCmLX
 IBZwlrZCn0q8/67CfNc9bXRgGWkR64oIlngbdWD990EnC57uPds02SxJV8gvog4riDocr48FZoO
 onmeSdmt61dz0UY37DQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX5TVhEOYxREsb
 PGIbLlNbAlS5Ud8kbKNQtWL/HvFXkFsJYn6CO9RgLYONmc2Z5Vh4sul1FZoyt7/zxJPCaIb8Sf8
 dxoel4zyhJn8wXEqoMlhVIDbWk66a0s=
X-Proofpoint-ORIG-GUID: ImmouwRNRpULx9T_PBrijXiZJsHDvUqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153215_881655_925967A4 
X-CRM114-Status: GOOD (  21.51  )
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

Guest interrupt-file mappings require interrupt-remapping code to
install or remove the MSI page-table pointer and address extraction
fields in every device context attached to a domain. Devices joining an
active MSI domain also need their device contexts initialized, so check
for an active MSI domain at attach time.

Add helpers to publish those fields to bonded devices and to invalidate
one or all MSI PTE translations. These helpers will be used by the IRQ
bypass implementation.

The per-device nr_forwarded_irqs counter is insufficient to detect
active MSI tables for the domain, so we introduce another counter which
is domain-wide. Like info->nr_forwarded_irqs, later patches which
introduce interrupt remapping support will manage the newly introduced
nr_forwarded_irqs counter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  5 +++
 2 files changed, 70 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 86d5795a12dd..db4539fbcb95 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1189,6 +1189,28 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 	rcu_read_unlock();
 }
 
+void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr)
+{
+	struct iommu_iotlb_gather gather = {
+		.start = addr,
+		.end = addr + SZ_4K - 1,
+		.pt.leaf_levels_bitmap = 1,
+	};
+	struct riscv_iommu_domain *domain;
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	riscv_iommu_iotlb_inval(domain, &gather);
+}
+
+void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
+{
+	struct iommu_iotlb_gather gather = { 0 };
+	struct riscv_iommu_domain *domain;
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	riscv_iommu_iotlb_inval(domain, &gather);
+}
+
 #define RISCV_IOMMU_FSC_BARE 0
 /*
  * This function sends IOTINVAL commands as required by the RISC-V
@@ -1311,6 +1333,11 @@ static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
 		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
 		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT) {
+			WRITE_ONCE(dc->msiptp, new_dc->msiptp);
+			WRITE_ONCE(dc->msi_addr_mask, new_dc->msi_addr_mask);
+			WRITE_ONCE(dc->msi_addr_pattern, new_dc->msi_addr_pattern);
+		}
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1329,6 +1356,40 @@ static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *
 	riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
 }
 
+static void riscv_iommu_msi_table_set_dc(struct riscv_iommu_msi_table *msi_table,
+					 struct riscv_iommu_dc *dc, bool activate)
+{
+	if (activate) {
+		dc->msiptp = virt_to_pfn(msi_table->root) |
+			     FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
+					RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
+		dc->msi_addr_mask = msi_table->msi_addr_mask;
+		dc->msi_addr_pattern = msi_table->msi_addr_pattern;
+	} else {
+		dc->msiptp = 0;
+		dc->msi_addr_mask = 0;
+		dc->msi_addr_pattern = 0;
+	}
+}
+
+void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate)
+{
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_bond *bond;
+
+	/* The MSI table lock excludes bond updates for this domain. */
+	lockdep_assert_held(&msi_table->lock);
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+
+	list_for_each_entry(bond, &domain->bonds, list) {
+		struct riscv_iommu_info *info = dev_iommu_priv_get(bond->dev);
+
+		riscv_iommu_msi_table_set_dc(msi_table, &info->dc, activate);
+		riscv_iommu_iodir_update(bond->dev, &info->dc);
+	}
+}
+
 /*
  * IOVA page translation tree management.
  */
@@ -1514,6 +1575,10 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		kfree(bond);
 		return -EBUSY;
 	}
+
+	if (domain->msi_table.nr_forwarded_irqs)
+		riscv_iommu_msi_table_set_dc(&domain->msi_table, &dc, true);
+
 	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(dev, &info->dc);
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 2876703a6698..deb57b6a6c4b 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -71,6 +71,7 @@ struct riscv_iommu_device {
 struct riscv_iommu_msi_table {
 	/* Protects attachment, interrupt forwarding state, and MSI PTE updates. */
 	raw_spinlock_t lock;
+	unsigned int nr_forwarded_irqs;
 	unsigned int nr_ptes;
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
@@ -81,6 +82,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
+void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
+void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
+
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
