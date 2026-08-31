Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5AEC624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4LuCST6Gaq7NGBPyhqs5g1lHWnM5CVA4UohlKBW0gw=; b=cOIyN2F1P+h7HU
	pBNgdKhk5NzCRW3Fso6gCvJtpSKdmDoUlSUjrvg2JJOcmsOaB5/VwFtQsPZqe1ZX0L8xXMKERq6lo
	U57zCIdQd9ng4/sqyt08wEBVBcRt9C4xUmNEtqiZbOFRNfKDnZHrPJZDyLcw7AJD+kQKVuYUaLXyl
	Ny2pcVbJEGWvCaMiV9IGFEbejlBQoYAT44HPH8K6Bu6SaSQRKlHcdbbfCUIUbrMtIshK5snpZvxZt
	BVmsF9m4hfNR3hcOcn31RNB5SnE6WTx1ZiCSpXWmQIGfZcfXZQBCPH9jXRvXWXx9PafOMxAxXzddb
	laeb6WmKrkljZAj3fgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Uh-00000009kvX-3Kwq;
	Mon, 31 Aug 2026 15:00:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ud-00000009knp-1zqJ
	for linux-riscv@bombadil.infradead.org;
	Mon, 31 Aug 2026 15:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=le4rWUxF/mnWmLZ0ufSou1uceP
	RpxwN3Fby5PKqFM7TX1EqifzrHOLZ2QNJee16cOQ5vS6DKlH1hFoX+s8+AIA58QkjBYfffcLdVsjz
	wuRGMJhhAOuOwXL98oHd0wf4OvkkDvqVk9C5Zpa9bLpxrZkz5sfQNEgeRN8X/B7oLM6xnsrDOx0uU
	cIdcwJ+vAFBa7ybJEUHI+V3iQhUpxYFzlZcJCBOPz7ivj1+8mQD1yPBGjI8HbLSsnMqY4vVs9Ib0m
	O7uJcorbHYcyw4XeJAdOvjRY4OgMwH0I3OPGZgHQ89vAt8w65+q8QMhng4I+fgtOOLKgVSTUeIL69
	jSjCIJoQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x13Ua-00000009xim-1eIF
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETaUT121886
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CZ0/AJS5lrL
	G+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=ZHmmwZ55ZkWxUUGmJr6kRIKil/f
	olLP59mQRyaxFb4gJ9UAzYLH4//NXYQWlNIf+R043iOWSmX2VKC/nQ3hBvEdjjCR
	bpGG4SlGH9/6+VhDwY3i4npiEZ4eGAjZhNH8MAISVd4j1XjbN0Tw3nNlurDM7sOm
	LpTwpWBQALIrAbmeBY/F83cFUT523ZnKZXsWsLPAWR0klxXt32Hr240nTlk+BSIQ
	KFM+kd+sC7u+bVKncLCyrMTXCqsx4lMGY5lQ8bUax8KOkkCectd9CO67yLA2tHeL
	nxdgKKUK7Y9iR+UwBMkgbKZrI/kpyNOph2mz2QZQKhS8oz2wM/o4djz9I+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pma2qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90ce21f2cc9so99084256d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188408; x=1788793208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=jhlsU9AsTvbaCj81ViY2UHKe56n4siC1jgU2TwyDWMV91Urz9K347e/euGo/j2Y4cj
         q7OdfS/ZECljrmtS++qzPt+dZdCZqWLnFhhnA65izIUtaw6bvJirALywR/c8VTi5L/f4
         4NQP+jXFK13LLI3OtaS7i3egpXX13GT4lVmc3FzTkHanCobqtGaZv4nF055jaFjRNT3f
         t3iisU0r8TR0c1QxqRhk9NAqI48LgE5EfXGW4yAr/SIxIcFJhU7LcRt8eZnJptlrkKam
         K1kfrsinFN6t+aoysnSr2Xer0iONiPddoYSaWcEZUzWpBu1F22tAytBVAt+e3VVAy2Nt
         DOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188408; x=1788793208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=lPt/OMseaKRoJ6d6SAbJOdHxS+9wai0a0xsIGaSv9q2dGm9CkBFr6GR1IdwmB/88Df
         yxfNkr54Otq0duNnGJGwhcNzF01TSMCKUkf1XZE5P/xa4pH32nwR9oV89GvKsnfXQmn9
         M3jCyFCv/wWmdfTB1LaS0ZQJBWkl0EARVW284Zi286VFtjnWn5o7We0W00WMAHlocjnH
         45jbBWNgDHNzYYC6mYHPn4ISKgaMfrMkZCBhK7tWksqZ4cJf2ZcPFuqUj/pWtC2XfBqe
         VUo5C0xwAc6mVaYRXSXUkSsz0IAS8oqNV5rDLZMhzz9gSQG9t6WBlrAXyb5CmFVSnbOI
         wnFA==
X-Gm-Message-State: AFuF++mi3tb3R+IBT3VN8LRlklp13cjS5lRz1K+NDvokryrY2Yixrdii
	btxvPjREvpKbMbBKXurCJ+aLRdqsc93nyUCfxFuOV9WrZ9FPmqyI8lsBP/GheXqHnILKV5Vo5Jt
	Zbcbkn8fjbA+0vOBuxMhnB2pSAB5jexFEwX1mwM3FgXeA97bVeLzxj3W9o1ISjbtr/ZU4Ws6bdG
	osP9I=
X-Gm-Gg: AR+sD10WyGfITzLLEjpHReU+MIoNantKgacox7ktd3XnT3HMx7f7utpqxBhGj6NfCD2
	J9AWp2/+Aj9bb3SzY3WyMKxAbcr9jzqK3LXeIA52zw2y3EuhAR5SB47gemoVxj/OYgUSSAv1h7b
	TjRI/BZ9aRf6mIurpKm76IyUZR4FkQY6S40Pdx9k2/LnHcwWAtgBkvOMvhfFKWtim8MVRZLEcNQ
	MEXoLe0JhlXWKtJK5Qbpxk6nRsyTiWNjDRfyS/nRzweq0IxMSxvesjh33MIn24HkSXOFfEhtKlf
	2RTOlxQvJrzsEi8ZenWaboQk8f7gKqibzWT/LRd/EvjQSLJQd3O2t35nkNE5liRl3hvqRY76a19
	zg071B0PSojel6ySbBrc9vjp6CTO7zNd1dkA=
X-Received: by 2002:a05:620a:aa15:b0:92e:8310:7369 with SMTP id af79cd13be357-9391398cfd0mr2651616985a.37.1788188407722;
        Mon, 31 Aug 2026 08:00:07 -0700 (PDT)
X-Received: by 2002:a05:620a:aa15:b0:92e:8310:7369 with SMTP id af79cd13be357-9391398cfd0mr2651604585a.37.1788188407117;
        Mon, 31 Aug 2026 08:00:07 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm24100210f8f.34.2026.08.31.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:06 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 13/17] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Mon, 31 Aug 2026 16:59:39 +0200
Message-ID: <20260831145943.313726-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: NQyWCiD4u7xGwYhdHSjPEpJs94Eltang
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX05z+plJmE2IC
 y4KZYJ3g1S8wLPY8JAJjd1U0fy08f6KcPFua+GdbQkku+caowpeIm/Voqu4KQlOYwfJFfFXTM0b
 mqxDWSjNrl8YRKbji2toR8h62ik9yLGOBW0unr1BgqWLOT3NwYeMKUixhhIRjBXaUAuP4EyvQH/
 C0q5R0vVGGDL/ZyiwdXYNgCQH5qSiYdAjSvJXYquLQJaUq9xfdMsEd/CYMNDEaZKddPfVvruiTs
 k5Hq9by6dVMYO2vQI8FeOeBrNVDI5ApRcjNYIT/GejNOw2dLPuwA+j5fW4j+Af8By67nTxo8Cuu
 OQj3UhzINGA0zFrJ6IvicG7nTCfJ2vgAgSFL2aY4mQkNWSPxqyuQEV9K12l1kvIFBL1lZTCrPsB
 7KO6HSw7nQnHnS16AgrS1F8c2tXWESKr3BkT0LpuTmc8HMQlmK44CUs7m4PJfYXL8AqqUF5A7EC
 Eo5f/CsQKjf/z9Za1Gg==
X-Proofpoint-GUID: NQyWCiD4u7xGwYhdHSjPEpJs94Eltang
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX+irrQOJD9Ckd
 WtIJjKXTUAExUocLriouJgufy0+YDN3nni/6zt/06itmx2QdlpfzJhJKmk5tR/gFNcxXaQ0A6sl
 YSCHCARCEBVH7opyEj6SL+oSgmvwzes=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a9596f8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=vvBRGx3AIC5YeKHJuXcA:9 a=OIgjcC2v60KrkQgK7BGD:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_160012_753938_A86709D2 
X-CRM114-Status: GOOD (  12.66  )
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
