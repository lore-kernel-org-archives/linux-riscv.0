Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB6BF8FA62
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LShv+pVFDlMJLr0bt6QsiKUO1XieTW9TWPaKUXCF2g=; b=zlac0wkVRxhVc9
	huiTufIG02DuMzb2eZ6O1+p3O0xdBEJ5dpXLDL5L0K19fzc8QXQw8fl78C5W9xTow9+lFMAkVrapK
	Y2ZWusuQjdoTOYOX9+f/BM6VNT9SgVZ1UIpwaCPAI5ccUEcNxmU/zUDbGEF5IY2AwbNWgjKJYvqD/
	avkX7v2DWO8Qau8WRcR45Rv9G8ICmrXUI5M5jCUp6BLb9sm9D8u/2AYOP9AKh1YchimWFCxkfni1t
	M3IdXT3FF1W/0Uj54MC8G+RNTXz5ANfpSQfXDZ0iRwluD92jQ6bW3+S5Fvvow7AOUN/9QR6990uVM
	B8WX1NedyJ8b9km/mZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9mW-00000008Z17-1HwL;
	Tue, 21 Apr 2026 12:00:44 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9mT-00000008Z0I-3dzf
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 12:00:43 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38e12c67a6fso40262451fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776772838; x=1777377638; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HxesmLToutIBecL3NH9vQO9ZjV/Ox5UtNblW90mx2c=;
        b=Pr2QRNYoaN+7wp1chHChXMEPgtfN+PfA1u+qpQlcmDG7G9elVwnwbLy5IT187hJxdG
         aqQGZXSsDlQDYLAdxjxktWRjKa2swqY4w3Rd75k3/L6bRALv51zQjPW98HWbZYuQlw5c
         T/AKKZL2eD4Aajh8XaS/xqH2TGTMqedRgQeUBMyHS5sT7qvaG+9EDAzYrqQvd5v1DW5/
         j8ygP4uLxh+la4QcHblq0gYbv/eyWpDmz7eDfEVRIsoPqKo/2K1RNyWQruyBcGcJuFVB
         d89RRKeygJpgML+gpn+JY3QVc3/6zhrac1Z8MkDzbkZoCei+I7lFMARoWTN3mCEiHoFr
         OeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776772838; x=1777377638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HxesmLToutIBecL3NH9vQO9ZjV/Ox5UtNblW90mx2c=;
        b=PLcVr+Q9OtCuJYM6ClYv3H3hSHFIo5iIZv55SKcFxnqJKCF64+lko+L4EfFax5qvYK
         ilGnGkfFK9VgugYZTWmSfvnCaF/LCGZvbLaCraSf/gGQWQnDv4d3DxCABBthi/tuuB26
         EuzV1jm0QiJkB1dijyqe8JgBiIG7ppGJ2649LMpDNXzWiEBTO5DnezOQFBEfpVs3tjMN
         WFcJYugy54hwPaGYEI1xxcuc5HUDlHPOMSW3rYNllQVYbNEL6wEEk2aguUGHZbxuzvut
         emuFiICRy/ugQsCw154XX84g0edM/XdmJ8zB/kqX8nwiuVhaOjFKVM0xtPHi5FXhpnqQ
         G2uQ==
X-Gm-Message-State: AOJu0Yw2HvPekoWUnkiDOHFo5ZNCcbyLnBdgnSXdK+9GNdCTWczEg+fv
	vMVQNqs11zSryPvgjCnJ070PYdfYJ70SUKEKkNqCJfkILjr2mQVlS2j5
X-Gm-Gg: AeBDietbZAeiQFrsGGQAEyygernvovLjUL1Vzt4DSFBLICjdwTr8imp3bn0WQ7OcflF
	c3J1Q0R8vH0NAF8KAeFqWvByTowDpTwusiK17rz7/OeIPi76SXxptXb4k5siGwoH9mJ2aezBBmv
	JZPzUbpfzfojqUDSxdRX2OgiJAJBYFys/0czWaWk9USRC2m2AXHjxZ4vWkHZtFwKl+Asd8x6zO0
	XBWFhO3SsdJL16kSmIQzNGRUrXdF40ZLowwVuqE2keZSQhN4avEG41JP3CV4NogqNgusFKOE6nP
	6rlZmua8vd/XGSt42RqXV5g7SfLJtrlvEgtx2QpOdEIsrbH9Q14QVicQrUwTU/6IzKFBMSV2aFk
	3kIlhzthMTsLZ9CDieM7jk/eU5aSaKpM0U//ukLpR4fO+jbKPw3wRcdhTPzlUUr+SXkUu6wrCkC
	VEbQlBmKnjB/55KSzy2Hw7XfbOVvkg/Q7vOMcOgbxUivJYpGhtOQ==
X-Received: by 2002:a2e:be88:0:b0:38e:98b0:3a7e with SMTP id 38308e7fff4ca-38ec7ac89c3mr53414301fa.22.1776772838117;
        Tue, 21 Apr 2026 05:00:38 -0700 (PDT)
Received: from imamay-pc ([46.73.175.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb75b033sm29418791fa.39.2026.04.21.05.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:00:37 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:00:35 +0300
From: Ilya Mamay <mmamayka01@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 2/2] riscv: Add breakpoint and watchpoint test for
 riscv
Message-ID: <20260421120035.xsbli7g35nbh7luu@imamay-pc>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-3-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223044918.1359983-3-himanshu.chauhan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_050041_955137_F9485BE5 
X-CRM114-Status: GOOD (  26.92  )
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

Hi Himanshu,

I have been working on a system that guarantees the successful installation of
hardware breakpoints in a tracee process (or ensures perf_event_open fails in
the tracer otherwise). While using your patches for testing, I noticed two
critical issues in the current implementation:

1) The test_func is a static empty function, which means the compiler may inline
it or optimize it away entirely. If this happens, the hardware breakpoint will
never fire.

2) Potential Deadlock: The test uses sem_wait to wait for the breakpoint to
trigger. If the breakpoint fails to fire, the test will hang indefinitely.

Regards,
Ilya

On Mon, Feb 23, 2026 at 10:19:18AM +0530, Himanshu Chauhan wrote:
> Add self test for riscv architecture. It uses ptrace to ptrace framework
> to set/unset break/watchpoint and uses signals to check triggers.
> 
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---
>  tools/testing/selftests/breakpoints/Makefile  |   5 +
>  .../breakpoints/breakpoint_test_riscv.c       | 174 ++++++++++++++++++
>  2 files changed, 179 insertions(+)
>  create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
> 
> diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
> index 9ec2c78de8ca..97ab746908d8 100644
> --- a/tools/testing/selftests/breakpoints/Makefile
> +++ b/tools/testing/selftests/breakpoints/Makefile
> @@ -12,5 +12,10 @@ ifneq (,$(filter $(ARCH),aarch64 arm64))
>  TEST_GEN_PROGS += breakpoint_test_arm64
>  endif
>  
> +ifneq (,$(filter $(ARCH),riscv))
> +CFLAGS += -static
> +TEST_GEN_PROGS += breakpoint_test_riscv
> +endif
> +
>  include ../lib.mk
>  
> diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
> new file mode 100644
> index 000000000000..e07f6fb1cfbd
> --- /dev/null
> +++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Qualcomm Technologies, Inc.
> + *
> + * Author: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> + */
> +
> +#define _GNU_SOURCE
> +#include <linux/perf_event.h>    /* Definition of PERF_* constants */
> +#include <linux/hw_breakpoint.h> /* Definition of HW_* constants */
> +#include <sys/syscall.h>         /* Definition of SYS_* constants */
> +#include <unistd.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/ioctl.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <signal.h>
> +#include <sys/mman.h>
> +#include <string.h>
> +#include <semaphore.h>
> +
> +static int gfd;
> +sem_t ib_mtx, wp_mtx;
> +static int bp_triggered, wp_triggered;
> +
> +int setup_bp(bool is_x, void *addr, int sig)
> +{
> +	struct perf_event_attr pe;
> +	int fd;
> +
> +	memset(&pe, 0, sizeof(struct perf_event_attr));
> +	pe.type = PERF_TYPE_BREAKPOINT;
> +	pe.size = sizeof(struct perf_event_attr);
> +
> +	pe.config = 0;
> +	pe.bp_type = is_x ? HW_BREAKPOINT_X : HW_BREAKPOINT_W;
> +	pe.bp_addr = (unsigned long)addr;
> +	pe.bp_len = sizeof(long);
> +
> +	pe.sample_period = 1;
> +	pe.sample_type = PERF_SAMPLE_IP;
> +	pe.wakeup_events = 1;
> +
> +	pe.disabled = 1;
> +	pe.exclude_kernel = 1;
> +	pe.exclude_hv = 1;
> +
> +	fd = syscall(SYS_perf_event_open, &pe, 0, -1, -1, 0);
> +	if (fd < 0) {
> +		printf("Failed to open event: %llx\n", pe.config);
> +		return -1;
> +	}
> +
> +	fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC);
> +	fcntl(fd, F_SETSIG, sig);
> +	fcntl(fd, F_SETOWN, getpid());
> +
> +	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
> +
> +	return fd;
> +}
> +
> +static void sig_handler_bp(int signum, siginfo_t *oh, void *uc)
> +{
> +	int ret;
> +
> +	bp_triggered++;
> +
> +	printf("Breakpoint triggered!\n");
> +	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
> +	ret = sem_post(&ib_mtx);
> +	if (ret) {
> +		printf("Failed to report BP success\n");
> +		return;
> +	}
> +}
> +
> +static void sig_handler_wp(int signum, siginfo_t *oh, void *uc)
> +{
> +	int ret;
> +
> +	printf("Watchpoint triggered!\n");
> +	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
> +	wp_triggered++;
> +
> +	ret = sem_post(&wp_mtx);
> +
> +	if (ret) {
> +		printf("Failed to report WP success\n");
> +		return;
> +	}
> +}
> +
> +static void test_func(void)
> +{
> +}
> +
> +static int trigger_bp(void)
> +{
> +	struct sigaction sa;
> +
> +	memset(&sa, 0, sizeof(struct sigaction));
> +	sa.sa_sigaction = (void *)sig_handler_bp;
> +	sa.sa_flags = SA_SIGINFO;
> +
> +	if (sigaction(SIGIO, &sa, NULL) < 0) {
> +		printf("Failed to setup signal handler\n");
> +		return -1;
> +	}
> +
> +	gfd = setup_bp(1, test_func, SIGIO);
> +
> +	if (gfd < 0) {
> +		printf("Failed to setup breakpoint.\n");
> +		return -1;
> +	}
> +
> +	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
> +
> +	test_func();
> +
> +	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
> +
> +	close(gfd);
> +}
> +
> +static int trigger_wp(void)
> +{
> +	struct sigaction sa;
> +	unsigned long test_data;
> +
> +	memset(&sa, 0, sizeof(struct sigaction));
> +	sa.sa_sigaction = (void *)sig_handler_wp;
> +	sa.sa_flags = SA_SIGINFO;
> +
> +	if (sigaction(SIGUSR1, &sa, NULL) < 0) {
> +		printf("Failed to setup signal handler\n");
> +		return -1;
> +	}
> +
> +	gfd = setup_bp(0, &test_data, SIGUSR1);
> +
> +	if (gfd < 0) {
> +		printf("Failed to setup watchpoint\n");
> +		return -1;
> +	}
> +
> +	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
> +	test_data = 0xdeadbeef;
> +	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	struct sigaction sa;
> +
> +	sem_init(&ib_mtx, 0, 0);
> +	trigger_bp();
> +	sem_wait(&ib_mtx);
> +
> +	if (bp_triggered)
> +		printf("Breakpoint test passed!\n");
> +
> +	sem_init(&wp_mtx, 0, 0);
> +	trigger_wp();
> +	sem_wait(&wp_mtx);
> +
> +	if (wp_triggered)
> +		printf("Watchpoint test passed!\n");
> +
> +	return 0;
> +}
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
