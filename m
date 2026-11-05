Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CB606EE9F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=abmWp9O7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=GaFZRQOZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9nQGok5Bk/PCCD2q5EGZbFM2Xovrhz5rK3vNQ4jSAFk=; b=abmWp9O7wgn84/ZCWY6GgJjfmZ
	KudRpqANLIoAUoYYScLlPff+XDGn/+9yZ95j1PXdeU6rpeDrdBDGc7vmJrKVFpR2zKjQogdFUdXS2
	ItXAXaAKYyxChYka7IqpD/XcH/2RzY0MNVBt0bmvSHAmoRRxF13DGV7ay1cay8PRvUlFZwvtbC/I6
	TKdWynZHwQTWJrPLEXvjm1Mc/hEBFxKvRhn3e+hIpYFF8dl6GJGhkeOpRe71KHqy/C4nyTB+y/GnW
	k7av3sXgu1sKELhynE/J9pUVYJ1EoeuKIx8U7iB7RhUyxSA4cwMO7ZWpgCHVw1QfCgnK1Lspo9iBN
	ba8op1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1kP-0000000A2nF-2A8V;
	Thu, 05 Nov 2026 17:59:41 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1jv-0000000A2gw-2fq2
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:59:22 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-83bbcfba0ffso1494157a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793901546; x=1794506346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7xeTFp5Z0R3BfvoCv14UiADEzEqwyyGG4Zubwum7Zo=;
        b=GaFZRQOZEs1SeTbK3I/G9GzFnW5knT8ZEpt3hicMPH/RpW+x43VaaFXN7hFRE5UDI4
         5+Coo74/hLDLu6yuikVDl3nQg/CmPMFwqkAUUtbjBrMUTPweEdXPYA9C9FARck75BhOY
         X5j5RzEMAhOT19HUc1Vq7WvJqiZD6feDPuo0DScBfMWIB6Hn0ZSnjgv+HYicANeBCtdu
         SNWVlqG1JbXDf8pxgo2rNtQIyU6pZi1gA3tiX38wCo7GepgWlvTbJSoTEYh1uzFKR4+c
         Nm8oWm0lWT7ncCe+NbdAbN31XxHqthFvcE+ja6W5O1smj1eyEPMz4EFNcQA3mL5ZFG0J
         1vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901546; x=1794506346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7xeTFp5Z0R3BfvoCv14UiADEzEqwyyGG4Zubwum7Zo=;
        b=X/ReW9JD2fmV74VCgF943u+ddWTONoX6f3t5LHB8/gH2tw+74IexZrtH3FBa53ITBX
         ZkgB0GldIQNmVrb75LpfzdmLcntur5N1DMLktLNz+EsaK6qWJv9ptFSEP8tVf3xGhyYZ
         1ApqHFYE8v47XKeNAF2GgK0FH6lSwPT6oBi5MFIXFU105AOFthTJ/DoyUc6GF4gzbdnd
         /+Ic9sUEb8EUhuEZ2OzRVnlcC0FIMT47wkgq4ugpdrsjMqpZ54w3Fx2yBLHpnztzQqKE
         eXZQQnQl/lP8CNXKNlX6xAfxSXq56GKg99vCqxry5XS/pN2Bi+tL634MTVAUFWHRY4fC
         gWLA==
X-Forwarded-Encrypted: i=1; AKwUvBxtguD33gWgqKxa4niU66//bkU2rh+pWveP1syHTqq2utaw5SlAABpyY14pnhz9AegdDtc5pF2R1Oqsaw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8gHCB9DS9r9TAaUd3NtvZ+bkQQ6BG9wHl8hW3YPs9mYvkPLXr3
	4s1zg09enemS7lzUhm9ExlVXripUSZdgS55Olbnylqm0Mmm0Gf1tIYAhF7lTXoPnSfYWzTObeUv
	3J+WUtrWGqg==
X-Gm-Gg: AYBFou3zKVIibj56JR3Fm8wCHrec9xaKu7o/XPeB0WooVkDFDxc/wS5S2HN6BJvPGf0
	KsAd+2k1oXK/OjdX6AUmgngq5c1grh3r/TNMq4sSk0H27+vI+vWP0Z98vHxizRI53GZvAZfijE9
	otf+veduEDkczVSBuVilSjRy/51o2nBoshi70hfmVIzNDlf+6CY3zapL6Q5z53p866W+48k6ZB+
	Wmu+UQ8wSvkdYG4C2a8WBKOOY0IfYwihQ1iR7kEqhZbe907uVqiyvplP6pynwFcHeShKcuk2MZf
	FQ+EQNGolxhI49hlflQ1nEfHB5SbQ2eHLvosgBO8lcGUyLw40LRv7EdIXebYw5+gKzdZr7EKki0
	KbYCoyv/z17KDotI5WVqCxm1CJyl0Ho3GnsV0TVMrZ1rbq+N5cgFn5ROVgyFqpGQTZnWYufuROI
	tsXEMPsj1J9sim3chApnCVYzPVVHnbCwwqzpNV/IdZMGGO4eobC6oIuwNYu2n3oBHgRe4SHfdAo
	HtzlI3qQjW3fbjjRfjCHXmAxshiGaNQjL37XzqEGiO1s7YEjDBrD2w0libUob+RCzgj1eqm0H65
	wi254M/AdIkI1JUqTbb9hHuaF1d7IK6IbhIbqPg=
X-Received: by 2002:a05:6830:2b0e:b0:85c:4897:f2ff with SMTP id 46e09a7af769-85f1d0de43bmr99174a34.25.1793901545806;
        Thu, 05 Nov 2026 09:59:05 -0800 (PST)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e603b9sm5021990a34.20.2026.11.05.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:59:05 -0800 (PST)
Date: Thu, 5 Nov 2026 11:59:04 -0600
From: Andy Chiu <tchiu@tenstorrent.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests: riscv: test FP state restore when
 rt_sigreturn() faults
Message-ID: <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
References: <20261031161826.858908-1-nickolai@csail.mit.edu>
 <20261031161826.858908-3-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261031161826.858908-3-nickolai@csail.mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_095907_715795_F4824030 
X-CRM114-Status: GOOD (  33.33  )
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

On Sat, Oct 31, 2026 at 12:18:26PM -0400, Nickolai Zeldovich wrote:
> Add a test for the previous patch: the signal frame sits on a
> userfaultfd page that the handler drops after dirtying the FP
> registers, so rt_sigreturn() sleeps in the middle of copying the FP
> registers from the frame. The interrupted code must get its own
> registers back.
> 
> The test is skipped without the D extension or when userfaultfd is not
> available to the caller.
>

The test is failing on qemu, with or without the patch applied.

> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>  .../selftests/riscv/sigreturn/.gitignore      |   1 +
>  .../selftests/riscv/sigreturn/Makefile        |   5 +-
>  .../selftests/riscv/sigreturn/fp_restore.c    | 146 ++++++++++++++++++
>  3 files changed, 151 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c
> 
> diff --git a/tools/testing/selftests/riscv/sigreturn/.gitignore b/tools/testing/selftests/riscv/sigreturn/.gitignore
> index 35002b8ae780..8ed282ecb618 100644
> --- a/tools/testing/selftests/riscv/sigreturn/.gitignore
> +++ b/tools/testing/selftests/riscv/sigreturn/.gitignore
> @@ -1 +1,2 @@
> +fp_restore
>  sigreturn
> diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
> index 8c77508641f3..ac7ae7a7c2ae 100644
> --- a/tools/testing/selftests/riscv/sigreturn/Makefile
> +++ b/tools/testing/selftests/riscv/sigreturn/Makefile
> @@ -4,9 +4,12 @@
>  
>  CFLAGS += -I$(top_srcdir)/tools/include
>  
> -TEST_GEN_PROGS := sigreturn
> +TEST_GEN_PROGS := sigreturn fp_restore
>  
>  include ../../lib.mk
>  
>  $(OUTPUT)/sigreturn: sigreturn.c
>  	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/fp_restore: fp_restore.c
> +	$(CC) -static -pthread -o $@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/sigreturn/fp_restore.c b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
> new file mode 100644
> index 000000000000..1a56684c5f28
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Check that rt_sigreturn() restores the FP registers from the signal
> + * frame when the copy of the frame sleeps on a page fault while the
> + * handler's FP state is dirty.  The frame is placed on a userfaultfd
> + * page that the handler drops, so the copy faults after f0-f15.
> + */
> +#include <fcntl.h>
> +#include <pthread.h>
> +#include <signal.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <sys/auxv.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <sys/syscall.h>
> +#include <ucontext.h>
> +#include <unistd.h>
> +#include <asm/hwcap.h>
> +#include <linux/userfaultfd.h>
> +#include "kselftest_harness.h"
> +
> +#define PAGE		4096UL
> +#define STACK_SIZE	65536UL
> +/* the page boundary falls this far into the FP image, after f0-f15 */
> +#define SPLIT		128
> +
> +#define F0_15	"0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15"
> +/* caller-saved only, so the handler's epilogue does not reload them */
> +#define HANDLER_REGS	"0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15"
> +
> +static uint64_t pattern[16], handler_pattern[16];
> +static void *saved;
> +static int placed;
> +
> +static void handler(int sig, siginfo_t *si, void *context)
> +{
> +	ucontext_t *uc = context;
> +	unsigned long split = (unsigned long)&uc->uc_mcontext.__fpregs + SPLIT;
> +
> +	placed = !(split & (PAGE - 1));
> +	if (placed) {
> +		/* rt_sigreturn() will fault on this page and wait for serve() */
> +		memcpy(saved, (void *)split, PAGE);
> +		if (madvise((void *)split, PAGE, MADV_DONTNEED))
> +			_exit(1);
> +	}
> +	asm volatile(".irp i, " HANDLER_REGS "\n"
> +		     "fld f\\i, \\i * 8(%[h])\n"
> +		     ".endr\n"
> +		     : : [h] "r" (handler_pattern)
> +		     : "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
> +		       "ft6", "ft7", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5");
> +}
> +
> +static void *serve(void *arg)
> +{
> +	struct uffdio_copy copy = { .src = (unsigned long)saved, .len = PAGE };
> +	struct uffd_msg msg;
> +	int fd = (long)arg;
> +
> +	while (read(fd, &msg, sizeof(msg)) == sizeof(msg)) {
> +		copy.dst = msg.arg.pagefault.address & ~(PAGE - 1);
> +		copy.copy = 0;
> +		ioctl(fd, UFFDIO_COPY, &copy);
> +	}
> +	return NULL;
> +}
> +
> +TEST(fp_restore_frame_fault)
> +{
> +	struct sigaction sa = {
> +		.sa_sigaction = handler,
> +		.sa_flags = SA_SIGINFO | SA_ONSTACK,
> +	};
> +	struct uffdio_api api = { .api = UFFD_API };
> +	struct uffdio_register reg = { .mode = UFFDIO_REGISTER_MODE_MISSING };
> +	stack_t ss = { .ss_size = STACK_SIZE };
> +	long pid = getpid(), tid = syscall(__NR_gettid);
> +	uint64_t out[16];
> +	unsigned long fcsr, shift;
> +	pthread_t thread;
> +	int fd, i;
> +
> +	if (!(getauxval(AT_HWCAP) & COMPAT_HWCAP_ISA_D))
> +		SKIP(return, "no D extension");
> +
> +	fd = syscall(__NR_userfaultfd, O_CLOEXEC);
> +	if (fd < 0)
> +		SKIP(return, "userfaultfd not available");
> +	ASSERT_EQ(0, ioctl(fd, UFFDIO_API, &api));
> +
> +	for (i = 0; i < 16; i++) {
> +		pattern[i] = 0x4010000000000000ULL + i;
> +		handler_pattern[i] = 0xbff0000000000000ULL + i;
> +	}
> +
> +	saved = mmap(NULL, PAGE, PROT_READ | PROT_WRITE,
> +		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(MAP_FAILED, saved);
> +	ss.ss_sp = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
> +			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(MAP_FAILED, ss.ss_sp);
> +	/* populate it, so only the page the handler drops faults */
> +	memset(ss.ss_sp, 0, STACK_SIZE);
> +	reg.range.start = (unsigned long)ss.ss_sp;
> +	reg.range.len = STACK_SIZE;
> +	ASSERT_EQ(0, ioctl(fd, UFFDIO_REGISTER, &reg));
> +	ASSERT_EQ(0, pthread_create(&thread, NULL, serve, (void *)(long)fd));
> +	ASSERT_EQ(0, sigaction(SIGUSR1, &sa, NULL));
> +
> +	/* lower the frame until the FP image crosses a page at SPLIT */
> +	for (shift = 0; shift < PAGE && !placed; shift += 16) {
> +		register long a0 asm("a0") = pid;
> +		register long a1 asm("a1") = tid;
> +		register long a2 asm("a2") = SIGUSR1;
> +		register long a7 asm("a7") = __NR_tgkill;
> +
> +		ss.ss_size = STACK_SIZE - shift;
> +		ASSERT_EQ(0, sigaltstack(&ss, NULL));
> +		fcsr = 0x1f;
> +		asm volatile(".irp i, " F0_15 "\n"
> +			     "fld f\\i, \\i * 8(%[in])\n"
> +			     ".endr\n"
> +			     "csrw fcsr, %[fcsr]\n"
> +			     "ecall\n"
> +			     "csrr %[fcsr], fcsr\n"
> +			     ".irp i, " F0_15 "\n"
> +			     "fsd f\\i, \\i * 8(%[out])\n"
> +			     ".endr\n"
> +			     : "+r" (a0), [fcsr] "+r" (fcsr)
> +			     : "r" (a1), "r" (a2), "r" (a7),
> +			       [in] "r" (pattern), [out] "r" (out)
> +			     : "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
> +			       "ft6", "ft7", "fs0", "fs1", "fa0", "fa1", "fa2",
> +			       "fa3", "fa4", "fa5");
> +	}
> +	ASSERT_TRUE(placed);
> +
> +	for (i = 0; i < 16; i++) {
> +		EXPECT_EQ(pattern[i], out[i]) TH_LOG("f%d", i);
> +	}
> +	EXPECT_EQ(0x1fUL, fcsr);
> +}
> +
> +TEST_HARNESS_MAIN
> -- 
> 2.53.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
