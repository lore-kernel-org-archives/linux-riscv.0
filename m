Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FD4C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0ZjpbRqv4smK4giBlt2DllpQh2aBCq7+jxM0gZ5t40=; b=HfmyDxW6nyFONp
	ae2Tki18wKcOAxq99OJu50Gy9iLltapH2kIqCLGGFey9IrdL5mpI3ftzYtwue1njNUd3AqmBS5GwF
	62fwwdAIhWWlqkjPttW53CgNUvKfgPzh4OY0mnarkuq9mU/c1+9hzGu7cS80Gp2/jApdf3cyMColT
	2tJfr61/SCJMFbhnSU8ezLs59Tq3SsOuIYefd7KP/XXkyTu6mpCzaF8micgTEoIvpAn14fGwOiYR4
	TgJm24LBwZTYaRPjF34UONazWUsV4BVp04FDktzgepaxFLDDzQspxdg2TuQ1bab91fBlaQ4+DCdCG
	rrPk485BZyma1cSsWtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MXJ-0000000BhbR-3nnU;
	Tue, 07 May 2024 15:15:21 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MXI-0000000BhaQ-0Dsi
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 15:15:21 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ef9dee5bddso636688a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715094917; x=1715699717; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkqGl/7x0OwO56SYs+uVQbq7OCSGKYp1K0+HP7Qmbg8=;
        b=JvU6GFFkMdPf0MkKcv3pJkAlr4bfkY4ezCnVkXwVb8nWFhc1poV/5uhZ6AawxVoHZb
         IeZ8BhE/IgPoGVthXENH6DHnU/ZTZS6SzaG/je5/ABFyKWK+eqm/X9jgfglogEkj7dlJ
         4VPB5HeaUBgyROGOx0iO0LAdB9sbJU5hwKOXYz4veW5zF94tcgTtHd4dml1YIa85uJwV
         cL4vjXIZAyxvWFBHUbv89yamhXuyrgJ/jrp1UNyGfmxSFbTJuCH8fGvlu3ogzeWSnMxm
         8pE8gPw19Dp6u2S3xU06TCKPfsKZWtgiaxTfR+icJiJvOl3JCANgfn63WDhDctMtRukS
         yJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715094917; x=1715699717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkqGl/7x0OwO56SYs+uVQbq7OCSGKYp1K0+HP7Qmbg8=;
        b=EbTNqSJiSJeWUsZ+CLd5c3O7Oxe7PkE9k4YKoFgDS4qpHK6xSm4eOBZtgeIR8xxS+v
         mQ7Ta5MuIDUNKkFzwNZHM9pFsnNIhxvKyFOVKl91b5HZ1n/lF1/+JcK+vPLT1bEYNgGd
         uIThoWCN9kinNdVDDxqz5JxucVOyB3ujC+jh20wsW80k3r4hOt60muqgTtRLbSGtcQVK
         LbxJ/wkY1PBqi2tjyVhoJ9fPUu0O0CAVtr+PODPRfJiV2MWvrPfh4Qy7TH5s+1LbFt6y
         eCSPaP2uN8Aa+yT6FsdVhK1KQnZA5+VZuM1fSdRtgi5SKAKhwoVmzivP4/l4cbSUR05f
         n04w==
X-Forwarded-Encrypted: i=1; AJvYcCWal2DpK55QgdKRSmSoe+Psl49Av+O2eN4GiczR9PgpoCXcRDznjdX5ziaLCVSv+hxW5k2OF6pkvJl4CxxrB6T08TaJsEXi04fvDL5yLvdP
X-Gm-Message-State: AOJu0Yw/9EuAVqHU0djj39+u28Pw4XdQ215nAKzFsMJc/0LJwGTUEnpM
	Riha0xxLzEyn8h8yleVFN53xT7/IYuYFmyhCdk8To5IWvECTqY2pE1Fc8+v2iu8=
X-Google-Smtp-Source: AGHT+IGUoxvdjNdzspF19Ce1OuUkdsrFCLLK5IkafH8wCvTsMAF8ekXOGHUiIHhabayOnNY5P/EIZA==
X-Received: by 2002:a05:6870:d205:b0:23f:ba88:d5ac with SMTP id g5-20020a056870d20500b0023fba88d5acmr5660623oac.53.1715094917705;
        Tue, 07 May 2024 08:15:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id pn27-20020a0568704d1b00b002397a883e7csm2552861oab.12.2024.05.07.08.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 08:15:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s4MXE-0083RU-0c;
	Tue, 07 May 2024 12:15:16 -0300
Date: Tue, 7 May 2024 12:15:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC RESEND 3/6] iommu/riscv: support GSCID
Message-ID: <20240507151516.GK901876@ziepe.ca>
References: <20240507142600.23844-1-zong.li@sifive.com>
 <20240507142600.23844-4-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507142600.23844-4-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_081520_113208_53DB439C 
X-CRM114-Status: GOOD (  18.41  )
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

On Tue, May 07, 2024 at 10:25:57PM +0800, Zong Li wrote:
> @@ -919,29 +924,43 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
>  	rcu_read_lock();
>  
>  	prev = NULL;
> -	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> -		iommu = dev_to_iommu(bond->dev);
>  
> -		/*
> -		 * IOTLB invalidation request can be safely omitted if already sent
> -		 * to the IOMMU for the same PSCID, and with domain->bonds list
> -		 * arranged based on the device's IOMMU, it's sufficient to check
> -		 * last device the invalidation was sent to.
> -		 */
> -		if (iommu == prev)
> -			continue;
> -
> -		riscv_iommu_cmd_inval_vma(&cmd);
> -		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
> -		if (len && len >= RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
> -			for (iova = start; iova < end; iova += PAGE_SIZE) {
> -				riscv_iommu_cmd_inval_set_addr(&cmd, iova);
> +	/*
> +	 * Host domain needs to flush entries in stage-2 for MSI mapping.
> +	 * However, device is bound to s1 domain instead of s2 domain.
> +	 * We need to flush mapping without looping devices of s2 domain
> +	 */
> +	if (domain->gscid) {
> +		riscv_iommu_cmd_inval_gvma(&cmd);
> +		riscv_iommu_cmd_inval_set_gscid(&cmd, domain->gscid);
> +		riscv_iommu_cmd_send(iommu, &cmd, 0);
> +		riscv_iommu_cmd_iofence(&cmd);
> +		riscv_iommu_cmd_send(iommu, &cmd, RISCV_IOMMU_QUEUE_TIMEOUT);

Is iommu null here? Where did it come from?

This looks wrong too. The "bonds" list is sort of misnamed, it is
really a list of invalidation instructions. If you need a special
invalidation instruction for this case then you should allocate a
memory and add it to the bond list when the attach is done.

Invalidation should simply iterate over the bond list and do the
instructions it contains, always.

>  static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> -				     struct device *dev, u64 fsc, u64 ta)
> +				     struct device *dev, u64 fsc, u64 ta, u64 iohgatp)

I think you should make a struct to represent the dc entry.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
