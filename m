Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBE0C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLf1p3oQnmYIgR3bBUvN3Hsv2XxDiUE2VM13b3hufx8=; b=X08YXe7460GVLa
	H3qYI0pDWwpooPYa5KjfzG6Ioh5xESgWxXlhD05Oqvr+vLFK6wt6fFSMoTT0f5oFu6pwMmDu6yXwO
	2iZjoLnskCXp1NYQ1p3eRD6fiUbSzpG4muDKRJF5JwFMCM+KQB+rNeoflN4lx83t7LJxyYc4SHk8k
	82ejEw/5FwRzTbduF0OTgvRZBtNOCVZVdrKO+fDxD7UxSEJ73ji/h+xChloODXd76L+ETzOEgcPak
	wa2rw/mUVhdXK3+X70i7WbD7ihOwnRhY26BpqoJCPfefbfIuTxENGDpbb2KaunBGzdqOmca7e0NO+
	20L/PZZK0buJoP1O6bgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJVe-00000000qfE-1Tym;
	Tue, 23 Apr 2024 17:00:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJVa-00000000qeK-3ONb
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 17:00:44 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a58872905b5so56881466b.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 10:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713891641; x=1714496441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kpoRkSgmIbeAMxE5jSosiKeK58hdGccskOzXdueAwo=;
        b=RSX5A197f/tWAUmI/yxetHiUFA1CCBxMtWLVm0+cK7gwSugTUQ6e+hGofI4S79/AUp
         Iz4OJm4MBzqkUahN4tdORBUrcOS8GBZ4Zm691ygs706H3ulCnsUYDsIWGb6JYlFZbhPD
         UBLwj4e66HHwqKl7ln4Lszr63XZw2vZ3mfAMxP1VYHubcYBWhZZnlFZ680cAbe9sptDY
         mkZHTPEKcyKAnGJMYaeCF6FMkyu5prb+2jvXxSOltD1Dfk8ladGrinPtZNkzFVJtQZHv
         DZ+/as+li14GP29WGM9dcjvjm+0e16sB2XCyXsUgqNMf7dyxc8yK1Icm2IsxKRxOcx33
         /5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891641; x=1714496441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kpoRkSgmIbeAMxE5jSosiKeK58hdGccskOzXdueAwo=;
        b=wuOfOi3S7MbQGliL6GBYR+0QiuNuGXsnUZb628xWxKxfnAy3RzQo9VentRN8DZZku4
         OM8Pico6dvX3ZJcUJrWMfHlfnSweUEPr18vIU6cLc8mWs/JXhlD3DhiDNuHWBNgjLEqN
         wB1D2utlzOK82G4jsgOB67b64FQ+waexjXgy0D9lcNsTiEdnhVuzU4sw7aEGtP4XOGp5
         j6WvyJSFOVc50/+/nA1OcPvf9K1s5wollkbrGLgx8aszFAulwZtHqS96Ecs/tHS3MwNd
         KaWAmdTUp9hvFnO6lOcGWhK1PPc/5uLCsmuZtU8eRrP6NabtfsTGH5uUsWTHxBCWk67j
         +GFg==
X-Forwarded-Encrypted: i=1; AJvYcCUa7kNO/iLqiD7r7M4Hlffy3SX4vgwWjp3MwJTtA57u2GHsnRHf2502ccbgreUm+npxEzL4025XDvH/vB2UQGAZ8wTEui/I0/fVzmXm2reO
X-Gm-Message-State: AOJu0Yz0NvN6i5Lh9WKI5CS5+bY3ClkVMBJutwH6ZMDMcqibzqA2M3Wk
	eIK+/8CFtXnd/t/ArorZZBzLU3bO+Q+QxAJlV74eLQtjZOZgkjlmjc5ulu0/mdk=
X-Google-Smtp-Source: AGHT+IGcGANkzjcqPRS58akjvbDATplTwj1qOXK/GFOuWc3MEiIWZm4cD/e4azAjA7fogSoeRMZxBA==
X-Received: by 2002:a17:906:5857:b0:a52:2772:b9cb with SMTP id h23-20020a170906585700b00a522772b9cbmr8740381ejs.24.1713891640539;
        Tue, 23 Apr 2024 10:00:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z18-20020a170906435200b00a4e657a5f1asm7220478ejm.112.2024.04.23.10.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:00:40 -0700 (PDT)
Date: Tue, 23 Apr 2024 19:00:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
Message-ID: <20240423-64e0112d612ab1f011c4b26e@orel>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_100042_888802_FF1682B9 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu, Apr 18, 2024 at 09:32:25AM -0700, Tomasz Jeznach wrote:
...
> +static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
> +				      unsigned long iova, size_t pgsize, size_t pgcount,
> +				      struct iommu_iotlb_gather *gather)
> +{
> +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> +	size_t size = pgcount << __ffs(pgsize);
> +	unsigned long *ptr, old;
> +	size_t unmapped = 0;
> +	size_t pte_size;
> +
> +	while (unmapped < size) {
> +		ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
> +		if (!ptr)
> +			return unmapped;
> +
> +		/* partial unmap is not allowed, fail. */
> +		if (iova & ~(pte_size - 1))
                           ^ Shouldn't this ~ be removed?

> +			return unmapped;
> +
> +		old = READ_ONCE(*ptr);
> +		if (cmpxchg_relaxed(ptr, old, 0) != old)
> +			continue;
> +
> +		iommu_iotlb_gather_add_page(&domain->domain, gather, iova,
> +					    pte_size);
> +
> +		iova += pte_size;
> +		unmapped += pte_size;
> +	}
> +
> +	return unmapped;
> +}
> +

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
