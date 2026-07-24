Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626F9C53200
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4LuCST6Gaq7NGBPyhqs5g1lHWnM5CVA4UohlKBW0gw=; b=cpnEaD9K06s0mN
	3EM/S9Q8Ubyd5gIckkCLXQoPqBhI064axJ06P+QKrCIhK3ylWVXHPmctINkQtjLmvneGZEQ4KjO8p
	dBf03Wsiq4aO9jO3i2PJCru6LTq1wz9bCyRpm5cjNdYoxrSY7PnThxO+39DcihEWLRmd0Nv0yn21Q
	CVQMNkuqgWv4D5p8U1jOvxP9L5asnJHjpdYCahxacLIuRToVWhYzc/ffpj5h9LF67MS2cIw2XSLG6
	549DSZDQeWgkY9tQqIhkuZcPUXma8tVPtKogVfD4yGRxZUmkcQT5NhTC5XC4X6k9aLwQPN3SzMoPM
	8jQ4rLujGup1OXpAa6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHa9-0000000GfZz-07xR;
	Fri, 24 Jul 2026 15:13:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHa7-0000000GfWe-2O75
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=TuBXkkPMlTD+HXucvOjoYUES+a
	j48nhGI27oga9puQyCf6mzOvlLeiQSD8kMcNZpzhjXn+l5TGf/MoD4HQmiK9Rn0Ccj1azfl9XPbgS
	sZu7zjMU5yqnw2Q3NT4IukqhdZ7PAhDpwqpDjSI9Z27YDopsc6n7sqzOSCeZtNCDCEvO8dH8Ao5yZ
	0J+A9cFvsTEX5ljzXjk0a2NqsJVWYMsDRc07Db3OdVY46nW+gnuYeeGV7CrXU4FQ6IHeaIvR+0sek
	puT9a2ecl0t2wgFfdnuHjmuTxnjo0qrWScDx/lfUrLhSZrObHGiUL1hdC+tg/9em/XnqM1b8gWpiV
	5XudKHjw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnHa3-00000002fwW-3GRj
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbIJi3071635
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CZ0/AJS5lrL
	G+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=O5btglzrGJ+cQ7s9v2g3Y5iVbAo
	uZuOFOFT95meGpoi9+PG7QzWxpSZhB0+jy7Vy3wEAVCuNx2Y4RwzIBlAE5ZAvlvl
	LnvytO6at/ABhORaaBy/UGOiZyxxqDUtYo62t+C4E/etbxRHpOetoFxUcCwHQ0nG
	kFPjtbnPik3rzivDjP2WM/Mlcb75uK0Z1fJsR/fmqGwk1g5E+O0H99A7JMNC4YJO
	tgRilQXUQ2K6nYd2nZ8oLgHAMnWv2kh0tWGTXSEjubsOAl0Jh0/iQjxaLtKCxtMc
	ZtWErwXud5+2r+2+DWUvZE0EabXZVWOGFYjvv1L3K3IibC46FP3ovXsoYeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pwac0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so12153191cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905970; x=1785510770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=kbqoZvubAsev5EQlgbtumAUSstW4SQLSxZm5PCQMzVprRvLBYZSuWRz+DTbxT6RZ0N
         HFVtF6H/kY1Z1QQyGt2jnddxCZS2safagxeVgbwi5g+RlvfS/wZaQxKvjio9zNYoszwX
         Cgwq98rr3ZBIoF9xINsELdlhvWxt8ANyQw1SG+bjpLcYgFBvyuFfFMVK/AV3XYoXK+s5
         0aIfzfla5IpFr8BtExrQyNKEWitMdqzqSXYu1IA2l2UqEhHz5h/SocaXIEMxZ+lFHQ/O
         HX9aI5RrMYlEF/KOlpMW2pmXQeStuOodpydfy5C9wDPdVwMNmRdnGrWWsSo/JTLPYzjl
         3sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905970; x=1785510770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=JsplNtOky057MaHJf+Ex/b1e5o4l4mD26Xzq9tn/QQekr2Cm5tEkl93igr3+IUDISq
         97OZBOp96Q7ftO0uiovR7BJVE/dKbntnvq4FR+7H+vPGiEtp40LRbRA0B8GN1JgFLOOZ
         St+1EITSj/31DLiPAaxutqRyq7CUzp1RtIxPQcHYvFk63uHESlIzQ+lbvSBpxKz2izs9
         mSuasG8ctZIoL71Xx88+ecT8TMptbsViWMNqyA+MAe/bnpDF/mCd9ucLkLE2IDR3Ir71
         m3ER0QRJl+Wypr5kJXJSMvCxYzgLbPWPmHvwwGEq0jtauiD3FJdWs+1CYFjVKQpx4BTt
         EYMQ==
X-Gm-Message-State: AOJu0YxySVPb6AALZ2C9OIY9io5Kv09/rUkOj9K3lkOoQFTH3PLWJ9Vk
	okHJbXzBxFRpr5TmnThJRkGH9kxBQ759SkKTWRrraH36uWO73d6s2qqdQNx+6wM+gfvJVMSoczC
	YMJyv4dSbFSzgmQCLTEliYmxIWdhR8LVSz4wv+DLIrhiOZ5sW+4VUYUgPRsgBK421hGAS6oixHC
	MU60E=
X-Gm-Gg: AR+sD11DxbQy8fbULfPlzsAKjLRLMjApF6HuOfFXi8PFWTDMlKNA8JofLkvPsIOEwa3
	qqFeb0y32Q/NNxkjfB0KnFepn9MTjHjlNP0U7M6OX6hDmXAUf9b/XdKIgS2pIm4up8y699ZWyCE
	Eof7NcpiiGNkLI38vLFT+zSNJ0yTzuKF0r/cdCq5Jpv1EIM2gesOYOfm8f4h3wYnnzFXu2H0gyV
	GbQZ33/JO2AghxL+3+KE9knYWzPoq9j9Ol7qMSHLCJaZhp1bDNKybldYtohEh5Uk4abDxF6U2zZ
	oqQMhQGUG0fqMudce8GjJMMrq54HrJ5Dc2YoRlXOCga0hUoMtvLEnNf5xoZs/wVjRIVzYHlJLjQ
	Oz1IuemxrsHzEl6qG8U5L4KXa12p/ennEwBbE
X-Received: by 2002:a05:622a:15d5:b0:51c:f04:4aa9 with SMTP id d75a77b69052e-5283de0ad83mr75510891cf.32.1784905969857;
        Fri, 24 Jul 2026 08:12:49 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:51c:f04:4aa9 with SMTP id d75a77b69052e-5283de0ad83mr75510341cf.32.1784905969385;
        Fri, 24 Jul 2026 08:12:49 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32acb462sm364332466b.25.2026.07.24.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:48 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 13/14] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Fri, 24 Jul 2026 17:12:17 +0200
Message-ID: <20260724151218.965929-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX9HTkikxKbbnQ
 imFFfAuahXp8/NVYWZhnrAPCPoJMLpToMsDGe4gEgU9D3R5MiXqCWm2IyLtCIOGqizRG4rID5e7
 W3Z8RFBSHIs0zobdeTm+B/29N1bPZDoUTe3LpaxzPOl8tNSBHBRRWvfjAwX0US1r8bnv4NOVTM7
 anKEnq3XyNWOm+DJjtPy4C4eJSvSz7Dy3kYRNpopy6A+C0W16kGDBFS6g9RLrIZH8amSHyyULIR
 DyxGh0ccKPOCdBghA5A81ns2A/QFemNgd4aaVCW4TnbREBDW/98BMIW4R+Np1whmN2irX2EFa+y
 vYkl8/oIiFKm+pCVWW78rB/eL1RYWAGA72wrmzHr/dsaWyC/qmDsEVpGaoH4zTca1yWd7maqG2S
 iArQtfQ0iolVIJp+MZSPd7Rfx3K+soj4JKj7fEplcGJ1w2SJpSW49lBvaefDEADDwfhbSD/Dc5A
 AHeJG7I7eUcLSZwTL9Q==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6380f2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=vvBRGx3AIC5YeKHJuXcA:9 a=dawVfQjAaf238kedN5IG:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: QO9Xw_d4_Pb2y3iBmF5dWMprdzcLqwur
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfXyoYfUIupTj+3
 ctWVGr05G6jBfIXGkDi6EKmC0c3GCj3fpS6UHhvlo0Plm8K+yRW4kFxLfUJygNT2Dchy3TOfq1A
 wCOUCkBzdefXh53sMY7Qx9gbvYglTJc=
X-Proofpoint-GUID: QO9Xw_d4_Pb2y3iBmF5dWMprdzcLqwur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_161256_119920_A74F9B57 
X-CRM114-Status: GOOD (  12.75  )
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
