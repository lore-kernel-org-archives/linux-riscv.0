Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B33FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+0tRiI6KvEH5vSf3Z4TrWq04//jK+y9iRdzUjPGFq8=; b=OfFyymmH7W/krk
	clp4cUhfyPHaiCcIFuSybtUBDrBEEqMDUbQ1iu1aqLirJ9mMgCUAqhyq4P/T+646tIH4Oh53H8iW1
	RH8oaz5/UFRjIGvNE1I4d+zuMpyIQxyqJ3Zff+Tp8SGg5IxEVKIUhbQHDnWNHZlinTWkFiNSByXrg
	qKkBa8MbbgMBh7SS7DZUtcwJrzOciu5Zd+8BxTK8eUZ+9nCxuplxdn+r9HKA/BVO2acKdlePmASW7
	Gm6ULrfFBMRZXSE77QVmtuL0G0+2d/B8L59WI3ZLQhgQ1vxiUhxAoQIKNRIvzLxp5td7APcmUv+wo
	/SnY+3oghzz/gxGnLKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnOj-006pFn-Ss; Thu, 03 Mar 2022 15:29:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnO2-006owk-Gj; Thu, 03 Mar 2022 15:29:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 298DAB8260A;
 Thu,  3 Mar 2022 15:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335A5C340F0;
 Thu,  3 Mar 2022 15:28:54 +0000 (UTC)
Date: Thu, 3 Mar 2022 15:28:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 Christoph Hellwig <hch@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-parisc@vger.kernel.org, openrisc@lists.librecores.org,
 linux-um@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-arch@vger.kernel.org,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH V3 05/30] arm64/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <YiDessYDSt060Euc@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-6-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646045273-9343-6-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_072902_895843_49A44331 
X-CRM114-Status: GOOD (  25.66  )
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

Hi Anshuman,

On Mon, Feb 28, 2022 at 04:17:28PM +0530, Anshuman Khandual wrote:
> +static inline pgprot_t __vm_get_page_prot(unsigned long vm_flags)
> +{
> +	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> +	case VM_NONE:
> +		return PAGE_NONE;
> +	case VM_READ:
> +	case VM_WRITE:
> +	case VM_WRITE | VM_READ:
> +		return PAGE_READONLY;
> +	case VM_EXEC:
> +		return PAGE_EXECONLY;
> +	case VM_EXEC | VM_READ:
> +	case VM_EXEC | VM_WRITE:
> +	case VM_EXEC | VM_WRITE | VM_READ:
> +		return PAGE_READONLY_EXEC;
> +	case VM_SHARED:
> +		return PAGE_NONE;
> +	case VM_SHARED | VM_READ:
> +		return PAGE_READONLY;
> +	case VM_SHARED | VM_WRITE:
> +	case VM_SHARED | VM_WRITE | VM_READ:
> +		return PAGE_SHARED;
> +	case VM_SHARED | VM_EXEC:
> +		return PAGE_EXECONLY;
> +	case VM_SHARED | VM_EXEC | VM_READ:
> +		return PAGE_READONLY_EXEC;
> +	case VM_SHARED | VM_EXEC | VM_WRITE:
> +	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
> +		return PAGE_SHARED_EXEC;
> +	default:
> +		BUILD_BUG();
> +	}
> +}

I'd say ack for trying to get of the extra arch_vm_get_page_prot() and
arch_filter_pgprot() but, TBH, I'm not so keen on the outcome. I haven't
built the code to see what's generated but I suspect it's no significant
improvement. As for the code readability, the arm64 parts don't look
much better either. The only advantage with this patch is that all
functions have been moved under arch/arm64.

I'd keep most architectures that don't have own arch_vm_get_page_prot()
or arch_filter_pgprot() unchanged and with a generic protection_map[]
array. For architectures that need fancier stuff, add a
CONFIG_ARCH_HAS_VM_GET_PAGE_PROT (as you do) and allow them to define
vm_get_page_prot() while getting rid of arch_vm_get_page_prot() and
arch_filter_pgprot(). I think you could also duplicate protection_map[]
for architectures with own vm_get_page_prot() (make it static) and
#ifdef it out in mm/mmap.c.

If later you have more complex needs or a switch statement generates
better code, go for it, but for this series I'd keep things simple, only
focus on getting rid of arch_vm_get_page_prot() and
arch_filter_pgprot().

If I grep'ed correctly, there are only 4 architectures that have own
arch_vm_get_page_prot() (arm64, powerpc, sparc, x86) and 2 that have own
arch_filter_pgprot() (arm64, x86). Try to only change these for the time
being, together with the other generic mm cleanups you have in this
series. I think there are a couple more that touch protection_map[]
(arm, m68k). You can leave the generic protection_map[] global if the
arch does not select ARCH_HAS_VM_GET_PAGE_PROT.

> +static pgprot_t arm64_arch_filter_pgprot(pgprot_t prot)
> +{
> +	if (cpus_have_const_cap(ARM64_HAS_EPAN))
> +		return prot;
> +
> +	if (pgprot_val(prot) != pgprot_val(PAGE_EXECONLY))
> +		return prot;
> +
> +	return PAGE_READONLY_EXEC;
> +}
> +
> +static pgprot_t arm64_arch_vm_get_page_prot(unsigned long vm_flags)
> +{
> +	pteval_t prot = 0;
> +
> +	if (vm_flags & VM_ARM64_BTI)
> +		prot |= PTE_GP;
> +
> +	/*
> +	 * There are two conditions required for returning a Normal Tagged
> +	 * memory type: (1) the user requested it via PROT_MTE passed to
> +	 * mmap() or mprotect() and (2) the corresponding vma supports MTE. We
> +	 * register (1) as VM_MTE in the vma->vm_flags and (2) as
> +	 * VM_MTE_ALLOWED. Note that the latter can only be set during the
> +	 * mmap() call since mprotect() does not accept MAP_* flags.
> +	 * Checking for VM_MTE only is sufficient since arch_validate_flags()
> +	 * does not permit (VM_MTE & !VM_MTE_ALLOWED).
> +	 */
> +	if (vm_flags & VM_MTE)
> +		prot |= PTE_ATTRINDX(MT_NORMAL_TAGGED);
> +
> +	return __pgprot(prot);
> +}
> +
> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +{
> +	pgprot_t ret = __pgprot(pgprot_val(__vm_get_page_prot(vm_flags)) |
> +			pgprot_val(arm64_arch_vm_get_page_prot(vm_flags)));
> +
> +	return arm64_arch_filter_pgprot(ret);
> +}

If we kept the array, we can have everything in a single function
(untested and with my own comments for future changes):

pgprot_t vm_get_page_prot(unsigned long vm_flags)
{
	pgprot_t prot = __pgprot(pgprot_val(protection_map[vm_flags &
				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]));

	/*
	 * We could get rid of this test if we updated protection_map[]
	 * to turn exec-only into read-exec during boot.
	 */
	if (!cpus_have_const_cap(ARM64_HAS_EPAN) &&
	    pgprot_val(prot) == pgprot_val(PAGE_EXECONLY))
		prot = PAGE_READONLY_EXEC;

	if (vm_flags & VM_ARM64_BTI)
		prot != PTE_GP;

	/*
	 * We can get rid of the requirement for PROT_NORMAL to be 0
	 * since here we can mask out PTE_ATTRINDX_MASK.
	 */
	if (vm_flags & VM_MTE) {
		prot &= ~PTE_ATTRINDX_MASK;
		prot |= PTE_ATTRINDX(MT_NORMAL_TAGGED);
	}

	return prot;
}

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
