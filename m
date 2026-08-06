Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBD3C5AC67
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 19:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F+2bqb92yXyaaGDA6e5wUqISrkDLzpCDGhGGIe7k6IQ=; b=vLHjqZvMvfrClN
	dgsAgsf276YkkjKTeerO9mYgo4pqQ7nu1Tg3IRlSBKZDPZ5UIhqFPP25CdOooaK6u6FVJvsQEAZxl
	euaccpwYKa7acSwzurh1iczbPm2OGL334hOoSMgN4aGODNc9S10Gj4BlrLNx+u0Qa+XAsJzCinLeC
	j+3rqBBvKYzp29kqTKWTmbEJGt3vyVQED8Co89sJY+QCjZmmaOFPXOp9CN4qlbH1qetIGcvkE4lxV
	KueYoF45plAHhw3hj49kKwPsiUDOnwt4uZ8BIHnpG8fzaTsyy2PSJUJlfwvLqy//zSDQO3RpNHHnq
	4T5+WeqfvJJYKjHVhZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3pj-00000006ZZR-2Ut0;
	Thu, 06 Aug 2026 19:32:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3ph-00000006ZZ0-1YGI
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 19:32:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1187228f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 12:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786044767; x=1786649567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TlLU3iudfDSh37R1MgKEhJzdbfc94lN89q/rnC4V6M=;
        b=Xkiepl395TlWF+Pl0hSUdVL0coieIGGXe0ubq2HubmWK9kdiSLG463tE/Y8rKNxsVn
         JclXXtW+tLs6Jw1kKKHAs7zl+F4b38ZfA/o1xmFWnZz+yZTa6hlmochQy6NY7+EWM9OJ
         HljB5xQrPbjrgcYrCiXcy+JnHhtkanVHE3WetwN3co98GmaVYjA/JUbm+BM6WXQo1oIR
         wBnO3pXzovKGyFJ1UGc8TOjJq9a5C+xRd4eS0hcOIwD7SV/jR0QCS+6OkikUG4y2vNVm
         GYCj+beIqMDaoJrKZeKt+n4CPePlPHreGy4Sra7o6YFwA7qkuTKFWuOL4q0yH5+qXA/k
         IbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044767; x=1786649567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TlLU3iudfDSh37R1MgKEhJzdbfc94lN89q/rnC4V6M=;
        b=nPzvP8VqpP/jxD3Q6BE7sijyOMVRgas3AfGPU/Wv1rDcJUEffbcUzP+c/a5ijKxJ6v
         Uwxzq5J9mc7K0cda9ib23w4P0oUSSWK8xPXSh+0lM+AaiR2MwkvR2pcW+MXflOAFhjZA
         mgjSW16qL3GNSF9uz2d4Vfs+cLlggTcrnuJp2skp1mKZ8Fz5lMr66Tkq8MvI1cIORbgH
         fljSsUqr6R6UwyzUZdgFqCTO0Hq9hwDraJkk+p2miB6YwaZ2dmXGgRSz6c8RFUGx0FSK
         63jrrjbRnitVOATlFF6KcDKYf09q/CovAvGXaR9QOqHCVfPZJh8TMV76B7/RZeJ1/kBI
         kOWA==
X-Forwarded-Encrypted: i=1; AHgh+RrOltIvrnG9qqBuTkDrX2tYR9B2cFYoA7imHpVIx8dBRCjLddJU8gR2KkRw/RiI4bVXo7Azcgz3YB5ehg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn6cUsLYwhPsJGUCKCaueRVli/seHTiQhkveadrvkRSoJX0D5c
	X0NQ3ePnKywqyKcPe4z9p1SjtIh6b9e/eS2wC2JO3EDS7kUkR2NmgA0s
X-Gm-Gg: AR+sD135eL8X9saekY8Sq/dJGgxn6TQd3iZ0KKlvyRPIjaHJ6raT0QbOS3gzoerJhj8
	DctQdfe5GVvFjpXi1BpMPV6h6MyChiIdRw9upk3R2TpmQhlRYeNWEcDRd2HC5kZe98GwPMI58mi
	AOiBR/aJ/q2hm1r6u9bpQO9yO80rz4qQmcBaiiBI8uOkG+DnHWcphjNrcXm89kSjsEjTu7oz+3T
	bJUJpxArPznBD0ItpM3g8w8MLqFLagHNc9fhRf/iix5FxG4/Iw3SUnHGjm/qFBpEB4lt8tQ0Bgz
	uDmZjUJGrRfgO1EkxsIZfrOTTxch4UabUt56stMuf0dJULCLmjejNXhNlLZwLfp08/kIxcqK2zW
	j9tnsZ3q8bY+GTarSaNPRBYyczJsvhbA3+gf9Hqo8eMd0vMawLtyuhqyuMZYVlreTxoXSLatTF6
	yfAsz61XG666K970BWMs1uMlxSZLh2RnQuRmow+tBKWT7HWehxJmzq8Djovl5Dp1Q38LWcX8Sp2
	bbSv9YyQXe0MJdCtcgEi9z/OSkbC4jqYEwuEe/jajpZEDwrEWbjbwvZIljEypgLkRGqs82Cm8+a
	1hHFslhULF1y9+DUGytY0RZ0UTie2duvqJDGxk0Kvjc6kEZyxY1oQMdQHw070NYdnRibLwKalg=
	=
X-Received: by 2002:a5d:67cc:0:b0:47f:6dcb:3737 with SMTP id ffacd0b85a97d-47fec64be03mr19894812f8f.29.1786044766987;
        Thu, 06 Aug 2026 12:32:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adf9-2301-8c14-6be6-a9e6-a2d4.310.pool.telefonica.de. [2a02:3100:adf9:2301:8c14:6be6:a9e6:a2d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b250cfsm8782322f8f.28.2026.08.06.12.32.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Aug 2026 12:32:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <tchiu@tenstorrent.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] riscv: vector: preserve state when scheduling at nonzero depth
Date: Thu,  6 Aug 2026 21:32:41 +0200
Message-Id: <20260806193241.10552-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_123249_451145_F949ED5A 
X-CRM114-Status: GOOD (  17.78  )
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

The IN_SCHEDULE shortcut lets __switch_to_vector() discard Vector state at
a voluntary schedule point, where Vector registers are caller-saved.
Switch-in can then enable Vector without restoring state.

An interrupt or fault can also schedule at nonzero Vector nesting depth.
This triggers:

  WARNING: arch/riscv/include/asm/vector.h:376 at __schedule+0xfbc/0x10b4

The shortcut is then also taken on switch-in, so it skips NEED_RESTORE and
riscv_v_context_nesting_end() resumes with stale Vector registers. In the
vector usercopy loop, an interrupt between vsetvli and vle8.v/vse8.v can
therefore resume with another task's vl, vtype and vector registers. The
scalar loop state survives, so the copy can use the wrong vector length and
silently corrupt user data. A sleeping page fault in vectorized usercopy
can reach the same switch without CONFIG_PREEMPTION.

Use the shortcut only at depth zero. Nonzero-depth switches retain the
existing save and NEED_RESTORE protocol.

Fixes: d1049fc0de81 ("riscv: vector: Support calling schedule() for preemptible Vector")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-luna
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Reproducer:

Originally caught by syzkaller fuzzing:

  [   75.067010] ------------[ cut here ]------------
  [   75.069361] WARNING: arch/riscv/include/asm/vector.h:376 at __schedule+0xfbc/0x10b4, CPU#1: syz.4.788/3533
  [   75.072830] CPU: 1 UID: 0 PID: 3533 Comm: syz.4.788 Not tainted 7.2.0-rc5-g11f985de3fef #3 PREEMPTLAZY
  [   75.075177] [<ffffffff810cb124>] __schedule+0xfbc/0x10b4
  [   75.075572] [<ffffffff810cb41c>] preempt_schedule_irq+0x2a/0x76
  [   75.075753] [<ffffffff810c6a06>] irqentry_exit+0x260/0xd48
  [   75.075911] [<ffffffff810c666a>] do_irq+0x34/0x48
  [   75.076076] [<ffffffff810d4f82>] handle_exception+0x146/0x174
  [   75.076380] [<ffffffff810c5654>] loop+0x4/0x26
  [   75.076505] [<ffffffff80749838>] copy_folio_from_iter_atomic+0x2d4/0xd64
  [   75.078599] ---[ end trace 0000000000000000 ]---

The following standalone workload exercises the same vectorized usercopy
path. Build vector-stress.c into the initramfs and mount debugfs before
running it. The kernel used CONFIG_PREEMPT_LAZY=y,
CONFIG_RISCV_ISA_V_PREEMPTIVE=y and CONFIG_KCOV=y. Run it under QEMU TCG
with:

  qemu-system-riscv64 -machine virt -cpu max -smp 1 -nographic \
    -kernel arch/riscv/boot/Image -initrd vector-diag-small-memcheck.cpio.gz \
    -append 'console=ttyS0 earlycon=sbi rdinit=/init'

The stress program checks every byte read back from the pipe. With this
patch, the workload completed with failures=0 and no Vector warning.

Testing:
  checkpatch.pl --strict, git diff --check, Image builds with
  CONFIG_RISCV_ISA_V_PREEMPTIVE=y and CONFIG_RISCV_ISA_V_PREEMPTIVE=n, and
  QEMU TCG one-vCPU stress runs. The patched workload completed with
  failures=0 and no warning.

No conflict with Andy Chiu's pending "riscv: optimize Vector context restore
on syscall" series; both apply independently.

vector-stress.c:

#define _GNU_SOURCE

#include <errno.h>
#include <fcntl.h>
#include <linux/kcov.h>
#include <pthread.h>
#include <sched.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <unistd.h>

#define WORKERS 4
#define ITERATIONS 2000
#define CHUNK (16 * 1024)
#define KCOV_ENTRIES (1 << 16)
#define KCOV_BYTES (KCOV_ENTRIES * sizeof(unsigned long))

static pthread_barrier_t start_barrier;
static atomic_int failures;

static int kcov_start(unsigned long **area, int *fd, int id)
{
	unsigned long *map;
	int kfd, saved_errno;

	kfd = open("/sys/kernel/debug/kcov", O_RDWR);
	if (kfd < 0) {
		dprintf(STDERR_FILENO, "worker %d: KCOV open: %s\n", id,
			strerror(errno));
		return -1;
	}
	if (ioctl(kfd, KCOV_INIT_TRACE, KCOV_ENTRIES) < 0) {
		dprintf(STDERR_FILENO, "worker %d: KCOV init: %s\n", id,
			strerror(errno));
		goto fail_close;
	}
	map = mmap(NULL, KCOV_BYTES,
			PROT_READ | PROT_WRITE, MAP_SHARED, kfd, 0);
	if (map == MAP_FAILED) {
		dprintf(STDERR_FILENO, "worker %d: KCOV mmap: %s\n", id,
			strerror(errno));
		goto fail_close;
	}
	if (ioctl(kfd, KCOV_ENABLE, KCOV_TRACE_PC) < 0) {
		dprintf(STDERR_FILENO, "worker %d: KCOV enable: %s\n", id,
			strerror(errno));
		saved_errno = errno;
		munmap(map, KCOV_BYTES);
		errno = saved_errno;
		goto fail_close;
	}
	*area = map;
	*fd = kfd;
	return 0;

fail_close:
	saved_errno = errno;
	close(kfd);
	errno = saved_errno;
	return -1;
}

static void *worker(void *arg)
{
	unsigned long *area;
	unsigned char *buffer;
	int pipefd[2], kfd, id = (int)(uintptr_t)arg;

	if (kcov_start(&area, &kfd, id) < 0) {
		atomic_fetch_add(&failures, 1);
		return NULL;
	}
	if (pipe2(pipefd, O_CLOEXEC) < 0) {
		dprintf(STDERR_FILENO, "worker %d: pipe failed: %s\n", id,
			strerror(errno));
		atomic_fetch_add(&failures, 1);
		goto out_kcov;
	}
	buffer = aligned_alloc(64, CHUNK);
	if (!buffer) {
		dprintf(STDERR_FILENO, "worker %d: allocation failed: %s\n", id,
			strerror(errno));
		atomic_fetch_add(&failures, 1);
		goto out_pipe;
	}
	memset(buffer, 0x30 + id, CHUNK);
	pthread_barrier_wait(&start_barrier);

	for (int i = 0; i < ITERATIONS; i++) {
		size_t done = 0;

		while (done < CHUNK) {
			ssize_t n = write(pipefd[1], buffer + done, CHUNK - done);
			if (n < 0 && errno == EINTR)
				continue;
			if (n <= 0) {
				atomic_fetch_add(&failures, 1);
				goto out_buffer;
			}
			done += n;
		}
		done = 0;
		while (done < CHUNK) {
			ssize_t n = read(pipefd[0], buffer + done, CHUNK - done);
			if (n < 0 && errno == EINTR)
				continue;
			if (n <= 0) {
				atomic_fetch_add(&failures, 1);
				goto out_buffer;
			}
			done += n;
		}
		for (size_t j = 0; j < CHUNK; j++) {
			if (buffer[j] != (unsigned char)(0x30 + id)) {
				dprintf(STDERR_FILENO,
					"worker %d: data mismatch at %zu\n", id, j);
				atomic_fetch_add(&failures, 1);
				goto out_buffer;
			}
		}
		if ((i & 7) == 0)
			sched_yield();
	}

out_buffer:
	free(buffer);
out_pipe:
	close(pipefd[0]);
	close(pipefd[1]);
out_kcov:
	ioctl(kfd, KCOV_DISABLE, 0);
	munmap(area, KCOV_BYTES);
	close(kfd);
	return NULL;
}

int main(void)
{
	pthread_t threads[WORKERS];

	pthread_barrier_init(&start_barrier, NULL, WORKERS);
	for (int i = 0; i < WORKERS; i++)
		if (pthread_create(&threads[i], NULL, worker, (void *)(uintptr_t)i))
			atomic_fetch_add(&failures, 1);
	for (int i = 0; i < WORKERS; i++)
		pthread_join(threads[i], NULL);
	pthread_barrier_destroy(&start_barrier);

	printf("vector-stress complete failures=%d\n", atomic_load(&failures));
	return atomic_load(&failures) ? 1 : 0;
}

 arch/riscv/include/asm/vector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1a..1766bb7494d3b 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -372,8 +372,8 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	if (riscv_preempt_v_started(prev)) {
-		if (riscv_v_is_on()) {
-			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
+		if (riscv_v_is_on() &&
+		    !(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK)) {
 			riscv_v_disable();
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
 		}
-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
