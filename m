Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2842DC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6a0H6p9vW5GVWGNimkDf+cifNftOdpY4AOXvmF5HgI=; b=pnbmmrR0PekQFr
	PTyRRDWCiDPAPyD3rEIzPLbTZ6LCeV/+GQW+fGPr1cB7bZUKmxZyespTCHBzoP6oBXiZ0083VgvwU
	+lBvWxgJ9NOf62bGdnvoLG9UokhRj+L/TZsiyGvmvAwtEd3TTMoA+A7SAwfeftlqz6MdRO+fjsXN9
	dSuq/uMn4FY7qDHpmYn0fBmK4XFEp6i7HWBFCe6+5ZCx9LcBBMbrMwp+BIa0tHxEE1qeWoYVx0Wz/
	SlhOVV1KeTirrA9YhCt/6sUgBBl4BBlLPxqYQpMwLcajLYK0y9kBy52jfphmziGzDEDubKNYVE37L
	LaChq8EpXEE3AwPsdWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6two-006E69-2j;
	Wed, 07 Jun 2023 14:15:38 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6twj-006E3S-2J
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 14:15:36 +0000
X-QQ-mid: bizesmtp70t1686147307tuwgirwz
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 22:15:06 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3hda9yjQxBgTlXDIeBYTBUIZhPiyCqr68M1QLHysxyV/Xa++1dWh
	rpU9PDVQlvesrGXg026N1n2+/rgrAcLuq595b0CjO6OtAr+2sxNPZqiE55B2FEOMX6/4Abc
	4vtLVfieMXgVqyCsKSIWVbefp0PGu0NR+F3rAPHofh8HdqKa/RdqfsJB7tWet5EJYfNqRa3
	Ff0pU+GCV3Vb3RlVPuRQpZQGI+etbFV9MrY9uEVo+p36OYJSY1fIfeDOEDj9t2ohDU5ni7u
	Y3iqQuhQde84KL3NTEoFLys2uVvrYWzmJUjg88P2U5j5WLUaHC8g2FivR5cfFTbMsAffjqS
	gpdJZfQkXSS5bKN6xJ0mFziyLhuNdgKun18rpVx4xTq69dQxjrqjzVlXOEjTqD+w3RTGThY
	YQs49fGsni8=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9306648573384316120
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH 1/4] selftests/nolibc: add a test-report target
Date: Wed,  7 Jun 2023 22:15:02 +0800
Message-Id: <20230607141502.864645-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZIB792FtG6ibOudp@1wt.eu>
References: <ZIB792FtG6ibOudp@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_071534_078838_52B14385 
X-CRM114-Status: GOOD (  28.80  )
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

On Wed, Jun 07, 2023 at 01:52:00PM +0800, Zhangjin Wu wrote:
> > Hi, Willy
> > 
> (...)
> > > 
> > > Ok, thanks, what about this?
> > > 
> > >     # LOG_REPORT: report the test results
> > >     LOG_REPORT   := awk '/\[OK\][\r]*$$/{p++} /\[FAIL\][\r]*$$/{f++} /\[SKIPPED\][\r]*$$/{s++} \
> > > 	                 END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
> > > 	                 printf(" See all results in %s\n", ARGV[1]); }'
> > > 
> > >     run-user: nolibc-test
> > > 	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > > 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> > > 
> > >     run: kernel
> > > 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
> > > 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> > > 
> > >     rerun:
> > > 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
> > > 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> > > 
> > > Or we directly add a standalone test report script? something like
> > > tools/testing/selftests/nolibc/report.sh
> > > 
> > >     #!/bin/sh
> > >     #
> > >     # report.sh -- report the test results of nolibc-test
> > >     #
> > >     
> > >     LOG_FILE=$1
> > >     [ ! -f "$LOG_FILE" ] && echo "Usage: $0 /path/to/run.out"
> > >     
> > >     awk '
> > >         /\[OK\][\r]*$$/{ p++ }
> > >         /\[FAIL\][\r]*$$/{ f++ }
> > >         /\[SKIPPED\][\r]*$$/{ s++ }
> > >     
> > >         END {
> > >             printf("%d test(s) passed, %d skipped, %d failed.", p, s, f);
> > >             printf(" See all results in %s\n", ARGV[1]);
> > >         }' $LOG_FILE
> > > 
> > > And use it like this:
> > > 
> > >     LOG_REPORT           = $(CURDIR)/report.sh
> > >
> > 
> > I plan to renew this patchset, which one of the above methods do you
> > prefer?
> 
> IFF it needs to be done I prefer the macro in the Makefile to avoid
> depending on external scripts that are useless outside of the makefile.
> BUT, my point remains that I adopted this so that I could quickly and
> visually check that everything was OK. I'm fine with any other method
> but I do not want to have to carefully read all these lines to make
> sure I'm not mixing a "8" with a "0" (I'm mentioning this one because
> it's exactly the one I had when I decided to add the extra values).
> For example if you prepend "FAILURE: ", "WARNING: ", "SUCCESS: " in
> front of these lines to summarize them depending on the highest level
> encountered (success, skipped, failed), then I'm fine because it's
> easy to check that all lines show the same word.
> 

Ok.

> > For the always print statement:
> > 
> >     printf(" See all results in %s\n", ARGV[1]); }'
> 
> Then please put it on its own line without the leading space, this
> will be even more readable.
>

It is a good balance.

This may be more useful if we run this from the kselftest framework,
seems it is not able to run it from the 'kselftest' target currently,
here shares something I have tried:

I tried something like this, seems run-user works, but defconfig and run
not.

    diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
    index 4a3a105e1fdf..70693f6501c6 100644
    --- a/tools/testing/selftests/nolibc/Makefile
    +++ b/tools/testing/selftests/nolibc/Makefile
    @@ -83,6 +83,8 @@ CFLAGS  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
                    $(CFLAGS_$(ARCH)) $(CFLAGS_STACKPROTECTOR)
     LDFLAGS := -s
   
    +NOLIBC_SUBTARGETS ?= run-user
    +
     help:
            @echo "Supported targets under selftests/nolibc:"
            @echo "  all          call the \"run\" target below"
    @@ -110,7 +112,9 @@ help:
            @echo "  IMAGE_NAME    = $(if $(IMAGE_NAME),$(IMAGE_NAME),UNKNOWN_ARCH) [determined from \$$ARCH]"
            @echo ""

    -all: run
    +run_tests: $(NOLIBC_SUBTARGETS)
    +
    +all: $(NOLIBC_SUBTARGETS)

This can be triggered from the top-level kselftest framework:

    $ make -C /path/to/linux-stable kselftest TARGETS=nolibc NOLIBC_SUBTARGETS=run-user

And seems we still not support O= currently either.

> > I will paste the reason why I need it, as mentioned in [1], if you still
> > need a clean test report, I will give up this change ;-)
> 
> No worries, I don't want to be annoying if you need something, but I
> don't want to be annoyed by changes either :-)
> 

Thanks,
Zhangjin

> thanks,
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
