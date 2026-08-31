Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F83C624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SizIzF2awZxsEgSGviHfFD7OP96mf9FW9YhqHBWbQWU=; b=g1ZSQuJg8sg3z7
	F6Zq1H7bOSpObClEEnX2R4pVOceL8l+qxj1mwngoblgkW3Dmytvsw2l/C24XUdGBBQ8Qi6JBTm/3o
	7x8piSb4OL53L9j/4tfRfUHN8OB6IPA7+bxrb6CFlpQInAPL04jpYqslwMSVItqTbJbZsKme0GWOA
	Qt7r3sCaET0a0B+mjE1FrOgO5Y+HwKHneg7A4lSUsDGD2t6L9GgGLWTX2eAlrrk8Nz22hGkSMZZWK
	bbZu83cuRxmFqquHY+IEj/Gy3KF6ZCTJDfi6kvVOY6pc2NlJ2oOehXD+G9NmyT5nPCisJ/wvE3r1O
	xpoZETol3QNgOeCj7BuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Un-00000009l4f-2B2e;
	Mon, 31 Aug 2026 15:00:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UZ-00000009khs-2IJh
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETbCj4049761
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z/0MUXfJDNe
	HlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=; b=FJY+UZ5wY0Pooggdsd9At+BbBAQ
	Lp1R9dHZfYhnMrLjazZTQTXXwd13pRpgl/GN0BiudGNYxrw9VJpGYA4/YN7zt+BP
	aoo3n6IhpIxds9ukDfa3Sy65BuHW8PBuOBZZoKTkzKymwwgZxWhkpPsQJudLB+hX
	jYhqzb9rpHN2MJ+JtRsxBOLlSrh/I93wMoGfQbgpJCbBwxtANfeHpX1GK7IZhdSF
	DT56QYgg5H6tyR14AvzaAySlrenn2x2hcYYQ6bm62wz2pEs6RL6l70pKoxfbbSFE
	i1BL/AkVHtlAYA96jrfouNy7xxL2zzlszBLikRA8Pb5ENI6VCcUbT2hdxGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jghfyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so599915185a.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188409; x=1788793209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=jGkwWB7SsQQT8zKECiYH34V4lcIxiz7HytQ/0/fTqAaqA6atTOCKUZkg3vEiCv4FPF
         x1LOqL/bmNHku9uaPDngQuN2aTCLcYveKR7PrGxw/Bu2XEFo6rcFBk4G/DtIYDP5awdM
         fHLAy59xGICd9j0NDNReJC60yF6a4ry/DzvX9RlFGMkxFR/K0hKMONNRf6dV9tu9tNcm
         FMwd4dG7OaH6q02P1ERWWG3lFngbTQgLhZ+C3BxnSi81bJ5nPEun7B5Ck+iRoJDJ9D2z
         MsLQq6xztijxOuAE7V8TeVUoB8ekAxzpP+BINhfSpJU0zN+5CNEHW6d30NI+639srA+m
         SURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188409; x=1788793209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=SB0gnWOlqil7iDdVCPlOJxMSUApMoHpSQS9M2Rfe8JBU9zSIPwHBUpLum+SPQg/aq2
         3I4cEd9e6F86AwGKsDQk32DGjwDT81wDCg+U8mQtvoZLuxWlzQBEG+DpgL9M8/fkBqwE
         2gVTObL3126ju4sR/Y1c8Nas5ODDRnPR9W31dRGi2BnutbH20aTE5uDErUwI/Av9BYoK
         5u6RnZ0th4ygFXyuuj7wkOz3tie0zB/FyFz0sAKAWp+0EF03reIrwCUNtdLp7zv4j1av
         zYoxuAFDBSNey+6W3pTEG/9vukCnmNL7SJv6iQcxtrysWf7/4o2CbUtCwGwE9bcz2G6z
         /wSQ==
X-Gm-Message-State: AFuF++nrNQzOH8SEYnqIWWgWxSXIr7gcELlVjeqRISWjCmTXwlk7hgcN
	nrtxWE/t+rx16C2QJxlma5ehwC13Lue7RS4S6rugSQU1ESzJT8EPvrh7yhb8UefY7Dqfb/N7Ahb
	7v+datQdwK+N5AzNC6hNMMk3VwLajyXh5OIJjbFwq7BQLyHGHiQY0CkwfimrTVN4pIpCVYdJyDL
	yc6qc=
X-Gm-Gg: AR+sD12VsJhdQPzBqUNN134/xMQWWML/xsnCGW0N783EbFOb8BQg7KEyv40r8zsy/lk
	UgDwdusRN7SzGbQrA8GCqdQxniHZCQLwGQW2lCm5Kdiv4B/zpb4EgDjKzuPY/o4hYXKA4yzJBpE
	0XhZtW9EZ3IoWXpWdJssoYYft6DlBYDunnvQTsI7h4Qp3YQwWrDRo62pWWNW7ilen7V+vn1jjdp
	9ck2f6KBryeU5O0QMsYIhTpFke8FxGa44hVFKP/EiVoxfAbSmGmx3+TrKTm0JU0PjmTEJnkombo
	6fxWehYuYGQh5HuzplH/hShaSq0JXAGjKgxodDOFl0+/1LfNIkvaYJKMq/gNQHmE0gvCDUf8hfe
	AeXZcvS68VaDcsqbWkyYIISyAkxMyY3rnMdw=
X-Received: by 2002:a05:620a:a404:20b0:939:365b:37d8 with SMTP id af79cd13be357-9394817f9d9mr195744385a.36.1788188409493;
        Mon, 31 Aug 2026 08:00:09 -0700 (PDT)
X-Received: by 2002:a05:620a:a404:20b0:939:365b:37d8 with SMTP id af79cd13be357-9394817f9d9mr195730785a.36.1788188408868;
        Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccd1e19desm252798825e9.1.2026.08.31.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5 14/17] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Mon, 31 Aug 2026 16:59:40 +0200
Message-ID: <20260831145943.313726-15-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 0V0IIruXc445u2nGkqdSZVvHsFEAWaxe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX2LwU8XaUF0TN
 ny8n17krg1L3CbbzFbQaaB5Lugy37Cbbc/QPhf0zR90GBlHl4MBTvds87lwRTo0jN121wnzP/NJ
 d5/xQ0ezJNsnCnPZYCdOZnklSGil/+g=
X-Proofpoint-ORIG-GUID: 0V0IIruXc445u2nGkqdSZVvHsFEAWaxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX3z0an98ZK/bl
 tAZILbEH+c8Ol64onA7FIKtdQGdjwUpJ2WFbaq7+vglsSPyubgXD19YRNG2Jwz8jZdopEpvNkSz
 J4Pwr5sO/+vji7R9VcRYohMuGzyfrOe5tYrpD8nppBO8F5jjWZqHG/fSQpFskJkVKDDsLVkGHsC
 XQHV5yBxxFCLmIo1yiMrG85aNlpeyJp7rwi2mSu/nejsqVXB8vszqQenPFjrWZlaPdG42UW8AgL
 /+74Mrpo8yhMmInaMLxJBd4T5r4wTYv5yPsPrhrezsZl4hy9Wfxrx7aJA2iwi+s/t54BrVpbOVp
 lyvjWpbZQRMUlKogdTeKiqJlsjTWSsyOC/eDSXLzKCkdRILo+WiGbmNWYywBVjCaemOURVFqD+/
 xNwdN1eVnesTmF3RRf7kDASumMV1YHEh7k09hEtmrudTogbTj4n+5jUAdQZGY7mGvMS10jerzn9
 aBdgcayY855a6/K7CWg==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9596fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=e-vb6wPzIjHU0Swrx_MA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080011_890044_6DE09F7C 
X-CRM114-Status: GOOD (  13.28  )
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

Enable VFIO support on RISC-V architecture, now that the RISC-V IOMMU
driver reports the IOMMU_CAP_CACHE_COHERENCY capability VFIO_TYPE1 and
iommufd both require before allowing a device to be bound.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..ad62205b4e45 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -39,7 +39,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
