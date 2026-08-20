Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AC2C5DF8E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4LuCST6Gaq7NGBPyhqs5g1lHWnM5CVA4UohlKBW0gw=; b=yJAxrtPIDQERiV
	NRkCCZmKMfzQ8Un1vytL4Zg7BhKgpJnoDqroW6iEN60XA23ybNlKouQSesa7vGnIOoFzEMsMp2gFm
	kTZDVyrAxvqQufLrsP6YMm6G43BK05SoOMvn4SXnWKUZHxa8l3nCAzs8rircCSz/tMn5ytaoFvW34
	agJZvcBCGEWJnDMqAtJxCtmSqLhPQM7fwpqwFurX0JSwEvekT+AiqliUGBxUX0XhFeZG33kh7IfOg
	u0bBs/r2WZ6L41TblfuBXM6neSISJdmmPc1GMMctnLIbHi0+Qeft+VZtfN4cS2GVvCe3IRQ2cddVG
	9KZirhY40hHJgp/uNqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX8-0000000CEM3-3fBC;
	Thu, 20 Aug 2026 21:42:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX0-0000000CE94-0axx
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Aug 2026 21:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=Te3Vb9Idb2XJ9kF36mK/yRSM/m
	6YUfNdRkwfoOJxIBaGr3BvisOkX61vA9PxMM49adKOdiCOZBkeTjUEzOyxfzYpOM/dc1hNYFuyddb
	K3vPWTdOfIO/pvr6DLuwFMlxipwDf53ESPDO/Wiz6ZEew/Nx4bTgGrMVaYFMFHR2ODAHmj/rGsuEw
	SLzJX68zkiXRdRXET6NBeBOSKalDQyyOUUU2PonvQMfGgYV9/ZybBRqk81gFN3OgPU7nKxJVno0lT
	186UehZcTBf2pD2r89pFab1zPDE7t4IZaGvTTeS/yK7yXBJfpnwGbqHNQdTZAvACpR71kjDXp6uOB
	b6HGpl0w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxAWr-00000003MXQ-1xhB
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK8LBR4032141
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CZ0/AJS5lrL
	G+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=CUGAGgRvFVy+df2FR2GudC7qDr3
	bZHSzh90yvdM3rp0QVughv4VFZw0WtjfCvl0u234UND7xjwECczTKPCrIsX27jaM
	/yAxMmvakFAmCv5oiZp4JoW8X8959By2B54htLcrkTEOQ8UTtkq6dNVVL4jUIu1c
	FJa9k7CKodfFHyCfPrsUttSqL2mf2J/H4RFxS+SF+sUTLxXJtD5bD53s5t46FLFA
	dN/9C3Hcvmz+MUzSEcFOLofMH1ZfjjJBk5pCn5sKlem2ZKvUifecT+ViQb1OXG62
	juVFwI65vGaZtB1p9fcfKtT3NIPatqstMresG+Ko3pKei8YUH7fPG6W4JrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbvbcaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9a2b95b5so55366885a.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262147; x=1787866947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=OnrLcWxp2UH+MgWuq5MqXjlAEDjC00uNyjcbbnhwpaMhB2ZGr+D95wNWCDCo+oiott
         lditwniHqu6qCAXGYWUQFWEnSaylM6D7U07CqEq19zprktk+fhur/Twvfk//TJbHsZYY
         jTAaIvYtSDwylQRw3hxmWD0nhrWYnE/8YTHRh7bfb8dYfdgUTnpitFqpcMxXJBMj7uRi
         S+ZNxaSNT22LNchcuUHuFoAZqJOt7C3lVKwUycXsZ6xfETj7mEjzBVrm8kdyMsbqlQyW
         BO6DAHnvo4cJtqg+DEgoTuoRPhjBTSTLGuAGEiSAWrC13l/EEGsHmCaSLg+cucgE5oEC
         xk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262147; x=1787866947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=BxmECm5dddEb1QBqtOSiBhjX2+TOmNwAkS7NiYjbducfk/KUzkRcgUyBsQahYSfks+
         sahyh7AcFClinLnk/JzZ+g8fM1TrKbGYt+2pnET1yHLg5364N1o6TMCe9GpeT6iNMLgF
         LsFXLddAZ4Q41nwPCj5tocsEy2Bqp+VnaPuKffczG5QNdgZM5MbGacgLjiVvsjFiavga
         WtqawdgY4r1eBbuF5F5z6149kTleYGveShp78/MWMvLm0sQUhrjJPtaiBYBb3B9BTjwu
         LqnCyBmlYu2eZuPZ6DTeO2hmlUu3ArBtMqWP8zJO22QnHtIYhfpPxsldnd5lTHAKkZAc
         4gNw==
X-Gm-Message-State: AOJu0YzlhVh36nQKjLczhDs08NDx3oK/dr39FkIroStBiP0/0mrtfAGY
	a64ChDjE63WuNTlv/5Uhqyib9IVjH+BggRMPJg32IRTVAGi3PwefTe8GReAqWIAPiE1L/90hhkH
	7X/yqXjhVSboZet3JzKwgiNdQJNYWq5ZgNEOLLj6BvNvhDM6nXQcoJTLbmj3Ma6GKRvE/y+QFN+
	8Ers0=
X-Gm-Gg: AR+sD10OKwYXFtXES6U81oPcYevPmnkf+MuXdjg/D1XBM8QpeNe+F8pEzX/nGk2OwjV
	DfSi7H//vN1ig2iKgvrZlFOa0zvMZZAd3eodqP7IZ7wvHPdN1Vfopm0RT42+M4DCegMHfCj+SSl
	4aw/MMpAqHr1HpN5Tpmp6DI7VhE055GD2csJSRjk+AYSc5JJRD0UhVOUcpGNmQaydOYhlCWrJaS
	+6Fd8U6PGbaW+drJsTQIldF+/3vcaGm55Sxi60PzUmpwVIidEQTS0xjFFpwsfvrPSSttQBJUV3D
	XhiyKsEOTcBxLAngqOjPqqrAE/oCpI5cb8mP7PIphmfBeuaA3s6CiYdPS8GbkKT3035KmiOBr02
	zSEOQTOXw
X-Received: by 2002:a05:620a:2416:10b0:936:e18d:763d with SMTP id af79cd13be357-937394328ecmr108390185a.8.1787262147009;
        Thu, 20 Aug 2026 14:42:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2416:10b0:936:e18d:763d with SMTP id af79cd13be357-937394328ecmr108386385a.8.1787262146672;
        Thu, 20 Aug 2026 14:42:26 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e54sm16782055f8f.11.2026.08.20.14.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:25 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 16/21] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Thu, 20 Aug 2026 23:41:45 +0200
Message-ID: <20260820214150.545737-17-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a8774c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=vvBRGx3AIC5YeKHJuXcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX6tABpJvcFOU/
 teW7fum48OXdhV62hMcy/MOANCPU44s3rsCKsigDUEewgRcgm4yBCJk0wAGsMFAKnQMmXIdgaq5
 xR55uYdh8OmNhfgSSEtFs8AQwtlADuQpwQnfcaNKR9KhMeiCePSQwGIxQNEwM6xLnSUjegd6dmC
 jSHlxJPSj9oGxV32taRZGivVlDf4BeCDcIEgvhRjHANu//DP1eH3zWxbNyhLsyJhVOXEGQJX+b+
 1ldTYai4ZKmUZnthkkYoJVygOHvvzrCL1SwLgEJkruzgciev8vhNbym8e+WPbxc6hN4Rw3UuGfu
 lSk5BA1dVOFr4q//xgKD5JJ55ShtpTy2sfh6NDYFp9NoSn4BzNP1AWgy5dDXjSteUB5OAuzfNf5
 ixvaWh6KjFNPA3igq9Q4D3xYMKlGcRD+XQ2e/3AqR4QENsSY9KB2tpbNCvrg2oQnsD8ztwMXRCY
 wa61m+6s1xz3aQF+UsA==
X-Proofpoint-GUID: RbAHlkqCkqFnmKl-oyHDmGuqVFPIGKfC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXzoE5kmcoC0nZ
 ro3fnWaQoCJHl0OmuixN89nUvylhT+AzKa/FFZn+oHhZldsCxreNOQcw7AcTTk3DgNPJBZ9VnAM
 8L2PVyMQTNlaXQyiTlBefhtUHMPDd8A=
X-Proofpoint-ORIG-GUID: RbAHlkqCkqFnmKl-oyHDmGuqVFPIGKfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_224230_383801_8CA3FA71 
X-CRM114-Status: GOOD (  13.53  )
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
