Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA88E9D410
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKgqhCxSNQHLXzOnsrUYkPPeXJI48M2e5a3Z6l4bzzY=; b=GQLBKZZ3mOpgL6
	9+wxnjHg5mZF9Wd7gbWlgg3/o5FjZqKmAsLJV3oc3TtRRHRHmS2tZpYFwusR97oRnU/iqdfObj3WT
	ae9txvD4NN4PDhYKzJDRoHMyYhjThcFX55xmSgp7lss411LBryt//GMKAD03FepRWzKNnxPNSt9nd
	acoKhZ+PUPcmotavFY+1pWZ8tto9ClPw/K/wj5yus2+bwesg/zkOV8tPc/0Ua6zDQm5otJEx0UDLV
	zW0lbDp+QkyUo0zFU+zPkWrCgzZkuDC4IkyUCUYgGImcGIvIeTBCnoQD2V6BzRoDUvnHSryJvpNo5
	CMAHHU+MofjOwF+6XQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfnw-00000008lHQ-0zPu;
	Wed, 04 Feb 2026 16:32:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfnu-00000008lGt-0CMQ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 16:32:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIOZE1032392
	for <linux-riscv@lists.infradead.org>; Wed, 4 Feb 2026 16:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ot0UHj52m/IAOkUIkudhskal
	lh3JrxoSMHxt2SdBTMM=; b=B1AEzZ1U9pPgEWTPnBotUvorfF4OHQZIz8ESDF2i
	iGWhYvGcDsS17S9D/f9yBZZDHmWo7AQcBa1dH449yO1PBSzvtsBry2y2rLv9rE1M
	VsLvJhuWq7GOQVHT/VAFB+5T9wzMMXk0dAWXH+U3tsO0j6Y5OgqBPhm+ciSJXlme
	D0mXt2T83yUhl0tFEANOTD+6eV7mwwQ3Awr/gWLeMCGBx+HibBpWzyquhuBTBCpq
	ud8UFJCOGoyUjkDTrDLLZFmB1HDDcg60e1O9/N1XF09eBkYONjJgEbbjNAJIX32f
	EOCKp29yLl9MpI1W4Yj4Sa9xBPYdNUj/ayZjrIsB8MCG0Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ne7v1mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 16:32:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b74766fae7so8227432eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 08:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222753; x=1770827553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ot0UHj52m/IAOkUIkudhskallh3JrxoSMHxt2SdBTMM=;
        b=GwNp6IVXbwJTAAnnZmqX3xyYZSXtPzDg9QI0Igwoij8fVoj/Wfmncj3lXtGL2F/mXx
         DOiABCbn+8R+4Ja9PToyTQ1lhrw0nRRffNM9xLoIWEHRXXjWR3YvucBq6w3YHBXUDUQu
         S2eqE+sT0/FftFKcaJthdbfGE1Z9+YomdxcutxI1ik38AaCF2szhaE9k9hk0ZmdnYCIV
         7lFulm5MvG2OZqhTMrF5aQwYxLg63sqBouim5KuM272KZbwKLmt3ZBEH8j2gC8uVqh6Q
         ERSjcfGdWysm1EVf7BYOmgyIzv2wIBhfwnxCWrmQ4+S97rSMStXZGseIwfhGVJT3X//2
         gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222753; x=1770827553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot0UHj52m/IAOkUIkudhskallh3JrxoSMHxt2SdBTMM=;
        b=o9391FS3ocQi3jg+WUd0QX3eWH5CscoV6gkveV2/Jgd0F1a/939wOZylVjuxdeEDtS
         PIa+P2GzSK/bPeXndSsCMQ9qwtJlMgZVFg8YsqDJPSxTH6SL3Dgl5yXodBlfPn1HLkuc
         NztKoqIQhF+yyZIZeYFIYK4F/wgzJNUWHdrcsBCpzcfP0h0xDjOMVgaH2j92Cvv8t785
         16E4F8eISJebXZ+4340HoWVkqQ5s41qGEHvJd9V0hfswb6WzmLxWFgnqXkX1FJNPvGeG
         0VlBfaXYkLhxMnDg7Se080uDEjb0xDcQPQ4mb1UoSa9AYP3Pv241k4dZ1V/mXZoNAKNh
         FSSg==
X-Forwarded-Encrypted: i=1; AJvYcCU/xLkS51GjIHVfx9k0nT7RaocAk+a9+BIk8Q8gePov7qaB4BaTJ8X3Sf374nuR6k0aTu17GsmL/d5TCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5mGHAoG9jnhS/cFDH2N8KMQSBOB9qPBrhsCU4KAlgX1ez0n9a
	xMAZG8vDm/8blgRJYa3S2M7GuDkOVwbhRWp0f/8dcEhXGI35LaXKv+dQkW7u9jn7IXprawf1XUc
	/ZzReIAxTNaW7fzu8Um25sidnPCBa/txidKY1+NS7zrPAejHGIYVfl4ZZcYA+YyfkNT96y/w=
X-Gm-Gg: AZuq6aJsdziE0K2Z2k/31Ukdt02CtmHm7Afq4Zk8WIXhHAAjj5PpfYJ5swaFu2E//Ue
	S7yI29hjwGYJiTa7LXvpLdecTg2/p7DluzfyZkNsRXDyGQs/PUWN4prfvxBAKeE03O6kR2b2UfD
	zXwN8VlmQJrLjc5fgEsA9GTeVtkheL20fDMdE0C7B8qIfCWy4b8JcYZvcv+NAY3Dpau/Garpf2Z
	yqILHRYoSnRum/J1CLCWh4hWHZnacU3VQcnr0DCn1So/GMak42njCNT4MbpiZ1os8cB91NO/lDU
	HXJ/ddq8U7B+QpDmPnxIaZH2X2uAmoqk9uQr450uvIv8YTmSiQY5L1fUx2aJaFmopf6KygRBgxh
	v6Nj9S3n3x6s7HuLjgic=
X-Received: by 2002:a05:7301:9f0c:b0:2b8:2748:1337 with SMTP id 5a478bee46e88-2b83291a20emr1556947eec.7.1770222752733;
        Wed, 04 Feb 2026 08:32:32 -0800 (PST)
X-Received: by 2002:a05:7301:9f0c:b0:2b8:2748:1337 with SMTP id 5a478bee46e88-2b83291a20emr1556923eec.7.1770222752116;
        Wed, 04 Feb 2026 08:32:32 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fe59fasm1711886eec.34.2026.02.04.08.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:32:31 -0800 (PST)
Date: Wed, 4 Feb 2026 10:32:30 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, iommu@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/riscv: Skip IRQ count check when using MSI
 interrupts
Message-ID: <2u46b5uue3jbim7u5c5p3oi7pgkq6vv2q7w3bkzvt3iatwredq@35o6g2rbyheb>
References: <20260130065420.16811-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130065420.16811-1-guoyaxing@bosc.ac.cn>
X-Proofpoint-ORIG-GUID: DtlBOFPyn6ovTZF11RFcJ6ReBOJvVTJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNiBTYWx0ZWRfX7dQhaBG3heAP
 RJF5zxovsWpWeoollSVGhD/GiA/2/dajyG3Eeo2U2D1RE+GUBHBrQoBrdP11uET1xeJz9Uif804
 /p/cWDKz9OzStl0jKLxBcMT/7cia312uBS615FhaB7SBRlMVIx8Uz7xi3Nv/uLftjRhpvzUQidh
 X/QwzOb0HQ3CXA7EYzTJlPi7P4SBUUKTuysltDrTgeJRLaM6GT6AneU5au3VAGQ/bAKxOrhs7FX
 j6qdhdckNzJlU3Xp0M9FeyetGAeJ9FAnkUALFYQnOSrPn6QlbI71qCR6HDgeAK5QHVnTo2vMIs/
 IqgLxnLzGynuwc+5g/7HPcpcSm1DqBgfEtBta1YRz0Bvn7fstp6zHT5LullGpr+p5HZLLXI2MI1
 0Glj9VCA4ga3DkaA+56DGHSJFViDJUDWj/lRUkUB9ZxTjIz+pE8MYLOji1DcpAsr74tYgmdZOiB
 9ZiuqJgaLs77NvaTfsg==
X-Authority-Analysis: v=2.4 cv=TZmbdBQh c=1 sm=1 tr=0 ts=698374a1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KTr5YeW84r-woyCYTtQA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: DtlBOFPyn6ovTZF11RFcJ6ReBOJvVTJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_083234_089923_407681CA 
X-CRM114-Status: GOOD (  26.39  )
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

On Fri, Jan 30, 2026 at 02:54:20PM +0800, Yaxing Guo wrote:
> In RISC-V IOMMU platform devices that use MSI interrupts (indicated by the
> presence of 'msi-parent' in the device tree), there are no wired interrupt
> lines, so calling platform_get_irq_count() returns 0 or -ENXIO, causing the
> driver to fail during probe.
> 
> However, MSI interrupts are allocated dynamically via the MSI subsystem and
> do not appear in the device tree 'interrupts' property. Therefore, the
> driver should not require a non-zero IRQ count when 'msi-parent' is present.
> 
> This patch fixes the bug where probe fails when using MSI interrupts
>  (which do not have an 'interrupts' property in the device tree)..
> 
> Fixes: <d5f88acdd6ff> ("iommu/riscv: Add support for platform msi")
> 
> Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
> ---
>  drivers/iommu/riscv/iommu-platform.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> index 83a28c83f991..8f15b06e8499 100644
> --- a/drivers/iommu/riscv/iommu-platform.c
> +++ b/drivers/iommu/riscv/iommu-platform.c
> @@ -68,12 +68,7 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>  	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
>  	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
>  
> -	iommu->irqs_count = platform_irq_count(pdev);
> -	if (iommu->irqs_count <= 0)
> -		return dev_err_probe(dev, -ENODEV,
> -				     "no IRQ resources provided\n");
> -	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
> -		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
> +	iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
>  
>  	igs = FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps);
>  	switch (igs) {
> @@ -120,6 +115,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>  		fallthrough;
>  
>  	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
> +		iommu->irqs_count = platform_irq_count(pdev);
> +		if (iommu->irqs_count <= 0)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "no IRQ resources provided\n");
> +		if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
> +			iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
> +
>  		for (vec = 0; vec < iommu->irqs_count; vec++)
>  			iommu->irqs[vec] = platform_get_irq(pdev, vec);
>  
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
