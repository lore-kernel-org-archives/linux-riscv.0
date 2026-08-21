Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379DFC5DF7D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 11:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GgQyv9IFBL2akjlwS8tI+yjZG04oqbe6YApcsntCfsE=; b=XmF4XifvlC1+DX
	3cZEI8jmRuQ7MknnFpgCZKQpFSAcWN7yWDMVEcmCGme+EWhizy4oil76a0RtEVwgrsvd9B5v7KxCF
	CP0q54KebyCaEWF/4ozD5uKTAPHWF+jNZMeHlsBpn/1hINNNOk5/8FgBOHI6WOBqVvr7WqMpuMay1
	z4J7spuUz8AdC+7yWOqAno08JJcfQPw3N3GEYK0ci5XdaX2ygCECEWr5XCLMTgvgmJGg3ghHU3f/D
	MAXeJryGqDlCJeTzpxLtdHlKNa7siFQ5+XTX3ESIGSIhjffpDd8GI+nEvY9p2It3lg/zyE3EfG9TH
	0mNokPRaGZ4jBiKpbRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNJ7-0000000DAoz-3bYw;
	Fri, 21 Aug 2026 11:21:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNJ4-0000000DAoP-1XJC
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 11:21:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lhfx1983003
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5l6M9iiZG4HxQZx3hP6MptgfUIGjm2MZVOi
	Lw3ukGRs=; b=Ko5RYagcamr0fiRE24YDV9mACZ4Zdm2AG4zoj9AN9YsXNprSvts
	oqgVhhtXi9wpZop2/8RFRv4/mgH/He2KbRrvwa8ivXaO/6gWhcb024qveT2GsBTz
	ilRgPKGinggBaqRB22VIOHdAmUAIw1E2QHOPobFBT6OmKDYRxxNgMBD805B/d7FL
	F0eCjgFL9V8z6Ds+3iFd1cJvCKHVslII4SgSWe78cbAhgp/pGTI1PWENJ7iEoHXO
	M06JqjSeMQdcA1xwE7dZqInbbl9j84MmoCJCmogLPN4Ktg9aC2avRI47MfDJbGSa
	DN16eCnLRazRtRFLpf+sDfxURIOHCkQ9NVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsj1ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:21:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso74051085a.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787311263; x=1787916063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5l6M9iiZG4HxQZx3hP6MptgfUIGjm2MZVOiLw3ukGRs=;
        b=gAy8oMcE/Z9iE55P1Gl2Yc5hOc7iqB5xauZszN1ZLA0OlwR7KeyKs51hO+YFVbNnUA
         Oo06xTtaUYc06z42q0Ua//MpUvqUaR4FUJSArsVKj9FZ9bTRskof77a29qMNjijDql73
         Zfi1Uphw5pk+mwHnfUCRDDeX22OR+COzcezIUb9c0qErq/VAwhroRlyuSr20w9eGW04L
         qR7sJygyERcyVbRfNsLzWpLyqRJD87Lihn2t9TBLLVBUOFFhvaSTv4L4yBuekYtCBGlF
         by6gawpene599ULZ2pkrtgECo17Min6u84+iGDnmZswgjVRxEregx8J/RZD9+TbOCGBL
         oJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311263; x=1787916063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5l6M9iiZG4HxQZx3hP6MptgfUIGjm2MZVOiLw3ukGRs=;
        b=Ihp96lFyyLSt1jcNnMFmAPb494KyGLpEPmnTSWkKe5fqh3UCk36jMgPXl7omS1pWmn
         k0HajcsrjaMYd+HVpdVNI7nQNXO3Htoc3FTM7EvDRRjzHSVGq645JE3FygLf+DRhjvdG
         OLpdnlPVU5LThXMXrV0yDpKvxVaJkvXd0HbE4sYuM2XZvnKXDGRyAtFbKP/YZQq2vq7q
         ZnVlOiAkTWEIOBdfOqmUCzSEypwpIiSKtrD24CPUWn6xi1gOYgkPWNmXDqGWxsENTDEo
         iwyjOUV5YEangqyoovh6jMzRHog8AyamXmOrf+5BEE5Jdw0lPUKfPV2U2OpcFnaOBCHv
         D7Sg==
X-Forwarded-Encrypted: i=1; AHgh+Rrj2WC0PQRZQv48z9xGZePu/XjPQ2V/EkuPxNHKS1wa6i7w+SGi7/jUo33PFc4tIrZBn2TPwdspk65ihg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cRufy+qXoMJQyQ3pxuvxtmg9fWhm0n8zlSEEqQFTCz+KzTyD
	hIgy4ouenZ+hcY0npKtEm8TLxsO4GqIRNcHGXb6j3NVu+0n7Od5yWv7cKc0LRG8z1oyhAboAdhW
	1mK9Gu0xhu3KT90NoKqLVIyb9VZ81XX4iwa8B0+xH2l1oNcsKfXVWgcteLdv0XNNtjtphFmA=
X-Gm-Gg: AR+sD11ui2Xf/a4nNfDg0fW312dOhDuwhF9sUfyjaM6/CwsnfraLUxr54/Gb826/0ci
	T4b1BpMMrB3PqRpHkZ5TVf8hjldYUEZYDov/dZhgH1R9EUxGLSRAqiLJXn+gJXVAhgsQA08cOz8
	YKRY6vpHWCVywcUJdm53IJ/Y8XvGvQlVnHGp4z6TUedZccyePRF8a58XrXnfvDV1O9XBUHCf67g
	8roLBWCtvScZj4zWkyohESq9dMpZAdRyJdQiqJ25hkt5ckPwd7eEpWKvcPHDa3tkBZBeGrFJrF5
	lZOTYO6qUYzYmUM6f/v7nPAKnm2I9hv4nIQsmOvj9pKkhJGxC9LLw/2qwvlcTuL+9e64Tj0+3Mf
	614F+WbYN3/0Ur3xJXs6jbg5xUspk7i9eHcc=
X-Received: by 2002:a05:620a:2b8e:b0:92e:f372:7b5b with SMTP id af79cd13be357-9373942f05bmr482726685a.10.1787311262836;
        Fri, 21 Aug 2026 04:21:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8e:b0:92e:f372:7b5b with SMTP id af79cd13be357-9373942f05bmr482721685a.10.1787311262450;
        Fri, 21 Aug 2026 04:21:02 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b81602sm15837745e9.3.2026.08.21.04.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:21:01 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com, tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com
Subject: [PATCH] iommu/riscv: Report cache coherency capability
Date: Fri, 21 Aug 2026 13:21:00 +0200
Message-ID: <20260821112100.572037-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: j6MzHZHu3LO4aZvRInHfuznLno2vYM51
X-Proofpoint-GUID: j6MzHZHu3LO4aZvRInHfuznLno2vYM51
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4NSBTYWx0ZWRfX6QBkzIvjqgHf
 zLZcRMHF7SHmYIL5L13ZUv9XlaiEsZGNB6ccf78irYHf5j2s0cxp0s9EIANxupJ7+mbYUC7xiIc
 0H3S9IbV3q+5KN2X0hR23UueRoCX8NM=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a88349f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ITBYzW_wA1tX7bdzKc4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4NSBTYWx0ZWRfX5jK8D+ZUnIe6
 eG5uc7hzW/myEyJoDGOtNPjsvbH4D3M1flt1gqZW3C4qfhJ/gdhNr2KiiH06z9KaBlu3ZPV4rIb
 0fDJgdzu21mn+v8GVEGYoKQJd5jw0/GPPUFwJ8X+YrDiCnS1LcxzRqKRCZoGlEmH26CtiW8ppId
 HHGsXUU+6C6dfyHI/JGGsdZGtgMeer9JJBp9vOn2+PfyTf4ed5bRigGxi28w5j4JcKD9C5YqPb5
 tEB1ltpeOOlpv3/ZvOgGQxRTcnju7ZsPO9r+ipMYaXBQonWpxwBni5ftIJ81wey2p+7tZjnFad1
 x+qgUaDgd7RpgzNdFBW22E97D7X/oZcez/vTCyxXu9kFmJI+Tc22CpxTYgA9maHl/TZEFUbybHm
 3TkOhYxiDOcncl/YHjhtJSYwCwXzd+ASibI/ztMyiwHHv+uqBQNe6pT9RDgFsZJvI0z1grT6p9c
 U+2DHP7Bm1wwwxe9OTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_042106_677740_F7149425 
X-CRM114-Status: GOOD (  12.84  )
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

VFIO and iommufd require IOMMU_CAP_CACHE_COHERENCY because they use
IOMMU_CACHE mappings and have no userspace cache-maintenance path.

RISC-V page tables preserve physical memory attributes for IOMMU_CACHE
mappings. Svpbmt marks mappings without IOMMU_CACHE as non-cacheable,
but preserving physical attributes cannot make a noncoherent device
path coherent.

Report the capability only for devices marked DMA coherent. This limits
userspace assignment to paths that can honor cacheable mappings.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 22cccc69bd2c..161093b1d9c5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -16,6 +16,7 @@
 #include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
+#include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
@@ -1429,6 +1430,16 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return dev_is_dma_coherent(dev);
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1520,6 +1531,7 @@ static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *h
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
