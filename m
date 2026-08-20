Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAEFC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88mSGaXs4av5KLEYWRk38e3NWJdiuPHUh4KLTAyR/Fg=; b=gwF/kOmvbvOStd
	0sGemNMxpNooDZHLu/EDRmpjz0/9MzQjM37cSydoWSQRW6tLySHy4F0++XV/KoiU5Ype0X5cfdTW3
	6471S/pbCAN8KnwCNrMQp0xN81M/qWjvdzvLapOvbYzt3wZxkXx9Pm4zd68cf3r0nBtVnv3IrRpi4
	rJFUm/SaZjllYD9I/3IjjomRET51NU+yfNLMtpnAGWxUPdgM0BRcvv4Z/VV+SQDpYlKMl5tDeqVRT
	MuVDzHpnMR10YVK+GfjNPbt22L6Zjtm9kAHq4r7Hdo24J0LxRoTXiMh+M+jw06JzflpqiTcBeEJ14
	8tVplrp6fmJaAkBYvarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWZ-0000000CDeq-0IBQ;
	Thu, 20 Aug 2026 21:42:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWU-0000000CDcH-2rZt
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7cmV587756
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=95f+Fzhwpw4
	3Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=; b=FLf9ktySq3FvX1wSCCh3uhuAKql
	wHiTd35nqMOeX85pmsSALXS+CfoOZnXf1kSmRzqcX51c5J1ErUQlaNIg1BJySSfI
	VIKPpmvdmXBeiyq9vFqGBbGFMFMOFTytf6z5KATw3r4OGtyAI1vAXfxszG71YNma
	QcgRy2n874KHdFRn7LY91vQ/+gF0PwgL4qI+XF8EBMB11TFn9ubWWGLPXJkYcQFZ
	z1omRYU1etmBXidPfWairMSJhXdyiKIEDsKjRMam/b285IvIZDQyfk3wFUyXjzwg
	d4vgr51pecxSMFJDI2OWcuYHslujsZQBHVBdTQBWl9cMnL0JL+EXM2G9odw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8b23q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e63df032bso163189585a.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262125; x=1787866925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=JK15UHpKFfehMw2CRdPXP7TYSMsvhRaQSzP5zjgg9w6xKFGC4G4pvnNOFPkStcK+RN
         0VlWFAOKfFZNg83FIAqk03TqDaET5azfupB4dzOfiPC1sC3914yFnRkWhlRPOtfBhC+u
         sYHn6C9UKRDcnzkiSMDH5p3D433OB39JpS4dYNbk6up1iU3fcJ8iLSXQOqxWCAJW2M6k
         bIp/ahZq2qRkHolECL/k0CfuH9EqBD/7TGSoKIuWhNgza6paEM6DXwDVpgnRoYKoZN1O
         yniBMHFYbKEDAEs81XC+//KKXoc90nUWoRlANvgojUl/rGXM4I+/9ewRfLD8PJC+fpKK
         2QoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262125; x=1787866925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=Xd76mWzeg5flxrkg4/jUKWk+nkGghAD/2/GKZ7crLa4phJszFgtysDEWwbNNNENsno
         uxurqpcss53Kvy9tzW4lD31WA9nxt3S3JkszP/oK5SOH0GP4bGklvRd9n6W0nSWYsnEA
         tTtO3y+QxcL5csc86g4cYnGpkJ0dBRMpB95afmnCN1sw8MesjqkOGR9JtQ1JSyg8+iU2
         znGnXMNU7OiDNAn9cmh+7x3Nn2Y8j00nj0gZC/4nUBWiZe388/1kp4+icce2L6ktF/eq
         UWyYyU+S7nzGY7C5N0VW7GGvB1mc9rTdgbQjUJF6b7cUnvep4ohVWn4sYgc3D2iI4vF9
         Xz+Q==
X-Gm-Message-State: AOJu0Yx50nIP2IUOZj1aiJHSjw+IfuBuB018qoh30UqfBGQqs5DiMoXu
	OQvHox+fJTjYJOYLDn6m7jskIXqEO0KOmOGGXhlx2fC3R76QnhRKdQ8lDj7R4Hjr3hJVPh8KeqH
	iPpbnAFBLC2MnBXOUEIuDqNB9USeAI3SoE7mh9TqZho4wOouJiUkKZPyCR4sBBa3Om5NUFWQi6+
	hLuDI=
X-Gm-Gg: AR+sD13S2rLW7nRKc3Rq4m1AyBmTvDtKmGaYHpb3a0HC9B6Au7uj5ULsBDz2sAGcjbf
	PQM+tHBBRRZHxc/YzpFEcyEr8NqPUltsPEjF+eLXjFUQYdDH5gMNIfmo7DChAvVekNibmELENbP
	BfeJkB35ZVCIIrgdK1+dhzf4OXloHtk0ndjEjsfoHJR4gdUaKWmNyoTWpEdFxNQrSxLQhFdY3wK
	LhlxaO2SX5B1EXoCyI/HmvPkbdt+9U1RFnBZXXNNJhxp2hWdU8Up459ztezNd8CYPc6XAgWzlq3
	qNpb/YJ2yxHRugCHoNew8fWMTAk97+nsrTjD3hyW8yZL1Jw5SmYSKuGjKFCm+wEMgu3YDuyjDp4
	jSknILmjC
X-Received: by 2002:a05:620a:a19a:20b0:936:af34:468e with SMTP id af79cd13be357-9372835a96bmr757319185a.4.1787262125153;
        Thu, 20 Aug 2026 14:42:05 -0700 (PDT)
X-Received: by 2002:a05:620a:a19a:20b0:936:af34:468e with SMTP id af79cd13be357-9372835a96bmr757314485a.4.1787262124719;
        Thu, 20 Aug 2026 14:42:04 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441b0fsm14831889f8f.4.2026.08.20.14.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:04 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v4 06/21] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Thu, 20 Aug 2026 23:41:35 +0200
Message-ID: <20260820214150.545737-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxb0s3GXm2K1F
 +gvLgP7cX3XiJwbvSfm2YlKec8FFqbrQc8Z6G0nLWU7LLmsbG2yBENZBkJLpIsP8TGKnTa/X9Y3
 TP+UrpdDaozLWDIy1LIQSzBfCZbnwIU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX1z5nBU0SmcFm
 SBYK0BToYOwIPY5z+lVheugEy6KDK1s35W+qtzYBXmtqg4kkERxKt6R5mCwL9XcLEZGq/guq9hu
 8JoCG5fVN4pOrMsoR3bxs6wbM3Ik5b1FgwgleRBRc4DsK5maE6d/NCxsVZIvteunEizaghpmaJi
 QvsEw7EFEnw/b1N8OPKkTpehd8SKIhTr2EGmDm2K0ddMPQ1nb78de1EbJ3wyqBiWtgvIhAJDtvL
 Xvq9EaU4tCgxwv+eCDtCh1yteuCu9AYSBU6hCr68JoDlHwX/QeKwH844n6J2HyJ8Xpq59h3tR8k
 cz1kLFFT1s9gBq2nEdgcbXSuDOUS1XYsJelFHzGmmCSwJWYZNAn3q6IykzJH5MgLylcxb6NWAeI
 83keVxn6GtQ/GuqB3YZ3Vf6Sjqj3+ggxsNf5D+RfiyUuI42EHf2b8FqSUeQ3fssFSraZrZhURLn
 6JVPECxOKRkrMYPk0cA==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a8774ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=cHhBG6FuOey2j-0mYlgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HjVheGYppPQO4LfbbYO-jvCxMay8lICE
X-Proofpoint-ORIG-GUID: HjVheGYppPQO4LfbbYO-jvCxMay8lICE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144206_881881_9AD9AAA6 
X-CRM114-Status: GOOD (  18.70  )
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

Add a bus token for MSI domains that remap interrupts, needed by the
upcoming RISC-V IOMMU interrupt-remapping domain to distinguish itself
from NEXUS domains. The token is generic because remapping itself is
the only property that needs to be conveyed -- there is nothing
RISC-V-specific about it.

Such a domain implements init_dev_msi_info() via
msi_parent_init_dev_msi_info(), which leaves 'domain' pointing at the
NEXUS domain while 'real_parent' points at the remap domain itself.
Accept that combination in msi_lib_init_dev_msi_info(); no other
msi-lib changes are needed.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/irqchip/irq-msi-lib.c  | 8 ++++----
 include/linux/irqdomain_defs.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 45e0ed3134ce..9027dfbab15e 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -36,14 +36,14 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		return false;
 
 	/*
-	 * MSI parent domain specific settings. For now there is only the
-	 * root parent domain, e.g. NEXUS, acting as a MSI parent, but it is
-	 * possible to stack MSI parents. See x86 vector -> irq remapping
+	 * MSI parent domain specific settings. There may be only the root
+	 * parent domain, e.g. NEXUS, acting as a MSI parent, or there may
+	 * be stacked MSI parents, typically used for remapping.
 	 */
 	if (domain->bus_token == pops->bus_select_token) {
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
-	} else {
+	} else if (real_parent->bus_token != DOMAIN_BUS_MSI_REMAP) {
 		WARN_ON_ONCE(1);
 		return false;
 	}
diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 3a03bdfeeee9..954cf585b3c4 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -26,6 +26,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_DEVICE_MSI,
 	DOMAIN_BUS_WIRED_TO_MSI,
+	DOMAIN_BUS_MSI_REMAP,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
