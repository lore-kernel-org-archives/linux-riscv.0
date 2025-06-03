Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75A1C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkPJh1kQ/Ikw9NTn4bJpPk/FEP96Thb1JUfSQeyPdr4=; b=wSidi8mJ/w3C+p
	HSsyXEFxlxgu0/QjVh/Nx9VOS1MYfiWw9WG7YIMycvNW0KSHRUJ2NJPLrSF0JeoTHpHLRoxYMo7O9
	pvEtrSOtyrk+t9EvX0zL9c7A35vrODuEQ5gDy4866sDDPO76wtaJgSBlqwYLyu0PABJ7p2UJa6EWH
	JlNXdOyDjD5x2Oz+QML4Vv7MFE6kmdhgKU1EoB19ehwUGtsnINcSG/4NSPWiqjSAwOuvcDfgaEW/a
	XSvxHLG2+q5R8AhVl8R9OLar3qnlSYZZXbgtnFl/AQq/ojX/5GfSEasrJl51231MNE+Dyby+SuR6r
	E4VQbHK9mZHgdzeLGrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRr9-0000000B425-2esx;
	Tue, 03 Jun 2025 13:39:07 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRp8-0000000B3To-0jLx
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:37:03 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7d20f799fe9so127536585a.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957821; x=1749562621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=Dfc6GmWeVqUzMUenKrxDoOheptcWrT5Fa4zfwXVK6FcaTCGvNWlCuQ7OwCKk4f2lch
         jo3mcPypzBEetBifwg/ABFWmp2dRpYOH8pltTQWG3dF/pJ5gH8LUgMhz1PjKS98POvq8
         CRK1mmZ1068vQ2pNEwlFW9IKv2btUVCH1l+7je8mKM7oWGAZtYklZ0/WDsnxTvAM7Lrf
         gpVMqEvscM7LcCs3zvpKSNM++YyQvmP1sDK9BLibmIUvzntbyHHdzAloV5gIrdNL8un8
         QNAXJqbvU4lp05GaAYh44l032HjHYZE/4Eu5DCN2OO/vIV68emyt69gX5NE1OOuepw1G
         o/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957821; x=1749562621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=bDGVXTE2xYw1yvgff1/JrjybpsPUORUuEUjSkz28xKWDAO8FxapqyjBEx5O/hp0u9P
         PXy2oogg1uY5BeEBbZoVcKiA/B4/RIZSMzPpewCqYg7RnNHgU6sOBBQ0RCX31h5r8pFZ
         tn7jzEfrK8rczUokE+/g0Cwo4cFk5tDOnaHUhOpIe5PxIc1IY+qpG3RU6/BhOY6i7cHZ
         u1UmB9IliLC0osGsg2PSVUYPCifgfIIT+7JmSH48q8IX2FzdMt/An77grS5twGXWOS6P
         fd+cm0xkaVXmbICW4LH0N1qbrxPDUT2Da0dyriCxuXhQe/8zn/426Wt/nx4EkRkmFMLe
         IazQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIs629g19d9koHi9LT21i9ClDSj5ICKqQnT23u+8aByqaIhYENe96V6fpZilkEGsMVeyHDLIzYhKxtMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxxlPbpZ3FnhHpBAP5YJ4sZpcz3RvW4tNP9CKDgHIMt9eJYc2J
	s/WAAKF175NVonoYm0YqvgB4kBvlSvBHDVXKYrlf2q5MRK3rCtDENcXbXzWUjeBF+9Q=
X-Gm-Gg: ASbGncup6gIDKgAqJbW6wR33rJdLyhEFR0RrQWIzxXQLamDyByESPaNPereq9vuJJmJ
	NHsmfR6GECO7B91lnKoRuQVsyzKMkFMsOsKPuKUvJiNpSQ+jEW5YcfJVEHRJd5e4c39ym3aqQoD
	8dJwjIiEdBmwohaRtAIzgfC+npem8P08mrn4/yNrAF0vDKSWlC3Cw2VNt02XmFKv2iTEtx45mdT
	FIjc0uDfzhAqxSg7HckoLErZQXacM1PYhJBOdvBU/5DFIV6Cf75HpEFs9kzRnGc8/mhLOMuxU1T
	sUoa5VSY78KKUXe50wLJte0emf9KWGd0DJlenfVzcDUvZIo8GMESliZ7JDTJiUTwTkZbQ8eMTMY
	iu7ecehXbkzrK2/VCcORHxdflk8M=
X-Google-Smtp-Source: AGHT+IF/1nQKKWghBymIv6kapapYp3T/T+mDb2uBcjAQYD1rkFwd/p2CMx7wy82AG8RXeUKzw729SQ==
X-Received: by 2002:a05:620a:4408:b0:7c5:3d60:7f8d with SMTP id af79cd13be357-7d0a1fb91a0mr2626422385a.19.1748957820692;
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0fa38fsm842635185a.35.2025.06.03.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRp5-00000001h5Y-2rWO;
	Tue, 03 Jun 2025 10:36:59 -0300
Date: Tue, 3 Jun 2025 10:36:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250603133659.GD386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063702_216613_F6AF360D 
X-CRM114-Status: GOOD (  12.62  )
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

On Thu, May 29, 2025 at 04:32:04PM +1000, Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/memremap.h | 11 +++++++++++
>  mm/pagewalk.c            | 12 ++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

But why do we want to skip them?

Like hmm uses pagewalk and it would like to see DAX pages?

I guess it makes sense from the perspective of not changing things,
but it seems like a comment should be left behind explaining that this
is just for legacy reasons until someone audits the callers.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
