Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F56606A330
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LoogDqcu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=VuzJTDnk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lOgHKf33YMTiuI0phTYZ+0cCMP6lGfim5mjR7UOx2S8=; b=LoogDqcufUtNcUTyj36/B9x5jZ
	IB4MBDQDff404xJ3EbWK2jE30rk4/AC3Toue+sClCw4aQ3PupL+yYuN8sh7SD5UiHUln+sOQ/Iw7w
	fWQaq7pdVxPaETuNOha8O/EMxIZf/smuV1WVXtCKWFH5y9pD/faSuxIGOok80Q2C6dIj2u1+IEd8c
	dRX3p/nV5Uis3n7YteSQKPVifaUpRaNgcXGHvdEIFg69z7RBhHH1fUm3WYyL4mXKAMrjGyf3Vh7Lr
	vSdqFcnqo3wowYBz8aFEWvL6VEDnQ9yLkKXTakse96HPu0xCJDLIK1DZv+reOf1qhbjcM6AFgQLY5
	V+Wbg2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu1N-0000000DX99-3sMD;
	Fri, 13 Nov 2026 16:21:01 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu1K-0000000DX8D-0rY6
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 16:21:00 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 52E7820DCBFA;
	Fri, 13 Nov 2026 17:20:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 2D62020E172C;
	Fri, 13 Nov 2026 17:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 2D62020E172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794586852;
	bh=VuYNdjcP+NSrgdXQwlnxBvm5XkcyWUAws/4TPn94cTk=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=VuzJTDnkhG4lX5iDdfoY9RykmYfW8bDuSO1O2oK11OFtrsh1O4+9Wn0O37AsQCot4
	 7kg3t1kR4uV31K3wpPI+ICE2cbePhYI5Gj/rpexhmIpxX5bdnYEHdCW8+fBaps7NWM
	 rz3Q+pMY+XlurPIwqzp2p5+9i/aYEldEowfsCVNIYwpHSvnvkB0ZnT+8fP9Ap+RCU6
	 gu0MKtmAWj7u94Xf2lsiHaBwSKYJHUAx0bRpulktASxS4brN8zR0o3b7EfoPUW275S
	 SYm1KzV5MO267hYcuaPJaibZLe/Ot8YgXQkBKS2xNVOPDuClezUP4R0H97D9SByyAo
	 IqqTwczox9y8A==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 7S_o8nZNM0CP; Fri, 13 Nov 2026 17:20:52 +0100 (CET)
Received: from localhost.localdomain (unknown [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id A987420DCBFA;
	Fri, 13 Nov 2026 17:20:51 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	kevin zhang <zhangmeng.kevin@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Andy Chiu <tchiu@tenstorrent.com>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Date: Fri, 13 Nov 2026 17:20:10 +0100
Message-ID: <20261113162011.643861-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avb_p4b7C21aZqNG@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net> <ap-SIQ9DLt-CfAx6@aurel32.net> <aqGNGp8PInSV4vty@aurel32.net> <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac> <auulITfR8BrabdVF@aurel32.net> <47902FCAC1DDFAB2+525255ac-cc05-4a57-bd83-a4a29edcbe01@linux.spacemit.com> <avSWseBxLUyf5X0t@aurel32.net> <20261113080209.606179-1-frederic.mahe@cirad.fr> <avb_p4b7C21aZqNG@aurel32.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_082058_864954_4A633746 
X-CRM114-Status: GOOD (  26.63  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

On 2026-11-13 13:16, Aurelien Jarno wrote:
> You mention "all", but you sent the mail only to Kevin and me. Is it
> wanted?

No, a mistake in my git send-email options, sorry. Adding everyone back.
For the lists: my first mail had a userspace reproducer (again at the end
of this one): two threads do vle8.v (e8, m8) from a shared memfd mapping
while two other threads madvise(MADV_DONTNEED) it. Some loads retire
with only their first 16*n bytes written, without a trap. Its "k" mode
does the same through write() and gives Aurelien's usercopy signature on
a stock 6.18 kernel. Aurelien can reproduce both on his side; not (yet)
on the K3.

> I am not sure you can conclude anything from vstart != 0. The RVV spec
> leaves a lot of freedom on the vstart mechanism.

Agreed. All it shows is that the kernel never resumed one of these loads
with a nonzero vstart. A restart from vstart = 0 reloads everything, so
either way the S-mode trap handling can't produce a partial load.

> Have you been able to trace that further at the SBI level?

No. The kernel here does remote fences through SBI, so I can't remove
M-mode from the path on the K1.

> The remote TLB shootdown causes an M-mode IPI on the hart where the
> vector load instruction is running, but on that hart it doesn't run
> concurrently with the vector load instruction.

Agreed for the IPI. But the PTE is cleared in memory before the IPI is
sent. If the later beats of the load are translated again (e.g. a
micro-TLB miss inside the instruction) and the walk sees the cleared
PTE, the load should fault with vstart > 0; dropping the fault and
retiring would match your trace (no fault on the bad load, a fault on
the next iteration on the same page). Only zapping the page being read
triggers it here; zapping all the other pages of the mapping doesn't.

I tried to test this by timing an immediate retry of a bad load (a page
fault makes it slow), but the probe itself suppresses the problem: on
v7.4-rc1 + THP, adding two rdtime, or one extra vle8.v, after each batch
of 4096 loads takes the rate from 25/240 process runs to 0/360. rdtime
is native here (~8 ns), so no M-mode trap. Moving a vector store in the
same place gives 3/120. The bad state seems to depend on the exact
instruction stream, which also points below the kernel.

> I even have the *feeling* that once the problem happened, it then
> happens more often.

Same here: a process either never hits, or enters a state where one
page keeps hitting (up to ~100/s per thread) while the zapping goes on.
It stops when the zapping pauses and resumes with it. Fresh exec'd
processes enter it ~10x more often than forked ones, mostly in their
first seconds. I haven't compared reboots.

> Did you chose to pin the two process on a different clusters as it
> doesn't reproduce at all when on the same cluster?

No, each process keeps its 4 threads on one cluster; the second process
is only there for throughput. Zappers on the other cluster: 6/80 runs,
vs 7/80 with everything on one cluster ("k" mode, 20 s runs). So the
cluster doesn't matter.

Frederic

(Claude, an AI assistant, helped write and run these tests.)

---8<--- k1-vload-repro.c ---
// SPDX-License-Identifier: GPL-2.0
/*
 * k1-vload-repro: RVV unit-stride loads that retire without writing all
 * their elements (seen on SpacemiT K1), while another hart zaps the PTE
 * of the page being read.
 *
 * Each round runs two fresh processes at once (fork + exec of this
 * binary), one per 4-CPU cluster. In each process, 2 pinned workers load
 * 32*LMUL bytes (vle8.v, e8) from a 16-page shared memfd mapping into a
 * v16 group that they first fill with 0xa5, and compare with the
 * expected bytes in vector registers. 2 other pinned threads call
 * madvise(MADV_DONTNEED) on the mapping in a loop (the page cache keeps
 * the data, so every refault returns the same bytes).
 *
 * A hit is a load whose tail still holds the 0xa5 fill: the instruction
 * retired without writing its last elements, and no trap was taken.
 * A process either never hits or enters a state where it hits often,
 * usually within its first seconds, hence many short runs.
 *
 * Build: gcc -O2 -march=rv64gcv -pthread -o k1-vload-repro k1-vload-repro.c
 * Run:   ./k1-vload-repro [rounds [seconds [lmul|k]]]   (default 60 5 8)
 *        "k": the workers write() 4 KiB from the mapping into a pipe and
 *        read it back instead, i.e. the kernel's vector copy_from_user
 *        does the loads (a bad copy holds stale register contents).
 *        On a BPI-F3: ~1-15 % of process runs hit with m8 (more on
 *        v7.4-rc1 with THP than on 6.18), ~10 % with "k" and 20 s runs.
 */
#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <unistd.h>

#define PG	4096
#define NPAGES	16
#define LEN	(NPAGES * PG)
#define FILL	0xa5

static uint8_t *src, ref[LEN];
static _Atomic int stop;
static _Atomic unsigned long hits;
static int base_cpu, lmul = 8;

static void pin(int cpu)
{
	cpu_set_t s;

	CPU_ZERO(&s);
	CPU_SET(cpu % 8, &s);
	sched_setaffinity(0, sizeof(s), &s);
}

/*
 * 'iters' loads of 32 * LMUL bytes from s, each into a v16 group filled
 * with FILL first; returns the failing iteration (v16 stored to out) or -1.
 */
#define VCHECK(NAME, LMUL)						\
static long NAME(const uint8_t *s, const uint8_t *r, long iters, uint8_t *out) \
{									\
	long left = iters, bad;						\
	size_t vl;							\
									\
	asm volatile("vsetvli %[vl], %[n], e8, " LMUL ", ta, ma\n\t"	\
		     "vle8.v v8, (%[r])\n\t"				\
		     "1:\n\t"						\
		     "vmv.v.x v16, %[fill]\n\t"				\
		     "vle8.v v16, (%[s])\n\t"				\
		     "vmsne.vv v0, v16, v8\n\t"				\
		     "vcpop.m %[bad], v0\n\t"				\
		     "bnez %[bad], 2f\n\t"				\
		     "addi %[left], %[left], -1\n\t"			\
		     "bnez %[left], 1b\n\t"				\
		     "j 3f\n"						\
		     "2:\n\t"						\
		     "vse8.v v16, (%[out])\n"				\
		     "3:\n"						\
		     : [vl] "=&r"(vl), [left] "+r"(left), [bad] "=&r"(bad) \
		     : [n] "r"((size_t)256), [s] "r"(s), [r] "r"(r),	\
		       [out] "r"(out), [fill] "r"((long)FILL)		\
		     : "memory", "v0", "v8", "v9", "v10", "v11", "v12", "v13", \
		       "v14", "v15", "v16", "v17", "v18", "v19", "v20", "v21", \
		       "v22", "v23");					\
	return bad ? iters - left : -1;					\
}
VCHECK(vcheck_m1, "m1")
VCHECK(vcheck_m2, "m2")
VCHECK(vcheck_m4, "m4")
VCHECK(vcheck_m8, "m8")

static long vcheck(const uint8_t *s, const uint8_t *r, long iters, uint8_t *out)
{
	switch (lmul) {
	case 1: return vcheck_m1(s, r, iters, out);
	case 2: return vcheck_m2(s, r, iters, out);
	case 4: return vcheck_m4(s, r, iters, out);
	default: return vcheck_m8(s, r, iters, out);
	}
}

static void *worker(void *arg)
{
	int w = (int)(long)arg, nb = 32 * lmul;
	unsigned int seed = 12345 + w;
	uint8_t out[256];

	pin(base_cpu + w);
	while (!stop) {
		/* 256 B inside one page, 16 B aligned */
		size_t o = (size_t)(rand_r(&seed) % (NPAGES - 1)) * PG +
			   ((size_t)(rand_r(&seed) % (PG - 256 + 16)) & ~(size_t)15);

		if (vcheck(src + o, ref + o, 4096, out) < 0)
			continue;
		int first = -1, nfill = 0, nother = 0;

		for (int i = 0; i < nb; i++) {
			if (out[i] == ref[o + i])
				continue;
			if (first < 0)
				first = i;
			if (out[i] == FILL)
				nfill++;
			else
				nother++;
		}
		if (atomic_fetch_add(&hits, 1) < 5)
			printf("  HIT cpu %d va %p: elements %d..%d not loaded "
			       "(%d bytes still 0x%02x, %d other)\n",
			       sched_getcpu(), (void *)(src + o), first, nb - 1,
			       nfill, FILL, nother);
	}
	return NULL;
}

/*
 * Kernel mode: write() 4 KiB from the mapping into a pipe and read it back.
 * The kernel's copy_from_user uses vector loads above 768 bytes. A bad
 * copy holds whatever was in the vector registers instead of the data:
 * 0xff if the thread had live vector state (poisoned at syscall entry by
 * __riscv_v_vstate_discard()), otherwise stale data from an earlier copy.
 */
static uint8_t kfill = 0xff;

static void *kworker(void *arg)
{
	int w = (int)(long)arg, p[2];
	unsigned int seed = 12345 + w;
	static __thread uint8_t buf[4096];

	pin(base_cpu + w);
	if (pipe(p))
		return NULL;
	while (!stop) {
		size_t o = (size_t)(rand_r(&seed) % ((NPAGES - 1) * PG)) & ~(size_t)15;

		if (write(p[1], src + o, 4096) != 4096 || read(p[0], buf, 4096) != 4096)
			break;
		if (!memcmp(buf, ref + o, 4096))
			continue;
		int first = -1, last = 0, nff = 0;

		for (int i = 0; i < 4096; i++)
			if (buf[i] != ref[o + i]) {
				if (first < 0)
					first = i;
				last = i;
				nff += buf[i] == kfill;
			}
		if (atomic_fetch_add(&hits, 1) < 5)
			printf("  HIT cpu %d va %p: write() copied wrong bytes %d..%d "
			       "(%d of them 0x%02x, the rest stale data)\n",
			       sched_getcpu(), (void *)(src + o), first, last, nff,
			       kfill);
	}
	return NULL;
}

static void *zapper(void *arg)
{
	pin(base_cpu + 2 + (int)(long)arg);
	while (!stop)
		madvise(src, LEN, MADV_DONTNEED);
	return NULL;
}

static int child(int secs)
{
	int fd = memfd_create("k1-vload", 0);

	if (fd < 0 || write(fd, ref, LEN) != LEN) {
		perror("memfd");
		return 2;
	}
	src = mmap(NULL, LEN, PROT_READ, MAP_SHARED, fd, 0);
	if (src == MAP_FAILED) {
		perror("mmap");
		return 2;
	}
	pthread_t t[4];

	for (long i = 0; i < 2; i++)
		pthread_create(&t[i], NULL, lmul ? worker : kworker, (void *)i);
	for (long i = 0; i < 2; i++)
		pthread_create(&t[2 + i], NULL, zapper, (void *)i);
	sleep(secs);
	stop = 1;
	for (int i = 0; i < 4; i++)
		pthread_join(t[i], NULL);
	return hits ? 1 : 0;
}

int main(int argc, char **argv)
{
	setvbuf(stdout, NULL, _IOLBF, 0);
	for (int i = 0; i < LEN; i++)
		ref[i] = (uint8_t)(((i * 2654435761u) >> 13) ^ i);
	/* child: k1-vload-repro --child CPU SECONDS LMUL */
	if (argc == 5 && !strcmp(argv[1], "--child")) {
		base_cpu = atoi(argv[2]);
		lmul = argv[4][0] == 'k' ? 0 : atoi(argv[4]);
		return child(atoi(argv[3]));
	}

	int rounds = argc > 1 ? atoi(argv[1]) : 60;
	int secs = argc > 2 ? atoi(argv[2]) : 5;
	const char *lm = argc > 3 ? argv[3] : "8";
	int bad_runs = 0;

	printf("%d rounds of %d s, %s%s\n", rounds, secs,
	       lm[0] == 'k' ? "kernel copy_from_user" : "LMUL=", lm[0] == 'k' ? "" : lm);
	for (int r = 0; r < rounds; r++) {
		pid_t p[2];

		/*
		 * A fresh exec'd process per run: forked children (sharing the
		 * parent's layout) hit about 10x less often.
		 */
		for (int c = 0; c < 2; c++) {
			char cb[8], sb[16];

			snprintf(cb, sizeof(cb), "%d", c * 4);
			snprintf(sb, sizeof(sb), "%d", secs);
			p[c] = fork();
			if (p[c] == 0) {
				execl("/proc/self/exe", argv[0], "--child", cb, sb, lm,
				      (char *)NULL);
				_exit(2);
			}
		}
		for (int c = 0; c < 2; c++) {
			int st;

			waitpid(p[c], &st, 0);
			int bad = WIFEXITED(st) && WEXITSTATUS(st) == 1;

			bad_runs += bad;
			if (bad)
				printf("round %d, cpus %d-%d: CORRUPTED LOADS\n",
				       r + 1, c * 4, c * 4 + 3);
		}
	}
	printf("%d of %d process runs had corrupted vector loads\n",
	       bad_runs, 2 * rounds);
	return bad_runs ? 1 : 0;
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
