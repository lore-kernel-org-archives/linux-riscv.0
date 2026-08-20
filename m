Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549FBC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWE1sLIIKaoFznCGhskp9e4F+W+JpdN7VKe2Z+koy2E=; b=q+5CvnkakhQL0S
	2t4UgoGyr8GNU8GyOVN4UrCe/hfznSDge0ZACWXCLxrXi6pg3ZoNJ8kiwd3nhK02VSlGLnkRbKpc7
	IeCLFiwiudcyCE2Byqtojpd5rvE+tfKBhExjwHobnTy/bXIlc6cyI65vQ7gycdsTXQ/JRGCauQbXJ
	65ziHZk0pSDX7fvZ9N3LBgkRfsPvek1qFfkfL/bjWVrupVPIjZtwVI6flxlZ0j1Xpjrr/6KECKD9y
	zm6ryZ+NgdiYuDccEwvOJBOEqo1KdSySF/AtV3wlpgesSlDizdUjLq872KjRGURPSKisbWr5G/hYi
	PvuSV5/1yIqeXyjyZALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWj-0000000CDrv-0LQ8;
	Thu, 20 Aug 2026 21:42:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWc-0000000CDin-2n9x
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7jw8158459
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P/zqvE9ElCl
	TLoXgDLGZyTryGyE4Ywyz/R9X/x/PjNY=; b=bWjBBWRrIGVwvDsvZhUcx5jRwNN
	06jN7SGtaH8qjX1rwmqRLU6+A/EAunLMkylupjENk44H/LsTtWq3h+SWO4CBW6v5
	UUmmcryQk1sXSW3l/KgJ7GeOlrwFVzqYkTELAl7HKlxVSywXEspoPk48ubSRyHEx
	cSnE4GnNK35nXeY1L7kLUUhmJr8RUy3iGnL9nNbDkmNg3UM9O+PtLlNdf4uQpWrZ
	C51aB7une3p787gJeOogdurCaVml9YHlq8LGhUpd1qcuu6UQ0y+o6qq8jBODgol1
	CwZf/pnGxqm0l3e4PFvtzbknPXnqDXG8cqPqsgpuSF6LVZiCtzLwSFL/a/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk3879-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9368f2b7b2bso34282485a.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262133; x=1787866933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/zqvE9ElClTLoXgDLGZyTryGyE4Ywyz/R9X/x/PjNY=;
        b=YPOJu0sZpFl+3KlFufY4VLUGgrxGsZwGgK25gJCBgfW7ciL+pJN8SIgaCwCF5Trkeb
         uQq3RZfyNf0lI7bbTHlQtixlBpJSnapsLu4fLcZpWmMlJIrplHYgogCWmZr0dqD7ZqJs
         2aslqGj1M2nafwHAcSFCsSc5Sl3We3PMVsRyjb3Nh6LD4dloDoRNbsqZBPgCV2byekjO
         iz37pxPYsVWSgm1+EZzbr6r5Su4fjIEVDr2+sg3pe4UKkN8VvoRWCNIG5GGg3gj7t3Bw
         pOwt9tD4td+3Jxlvw0QjOPTWkJ/8ECGebBOvichjQ1ny8pVWvZWLfqpbqhImxabJHmM3
         Lntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262133; x=1787866933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/zqvE9ElClTLoXgDLGZyTryGyE4Ywyz/R9X/x/PjNY=;
        b=Wg8+Wfdc5n7pSKH1/qXKEmA3jTN2CLqBL+dxy74asgoHb8nZJaA3kQV+wtipphyAPq
         4q4v7D4P7fav58dGyP1gde/L2IsDKWflVcHn83MDwQ0Hal6oLagJObjDkQEUyt/hV+Se
         jN+W47f/z38nA3g2GI5RH8qqxQtrFE9x46HQZgnugqxIS6FUyO0PpleB+jq7wWVD4FQR
         WbKAHLdmo7rCV9/srx9jgvowUk/pcnsGprJ2hshETP8umZNBFD+vjp1vBa+CtwuEg43a
         s5nq5JyDP0NX9g9m1L9DOZnZoexyNd7HifxQxQOMBjGppiqcA5kIpCeMyp/ZkO2k3LQS
         DNOw==
X-Gm-Message-State: AOJu0YzbjOkwwyBfXnw+7MoRfJSfpdYV2fR3YgW9pEa7SjxmkeqTtEqB
	QOy/HVS7P/NkEBmW1V2ojbDcA17gXiiiCsXh5DrV1sFBfoP+5g5WJutjOCYre6byhpPUl2Tcwsa
	mCyZviTT5/l6DwTZ5MtDSDeynDp9vjxhMP5liT7BqYO9Nlo8fi9rTsHrcl9vLTjT37my/4CNwNq
	J9D7U=
X-Gm-Gg: AR+sD11cocuQIks7Egws4Hv6cKxue8KSCTDZvQvil5NlAKxSLwG/t2/DnuVWFvEzE2q
	HQ0bLAffMVMWJ38ARhHMPSQYz3L00klbfc5NEewgAPqzykntnWNsLi7jW3yZIjMoE5g2ViQxZJg
	vOLSSb6wRvWTVHlperfaG9UR+2Bcp3vK/VgCOowddkJIAcWQ5LxreRz1gl0MIWoLinqjuVoze9/
	DM1od8j7X6gU3yYItyu17bvWVoy26IZfHdUWjYsDwehxrTJXpo/jNB5lmz0LygGiIkekzgShX5Q
	NnOfqDFV0ch18CEJn1vRnCvaemr4FIu0sJswtHDod2zkMyQpKKFkEuO8ZCUoLlF0lj90Gq3Hj6s
	MV6IMpKfe
X-Received: by 2002:a05:620a:472a:b0:936:cd1a:41c5 with SMTP id af79cd13be357-937392b190dmr138762285a.0.1787262133002;
        Thu, 20 Aug 2026 14:42:13 -0700 (PDT)
X-Received: by 2002:a05:620a:472a:b0:936:cd1a:41c5 with SMTP id af79cd13be357-937392b190dmr138756985a.0.1787262132540;
        Thu, 20 Aug 2026 14:42:12 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c338dsm12494474f8f.25.2026.08.20.14.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:11 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 10/21] iommu/riscv: Prepare info->domain for concurrent RCU read access
Date: Thu, 20 Aug 2026 23:41:39 +0200
Message-ID: <20260820214150.545737-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: AcheWwS6nzR4CNyYf0Vq0DweyeTePIIh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX50tVoQ2Xka2O
 OHD/tsasYcTiLang5iZlK4lkE3f4cX60eABBCRTeeQWiS0N359qZHGN8wMQayzKs6p0KQ3RXnvl
 PrRQt6NxYeYNO3Kht895F3f9HgsDGsU=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a8774b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VmW0014DqEszS8sibs8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX28tEnpRaivrR
 dI1+GQe9ipEZxHejfEfdfv5EByOJCBDYAUCfSQmxdLwBoC0DE3UR0oeKE6v29dsRgws+NkVsq3k
 F4/QNDaQ25S7/KwHUSDvxpNmqmkmaMFZDwZ4v9EmiYPRIWOhEkvRxH7HDvpwtR/BZmtX7Q+Z4RX
 nJFmg+KWGmdA+qJte65PgQiBBVltT0DmgdnFcOQYy/V3gxzNz3cpN3M91uGBKHo0NlnECvspBZ1
 OQHNvPFZ4d5t2Xklgudk4Ll35BI/xFgs/h5AbTu3kn7G6ihLzbGWwobSXS6z5vhgRMguolW2+Eg
 Uc4bEFTAoDb6iIdmk+rdBQt7pCOomIShdQExjnIUaDe0N2cihOvpST/mGZo4UTRplv6K4TacsTF
 TslRzOBV8R3sh4GPmp6uP4NeDFp75Hav5Gmey54zVIDyeLqriu2Wkjm6RxjIR5M2IIEnwiibxWP
 lUMho7qGXzIx+aXgobg==
X-Proofpoint-ORIG-GUID: AcheWwS6nzR4CNyYf0Vq0DweyeTePIIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144214_820471_1E7C8853 
X-CRM114-Status: GOOD (  16.79  )
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

An upcoming compose_msi_msg() implementation reads info->domain from
potentially atomic context, concurrent with domain switches. Apply
RCU in preparation.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 26 ++++++++++++++++----------
 drivers/iommu/riscv/iommu.h |  3 ++-
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index bfe606a0cb9a..4e14c8412abc 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -865,17 +865,21 @@ static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
 	return 0;
 }
 
-static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
+static void riscv_iommu_bond_unlink(struct iommu_domain *iommu_domain,
 				    struct device *dev)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_device *iommu;
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
 	int count = 0;
 
-	if (!domain)
+	if (!iommu_domain || !(iommu_domain->type & __IOMMU_DOMAIN_PAGING))
 		return;
 
+	domain = iommu_domain_to_riscv(iommu_domain);
+	iommu = dev_to_iommu(dev);
+
 	spin_lock(&domain->lock);
 	list_for_each_entry(bond, &domain->bonds, list) {
 		if (found && count)
@@ -1241,6 +1245,8 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
+	synchronize_rcu();
+
 	riscv_iommu_ir_free_paging_domain(iommu_domain);
 
 	if ((int)domain->pscid > 0)
@@ -1291,13 +1297,13 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 
 	ret = riscv_iommu_ir_attach_paging_domain(iommu_domain, dev, old);
 	if (ret) {
-		riscv_iommu_bond_unlink(domain, dev);
+		riscv_iommu_bond_unlink(iommu_domain, dev);
 		return ret;
 	}
 
 	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = domain;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, domain);
 
 	return 0;
 }
@@ -1373,8 +1379,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
 	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 
 	return 0;
 }
@@ -1394,8 +1400,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 
 	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 
 	return 0;
 }
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 5d83537911b6..ded18aec8010 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 #include <linux/iopoll.h>
 #include <linux/irqdomain.h>
+#include <linux/rcupdate.h>
 #include <linux/generic_pt/iommu.h>
 
 #include "iommu-bits.h"
@@ -33,7 +34,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_domain __rcu *domain;
 	struct irq_domain *irqdomain;
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
