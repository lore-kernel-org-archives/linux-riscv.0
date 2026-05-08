Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A9CD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 21:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbTMzOChaZW0MyFZIW8BeG4VWcI9+b9mAppAw8nkSiM=; b=j2kw+Vb0nyyw+b
	qXBLUNSjmzQRCKWxJ3cHlJm8lJyP+PE60vgEkqYh2zWqADOVAl+nsO1HYSMD6nbh+YwY1Nt763Em1
	RGUrUWIDM0lBXq1Kq6XHedNiPl92Jo0B0LjyJReit0MpqbQMmhVsTKiAsMRR1lkvToweKpG+2KTOH
	EnCTUPV5MRXRaMJ610no991XaZerhfz6jTz/tMGgJG/pJCKKStzJaDb/IhP3JUIdZH4i+kN+Vis6l
	H/1+EgNlquQUvNLhUf0Pbt4z/Eo3wsi2j8gfrtJFQV3hzbUgKiXMvgqmyRWmXgd8pCZDq0fzatPAi
	RdPBlRCKQ78YzkcOd3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSfj-00000007Xzh-29J3;
	Fri, 08 May 2026 21:23:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSfg-00000007XyH-3yxJ
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 21:23:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G3BSD725210
	for <linux-riscv@lists.infradead.org>; Fri, 8 May 2026 21:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TSaG2TIUJEO
	ynWBne/qXacXwZRCzgp9U/qwVIoca2/M=; b=Z2G6dbVuPoycUh79bLNcRUEZcxa
	hZdGXo5RVcWWESNy5hnfIfvY6JS5p3lD4BGEwuL1gL5xO96GyTam4vfl0yXXGyhw
	lbipSE6MoCrQ0XJSxoiwu2xwrQXiC2vPG1h5qWVglQ4yMUa1QwYXqQ8d8r75qDyr
	7BQDH++Pi2xaZKufJyDrlxJYH3f+xW6Qo3dzaMEF529oVhDGNTap8vwbS1Bn2pip
	aNEJYnXxhpb1/qiMeOwNDR8pSbkEVxyLU2sGG68NHMoPe/2wwViFgLkawSQHaWtg
	SmJzFApee7kXgPqxnT+M9RRF1fSP/WNV6i1Nepf1viuOIAOZ4iVXY4NxXKw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0uh1db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 21:23:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12dc3d81736so2506917c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275423; x=1778880223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSaG2TIUJEOynWBne/qXacXwZRCzgp9U/qwVIoca2/M=;
        b=CTNvFwQh07nGFMc61G2+X/Wf7n/bXso6s7tr0WG+1ARD1pnbuph/JAmw6P8bvgBz+2
         fdWkHNqENN/qA2YDc87l5CyZBFq4rv5KDI56YFTu3BLgzU9Anv73ygea4Z360kuCXC+H
         ETDjJnniNYP0gFJXhAj8WNtH+NT/KkF/PrbmBU0Ism7N+Z66dOI68TD+mNm+Tm36elv0
         7+3cUvn/htqBwUl7z/ZtgXSfs4AMn64nFSDBqc5BESTnkKwiMiwsbX+fWOS5Z0TOWmFe
         HpfZwN4nLHVt3nDJUMekn3EjzKIah+FJADo+1df0/ol5lm1BvuTNs/hhnh4nllV925Hm
         WOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275423; x=1778880223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSaG2TIUJEOynWBne/qXacXwZRCzgp9U/qwVIoca2/M=;
        b=W9/XjbE2kpN03W6jqM5U3k2Wc2Fuo5MXecy+vRaoGYqKHoGMFIhGBw1fTjea6MAXu7
         jSJgF5FEOHBLVR5AWKnpu8lwAS9/88suNB/myhMY29P9J5vrcbZ+KhfBvXF0NfIUonK9
         Vyu1XBh8Ot4j+uDxz6WSbdt2UEnfFlflob1D1dhwNqwFPr6hOZrRpRTOL1B9xq/VSyS3
         nEYi+5IQAc2rBxSyDjyuQ/9kh5OnsN7Bp0FJ9CSMfEnryOgIf91KUAPNmfuRFHFpdPvM
         wRKdplhXm2o15RHaZuCdQNmp0iyESHNqFXNQnChzx5TvGy0zRVGJ4l3AyYR4KDM80zzV
         Y7uQ==
X-Gm-Message-State: AOJu0YxDXtObW2L/CsmKqIJnV8W9h1+mqo330I5z+ijSzeDePlm/i20h
	wwb6CEO0GW5hYw3znONxWVtzXoEK04XuBoegVUGQssQIgbKq2qk5GxYNC8y6OUU0LdxRWmKsqLX
	qEud+5Pv8fTfN9OmQvRgvzEHEBc+eg3hCXBx8ju6bgN0uLu5kgNiXQcGKW0KAb0WDlu5nAfoqba
	WLSkc=
X-Gm-Gg: AeBDiesrjQpZqUJ3P1J2t6Y6R1vm5wShMkKLcTBCAt8Co2RpDyDBrNkTsJ7onW4gj+I
	f76XotcHYtDA5lhPCFDij+Vq4D2PbaJiV4Z9Hi1qkkC9YP5PmB7djvoa5U4tMsx0NbgtZxCDLY8
	RGLF8RpNxyCPU/wE62onKPM+jWexXiJqO4+oyVTa1knI/7BNRMQFV+xkMcsdrHJttPFQJcPG4bO
	MS8hiZFIaOv+5rZrVcnj22l7ywaLAv9CXyphlbbPcAwpaRkEta65C1Oy4N4mNkAi9IqNhodzI5s
	BW2gyV4jHC8BvCoKTDIgFC59w2tLilFux7/zlYFHOnxGsuMcjs7+lA4no+QsYzY6IjZoenZwdoV
	zHAvaG976S1JilKgcPF6A5GEmjEKLdRg=
X-Received: by 2002:a05:7022:ead2:b0:128:ca83:5aa3 with SMTP id a92af1059eb24-131967d7ba7mr7777521c88.1.1778275422927;
        Fri, 08 May 2026 14:23:42 -0700 (PDT)
X-Received: by 2002:a05:7022:ead2:b0:128:ca83:5aa3 with SMTP id a92af1059eb24-131967d7ba7mr7777486c88.1.1778275422371;
        Fri, 08 May 2026 14:23:42 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865700asm3984668c88.9.2026.05.08.14.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:23:42 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tjeznach@rivosinc.com, joro@8bytes.org,
        will@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org
Subject: [PATCH 1/2] iommu/riscv: Map IMSIC addresses for paging domains
Date: Fri,  8 May 2026 16:23:38 -0500
Message-ID: <20260508212339.381933-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
References: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe545f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5LAesA1oWso2HGznwIcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: qazSPW9sBUx0tdFdm5Fvij3_Oij9I5f7
X-Proofpoint-GUID: qazSPW9sBUx0tdFdm5Fvij3_Oij9I5f7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMSBTYWx0ZWRfX9MDIE6WtXP3c
 KF7C1OWPKtBFiNKOQkMYzKNAEsjIr18dryQ4gtn2hKjSpLv5HXo3JX024o8u9KlVpvntIcGYfmH
 lIRJT42VIpmWfAbDgoUfegd20O0CK2IzMxWQulChmvgMiaV3RRdc3ztEQpYtGWE6xIprtSPaWI4
 Q1D87G3xKk06QKbk+GchpdHNsAnGOvDWlpBgbRqKzwnaeCTTYC44RVm2dNx0BCx562gXGzyunDD
 AsW0UnnSPYuo2IIRWUTeeUZZATQiosBUAgv6UaAEs7mYPIUHM1qRqVIyX5V0PWvUxY3MKIeIK9p
 H/5Iw6LdMgoS7OYrWrZMKNcMh2vgVL7S2Zs2nQhgGgpj9XXrVQ1TydQM2pvNUBF3BU+aKNk2c3V
 9vyraaQFzpAAGwe9qhZF20K8ao/5mWTAIuIMr1ZOYa/idq6+MZPyOd+9Qe2uBDxV8+Z3nzPFsJ8
 be994WoNcGP6uYkxNxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_142345_107439_5EBF4914 
X-CRM114-Status: GOOD (  16.44  )
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

When IOMMU_DMA is enabled, devices get paging domains and MSI writes
to IMSIC interrupt files must be handled correctly in the s-stage.
As the device always writes to the host physical IMSIC addresses,
which the IMSIC irqchip programs directly, install s-stage identity
mappings for the host IMSICs. But, use IOMMU_RESV_DIRECT_RELAXABLE
since the 1:1 mappings aren't required for device assignment.

Loop over the cpus rather than imsic groups to handle asymmetric
configurations.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c         | 34 +++++++++++++++++++++++++++++
 include/linux/irqchip/riscv-imsic.h |  7 ++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index a31f50bbad35..3c6aa9d69f95 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/generic_pt/iommu.h>
@@ -1286,6 +1287,38 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	return &domain->domain;
 }
 
+static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	const struct imsic_global_config *imsic_global;
+	unsigned int cpu;
+
+	if (!imsic_enabled())
+		return;
+
+	imsic_global = imsic_get_global_config();
+
+	for_each_possible_cpu(cpu) {
+		const struct imsic_local_config *local;
+		struct iommu_resv_region *reg;
+
+		local = per_cpu_ptr(imsic_global->local, cpu);
+		if (!local->msi_va)
+			continue;
+
+		/*
+		 * The device always writes to the host physical IMSIC address, so install
+		 * identity mappings directly. Use IOMMU_RESV_DIRECT_RELAXABLE instead of
+		 * IOMMU_RESV_DIRECT since these 1:1 mappings are not required for assigned
+		 * devices.
+		 */
+		reg = iommu_alloc_resv_region(local->msi_pa, IMSIC_MMIO_PAGE_SZ,
+					      IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
+					      IOMMU_RESV_DIRECT_RELAXABLE, GFP_KERNEL);
+		if (reg)
+			list_add_tail(&reg->list, head);
+	}
+}
+
 static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev,
 					      struct iommu_domain *old)
@@ -1401,6 +1434,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
 	.domain_alloc_paging = riscv_iommu_alloc_paging_domain,
+	.get_resv_regions = riscv_iommu_get_resv_regions,
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 4b348836de7a..ba3000f047b0 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -88,6 +88,13 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 
 #endif
 
+static inline bool imsic_enabled(void)
+{
+	const struct imsic_global_config *imsic_global = imsic_get_global_config();
+
+	return imsic_global && imsic_global->nr_ids;
+}
+
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_RISCV_IMSIC)
 int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
 struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
