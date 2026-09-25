Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646E0C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjIrXTQRd6qGq2f/J9sSigrE9ny+mql+Gfn1qPPQic4=; b=coqA5b4VEEYoL0
	f0f851n8NI0vtDB8MuZMNv62QK5UzprzO7g4wI4eO1xHnmz37GcB6kdvGaZ0octdGvfdkmF05m+71
	uajtD98U33cnJrdpETLcu0y6QHoGR8YuuVoa3XWReVfAcXi5HDhfp8KX8y5ct29/ef22hNeq62ZoQ
	yBvsEAnNVI3kEG/0lzsvN4XTcaD3P9zRuxKFmGFtgM1rT6KYR1x6ptIRmxTe/AqtaSS5mMy0petcb
	1kiyhVPRh00+wuosKI4dr2BG9/B6TK/OkIzwEXy9alVik6AT2JS31wEhtTm6LA22z31B6NXRZvabi
	e4y4hRcTF4qw4Pshy4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7g4-0000000Dk78-3xJI;
	Fri, 25 Sep 2026 15:17:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fz-0000000Dk00-1FhJ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDBXmw289534
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3xarg699YR5
	/SqvbYoFXYGmxgwGbRGBZnCFwVETijPs=; b=gzTD1SEYiy6iWVfEbP1Ntu8OQkz
	qVfpWPguU7mCPxdC9d5JTSfCd2BU2ro3PJy3kNrCa+J/ZOJ26U2A39pVJ2YduSLo
	2/GtfeGbyKnqpd6jd6zQxbhWLMHxPfL4LIvl1Hj2aYlOhTOwMAsDSGmj7EAgdtnZ
	kbbAjQ1FijfAPLP19KodWXDywETZo6P2hFLQmWLQKC543tNNffNCw7SLLMyziOAu
	jBrtWJZTn/HHan999D3irKgq972v+r3pW1y56t42VtOwi2lkdHmIMIWKPpUlnX3t
	dZU7/JcDHfA5lSvnMP2dEqOEZ5npbGMtAPgqCUb+flMPhEKOh6Sm+tnGV2A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881v4ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b206156cc6so701802137.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349446; x=1790954246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xarg699YR5/SqvbYoFXYGmxgwGbRGBZnCFwVETijPs=;
        b=i7sopvwg639cewZaNiXVCNkBM7us5+0awMdiWRUzizPR1xXHQc9yFWIGoq+u1LRcWC
         xNlf2z2SZaZkblHVZTkU1rja1tyukLQzXFhRYJ9iS3iKI07bm760ol8SuvrqGl7NcutR
         Au7OoqwQL0IGk3Fu4Lu0ttaEqZzYtEOorpzRPUYkyBj1KFOFIvDUd/53LaLf8pZIuqaM
         ZvuPRGNwLIibmdkG2S23v9qEPkkS4Py8lWRLPlvGguchjM1IC8ywqCf+Wldf+VVLYIb5
         0FWEe+2bmGeLLUJ6czmMyRaRPtm7SHeVdmhFrM4I3td/h48n2U+HGLkAXywtQwzGDzEr
         7o9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349446; x=1790954246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xarg699YR5/SqvbYoFXYGmxgwGbRGBZnCFwVETijPs=;
        b=2h71NxRL/S1UmN9pRqPnhhvkk4FzkZlj4cVu5Hk5lGQIJ2KcxbDmjNLi0vonpwEcfA
         XKt7YktL3Z1dsmU4LSYp0qoGsd5gej9P5S0sQvbycwgGRHKKD9rJguFmXuhnoZ1ogM7o
         mqEn9hcokxOP3IK1OnAs7550wWyqdsf8jgr9SHSayUJJjtix/wzru9Ni5a71otrc1Qxx
         PObLD+2pHeSOXNnV8BVGqaHvMixszVm2d5LWxmsA3WmTCo+uBKdH+d0VftiVpInLVN8P
         y7yOHH4uj0B6iHJfS72vDVL1FAVmLPoShw+JUBqCfX7Ug+194SCQdfRuckf9IfKCfpBt
         KtSg==
X-Gm-Message-State: AFuF++khG6suhDB4g3snLGZl0DSuAqaDxCWe5Eyyuwg30mhKvg+RJ3Q2
	yKJ8mBkOmLSnTCkc6q8V+LbsMyT+5zPDj56TOJLIjLUTOy+1vC40c0HNbopU//oxERRrIx8ERwg
	v7mw9qjnYLk/3EoJwnbkAkQdQEyqyWT7yfx4qBwDVp/jag24RS4WZzDK+QYQgnZrysT/nxOM2eC
	0HuAo=
X-Gm-Gg: AYBFou3As61JPV+MMlnN6BXm0zkQFDYo090cjgqWSi1g7+t+pP/bcxfkrn2R22+rjiZ
	pZOhV90Kv2FgxQz/c0GSj9N0E8paH1WZ37URAaZwTNXd14J4cUdqHcz0l0RFv6ntvFhM6Vx/kFJ
	1x5WT/ff4yVmCdbQb6HH/0L8/hGe8xWf1aU/ARzlGWxd9qJpotL1YK3rrfj1VaqHcZQ6Rkiq7L/
	Auv7/44Twi99yg6EAcf4PAH6VJpotvpUOcft6AFHDajoblvRaW0fmw22eDKP3YbauhCJ1gXFq8+
	ubGPp3OvOO9poCImKJT2Tzuo5FV6VzdRJ2scTp84KJITRvLHQBPSMyYqnjGKlUMzXkJNJmiaBLM
	4hxc3/oxzSXdnBVianbaAp2mHuEIuqUJBfL8yMQ==
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2829763137.4.1790349445661;
        Fri, 25 Sep 2026 08:17:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2829749137.4.1790349445137;
        Fri, 25 Sep 2026 08:17:25 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm7632913f8f.28.2026.09.25.08.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:24 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 12/16] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Fri, 25 Sep 2026 17:16:55 +0200
Message-ID: <20260925151659.419512-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab69086 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=vvBRGx3AIC5YeKHJuXcA:9
 a=crWF4MFLhNY0qMRaF8an:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX2wzpGzRcvvXD
 u6amC4uMe0rVT0CUzRQW4EAduTcZY6MTPyYY8KvWeOU/yD+73jdZRD3CeYkirK/4dcBCrC8CHNL
 4Tupy5dY6HbyDc6mGbrVtrrSfxtv4TJ8jSq9ciNSR8pJG77kdEOMOdNVzErK7A/qQ5XfrPGX4HC
 CmK3ryKnLQJBvKh2e+ov+4xpHVVEAgTzkTv3/dILHmO6mw8MtIV8xqeRSbhptuWqN4JlOeKcuzL
 BlrjWj1MnA9WBj0J40AGD5fItHn9r2ttdHEXJRqAZKmgz5cy927yAUZ4inlx9FrIkt3vJgfj9WF
 wwlqyR+J5eg2WnUwdFAo5RD5AttE0I9CdPZlGgxljKa+VPKCch2SYeCz0khQe7tYldR4W26cE/z
 SeXT+mrYS3vYnR893Et5HTZnaXN4aqtiYhvcuFwUm/CtW8QwyoQ+0iXskiIPBEFlphU3hNYJeR0
 hKEqUnxP0suIK/XQFOg==
X-Proofpoint-ORIG-GUID: UWLYlXJ19dXsbY1RaEwIYpS2Mj0-FVdH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX3BRv7Cx5M1on
 7R7YPKDDqI2NN/Jt3nBY6d5YWGEcD5FCDOxVWfhDZDaP0jjZsH0OaYRaZwrAQF16qv67PD0WwDW
 OTLJItKUXR2EP8ZeTch9eMWJVmsiqMY=
X-Proofpoint-GUID: UWLYlXJ19dXsbY1RaEwIYpS2Mj0-FVdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081727_519454_DAC3AA34 
X-CRM114-Status: GOOD (  12.46  )
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
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 27954f462582..2d38d5b5accd 100644
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
