Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27543C5AC80
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4LuCST6Gaq7NGBPyhqs5g1lHWnM5CVA4UohlKBW0gw=; b=QOcl++YAS8t3bT
	YekBmfMcuZ+5BbBPa9esWLORLsCFaEHi+ar5/U7bc5esKqmva9WYu/EF+gd3piR0xtrt4+ZNbvR+s
	c4T2VddKCDXJjqyVPJcH6kCVZi2Ke7JGGkFZ5rHKpBUEDw1ioLEzh5SALmweWhAbEMSI+kXqLq6+s
	m3YXOmGeP+u0WFd8jaHOHUUFU9vvnrCcFVQ4tTkrm0fCQu0YQVuxeiBwQeNbBWemssF1FS8ok3D6t
	qUvsVcszbirholgIVU9Ah2CLT1e98BEM27lp1dVbpTcNSJXkxhkFvIW29WTIonSSras9ZfoTD73Ud
	KrrCEuk2X/UwAgjASQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8g-00000008Zdw-3hNA;
	Fri, 07 Aug 2026 18:17:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8e-00000008ZXk-01XL
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GO6062660575
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CZ0/AJS5lrL
	G+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=H+7lVxovafJdb6/bh78wXlTxnO/
	hxXuE3v7qmmZrro8zMWpWWiuMhTOiW9VM1FZVgN5KUoUD0TpLbdIdJW+GL0HxQv2
	hjffmFWX78/JOKI41XRPBuPOnSxNBVlkl1MlDXlvugK+TMKHFNegWB8zYB4BUGAZ
	J4nT+WTr0hFh9rM2mYOAy5MKLYmHGSzcgIQ7Xf7tb8dKG0+MGTVK43uhbqQte2AI
	Z5dE+eMW7ZJyH6FAfd9dpQ+DQOm6Lh4UiQXFsGGUiARSOaca1twoaFKSh6+OhwcU
	fe0/iQlqvqivY5aHO3caKY7AOyWa4NIRBJ00RmaW76gCjfpFulKklqZHkhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwhpy8w2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494cce712so439823885a.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126666; x=1786731466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=UQhWO3hpSZoNf/6gX3Fjhd/X9t+LiLQGsbDyE9zbJ7AGLYXj0gwiu4vzPW40h5v6FG
         0pBb/y3JEJOxE1neNmRfLK1Ef9zgwdhYpmG7XVV6hYnVtJe6YPqDWYZOT84ncmI3aZ9m
         W8J0BoVzLot/24JyvsBFeAJPea722AIfTljy1aH5rPdAgfkHWUXV9c76sbIh6Lciu3Zi
         wAe/RttR51heGDgKFkXwGtqRzM4hLFFGeIN4/tnc7KjoEpHmOt4EpW8Zy18hYBoNwdOV
         WCe4+rQgt8BcmoJlJfetN5iD/Ras6oT3S+Ve7nO2x4CfHPf8vvuyp3dHxMgYoAqSvv29
         EEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126666; x=1786731466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=duR0NIzJw3CApPq840Ocv414RRdnJVbcCcvVA6pG0j+EAByzRdI2+ZRWEV4A3UQPpP
         cdlpOMf0aj4X8aUhmn4FtzDJfivsj+m520b6/F4gXDwnLH30CILWuRuZOX1HSQ8OwRki
         zk+iGvtvRG6kLdaFPs/uRPlXD/pf++EHfpha3eHIhe5WpSm292t53mskA/DMWmDqtLcL
         tHC/sYNXwmX+U338h/dcyrt4VE1akdGXphKf31nWKeoFAYSvFgrcbQY0chicW7KL/I/m
         01auqtDfPJgWhHTkruraWMzwgThPeJIUgkNuJ9Mvucp/8TVseAuo5chiJ8mXRtc1K1t/
         yUfg==
X-Gm-Message-State: AOJu0YzMlutIYQsWxti+ahoBCHX1IgiQeeX7k+QVbV6dpyhSIUuG5OBC
	Z/dhjSj3VBCZrvbrGiQzapkVSWMpizQL5ud8TOlHGNeXoMhUUOPOkMWUdytMGd3LvG42s0iSRll
	EHWDqBMrKw2cTAcVJuszUoGkasSQ7lwmk2OjTU3t/UoRv0gqIu8XWyNH1MIm4H+FpIeaUhV649f
	T/VtM=
X-Gm-Gg: AR+sD12qcR4OTfOpciLlzk8JMAsv/606klNE/9XFwYSC24euJfsnJuvn+2MQDqec97F
	2rq0nyiGFB7kggtBtJsohrWcLYr+0R8SbuqcNTFc9Mo+JAidVUEcPLNm5rHjOeDGuHDrrOQKa8r
	TP+A1CQ1/5k4367iLPeHDCoAGNMNeFb6H61h6VIkXyM6lyU4d/nsixhMJS7+avCBYFoQxnyiwtZ
	N/KMW6N53Vre4Zwnh6Yyh4UI1GNxotuVAfcBtQLvlD0/zo/df97MWtOOH30SmEVmMMt6KHudWNC
	5yl/04a8dgGmaGO1k+G5j51d2hmlvNMvV0mwNwjNvb+2jv3Wg2Q9UNrrkDBZb6mpL9UY0jvLwGb
	8Ww9FensPa5c2MED8e8KrdnEHzmjLROAMyHT5OeU=
X-Received: by 2002:a05:622a:229e:b0:51c:1ec5:d00 with SMTP id d75a77b69052e-52ce622e53dmr287585841cf.44.1786126666425;
        Fri, 07 Aug 2026 11:17:46 -0700 (PDT)
X-Received: by 2002:a05:622a:229e:b0:51c:1ec5:d00 with SMTP id d75a77b69052e-52ce622e53dmr287585251cf.44.1786126665899;
        Fri, 07 Aug 2026 11:17:45 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a79sm81544466b.11.2026.08.07.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:45 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 14/19] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Fri,  7 Aug 2026 20:17:08 +0200
Message-ID: <20260807181713.228535-15-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Cb44Irrl c=1 sm=1 tr=0 ts=6a76214b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=vvBRGx3AIC5YeKHJuXcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: VAXwbW_k5PUuifBudHpAcaBrRDFZNHH4
X-Proofpoint-ORIG-GUID: VAXwbW_k5PUuifBudHpAcaBrRDFZNHH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX08hMjpSh/KQD
 CEcyy87fyeLDAnl5bf5YlMQTtn+ydAMZG9cD+F4v7r2C8j9ZC5n6AUC2P9TNWh30vO1SgCWWhXv
 cP0rIWCBnDnUeOcnA1/uc5p0Jn55pbzuwgR/j8BttSAQDlnhCCazfykBakMRMG0gt6ahtEoqv2z
 UYvf06w1kUdi2mOnja5EKBa2FlDp5Q0ujnUigOx4eozAUQODKSYifFLyXw8+bf9aUSoEVO0bweT
 FFjWT8vHEEaJWJEOKn3zzLVxQhxkBwRvE9dPHVLdEZ4uihsFMthoSkDTFrDntR6xPI6QwqB9jsZ
 85GTgcpZ8kKkNp01n3L4vDy3Hac3vegTf3V/f/YqbeFjHdZ5EnDbcajgRFC1J2bbAKjn9fzjpN3
 a8w63MOHWzAdRZ+GGIaigpjmpWaBg3EB9WYeuj1soowJMUjnaNqzNJySoIPGXG+zHx0gohws79c
 IRh3QgkeozbcNE9k3cQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXzpSIV6tE38AE
 WoUhMbQQJ3dgKiTfM+AWWW8wdxrVEbcCgBUBNb8jsBvW2of2R5kpJtjgTeR8xNz5DaLHFl6GYn9
 fEBRPDDlM7Jw74SCGisNa6UVE/lArOI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111748_050718_8955032E 
X-CRM114-Status: GOOD (  12.26  )
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

From: Tomasz Jeznach <tomasz.jeznach@linux.dev>

Enable IOMMU_DMA for 64-bit RISC-V now that the RISC-V
IOMMU driver supports MSI remapping.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 6e07bd69467a..1c9f2ad10f36 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -151,7 +151,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || (RISCV && 64BIT)
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
