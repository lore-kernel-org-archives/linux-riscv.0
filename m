Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F9C05027
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Feb 2023 00:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvV9s15+kRv+CmAw+URkZzhiuyMAJ3gGzQ8gaF6vHVQ=; b=gj7D9JsAUiZ5qx
	gUK7eD2ImE9MIWP5CSKaHZjYeM0quupeecqcm+kkWfLPCqOmc6w1Cd1MBCINavakSWMQXXWGLfarR
	YCEsC6yVZyewzSrNwv3f2LvKsFqaZOjzwMOZQBMApw2897I6KBoxvcamKlkrSO9qcQjpVu1xuyH/c
	EG8WW2QdGuZO3jD5u+u3W8xLQO+tjXtKZHoMt9sUe3yXR+4zbATlnSJdbHJkZ2He8e1suBu98aEJu
	GNwxs8LReQDDTwS6PDD1NLYgluvmiAZ1Ej3095cq6tiIYQL2w3ztAJfNGX1kh4++QJde75HmI+IXJ
	ZsP0J4JQI3szIuEV4Y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO6OR-0047IS-49; Sat, 04 Feb 2023 00:26:59 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO6OM-0047H5-E8
	for linux-riscv@lists.infradead.org; Sat, 04 Feb 2023 00:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X1SywhkHbG+zrm/9j112oMCqd94g661HYfNMjX5RclA=; b=l22rn3Nv6NXWTGOgkjEtnA2GLe
	gE6yjykTrey8R5abzO4M+LY1/1bP94RD/4pRww8GIABSPDrmpY/QNLF6mhIU0YTLPwvuTA9mYQ5DL
	Z0V+zPIrOBzTzBaaBmzopE0gOhN0hl4voghRUCwzhOR8eB8juSVP6sLogXt97BOp8bqkUBF6uNESd
	5OwrUzL1nXumwVYN5P62it0hP/GEVLEbSk4gLKR5NwzpyssdlKx4824Kt4N8R7LhTKKVHTuly09mW
	kYKHF8mB2qbWNOpmHBTVhgnJBGzhR6g66/+qHmyoq2gHxoV+N82EC9zgsyLrSUOVGtLj5O9zsjJH8
	4WRuP7wA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pO6O7-0064I1-1l;
	Sat, 04 Feb 2023 00:26:39 +0000
Date: Sat, 4 Feb 2023 00:26:39 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Peter Xu <peterx@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y92mP1GT28KfnPEQ@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9mM5wiEhepjJcN0@ZenIV>
 <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
 <Y9rCBqwbLlLf1fHe@x1n>
 <Y9rlI6d5J2Y/YNQ+@ZenIV>
 <Y9w/lrL6g4yauXz4@x1n>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9w/lrL6g4yauXz4@x1n>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_162654_656434_77DE0C87 
X-CRM114-Status: GOOD (  27.54  )
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

On Thu, Feb 02, 2023 at 05:56:22PM -0500, Peter Xu wrote:

> IMHO it'll be merely impossible to merge things across most (if not to say,
> all) archs.  It will need to be start from one or at least a few that still
> shares a major common base - I would still rely on x86 as a start - then we
> try to use the helper in as much archs as possible.
> 
> Even on x86, I do also see challenges so I'm not sure whether a common
> enough routine can be abstracted indeed.  But I believe there's a way to do
> this because obviously we still see tons of duplicated logics falling
> around.  It may definitely need time to think out where's the best spot to
> start, and how to gradually move towards covering more archs starting from
> one.

FWIW, after going through everything from alpha to loongarch (in alphabetic
order, skipping the itanic) the following seems to be suitable for all of
them:

generic_fault(address, flags, vm_flags, regs)
{
	struct mm_struct *mm = current->mm;
	struct vm_area_struct *vma;
	vm_fault_t fault;

	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);

	if (unlikely(!mmap_read_trylock(mm))) {
		if (!(flags & FAULT_FLAG_USER) &&
		    !search_exception_tables(instruction_pointer(regs))) {
			/*
			 * Fault from code in kernel from
			 * which we do not expect faults.
			 */
			return KERN;
		}
retry:
		mmap_read_lock(mm);
	} else {
		might_sleep();
#ifdef CONFIG_DEBUG_VM
		if (!(flags & FAULT_FLAG_USER) &&
		    !search_exception_tables(instruction_pointer(regs)))
			return KERN;
#endif
	}
	vma = find_vma(mm, address);
	if (!vma)
		goto Eunmapped;
	if (unlikely(vma->vm_start > address)) {
		if (!(vma->vm_flags & VM_GROWSDOWN))
			goto Eunmapped;
		if (addr < FIRST_USER_ADDRESS)
			goto Eunmapped;
		if (expand_stack(vma, address))
			goto Eunmapped;
	}

	/* Ok, we have a good vm_area for this memory access, so
	   we can handle it.  */
	if (!(vma->vm_flags & vm_flags))
		goto Eaccess;

	/* If for any reason at all we couldn't handle the fault,
	   make sure we exit gracefully rather than endlessly redo
	   the fault.  */
	fault = handle_mm_fault(vma, address, flags, regs);

	if (unlikely(fault & VM_FAULT_RETRY)) {
		if (!(flags & FAULT_FLAG_USER)) {
			if (fatal_signal_pending(current))
				return KERN;
		} else {
			if (signal_pending(current))
				return FOAD;
		}
		flags |= FAULT_FLAG_TRIED;
		goto retry;
	}

	if (fault & VM_FAULT_COMPLETED)
		return DONE;

	mmap_read_unlock(mm);

	if (likely(!(fault & VM_FAULT_ERROR)))
		return DONE;

	if (!(flags & FAULT_FLAG_USER))
		return KERN;

	if (fault & VM_FAULT_OOM) {
		pagefault_out_of_memory();
		return FOAD;
	}

	if (fault & VM_FAULT_SIGSEGV)
		return SIGSEGV;

	if (fault & VM_FAULT_SIGBUS)
		return SIGBUS;

	if (fault & VM_FAULT_HWPOISON)
		return POISON + PAGE_SHIFT;	// POISON == 256

	if (fault & VM_FAULT_HWPOISON_LARGE)
		return POISON + hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));

	BUG();

Eunmapped:
	mmap_read_unlock(mm);
	return flags & FAULT_FLAG_USER ? MAPERR : KERN;
Eaccess:
	mmap_read_unlock(mm);
	return flags & FAULT_FLAG_USER ? ACCERR : KERN;
}

possible return values (and that's obviously not the identifiers to be
used for real; for now I'm just looking for feasibility of it all):
	DONE		success, nothing else to be done
	FOAD		OOM/fatal signal with VM_FAULT_RETRY/
			signal with VM_FAULT_RETRY from userland - nothing
			to be done here.
	KERN		kernel mode failed fault, fixup or oops
	MAPERR		unmapped address, SIGSEGV/SEGV_MAPERR for you
	ACCERR		nothing in vm_flags present in ->vm_flags of vma;
			SIGSEGV/SEGV_ACCERR
	SIGSEGV		VM_FAULT_SIGSEGV; some architectures treat that
			as SEGV_MAPERR, some as SEGV_ACCERR.
	SIGBUS		VM_FAULT_SIGBUS; SIGBUS/BUS_ADRERR
	POISON + shift	VM_FAULT_HWPOISON and VM_FAULT_HWPOISON_LARGE, with
			log2(affected page size) encoded into return value.

This is obviously not even close to final helper, but... alpha, arc, arm, arm64,
csky, hexagon, loongarch convert to that cleanly.

Itanic very much does not (due to weird dual stacks, awful address space layout,
etc.), but then git rm arch/ia64 is long overdue.

Fairly typical look after conversion:

arc: 
{
	struct task_struct *tsk = current;
	struct mm_struct *mm = tsk->mm;
	unsigned int mask;
	unsigned int flags;
	unsigned int res;

	/*
	 * NOTE! We MUST NOT take any locks for this case. We may
	 * be in an interrupt or a critical region, and should
	 * only copy the information from the master page table,
	 * nothing more.
	 */
	if (address >= VMALLOC_START && !user_mode(regs)) {
		if (unlikely(handle_kernel_vaddr_fault(address)))
			goto no_context;
		else
			return;
	}

	/*
	 * If we're in an interrupt or have no user
	 * context, we must not take the fault..
	 */
	if (faulthandler_disabled() || !mm)
		goto no_context;

	flags = FAULT_FLAG_DEFAULT;
	if (user_mode(regs))
		flags |= FAULT_FLAG_USER;
	mask = VM_READ;
	if (regs->ecr_cause & ECR_C_PROTV_STORE) {	/* ST/EX */
		flags |= FAULT_FLAG_WRITE;
		mask = VM_WRITE;
	} else if ((regs->ecr_vec == ECR_V_PROTV) &&
	         (regs->ecr_cause == ECR_C_PROTV_INST_FETCH)) {
		mask = VM_EXEC;
	}

	res = generic_fault(address, flags, mask, regs);
	if (likely(res == DONE))
		return;
	if (res == FOAD)
		return;
	if (res == KERN) {
no_context:
		if (fixup_exception(regs))
			return;
		die("Oops", regs, address);
	}

	tsk->thread.fault_address = address;
	if (res == SIGBUS)
		force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *) address);
	else
		force_sig_fault(SIGSEGV, res == ACCERR ? SEGV_ACCERR : SEGV_MAPERR,
				(void __user *) address);
}

Or this arm64:

{
	const struct fault_info *inf;
	struct mm_struct *mm = current->mm;
	unsigned long vm_flags;
	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
	unsigned long addr = untagged_addr(far);
	unsigned int res;

	if (kprobe_page_fault(regs, esr))
		return 0;

	/*
	 * If we're in an interrupt or have no user context, we must not take
	 * the fault.
	 */
	if (faulthandler_disabled() || !mm)
		goto no_context;

	if (user_mode(regs))
		mm_flags |= FAULT_FLAG_USER;

	/*
	 * vm_flags tells us what bits we must have in vma->vm_flags
	 * for the fault to be benign, __do_page_fault() would check
	 * vma->vm_flags & vm_flags and returns an error if the
	 * intersection is empty
	 */
	if (is_el0_instruction_abort(esr)) {
		/* It was exec fault */
		vm_flags = VM_EXEC;
		mm_flags |= FAULT_FLAG_INSTRUCTION;
	} else if (is_write_abort(esr)) {
		/* It was write fault */
		vm_flags = VM_WRITE;
		mm_flags |= FAULT_FLAG_WRITE;
	} else {
		/* It was read fault */
		vm_flags = VM_READ;
		/* Write implies read */
		vm_flags |= VM_WRITE;
		/* If EPAN is absent then exec implies read */
		if (!cpus_have_const_cap(ARM64_HAS_EPAN))
			vm_flags |= VM_EXEC;
	}

	if (is_ttbr0_addr(addr) && is_el1_permission_fault(addr, esr, regs)) {
		if (is_el1_instruction_abort(esr))
			die_kernel_fault("execution of user memory",
					 addr, esr, regs);

		if (!search_exception_tables(regs->pc))
			die_kernel_fault("access to user memory outside uaccess routines",
					 addr, esr, regs);
	}

	res = generic_fault(addr, mm_flags, vm_flags, regs);
	if (likely(res == DONE))
		return 0;
	if (res == FOAD)
		return 0;
	if (res == KERN) {
no_context:
		__do_kernel_fault(addr, esr, regs);
		return 0;
	}
	inf = esr_to_fault_info(esr);
	set_thread_esr(addr, esr);
	if (res == SIGBUS) {
		/*
		 * We had some memory, but were unable to successfully fix up
		 * this page fault.
		 */
		arm64_force_sig_fault(SIGBUS, BUS_ADRERR, far, inf->name);
	} else if (res > POISON) {
		arm64_force_sig_mceerr(BUS_MCEERR_AR, far, res - POISON, inf->name);
	} else {
		/*
		 * Something tried to access memory that isn't in our memory
		 * map.
		 */
		arm64_force_sig_fault(SIGSEGV,
				      res == ACCERR ? SEGV_ACCERR : SEGV_MAPERR,
				      far, inf->name);
	}

	return 0;
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
