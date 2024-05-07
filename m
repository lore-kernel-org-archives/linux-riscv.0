Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05038C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOgpONeaBQFDlM+ygBfUJzedlX1YuZRGrEzYZuh4i2g=; b=ijstcRzuGemEeJ
	tVc6+aTgpLwZl5UAdeENH+B6ZVepw6KYA9lmn7bhowfCkska98Te5USJ+gFieocle2W0gvDcshuDf
	95em8s0xQ/G4mBQRo2x1rCs3HW/walmmG/k/GjydHfXY17TgJsXTQab9rogkTd+MoHnOTpQM9ofGd
	DgUxWgk6Jx5P+gGgux3zRTK8GraQwamzw2flldwYfI8cXWY9QX9l95AlxK8nVREN/k7VIh8hamZQx
	JqBmfvOTJX/rsgpt+pHkQUHT1PWstB2Lz/EQDVKO2ycKVH7VjqI7w3tU2bdRgd3XadoNgpTRO9Ik9
	I1IG4n0YL1YCzkAaWVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MQn-0000000BfbK-149H;
	Tue, 07 May 2024 15:08:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MQj-0000000BfZ0-0nTt
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 15:08:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ee5235f5c9so13256995ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715094511; x=1715699311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fND2M9HAUkm4x+oFcQdmy96kdMgurKLsiwDF1oTNZBY=;
        b=OCLcww6E2fsP9EQAtvJVfcVeOdwxLW5vDoNFT89JZpjDdS4yRL2hXZX3PKGoujDpV4
         4pvzOviYvm3IEAZredrdApNNEZL3rdEsRzNNJYb85jylSob4IdUqgqXmFw3ic/mSlbEU
         3A0dRe7nklIsKw9V7S0/7rncz57JbuKk1hw2MnqzTzWClqUFrB/4BgmURgo3x6sygrv8
         WTzwIDUpUVj8J6dOtnwm16LqnsRvfLhCf3NVGqy3loQiaHODq3VffeQVV+TolQsKbRkC
         HBCPc+AiBeC6SA8AbxazVvlAluQ6+RQ1jXP+XGnS2YtJzZK/8ZGSVpjfagow9sAEDc8s
         0JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715094511; x=1715699311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fND2M9HAUkm4x+oFcQdmy96kdMgurKLsiwDF1oTNZBY=;
        b=RyFS62RpH5epBj5KafdSbUfWBjqMiwFlogQU7rAanrqCDgunIhG7QzJBIuSIXcpvxy
         1rBJYhG5/Cwlfu4BVS9ReOuJZLg4qwh178+3BmyyTt3cUj7Vc9XkGRVHrNc+ibOUjwLH
         RGGLSYkT/ZMp1X85bHswDoMnnr1r+flVuvgDYNAuXcxr6YO7adPe+l43GAlCcEqRvOwk
         XwmAecYJ2+JTeImmHdY/x3EDvNAjNaDWwFt00hDeCSIiI/DBWciCvVr2Q2UpDsnRILYO
         YfOtX9oC5XbJyhqRYVRQYAXSv+p6N6qzeckQUUpWusdvTy041im+J/DY/HiyZUOfgI5z
         kS5A==
X-Forwarded-Encrypted: i=1; AJvYcCXCQ5O70LZi5N+AQ+RfOnj1L7K6jGc7H49TALVaw/JmOo9/zK9BOD+LcmT05FyYCt2Okqs9t/Mc/qNtRDe/YOsW7Sbvrq1ZDb0C17dEnUJV
X-Gm-Message-State: AOJu0YyzYJLh1qD4UGAnPikTn0Bic6keYwIKZr4ziNv+U2o1dpZvxjpg
	KEUumWi56Jk8qATo238op/EJZD5UPziyViHPAqcvIRAvD6lYxrnFd+RvQsx//mQ=
X-Google-Smtp-Source: AGHT+IE99ykRACFWdx0o3pmeRQlEzYnavDZRoKHfVvO4jPQEJsMrakgeX588ukvMpQUEMFItCF1XdA==
X-Received: by 2002:a17:902:e752:b0:1e5:c0ee:a7f9 with SMTP id p18-20020a170902e75200b001e5c0eea7f9mr15612425plf.14.1715094511569;
        Tue, 07 May 2024 08:08:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902654c00b001ed9b384b6fsm6325649pln.23.2024.05.07.08.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 08:08:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s4MQf-0082xt-Nq;
	Tue, 07 May 2024 12:08:29 -0300
Date: Tue, 7 May 2024 12:08:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC RESEND 6/6] iommu/riscv: support nested iommu for
 flushing cache
Message-ID: <20240507150829.GJ901876@ziepe.ca>
References: <20240507142600.23844-1-zong.li@sifive.com>
 <20240507142600.23844-7-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507142600.23844-7-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_080833_313336_F7CE0D38 
X-CRM114-Status: GOOD (  19.33  )
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

On Tue, May 07, 2024 at 10:26:00PM +0800, Zong Li wrote:
> This patch implements cache_invalidate_user operation for the userspace
> to flush the hardware caches for a nested domain through iommufd.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/iommu/riscv/iommu.c  | 91 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/iommufd.h |  9 ++++
>  2 files changed, 100 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 7eda850df475..4dd58fe2242d 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1522,9 +1522,100 @@ static void riscv_iommu_domain_free_nested(struct iommu_domain *domain)
>  	kfree(riscv_domain);
>  }
>  
> +static int riscv_iommu_fix_user_cmd(struct riscv_iommu_command *cmd,
> +				    unsigned int pscid, unsigned int gscid)
> +{
> +	u32 opcode = FIELD_GET(RISCV_IOMMU_CMD_OPCODE, cmd->dword0);
> +
> +	switch (opcode) {
> +	case RISCV_IOMMU_CMD_IOTINVAL_OPCODE:
> +		u32 func = FIELD_GET(RISCV_IOMMU_CMD_FUNC, cmd->dword0);
> +
> +		if (func != RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA &&
> +		    func != RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA) {
> +			pr_warn("The IOTINVAL function: 0x%x is not supported\n",
> +				func);
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (func == RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA) {
> +			cmd->dword0 &= ~RISCV_IOMMU_CMD_FUNC;
> +			cmd->dword0 |= FIELD_PREP(RISCV_IOMMU_CMD_FUNC,
> +						  RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA);
> +		}
> +
> +		cmd->dword0 &= ~(RISCV_IOMMU_CMD_IOTINVAL_PSCID |
> +				 RISCV_IOMMU_CMD_IOTINVAL_GSCID);
> +		riscv_iommu_cmd_inval_set_pscid(cmd, pscid);
> +		riscv_iommu_cmd_inval_set_gscid(cmd, gscid);
> +		break;
> +	case RISCV_IOMMU_CMD_IODIR_OPCODE:
> +		/*
> +		 * Ensure the device ID is right. We expect that VMM has
> +		 * transferred the device ID to host's from guest's.
> +		 */
> +		break;
> +	default:
> +		pr_warn("The user command: 0x%x is not supported\n", opcode);
> +		return -EOPNOTSUPP;

No userspace triggerable warnings.

> +static int riscv_iommu_cache_invalidate_user(struct iommu_domain *domain,
> +					     struct iommu_user_data_array *array)
> +{
> +	struct riscv_iommu_domain *riscv_domain = iommu_domain_to_riscv(domain);
> +	struct riscv_iommu_device *iommu;
> +	struct riscv_iommu_bond *bond;
> +	struct riscv_iommu_command cmd;
> +	struct iommu_hwpt_riscv_iommu_invalidate inv_info;
> +	int ret, index;
> +
> +	if (!riscv_domain)
> +		return -EINVAL;
> +
> +	/* Assume attached devices in the domain go through the same IOMMU device */

No, you can't assume that.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
