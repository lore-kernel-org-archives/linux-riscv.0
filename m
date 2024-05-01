Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C85C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ujbq0uFTgIhI3PuYCdFUYRR9EYxvY24jsoizcBQBiIs=; b=1XVPyaZp2nW9Rj
	6OXLXBkmw5O7gMvEHuKRsl0TsKBKaE6qxogyDTf/mpePixJBqbSppDR1vOe3K4mOHSkrnmxoEahbz
	gAn4SMcbEDXTgj6eoFunPPdA/v6aitARQRp13vxr19Q47rKO1T3muQKUlx/IzHrzEBVgiHYlR4uij
	nBrI+KBee4mtUU+y9kzmUppY6KcOUFOGKnm8MnGjBYlcX6XPm8QB8EKpcsgERQxHMoQLQ25upzREn
	zDDlKonMToTMn5xZFFCGdRg0abVLJ5OHof4C4q1d3M2UjsJIgG35yAIjzCLXJmmKEWLR+d6CjrvRL
	/cGx4GWlTrDh+BgcxJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2BNk-00000009rg0-27XW;
	Wed, 01 May 2024 14:56:28 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2BNh-00000009reT-0dab
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 14:56:26 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-790c36dcee9so342383185a.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714575383; x=1715180183; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJGnH6JMeRVIDCgE3fOFl84u0C8yQJQw2QrSPFhIV3E=;
        b=cr1ChBSaEbk5z4kKsi7NLdA3V4/0xevhxVPDHd8Ruaf/qDNtxUmMifGekuOLcNp3Ej
         QaGPgXd7XN8fvbZlvty7PFQd80iKE9BV/Te1UAVdWt1GTjb3b7z8uq6pDDG3kRManDic
         ud7CETYqs//prmHe4A+R/lvqlwBjI/zQ0C2YuwudIJ0dLDA2h+TMqxf7x1KY4xLpqBE+
         Uy44LQmklvQLPU052Qy8h1/9pn94HGF4wBCpjS/wrOvhOFhcZKte39m1Epo7pAgIwIt3
         7MYuMqbuKA1Ez8IpUOxTXsQHVgzewH/uJRlcPNDc2HVPqeTLPGXOinH+03PHp+37DMMj
         UD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714575383; x=1715180183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJGnH6JMeRVIDCgE3fOFl84u0C8yQJQw2QrSPFhIV3E=;
        b=qD6hAX70d7owEFOuMgGf3EAihHwgab7q/6rMkjA7HJhNGGLP4KvSbOmaOujhJnpz7X
         t8SenqCz51O+pocSfEeIYMn1uqBW5v085gxDBnaoduxDHzJYANN2sparqB47uZuUuk3T
         s9uvDg0kGhBLGIps4dqkVe/ldsO4Cf6xS7/GYXUv64/UWd3gfIC3R07u+ff9iXGWzWj9
         DSvSc+GSxQUA0Y8U1tU4TnyMwpdx4CvOFQiNcvYhN7X+VpafRbKiJd3EQYEhptVsbDqM
         6OcKpQRi/lN0y+7GXMinAesQJihrK/XAdC5kTv78hypA+2j30sGrtWIwWmGWIp9TaEk/
         fkpg==
X-Forwarded-Encrypted: i=1; AJvYcCXUu24qJzGdM/wvXbqjM3BPvPjiP9b2IciChO9lU5S4BKbyxSvKqz910PogtM+se6+ThVOD48250TQRDA/h/tI5JPByQn7QLF29xq4GyD7q
X-Gm-Message-State: AOJu0YxSvSvKHqx/5xKxRbJ6Jx9/SbixImPL0qnDuBubypUFsfkzApl+
	5Ig/hOqBSdKXt19ZbR9faNjywQf3yWJaoyEqsLkj+gmiVGxezmnUKiQWTuEtYpU=
X-Google-Smtp-Source: AGHT+IG0qIFy2caBLvcDGBIvg4IVVCR5d+JtATohiEj0n9TMLtXKBV4S0Llv/scMqMPm8vuwzEv6aw==
X-Received: by 2002:a05:620a:1787:b0:78f:280:90f8 with SMTP id ay7-20020a05620a178700b0078f028090f8mr3155974qkb.78.1714575382931;
        Wed, 01 May 2024 07:56:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id p2-20020a05620a22e200b00790ef37673fsm2901144qki.7.2024.05.01.07.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:56:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s2BNd-00Dc3Y-Hd;
	Wed, 01 May 2024 11:56:21 -0300
Date: Wed, 1 May 2024 11:56:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
Message-ID: <20240501145621.GD1723318@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_075625_220178_2E61D162 
X-CRM114-Status: GOOD (  26.50  )
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

On Tue, Apr 30, 2024 at 01:01:57PM -0700, Tomasz Jeznach wrote:

> +#define iommu_domain_to_riscv(iommu_domain) \
> +	container_of(iommu_domain, struct riscv_iommu_domain, domain)
> +
> +#define dev_to_domain(dev) \
> +	iommu_domain_to_riscv(dev_iommu_priv_get(dev))

Please use the priv properly and put a struct around it, you'll
certainly need this eventually to do the rest of the advanced
features.

> +static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain, struct device *dev)
> +{
> +	struct riscv_iommu_bond *bond, *found = NULL;
> +	unsigned long flags;
> +
> +	if (!domain)
> +		return;
> +
> +	spin_lock_irqsave(&domain->lock, flags);

This is never locked from an irq, you don't need to use the irqsave
variations.

> +	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> +		if (bond->dev == dev) {
> +			list_del_rcu(&bond->list);
> +			found = bond;
> +		}
> +	}
> +	spin_unlock_irqrestore(&domain->lock, flags);
> +
> +	/* Release and wait for all read-rcu critical sections have completed. */
> +	kfree_rcu(found, rcu);
> +	synchronize_rcu();

Please no, synchronize_rcu() on a path like this is not so
reasonable.. Also you don't need kfree_rcu() if you write it like this.

This still looks better to do what I said before, put the iommu not
the dev in the bond struct.


> +static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
> +{
> +	struct riscv_iommu_domain *domain;
> +	struct riscv_iommu_device *iommu;
> +
> +	iommu = dev ? dev_to_iommu(dev) : NULL;
> +	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +	if (!domain)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD_RCU(&domain->bonds);
> +	spin_lock_init(&domain->lock);
> +	domain->numa_node = NUMA_NO_NODE;
> +
> +	/*
> +	 * Follow system address translation mode.
> +	 * RISC-V IOMMU ATP mode values match RISC-V CPU SATP mode values.
> +	 */
> +	domain->pgd_mode = satp_mode >> SATP_MODE_SHIFT;

This seems really strange, the iommu paging domains should be
unrelated to what the CPU is doing. There is no connection between
these two concepts.

Just pick a size that the iommu supports.

The number of radix levels is a tunable alot of iommus have that we
haven't really exposed to anything else yet.

> +	/*
> +	 * Note: RISC-V Privilege spec mandates that virtual addresses
> +	 * need to be sign-extended, so if (VA_BITS - 1) is set, all
> +	 * bits >= VA_BITS need to also be set or else we'll get a
> +	 * page fault. However the code that creates the mappings
> +	 * above us (e.g. iommu_dma_alloc_iova()) won't do that for us
> +	 * for now, so we'll end up with invalid virtual addresses
> +	 * to map. As a workaround until we get this sorted out
> +	 * limit the available virtual addresses to VA_BITS - 1.
> +	 */
> +	domain->domain.geometry.aperture_start = 0;
> +	domain->domain.geometry.aperture_end = DMA_BIT_MASK(VA_BITS - 1);
> +	domain->domain.geometry.force_aperture = true;

Yikes.. This is probably the best solution long term anyhow, unless
you need to use the last page in VFIO for some reason.
  
>  static int riscv_iommu_device_domain_type(struct device *dev)
>  {
> -	return IOMMU_DOMAIN_IDENTITY;
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +
> +	if (iommu->ddt_mode == RISCV_IOMMU_DDTP_MODE_BARE)
> +		return IOMMU_DOMAIN_IDENTITY;
> +

Is there even a point of binding an iommu driver if the HW can't
support a DDT table? Just return -ENODEV from probe_device?

Logically a iommu block that can't decode the RID has no association
at all with a Linux struct device :)

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
