Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E01C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NNBzqmPBTVZMA41iylraM9ZCYY16ZurStu1mfmoQqc=; b=UQ/kGDaJCZO0GV
	WQjjU2LUieeiTWFOpAveJv/fvAs+VwQQ73/nsEdcldNwRQTc0Tdh//ELFNSmn95s9D5rBi9bh5PNo
	/tSQOuVhQSGL3QPs4qGHtyJ5NgHSrUSe75llJcP6hXVBdLflkIvE0sNRKJL/xT88uKV+Mr7G0wF4r
	SJvCs4j9nhMlLTenyGcaaYefnivRtwgTNnC1j4jKf41aKWpOXPIPGnHOk8Pq+nTUseAYMSpQFSxKj
	VzHr9TiePo9SaMWhvBcMQVQSj50rVFvsvfVnxW2MibKeqyRvdUYo+6vYxNSojfnvkMZD0iMUYLXVs
	g+1SK0N9bYNd+s2cpLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnnG-00000005fKR-1lTy;
	Fri, 19 Apr 2024 12:56:42 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnnC-00000005fIt-0KQA
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 12:56:40 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3c7498041cfso301105b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1713531390; x=1714136190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qAnQXOAIIj9oS1dVAkkGazDr3oWNNZyu5Ad+/xAUOSA=;
        b=IsKiRAynuR2Nc20t2BPddI1d6h2goJc/DCs2idGcvfkX9eHuisaygqC4522FqEFNyl
         ls95cxjFWMHS61shPqSxEfq2pAfFIR17C1/3ZLR90PyzNgc5UdFR3ackfzVdqHgEqJYj
         3utUdlT2yq8ccTuZP30tgEi9ilapP4+CnxndM2U02qdoYAYMmlwBZ7PArRUzE8BXjQn5
         zp86K0a+JA/6nVbhZYwjxdfuGOsEpzjdH1E3/STrsSMKPDWcyoOGqAWdC2Z0SKyKdR2O
         owg4A52eGd9C64AvA/aN8gMHCW1hhedVFbT0qN0vLp45A7HRSDiqhgqJ6Njf1l+OzXDV
         g6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713531390; x=1714136190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAnQXOAIIj9oS1dVAkkGazDr3oWNNZyu5Ad+/xAUOSA=;
        b=oHwxO1ObvzYXtF7VONnJVqgPjjzZR8Uao7WWEVlOXCKIh4f2pq8CBCxSJ2V9vD5buF
         LPdYbSSXEYn8is5RN+NLlpqMfRLijtzVNzsCYL75JxXLeeBgHQ5qpFLkUdfGZX7x9EHC
         CdAdqWv8msq15HNq4w+kk6MKyNolphlcjyWKJJ1QLagVXHxXc19WbQY8hbJWqH7sYoqJ
         H5b9uaph2/23hgs5vccDUifmgY9XfVMyScgD3+yB8xm6ePz482uk2zi8qktXALxA3Qb5
         CTSluST999DEUAorW9NTKq/u3QRdG9PI1BucAxpsBS35sojVtAznGhALdrAS1Az7rFqu
         br5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVvt0uHpCmnsJChuHEgM97iMl+PZn7rDqVxcVM+1P+/NUOsuu7ITB+6u70sZAayMAWh5d6bJ6R4cm61u3n/zcvslMCZP2BY2LorbwMFKIA
X-Gm-Message-State: AOJu0YzKY8AXIphzSWwFi9oGi9mQ3Oq7kH1CvtD3m04GnlHIs0aFMW5e
	92DXeGhY62RNPUIoHzPzO24GYAOlf1SiTccLtdWmv+zHJhJTWsR8xY7140klPpU=
X-Google-Smtp-Source: AGHT+IHFfBcis79UcRir4VffHs5X6NLftoITO/91C4p4EpS7Z44Ysxagpcl0DozKM758wLJf4tJP1g==
X-Received: by 2002:a05:6870:2d4:b0:22e:9901:ede4 with SMTP id r20-20020a05687002d400b0022e9901ede4mr2180580oaf.38.1713531389153;
        Fri, 19 Apr 2024 05:56:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id t20-20020a05683014d400b006eb77e42ff5sm691060otq.26.2024.04.19.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:56:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rxnn1-00FPgO-MQ;
	Fri, 19 Apr 2024 09:56:27 -0300
Date: Fri, 19 Apr 2024 09:56:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
Message-ID: <20240419125627.GD223006@ziepe.ca>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_055638_151040_DDC4E811 
X-CRM114-Status: GOOD (  32.42  )
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

On Thu, Apr 18, 2024 at 09:32:25AM -0700, Tomasz Jeznach wrote:

> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index a4f74588cdc2..32ddc372432d 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -46,6 +46,10 @@ MODULE_LICENSE("GPL");
>  #define dev_to_iommu(dev) \
>  	container_of((dev)->iommu->iommu_dev, struct riscv_iommu_device, iommu)
>  
> +/* IOMMU PSCID allocation namespace. */
> +static DEFINE_IDA(riscv_iommu_pscids);
> +#define RISCV_IOMMU_MAX_PSCID		BIT(20)
> +

You may consider putting this IDA in the riscv_iommu_device() and move
the pscid from the domain to the bond?

>  /* Device resource-managed allocations */
>  struct riscv_iommu_devres {
>  	unsigned long addr;
> @@ -752,12 +756,77 @@ static int riscv_iommu_ddt_alloc(struct riscv_iommu_device *iommu)
>  	return 0;
>  }
>  
> +struct riscv_iommu_bond {
> +	struct list_head list;
> +	struct rcu_head rcu;
> +	struct device *dev;
> +};
> +
> +/* This struct contains protection domain specific IOMMU driver data. */
> +struct riscv_iommu_domain {
> +	struct iommu_domain domain;
> +	struct list_head bonds;
> +	int pscid;
> +	int numa_node;
> +	int amo_enabled:1;
> +	unsigned int pgd_mode;
> +	/* paging domain */
> +	unsigned long pgd_root;
> +};

Glad to see there is no riscv_iommu_device pointer in the domain!

> +static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
> +				    unsigned long start, unsigned long end)
> +{
> +	struct riscv_iommu_bond *bond;
> +	struct riscv_iommu_device *iommu;
> +	struct riscv_iommu_command cmd;
> +	unsigned long len = end - start + 1;
> +	unsigned long iova;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> +		iommu = dev_to_iommu(bond->dev);

Pedantically this locking isn't locked right, there is technically
nothing that prevents bond->dev and the iommu instance struct from
being freed here. eg iommufd can hit races here if userspace can hot
unplug devices.

I suggest storing the iommu pointer itself in the bond instead of the
device then add a synchronize_rcu() to the iommu unregister path.

> +		riscv_iommu_cmd_inval_vma(&cmd);
> +		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
> +		if (len > 0 && len < RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
> +			for (iova = start; iova < end; iova += PAGE_SIZE) {
> +				riscv_iommu_cmd_inval_set_addr(&cmd, iova);
> +				riscv_iommu_cmd_send(iommu, &cmd, 0);
> +			}
> +		} else {
> +			riscv_iommu_cmd_send(iommu, &cmd, 0);
> +		}
> +	}

This seems suboptimal, you probably want to copy the new design that
Intel is doing where you allocate "bonds" that are already
de-duplicated. Ie if I have 10 devices on the same iommu sharing the
domain the above will invalidate the PSCID 10 times. It should only be
done once.

ie add a "bond" for the (iommu,pscid) and refcount that based on how
many devices are used. Then another "bond" for the ATS stuff eventually.

> +
> +	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> +		iommu = dev_to_iommu(bond->dev);
> +
> +		riscv_iommu_cmd_iofence(&cmd);
> +		riscv_iommu_cmd_send(iommu, &cmd, RISCV_IOMMU_QUEUE_TIMEOUT);
> +	}
> +	rcu_read_unlock();
> +}
> +

> @@ -787,12 +870,390 @@ static int riscv_iommu_attach_domain(struct riscv_iommu_device *iommu,
>  		xchg64(&dc->ta, ta);
>  		xchg64(&dc->tc, tc);
>  
> -		/* Device context invalidation will be required. Ignoring for now. */
> +		if (!(tc & RISCV_IOMMU_DC_TC_V))
> +			continue;

No negative caching in HW?

> +		/* Invalidate device context cache */
> +		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
> +		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
> +		riscv_iommu_cmd_send(iommu, &cmd, 0);
> +
> +		if (FIELD_GET(RISCV_IOMMU_PC_FSC_MODE, fsc) == RISCV_IOMMU_DC_FSC_MODE_BARE)
> +			continue;
> +
> +		/* Invalidate last valid PSCID */
> +		riscv_iommu_cmd_inval_vma(&cmd);
> +		riscv_iommu_cmd_inval_set_pscid(&cmd, FIELD_GET(RISCV_IOMMU_DC_TA_PSCID, ta));
> +		riscv_iommu_cmd_send(iommu, &cmd, 0);
> +	}
> +
> +	/* Synchronize directory update */
> +	riscv_iommu_cmd_iofence(&cmd);
> +	riscv_iommu_cmd_send(iommu, &cmd, RISCV_IOMMU_IOTINVAL_TIMEOUT);
> +
> +	/* Track domain to devices mapping. */
> +	if (bond)
> +		list_add_rcu(&bond->list, &domain->bonds);

This is in the wrong order, the invalidation on the pscid needs to
start before the pscid is loaded into HW in the first place otherwise
concurrent invalidations may miss HW updates.

> +
> +	/* Remove tracking from previous domain, if needed. */
> +	iommu_domain = iommu_get_domain_for_dev(dev);
> +	if (iommu_domain && !!(iommu_domain->type & __IOMMU_DOMAIN_PAGING)) {

No need for !!, && is already booleanizing

> +		domain = iommu_domain_to_riscv(iommu_domain);
> +		bond = NULL;
> +		rcu_read_lock();
> +		list_for_each_entry_rcu(b, &domain->bonds, list) {
> +			if (b->dev == dev) {
> +				bond = b;
> +				break;
> +			}
> +		}
> +		rcu_read_unlock();
> +
> +		if (bond) {
> +			list_del_rcu(&bond->list);
> +			kfree_rcu(bond, rcu);
> +		}
> +	}
> +
> +	return 0;
> +}

> +static inline size_t get_page_size(size_t size)
> +{
> +	if (size >= IOMMU_PAGE_SIZE_512G)
> +		return IOMMU_PAGE_SIZE_512G;
> +	if (size >= IOMMU_PAGE_SIZE_1G)
> +		return IOMMU_PAGE_SIZE_1G;
> +	if (size >= IOMMU_PAGE_SIZE_2M)
> +		return IOMMU_PAGE_SIZE_2M;
> +	return IOMMU_PAGE_SIZE_4K;
> +}
> +
> +#define _io_pte_present(pte)	((pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE))
> +#define _io_pte_leaf(pte)	((pte) & _PAGE_LEAF)
> +#define _io_pte_none(pte)	((pte) == 0)
> +#define _io_pte_entry(pn, prot)	((_PAGE_PFN_MASK & ((pn) << _PAGE_PFN_SHIFT)) | (prot))
> +
> +static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
> +				 unsigned long pte, struct list_head *freelist)
> +{
> +	unsigned long *ptr;
> +	int i;
> +
> +	if (!_io_pte_present(pte) || _io_pte_leaf(pte))
> +		return;
> +
> +	ptr = (unsigned long *)pfn_to_virt(__page_val_to_pfn(pte));
> +
> +	/* Recursively free all sub page table pages */
> +	for (i = 0; i < PTRS_PER_PTE; i++) {
> +		pte = READ_ONCE(ptr[i]);
> +		if (!_io_pte_none(pte) && cmpxchg_relaxed(ptr + i, pte, 0) == pte)
> +			riscv_iommu_pte_free(domain, pte, freelist);
> +	}
> +
> +	if (freelist)
> +		list_add_tail(&virt_to_page(ptr)->lru, freelist);
> +	else
> +		free_page((unsigned long)ptr);
> +}

Consider putting the page table handling in its own file?

> +static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
> +					    struct device *dev)
> +{
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> +	struct page *page;
> +
> +	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
> +		return -ENODEV;
> +
> +	domain->numa_node = dev_to_node(iommu->dev);
> +	domain->amo_enabled = !!(iommu->caps & RISCV_IOMMU_CAP_AMO_HWAD);
> +
> +	if (!domain->pgd_root) {
> +		page = alloc_pages_node(domain->numa_node,
> +					GFP_KERNEL_ACCOUNT | __GFP_ZERO, 0);
> +		if (!page)
> +			return -ENOMEM;
> +		domain->pgd_root = (unsigned long)page_to_virt(page);

The pgd_root should be allocated by the alloc_paging function, not
during attach. There is no locking here that will protect against
concurrent attach and also map before attach should work.

You can pick up the numa affinity from the alloc paging dev pointer
(note it may be null still in some cases)

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
