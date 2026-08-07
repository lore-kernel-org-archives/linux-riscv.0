Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B02C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LSoos2X8IahOftO5BfIQ8WNJRZcd0EwU0Eb83BVc3A=; b=yFVENYYjBeXB+H
	Tb7Y/aUSLJ+BR3s7Jj1YD/jI6hknfTAuUOlPcsuU/futtenVna2DhxBHz8DOn+hnizuhpJwUWL3Ji
	SMuHuAJ7Lzl+LusYvGfsF5E2ns4Ud/sf16UskYdOLgpotYGZogZJEJDRzD13owxZEGudRm9pdCkL+
	fuydtZd9Y6zB5MIKfF1w4LU1uOxNNvbcOxLyM31NPWRgs1it8ky3diOQK5ddOxDLC7gXT/gMu3IeG
	BuuNNy+B7TTRXUt6h3IvF2ZiLd/rLJi7Wk3qGlYI9stD7tu3l2fCeJEzZM3lWZp9XgAao1WobGB9c
	c42ZOFLMjT4iolY8UKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8s-00000008ZrW-0vtd;
	Fri, 07 Aug 2026 18:18:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8q-00000008Zp0-2NrM
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 18:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=91EdTe7wdQyVgDuqjCKqHnMdN338lsJK+XEVtKp9Mu4=; b=olFxxWxDuUvOdNzMpSI1/2c0z2
	PlwtHdy6oMttngTD1N2fKf460Lo7XFWRQmmVf/RF2EU5YKxT4PYIWx/7MxpsJLVCJn+IPjIY+CIUT
	orjASe6sSGsr63CfliEpyv2KYXHUqZitZ6eYWacWBEFBLkl7dV+dnwnPo9D4UJnLe6f97ZBRiV45D
	5iSnML57n54jzIWFWMNDqxRR5ldyhYZiSf4hXkWO/LSbwsV0pE0g8xYthfstuseRcQhnpwEv2BtVO
	uBz1RrB51+WMk1x1JJ8kyWJf7b7bpdZbVObuwqsp/59igsp4/ZFEGw7nWCcZL//3NrCFrfpXEFHsb
	xqTtbwaw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsP8m-0000000CaHY-0gar
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOS081190701
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=91EdTe7wdQy
	VgDuqjCKqHnMdN338lsJK+XEVtKp9Mu4=; b=kzP8lwA/Gw/oEBcVxluYfjcfcc6
	OGsjyKH2Dt30xgBOJkM5G1yNud+kkKpicenZab/syO71l21TjFvlePYS1WaQpAL7
	rP2hSewNAkADHfCeKUbFWMjeTqwOK+ANCZM06KKFPEioLGgwTB4LuVPxUnTF/QMb
	afZymtlAndAVS9fDm15lAFnfjYRXG8QspZ302YojV3pw4AU22X98gMJKDjQLeUts
	yeT+CTvETFslvPg+D+RcEIIcfEe/TC52cFTgXREunmEW4gmfzajtmckJYSExMiOp
	r+YXUVDSU3c9SSQqERMElE3W3dzdJ+OoVNzOD4yowklwnA4DD6SI++eDLWA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcujj685-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso38327021cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126668; x=1786731468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91EdTe7wdQyVgDuqjCKqHnMdN338lsJK+XEVtKp9Mu4=;
        b=FCPnin5FMEfu8fLHG3o6Uf1Wv++jrCXxMt5zh9mIDBj52kL55O9RacU3xond+Ms4Pt
         KGKkh9xtyGK55pYI0aIk0Ccg8xK8U17V9HMB+762O2cr0JFAoq/4W09NCIcF+BdyIiYe
         GqRlyOWfr+9osoatjFhATSdHKu+iJFBSYYCMXv4mgv67L7YnsM+EYSudBoEHBp8N5kLM
         BHYux92UVqjB54iVdVNwpG3OznZGHP6oO9fsVIF39qiI9lYUFkADC93Fppc2H7+0qkfU
         rUZxwzJUGTQ/9dI5ABDd8sMVjNXiOaZMh2axtvDTXLb5hWwE1hSvbhVxa2eAhpw1IRYy
         sIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126668; x=1786731468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91EdTe7wdQyVgDuqjCKqHnMdN338lsJK+XEVtKp9Mu4=;
        b=PbY+8rLElS9CMbf+ESeaeaBJNZACXgvA/vff8wdr5Np+AQMup2zDzBI3KSMX3rzbtW
         22cQ/eVM/6qTNVbMj1SDDgupfMLTBAK8/sA3+RSyiAdtMvUtz8Af0G9TnaOCHRM59xuf
         D+gnJmjjS+UrneFZBzmNo35SL7dUPuaQSkuN8rnSmcWjW1TGw6ZbMVpBZ1Eq/UxNzRFw
         zL31zsBOXytQr7JADTziv4sbPh6VyTDzwkczhEjTvXA25oRdzmGegvMVwDd2TUaBshbv
         DiPKmLAq8Dr6V5gthzAveEJO+18/kKqX/I5yo3pcqFrX3caHZjYxVtuX9XnhluT3Ra9D
         dJgw==
X-Gm-Message-State: AOJu0YyZ9SJOszY304VYTRK8tYGFUaU7rnMw3xUo2S4RpMp91JgxDBCv
	w24IwCGnSJNuoECLlC6cHF57WFHTJ8BSa7fvu1GS7yvCtbZDjvpqzboR1Tn28h7QXXMIEryZCwA
	rbQdDYjXox1vVTzijIeSIvBxBzIt7acOVlWLptR9+6R7wNHj2H2RLCieo0dzYk044yllwP3y4+Z
	tJXwY=
X-Gm-Gg: AR+sD10cxcK9/Xyr1sdGvq80caw2Pfk5LheNJiAjk3M8/XXwCqoYaBfnhJzz6tLYnAg
	Y6GRMuFEs9os2Jkmhkrx/zusKJEXxTDSGrLhZKEe0asiLsImwUR6cJ5USTF6X2nbd+ZI23ynCV+
	ec4kn6RbAeaTSTAaLjTasc7D6I1/ssZ2GcV9Ctd8JGqfMci0cqZY8+jOuOQRgwPrwIkMuOMPA7a
	fg6JDvxmscznR1Z4+Gl4xgkoJfKKQspL1T7TZiTMs7M+xQVhLxNTOPFfkQ0BoOfqzC8KwDI5bqi
	zBRAvZVuVORh5V3PoEWd7bQqd/Wwug5U8pZtYsNTySx/2ugrul0rlo605r5dgOZeE+r68fEXzpk
	DqtDaykMJWpUeXxxxCkpcP8flYm7Ux6wAgXBDFiM=
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr304279201cf.26.1786126668226;
        Fri, 07 Aug 2026 11:17:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr304278271cf.26.1786126667803;
        Fri, 07 Aug 2026 11:17:47 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90d21sm83079366b.39.2026.08.07.11.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:47 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v3 15/19] iommu/riscv: report iommu capabilities
Date: Fri,  7 Aug 2026 20:17:09 +0200
Message-ID: <20260807181713.228535-16-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX/4n68MBpXPHv
 JeDyuyy2ngI8XY6dfjRKFkcSiNtGY8wHv4NxgF4ibkHEYatAReaZ53UEMEfsw5+Gfr4GUx3AXpJ
 8B5E4NhTdnSV776s8RWSW6NFy9iTJKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX4voGhvOO8VOE
 th6kICtOAymVING9u3mVYKWEc8qivj7Ai9n7C3tAkyzUy/J++XliTH6lZkxMoyw5rSO+O9qfxOl
 dZuoC7mSIbvzbyNp1AB+lNAo3M2lVu4VQNhLEL/KRMiJHbTo8a+yAN9L9Ljc8TK7dcVKw3GdXP6
 0kANyTBHXKPy6zkGrpA+oavzddzDjFqfKoOKBXAYJHiWSRSQ71C6g3iUelSaw8JSJh7Q6JZN2l3
 vyt6RnC+exv0UFmFNnbmTvpYbk7JGlQy9tbqmb7Qvh8Pwb2+B59CpGvf+tu/Q9xsg0dsUl72MNV
 O+3P0LZMpA2tkC97huwmL2LUiwUj5ZoVNS+Cwxh0GoL0C6JcoH3QxVEfw5yItQdHrnTNoxQgvZx
 27KECeIMYHS1XlfVBZTxbK1Ozoo6MKPnxga8iLvmo81oXNA9NCGkxmS5LlpL5Zt5P4ibqCqH6r8
 Ny46EpiQFIuA/oTieLQ==
X-Proofpoint-ORIG-GUID: dwEoy8HOKK8R-GCI5MEEbpeQ1Wxf217C
X-Proofpoint-GUID: dwEoy8HOKK8R-GCI5MEEbpeQ1Wxf217C
X-Authority-Analysis: v=2.4 cv=Wssb99fv c=1 sm=1 tr=0 ts=6a76214d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=eWAdAM1PFmNr0JmOMJYA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_191757_823207_8FF160B5 
X-CRM114-Status: GOOD (  12.30  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Report RISC-V IOMMU capability required by the VFIO subsystem
to enable PCIe device assignment.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index f40db2cda417..a286f5a24c16 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1424,6 +1424,17 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		/* The RISC-V IOMMU is always DMA cache coherent. */
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1516,6 +1527,7 @@ static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *h
 
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
