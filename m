Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D137C5AD55
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 05:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbrATiJH4C2yOJJ6StuM2MnWtQXPg93Y6pcdL3J8lKU=; b=HIvk+wgdRhCRfP
	N3PTu4FJ2dBjXdINvKb0p9xJDvLIfM3R5jsbpnkN3kZs4wiN2PY0Fn9Qm+B0HvLGTco//B60++eL9
	a3LLZIWNZ7E02PRQVc2LtBTPYCAKhxXvUqsncsANxxli7+xktgmQOiLcqUVtXgQpYZAo76siek03v
	n9YGrblErdikRqSNN8tWPurqbB7ucqyLYHb+mOmtSsnve9BtdSnO45b0eV1eqJHBf+q3NjXl8CBgM
	yUvWDZ8R1OTTfwPG6pBIgIYMow2m4aVxWLMWDcR0HMaIVGVKS4N0QUN0neAmcDyIU5zBCUimox9SM
	LStWffCQ/1yRTBlRAvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtepX-0000000DJNv-0OVs;
	Tue, 11 Aug 2026 05:15:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtepR-0000000DJN7-1aiV
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 05:15:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38dcbade417so451799a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 22:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786425308; x=1787030108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nar3QBFMYGSVoBNp9egqiLjtAELBZbK1vM45Zqgvhzc=;
        b=OgktepdGtFGhflrLF8QOFyYuMqK4jFcf5qqOFFivdhossTAA5HpO1pIBwTZCXS6ZaC
         SuT3h+BiaDhuo5mnyevbANLpVLo85OymKO0maYNK+O351ddE6P5HCUC06B9H8jVdjjyC
         fnH3O3NhkUKfjJupdIqiyFaITFSI6ht+onngBEUyYhf3ckmWmdeb0yRW6LZeKOCg+Gck
         qpe4OHcFK/A6oDVrvMkzPVWqyKlg2yKLAkG50+bgNwynVm7s2PUYKlvdG2T5iDeJ9QiT
         geZZ9Qr2xkoK9BvUJuscGNHM1U43iTZFQB0YuR0HF820xKnt/BfwRLj+IytKLjgZEldG
         Vvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786425308; x=1787030108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nar3QBFMYGSVoBNp9egqiLjtAELBZbK1vM45Zqgvhzc=;
        b=Qk5br8xVlMqN4GM+Jd+C9XBwIKPifKVTCZpvgxOVjrc0rRpmuDKnW4MrHvWeL71RWd
         gOOHTZtcsyTIXZt9gF2Mx1mrdtX1Mff9MoXTog8GHLKkPg6i19BOb/XxrtZ9VlHP7CBt
         be2atGwXWKp514HtzxgalqY0f5dpWjSYVG13RUCGTSUBz/ceOMKlZXXB+ze/uW/oVBH3
         o7VpppVzrO2abbeZ0MOm00U77V3ddivaRZft+1M6GnV7shlWOxvxYxFy+sDwRihP5kHk
         Sn55LveFvu021ZqfNgiYHjObXqXsYzqQz2JRVwhqy8lz/DXR7/ApPhVexAcqYymWcbSo
         fZQA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8rq0V3/HecMtpk5vDZlGYaMvo+7CY5aYgZhaKpP5K3LI/EGtKzzuHIa2J/C922/IOwgL4eckGjrryqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3DMUUrt75R/XredMatjX23+0ww2GFgR5Lv+FCUts6Q0lY6xqP
	sDEoLrH+bd82FvXRVdOMJZHXQpoAiOqvuGxvRZlrBSwepr3MI5KRjZ6whz3PEZuldUo=
X-Gm-Gg: AR+sD12HGSorBlZkRfjx9I1IZ7d4yq5aBtdxnAGCsOqzSZcKWh/cqXxxeU00zN+jtys
	srSYA1njhgYeT6x5sBRbBm0cZ/8K4bF2lfdXyNhpNEwu/Ozv+aqtHniEeiaF0vOkoOpPkLHrwsW
	xXde7OteXykfq3HXt+hop9Cu8140JRK6rRGW2q/wPncO/xg4IPrpgb/f0oHr4P7eSl3XjEP63ob
	zpnJK5cVyInBOPn3TTIzblwyD+q1rxYUFWM6+IzLw801Uw8Sx6dbIW2cpMVt339UCX9kBS7Clvx
	XspBK/VvAeHau8+T8B/svgaloTATi7jturFF6azLX6rzuXZH2pGf0Ks8+hNyssdH8qlSPSuvFDE
	2Pm6hRCIh2x/4TvBbNW6VreBnj6pAo7zfvl3OClZjlLUtvNpF02CKBiG5HlmMtKzNA2bPfx4nWi
	2nUG5nvsPd6cZtn2wU0EVFCsw0zonnGpTL1CXivA2/Fjn77OZqLUxsH3jd6/nKSI2ixhrxYVFqJ
	q/utUOypEWihpHggKEDOLP/XNTbbLpxsIoPHH8=
X-Received: by 2002:a17:90b:274b:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-392ec71cae0mr737686a91.21.1786425308534;
        Mon, 10 Aug 2026 22:15:08 -0700 (PDT)
Received: from localhost (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d537d905sm1950413a91.14.2026.08.10.22.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:15:07 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:15:05 +0800
From: Andy Chiu <tchiu@tenstorrent.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: vector: preserve state when scheduling at nonzero
 depth
Message-ID: <anqv2bWIvgIyhGxe@Tao-Chiu's-Mac>
References: <20260806193241.10552-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806193241.10552-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_221509_743881_4DE07569 
X-CRM114-Status: GOOD (  35.11  )
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

Hi Karl,

On Thu, Aug 06, 2026 at 09:32:41PM +0200, Karl Mehltretter wrote:
> The IN_SCHEDULE shortcut lets __switch_to_vector() discard Vector state at
> a voluntary schedule point, where Vector registers are caller-saved.
> Switch-in can then enable Vector without restoring state.
> 
> An interrupt or fault can also schedule at nonzero Vector nesting depth.
> This triggers:
> 
>   WARNING: arch/riscv/include/asm/vector.h:376 at __schedule+0xfbc/0x10b4
> 
> The shortcut is then also taken on switch-in, so it skips NEED_RESTORE and
> riscv_v_context_nesting_end() resumes with stale Vector registers. In the
> vector usercopy loop, an interrupt between vsetvli and vle8.v/vse8.v can
> therefore resume with another task's vl, vtype and vector registers. The
> scalar loop state survives, so the copy can use the wrong vector length and
> silently corrupt user data. A sleeping page fault in vectorized usercopy
> can reach the same switch without CONFIG_PREEMPTION.
> 
> Use the shortcut only at depth zero. Nonzero-depth switches retain the
> existing save and NEED_RESTORE protocol.
> 
> Fixes: d1049fc0de81 ("riscv: vector: Support calling schedule() for preemptible Vector")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-luna
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Reproducer:
> 
> Originally caught by syzkaller fuzzing:
> 
>   [   75.067010] ------------[ cut here ]------------
>   [   75.069361] WARNING: arch/riscv/include/asm/vector.h:376 at __schedule+0xfbc/0x10b4, CPU#1: syz.4.788/3533
>   [   75.072830] CPU: 1 UID: 0 PID: 3533 Comm: syz.4.788 Not tainted 7.2.0-rc5-g11f985de3fef #3 PREEMPTLAZY
>   [   75.075177] [<ffffffff810cb124>] __schedule+0xfbc/0x10b4
>   [   75.075572] [<ffffffff810cb41c>] preempt_schedule_irq+0x2a/0x76
>   [   75.075753] [<ffffffff810c6a06>] irqentry_exit+0x260/0xd48
>   [   75.075911] [<ffffffff810c666a>] do_irq+0x34/0x48
>   [   75.076076] [<ffffffff810d4f82>] handle_exception+0x146/0x174
>   [   75.076380] [<ffffffff810c5654>] loop+0x4/0x26
>   [   75.076505] [<ffffffff80749838>] copy_folio_from_iter_atomic+0x2d4/0xd64
>   [   75.078599] ---[ end trace 0000000000000000 ]---
> 
> The following standalone workload exercises the same vectorized usercopy
> path. Build vector-stress.c into the initramfs and mount debugfs before
> running it. The kernel used CONFIG_PREEMPT_LAZY=y,
> CONFIG_RISCV_ISA_V_PREEMPTIVE=y and CONFIG_KCOV=y. Run it under QEMU TCG
> with:
> 
>   qemu-system-riscv64 -machine virt -cpu max -smp 1 -nographic \
>     -kernel arch/riscv/boot/Image -initrd vector-diag-small-memcheck.cpio.gz \
>     -append 'console=ttyS0 earlycon=sbi rdinit=/init'
> 
> The stress program checks every byte read back from the pipe. With this
> patch, the workload completed with failures=0 and no Vector warning.
> 
> Testing:
>   checkpatch.pl --strict, git diff --check, Image builds with
>   CONFIG_RISCV_ISA_V_PREEMPTIVE=y and CONFIG_RISCV_ISA_V_PREEMPTIVE=n, and
>   QEMU TCG one-vCPU stress runs. The patched workload completed with
>   failures=0 and no warning.
> 
> No conflict with Andy Chiu's pending "riscv: optimize Vector context restore
> on syscall" series; both apply independently.
> 
> vector-stress.c:
> 
> #define _GNU_SOURCE
> 
> #include <errno.h>
> #include <fcntl.h>
> #include <linux/kcov.h>
> #include <pthread.h>
> #include <sched.h>
> #include <stdatomic.h>
> #include <stdint.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/ioctl.h>
> #include <sys/mman.h>
> #include <sys/types.h>
> #include <unistd.h>
> 
> #define WORKERS 4
> #define ITERATIONS 2000
> #define CHUNK (16 * 1024)
> #define KCOV_ENTRIES (1 << 16)
> #define KCOV_BYTES (KCOV_ENTRIES * sizeof(unsigned long))
> 
> static pthread_barrier_t start_barrier;
> static atomic_int failures;
> 
> static int kcov_start(unsigned long **area, int *fd, int id)
> {
> 	unsigned long *map;
> 	int kfd, saved_errno;
> 
> 	kfd = open("/sys/kernel/debug/kcov", O_RDWR);
> 	if (kfd < 0) {
> 		dprintf(STDERR_FILENO, "worker %d: KCOV open: %s\n", id,
> 			strerror(errno));
> 		return -1;
> 	}
> 	if (ioctl(kfd, KCOV_INIT_TRACE, KCOV_ENTRIES) < 0) {
> 		dprintf(STDERR_FILENO, "worker %d: KCOV init: %s\n", id,
> 			strerror(errno));
> 		goto fail_close;
> 	}
> 	map = mmap(NULL, KCOV_BYTES,
> 			PROT_READ | PROT_WRITE, MAP_SHARED, kfd, 0);
> 	if (map == MAP_FAILED) {
> 		dprintf(STDERR_FILENO, "worker %d: KCOV mmap: %s\n", id,
> 			strerror(errno));
> 		goto fail_close;
> 	}
> 	if (ioctl(kfd, KCOV_ENABLE, KCOV_TRACE_PC) < 0) {
> 		dprintf(STDERR_FILENO, "worker %d: KCOV enable: %s\n", id,
> 			strerror(errno));
> 		saved_errno = errno;
> 		munmap(map, KCOV_BYTES);
> 		errno = saved_errno;
> 		goto fail_close;
> 	}
> 	*area = map;
> 	*fd = kfd;
> 	return 0;
> 
> fail_close:
> 	saved_errno = errno;
> 	close(kfd);
> 	errno = saved_errno;
> 	return -1;
> }
> 
> static void *worker(void *arg)
> {
> 	unsigned long *area;
> 	unsigned char *buffer;
> 	int pipefd[2], kfd, id = (int)(uintptr_t)arg;
> 
> 	if (kcov_start(&area, &kfd, id) < 0) {
> 		atomic_fetch_add(&failures, 1);
> 		return NULL;
> 	}
> 	if (pipe2(pipefd, O_CLOEXEC) < 0) {
> 		dprintf(STDERR_FILENO, "worker %d: pipe failed: %s\n", id,
> 			strerror(errno));
> 		atomic_fetch_add(&failures, 1);
> 		goto out_kcov;
> 	}
> 	buffer = aligned_alloc(64, CHUNK);
> 	if (!buffer) {
> 		dprintf(STDERR_FILENO, "worker %d: allocation failed: %s\n", id,
> 			strerror(errno));
> 		atomic_fetch_add(&failures, 1);
> 		goto out_pipe;
> 	}
> 	memset(buffer, 0x30 + id, CHUNK);
> 	pthread_barrier_wait(&start_barrier);
> 
> 	for (int i = 0; i < ITERATIONS; i++) {
> 		size_t done = 0;
> 
> 		while (done < CHUNK) {
> 			ssize_t n = write(pipefd[1], buffer + done, CHUNK - done);
> 			if (n < 0 && errno == EINTR)
> 				continue;
> 			if (n <= 0) {
> 				atomic_fetch_add(&failures, 1);
> 				goto out_buffer;
> 			}
> 			done += n;
> 		}
> 		done = 0;
> 		while (done < CHUNK) {
> 			ssize_t n = read(pipefd[0], buffer + done, CHUNK - done);
> 			if (n < 0 && errno == EINTR)
> 				continue;
> 			if (n <= 0) {
> 				atomic_fetch_add(&failures, 1);
> 				goto out_buffer;
> 			}
> 			done += n;
> 		}
> 		for (size_t j = 0; j < CHUNK; j++) {
> 			if (buffer[j] != (unsigned char)(0x30 + id)) {
> 				dprintf(STDERR_FILENO,
> 					"worker %d: data mismatch at %zu\n", id, j);
> 				atomic_fetch_add(&failures, 1);
> 				goto out_buffer;
> 			}
> 		}
> 		if ((i & 7) == 0)
> 			sched_yield();
> 	}
> 
> out_buffer:
> 	free(buffer);
> out_pipe:
> 	close(pipefd[0]);
> 	close(pipefd[1]);
> out_kcov:
> 	ioctl(kfd, KCOV_DISABLE, 0);
> 	munmap(area, KCOV_BYTES);
> 	close(kfd);
> 	return NULL;
> }
> 
> int main(void)
> {
> 	pthread_t threads[WORKERS];
> 
> 	pthread_barrier_init(&start_barrier, NULL, WORKERS);
> 	for (int i = 0; i < WORKERS; i++)
> 		if (pthread_create(&threads[i], NULL, worker, (void *)(uintptr_t)i))
> 			atomic_fetch_add(&failures, 1);
> 	for (int i = 0; i < WORKERS; i++)
> 		pthread_join(threads[i], NULL);
> 	pthread_barrier_destroy(&start_barrier);
> 
> 	printf("vector-stress complete failures=%d\n", atomic_load(&failures));
> 	return atomic_load(&failures) ? 1 : 0;
> }

I cannot reproduce the WARN fail using the program here on a clean
7.2-rc1. Could you provide the following information to help us track
down the exact failure?
 - The original reproducer that syzkaller gives.
 - The upstream commit hash including applied series on your test branch,
   preferably a link to your git tree.

> 
>  arch/riscv/include/asm/vector.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 00cb9c0982b1a..1766bb7494d3b 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -372,8 +372,8 @@ static inline void __switch_to_vector(struct task_struct *prev,
>  	struct pt_regs *regs;
>  
>  	if (riscv_preempt_v_started(prev)) {
> -		if (riscv_v_is_on()) {
> -			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
> +		if (riscv_v_is_on() &&
> +		    !(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK)) {
>  			riscv_v_disable();
>  			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
>  		}

In fact we don't need to check riscv_v_is_on() here, voluntary switch
always happens at level 0. This change is included in the v5 series of
optimizing vector syscall latency[1], which closes the usercopy
corruption on v4 of a kvm fix from the other end. The v5 series
provides a direct fix and have the behavior documented here [2].

Since the problem only appears in the v4 series of the kvm fix,
triggering this bug on the current upstream may indicate that there are
some unclosed path that leads to the error. So it would be valuable if
you could provide the exact reproducer and base for us to investagate.

[1]: https://lore.kernel.org/all/20260810172255.1532787-2-tchiu@tenstorrent.com/
[2]: https://lore.kernel.org/all/20260803215250.824417-4-tchiu@tenstorrent.com/

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
