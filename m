Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F04A606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vnyA5HJP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=GDgL3Ch/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c/3bL1qrOT6d2nJckTuPWjO+Rf5THiozs7/9oHCx5Y4=; b=vnyA5HJP/ZS83QKKXntuxnH7LE
	xtUmXuR1dLpSKjQi2VPsGI7i7liqbSW6n53xqYAqH+orLdzNB74HazrCOTYkF1bLc8UUKAa1d/HmS
	dx6D2wQiP364AxFSQkL0Yy1d5yjdVtTN/sG4n8HhJm1IQK70PFfBc13sLJZVoznvEPBSKVTF1DNw/
	nBufL5kEtWyaJFZWf/kX03RZdXCEH0RDML20UCpD5GFBtwQ5ZL0yt0mdG3zEzicnvTAwhB6lltOgG
	waF3DVAH0BYHF0gm/rfjVFKfSNnMWZK2BWRClsIEPAzUNs5rjNujeYC1pai3nJnF5CIFPB8apMBWo
	mWMbJrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuPL-0000000CdFC-3sSA;
	Fri, 30 Oct 2026 21:45:07 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuPI-0000000CdE5-1xL4
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 21:45:06 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-67989a2f9bfso857234d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 14:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793396701; x=1794001501; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6woAKDZ/b+Navy32bG7LH4JanvVLu7YGcSnxXQ4O7y4=;
        b=GDgL3Ch/x7JxqEy0EfHqOBOaAgoS+0jyGw1wuNMalN0xjft/28qEA3yIrsMZn3zStk
         Mb5gh+swg6fys/emxCwXkjQLUUIS6JJYXGemXjnfLA2bjIe3kYTWMUKLzWq3THMr03vO
         oNT53qtnFwj3LdApMLOMiabzk7ocBTgMn/z+iRk4Gw6XZ30iN3YY+qzFpcyDNddc6qE2
         AHOnpgePPTMsd1AQMikqmbdQ7jQ2PQw/C3h7TQ/DM7cioh+3ubuGQPTJ4XaDB2Sd6Bp7
         6AUFdcJaZZAOCiSlV04UZQgY2IGAAFkQ3GMFbc8YWnJTv5w0VDZxAwhkOhmXSTDR09cp
         ydsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396701; x=1794001501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6woAKDZ/b+Navy32bG7LH4JanvVLu7YGcSnxXQ4O7y4=;
        b=GNCvoPmvUatvSurDhpJZfh6u/JT29K4tNeTIADX7fnVWfjYUW98ciPtCekvOU8wPh9
         /tObfhbgb1CW5Lp2XUNP2t1mQttSUW98xF5AGYeKXPwQm5JPSNtuTpXWa1BFPzCT+GAZ
         enJ0T8wEB2rkTMp9YRCquPtME5TFdx5YgNbR3NW9w+MhZ9yBDOE3qwfqw+hXGxJFqJQE
         epolD0UpysumGYI8mFBUf6yGNUoMOq8p3LGX9yXeAzQ+wkXmHb1Kv2d3exadsjaGOjRl
         KhVd8ZY/4wJoOiWRNrialUTFyKFD0eSYk1wByqGWGgROQqRz9u0oQuT5Rm8r1rzJRmC3
         X+5w==
X-Forwarded-Encrypted: i=1; AKwUvBw+ylzg2+7mAyPSmdQt1VDinWn2G99gnyECok265aAjkbtDuPH3po4RHEMBIr+A9CRw6CMvezvJZDXu6g==@lists.infradead.org
X-Gm-Message-State: AFq9FYIiin11EZc//VYUr1/nMSjoKvq48Bfw0cL1GRbOs4vdeNbxTGRT
	dgCBzmmrGb2EzA6JKtmtZnrVmEBxQX4S6cVg7j4PcJ3T2zFZ9uqHibcDoKjrXGm0kKA=
X-Gm-Gg: AYBFou0uAvEyBUwNNaihqC8OxNoXW1hvwH4j59cLRJCvbsjl89qMQ+SbqdcMehyuASr
	sT1DfuN6uOF0DSqa62AmJO3ZJ+e66lpqAN/M1NQsenxfao34/iBMbQBaUUmBe9KIW8zuMd25v0H
	t9K6u5xv33SsYujSfQWgy18iGqbzSdedTRZ8ynILMM+1XwEFqQ0dyv7ficyL9QUpBTcqs3Qh+OX
	BEFPYlYVoI6S/MaQGNvlb7Z1uixHcOuRqFhcMZfszGr5LViRZ27xNeVMuf4PFrOm2Zoy4Efs2VD
	MrGWJK9felGiWxELWVPyWLT6KSAhi59Bm+an12ONGQQSJrtR/k6zOMlHqZkYajtHKKyQMQys32t
	Nk3YNC+UBd+xEpLBCNtQ6uzWSEUDO5YNnv4P+nTYAlufH+LU0ZDY0uAtLANi7nyJ2VPn3ztVgUh
	wOqLkwavVjMdiiWRWEexkQMhblUi3kCc0IRtUDnoFRPSprf+0v+jRTcXKnH+vZ2sgWi/xNisqBD
	Z40Q8RIiOdjdiGfzAwyLJqjTjMHle7Boo9LSmZ7CsnLwdjHjkKf+FkZkn2UVu6CREio+HFGT9a5
	izGEOueGrGmrhKAK5bUnyBP4sH/89OWyYa+SOIHD
X-Received: by 2002:a05:690c:9988:b0:8ab:33d2:1528 with SMTP id 00721157ae682-8b2b66cafb1mr19064957b3.35.1793396700882;
        Fri, 30 Oct 2026 14:45:00 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd4csm14663187b3.24.2026.10.30.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:45:00 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:44:59 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>, Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: signal: mark the FP state clean before
 restoring it from the frame
Message-ID: <auUP2yrVl7lwkNkC@Tao-Chiu's-Mac>
References: <20261016160708.790397-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016160708.790397-1-nickolai@csail.mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_144504_572706_3A72A4BC 
X-CRM114-Status: GOOD (  47.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nickolai,

On Fri, Oct 16, 2026 at 12:07:08PM -0400, Nickolai Zeldovich wrote:
> restore_fp_state() copies the FP image of the signal frame into
> current->thread.fstate with __copy_from_user() and then calls
> fstate_restore(), which loads thread.fstate into the FP registers when
> regs->status.FS is not Off and marks the state Clean.
> 
> regs->status is still the sstatus saved when the signal handler entered
> the kernel for rt_sigreturn(); restore_sigcontext() only overwrites the
> general registers. If the handler wrote any FP register, FS is Dirty.
> rt_sigreturn() runs with interrupts and preemption enabled, and the copy
> sleeps when the frame page is not resident. A context switch anywhere
> between the first store of the copy and fstate_restore() goes through
> __switch_to_fpu(), whose fstate_save() sees FS == Dirty and stores the
> live FP registers, which hold the handler's values, over the image that
> was just copied from the frame:
> 
>   rt_sigreturn(), FS == Dirty               scheduler
>   ----------------------------------------  -----------------------------
>   restore_fp_state()
>     __copy_from_user(&thread.fstate, ...)
>       <preempted, or sleeping on a fault>
>                                             __switch_to_fpu(prev = task)
>                                               fstate_save(): FS == Dirty,
>                                                 live f0-f31, fcsr ->
>                                                 thread.fstate; FS = Clean
>                                             ...
>                                             __switch_to_fpu(next = task)
>                                               fstate_restore():
>                                                 thread.fstate -> live
>     <copy completes>
>     fstate_restore(): thread.fstate -> live registers
> 
> The interrupted user code resumes with the signal handler's FP registers
> (the handler's values in the part of the image copied before the switch
> and its own in the rest) instead of the ones it had when the signal
> arrived.
> 
> Any program whose signal handler executes a floating-point instruction
> is exposed: when the handler returns while a reschedule is pending, or
> when the signal frame has been paged out in the meantime, the
> interrupted code silently continues with corrupted f0-f31 and fcsr.
> With tick preemption the window is the 264-byte copy, so the corruption
> is rare and shows up as sporadic wrong floating-point results: a test
> program that loads a pattern into f0-f31, sends itself SIGUSR1 and
> compares the registers afterwards, with a busy thread on the same CPU,
> saw the handler's values in 110 of 200000 sigreturns on a CONFIG_PREEMPT
> kernel under QEMU. The corruption is deterministic when the copy sleeps:
> the same program with the frame on a userfaultfd-registered page that
> the handler drops, so that the copy faults 128 bytes into the image,
> gets the handler's values back in f0-f15 on every sigreturn.
> 
> The copy-then-restore order dates from the initial port, commit
> e2c0cdfba7f6 ("RISC-V: User-facing API"), so every kernel since v4.15
> is affected. The vector state had the same problem in __restore_v_state()
> and commit c27fa53b858b ("riscv: Fix vector state restore in
> rt_sigreturn()") fixed it by marking the live vector state clean before
> the copy.
> 
> Do the same for the FP state: mark it Clean before the copy when it is
> not Off. The live registers belong to the handler and are discarded by
> sigreturn anyway; fstate_save() then skips them on a context switch, and
> fstate_restore() still loads the image, both when the task is switched
> back in and at the end of restore_fp_state(). With the change the test
> program sees the correct registers in 20 of 20 userfaultfd runs and in
> 200000 of 200000 preemption runs.
> 
> Found while formally verifying rt_sigreturn() against the kernel binary.
> 
> Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>     The pending "riscv: signal: protect regs->status RMW from concurrent
>     preemption" (Guobin Zhang, 2026-08-07, with follow-ups on 2026-09-25 and
>     2026-10-08) addresses a different problem in the same functions: a lost
>     update on regs->status when the read-modify-write in __fstate_clean() is
>     preempted and the scheduler writes the VS bits in between. It keeps the
>     copy-then-restore order in restore_fp_state(), so it does not cover this
>     bug. The two patches touch different hunks and apply in either order; the
>     preempt_disable() it puts around __fstate_clean() would cover the new call
>     as well.
>     
>     The guard mirrors fstate_restore(): with FS == Off nothing is restored
>     today and the patch keeps that. A context switch before the first store
>     of the copy is harmless with or without the patch, because fstate_save()
>     then runs before the image is written; the riscv scalar usercopy stores
>     in 64-byte strides, which is why the deterministic reproducer puts the
>     page boundary 128 bytes into the image.
>     
>     The deterministic reproducer, as run (exit 1 before the patch with f0-f7 and
>     f10-f15 reported, exit 0 after):
>     
>     // Reproducer: riscv64 rt_sigreturn() loses the FP state it restores when the copy of the
>     // FP image sleeps (here: a userfaultfd page fault) while the handler left sstatus.FS dirty.
>     // Build: riscv64-linux-gnu-gcc -static -O2 -pthread -o fpstate_sigreturn fpstate_sigreturn.c
>     // Run as root (userfaultfd) on a preemptible kernel with CONFIG_FPU and CONFIG_USERFAULTFD.
>     // Exit 1: FP registers corrupted after the signal; 0: clean; 2: could not set up.
>     #define _GNU_SOURCE
>     #include <fcntl.h>
>     #include <pthread.h>
>     #include <signal.h>
>     #include <stdint.h>
>     #include <stdio.h>
>     #include <string.h>
>     #include <sys/ioctl.h>
>     #include <sys/mman.h>
>     #include <sys/syscall.h>
>     #include <ucontext.h>
>     #include <unistd.h>
>     #include <linux/userfaultfd.h>
>     
>     #define PAGE	4096UL
>     #define SPLIT	128	/* page boundary this far into the 264-byte FP image */
>     #define F(op, i, r) #op " f" #i ", " #i "*8(%[" #r "])\n"
>     #define ALL(op, r) F(op, 0, r) F(op, 1, r) F(op, 2, r) F(op, 3, r) F(op, 4, r) F(op, 5, r) \
>     	F(op, 6, r) F(op, 7, r) F(op, 8, r) F(op, 9, r) F(op, 10, r) F(op, 11, r) \
>     	F(op, 12, r) F(op, 13, r) F(op, 14, r) F(op, 15, r)
>     #define CLOBBERS "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5", "ft6", "ft7", \
>     	"fs0", "fs1", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5"
>     
>     static uint64_t pat[16], hpat[16], out[16];
>     static unsigned char saved[PAGE] __attribute__((aligned(PAGE)));
>     static volatile int placed;
>     
>     static void handler(int sig, siginfo_t *si, void *ctx)
>     {
>     	unsigned long hi = (unsigned long)&((ucontext_t *)ctx)->uc_mcontext.__fpregs + SPLIT;
>     
>     	placed = !(hi & (PAGE - 1));
>     	if (placed) {	/* drop the page holding bytes SPLIT.. of the FP image */
>     		memcpy(saved, (void *)hi, PAGE);
>     		if (madvise((void *)hi, PAGE, MADV_DONTNEED))
>     			_exit(2);
>     	}
>     	/* leave FS dirty, with the handler's values in the registers */
>     	asm volatile(ALL(fld, h) "csrw fcsr, zero\n" : : [h]"r"(hpat) : CLOBBERS);
>     }
>     
>     static void *serve(void *arg)	/* repopulate the dropped page when rt_sigreturn faults on it */
>     {
>     	struct uffdio_copy cp = { .src = (unsigned long)saved, .len = PAGE };
>     	struct uffd_msg msg;
>     	int fd = (int)(long)arg;
>     
>     	while (read(fd, &msg, sizeof(msg)) == sizeof(msg)) {
>     		cp.dst = msg.arg.pagefault.address & ~(PAGE - 1);
>     		cp.copy = 0;
>     		ioctl(fd, UFFDIO_COPY, &cp);
>     	}
>     	return NULL;
>     }
>     
>     int main(void)
>     {
>     	struct sigaction sa = { .sa_sigaction = handler, .sa_flags = SA_SIGINFO | SA_ONSTACK };
>     	struct uffdio_api api = { .api = UFFD_API };
>     	struct uffdio_register reg = { .mode = UFFDIO_REGISTER_MODE_MISSING };
>     	stack_t ss = { .ss_size = 65536 };
>     	long pid = getpid(), tid = syscall(__NR_gettid);
>     	unsigned long fcsr = 0, shift;
>     	pthread_t th;
>     	int fd, i, bad = 0;
>     
>     	for (i = 0; i < 16; i++) {
>     		pat[i] = 0x4010000000000000ULL + i;
>     		hpat[i] = 0xbff0000000000000ULL + i;
>     	}
>     	ss.ss_sp = mmap(NULL, ss.ss_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>     	memset(ss.ss_sp, 0, ss.ss_size);	/* populate: only the dropped page will fault */
>     	reg.range.start = (unsigned long)ss.ss_sp;
>     	reg.range.len = ss.ss_size;
>     	fd = syscall(__NR_userfaultfd, O_CLOEXEC);
>     	if (fd < 0 || ioctl(fd, UFFDIO_API, &api) || ioctl(fd, UFFDIO_REGISTER, &reg)) {
>     		perror("userfaultfd");
>     		return 2;
>     	}
>     	pthread_create(&th, NULL, serve, (void *)(long)fd);
>     	sigaction(SIGUSR1, &sa, NULL);
>     
>     	/* move the frame down 16 bytes at a time until the FP image crosses a page at SPLIT */
>     	for (shift = 0; shift < PAGE && !placed; shift += 16) {
>     		ss.ss_size = 65536 - shift;
>     		sigaltstack(&ss, NULL);
>     		register long a0 asm("a0") = pid, a1 asm("a1") = tid;
>     		register long a2 asm("a2") = SIGUSR1, a7 asm("a7") = __NR_tgkill;
>     		fcsr = 0x1f;
>     		/* load the pattern, send ourselves SIGUSR1, store what the sigreturn left behind */
>     		asm volatile(ALL(fld, in) "csrw fcsr, %[fc]\n ecall\n csrr %[fc], fcsr\n" ALL(fsd, o)
>     			     : "+r"(a0), [fc]"+r"(fcsr)
>     			     : "r"(a1), "r"(a2), "r"(a7), [in]"r"(pat), [o]"r"(out) : CLOBBERS);
>     	}
>     	if (!placed)
>     		return 2;
>     	for (i = 0; i < 16; i++) {	/* f8/f9 are callee-saved: the handler's epilogue reloads them */
>     		if (i == 8 || i == 9 || out[i] == pat[i])
>     			continue;
>     		printf("f%d = %016lx, expected %016lx\n", i, out[i], pat[i]);
>     		bad++;
>     	}
>     	if (fcsr != 0x1f) {
>     		printf("fcsr = %lx, expected 1f\n", fcsr);
>     		bad++;
>     	}
>     	printf("%s\n", bad ? "FAIL: FP state corrupted across rt_sigreturn" : "PASS");
>     	return bad ? 1 : 0;
>     }
> 

I would prefer adding this into riscv selftest just to keep future
developments intact.

>  arch/riscv/kernel/signal.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 59784dc117e4..3058c89470e8 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -47,6 +47,13 @@ static long restore_fp_state(struct pt_regs *regs,
>  	long err;
>  	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
>  
> +	/*
> +	 * Mark the live FP state clean before the copy, so a context switch
> +	 * does not save the handler's registers over the restored image.
> +	 */
> +	if ((regs->status & SR_FS) != SR_FS_OFF)
> +		__fstate_clean(regs);
> +

With the v2 patch from Guobin [1], consider something like:

	if ((regs->status & SR_FS) != SR_FS_OFF) {
		preempt_disable();
		__fstate_clean(regs);
		preempt_enable();

>  	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
>  	if (unlikely(err))
>  		return err;
> 
> base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
> -- 
> 2.53.0
> 

[1]: https://lore.kernel.org/all/20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com/

Thanks,
Andy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
