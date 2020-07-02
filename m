Return-Path: <SRS0=rvuQ=AN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2224FC433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 14:04:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE9B720890
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 14:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3iuzeN6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE9B720890
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pq8gEcpCTd8S8O57YCUsv6oCv0U+8JTbYdh6DUakXJE=; b=l3iuzeN6nnuhJIBPr0SOgfcF9
	9Cn3/wqH+ZBsfhkezIbwLGjUWp4ZEEUHL9T71hTSlkZCIVR0Y1VvOua9uNrve+31HOn0kF1MiNs7k
	OVtgI8RDRH5radLvHBnkVOOTMuJx2YAGEywOXX6CF8bmSQb/M4Hbqdesq0201q3ymt6PvmfyFqUmI
	5D/jZMfdxrMO4FMtVTczTG+xyVuSUW4ZKk81ufKy+PkZ+7VvYxgQehOsZYg0npG5LkliCXKeME7Tu
	KFNZSbKYAhUjzR6cX0PuE7ibs2yjcXMKL2ALkh8Uo7wT2XcaPWcPV3vPm68Sm1qOTvbkeTUe+2LCl
	B7bv0Px1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqzot-0004Ru-5y; Thu, 02 Jul 2020 14:04:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqzoo-0004Qk-Rj; Thu, 02 Jul 2020 14:04:03 +0000
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 341F920772;
 Thu,  2 Jul 2020 14:03:58 +0000 (UTC)
Date: Thu, 2 Jul 2020 15:03:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V3 (RESEND) 1/3] mm/sparsemem: Enable vmem_altmap support
 in vmemmap_populate_basepages()
Message-ID: <20200702140355.GE22241@gaia>
References: <1592442930-9380-1-git-send-email-anshuman.khandual@arm.com>
 <1592442930-9380-2-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592442930-9380-2-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_100403_049455_6102A63D 
X-CRM114-Status: GOOD (  19.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 06:45:28AM +0530, Anshuman Khandual wrote:
> vmemmap_populate_basepages() is used across platforms to allocate backing
> memory for vmemmap mapping. This is used as a standard default choice or
> as a fallback when intended huge pages allocation fails. This just creates
> entire vmemmap mapping with base pages (PAGE_SIZE).
> 
> On arm64 platforms, vmemmap_populate_basepages() is called instead of the
> platform specific vmemmap_populate() when ARM64_SWAPPER_USES_SECTION_MAPS
> is not enabled as in case for ARM64_16K_PAGES and ARM64_64K_PAGES configs.
> 
> At present vmemmap_populate_basepages() does not support allocating from
> driver defined struct vmem_altmap while trying to create vmemmap mapping
> for a device memory range. It prevents ARM64_16K_PAGES and ARM64_64K_PAGES
> configs on arm64 from supporting device memory with vmemap_altmap request.
> 
> This enables vmem_altmap support in vmemmap_populate_basepages() unlocking
> device memory allocation for vmemap mapping on arm64 platforms with 16K or
> 64K base page configs.
> 
> Each architecture should evaluate and decide on subscribing device memory
> based base page allocation through vmemmap_populate_basepages(). Hence lets
> keep it disabled on all archs in order to preserve the existing semantics.
> A subsequent patch enables it on arm64.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Jia He <justin.he@arm.com>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
