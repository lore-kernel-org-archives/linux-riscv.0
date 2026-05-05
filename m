Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F5FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 22:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O61KRbUOpz5JDMNS6b1zZJiri1NDNk5weV5zt8seuFI=; b=L+dhv3edvzxx0/
	oL8wj8UtP7AmCDMTpCFMGi1kDlTvj1G9JGlIJWU9Z8u2WoSlqqh9yIQdGjPvHo6m+8KSOnB8xAr7t
	Ze1YUqSxfIsz280iVQYC+j9ouYAYE+AOHJHB3/OxlN0G3ST2hmXK8u9IZdaRV5N4+Nr1hFA4XvSq5
	aHrQfBbBnW6IQrApAavTJEq26Ta5we4xbi8VzFeUWRq8idog7JRDocOUvLO3AMFC81juew5SMM912
	zDCWofmcW9eKXf05/KY12OK9y1GJKSgqvdrij50/ZTDgVH/Uf2i1obrZ4RvP1OMccYeWS6yqw62Bp
	L7veC3lGVe6HhC6nKI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOXt-0000000053R-06o1;
	Tue, 05 May 2026 22:47:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOXq-0000000052s-3to0
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 22:47:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645LrI46152048
	for <linux-riscv@lists.infradead.org>; Tue, 5 May 2026 22:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=80QsdjvMKgByQ+N3vQwQVN1P
	Ot2Azp0fZNR7U+S/ywA=; b=nGLZ2qSW7qAP5IVLc38deKesNE4nEEYyU+ewj6Fz
	7BHEEClAsMXCAyFHJckZhk3z+nMe4UQQx4I39gumjZrmCnUch5jJCoKvQLLbVpqG
	Cu6uTPx0UgrYCDeZrs+t1xG65UADU/Wq/tr6DVhgTylph7zQiaTPgB/ohRlpLS9Z
	iWu/cjQrz+Z5GlHc5uvoSOkus2kGFIbdZz2P6ldJzrhoVBg/6BstxoQj9NSHicz3
	cFk/HxsYqh/0Oqd0uyK7cVuGbyC84ZpnfgJl3ZVjHYIbHkNUanzoG4bkOg9af99U
	XkOCPrli0Ndu6uU5hjdVBucJKSPe5Ympn8/iJ/+56UE5eQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj809x5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 22:47:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so8232422eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 15:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778021233; x=1778626033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=80QsdjvMKgByQ+N3vQwQVN1POt2Azp0fZNR7U+S/ywA=;
        b=d/E+AoCppmW7Dsg5Bnfyqv6gwBIhJSvNgw5uBvhiuzBIWWclFSjPIUbLYQJQNn2CFS
         kxS5AbgJB/+n0v7O9XxMa//eMmu/wsjAZHYFwRheUSfs4dxG0TQC2IE0CfGHD7OUXibs
         mmFKP3b3hrXMVxvPmOyoGD7Yx9ZBbJz5X3E6eIWR9x7VObGU/uefe92C20fhClJyGjrh
         SAWkFRO+U3O+QEweEzjPIDbDSLk3OlwbH5F8e/DfY3mEdgIGYgexMdrF/d9rbuP+mQkm
         no1PmOoLRXYD4YaRxiq7loDrUu/nBb9kLurqDgw0dpi3+zsXNiM1+xuZe9MfRWkQcsNJ
         iAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778021233; x=1778626033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80QsdjvMKgByQ+N3vQwQVN1POt2Azp0fZNR7U+S/ywA=;
        b=kyy9GHHWeOZMTVBmiUzH61oPcEg8ju11YF7hhHlA2UcxMPY/akJir7sT+Q8g2GYXmq
         b89SsJl+KSJlZqZ4vg7rnUdbJ74aSJAbUuVS3pONDs0yv0AWYHYpshza5m66CfIJc6S1
         YGO46iSF2dNN0OP1QE1AwL1ENRYO/Hb+6DXA4BthIncK0t7Z/8eq2XP0tE4krn3Tpvxp
         RoavohNArWepG/WVQFNi02A7UTXTg7SDS9tCp4H8j6Wepq5rk+h7Q7dKODE1uTQBaNp5
         cXCAN55QUD6EeaFVLWYQDrTIlCKgu/nsggvhg1xu6kQ3O+01EXsSiAsijLF3obqbi6ES
         yTww==
X-Forwarded-Encrypted: i=1; AFNElJ96+LnyNGVH7RYbHMoD2z29OgP0KcfSPPzZxhR5z1cGREOLo4prc1Oz3Uj+/DuNBCeBJkIv1nyEH+19cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH6RZj1vwICZ2PaWOVJCC6GphQTzbip51ZOZBUvuYV9dBZWy0a
	wryqDnyZkYJwhVp/+1AH/8N/cRg8vttaZ+FlwGWkwPCHjrPOaC0Wnzofgi5OljLres8AdCAHAt0
	O3LLsd6TL0n9pQkGG8J/Oqqy0IjuazM7cR6SfUkWmZKeJqPf4itAVCkqde/ZiIgvEM4pKYao=
X-Gm-Gg: AeBDieuqzk5RcCNI4EeqYdovI8Mi8zNqmsT4dCGBuKa9hoVSgR9K4GUucAF+rrCFyCz
	o8bSFXIZYsjzu3iB2hEcGbpvRJEuDsMotPeTdZN5ABmmz9tCnE6KULzyEJWVtSV08k9tb1HlOk9
	PR65HmJRhg1GfvlPrSPUtyJWLB0K+cAF7vFm4hQX6X+bpdOgkmVC1FkhEySLIhlYmG7wLkNEOMj
	Y/CnV5v1B0GkbAkeESW8jLoY6FDHxzFlH0dkfQmPUfBz4v//xmdlRQPSwNeP1rxqGpLCbKC3ZNQ
	3xOAlpfO+vXf7dVTEh4jN26Iba+1UjUMa6ZnS2x0ECmjlEGWBeL/RyK2hvHcVH6Dtd75PwnLZj2
	rOiXb4Oyy6s4T2HiR+E1Aar0Lawa4q/k41TMIIQRJKg==
X-Received: by 2002:a05:7300:bb8a:b0:2ed:e14:7f5e with SMTP id 5a478bee46e88-2f54b899b3dmr493947eec.34.1778021233023;
        Tue, 05 May 2026 15:47:13 -0700 (PDT)
X-Received: by 2002:a05:7300:bb8a:b0:2ed:e14:7f5e with SMTP id 5a478bee46e88-2f54b899b3dmr493936eec.34.1778021232461;
        Tue, 05 May 2026 15:47:12 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d5c5027sm828041eec.10.2026.05.05.15.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 15:47:12 -0700 (PDT)
Date: Tue, 5 May 2026 17:47:10 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
        linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
Subject: Re: [PATCH 7/7] iommu/riscv: Add NAPOT range invalidation support
Message-ID: <oe75yk2fx2c7wg73xrikppw2gxxe2e6bsvkktowbo64ftldy7p@53gjjzhu6cy5>
References: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
 <7-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fa7371 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ikd4Dj_1AAAA:8 a=h2i9vGFyncx6_ar2YjIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: a4nM-CSK6Z4PKgNNAbvhb1qIPfr4EIIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDIyMiBTYWx0ZWRfX830wy22fA7RS
 RrDUX+sBF2ydzcFpRtaCMSoeaQqK6HQXAMjBCucp2xrNZse7riYPqKtivemt0u+aSy6omAGSkx0
 h5UVv8cC83x0s1Y73TtL8y65Ga1Zp0WXf61Y3IAgbNypaz62A2UxgD/8P6Q0LgwA8jUdAUO0ZMA
 +eT4tR5tV95efyN57oMBeogViKmd50DFrxqx5PYCpFUNKTG2JVzTE9Av9kOH00W4Hf6JmJWG+lV
 CaK+Ss1Xob2obfRpQyr0A2xqKul4kLsz7y5iTkhOJd5jIHzsyf5W0rI50G3D+e6/b7jUmO7q3Q9
 5/URK4jJ+GuZaDDTaCuRKk9TFsgJvKBgSrJnyS8TTXmrM8bbnKm0jiWH0/wvy7l4YkVV4/ITOt1
 /kJuPvP6MOH1hvTd62dk2pGlsUk+9lTqRPr/XEqPNvedTP7yMWZHR80TcZd1ZeA/ga6x6Z1ymiz
 9fa/quxzxLwq4XHB9Pw==
X-Proofpoint-GUID: a4nM-CSK6Z4PKgNNAbvhb1qIPfr4EIIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_154715_026160_C92211BF 
X-CRM114-Status: GOOD (  23.58  )
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

On Fri, Apr 10, 2026 at 12:57:08PM -0300, Jason Gunthorpe wrote:
> Use the RISC-V IOMMU Address Range Invalidation extension
> (capabilities.S, spec section 9.3) to invalidate an IOVA range with
> a single IOTINVAL.VMA command using NAPOT-encoded addressing.
> 
> One iommu_iotlb_gather maps to one NAPOT invalidation command. The
> smallest power-of-two aligned range covering the gather is used since
> over-invalidation is always safe.
> 
> S and NL seem to be orthogonal in the spec, so if NL is not
> supported then global invalidation is probably always going to happen
> as wiping a large range without a table change is not common.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/riscv/iommu-bits.h | 17 +++++++++++++
>  drivers/iommu/riscv/iommu.c      | 43 +++++++++++++++++++++++++++-----
>  2 files changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
> index f01b49ac815586..32b3ad3ac9ae59 100644
> --- a/drivers/iommu/riscv/iommu-bits.h
> +++ b/drivers/iommu/riscv/iommu-bits.h
> @@ -64,6 +64,7 @@
>  #define RISCV_IOMMU_CAPABILITIES_PD17		BIT_ULL(39)
>  #define RISCV_IOMMU_CAPABILITIES_PD20		BIT_ULL(40)
>  #define RISCV_IOMMU_CAPABILITIES_NL		BIT_ULL(42)
> +#define RISCV_IOMMU_CAPABILITIES_S		BIT_ULL(43)
>  
>  /**
>   * enum riscv_iommu_igs_settings - Interrupt Generation Support Settings
> @@ -475,6 +476,7 @@ struct riscv_iommu_command {
>  #define RISCV_IOMMU_CMD_IOTINVAL_GV		BIT_ULL(33)
>  #define RISCV_IOMMU_CMD_IOTINVAL_GSCID		GENMASK_ULL(59, 44)
>  #define RISCV_IOMMU_CMD_IOTINVAL_NL		BIT_ULL(34)
> +#define RISCV_IOMMU_CMD_IOTINVAL_S		BIT_ULL(9)

We should add a comment here that this is actually bit 73, i.e.

#define RISCV_IOMMU_CMD_IOTINVAL_S           BIT_ULL(9)	/* bit 73 (dword1 bit 9) */

because...

>  /* dword1[61:10] is the 4K-aligned page address */
>  #define RISCV_IOMMU_CMD_IOTINVAL_ADDR		GENMASK_ULL(61, 10)
>  
> @@ -731,6 +733,21 @@ static inline void riscv_iommu_cmd_inval_set_nl(struct riscv_iommu_command *cmd)
>  	cmd->dword0 |= RISCV_IOMMU_CMD_IOTINVAL_NL;
>  }
>  
> +/*
> + * Set NAPOT-encoded address for range invalidation (S=1).
> + * sz_lg2: log2 of total range in bytes, must be >= 13 (8KiB, 2 pages).
> + * addr must be naturally aligned to 2^sz_lg2.
> + */
> +static inline void riscv_iommu_cmd_inval_set_napot(
> +	struct riscv_iommu_command *cmd, u64 addr, unsigned int sz_lg2)
> +{
> +	u64 pfn = addr >> 12;
> +
> +	pfn |= BIT_U64(sz_lg2 - 13) - 1;
> +	cmd->dword1 = FIELD_PREP(RISCV_IOMMU_CMD_IOTINVAL_ADDR, pfn);
> +	cmd->dword0 |= RISCV_IOMMU_CMD_IOTINVAL_AV | RISCV_IOMMU_CMD_IOTINVAL_S;

...here we're setting the wrong dword. This should be

	cmd->dword1 = FIELD_PREP(RISCV_IOMMU_CMD_IOTINVAL_ADDR, pfn) |
		      RISCV_IOMMU_CMD_IOTINVAL_S;
	cmd->dword0 |= RISCV_IOMMU_CMD_IOTINVAL_AV;

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
