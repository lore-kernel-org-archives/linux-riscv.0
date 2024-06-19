Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F1C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjwwtnQ8i2n2cOP491UlWopNOIFexTSyz9KDHyZwqwQ=; b=cx6aeb+wsqURAU
	J6Eadn1MLnPBOVu0XuyLDmFZ017Ax0pT9U/j12jdOKrrLbqwnr5+ZVn0TJsWqdLf+miwduE/+pEij
	eVqp3AlOAXSRHUUrGngLvy/ZvTXdOs+jWEaUM5gvMHlAUA3MK7JXKsTNReyKTTp51aBTyNvIKnuoE
	FX6eOnh4mGtQlJIvc3QV/Tvusx9PtZ2BrQZ53r6IMNBb50wAxpwtzWRc+xkL50LhxGSmjnM8yZjkU
	Sw5mUUCJ0gRBVNRJpFOUXQjUtMVvXajDUlSC0/APhkprCZ03FKflsxDJO2MuZX9YH4Hk7E/i7WPpc
	E8JsZUm++E/PfsT0Xvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJy0K-000000020Tb-1OWl;
	Wed, 19 Jun 2024 16:17:48 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJy0G-000000020Sp-2ZKM
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 16:17:46 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6b2c6291038so242456d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 09:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718813862; x=1719418662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJVIwzPcIdMQxvtrBPsr6OyaDEL3PRs7k9pYTnL2jas=;
        b=mAqlv7tJHOQ0UYhcM3Hrt8OQ8Aia++prjYUdvKNTZFNIu2cTxFx2CgyAqIPVNM9x7K
         VZ+YBExo87Cbe3xuB5PNaWm7J+LOOx2CEPz9gpsoIjayge+6ZVkg9yrimgKWrTnL93Dc
         kq4d7GdsT80i4IwLlAmAV/RTlisOgqiAUBhrMvDHnD+SSoEWLF9k9Itwx4BsI5E+16Op
         MtT0TgVDaUT1IibwE947GK2Argb8cDQw6jpsAs2V7ypoExpwb7wiiQ9OnCjmbKOxhv2M
         RvpZCRm96dO7ijTYyWUlrF+vNYUF8GCyY+PjptuPXOAiDmrPjt6Lcq4pJC9gG59Tihf5
         U6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718813862; x=1719418662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJVIwzPcIdMQxvtrBPsr6OyaDEL3PRs7k9pYTnL2jas=;
        b=r42LAQ8Njd+tQ9DGK2hv3qfZ81WgHFVrNMHUPArCPd22s9J1eJcRAXalNNtzrpWvX3
         qBr/wH9ZXOORdNNxZb1DhzZ+xlV3sra67nH2wiiHtZEzJm5VDIgCtej0/kJBEbF/gTr8
         GTOaIS0vRcxQQn/iwFGrlWm/5N3fThrvSRR9ficFYnBUyr/U4eu/p5PXGV//73nXY7xg
         MxSAmaAp113e7aeUUej3kK7j/44xad/slxvg3daNyCjMoUi97kdMzWTXo397l8eQD5Xv
         l09L2VU3XC+XDUdQd/fEN/PNhshDtf7H42dR6tnekmKW9x5WuL3gAmh7AdAV2AE9bsjC
         ThIw==
X-Forwarded-Encrypted: i=1; AJvYcCUymtHkHs+XXxmQ8jGKMenNQQid4Lg7/nMfFkxFyfQRt8V8LsOaolO25JsSYC0QQMH+216y5EIVu+bM9SrV6UxxsSQISYdNYGJ+fOtAYVGz
X-Gm-Message-State: AOJu0YyZbxvcBgubvbAthyyEjaquGDJscJ9L1R0sRtML8jdWPXTp1AVx
	3b9R1wctlcnGOesm5a0SnKTweQQIeZTAQo6fuaRNjJtqO8HNZIdh44nbQEelFFE=
X-Google-Smtp-Source: AGHT+IFfUciy2ULNoWqjYrlaf+0zX+YLSbjNyDJwf1uvYHiwNEj03UK9PLBK8P2sgu1Fpv3E0J7nRw==
X-Received: by 2002:ad4:58a5:0:b0:6b4:f6ed:ab2b with SMTP id 6a1803df08f44-6b5019d215fmr50749306d6.10.1718813862385;
        Wed, 19 Jun 2024 09:17:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c2e9d2sm79303046d6.59.2024.06.19.09.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 09:17:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJy0C-0055tc-Ng;
	Wed, 19 Jun 2024 13:17:40 -0300
Date: Wed, 19 Jun 2024 13:17:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 08/10] iommu/riscv: support nested iommu for
 flushing cache
Message-ID: <20240619161740.GP1091770@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-9-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614142156.29420-9-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_091744_716085_8059EF9B 
X-CRM114-Status: GOOD (  24.27  )
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

On Fri, Jun 14, 2024 at 10:21:54PM +0800, Zong Li wrote:
> This patch implements cache_invalidate_user operation for the userspace
> to flush the hardware caches for a nested domain through iommufd.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/iommu/riscv/iommu.c  | 90 ++++++++++++++++++++++++++++++++++--
>  include/uapi/linux/iommufd.h | 11 +++++
>  2 files changed, 97 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 410b236e9b24..d08eb0a2939e 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1587,8 +1587,9 @@ static int riscv_iommu_attach_dev_nested(struct iommu_domain *domain, struct dev
>  	if (riscv_iommu_bond_link(riscv_domain, dev))
>  		return -ENOMEM;
>  
> -	riscv_iommu_iotlb_inval(riscv_domain, 0, ULONG_MAX);
> -	info->dc_user.ta |= RISCV_IOMMU_PC_TA_V;
> +	if (riscv_iommu_bond_link(info->domain, dev))
> +		return -ENOMEM;

?? Is this in the wrong patch then? Confused

>  	riscv_iommu_iodir_update(iommu, dev, &info->dc_user);
>  
>  	info->domain = riscv_domain;
> @@ -1611,13 +1612,92 @@ static void riscv_iommu_domain_free_nested(struct iommu_domain *domain)
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

I'm not sure what this remark means, but I expect you will need to
translate any devices IDs from virtual to physical.

>  
>  static int
> -riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_arg)
> +riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_arg,
> +			struct riscv_iommu_domain *s1_domain)
>  {
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> @@ -1663,6 +1743,8 @@ riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_
>  		       riscv_iommu_get_dc(iommu, fwspec->ids[i]),
>  		       sizeof(struct riscv_iommu_dc));
>  		info->dc_user.fsc = dc.fsc;
> +		info->dc_user.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, s1_domain->pscid) |
> +					      RISCV_IOMMU_PC_TA_V;
>  	}

It is really weird that the s1 domain has any kind of id. What is the
PSCID? Is it analogous to VMID on ARM?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
