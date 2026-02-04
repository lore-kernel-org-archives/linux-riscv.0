Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30484E9D41D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2s5w9AoyGPQeW7OXU5RTiFbtsDDL+e2upmvWFzON3Q=; b=K/MGHQx9aTNlJb
	f/PRyJgk3YclwxR+y2yXJPN4tI1/UYCykQ4lT4B8X2/ACQuL98LQQe6rM39jodusQEoWfKMtrBBWu
	w51sJt9y+N1JGIYPPj4K+I3k3frbWQGoxP+tVYUoGqgvKHqH05r50GTbTbIWeDkBwT4u+Y7giHjTr
	dNjd8dGWxalH29QnKlbmthMf5slR8WiF9zBW6VUzp8fQcx3Q58hyQUfK4cMUClTy6tddytWs4zylk
	8zrwcH5GA6XrNeJPrmIA7YJGohPS/i6dKsabwCRKyFE1Dk8f4nYDVjdmZBIvY7C1zOhUTimBFZHl/
	RYCa9zNZi0I/iPMP/NtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngXx-00000008qYL-35V6;
	Wed, 04 Feb 2026 17:20:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngXv-00000008qXz-32aA
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 17:20:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIZNp1246521
	for <linux-riscv@lists.infradead.org>; Wed, 4 Feb 2026 17:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VqbAWXuLedjCbn8BYtmfIasp
	H5UsLnVKguhalwtG8iU=; b=RFXJtpQsyEAGCCdZN+tDGI9L+WnvNuqSXFUPk8L9
	lcAV8QvF1PnH9HeHklAPrbDeLaVkFNPfY8c3UgGUI4EC0yeA03RXXmCLgORfy3hL
	KVcJ1zFrs5V+FeyD/jJZtLCaSnblXlrD/e2iMwaTWQ6/lZmbkG2kbAbSB/OchxCI
	rAwqTIFgW1q162Z0LnS9X+2XxBK6yJHYZIqcYsrFbSulI6tRip2YEyjIv508+M/C
	rSXjno9CW8ddAYdTBezoBmT2oNQlpPOMcuxD5OZGgKECkqFnWF3VdjpbrdiIBtQ6
	Hd2zFwgYsoabBkf4R4ISsr6e6dIDNZ41PO5UT6mM/Ohciw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru9be8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 17:20:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a95d580cso690257c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770225606; x=1770830406; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VqbAWXuLedjCbn8BYtmfIaspH5UsLnVKguhalwtG8iU=;
        b=kh4EuPgd0ECx/sl9USj60a9IG4eVqDdTAtvMmEctUfgkcOS8P5S0wI9vTDcJv0ng/g
         MIEZKOYKLQ5FMiz+wQfTctZigW7EVolUh2jLR2UOMAM5mgyYewjWJhMjicYE/VXXflg2
         KJtXV3kbR81TcbriofXXPj77DJ9Nm19ckoeviePIpdPcdbC+0DIEdypKmA/71EkFAYIa
         ZaDDOErtF5NeTMhHQ8ioGEtYaYIRAXC/bzyVvaPiPcydcA6G7ORWB4aUAka/izq5GxqE
         ZOKNhCKuNxLTEFrxHR887FSlc7u45UzqcA2HMvVzBop6jJC4WpRVvCAMQGq5dPVwkvHf
         Q9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770225606; x=1770830406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqbAWXuLedjCbn8BYtmfIaspH5UsLnVKguhalwtG8iU=;
        b=aBzCmuEosMp0ppqqwqJXopq0ishCp229KbByWQLn6m953wP1YFZutaPIZWoGf6+gY1
         s3U2ybTpCcs0+rFHKZml+XftaYyPKWt6mZzL2jN8WjiLVT2IaBXCVb6/wkldnfkPAb4x
         V6SkPCLkdG9WI7zCvih8ICz+3YnvW5H6LZEnciEZHLpKXU3ZI5FSHbvfyMvVJlmyIcSo
         oaA18le5Pqp0qD7IHTEZxav/YAibbn5QIL9rR1N15Wu1RQE+BlZGDWEWTS4xLt4LGn/T
         GXmUkvxCs6WNHZIf5DTXAjsTClJhV6o45EoCuj1yadP5SQIsOesM5YQrW7P6ds0n4QF7
         OiUw==
X-Forwarded-Encrypted: i=1; AJvYcCW8CwXurGlGchoGEaVm6nFFbXU76Ys/L1vFVK8A0+s+kcPBs+POlP5HIq47huMktur7U0XF1Xwn6Zo9rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLTpMN1SyCATpo/W9wleUWbk9bOl2oBV+y9bSEl5nI4a450zIo
	lxv53odqMsiFZDwXp88NkD12mIUvhIRRxnKyhQOrBm6Mic3Xv1VCBs8xOUTdU6rRmEgk9wi6R0W
	hCetU0f15tagKNy4UNpH1qmkuZ8e/FgtyLSFQTQktHYHCWLjh9xKI21T9npftlsEg2ePzlnQ=
X-Gm-Gg: AZuq6aKyhgjkA6xY8dZDaIhD3Q2W9hKn7U8sU3Tj6bspNx+Ve27vLOPFBfbDD5zZhuP
	G9Z+v6YWU/JaZPQJcK8JSAsMtwNGdsth8JUlmbjVDjCDEDhtjxq9ZXO+C3UkeUk1YUXf3Vhafxh
	RoD271m9b9egfxWvnQIw5tK01lTpBE4qo/5YtZKWJ3huZt32GQz8RABJAZw5vYNaJdAOznyhfRu
	1TLzyZMk4u/r+tczM2HU3Yuv28TbVA1h7j+X/ohfdK59AKEjmzaldjlKvGUu8+1bhZ1MVCxz/Jt
	ReDwTkso1CLDBfaIDt7EAhihbIwTHjKnwTx2DdN6gRrCLvDpZpPED67CnYw/UUipEwpbWFR3KJT
	1oD7h3h3DzyoV8elN7+8=
X-Received: by 2002:a05:7022:69a2:b0:119:e569:fb96 with SMTP id a92af1059eb24-126f4771f0amr1691833c88.5.1770225606336;
        Wed, 04 Feb 2026 09:20:06 -0800 (PST)
X-Received: by 2002:a05:7022:69a2:b0:119:e569:fb96 with SMTP id a92af1059eb24-126f4771f0amr1691793c88.5.1770225605519;
        Wed, 04 Feb 2026 09:20:05 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e107b4sm2433926c88.7.2026.02.04.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:20:05 -0800 (PST)
Date: Wed, 4 Feb 2026 11:20:03 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
        Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/8] iommu/riscv: Fix WSI mode IRQ number handling
Message-ID: <2ueryrki7uzpjn6rbqz7scy46sjhw76jjilddz2naslz3eyfdp@ycwf42eaw5yy>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzMiBTYWx0ZWRfXzhYuM4UozqPP
 3LOK01/4HGjp0ChGGLQEEe1ASwxIvCPONTAStSxc8sQCfWBXJNvgmgAmxEw24vBcmawV/A8hoMI
 qgajB8+WreBVcfr7vMzLlaC9Wt2ubnwhj4Ib/YQ4OGEmqxjE4pKjbjvdWLWlsjP/aS00jrw/zQQ
 XnpBAUHZFTyr1phbKW773Ve+/LiFCF8wCJKEbpGEafo68ohZy2VPA8ut6bPZn0Czoqknl3sQu6Q
 g8eHv8wuqryJAM8VZi3kObxvJE/1QCjCva6Gy1d+5kE5AO5ch/Wj1SAf0R60oySqmqyiUGB1xfY
 u9BFpIaEpmV0i1seVwJVuekjw3xL5LeB/d3CRuZifdYr+90IatZf1rPf4As+bQlARdS72Wpv/ej
 OzqgeIsJU7m0fDOtBzcafmGZCsQkOBAFRx88yaT/o5DKwrQutUHbUiqCYvBKgaD1OwsJCVP1RA0
 eD/AhEgf8cYX94nvGoA==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69837fc7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lv0vYI88AAAA:8 a=vzWCA-T3srDMkzUxSWUA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: CkerXE2nYpjjAEKyxFXDwIrn4_rh28L5
X-Proofpoint-ORIG-GUID: CkerXE2nYpjjAEKyxFXDwIrn4_rh28L5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_092007_793062_47A02698 
X-CRM114-Status: GOOD (  27.27  )
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

On Wed, Feb 04, 2026 at 05:08:52PM +0800, Lv Zheng wrote:
> From: Jingyu Li <joey.li@spacemit.com>
> 
> In WSI mode, ICVEC doesn't exist, thus reading it returns 0, which
> causes IOMMU driver to fail to find IRQ numbers from device tree
> IRQ arrary. The issue is fixed by applying icvec indexes of WSI IRQs.

ICVEC always exists, however it may be hardwired to zero when an
implementation only supports a single vector. But, that has nothing
to do with whether wired interrupts or MSIs are used.

If ICVEC on this IOMMU is always reading as zero, even when 0xf is
written to it first, then it should be interpreted as there only
being a single vector (or that the IOMMU's ICVEC is broken, if the
number of sources is known to be more).

> 
> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> ---
>  drivers/iommu/riscv/iommu.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index d9429097a2b5..26630979473b 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1593,11 +1593,26 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>  		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
>  	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
>  	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
> -	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> -		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> -		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> -		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> -		return -EINVAL;
> +	/*
> +	 * In WSI mode, ICVEC may read as zero. Only validate if using MSI.
> +	 * Check if FCTL.WSI is set to determine interrupt mode.
> +	 */
> +	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {

The behavior of ICVEC does not depend on FCTL.WSI

> +		if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> +			    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> +			max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> +			    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> +			return -EINVAL;
> +	} else {
> +		/*
> +		 * WSI mode: ICVEC is not used. Set to identity mapping for
> +		 * riscv_iommu_queue_vec() to work correctly.
> +		 */
> +		iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_CIV, 0) |
> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1) |
> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2) |
> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3);

It's certainly not correct to set iommu->icvec to anything that can't be
written to the IOMMU's WARL ICVEC fields and read back again.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
