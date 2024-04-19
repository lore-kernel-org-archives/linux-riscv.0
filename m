Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A18AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfk+C9jWoGuRfxwCZd0456oWIekSveYE9clJf43Zg1g=; b=n8KWZF1nCdaBYu
	AAl9Sya0sORI05PcTXZ9LvkpJyOaUEithGAz4uUX8a/QOgwAcxmmzCMd2yXxhIdBgqUJsXgqwUOmA
	YBdkmrD3+/2d/6bs8JIanMz8ohVIwnyxe261GZG98/u+9KQEhjcTzzBPbJK3cnlIQUVkpqEHJH5sZ
	PhmjoTHJQ2YjlepGW1rHv2rgZyaK2fMmSAyxd84Ug8aMcehs537sxSGiDiu8jx9xGK8eF5hGi4Gl6
	t2b0kmTVewff+30M7laDGrXd/vz2XqC1iFnyiS+smo0hLCAnjrui/kFq08ONA5oTMDpIUACY4YUEA
	KIt+ciPJreMlwSzbx3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnXZ-00000005dNQ-1tCj;
	Fri, 19 Apr 2024 12:40:29 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnXW-00000005dJT-0YVg
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 12:40:27 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5ad23070b85so30983eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 05:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1713530419; x=1714135219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wIf7xKZO+HvCUW+c/Z92TyDy7TRUuimqRZ6QyHtca+k=;
        b=o3raMuYQGV/v2piPUhGs418S7Rav5OdiWqGJbjI5dECKFq4BRNhZ4leG+z87wHfN6V
         ZYPF2XOHywM7OTXKWZL853LRDL3TEYUPSfiSDqQ5RiBfamSQ3gh8gemjTui+WY3djob+
         jlVH5D8CrOJyW/5ZdHJ/KcKbSGVPzeLGHrSr9vo8IhlScruCdO9aj/cauJb691yZA5oG
         uNwx9ArtIFUDb9TNOdN7jglewOQeQkPp5aG/QcCBcbnLB9GW2oSNvIRWf6ge6ojO7N8M
         ql+u55pCXKNhsm5ftGk95okc4lznlgSMroqQ4G6kdc3TPmOxzXJSpt52eQhcEIiSH2sJ
         sVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713530419; x=1714135219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIf7xKZO+HvCUW+c/Z92TyDy7TRUuimqRZ6QyHtca+k=;
        b=AjsfFhdaLbsSTTBQM74zcXFCMEUr3RxrbhHAQ7//Bt95C5yl7LQzIcyAvRHrgW2wiw
         cGBBGs7xNMPGgCUC4ZK6N8RiRrAEoK2ObIVZEizn+gWhw5lfC9Ss6zI3Zj+2SmYBOqzC
         Gs5+lwTxp6qtHoa/Xl/20Mh3KtAI2M1wi6E1N/7vMnzQSYbMrkt3tuK+uqoiTu3mFmfj
         KV6g3OvsRWZQ3b8YZmiFtV4A2jq1Vdg2D8GBHBJ94n5DPoYoKdekB5P2bt44jx+hPXTe
         xz/HmLA5FVjPmkL5XmOog8RkCQD2I7xaOTmFbm+Kitg0lGdTnxK6ZNfByMcPtAoWtfXu
         c+VA==
X-Forwarded-Encrypted: i=1; AJvYcCUVe0Ws9YR1hfU1ovRA951DTC2vcnesYO05SAwhq5eEgBAOReTm8POVm7dqh6LPIerDN2KjSpOm4q2ljavy/EC+QjFob84qzuzJlB2LmFKg
X-Gm-Message-State: AOJu0Yxzyhdj1q6JuAyyOy6Iayvs6hcP/GvLAtsFp6SrGwz7YJDhRFJO
	2AbYLBg8yrdmfoPNdsLrpNRTixLRM2BbvwDAn5EpqrK5FsOjOuOC/ZMZ7wI85G8=
X-Google-Smtp-Source: AGHT+IFCeyn2Wm1dfYOPLRzloku5CRQJoLFWoZvwANKqsHNrtsorMH4/LJaDzLyNVWV6QHo5EB1PIg==
X-Received: by 2002:a4a:942:0:b0:5ac:6891:ce56 with SMTP id 63-20020a4a0942000000b005ac6891ce56mr794470ooa.2.1713530419318;
        Fri, 19 Apr 2024 05:40:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id n5-20020a056820054500b005a4b6ad2d27sm813229ooj.27.2024.04.19.05.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:40:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rxnXN-00FOhX-6o;
	Fri, 19 Apr 2024 09:40:17 -0300
Date: Fri, 19 Apr 2024 09:40:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 5/7] iommu/riscv: Device directory management.
Message-ID: <20240419124017.GC223006@ziepe.ca>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <232b2824d5dfd9b8dcb3553bfd506444273c3305.1713456598.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <232b2824d5dfd9b8dcb3553bfd506444273c3305.1713456598.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_054026_212456_6C97F671 
X-CRM114-Status: GOOD (  29.56  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2024 at 09:32:23AM -0700, Tomasz Jeznach wrote:
> @@ -31,13 +32,350 @@ MODULE_LICENSE("GPL");
>  /* Timeouts in [us] */
>  #define RISCV_IOMMU_DDTP_TIMEOUT	50000
>  
> -static int riscv_iommu_attach_identity_domain(struct iommu_domain *domain,
> -					      struct device *dev)
> +/* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
> +#define phys_to_ppn(va)  (((va) >> 2) & (((1ULL << 44) - 1) << 10))
> +#define ppn_to_phys(pn)	 (((pn) << 2) & (((1ULL << 44) - 1) << 12))
> +
> +#define dev_to_iommu(dev) \
> +	container_of((dev)->iommu->iommu_dev, struct riscv_iommu_device, iommu)

We have iommu_get_iommu_dev() now

> +static unsigned long riscv_iommu_get_pages(struct riscv_iommu_device *iommu, unsigned int order)
> +{
> +	struct riscv_iommu_devres *devres;
> +	struct page *pages;
> +
> +	pages = alloc_pages_node(dev_to_node(iommu->dev),
> +				 GFP_KERNEL_ACCOUNT | __GFP_ZERO, order);
> +	if (unlikely(!pages)) {
> +		dev_err(iommu->dev, "Page allocation failed, order %u\n", order);
> +		return 0;
> +	}

This needs adjusting for the recently merged allocation accounting

> +static int riscv_iommu_attach_domain(struct riscv_iommu_device *iommu,
> +				     struct device *dev,
> +				     struct iommu_domain *iommu_domain)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct riscv_iommu_dc *dc;
> +	u64 fsc, ta, tc;
> +	int i;
> +
> +	if (!iommu_domain) {
> +		ta = 0;
> +		tc = 0;
> +		fsc = 0;
> +	} else if (iommu_domain->type == IOMMU_DOMAIN_IDENTITY) {
> +		ta = 0;
> +		tc = RISCV_IOMMU_DC_TC_V;
> +		fsc = FIELD_PREP(RISCV_IOMMU_DC_FSC_MODE, RISCV_IOMMU_DC_FSC_MODE_BARE);
> +	} else {
> +		/* This should never happen. */
> +		return -ENODEV;
> +	}

Please don't write it like this. This function is already being called
by functions that are already under specific ops, don't check
domain->type here.

Instead have the caller compute and pass in the ta/tc/fsc
values. Maybe in a tidy struct..

> +	/* Update existing or allocate new entries in device directory */
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i], !iommu_domain);
> +		if (!dc && !iommu_domain)
> +			continue;
> +		if (!dc)
> +			return -ENODEV;

But if this fails some of the fwspecs were left in a weird state ?

Drivers should try hard to have attach functions that fail and make no
change at all or fully succeed.

Meaning ideally preallocate any required memory before doing any
change to the HW visable structures.

> +
> +		/* Swap device context, update TC valid bit as the last operation */
> +		xchg64(&dc->fsc, fsc);
> +		xchg64(&dc->ta, ta);
> +		xchg64(&dc->tc, tc);

This doesn't loook right? When you get to adding PAGING suport fsc has
the page table pfn and ta has the cache tag, so this will end up
tearing the data for sure, eg when asked to replace a PAGING domain
with another PAGING domain? That will create a functional/security
problem, right?

I would encourage you to re-use the ARM sequencing code, ideally moved
to some generic helper library. Every iommu driver dealing with
multi-quanta descriptors seems to have this same fundamental
sequencing problem.

> +static void riscv_iommu_release_device(struct device *dev)
> +{
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +
> +	riscv_iommu_attach_domain(iommu, dev, NULL);
> +}

The release_domain has landed too now. Please don't invent weird NULL
domain types that have special meaning. I assume clearing the V bit is
a blocking behavior? So please implement a proper blocking domain and
set release_domain = &riscv_iommu_blocking and just omit this release
function.

> @@ -133,12 +480,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>  	rc = riscv_iommu_init_check(iommu);
>  	if (rc)
>  		return dev_err_probe(iommu->dev, rc, "unexpected device state\n");
> -	/*
> -	 * Placeholder for a complete IOMMU device initialization.
> -	 * For now, only bare minimum: enable global identity mapping mode and register sysfs.
> -	 */
> -	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP,
> -			   FIELD_PREP(RISCV_IOMMU_DDTP_MODE, RISCV_IOMMU_DDTP_MODE_BARE));
> +
> +	rc = riscv_iommu_ddt_alloc(iommu);
> +	if (WARN(rc, "cannot allocate device directory\n"))
> +		goto err_init;

memory allocation failure already makes noisy prints, more prints are
not needed..

> +	rc = riscv_iommu_set_ddtp_mode(iommu, RISCV_IOMMU_DDTP_MODE_MAX);
> +	if (WARN(rc, "cannot enable iommu device\n"))
> +		goto err_init;

This is not a proper use of WARN, it should only be used for things
that cannot happen not undesired error paths.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
