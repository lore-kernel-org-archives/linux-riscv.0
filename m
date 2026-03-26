Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4025810A62EC
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnKX2BDFUIgIB74Q5ISPRBIxRDbqW9nJZ8sQWeJzjwY=; b=DOrlb46f9gR7N8
	/jP25aaUUJmJCp4aDzkGH+PPslFD9lZHAasX077L9iafTI1KmPtvykpuadewdEZ9qXF4Cexycb9DO
	RDp4hYbt4NJ/O5hjabR/tVryZQbXJ6FakevFe4Lz+RjaaCpf8H+ubm12ajawIPEW9/AI0K72+vpV+
	KCxatRlC4IrO1IWB0+Z7u6JRxmn7gUIeCVfnRRl7LHPM88aCNZE/4yyGH51veIRLHVwPV7lAoBleS
	UFZETKPOjNwz807hFBnQnY52VRu9Hv7//urSq+iVz7S26V4+CXLNE+2IdH7Z71fvgDgzCokvg4gmQ
	j84qoJ3SvvXdDUX7juug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lxG-00000005gWm-3Hew;
	Thu, 26 Mar 2026 14:45:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lxE-00000005gW1-1LqI
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 14:45:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QDpfUn1062081
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 14:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uxtqX+2Sa+UgYY4ebLPGhmky
	vZPNVWpsla1fGk5MZhE=; b=CiXxK5JKF3OZ14GuzJBbr6yE4ihdaDxZi3L+BtkJ
	5bpxKgnkUa2J75IBzbac6Hq5Qg/+towG1O0Oei5EFBNZFjIC61WcIJT7aouhvVp6
	2iDSxlf2nsycoqXTYgjbCChKPYs6oAKO5eRUNIqY7BqNMyopLPEmsxGvktp29iZA
	OsIl+ayBqzKLT9BtGH2Ws+RAI9fNly23HJcvVaW1R4GjdFi0VVrl/l2FEmwKoU2p
	7d7NGoNVi7MZnbFI03tM/6riy9vgYrtDVi22wt8f0dKDkHHsvRFRBpZue80g971C
	8Yxwq0uAoZ4v2bOW6UlJ56Krl2aUl5V9NsOWrTNwz1+Txw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksu2w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 14:44:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12711ec96fbso4753253c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774536298; x=1775141098; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uxtqX+2Sa+UgYY4ebLPGhmkyvZPNVWpsla1fGk5MZhE=;
        b=FlORoiyByrbTVjiYtb+vKZS3JsbUkNNBZz56T4h7nIw2HO191VPXQ3uzQfrg4s2Rir
         Tp0NItyBuACdAfbVtKOT4DCdSmgG0w0LDnMCBNQMkl1GaofZGsCxv5loYouzaJeeKg9K
         hp2bWOb1Qi334ruDeLFNZO0FAnoOvZf5WT+0PlwvXtVv5dsz5lB9K8u8fE61HtppMYsq
         g+l4HrHWThYURgoinyNc8SoWP8KOKbnLUXHhXDKOeVXGIw92zdtrHs/eqCC+B6PyTe/m
         N+kQ2A4DBOymq+oxjHlz6d+i7wH5QbnDU6cj7V8+TeQYpxKYww2f/xpKOREWaqE7e51F
         fThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536298; x=1775141098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxtqX+2Sa+UgYY4ebLPGhmkyvZPNVWpsla1fGk5MZhE=;
        b=sNMu8YHRIq1L2Ob5benI8t82OlaVaHd6zkvzi1cYKVHI5mxN7do8XOvqD+HR/1cwRj
         lfRnSkTd+Cm+X+/Q1jwfcRr4k7ys7j+2ugBJiPpk42/5yR1NGTdNqcuO3VJ7WWk/YCjN
         AnhYdcXrYdcvI6u96SrdTDoVl5TCz3+iQBer6FiZunuXRJ9EIpWhFx7XqIN0XbF9xSE2
         JQfAho4MMhOZrtB40G0fobFn60vT5DQYFNjskTi/Kwu0wALaGSREkOI6APFDf1nUrhZT
         VTpARADVI81YYnLZx8SxvcIDZ/0wBGv8N6Vq25L1soGxx4cHmXvjGW8GI5ILDWVV2PqU
         DjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc79IIcnXfqDf0k5WxuS6b+/fFfy2uI+9EXFDOwSMyo5GEMTZaUSG8/aAMDgPQTjlFaktv4Pgq8mwt7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YywxJebey9KpFNfrxVQU0iJzjEW5Soo8leF7VC56XyUa7glLFj0
	qAMuGXT1cyGblc/HYbz+FbfJrHH97u/UbUSuP4Mk5O/wS+n7sZEXhG+823xqj30UfZVxDgw1QsU
	XEWXP/a/2tFwUs4ZVuOPMjMFEK6DSq0DDG1A2P4O/Qbco8CymPT0JenTRo3NB5fE23ySKSAw=
X-Gm-Gg: ATEYQzxssWRlKtaSVi/m46NpmXEbvqRrIupnD35RRMoqlrXYxtcVvU3tDNqQOfgm4w7
	/Su+B41oHyl8QVCkAXIYwGSgMA0/D5CSEbfRl77bjTPs3O0pzIMxmw2+ikYI/X1OJzn0VOC5AYZ
	B2Sz2i5IADU+Q6nPdtLrsAkLlAhfXvLYmfsUHoy9XF2JRSmeO6UYJLYuBjTpO7Dj96wZuBe0o7P
	WuV3rKUQkb0lr//o/wQEPOOpWgCEbIvyXGvl5Wv/a1dGWn6F5GrYpnWtONyx+c6vF7/+Fw81PiY
	rHt/cUDofCK9a8PbMbBPktjKrbz4usQ4kcLVAtqTVA/CdpS+cXckN1UKUxh2YcOvLbaNr9jqxMO
	2nBlQ3bfEy/x3G82LrGkauHBUE+9tzO4=
X-Received: by 2002:a05:7022:2394:b0:12a:6e97:c1f5 with SMTP id a92af1059eb24-12a96e54c0cmr4783463c88.14.1774536297993;
        Thu, 26 Mar 2026 07:44:57 -0700 (PDT)
X-Received: by 2002:a05:7022:2394:b0:12a:6e97:c1f5 with SMTP id a92af1059eb24-12a96e54c0cmr4783434c88.14.1774536297347;
        Thu, 26 Mar 2026 07:44:57 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec2690bsm3084357eec.5.2026.03.26.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:44:57 -0700 (PDT)
Date: Thu, 26 Mar 2026 09:44:55 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Robin Murphy <robin.murphy@arm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Yaxing Guo <guoyaxing@bosc.ac.cn>, iommu@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Fix signedness bug
Message-ID: <st2exabag2oomhcxuebxjuo6d4qojy6eppipzlhy5l3fhbihqo@opus37hw4x2r>
References: <20260319182644.1082740-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319182644.1082740-1-ethantidmore06@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEwNCBTYWx0ZWRfXyKMZyDCJ3SMW
 rHb3WBY7efXavEhjatSvkwcZUeFYVIxKdqcFH+IF42onFZ+WYTi+Y7IVJ+Wqv3Tznz1yxs23/3h
 kcYX8qjn0h6Dqk2UE/+3vUbRjCdPpU26dvuNhKAqeOEBH97sRZOXJWqDgwB/ljgtT/jXXVXftXw
 0OmDbEwLT2OFzU8Gs7GmAkaUZoXYADz2nxDHg1oWURp9lxH2eOVKd+zf07NChZ85K8aYUC0XH23
 QzliamBmmv3xRCDDkBaIhSXyTPEMptHbf1Pew9Cif1QEQknk9WWmOCorr+OwNDQ3BJXxUkuQg61
 UMkAYt5wQTXrOdQhibtE8BdAftekyCH3MQBWiZN8P1D7BYwSlPqkrnWzRdfLmjXVnNcBeedrlzW
 nFVc3niHawsxeVRaDuzaaJnKGsr8DVfvpUwRSZbvI4PDy0plcN52be1gt1kutjh5OUSl2vpnqgr
 aPNz2drmqenLXosIyJQ==
X-Proofpoint-ORIG-GUID: zNRW31I9hKserEfWvk5v9tVC33CrmmTv
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c5466b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=DlB8HGOmtVza6BL2xfcA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: zNRW31I9hKserEfWvk5v9tVC33CrmmTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_074500_477052_CC69B70C 
X-CRM114-Status: GOOD (  21.67  )
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

On Thu, Mar 19, 2026 at 01:26:44PM -0500, Ethan Tidmore wrote:
> The function platform_irq_count() returns negative error codes and
> iommu->irqs_count is an unsigned integer, so the check
> (iommu->irqs_count <= 0) is always impossible.
> 
> Make the return value of platform_irq_count() be assigned to ret, check
> for error, and then assign iommu->irqs_count to ret.
> 
> Detected by Smatch:
> drivers/iommu/riscv/iommu-platform.c:119 riscv_iommu_platform_probe() warn:
> 'iommu->irqs_count' unsigned <= 0
> 
> Fixes: 7217cee35aadb ("iommu/riscv: Skip IRQ count check when using MSI interrupts")

This isn't the correct fixes tag. It should be

Fixes: 5c0ebbd3c6c6 ("iommu/riscv: Add RISC-V IOMMU platform device driver")

> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/iommu/riscv/iommu-platform.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> index 8f15b06e8499..399ba8fe1b3e 100644
> --- a/drivers/iommu/riscv/iommu-platform.c
> +++ b/drivers/iommu/riscv/iommu-platform.c
> @@ -115,10 +115,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>  		fallthrough;
>  
>  	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
> -		iommu->irqs_count = platform_irq_count(pdev);
> -		if (iommu->irqs_count <= 0)
> +		ret = platform_irq_count(pdev);
> +		if (ret <= 0)
>  			return dev_err_probe(dev, -ENODEV,
>  					     "no IRQ resources provided\n");
> +
> +		iommu->irqs_count = ret;
> +
>  		if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
>  			iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
>  
> -- 
> 2.53.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
