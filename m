Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA68DC982FE
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 20:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPF8LQlNNaGRpGB2/ogxkL2qyhjtalx8fiarxYaO7Lc=; b=WX/5LGQm06wCNw
	LleSOFp+a6VYfl0VEM/nd1S0nReOOjrKEoqAKFTABhE39uoCTIaq0t4vKUa5Kq883YYW6UYMhqWmM
	oefgkPxqWCTn2qfBGwH8wMwIA3Ds4cyOWt+IzVExhE/d9N2s5U3bYugOU6amJkhMNfsnfhSYzYtNq
	4h+CiJ4wG+tmLrauYorXLjknDIz1XyZ/JP6K41mxuk2TpmdPlDIT0gp6S4vJCUDFK2i0f89EsheU3
	cJbWeLZwtLY+zqKyKv7Vv+pZy07JrEUzG83pADcmTP4t1vIY9zC4K8ohzVvvYo4jEeYwOFxQTrf1i
	X93YrghpS7U46YGXUEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqB4-0000000EmsZ-3kOy;
	Fri, 16 Jan 2026 20:12:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqB1-0000000Emro-3rrn
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 20:12:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GJAlcL1678120
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 20:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F0iTtiZUAH8dw0zZmuH/r59V
	0R+RqGKf8svO6zz8Cxs=; b=ggGPT0dM6jHxOV3uGfQzqU0q4OdhdA91sWx/nSyf
	FF0yxSUsweBl/pqfY/fkBvGPbc23RE9hMVnFXl2AQ5WVcNRHYNS5HQMBqViLbUzF
	NrDy9NfDFGpTGgTIUTdY4f6m091jv1JtVHqeVbQkfWjs5ZBSJWxqQh/4GtqCrrPf
	dhN7Ny0pgfX6Efue+UB572IddQGEp/jFZ6T3XfiNMYwgw9P7TCaXNU5E5GJCRqjh
	xlah0yPfTpvCzyxdo52fJhS7LtAlR/TqG8DfdKt2r2BLk2MacrbSgesqgd5JKy8N
	ZCmyQPVQDH5aUlycUQIgwp2eWTJSeACX+Nj6r0tvhAucKQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99akfwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 20:12:10 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4042e22be4bso5518639fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 12:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768594330; x=1769199130; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0iTtiZUAH8dw0zZmuH/r59V0R+RqGKf8svO6zz8Cxs=;
        b=jCMngATmiG6VSTC4aiQPaDezSzC64fH1aNUuPszoorELLSsustDpUabS+6QqsIT74o
         bHmsiF+JADoDik4uXa1e61YXR8B/cj38kRSHHXQzB6k4vBG0Eb0YB6s7nNP4aXB8qQyv
         fKHpVheBawvy3vVIgPZGrjW1sfbutKqeGEqeOov8QCKyA+mkJ6KvEFUCouGsL764pg8y
         AUjHUHp42UjL+jBKMFzvgfgn+IcvlXWQsRFapry/VJVGEyFP91DqAfghfcbHepbHs2OT
         UfixNqh92Zcz3Wz3/3fonZAxxroqSMO3MTvGY62a7vNj1RmffXOn9Tt8Yj5Ik3FVNGEt
         ewqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768594330; x=1769199130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0iTtiZUAH8dw0zZmuH/r59V0R+RqGKf8svO6zz8Cxs=;
        b=qyJZ6ZnBCgmLDO2QtSiC8rPc6r7cECVwO8mmxb/5yigCvGxZ6AkEng19dnzfgFp/xd
         b5Q0RpIQUvARQTmgRC1FNAABj3GK7TrtQVd6qba/lnZ8ysZEaR+hfy5k8iPr2QEAR2Ax
         5HEda/+4X9lMBJOVdvUmncLSv1G+mi9MaCSRbqYTZtewmWHPFaZ8rFdCz7xxwfJEBhmV
         8fSp7vHtmLy1ndcLSnkmoL+DokUvAP+Fiq0er5/VrBmM10UBtVPto360kkzYLtzzYDkW
         SYX8C5uC3gc98RPq2G9EnM0ElEj+lFv65ULvz/jPs97TyWULXnQ9ybHc7YojMyEMxi0M
         ch+w==
X-Forwarded-Encrypted: i=1; AJvYcCVvTulx4I+G0wNL0CfGZEBWggJqj4hsmbhscVgXl1RgIwHMKA96WPASzGV5l0W8NyXg3SVnGsWvaMGQMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVSotLWFdg/+eNcCdjQGaDjjJ0hAkX1DNjAdiIxPQFPHcoxMjS
	ZDqagTRnAxnDxuFy+CTNCWy7JhlzegausGKdpx58KH1YeLK6GKCUz5LhZykhTRrIyxMylWlZIi4
	CAzysR/gn0Oc0vthrWxKzJB1v574LsvGh6Y3cZaWRK8VNZMKPg6kMmNXLbOXJP7o5N3BSbcc=
X-Gm-Gg: AY/fxX57qxMpjg9aJLd1KJuBin/lE8w0s3yA/XTukxazhejkQ3zzMrXtIcAGfJjpP7+
	1sJw3rk0b2pvOjmYmN6XAdwXlfEtHS47DgYXQLkjNE+WeburYPBYLbIjLZN7veEQrALHZ4anaHV
	+vn/3z8QJep6VSpfOD9RSGsgwg4V6CiHEn7rVrthVOYyfMOoZTqBUSr+Vp9S10ufO9rdy7Ljq3O
	u6ll3Mjiz/9IraV3WsoffJfmLWS93RVmdXc1CHQmZFYqsvc3kCOjCzlGOLW7v8FpwNZ8DuSu6vI
	5rszgqtjT5UaC56Alhboqn+8Lt3qsHIEBUk1wptnU0KwsmD7sx0W/eQZuyT7pD9/l/ZvYc1UvLn
	IaFpXt/LvaHxNyAqhLkQ=
X-Received: by 2002:a05:6871:c70c:b0:3f5:4172:12 with SMTP id 586e51a60fabf-4044c62c893mr1920596fac.59.1768594330071;
        Fri, 16 Jan 2026 12:12:10 -0800 (PST)
X-Received: by 2002:a05:6871:c70c:b0:3f5:4172:12 with SMTP id 586e51a60fabf-4044c62c893mr1920545fac.59.1768594327832;
        Fri, 16 Jan 2026 12:12:07 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bb528d5sm2422436fac.8.2026.01.16.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:12:07 -0800 (PST)
Date: Fri, 16 Jan 2026 14:12:06 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, iommu@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
Message-ID: <c5sk7h5r5fozjdyguamekenlzd7pzbtvdh2boq3arynxifba22@ii4ikea2tuyq>
References: <20260108134855.91341-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108134855.91341-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: KvvOSw7YAx2LB1hsGahWpLjHYjLCzfhp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE1MSBTYWx0ZWRfX2MPL68BVfrFu
 g0w0/zAZM3+ovPC6OiPeToD2AqxFedbTsJtLZYZ4fgbIHJOP8vs/BYUXiNpLpl1T/x3FNb+ehbN
 e7ILMWcCZagVJ3vzyKKWfR3e6rccThLpj9Yqp9MSmoxE0IfQi7lALpx7agqIuFZZBzF5cdFSnMX
 BI1vkPjhqysgM8P8p8rRjhvn80jrlq94ASRmLW6UhH6sqgZzE2mxZQf9b2WnkPstLbbR/VJ8FU5
 JrvG5gJftYkEm8s/F7aZ+dfGPwP84StVCAQwrP+ZTJQgl8fkvFQTaMTjzf5cPX4GsMoLpD6K0RV
 XoiZqDOljFJiiKLjeyyaI5qs0YxJyKuUAWsbKucscY+nQMgW89SpuWCrB8P1OfAR9rzodT/PHcR
 sle5ryefKuLAeKhcwIlEO3IZOKri7bVDfoj6Vd3rMpNj4N5597CKUy1qft44Bpl1okzupK+WeqQ
 EBbMkHNt8ytSMc8pfnQ==
X-Proofpoint-GUID: KvvOSw7YAx2LB1hsGahWpLjHYjLCzfhp
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=696a9b9a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=78wgLUYcwfu5JlQfcDUA:9 a=CjuIK1q_8ugA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_121212_768196_A79C087F 
X-CRM114-Status: GOOD (  26.73  )
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

On Thu, Jan 08, 2026 at 09:48:55PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Add riscv_iommu_iodir_iotinval() to perform required TLB and context cache
> invalidations after updating DDT or PDT entries, as mandated by the RISC-V
> IOMMU specification (Section 6.3.1 and 6.3.2).
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index d9429097a2b5..2900170133fc 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -996,7 +996,82 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
>  }
>  
>  #define RISCV_IOMMU_FSC_BARE 0
> +/*
> + * This function sends IOTINVAL commands as required by the RISC-V
> + * IOMMU specification (Section 6.3.1 and 6.3.2 in 1.0 spec version)
> + * after modifying DDT or PDT entries
> + */
> +static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
> +				    bool inval_pdt, unsigned long iohgatp,
> +				    struct riscv_iommu_dc *dc, struct riscv_iommu_pc *pc)
> +{
> +	struct riscv_iommu_command cmd;
>  
> +	if (FIELD_GET(RISCV_IOMMU_DC_IOHGATP_MODE, iohgatp) ==
> +		RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {

nit: This condition can stick out. We have 100 chars.

> +		if (inval_pdt) {
> +			/*
> +			 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
> +			 * PSCID=PC.PSCID
> +			 */
> +			riscv_iommu_cmd_inval_vma(&cmd);
> +			riscv_iommu_cmd_inval_set_pscid(&cmd,
> +				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
> +		} else {
> +			if (FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) || (
> +				    FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, dc->fsc) ==
> +				    RISCV_IOMMU_DC_FSC_MODE_BARE)) {

nit: formatting
			if (FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) ||
			    (FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, dc->fsc) ==
			     RISCV_IOMMU_DC_FSC_MODE_BARE)) {

> +				/* IOTINVAL.VMA with GV=AV=PSCV=0 */
> +				riscv_iommu_cmd_inval_vma(&cmd);
> +			} else {
> +				/*
> +				 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
> +				 * PSCID=DC.ta.PSCID
> +				 */
> +				riscv_iommu_cmd_inval_vma(&cmd);
> +				riscv_iommu_cmd_inval_set_pscid(&cmd,
> +					FIELD_GET(RISCV_IOMMU_DC_TA_PSCID, dc->ta));
> +			}
> +		}
> +	} else {
> +		if (inval_pdt) {
> +			/*
> +			 * IOTINVAL.VMA with GV=1, AV=0, and PSCV=1, and
> +			 * GSCID=DC.iohgatp.GSCID, PSCID=PC.PSCID
> +			 */
> +			riscv_iommu_cmd_inval_vma(&cmd);
> +			riscv_iommu_cmd_inval_set_gscid(&cmd,
> +				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
> +			riscv_iommu_cmd_inval_set_pscid(&cmd,
> +				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
> +		} else {
> +			/*
> +			 * IOTINVAL.VMA with GV=1,AV=PSCV=0,and
> +			 * GSCID=DC.iohgatp.GSCID
> +			 */
> +			riscv_iommu_cmd_inval_vma(&cmd);
> +			riscv_iommu_cmd_inval_set_gscid(&cmd,
> +				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
> +
> +			/*
> +			 * IOTINVAL.GVMA with GV=1,AV=0,and
> +			 * GSCID=DC.iohgatp.GSCID
> +			 */
> +			/*
> +			 * For now, the Second-Stage feature have not yet been merged, so
> +			 * let's comment out the code first.
> +			 */
> +#if 0
> +			riscv_iommu_cmd_send(iommu, &cmd);
> +			memset(&cmd, 0, sizeof(cmd));

The memset isn't necessary since riscv_iommu_cmd_inval_gvma(), which
doesn't yet exist, will overwrite dword0 and zero out dword1.

> +			riscv_iommu_cmd_inval_gvma(&cmd);
> +			riscv_iommu_cmd_inval_set_gscid(&cmd,
> +				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
> +#endif
> +		}
> +	}
> +	riscv_iommu_cmd_send(iommu, &cmd);
> +}
>  /*
>   * Update IODIR for the device.
>   *
> @@ -1031,6 +1106,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>  		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>  		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
>  		riscv_iommu_cmd_send(iommu, &cmd);
> +		/*
> +		 * For now, the SVA and PASID features have not yet been merged, the
> +		 * default configuration is inval_pdt=false and pc=NULL.
> +		 */
> +		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
>  		sync_required = true;
>  	}
>  
> @@ -1055,6 +1135,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>  		/* Invalidate device context after update */
>  		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>  		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
> +		/*
> +		 * For now, the SVA and PASID features have not yet been merged, the
> +		 * default configuration is inval_pdt=false and pc=NULL.
> +		 */
> +		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
>  		riscv_iommu_cmd_send(iommu, &cmd);
>  	}
>  
> -- 
> 2.50.1
>

A faithful implementation of the 6.3.1 and 6.3.2 guidelines for what the
code currently supports. I presume this is fixing an issue? If so, can you
point that out in the commit message?

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
