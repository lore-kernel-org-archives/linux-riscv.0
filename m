Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D825EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQkO4ENpcmCylO2WHOQ83FkC8jt4MgCnBWQOVgqQuPM=; b=nfm4ztfFCr8N/q
	H+Fi1+2nf3rejDttxUJa59EwOEuwZkVHXOxk3z5mBeCOM2Rh4mQQH9qbIkMtzgps0IXJqBEInxnY0
	g4h33kLmROtpX7Yf8acPDjqrupfGaYXPJVhZPBrvhj2cDUgNMyRDEOJqNKIvq5UcpvqeB7sB6wI7I
	UJkOnav4Ol0kcxwv9r3hWO9ic4n+vAfmg7RtdKySsdv6xD1Qm+OgyVw8F4MMJr/gCBvTdtecAgEGz
	xieFeEtQZFRU/Yns/UH9WsTsu60ka9Kdbht7yP/keDAYTW/FhWYfY1oYTPVrZLIfzXiNFeVqUuzvC
	WVU4jBI+qXxtwQFYl7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4beA-000X8I-1d; Fri, 24 Jun 2022 05:14:22 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bcN-000Vz9-1O; Fri, 24 Jun 2022 05:12:31 +0000
Date: Thu, 23 Jun 2022 22:12:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, hch@infradead.org, christophe.leroy@csgroup.eu,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org, openrisc@lists.librecores.org,
	linux-xtensa@linux-xtensa.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-um@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Message-ID: <YrVHvv0spuMsC1In@infradead.org>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624044339.1533882-1-anshuman.khandual@arm.com>
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

On Fri, Jun 24, 2022 at 10:13:13AM +0530, Anshuman Khandual wrote:
> vm_get_page_prot(), in order for it to be reused on platforms that do not
> require custom implementation. Finally, ARCH_HAS_VM_GET_PAGE_PROT can just
> be dropped, as all platforms now define and export vm_get_page_prot(), via
> looking up a private and static protection_map[] array. protection_map[]
> data type is the following for all platforms without deviation (except the
> powerpc one which is shared between 32 and 64 bit platforms), keeping it
> unchanged for now.
> 
> static pgprot_t protection_map[16] __ro_after_init

On most architectures this should be const now, only very few ever
modify it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
