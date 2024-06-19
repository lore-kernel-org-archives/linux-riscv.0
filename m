Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67BC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7gtC2LuknEz9d1hVGW5yvH72tTBYkn9Mhi3drPZxts=; b=FRMLYUYo/Czadm
	Iz8AEjm9+2I7fzr5e3CSy6PKNfbhC7kbCuSQyC3RbdCFi5TXFfRGVWleC+qEFEwRZ/gFkqyXPmUFz
	gstx7HypPCyKvKU3KFL5JgX+aOLn7RrejO2SsZ+hRr2f5mnbp2eaRMV3Sfq60Bp6TPFyW8IT3FcsX
	nglmxZLEszYRfsxYV9uTFDXogKj/S20LJ7NG+Tn/ucBIlnC9fyPEJpgNqAIa29koQ1X8PgypbbDbk
	PU6Ni7X/xnLrs3uME39tm11EYBjHC9f7bYMlIh8CJmKb3e4sZ7EkVqVWGD/99CfuGHd2yiBF9rMIV
	YAe81HbDqhQzYh6I9BiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxlK-00000001xML-28xF;
	Wed, 19 Jun 2024 16:02:18 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxlI-00000001xL1-04hL
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 16:02:17 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7955aaf8006so509925885a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718812933; x=1719417733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RMG38VvaZOpUh70iiE4L/zQoQv1cHzQG+9/P79OpBlo=;
        b=mgfLcISL8u0YPcjkhY0KULZx+jH8JyR73+3KFZXU5CdXZk0cUTauOU5HdDZFIppmLd
         uhSXKu2f3h4h/WsiIcwtEEWh9oAp1PUpZ/1D2UGr0bPpOniZBWm8FRDDTng5IxGc778s
         zPFcYH8AsN1+FQq3A2SYMcw60n6Fn3yDmcZS9OCOsTgqH7ipwAXJO/0bjfQd8Amrf7Xs
         T5Yd5ZBoq5gqydzlg15vORNHT0TONSChjo3xKdr8bsaWpUn0FKFjhnxrpitwSfCP25pm
         CX82GKcu3RLP0G0Cy7wG/hDQlexO0OcH7Io6GYDVbTs9x3Lrh+/unK9ZB2DW0wMETe32
         sMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812933; x=1719417733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMG38VvaZOpUh70iiE4L/zQoQv1cHzQG+9/P79OpBlo=;
        b=v4NBgAaGuFXHoojZanW0mp2mViwtrbC+1PaxYxS7gntQDTXjMHj6HRe6oIKaz0/CiW
         /2w55jEf+NS1pscaG5i75xoAOfT7VnaPPrMpkjr8ahA2V6gSmR3zYLT+hHiwSJiheOLs
         44pnl18RkYn4qJ67VZstxDuTcl/vGpLAdMHpHKv3G5caj7WoAWv2hiybIGn5v/Z7gQMS
         T9k1KGrewKX2Naaoxvd2YKTq8Z5PrxC0rFRspJVXU/kZ1yqJzDt/72oJVozEOhH/NAEU
         hqHNdEVFJq3yGkvwRFpP5MvaBZBk9Pu+8HOTKwsWxrJuAMgO4Lhu0oZDGU5xcLo74B0i
         xMVA==
X-Forwarded-Encrypted: i=1; AJvYcCU/S8Z7HWr3p7dL8iCCnzIhCjnJgS+PoSQ5z6HKuj5wyQb3gFiHHkMFv/bUOayudwI1I0er6yiM+YqERqknbteJ6NPPnPdg1RFoU9CNkHM4
X-Gm-Message-State: AOJu0YwXE9gifV5NvpmuvxaCZU+PxhviRHmnakVqHH3DyyI5GdgCaS5C
	8Mm7kAV26/Di94GjW/6oiDMlx/f4OhLXu4SPK3MPHhQdvBddogdsIkcYbr7aDTU=
X-Google-Smtp-Source: AGHT+IFAZu+7EYaEUAG4cCP50G/RTGHBQc4N5S+TCXNrJ9Eqk9VbuFGXZo9VdN3NMZQe71v4p6Tf7w==
X-Received: by 2002:a05:620a:459e:b0:797:a72e:6793 with SMTP id af79cd13be357-79bb3e1176emr329833485a.8.1718812932938;
        Wed, 19 Jun 2024 09:02:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe69dffsm618459085a.126.2024.06.19.09.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 09:02:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJxlD-0051Ca-Va;
	Wed, 19 Jun 2024 13:02:11 -0300
Date: Wed, 19 Jun 2024 13:02:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 07/10] iommu/riscv: support nested iommu for
 creating domains owned by userspace
Message-ID: <20240619160211.GO1091770@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-8-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614142156.29420-8-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_090216_120411_55209C22 
X-CRM114-Status: GOOD (  44.06  )
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

On Fri, Jun 14, 2024 at 10:21:53PM +0800, Zong Li wrote:
> This patch implements .domain_alloc_user operation for creating domains
> owend by userspace, e.g. through IOMMUFD. Add s2 domain for parent
> domain for second stage, s1 domain will be the first stage.
> 
> Don't remove IOMMU private data of dev in blocked domain, because it
> holds the user data of device, which is used when attaching device into
> s1 domain.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/iommu/riscv/iommu.c  | 236 ++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/iommufd.h |  17 +++
>  2 files changed, 252 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 2130106e421f..410b236e9b24 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -846,6 +846,8 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
>  
>  /* This struct contains protection domain specific IOMMU driver data. */
>  struct riscv_iommu_domain {
> +	struct riscv_iommu_domain *s2;
> +	struct riscv_iommu_device *iommu;

IMHO you should create a riscv_iommu_domain_nested and not put these
here, like ARM did.

The kernel can't change the nested domain so it can't recieve and
distribute invalidations.

> +/**
> + * Nested IOMMU operations
> + */
> +
> +static int riscv_iommu_attach_dev_nested(struct iommu_domain *domain, struct device *dev)
> +{
> +	struct riscv_iommu_domain *riscv_domain = iommu_domain_to_riscv(domain);
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +
> +	/*
> +	 * Add bond to the new domain's list, but don't unlink in current domain.
> +	 * We need to flush entries in stage-2 page table by iterating the list.
> +	 */
> +	if (riscv_iommu_bond_link(riscv_domain, dev))
> +		return -ENOMEM;
> +
> +	riscv_iommu_iotlb_inval(riscv_domain, 0, ULONG_MAX);
> +	info->dc_user.ta |= RISCV_IOMMU_PC_TA_V;

Seems odd??

> +	riscv_iommu_iodir_update(iommu, dev, &info->dc_user);

This will be need some updating to allow changes that don't toggle
V=0, like in arm.

> +	info->domain = riscv_domain;
> +
> +	return 0;
> +}
> +
> +static void riscv_iommu_domain_free_nested(struct iommu_domain *domain)
> +{
> +	struct riscv_iommu_domain *riscv_domain = iommu_domain_to_riscv(domain);
> +	struct riscv_iommu_bond *bond;
> +
> +	/* Unlink bond in s2 domain, because we link bond both on s1 and s2 domain */
> +	list_for_each_entry_rcu(bond, &riscv_domain->s2->bonds, list)
> +		riscv_iommu_bond_unlink(riscv_domain->s2, bond->dev);
> +
> +	if ((int)riscv_domain->pscid > 0)
> +		ida_free(&riscv_iommu_pscids, riscv_domain->pscid);
> +
> +	kfree(riscv_domain);
> +}
> +
> +static const struct iommu_domain_ops riscv_iommu_nested_domain_ops = {
> +	.attach_dev	= riscv_iommu_attach_dev_nested,
> +	.free		= riscv_iommu_domain_free_nested,
> +};
> +
> +static int
> +riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_arg)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +	struct riscv_iommu_dc dc;
> +	struct riscv_iommu_fq_record event;
> +	u64 dc_len = sizeof(struct riscv_iommu_dc) >>
> +		     (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT));
> +	u64 event_len = sizeof(struct riscv_iommu_fq_record);
> +	void __user *event_user = NULL;
> +
> +	for (int i = 0; i < fwspec->num_ids; i++) {
> +		event.hdr =
> +			FIELD_PREP(RISCV_IOMMU_FQ_HDR_CAUSE, RISCV_IOMMU_FQ_CAUSE_DDT_INVALID) |
> +			FIELD_PREP(RISCV_IOMMU_FQ_HDR_DID, fwspec->ids[i]);
> +
> +		/* Sanity check DC of stage-1 from user data */
> +		if (!user_arg->out_event_uptr || user_arg->event_len != event_len)
> +			return -EINVAL;

This is not extensible, see below about just inlining it.

> +		event_user = u64_to_user_ptr(user_arg->out_event_uptr);
> +
> +		if (!user_arg->dc_uptr || user_arg->dc_len != dc_len)
> +			return -EINVAL;
> +
> +		if (copy_from_user(&dc, u64_to_user_ptr(user_arg->dc_uptr), dc_len))
> +			return -EFAULT;
> +
> +		if (!(dc.tc & RISCV_IOMMU_DDTE_V)) {
> +			dev_dbg(dev, "Invalid DDT from user data\n");
> +			if (copy_to_user(event_user, &event, event_len))
> +				return -EFAULT;
> +		}

On ARM we are going to support non-valid STEs. It should put the the
translation into blocking and ideally emulate translation failure
events.

> +
> +		if (!dc.fsc || dc.iohgatp) {
> +			dev_dbg(dev, "Wrong page table from user data\n");
> +			if (copy_to_user(event_user, &event, event_len))
> +				return -EFAULT;
> +		}
> +
> +		/* Save DC of stage-1 from user data */
> +		memcpy(&info->dc_user,
> +		       riscv_iommu_get_dc(iommu, fwspec->ids[i]),

This does not seem right, the fwspec shouldn't be part of domain
allocation, even arguably for nesting. The nesting domain should
represent the user_dc only. Any customization of kernel controlled bits
should be done during attach only, nor do I really understand why this
is looping over all the fwspecs but only memcpying the last one..

> +		       sizeof(struct riscv_iommu_dc));
> +		info->dc_user.fsc = dc.fsc;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct iommu_domain *
> +riscv_iommu_domain_alloc_nested(struct device *dev,
> +				struct iommu_domain *parent,
> +				const struct iommu_user_data *user_data)
> +{
> +	struct riscv_iommu_domain *s2_domain = iommu_domain_to_riscv(parent);
> +	struct riscv_iommu_domain *s1_domain;
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +	struct iommu_hwpt_riscv_iommu arg;
> +	int ret, va_bits;
> +
> +	if (user_data->type != IOMMU_HWPT_DATA_RISCV_IOMMU)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	if (parent->type != IOMMU_DOMAIN_UNMANAGED)
> +		return ERR_PTR(-EINVAL);
> +
> +	ret = iommu_copy_struct_from_user(&arg,
> +					  user_data,
> +					  IOMMU_HWPT_DATA_RISCV_IOMMU,
> +					  out_event_uptr);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	s1_domain = kzalloc(sizeof(*s1_domain), GFP_KERNEL);
> +	if (!s1_domain)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spin_lock_init(&s1_domain->lock);
> +	INIT_LIST_HEAD_RCU(&s1_domain->bonds);
> +
> +	s1_domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
> +					   RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
> +	if (s1_domain->pscid < 0) {
> +		iommu_free_page(s1_domain->pgd_root);
> +		kfree(s1_domain);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* Get device context of stage-1 from user*/
> +	ret = riscv_iommu_get_dc_user(dev, &arg);
> +	if (ret) {
> +		kfree(s1_domain);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (!iommu) {
> +		va_bits = VA_BITS;
> +	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
> +		va_bits = 57;
> +	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
> +		va_bits = 48;
> +	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
> +		va_bits = 39;
> +	} else {
> +		dev_err(dev, "cannot find supported page table mode\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	/*
> +	 * The ops->domain_alloc_user could be directly called by the iommufd core,
> +	 * instead of iommu core. So, this function need to set the default value of
> +	 * following data member:
> +	 *  - domain->pgsize_bitmap
> +	 *  - domain->geometry
> +	 *  - domain->type
> +	 *  - domain->ops
> +	 */
> +	s1_domain->s2 = s2_domain;
> +	s1_domain->iommu = iommu;
> +	s1_domain->domain.type = IOMMU_DOMAIN_NESTED;
> +	s1_domain->domain.ops = &riscv_iommu_nested_domain_ops;
> +	s1_domain->domain.pgsize_bitmap = SZ_4K;
> +	s1_domain->domain.geometry.aperture_start = 0;
> +	s1_domain->domain.geometry.aperture_end = DMA_BIT_MASK(va_bits - 1);
> +	s1_domain->domain.geometry.force_aperture = true;

There is no geometry or page size of nesting domains.

> +
> +	return &s1_domain->domain;
> +}
> +
> +static struct iommu_domain *
> +riscv_iommu_domain_alloc_user(struct device *dev, u32 flags,
> +			      struct iommu_domain *parent,
> +			      const struct iommu_user_data *user_data)
> +{
> +	struct iommu_domain *domain;
> +	struct riscv_iommu_domain *riscv_domain;
> +
> +	/* Allocate stage-1 domain if it has stage-2 parent domain */
> +	if (parent)
> +		return riscv_iommu_domain_alloc_nested(dev, parent, user_data);
> +
> +	if (flags & ~((IOMMU_HWPT_ALLOC_NEST_PARENT | IOMMU_HWPT_ALLOC_DIRTY_TRACKING)))
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	if (user_data)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* domain_alloc_user op needs to be fully initialized */
> +	domain = iommu_domain_alloc(dev->bus);

Please organize your driver to avoid calling this core function
through a pointer and return the correct type from the start so you
don't have to cast.

> +	if (!domain)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * We assume that nest-parent or g-stage only will come here
> +	 * TODO: Shadow page table doesn't be supported now.
> +	 *       We currently can't distinguish g-stage and shadow
> +	 *       page table here. Shadow page table shouldn't be
> +	 *       put at stage-2.
> +	 */
> +	riscv_domain = iommu_domain_to_riscv(domain);
> +
> +	/* pgd_root may be allocated in .domain_alloc_paging */
> +	if (riscv_domain->pgd_root)
> +		iommu_free_page(riscv_domain->pgd_root);

And don't do stuff like this, if domain_alloc didn't do the right
stuff then reorganize it so that it does. Most likely pass in a flag
that you are allocating the nest so it can setup properly if it is
only a small change like this.

> +/**
> + * struct iommu_hwpt_riscv_iommu - RISCV IOMMU stage-1 device context table
> + *                                 info (IOMMU_HWPT_TYPE_RISCV_IOMMU)
> + * @dc_len: Length of device context
> + * @dc_uptr: User pointer to the address of device context
> + * @event_len: Length of an event record
> + * @out_event_uptr: User pointer to the address of event record
> + */
> +struct iommu_hwpt_riscv_iommu {
> +	__aligned_u64 dc_len;
> +	__aligned_u64 dc_uptr;

Do we really want this to be a pointer? ARM just inlined it in the
struct, why not do that?

> +	__aligned_u64 event_len;
> +	__aligned_u64 out_event_uptr;
> +};

Similar here too, why not just inline the response memory?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
