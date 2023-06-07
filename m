Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79C0C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DArEiiAst3AbtwVH4bvaQU4dxP74S/f6fvvoYuEmu4=; b=YEY0/VfzuXIYlK
	4ISc9kyn4PFszDTbHBLNaabM3rHcHXJsrxLj1Agyy8Ut/TVru/97EinitmqWwuv0TjfRAxPYTcCsk
	GNo05Hq8Mpxx0c3C/xD9Kr7Qvvi3dM1+a3le1vYqtCitaken0DhEH4m/iPY/Bm0UA3PcBgc09mf/1
	r4TrN42uUBl6Fh9tCci2MFaLXB5J5zX5JQ7F6jHIbN74t8So/6UNxXKuAsNoEzwANlJZQaehoaqIw
	mmoUqqDYKXvycBxtOB6UtISg6IuMve91ZxTzjeELQYqC2r4DRMOgWJ2d9wuLPHG+x0nP5kVA7aWHq
	tHuubomM7X+fCQ75N/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6sYD-005woJ-14;
	Wed, 07 Jun 2023 12:46:09 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6sY7-005wlz-0X
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 12:46:07 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 357Cjhfj003458;
	Wed, 7 Jun 2023 14:45:43 +0200
Date: Wed, 7 Jun 2023 14:45:43 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH 1/4] selftests/nolibc: add a test-report target
Message-ID: <ZIB792FtG6ibOudp@1wt.eu>
References: <20230605065459.153001-1-falcon@tinylab.org>
 <20230607055200.667447-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607055200.667447-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_054603_784459_41A53E5B 
X-CRM114-Status: GOOD (  29.34  )
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

Hi Zhangjin,

On Wed, Jun 07, 2023 at 01:52:00PM +0800, Zhangjin Wu wrote:
> Hi, Willy
> 
> > > On Mon, Jun 05, 2023 at 11:48:52AM +0800, Zhangjin Wu wrote:
> > > > A standalone test-report target is added to let the run, run-user and
> > > > rerun targets share them.
> > > > 
> > > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > > ---
> > > >  tools/testing/selftests/nolibc/Makefile | 26 ++++++++++++-------------
> > > >  1 file changed, 13 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> > > > index be4159837494..8149ace2938a 100644
> > > > --- a/tools/testing/selftests/nolibc/Makefile
> > > > +++ b/tools/testing/selftests/nolibc/Makefile
> > > > @@ -127,14 +127,18 @@ nolibc-test: nolibc-test.c sysroot/$(ARCH)/include
> > > >  libc-test: nolibc-test.c
> > > >  	$(QUIET_CC)$(CC) -o $@ $<
> > > >  
> > > > -# qemu user-land test
> > > > -run-user: nolibc-test
> > > > -	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > > > +test-report:
> > > >  	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
> > > >  	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
> > > >  	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
> > > >  	         $(CURDIR)/run.out
> > > >  
> > > > +# qemu user-land test
> > > > +_run-user: nolibc-test
> > > > +	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > > > +
> > > > +run-user: _run-user test-report
> > > > +
> > > 
> > > This will not reliably work, there's no ordering here, nothing guarantees
> > > that test-report will run *after* _run-user (e.g. make -j). Another
> > > approach is needed if you want to factor this, but in general creating
> > > sequences in makefiles is difficult and often more painful than having
> > > 3 times the same 3 lines.
> > >
> > 
> > Ok, thanks, what about this?
> > 
> >     # LOG_REPORT: report the test results
> >     LOG_REPORT   := awk '/\[OK\][\r]*$$/{p++} /\[FAIL\][\r]*$$/{f++} /\[SKIPPED\][\r]*$$/{s++} \
> > 	                 END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
> > 	                 printf(" See all results in %s\n", ARGV[1]); }'
> > 
> >     run-user: nolibc-test
> > 	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> > 
> >     run: kernel
> > 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
> > 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> > 
> >     rerun:
> > 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
> > 	$(Q)$(LOG_REPORT) $(CURDIR)/run.out
> > 
> > Or we directly add a standalone test report script? something like
> > tools/testing/selftests/nolibc/report.sh
> > 
> >     #!/bin/sh
> >     #
> >     # report.sh -- report the test results of nolibc-test
> >     #
> >     
> >     LOG_FILE=$1
> >     [ ! -f "$LOG_FILE" ] && echo "Usage: $0 /path/to/run.out"
> >     
> >     awk '
> >         /\[OK\][\r]*$$/{ p++ }
> >         /\[FAIL\][\r]*$$/{ f++ }
> >         /\[SKIPPED\][\r]*$$/{ s++ }
> >     
> >         END {
> >             printf("%d test(s) passed, %d skipped, %d failed.", p, s, f);
> >             printf(" See all results in %s\n", ARGV[1]);
> >         }' $LOG_FILE
> > 
> > And use it like this:
> > 
> >     LOG_REPORT           = $(CURDIR)/report.sh
> >
> 
> I plan to renew this patchset, which one of the above methods do you
> prefer?

IFF it needs to be done I prefer the macro in the Makefile to avoid
depending on external scripts that are useless outside of the makefile.
BUT, my point remains that I adopted this so that I could quickly and
visually check that everything was OK. I'm fine with any other method
but I do not want to have to carefully read all these lines to make
sure I'm not mixing a "8" with a "0" (I'm mentioning this one because
it's exactly the one I had when I decided to add the extra values).
For example if you prepend "FAILURE: ", "WARNING: ", "SUCCESS: " in
front of these lines to summarize them depending on the highest level
encountered (success, skipped, failed), then I'm fine because it's
easy to check that all lines show the same word.

> For the always print statement:
> 
>     printf(" See all results in %s\n", ARGV[1]); }'

Then please put it on its own line without the leading space, this
will be even more readable.

> I will paste the reason why I need it, as mentioned in [1], if you still
> need a clean test report, I will give up this change ;-)

No worries, I don't want to be annoying if you need something, but I
don't want to be annoyed by changes either :-)

thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
