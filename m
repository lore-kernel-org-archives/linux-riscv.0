Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FD3D46C01
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 00:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlrQ6qul0VwZVHzfIAQDZNG3mZf5/BjC3Arc110/frk=; b=T3Ms3ifPukph4z
	/i25GRi+WrgSXDu6JjZdboBJ2KJj+WVATXLjbNdbrthP/R6PthKw+nSGHOp4maStPvcr9ehcF606w
	QQ4zyCekZqORHA4n6kz4mfKbqDWPJRKcOcoo67o2hUwxEH/xODQkDsBvFs7/qUsfLHBUu2p7wgpU4
	jvCjOPzLJXRPkaQR7drLZyF0fHjEBPlTpi19N86zilkKWfFmZwx54lErJO1fiZu5BotpPOWCdFe+O
	8FrMtTJJu/EfBPUHXIIXNBWmGYwI49mbrVJEaFVY/+sZRAG5DwsMCQKKARtKr7DvqMdvP0AWJYVdp
	0AqDCwtdzIvL0MbPUGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGBJ-0000000GzuS-2wsL;
	Thu, 29 Jan 2026 00:46:45 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGBH-0000000GztX-1zLD
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 00:46:44 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50143fe869fso4291921cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 16:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769647602; x=1770252402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaqVgHlI2seUK2YRo3bqtWiP6hNp3fDsIh3WrTJfgb4=;
        b=B+kUG0Iq1C3QeSkHSL7WnGbW6UWwHoUXm/pRwNYebLQtMBphz8zCF6DHk99yPo7E28
         gl9prVlF8JJ+nevyTnoQIged5rmhonuFTvumomfYLMd20hXhffAyv0VE+m3BgrwTCIY5
         e6vlFNY7/nuLHjpLB2JhgMN3URMiK6U4Cn2A02RxwjrVt79hqvXgex5OiE32NoufD4eJ
         s1nkSw1Sv/g+h+Eof+LuAcqVOEwI4XxwfTGZX2t+qpv6OTE9KtOLcAqCvE/MA6IZF0GW
         /LoyRJZz9pNj6N0gZ4Jpym/bnZE2IaUIM9xqh5qx/AvdI4PrEMrJQtYitqnyTi2W3uK0
         UQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647602; x=1770252402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaqVgHlI2seUK2YRo3bqtWiP6hNp3fDsIh3WrTJfgb4=;
        b=SEFvs9vys0P0Yasvvj/MvMghU04eiUYyfLmLLmcMGI3kruSz3Q5XngErrrad4Wh+Ma
         5DWqlAy3mEEcZ/DFWHMPv/9prntp1ARid5iqPsmHPoaPQMASZx9+YtmwdOonnb6s0Fif
         vBBE8XXsBTNhqGNzGW2seAmK3YfYhBnZlSPL3ttlmI1a5Ncmp+VqjW2TSzbyd3IwFjcT
         vDnkzO6/IMQzB19HoSsftvdgEvokXubywBAkVPh/SfUyNBL7aeK7W37MFiJTQJGlE/O0
         XnB+F4dXqTtixdOPL/pARIv7h+4k2p3tn2BsA0B9+Uk3HFWutwmj3IPPy69cPTAEvUCd
         mhgA==
X-Forwarded-Encrypted: i=1; AJvYcCVbhuhnCdcYYVdefArVFOrjVSMQhe4N3LFOHysUSX/Fq4LOwZI67jVuFpMh+2VnciotCFlwb2hb/3iYfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr4xdap+ECkg0va1VmFjRbSeyFGbxyTSI1gEcrQHA7ZtRQhpCw
	zdm8uAqdzmHdyq41GVHbQEcGnAYGdKn9QxxcDp8EBccRf4qB0RP2tOoAKd0GhH7DIi8=
X-Gm-Gg: AZuq6aKYbibHhgn1QhxeB9rjMTpsd5RuyPBRezRI5ETYdVHFoT4u17pKNd/LsC9l6de
	tx37flhPAYScd0UnNjuC3X9+ByyRmaUcF97oBSheVXGb2/6yrBv5ZuGeObTvdAIi41L6nIuMMHN
	DqPKMnQQNiX2BvS5GItHTkavaRTXW+YEJ/e+E38OyyaHNV6p7O4L/3wPWMLF9XEWyDcf50Z3fN9
	Zbmx4IhTngO5ccPNbkYtKXTVXiO0nCKXtgM68QpmJZ3xgZv4XLyV+KMXmiDWUS0oJPnAtTXXlLm
	yuJEa83tVjOPEQmhKzTTeSO/I+j5s2qnsWCfNtv0Mep5yu+Y0PGvwHPEdolsPG0I8KEz+MduFNz
	HynTHBWW9QvJxsKnBQc35wOI2d5nOUfvtdEncSSTAB4SBf0eVILDNAffgvRRkaywSAazAWBoy3A
	Htx+hJP1GY2rueHAKCyxPEJUZgRKHcvpsCDzd/Z76ZKho40A+K2qjWxVFQQ/DlgrJ19no=
X-Received: by 2002:a05:622a:188e:b0:4f4:bfc8:b7be with SMTP id d75a77b69052e-5032f742fe3mr89269221cf.12.1769647601991;
        Wed, 28 Jan 2026 16:46:41 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36c2413sm27296786d6.15.2026.01.28.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:46:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vlGBE-00000009gA4-3SP9;
	Wed, 28 Jan 2026 20:46:40 -0400
Date: Wed, 28 Jan 2026 20:46:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joerg Roedel <joro@8bytes.org>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>,
	patches@lists.linux.dev, xieyongji@bytedance.com
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
Message-ID: <20260129004640.GB1641016@ziepe.ca>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <72olk767l4goaqsrkyelhtnzg33nxbtwnammy4asnqxukbolnh@gwypmg6n5t3e>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72olk767l4goaqsrkyelhtnzg33nxbtwnammy4asnqxukbolnh@gwypmg6n5t3e>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_164643_536772_43831E5E 
X-CRM114-Status: GOOD (  10.97  )
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

On Thu, Jan 22, 2026 at 08:56:12AM +0100, Joerg Roedel wrote:
> Tomasz,
> 
> On Tue, Jan 06, 2026 at 11:06:44AM -0400, Jason Gunthorpe wrote:
> > Jason Gunthorpe (5):
> >   iommupt: Add the RISC-V page table format
> >   iommu/riscv: Disable SADE
> >   iommu/riscv: Use the generic iommu page table
> >   iommu/riscv: Enable SVNAPOT support for contiguous ptes
> >   iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
> 
> Any opinion on that series?

Let's take it if we don't hear from Tomasz this week? It brings
the contiguous page feature people wanted and now that it is tested
I'm not especially worried about it.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
