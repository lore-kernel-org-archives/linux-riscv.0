Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B8DC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 05:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wkTlDjYOxsT6Uzt4olTWu2rjlLGYNoM2Qq+wZjeirc=; b=hCeUoS6HDKDVoa
	OHDVz/XPKFf6GUyX3S18cqkCRsqdvtN5qlzbIVBJtLPhO0NIV2E/Muq7mo7SAk7ny/qHZC9/HKJ8u
	FgjzyuCpJ5Nvtgl42L9qOeyV8UclCJ8z9h922+qR0RHzwrrZ0ExV8EWo5iSOjW5eXzkVv/I9AYVzO
	M0UTYb0qVWkiH6R32UcDSdWrkkiCIC+CdKk/xk6MMSoqIm78+jyiaraeimVMz5m+Wt6FeWeWa1FDM
	0j4+KISFyZ38Q4Y5b8+2deQ2NON3MySXhI5gQrUpbmSXWRxZ8dQn4cG7kyqWInX+tz1NXWycHXfQ7
	uqF3VL+lbGE4be/Wncnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6m5p-004Tob-1i;
	Wed, 07 Jun 2023 05:52:25 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6m5k-004Tmy-22
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 05:52:24 +0000
X-QQ-mid: bizesmtp70t1686117122tlw2aohn
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 13:52:00 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 7L1V3dHhUFNwsCYRlWfHiijmi2tXCINUn3YioqGbuOxs/CPWofUR/InpqT49J
	9b0cchLC0VK3ORkZ/8q/onk4NKY4mNzZCJaxDJu+EyFMxF5re0ekuIoPMp5wFYl6tYBVEj8
	X+myOvogX1rqOB7aF76W6Mzr6O6jCfib+BpInN/83g+1nYuplhKIlCAzTuIphJG7c2RBfZq
	12wdO26wIO08Y5LDCswdjH0U/5OKBpmqob3d6XTTI4dW1JtPmxwC96SQ20EdkaxHaVXruKx
	nbF3H8KOyLwDs0GnIMlOFRpgQCNHFYDVt3wftQILgXQzRAHpOwlzSayojXwFnaYeVo9xapm
	78TRVoBIoJKAKQHPl7ejgG6RYWjp66ZUDiOvSCPrese08cpbFHlp1Yt+mOqVAV1qfC7P8Ye
	F+VzuWsvtfA=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18357036349121096708
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH 1/4] selftests/nolibc: add a test-report target
Date: Wed,  7 Jun 2023 13:52:00 +0800
Message-Id: <20230607055200.667447-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230605065459.153001-1-falcon@tinylab.org>
References: <20230605065459.153001-1-falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_225220_986052_BE26BA00 
X-CRM114-Status: GOOD (  22.80  )
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

Hi, Willy

> > On Mon, Jun 05, 2023 at 11:48:52AM +0800, Zhangjin Wu wrote:
> > > A standalone test-report target is added to let the run, run-user and
> > > rerun targets share them.
> > > 
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > ---
> > >  tools/testing/selftests/nolibc/Makefile | 26 ++++++++++++-------------
> > >  1 file changed, 13 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> > > index be4159837494..8149ace2938a 100644
> > > --- a/tools/testing/selftests/nolibc/Makefile
> > > +++ b/tools/testing/selftests/nolibc/Makefile
> > > @@ -127,14 +127,18 @@ nolibc-test: nolibc-test.c sysroot/$(ARCH)/include
> > >  libc-test: nolibc-test.c
> > >  	$(QUIET_CC)$(CC) -o $@ $<
> > >  
> > > -# qemu user-land test
> > > -run-user: nolibc-test
> > > -	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > > +test-report:
> > >  	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
> > >  	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
> > >  	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
> > >  	         $(CURDIR)/run.out
> > >  
> > > +# qemu user-land test
> > > +_run-user: nolibc-test
> > > +	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > > +
> > > +run-user: _run-user test-report
> > > +
> > 
> > This will not reliably work, there's no ordering here, nothing guarantees
> > that test-report will run *after* _run-user (e.g. make -j). Another
> > approach is needed if you want to factor this, but in general creating
> > sequences in makefiles is difficult and often more painful than having
> > 3 times the same 3 lines.
> >
> 
> Ok, thanks, what about this?
> 
>     # LOG_REPORT: report the test results
>     LOG_REPORT   := awk '/\[OK\][\r]*$$/{p++} /\[FAIL\][\r]*$$/{f++} /\[SKIPPED\][\r]*$$/{s++} \
> 	                 END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
> 	                 printf(" See all results in %s\n", ARGV[1]); }'
> 
>     run-user: nolibc-test
> 	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> 
>     run: kernel
> 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
> 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> 
>     rerun:
> 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
> 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> 
> Or we directly add a standalone test report script? something like
> tools/testing/selftests/nolibc/report.sh
> 
>     #!/bin/sh
>     #
>     # report.sh -- report the test results of nolibc-test
>     #
>     
>     LOG_FILE=$1
>     [ ! -f "$LOG_FILE" ] && echo "Usage: $0 /path/to/run.out"
>     
>     awk '
>         /\[OK\][\r]*$$/{ p++ }
>         /\[FAIL\][\r]*$$/{ f++ }
>         /\[SKIPPED\][\r]*$$/{ s++ }
>     
>         END {
>             printf("%d test(s) passed, %d skipped, %d failed.", p, s, f);
>             printf(" See all results in %s\n", ARGV[1]);
>         }' $LOG_FILE
> 
> And use it like this:
> 
>     LOG_REPORT           = $(CURDIR)/report.sh
>

I plan to renew this patchset, which one of the above methods do you
prefer?

For the always print statement:

    printf(" See all results in %s\n", ARGV[1]); }'

I will paste the reason why I need it, as mentioned in [1], if you still
need a clean test report, I will give up this change ;-)

Thanks,
Zhangjin
---
[1]: https://lore.kernel.org/linux-riscv/20230605070508.153407-1-falcon@tinylab.org/ 

> Best regards,
> Zhangjin
>
> > Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
