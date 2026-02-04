Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE47EA7942
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5I4eEq9CEkT1ymKQeUVnE5a2PxRGrWgz8OgSchEmcno=; b=cFIcJmxfQeD5nI
	Y/IKuBl7DOgmMKGr/geaKcvzNfdxStQipGgDceSHFAERHaeFrRMC9D9e6EkY5SYj3guic9PbbG1zY
	tq/a3zyuWtgZCe1ZAVD21cn67ijrPst+MZyTQ064FX2b0IW54P9i2KKcKws+g7g3kDjTAsKvo2gjI
	0ohrrBhGRqnxRjw4mqlj64Wp38vxJw0uUk3uUkFD6xUltdWvzKMiWkVZm6u5DhNujCBdy0JUr42rs
	cTDX7AwqcgYhGdCoAGbcCH7nE0nQyZhXsDompnS8LaI8yTWJi9S3n+VpWHx+7fB3dkFpLjGwhtUzk
	A8zyO5Wq+4X3IPD4za8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhn4-00000008wMG-3HgH;
	Wed, 04 Feb 2026 18:39:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhn1-00000008wLk-2eCd
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 18:39:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIVCA2163416
	for <linux-riscv@lists.infradead.org>; Wed, 4 Feb 2026 18:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I1Ej76cz71aZvXkYw99NqdEA
	d6dQhn3hI8uMX6IFc2o=; b=VsWk7wqlkw6gDKSyQDZyl6ZypAYi3bN6sGNiUk+K
	I3gipjoxIWCkPAsT7Ko5OCYT8tAXiBBHRx+4JX7Q4CjA0CU/Sr+pmNZDP71LPQR8
	UTp0eekjVMab+8ODgqgrJIUnEfRXBLzjLK3Vkw8y5SK+rxZHrcoWAFe0dVwi2FCA
	2+ukxmOEiwjdMRACDzBkry5EG1JL3ieU/51HH+cQkBe1bMCbDOxCKCv7qMU029DK
	H3aHq2XTUVxGaN8bD90tNJW8qeGxsq4GLLM1ru44v69RZad7uYLcRElryHnYsPOE
	U7Fh7aOmErfL8wGB6OUd0vP55aC7ltAwrR/T2wLkOMjkvA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvhc87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 18:39:46 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124627fc58dso349312c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 10:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770230385; x=1770835185; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1Ej76cz71aZvXkYw99NqdEAd6dQhn3hI8uMX6IFc2o=;
        b=TO5iboUkaxQzNWqtQJNK1p+3DMqHKE4lbCQRY43xoK6l3XqKpQ2XojJb6v/SZkdX15
         cAl6QrMTVFK75mWZKzRB/peLhgqisIUTHBFM9kf4exJ+i4DKBRMHcMAHhXraf7yECXEV
         qZJeU5qlrWvHy4rYTe9bzYwej8Qc8Apdedi9dj+yUhkC0shqKEAJzz/pOLoFlhc7C/6J
         2EAFvs5nvwxFK4j2qlcKd9R6ZHunBMlahK3/wxB94YBLVyoxjYj6xZPcRsuV2Jca/nL+
         PjQysQn8xs3PecwyWTjIsbwhp7eDaCpDogncB3YYHO8SV3KiLZMGMjTu7zQTrZEHQBMm
         y3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770230385; x=1770835185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1Ej76cz71aZvXkYw99NqdEAd6dQhn3hI8uMX6IFc2o=;
        b=ITsTgIUkxvrydtoIZkCCRZBwees859qo46lt0kFmyTM03YP27sakDMwr7U2H5iBgGo
         dBzzAjD/W5rkPHXIIYF8p5xHOg0KNSa/tyJE1Kvq9StycRVCALJ2FjN+zIRc8LUEvSb+
         he32odH//Qus4rNW01+4O6RpyYV55KyLjJwGoqFfyQ76fJu+0qTWRUsUbqViq6/P2PQ9
         9DqN+cx5ioAiKMeS7zQrW5NOG0n2DWq0cSkmdjo4YI05qTj+BvLWqgWvj3eto9eyiu9/
         NMo6mFFrZHUurdqQQVswnXWZpnFw850eILMqMPALMovuLsm5K0yMx0h3HZx0T5ydTIHI
         NRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4dvUJYnOj2uk2jQcQtR5m7oXyXZkUBo3AzoQtFJTBY6L0dqsvFyfNNGhuif0vcTw+e8JvD548giMUhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz39PedsnKJAEXNeIcQ5FqSFUp16AbntYPuHapPH6Y3MG99ukBb
	1yO+gQpt56E4J6Pb9bvECdfL8VHFkd2GiWh0kVmUeB56OJQxMJNRA44chaco2LjQCzp9qu6SEW2
	Q4fFEY7R7bjFCc6dG30ZifHCufXfFgQKb28JqjS3Wc0oLcybDVqwgpjvf3f/bjRMD8EdoYE4=
X-Gm-Gg: AZuq6aKe4k6AK6Uq844JiJmlAv9U1EPZI1rDWqlEFSlhz3S+vNdUxFpxm57DojPP4hH
	veWinVFY6BNyHYyPdaqKO6S2mDdBWL5T+/MWHS4X9/qYzuOJGMGF//2bagkBO63Tt/J677yh3H5
	Byxd4ryaIbblOKfGo5sAVzH0njq0pGHfjRC0HLw2Lo6rO/BuZ1j35Jsk8HV/kELFPTFaDt7WrAt
	afqB8Lm9gojXzUgrsNqpjWiHvCSItLcjDFk5XlRmwRQZ0csr5d0e5cHGFt+DDDx8ECe0JgvXg4x
	qi5LzpBwB0ubup9zT9ClVnT8i6Y2dstl94CQbt51mwPRrPfGmyyIVmJ3gZ0m6dHHxUUZjxRiFAg
	ekgAW7UuAoHOd0Aq/qBU=
X-Received: by 2002:a05:7022:b91:b0:124:a610:62f6 with SMTP id a92af1059eb24-126f48e2d5amr1318246c88.44.1770230385422;
        Wed, 04 Feb 2026 10:39:45 -0800 (PST)
X-Received: by 2002:a05:7022:b91:b0:124:a610:62f6 with SMTP id a92af1059eb24-126f48e2d5amr1318219c88.44.1770230384803;
        Wed, 04 Feb 2026 10:39:44 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f5030e22sm2666926c88.10.2026.02.04.10.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:39:44 -0800 (PST)
Date: Wed, 4 Feb 2026 12:39:41 -0600
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
        spacemit@lists.linux.dev, devicetree@vger.kernel.org,
        zong.li@sifive.com
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance
 monitoring
Message-ID: <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDE0MiBTYWx0ZWRfX0uAb03q7Ix1a
 RNVJymWb4qbNriEVLrManQDj6baOZrlL8K/04niZebazNT14ZuE693dEFWV/uM+We/heJEp/WLI
 uHmEs92nb3kzN1RikOySGW7W/fku8VIMLnO28YM2W4UVzOOrldQjD4iPrCFPTUZxQCr7GohiBsw
 7nw7wb16eO7s9sXcmnpPlWqEKQP2Qao7GRXtMDFKfHEGYHEDRX1gExXzACHcNly7B7rQubnJH8l
 2aznb10S/qjoRpiE9cYn34uUuR2FL/mvSRqiaC8+NL3XH3c7z2+MQa7hM4gz2DmxxQRZf043JIq
 GDFiaH/faObXWhTY2x2y5V4uORawMDlFiDK2TjL84P1Gn16YZrSPx9FRGnDhirhr5dQKeQTJfmb
 h1J3fI0ZJOwHV2x3eA57gARLmVraIoOA97tgoK+xgYfcaoTMdMsbLqBj/3iy6r+hR3e1FZrIvMr
 rgDdu702r0NUgBi7wjQ==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=69839272 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=NEAV23lmAAAA:8
 a=lv0vYI88AAAA:8 a=ZVKkqgoUvZHFR46stTEA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=oJz5jJLG1JtSoe7EL652:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: PZ1rjLPlDTTESEVFkXQ-K9tzEa4fPglG
X-Proofpoint-ORIG-GUID: PZ1rjLPlDTTESEVFkXQ-K9tzEa4fPglG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_103947_715780_233AE0A5 
X-CRM114-Status: GOOD (  17.95  )
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

How does this relate to 

https://lore.kernel.org/all/20250115030306.29735-1-zong.li@sifive.com/

From a quick skim it looks like there's plenty of overlap.

Thanks,
drew


On Wed, Feb 04, 2026 at 05:09:01PM +0800, Lv Zheng wrote:
> From: Jingyu Li <joey.li@spacemit.com>
> 
> Introduces perf-based HPM driver for RISC-V IOMMU, enabling performance
> monitoring capabilities.
> 
> Note that the RISC-V IOMMU HPM module uses COUNTER_MAX-1 as a static
> counter index of HPMCYCLES, and 0~COUNTER_MAX-2 as the dynamic counter
> indexes of other HPMEVENTS in order to correctly index into IOHPMEVT and
> IOHPMCTR registers that have already been defined in the iommu-bits.h.
> However the users treat 0 as the index of HPMCYCLES and 1~COUNTER_MAX-1 as
> the indexes of other HPMEVENTS, thus care should be taken in dealing with
> counter indexes between userspace and kernel space.
> 
> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> Link: https://github.com/riscv-non-isa/riscv-iommu
> ---
>  drivers/iommu/riscv/Kconfig          |   9 +
>  drivers/iommu/riscv/Makefile         |   1 +
>  drivers/iommu/riscv/iommu-bits.h     |   6 +
>  drivers/iommu/riscv/iommu-hpm.c      | 843 +++++++++++++++++++++++++++
>  drivers/iommu/riscv/iommu-pci.c      |  13 +-
>  drivers/iommu/riscv/iommu-platform.c |   8 +-
>  drivers/iommu/riscv/iommu.h          |  42 ++
>  7 files changed, 919 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/iommu/riscv/iommu-hpm.c
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
