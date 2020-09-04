Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B24C433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 22:35:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B86E207EA
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 22:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/u/7ZXb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B86E207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4YzEg3SISEzG1lIgrCpnWyxqYXZjlO2TpTcE+WMjPfA=; b=A/u/7ZXb3Idd7Hu8N1Wn9oF56
	4KNB/J7EuWZeAV0gROncqlq5CiMV55VEYoOow2FR0EVohJOnV6OOOmzSy0hyZQKR1RMB1SE26Fuk0
	5mk3GCzQhCKyTXgKcLRkQ2vbOgl3fzfkcUFyofg593wDRPDUsalU4ku7CvvjuOOnw+bpRyZFG2cFT
	x3XtjOCEVRSLXIhGlLmlyp4AAixaBBxusPoZvOggCLwCqJOb4f3NXfZQ6B/EoXFomNuItj3I4LY1b
	GTVz0H3tMWjPRKLvcA/FYSn2m0eENS5pMTrIqoJAPfd15UF/e50j95WvaOpk5iRRptpVlnL+XT1SA
	iGpyBK9Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEKIn-0003dY-Ip; Fri, 04 Sep 2020 22:35:25 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEKIk-0003d3-P2
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 22:35:23 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kEKIg-00AaHv-Ll; Fri, 04 Sep 2020 22:35:18 +0000
Date: Fri, 4 Sep 2020 23:35:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/8] asm-generic: fix unaligned access hamdling in
 raw_copy_{from,to}_user
Message-ID: <20200904223518.GR1236603@ZenIV.linux.org.uk>
References: <20200904165216.1799796-1-hch@lst.de>
 <20200904165216.1799796-4-hch@lst.de>
 <20200904180617.GQ1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904180617.GQ1236603@ZenIV.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_183522_834056_5BFDF4AD 
X-CRM114-Status: GOOD (  19.03  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 07:06:17PM +0100, Al Viro wrote:
> On Fri, Sep 04, 2020 at 06:52:11PM +0200, Christoph Hellwig wrote:
> > Use get_unaligned and put_unaligned for the small constant size cases
> > in the generic uaccess routines.  This ensures they can be used for
> > architectures that do not support unaligned loads and stores, while
> > being a no-op for those that do.
> 
> Frankly, I would rather get rid of those constant-sized cases entirely;
> sure, we'd need to adjust asm-generic/uaccess.h defaults for __get_user(),
> but there that kind of stuff would make sense; in raw_copy_from_user()
> it really doesn't.

FWIW, we have asm-generic/uaccess.h used by
	arc
	c6x
	hexagon
	riscv/!MMU
	um
by direct includes from asm/uaccess.h
	h8300
picked as default from asm-generic, in place of absent native uaccess.h

In asm-generic/uaccess.h we have
	raw_copy_from_user(): CONFIG_UACCESS_MEMCPY
		[h8300, riscv with your series]
	raw_copy_to_user(): CONFIG_UACCESS_MEMCP
		[h8300, riscv with your series]
	set_fs group: MAKE_MM_SEG KERNEL_DS USER_DS set_fs() get_fs() uaccess_kernel()
		all, really
	access_ok()/__access_ok() (unless overridden)
		[c6x/!CONFIG_ACCESS_CHECK h8300 riscv]
	__put_user()/put_user()
		all, implemented via __put_user_fn()
	__put_user_fn(): raw_copy_to_user(), unless overridden [all except arc]
	__get_user()/get_user()
		all, implemented via __get_user_fn()
	__get_user_fn(): raw_copy_from_user(), unless overridden [all except arc]
	__strncpy_from_user() (unless overridden) [c6x h8300 riscv]
	strncpy_from_user()
	__strnlen_user() (unless overridden) [c6x h8300 riscv]
	strnlen_user()
	__clear_user() (unless overridden) [c6x h8300 riscv]
	clear_user()

__strncpy_from_user()/__strnlen_user()/__clear_user() are never used outside
of arch/*, and there almost all callers are non-__ variants of the same.
Exceptions:
arch/hexagon/include/asm/uaccess.h:76:  long res = __strnlen_user(src, n);
	racy implementation of __strncpy_from_user()
arch/c6x/kernel/signal.c:157:   err |= __clear_user(&frame->uc, offsetof(struct ucontext, uc_mcontext));
arch/x86/include/asm/fpu/internal.h:367:        err = __clear_user(&buf->header, sizeof(buf->header));
arch/x86/kernel/fpu/signal.c:138:       if (unlikely(err) && __clear_user(buf, fpu_user_xstate_size))

and that's it.

	Now, if you look at raw_copy_from_user() you'll see an interesting
picture: some architectures special-case the handling of small constant sizes.
Namely,
	arc (any size; inlining in there is obscene, constant size or not),
	c6x (1,4,8),
	m68k/MMU (1,2,3,4,5,6,7,8,9,10,12)
	ppc (1,2,4,8),
	h8300 (1,2,4),
	riscv (with your series)(1,2,4, 8 if 64bit).

	If you look at the callers of e.g. raw_copy_from_user(), you'll
see this:
	* default __get_user_fn() [relevant on c6x, h8300 and riscv - in
all cases it should be doing get_unaligned() instead]
	* __copy_from_user_inatomic()
	* __copy_from_user()
	* copy_from_user() in case of INLINE_COPY_FROM_USER [relevant on
arc, c6x and m68k]
	* lib/* callers, all with non-constant sizes.

Callers of __copy_from_user_inatomic() on relevant architectures, excluding the
ones with non-constant (or huge - several get PAGE_SIZE) sizes:
	* [ppc] p9_hmi_special_emu() - 16 bytes read; not recognized as special
	* [riscv] user_backtrace() - 2 words read; not recognized as special
	* __copy_from_user_inatomic_nocache()
	* arch_perf_out_copy_user()

All callers of __copy_from_user_inatomic_nocache() pass it non-constant sizes.
arch_perf_out_copy_user() is called (via layers of preprocessor abuse) via
__output_copy_user(), which gets non-constant size.

Callers of __copy_from_user() potentially hitting those:
arch/arc/kernel/signal.c:108:   err = __copy_from_user(&set, &sf->uc.uc_sigmask, sizeof(set));
arch/c6x/kernel/signal.c:82:    if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
arch/h8300/kernel/signal.c:114: if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
arch/m68k/kernel/signal.c:340:          if (__copy_from_user(current->thread.fpcntl,
arch/m68k/kernel/signal.c:794:       __copy_from_user(&set.sig[1], &frame->extramask,
arch/m68k/kernel/signal.c:817:  if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
arch/powerpc/kernel/signal_64.c:688:    if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
arch/powerpc/kernel/signal_64.c:719:    if (__copy_from_user(&set, &uc->uc_sigmask, sizeof(set)))
arch/powerpc/kvm/book3s_64_mmu_hv.c:1864:               if (__copy_from_user(&hdr, buf, sizeof(hdr)))
arch/riscv/kernel/signal.c:113: if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2244:            if (__copy_from_user(&fence, user++, sizeof(fence))) {
include/linux/regset.h:256:             } else if (__copy_from_user(data, *ubuf, copy))

The last one is user_regset_copyin() and it's going to die.
A bunch of signal-related ones are in in sigreturn variants, reading
sigset_t.  Considering that shitloads of data get copied nearby for
each such call, I would be surprised if those would be worth bothering
with.   Remaining ppc case is kvm_htab_write(), which just might be
hot enough to care; we are copying a 64bit structure, and it might
be worth reading it as a single 64bit.  And i915 is reading 64bit
objects in a loop.  Hell knows, might or might not be hot.

copy_from_user() callers on arc, c6x and m68k boil down to one case:
arch/arc/kernel/disasm.c:37:            bytes_not_copied = copy_from_user(ins_buf,
8-byte read.  And that's it.

IOW, there's a scattering of potentially valid uses that might be better
off with get_user().  And there's generic non-MMU variant that gets
used in get_user()/__get_user() on h8300 and riscv.  This one *is*
valid, but I don't think that raw_copy_from_user() is the right layer
for that.

For raw_copy_to_user() the picture is similar.  And I'd like to get
rid of that magical crap.  Let's not make it harder...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
