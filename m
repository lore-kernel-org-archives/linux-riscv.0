Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0507E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxO+iSnCT02GatnuR7BIqsHUgkuyFbnT4EWi27FrtT4=; b=gSpwfYbk016eHY
	S+THWXY0yMrX94mHoqjXcNXnc8agekBl7sFGF9gECEi+vZOOZN03bdS2SayMA5TT3bcVNaVOheo4F
	+nlb1hJfzXyL2TG+Bc3E+EZ+7US/nXNOrwlu7md2zvx/yEfl+9tFZOqOl03yDMllttGEOVH2DJWuM
	AQyVDXOfJUTQ3bieKNpLMfFZ1MMexBSjCmBIPsTIxqXGttwBgF5O/nki/3SJ8p4ra0My5F+n7tkOb
	LesOttOLu8+VvYbV2zLrGP8ooSqXhvPw20KBy3Az1mgTHV1DxSGxSBYcIStlOWK+Cqhv0IqobUJP2
	NH69hYXGviTgwPN6wCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOO5t-000000039pW-2gIm;
	Thu, 19 Dec 2024 21:30:05 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOO5r-000000039nr-1GUI
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 21:30:04 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id F41541D40584;
	Thu, 19 Dec 2024 16:29:58 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 19 Dec 2024 16:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1734643798; x=1734650998; bh=Ly5Y8jVk5m
	oLHMzQ7W8exXV5U16sE/p4pCtMgqqBuII=; b=Mp1U2nivsGGD80upLCLOGHvbCr
	oaNvhOH+NhMVGOszjBPvJhb6rmQhba0k4N8psWIMmOJgi2Gzr+DZm4H/V0yLNcT2
	qVKzRnf+wO2rjJijf55cmphYq4S5Ry8NXL9r5OUQaJYh3Dw88QmP+RrzC8itNZf7
	diiAHjmvtVns58TL/rjl0/Ai3mmrm+Jtb7i53WHt/UjRlHIjuFz0x0n/LzTn2Hrc
	mEFZqTh2Isx9h6uotGuqG6AVsnL9rdd7lSAzv2IDLoZeQ/m4iguMEjwqmui/p/y1
	6fvd188JCzi4T5MkuhVv9J3t7dQflCoJAxg7wIfTvgKZOwxb6T6UkahIkZ2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734643798; x=
	1734650998; bh=Ly5Y8jVk5moLHMzQ7W8exXV5U16sE/p4pCtMgqqBuII=; b=x
	EmPJhIPrE3uJpeIijsDG14VGPg2S5j5sejI3Me1x8kIQ5A9O6yotGXCxb13QC5bw
	7e/sq7OuuAxiPa+thcmElCqcO8UGrZ6kJpbKmGjt6S74FpkLlI+Iy3K5fqCVoybZ
	RDuQYtnZ4hqoWIHKQsQKTB6O9QOM62ARCXzfdrU9g57qzqOH1OvUVpJEHTmRk+wp
	VDeBzID0JlxGKrScMarxGTQSb3l/RWH+mha9fzwtN4DRFjDqFV6uo6KJgZBJVFyH
	UAXpEQme1vBoIN+Gdw4UZrfXck8fk1pzNraKXbnttjUDze4n9SoGFv14ZU5h57qL
	WFGtuWK4ggTwHXcqt099g==
X-ME-Sender: <xms:VJBkZ94YbhHRO-5R1VH-1cQLDbY5ioUSARjnoOm9zDrQPg16PgMWUg>
    <xme:VJBkZ64m1g5kGwUKVQjrnVL0HYBnPhLXckgRCsCsQVABeJnfnFKXDfGw9Hma0tZao
    AcWc-Qudq4KLoiawaI>
X-ME-Received: <xmr:VJBkZ0cktzvYhBt3JKWnno8HUxxa3WTrfR81W-j4brxt0uzO2kN5iBzPaKYXDqWN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddv
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeefgfdvgfetveevkeehleffteekvdfh
    vedvheduueehkedvuedvhfeiieejudekueenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgv
    pdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptg
    hhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghjohhnvghssehv
    vghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopeholhgvghesrhgvughhrghtrd
    gtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhm
    pdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprg
    houhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegvsghivgguvghr
    mhesgihmihhsshhiohhnrdgtohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehshhhurghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:VJBkZ2Ko6T9hth8lfkB2eDU3wjCXjTLIFfix2R0Fehb2RuFPHrCLMw>
    <xmx:VJBkZxKCYJYLo2EBDpHwK28iZLuaawgldCvUomZMG62di_KSh-2ITA>
    <xmx:VJBkZ_wpcsGm5HgrVWtkBnsnUM33f-icqTuxU86JtTRPuMyFJ0GTbA>
    <xmx:VJBkZ9LZQZ57APh6GizakD-7MUbSzuR1qZGIutmgXhOntoZ6J315CQ>
    <xmx:VpBkZ5_AE5GlgtiWDbX5kpCRrI71Azt1liL7xRl12BIgi53EhpZ1rxzO>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 16:29:49 -0500 (EST)
Message-ID: <50a62291-5ae1-47b0-8f64-a42271820789@coelacanthus.name>
Date: Fri, 20 Dec 2024 05:29:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Content-Language: en-GB-large
To: Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
 Andrea Bolognani <abologna@redhat.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ron Economos <re@w6rz.net>, Quan Zhou <zhouquan@iscas.ac.cn>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name>
 <20241203-riscv-new-regset-v2-2-d37da8c0cba6@coelacanthus.name>
 <20241203-55c76715e16422ddaf8d7edf@orel> <Z2RlR1cP9tne8rNi@ghost>
From: Celeste Liu <uwu@coelacanthus.name>
In-Reply-To: <Z2RlR1cP9tne8rNi@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_133003_653783_FF4D2528 
X-CRM114-Status: GOOD (  24.91  )
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


On 2024-12-20 02:26, Charlie Jenkins wrote:
> On Tue, Dec 03, 2024 at 01:55:07PM +0100, Andrew Jones wrote:
>> On Tue, Dec 03, 2024 at 05:30:05PM +0800, Celeste Liu wrote:
>>> From: Charlie Jenkins <charlie@rivosinc.com>
>>>
>>> This test checks that orig_a0 allows a syscall argument to be modified,
>>> and that changing a0 does not change the syscall argument.
>>>
>>> Cc: stable@vger.kernel.org
>>> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
>>> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>>> Co-developed-by: Celeste Liu <uwu@coelacanthus.name>
>>> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>> ---
>>>  tools/testing/selftests/riscv/abi/.gitignore |   1 +
>>>  tools/testing/selftests/riscv/abi/Makefile   |   5 +-
>>>  tools/testing/selftests/riscv/abi/ptrace.c   | 134 +++++++++++++++++++++++++++
>>>  3 files changed, 139 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/riscv/abi/.gitignore b/tools/testing/selftests/riscv/abi/.gitignore
>>> index b38358f91c4d2240ae64892871d9ca98bda1ae58..378c605919a3b3d58eec2701eb7af430cfe315d6 100644
>>> --- a/tools/testing/selftests/riscv/abi/.gitignore
>>> +++ b/tools/testing/selftests/riscv/abi/.gitignore
>>> @@ -1 +1,2 @@
>>>  pointer_masking
>>> +ptrace
>>> diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
>>> index ed82ff9c664e7eb3f760cbab81fb957ff72579c5..3f74d059dfdcbce4d45d8ff618781ccea1419061 100644
>>> --- a/tools/testing/selftests/riscv/abi/Makefile
>>> +++ b/tools/testing/selftests/riscv/abi/Makefile
>>> @@ -2,9 +2,12 @@
>>>  
>>>  CFLAGS += -I$(top_srcdir)/tools/include
>>>  
>>> -TEST_GEN_PROGS := pointer_masking
>>> +TEST_GEN_PROGS := pointer_masking ptrace
>>>  
>>>  include ../../lib.mk
>>>  
>>>  $(OUTPUT)/pointer_masking: pointer_masking.c
>>>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>>> +
>>> +$(OUTPUT)/ptrace: ptrace.c
>>> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>>> diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testing/selftests/riscv/abi/ptrace.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..d192764b428d1f1c442f3957c6fedeb01a48d556
>>> --- /dev/null
>>> +++ b/tools/testing/selftests/riscv/abi/ptrace.c
>>> @@ -0,0 +1,134 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +#include <stdio.h>
>>> +#include <stdlib.h>
>>> +#include <string.h>
>>> +#include <unistd.h>
>>> +#include <fcntl.h>
>>> +#include <signal.h>
>>> +#include <errno.h>
>>> +#include <sys/types.h>
>>> +#include <sys/ptrace.h>
>>> +#include <sys/stat.h>
>>> +#include <sys/user.h>
>>> +#include <sys/wait.h>
>>> +#include <sys/uio.h>
>>> +#include <linux/elf.h>
>>> +#include <linux/unistd.h>
>>> +#include <asm/ptrace.h>
>>> +
>>> +#include "../../kselftest_harness.h"
>>> +
>>> +#define ORIG_A0_MODIFY      0x01
>>> +#define A0_MODIFY           0x02
>>> +#define A0_OLD              0x03
>>> +#define A0_NEW              0x04
>>
>> Shouldn't A0_OLD and A0_NEW set more bits, since 3 and 4 aren't very
>> unique (we could have those values by accident)? And should we include
>> setting bits over 31 for 64-bit targets?
>>
>>> +
>>> +#define perr_and_exit(fmt, ...)						\
>>> +	({								\
>>> +		char buf[256];						\
>>> +		snprintf(buf, sizeof(buf), "%s:%d:" fmt ": %m\n",	\
>>> +			__func__, __LINE__, ##__VA_ARGS__);		\
>>> +		perror(buf);						\
>>> +		exit(-1);						\
>>> +	})
>>
>> Can we use e.g. ksft_exit_fail_perror() instead? I'd prefer we try to
>> consolidate testing/selftests/riscv/* tests on a common format for
>> errors and exit codes and we're already using other kselftest stuff.
>>
>>> +
>>> +static inline void resume_and_wait_tracee(pid_t pid, int flag)
>>> +{
>>> +	int status;
>>> +
>>> +	if (ptrace(flag, pid, 0, 0))
>>> +		perr_and_exit("failed to resume the tracee %d\n", pid);
>>> +
>>> +	if (waitpid(pid, &status, 0) != pid)
>>> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
>>> +}
>>> +
>>> +static void ptrace_test(int opt, int *result)
>>> +{
>>> +	int status;
>>> +	pid_t pid;
>>> +	struct user_regs_struct regs;
>>> +	struct iovec iov = {
>>> +		.iov_base = &regs,
>>> +		.iov_len = sizeof(regs),
>>> +	};
>>> +
>>> +	unsigned long orig_a0;
>>> +	struct iovec a0_iov = {
>>> +		.iov_base = &orig_a0,
>>> +		.iov_len = sizeof(orig_a0),
>>> +	};
>>> +
>>> +	pid = fork();
>>> +	if (pid == 0) {
>>> +		/* Mark oneself being traced */
>>> +		long val = ptrace(PTRACE_TRACEME, 0, 0, 0);
>>> +
>>> +		if (val)
>>> +			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
>>> +
>>> +		kill(getpid(), SIGSTOP);
>>> +
>>> +		/* Perform exit syscall that will be intercepted */
>>> +		exit(A0_OLD);
>>> +	}
>>> +
>>> +	if (pid < 0)
>>> +		exit(1);
>>
>> This unexpected error condition deserves a message, so I'd use
>> ksft_exit_fail_perror() here.
>>
>>> +
>>> +	if (waitpid(pid, &status, 0) != pid)
>>> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
>>> +
>>> +	/* Stop at the entry point of the syscall */
>>> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
>>> +
>>> +	/* Check tracee regs before the syscall */
>>> +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
>>> +		perr_and_exit("failed to get tracee registers\n");
>>> +	if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
>>> +		perr_and_exit("failed to get tracee registers\n");
>>> +	if (orig_a0 != A0_OLD)
>>> +		perr_and_exit("unexpected orig_a0: 0x%lx\n", orig_a0);
>>> +
>>> +	/* Modify a0/orig_a0 for the syscall */
>>> +	switch (opt) {
>>> +	case A0_MODIFY:
>>> +		regs.a0 = A0_NEW;
>>> +		break;
>>> +	case ORIG_A0_MODIFY:
>>> +		orig_a0 = A0_NEW;
>>> +		break;
>>> +	}
>>> +
>>> +	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
>>> +		perr_and_exit("failed to set tracee registers\n");
>>> +
>>> +	/* Resume the tracee */
>>> +	ptrace(PTRACE_CONT, pid, 0, 0);
>>> +	if (waitpid(pid, &status, 0) != pid)
>>> +		perr_and_exit("failed to wait for the tracee\n");
>>> +
>>> +	*result = WEXITSTATUS(status);
>>> +}
>>> +
>>> +TEST(ptrace_modify_a0)
>>> +{
>>> +	int result;
>>> +
>>> +	ptrace_test(A0_MODIFY, &result);
>>> +
>>> +	/* The modification of a0 cannot affect the first argument of the syscall */
>>> +	EXPECT_EQ(A0_OLD, result);
>>
>> What about checking that we actually set regs.a0 to A0_NEW? We'd need
>> A0_NEW to be more unique than 4, though.
>>
>>> +}
>>> +
>>> +TEST(ptrace_modify_orig_a0)
>>> +{
>>> +	int result;
>>> +
>>> +	ptrace_test(ORIG_A0_MODIFY, &result);
>>> +
>>> +	/* Only modify orig_a0 to change the first argument of the syscall */
>>
>> If we run ptrace_modify_a0 first then we've already set regs.a0 to A0_NEW
>> and can't check with this test that we don't set it to A0_NEW. We should
>> probably have two different test values, one for regs.a0 and one for
>> orig_a0 and ensure on both tests that we aren't writing both.
>>
> 
> Celeste, do you want to fix this up or are you waiting for me to?

Sorry for delay. I was busy with household affairs in the past few weeks.
v3 will be sent tomorrow or the day after tomorrow.

I am deeply sorry for this.

> 
> - Charlie
> 
>>> +	EXPECT_EQ(A0_NEW, result);
>>> +}
>>> +
>>> +TEST_HARNESS_MAIN
>>>
>>> -- 
>>> 2.47.0
>>>
>>
>> Thanks,
>> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
