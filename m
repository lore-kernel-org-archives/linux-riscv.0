Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FDFFF8868
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4/hCSMDrRzydqmkrQrnPZtkgB3Nabz1GNnorkn6xZI=; b=zu0KaPzFSZlM+c
	IjK7hoStTwmlasue93/5ap47FFZd9KLYvpdN+Sm6G3knsYPuu6hkklraX1ShTsB12kDkcVeZ7BcG+
	j/+d2vTaj1JrH0zzsZT/bYLdeTc6WpfE/H8tzzHkRfLqkWkGUpnYa4SkOtRmopo6Z9F+GLb3qD0hu
	j5VzNiyB1i8Hubigt3fg3/7kA272CNJ28UPDysYwkZ39bOq80VWQhvVLgCPruRpsDCxYUasTMzu8n
	UAIJHw//bg4hV/1GXUz+3XbMdXZT/YNYayeBPuMPE40xORToZwR07nN58a0Del0SDPO0GyBAdfu3J
	aX/yvn6DWkkIiNitvnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHidf-00000001Z66-2APK;
	Tue, 28 Apr 2026 13:38:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHide-00000001Z5d-1lWO
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Apr 2026 13:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WHmUngA0Beg9PMjrunFUFdxSHW2GXtc2kWTAdD0BnF4=; b=DkS3/XF62DfNr7wmyTeILGT9/V
	+AXvIpSRP5aVzw/Xehc4GuLTkjkjtuFbFiH4Edt1qYhGC+6obbmhOEN7GIumyEaP3mNltFgJOZcD1
	q97nyxBDtVUy3z7DqLRDstUD67AdknUyo0seJFo1Xo0jtpbvuNS0YwJPi0VrIWUjNk0uth5LEWbpy
	4Knw7BV9iywiHzRLHGTeXt1L8FC6di2AOpYW9YYQcpj0jHAdTqIu1+gVQXTwwgSeusGM+eChaO1Dm
	o404rONUrkIXKMp11nj8o+fPkinCHZbPRxh7GTSg4Cg0UTB2oT7LX0t7z3Q7KqAo1MzxvNADkhkLn
	xIa4yO8A==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHidX-00000003CAM-3ycU
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:38:06 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8c70b5594f4so1244382885a.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383482; x=1777988282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WHmUngA0Beg9PMjrunFUFdxSHW2GXtc2kWTAdD0BnF4=;
        b=c67/nAhJ4rAiEy3+eJOfYsj9qKRc1To/ifvCFMGdAa7ul+K/FXUtlg/M4EkdGkCZgY
         22AmWe4JS/CxK4Ta9K4mEVhrM91yOrcXW9BUVFiyLvZOnz6bx5PrkOoePWI7nZmFGSPZ
         6mSqx31+P8ediM4AZBqnAVeumiiDOt56whOn4uhs3CzFtB4BVWJCAyL/vg0ec6vVHDmE
         rg6Oed+SLZxZjeBJ8V3VKXNcX5H+0tfewNpaMXL/60gsLTXX/+Xi4mOAvDoQ9XbjUcAs
         WBN85/CS4rsGSlni9iC/U9rG3P2EJmHtJxrHOrU40Uj2SEezNQqs5X0FXlHoZREIvdZo
         ovzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383482; x=1777988282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHmUngA0Beg9PMjrunFUFdxSHW2GXtc2kWTAdD0BnF4=;
        b=ESexZuBf9dWnwNIAoPYYL4Wf4B3I0ELgPX48OyA34DbG99ZZsVjwgwSNB+Ds/mOiqF
         FM6HXdk+cnpYJZj/IGYhPE/QCRPYSchnxu8RaDerhA+E2NzB8heqlZdSph+ylAPwfIwY
         x51jaYHyLBuqYaWzkKLo+t/WpLOK5JqhgQCeO/EHg4j0xv+SciBQu8oUQPMTMYZrLdtT
         0Orh1LbJWW7MqjgpeLWBw2haQF54/0pT2+ekiWKJebc0FGNc1O3/FnHorN8CZkZ3K03t
         DNSHy4H0vaIEaNyfncBUJfuhVgO1MkFavRRXFRjIHcyF6OxLhy725pwAdRS3nELIv1+6
         H8zA==
X-Forwarded-Encrypted: i=1; AFNElJ9gkvTQIPsbGqvo3vAHAkvodx+dM4KKubQCL3uZol6Lvkz/mOlRxmjsLGvqqrmTKPGT6W56+5L0+hr2oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfyjRhVfJ0OQ0dVS5LJGNwJuz3Fu9Yj1L6MwFVu+1ilTk/7ZDk
	EIwhPWw+B4QC2AqArT0nN3yxOdAdAUNS2NSVci39iMyURzXMZrgl6pUBD5wrxDEdZUs=
X-Gm-Gg: AeBDiev45RLVpR1PjASJ3nEN7SZfdfogKn62EPEIqCvjPJo40wzK4m1adAckz/NmxnP
	6YTWxlAh/7rwa63NETQh1xXdA8tOhl5Ma6Az75Gs1OA8vPtuFpoWC91pw2jdG+jmvk0F5I4kHNy
	DBDm381Ujfg/KGjXcC+qAYFzQlhTABYshuivj3LDLq4pQ5u7DHzpbf+QSHDRPC/HsqojMZP3NJo
	SpZ6ibVgUzx2SEPAy+aJFOdGP1EgDfMw0bZDbEfHZUwrWb/aejJjKpptCyu1aSlmi9JhTrp71/E
	YQLUgYbJfQuxzN7FqRjAJuSG36YldnejEiHbsuq/P9dcjrCAB5HMG3IBgcrw3qOjCzW59fCJCpn
	ouLkCbdd0SJv+mk1pQFTPwcXijt7mlCCRfIX0VKwAqN7ewf0EcCilVO8dNIuG17IeanHEdY6D9T
	SEDykrhm+Dxa2tNjlDNI4ltW2IBQm5GiHfXMqX+XUMCd1rVGYh+PTFdPLDDLvsvAZ3ru0xtpJpQ
	ZZ3wpjlQD3knHck
X-Received: by 2002:a05:620a:178c:b0:8cd:aa61:ad8f with SMTP id af79cd13be357-8f7d5d6dc38mr357079385a.14.1777383481817;
        Tue, 28 Apr 2026 06:38:01 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c4dbcfbdsm203538685a.12.2026.04.28.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:38:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHidU-0000000Aj1L-1JSZ;
	Tue, 28 Apr 2026 10:38:00 -0300
Date: Tue, 28 Apr 2026 10:38:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 08/11] iommu/riscv: Add dirty tracking support for
 second-stage domains
Message-ID: <20260428133800.GG849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-9-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-9-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_143804_332288_EB0FECA6 
X-CRM114-Status: GOOD (  16.41  )
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

On Tue, Apr 28, 2026 at 09:13:56PM +0800, fangyu.yu@linux.alibaba.com wrote:

> @@ -1247,6 +1247,84 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	return 0;
>  }
>  
> +/*
> + * Enable or disable hardware A/D bit updates (GADE) in the device context for
> + * all devices attached to a second-stage domain. When dirty tracking is
> + * enabled the IOMMU hardware will set the dirty bit in PTEs on write access,
> + * making them visible to read_and_clear_dirty().
> + */
> +static int riscv_iommu_set_dirty_tracking(struct iommu_domain *iommu_domain,
> +					  bool enable)
> +{
> +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> +	struct riscv_iommu_bond *bond;
> +	struct riscv_iommu_device *iommu, *prev;
> +	struct riscv_iommu_dc *dc;
> +	struct iommu_fwspec *fwspec;
> +	struct riscv_iommu_command cmd;
> +	u64 tc;
> +	int i;
> +
> +	rcu_read_lock();
> +
> +	list_for_each_entry_rcu(bond, &domain->bonds, list) {
> +		iommu = dev_to_iommu(bond->dev);
> +		fwspec = dev_iommu_fwspec_get(bond->dev);
> +
> +		for (i = 0; i < fwspec->num_ids; i++) {
> +			dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
> +			tc = READ_ONCE(dc->tc);
> +			if (!(tc & RISCV_IOMMU_DC_TC_V))
> +				continue;
> +
> +			if (enable)
> +				tc |= RISCV_IOMMU_DC_TC_GADE;
> +			else
> +				tc &= ~RISCV_IOMMU_DC_TC_GADE;
> +			WRITE_ONCE(dc->tc, tc);

I'm pretty sure you don't need to do this. Just preset GADE when ever
a S2 domain is attached, rely on the pre-set D to avoid any HW cost
and you are fine. No need to change it dynamically unless something is
reall weird about riscv.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
