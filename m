Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08237C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qc6k+bg0gQXhsAmTPDEeDf5Y0O85Nw7oi2oMqzOu8yQ=; b=1vdRld6qcFApsO
	05Lz9uAYVjii9saKy/RfguJi54CHZrR+NgyscyYC1m49MKFaK4TfYBTjCWxLv3EKQ1j+Gy/vuw3Ey
	5TjsY7aLWcddCyag6c7SZbm2/BLzFySIRnliXGlFKYVDqfF6H0Lg4X6t2YI+e4o7ceEQ6JBdA9SPz
	UoidaQs8cD5ySBxkCG3986joiz+uXko6qqrvYMtJPGHA4XcEP9LcKmDP63a9Dps/km/43Sc1GqEhW
	oAU9cwZab6t08A9q2mUQPs9KIQBmLfxqsaQnbHQoUT5DJJvfAcHsA/0moL4STc/jafTCUffe/B9Ra
	6wyJj6JeZSyMRq6TNc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MDi-0000000Bc66-11j0;
	Tue, 07 May 2024 14:55:06 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MDe-0000000Bc2o-31gt
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:55:05 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3c96a298d5aso1488409b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715093698; x=1715698498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khya5nPWsz8iIm1AQ53Aurao/H+Jj1OPdGrhqcoxtig=;
        b=a9sz12NIoNCw3tRUIf2G3dnZNxNYzXmdiB+Fh84VwcfUSGZdUUAbRpNG0mmb3c9DlJ
         S4GPpe69s9s8I1ONH9wjMIqnCTr+cCMfVDS7B88AxjHuX0yTdYl8FeuYSW0fi5EZSU4V
         +TYRC7aI5iKYsZCtfccQG4iHPoAev5jjbLRjBINVJYiaCBagqlyKz1KUdEr5enRxfJ3h
         KqnkTv5IJ0kj8C/3NGUMK2d6CMGt6+DkOSOKYXQswmBYAks9Uw3YdOF1kThlGyF5FO6N
         YxPOU31ArydLDES5T4546jAHlZKHi97MdTjUKv1VFDOaU1QoPyXCMLUvyQCwLQSsyzV9
         0aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715093698; x=1715698498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khya5nPWsz8iIm1AQ53Aurao/H+Jj1OPdGrhqcoxtig=;
        b=wWg4wAz7vTLK2Kj3PYw1mSL2/p6yiq2eMT+Ox8UVHqlpOnxWfxMdUarJdO5P4vBQGv
         YuVXCy5fYg2Kq4tJmWxpqCBwLaSqcI6pQjJ9Ey3R9f5stzZ+WQSN+srga2Z2pF4vMYfo
         I4MIQWSFHJklaq8+Au871bz3NpdbIVfcJP8en216ZRGnbz+/4YTPFE5ywKeWwNKj2AKZ
         FxfBQfP6BTkCfQX1z7em7cppm7VsPa7M6YvFDvxPw98w2nisvkhH9rC4MYRG9csW5aOr
         F9P7Ke0qSn2pKR85q51peVQN5JV6tw7JIOQSQXdtjhFS6/A8aPNGL5qs2pfSctgC/61q
         oilg==
X-Forwarded-Encrypted: i=1; AJvYcCUempu7RuMcozEBh7bg6i/2Ax0f/0sLHZd3R6ncy0mzT+WJ3oktu8oGb0MKQgrkJyh8FZ03bP8yaPWc+EP1tE7iO7w/xIbp5Uc+nUuhwoTe
X-Gm-Message-State: AOJu0Yz7hhyaPmlPEgvu04gdvaEkQIViqBAGVExK5dQpfPndZZFj0eF1
	Vmy6guMGDgQzBxA+2CXGcccPtxuxjzl6+JM81b93E4HYIYAPhL3UYKwJ9gKBSReoFWBCCXQ3vo1
	c
X-Google-Smtp-Source: AGHT+IH06U/MvUqSaZ8CzKk8w5FX8P/20f3bpgKLuBxThf4yEkosHT9oMIC/YgbQ5imbHRsONRdCTA==
X-Received: by 2002:a05:6808:16a9:b0:3c7:79c:72c9 with SMTP id bb41-20020a05680816a900b003c7079c72c9mr19634594oib.54.1715093698542;
        Tue, 07 May 2024 07:54:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id v16-20020a056808005000b003c96907bd58sm981178oic.50.2024.05.07.07.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:54:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s4MDY-00825J-2j;
	Tue, 07 May 2024 11:54:56 -0300
Date: Tue, 7 May 2024 11:54:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC RESEND 4/6] iommu/riscv: support nested iommu for
 getting iommu hardware information
Message-ID: <20240507145456.GH901876@ziepe.ca>
References: <20240507142600.23844-1-zong.li@sifive.com>
 <20240507142600.23844-5-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507142600.23844-5-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_075502_949597_248A803B 
X-CRM114-Status: GOOD (  14.52  )
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

On Tue, May 07, 2024 at 10:25:58PM +0800, Zong Li wrote:
> +{
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +	struct iommu_hw_info_riscv_iommu *info;
> +
> +	if (!iommu)
> +		return ERR_PTR(-ENODEV);

This is not possible, don't include impossible checks like this.

> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return ERR_PTR(-ENOMEM);
> +
> +	info->capability = iommu->caps;
> +	info->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
> +
> +	*length = sizeof(*info);
> +	*type = IOMMU_HW_INFO_TYPE_RISCV_IOMMU;
> +
> +	return info;
> +}
> +
>  static int riscv_iommu_device_domain_type(struct device *dev)
>  {
>  	return 0;
> @@ -1560,6 +1582,7 @@ static void riscv_iommu_release_device(struct device *dev)
>  static const struct iommu_ops riscv_iommu_ops = {
>  	.pgsize_bitmap = SZ_4K,
>  	.of_xlate = riscv_iommu_of_xlate,
> +	.hw_info = riscv_iommu_hw_info,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,
>  	.release_domain = &riscv_iommu_blocking_domain,
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 1dfeaa2e649e..ec9aafd7d373 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -475,15 +475,28 @@ struct iommu_hw_info_vtd {
>  	__aligned_u64 ecap_reg;
>  };
>  
> +/**
> + * struct iommu_hw_info_riscv_iommu - RISCV IOMMU hardware information
> + *
> + * @capability: Value of RISC-V IOMMU capability register
> + * @fctl: Value of RISC-V IOMMU feature control register
> + */

Please call out explictly what spec these values come from.

> +struct iommu_hw_info_riscv_iommu {
> +	__aligned_u64 capability;
> +	__u32 fctl;
> +};

Add explicit padding here

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
