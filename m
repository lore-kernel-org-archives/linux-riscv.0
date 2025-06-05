Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C05AC5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96fQXjR2PqrxdNHq0FV5HHv2a5QEr+j0Q9tDHT2yHos=; b=uPdff91FREBXbv
	CSCpoxR1rTwXEYKpkw60P3WTCD1L/ikmxg7YdUUbmqBNu/zcqcJouPZeqD8Rn0wIWY/yceWYEOI7D
	z0ydhiMWa/nGwvNDFymdhdAG8tQohFOyZCSGyhUc6FnVWB2jV7TQSHuWa2Bn6CD8YB6SSU5mcllGt
	pJ6B5+jhgR/f9qusUcC6P49gZd8UrGWGL8nmTOwUNAclsnVcluJGYwIKYo70eaGTlH4W9dnv25u3O
	flRRoWc+nf3lqoNwsEhe+XWaZS3sVxIunzFdeCFUD0AoAAAUw/VRb75r5cvdoddHeHQVUTlvy2VYU
	bby9JB6QiJdspiqxSkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5LU-0000000Ez3d-3U2r;
	Thu, 05 Jun 2025 07:49:04 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5JD-0000000Eyi0-466Z;
	Thu, 05 Jun 2025 07:46:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7FA0568AA6; Thu,  5 Jun 2025 09:46:37 +0200 (CEST)
Date: Thu, 5 Jun 2025 09:46:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
	gerald.schaefer@linux.ibm.com, jgg@ziepe.ca, willy@infradead.org,
	david@redhat.com, linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com,
	debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250605074637.GA7727@lst.de>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com> <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com> <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_004644_154680_ED8D2E88 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, Jun 04, 2025 at 06:59:09PM -0700, Dan Williams wrote:
> +/* return normal pages backed by the page allocator */
> +static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
> +					     unsigned long addr, pmd_t pmd)
> +{
> +	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
> +
> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
> +		return page;
> +	return NULL;

If you go for this make it more straight forward by having the
normal path in the main flow:

	if (is_devdax_page(page) || is_fsdax_page(page))
		return NULL;
	return page;

> +static inline struct page *vm_normal_gfp_pte(struct vm_area_struct *vma,
> +					     unsigned long addr, pte_t pte)
> +{
> +	struct page *page = vm_normal_page(vma, addr, pte);
> +
> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
> +		return page;
> +	return NULL;

Same here.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
