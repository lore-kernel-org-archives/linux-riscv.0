Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93646CD37B2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 21:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QX6Mm28eVLM6RL9EuYpGUEFjmt5X2Rd6RIPAqMNVPNA=; b=X5tsXH8GtlCi2H
	8DibBQJTvlTxSxSQPe4MHIiH3iLfWEAAhFviwEFzUXIrrQMnYv/znkIwXNSx/NXInp76PvMnsiWbm
	MiwWL5n3fAnOKq713y3JryNJqksoNBG2/8B9sonD5dcybR4JNd1vXQqJv28Dk3A5BvTh3ygfsSlzz
	XbfB21N8I9BQY9HWBHYW4BbpifS/zj+t37Dj6SlsFs4LQ5JvLtTX95RYQYpCqDuQYwuvq94hkf/wd
	twmj0B3l8da740ye+aLmAM2eWzHMqrEQVW5oJ61R7xNPg2aQ9xLq9henR+zGFNxJRgpVcbKX49CIg
	EhSyTiwzeYpYw8KAaUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSfj-00000007Xzl-2bjy;
	Fri, 08 May 2026 21:23:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSfh-00000007Xyn-2v48
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 21:23:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4vQp1116683
	for <linux-riscv@lists.infradead.org>; Fri, 8 May 2026 21:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ahHBby4y07C
	i93vD8Adl4aPO8dzjeBxp/5vUSFayQgg=; b=NH0KV81Nd/X3DKHboSiWwBekc6J
	zgkGNTlCoXFrNCOSmW8Hs/XOJGQ9KV2/1V/EEp0B0+3f2ZfDRZO9dJihp2VCGATX
	gXN1C750vBA2KcZJiDhiM4qVtYhfgynRB++kzuGND+upARSmMeBQTUi0srhLn4ku
	1xPclJFdfbamEqj+tm+kC9DSq7N0bGH3dMF7AAZK8htlIDKJMXvhKgajGYiWWnyW
	FTwcKCNnQOzJDhxtM7AnjfTPRTLZL/VUcsh+0CeJGya51D2sQKUWgH8ugwNUcI11
	iW5lV3bp8+KmpxX0ujG09O0vJAbO7oB+9O98Vxn92MLWLIbbcWiDTSfRnOg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1ph06v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 21:23:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so4633408eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 14:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275425; x=1778880225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahHBby4y07Ci93vD8Adl4aPO8dzjeBxp/5vUSFayQgg=;
        b=JpaO4J84GkWpK86Cm8QrSLW7sDD48EeXPQrEjpGZrK8T9bIrfJaoHNK7sAQQONRrlk
         b3BEuzCbCcHZUZEtoZBLJx6Bsz53ov+1Lsu4klWnR2dgSRPaWApA8RkuKJc6yHHi31Ij
         CoXixcJ9aLarNHyhwKTFVyJac/hdG/re6d57XgpnfT4iTINmge/BA+GL2q3zpxCcgmvn
         fS0SBtGn0hBJQ6EF0NNk5M31bku+OlhDORW8QmLyhhPzWiEtGMcHAw7hp3648i8WGR7A
         7TCEd1NPIlvCjO0XE5j4VXyY17lrWl13+Ziuo1MYN2TZSPOfh9nzRRi8sa4gVgoewAmG
         dcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275425; x=1778880225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahHBby4y07Ci93vD8Adl4aPO8dzjeBxp/5vUSFayQgg=;
        b=VCZvCddh5nxkZATQBrpMQJz5wPDJ5gcJtlfdy81L4JR88I/qkAPOdr3M+G3PFl1Oay
         gq6GLwWUUR+j8fInj363Ry0NTBBh3uWZtel52dWiWBhVbHdpc5/AFPe6OB3EVGjX1oY0
         /AySTezASoAU8GVQkYu9CJCdZhIdLMBApuKdZZVk8Uezyh5JxfTDgcbUQImRIq3LOfQu
         fXBEElgjfs1/9h29GRdIy++Xaabgyz/fKbUo3ZO8k25D8yvE5jXiHzqNE+CaBXikvgRH
         n0WlhXW776BE7fwsoYW/H1rGkk0GLGrJTFnYTJFMC5vyoH+sBO11iSkcZ1LXpHeMu8X/
         SyNQ==
X-Gm-Message-State: AOJu0Yz3Ro/Y7uSB3Bw2fbE4cWCyPvtWyWgfJRgxtd5i5gSrUleq4moG
	gb4hREVu3Oh8wvvLiymVHt41HaLcKVwtGXGy5UYIyXQgLWd7+vP9KJD4Fa8aSpvW4v117L8p63N
	3+M7f2zWYk+YXKH+BMdAuxujZljqllGn0Tjgc5F9lGM9+xB140KGDftfMS36V/UOd6eYOABlhWf
	Cux+k=
X-Gm-Gg: Acq92OF/z75no+dToapQTBgk3qrmV9ghuhH23Zq74Wu6KxC4jsY1/Gn5TA/r/BffYLN
	Uh3JX+W5cdQ/fILeyqcNw5ewx5UbIaaPs6N4jIj3pBF/RtQzzXFdTorZlAdWXwCO0skedsAb+II
	GAc3BRyyzRT4WnFGs71hgp5D+WpjKC+XSkGjBrzyf0kol1GHVT1pYqGEGpXvAu42ICvEg6jCJCg
	BOK9peYoejkLCuGfqljXRENSzQVD1CwJwZjzKQh0+p30ixLyswK2YzuXclGEhmjfoqQGPA3aw+y
	KBXARZ4gr2aPooEYa4MusMYX6tPZlaupvKQgjUH9B7KLQ45MIqeRowwOM4Qm4utZcWvXXgWHaPb
	3TfWp/mLHPL+Ixgb69gpl5AzUe6H4M/w=
X-Received: by 2002:a05:7300:bc0c:b0:2c5:ed1b:ca9 with SMTP id 5a478bee46e88-2f85bb72d01mr2298258eec.1.1778275424554;
        Fri, 08 May 2026 14:23:44 -0700 (PDT)
X-Received: by 2002:a05:7300:bc0c:b0:2c5:ed1b:ca9 with SMTP id 5a478bee46e88-2f85bb72d01mr2298224eec.1.1778275424067;
        Fri, 08 May 2026 14:23:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847506fsm4512457eec.18.2026.05.08.14.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:23:43 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tjeznach@rivosinc.com, joro@8bytes.org,
        will@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH 2/2] iommu/dma: enable IOMMU_DMA for RISC-V
Date: Fri,  8 May 2026 16:23:39 -0500
Message-ID: <20260508212339.381933-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
References: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ZwySghOnK00JwhS2gQ0UW_MP7WYI_EQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMSBTYWx0ZWRfX84Hd6894kqDh
 VUfHP3FG4vB0Uzj3UprWe0u58FX0J0+cXcsL1K2WcuARBIzEbw7PatUX573SWFBpyV9jwAmnvfG
 tSgZ19ZdraBYmIf2CMaRT8qjUt71NAjDca1mrm4LOrKWu4spYfAraRo7IKqgoOXWMlJpf0pBE63
 RACi23wDV/ztJzq7jp1AUe371BZb1l/pPFd/HRgxTFunmzgbZ9KOl6bfRm4wZGFBVi3nyB/I5Is
 DQAW01gC+upy+zjflf6vdvGsFDnBb5iq5hkpAVQ2TEs7eAJmSlhFJJFLQbUrOclgkhorX55t30P
 XjBkeBMgUjnJ7d5ZAs7197xineKH9uGD2YXsLqvuv++mByLopWadOfXcYFNnz+RADuIl5fRa9Lj
 lSzxPILu/2NbSfhBK8Md3PoJ9kfyUP7pQtnyu+wHHkL+2wrrTDwagFbSyzNS7HOm56+GWH12DQu
 gfQ71yFVOYQNoNBnSkQ==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe5461 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=hQ6NVdKzidvgU2_XqusA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: ZwySghOnK00JwhS2gQ0UW_MP7WYI_EQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_142345_740073_D46F8B55 
X-CRM114-Status: GOOD (  11.84  )
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

With iommu/riscv driver available we can enable IOMMU_DMA support
for RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index f86262b11416..34d8a792339f 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -151,7 +151,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || RISCV
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
