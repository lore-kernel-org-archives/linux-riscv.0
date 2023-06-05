Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6224AC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8zL7y/TrFxVkQi36xJ7AL8HMViWJ6ZcS8L6X0wDmWE=; b=pjO/LXoEudofRO
	XwxYmjnZkuHemYvypEqlWFgJJy0o06n8D6fCBshSbRM8o1alV0B99qkiErhHEr2Aknm56pG6ivXEn
	5B3Lk9GPOPRptIYFH1HOIpGxiy2F8t5UZnrkLbNRBja+pN7A/K6I1s/LZXYmZFFxUToGaY9+IWn1L
	5HjvYy1U3hkTRhbsegb9pbjzE393l6fDej6+r62JM+ZYLX+9ObE+zzY6f1w32IzCy24BTiGj1hxfd
	BSnqSaFJxC+d4O9SvkruAAwZN+HOb+DPK/Oul7UxIRf2GLvaCao0HfutXcQs29FiDT4Gyg/Maci2B
	qinA/1T/GD+EuXUmVjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q647y-00ESk1-0V;
	Mon, 05 Jun 2023 06:55:42 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q647u-00EShn-0N
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 06:55:40 +0000
X-QQ-mid: bizesmtp75t1685948110tj3ia4jc
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 14:55:09 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: L0h5767YwF7UouhZzhBXRX0J562z4mUQF/JwTWKNazvGipvhUulKq4xIkj7LR
	rGYqbiKejXCJRm9OO38WToeR8vgorbsgvCzKbe7x3dLf3w8/Pbt6Oca5ph0NXLYk3m18W5q
	HQhS4qt73pq0qu21Ii7nuvMT4ePnsvJ9oLnofCcL43Wfi0slj9dT5cBidHaA340DOM83Xpx
	XJ4T1DcJO1d7KEcrnhFLcMuowaEEJTEZvz8KGw4CBuHCRaAQ4x6n/kBZzFqscvr8Qf9Ac8T
	4DkWW6a+7pbxpCd3aumbhdiA40RpcUJODeQsfbUDUKFnNscJqL3k21Xm5rUt6ycUp6d+Eik
	yWJrsR6bAdss3QbnejPFsBdI3sJm9CjUV48Lh8u9A251MTegrBxyPdKPVzUXehTL+Ec6zPS
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14854381511492938161
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH 1/4] selftests/nolibc: add a test-report target
Date: Mon,  5 Jun 2023 14:54:59 +0800
Message-Id: <20230605065459.153001-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZH1iDne+PiyZmIIB@1wt.eu>
References: <ZH1iDne+PiyZmIIB@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_235538_455493_03C62258 
X-CRM114-Status: GOOD (  15.18  )
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

> On Mon, Jun 05, 2023 at 11:48:52AM +0800, Zhangjin Wu wrote:
> > A standalone test-report target is added to let the run, run-user and
> > rerun targets share them.
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/testing/selftests/nolibc/Makefile | 26 ++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> > index be4159837494..8149ace2938a 100644
> > --- a/tools/testing/selftests/nolibc/Makefile
> > +++ b/tools/testing/selftests/nolibc/Makefile
> > @@ -127,14 +127,18 @@ nolibc-test: nolibc-test.c sysroot/$(ARCH)/include
> >  libc-test: nolibc-test.c
> >  	$(QUIET_CC)$(CC) -o $@ $<
> >  
> > -# qemu user-land test
> > -run-user: nolibc-test
> > -	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > +test-report:
> >  	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
> >  	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
> >  	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
> >  	         $(CURDIR)/run.out
> >  
> > +# qemu user-land test
> > +_run-user: nolibc-test
> > +	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> > +
> > +run-user: _run-user test-report
> > +
> 
> This will not reliably work, there's no ordering here, nothing guarantees
> that test-report will run *after* _run-user (e.g. make -j). Another
> approach is needed if you want to factor this, but in general creating
> sequences in makefiles is difficult and often more painful than having
> 3 times the same 3 lines.
>

Ok, thanks, what about this?

    # LOG_REPORT: report the test results
    LOG_REPORT   := awk '/\[OK\][\r]*$$/{p++} /\[FAIL\][\r]*$$/{f++} /\[SKIPPED\][\r]*$$/{s++} \
	                 END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
	                 printf(" See all results in %s\n", ARGV[1]); }'

    run-user: nolibc-test
	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
	$(Q)$(LOG_REPORT) $(CURDIR)/run.out

    run: kernel
	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
	$(Q)$(LOG_REPORT) $(CURDIR)/run.out

    rerun:
	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
	$(Q)$(LOG_REPORT) $(CURDIR)/run.out

Or we directly add a standalone test report script? something like
tools/testing/selftests/nolibc/report.sh

    #!/bin/sh
    #
    # report.sh -- report the test results of nolibc-test
    #
    
    LOG_FILE=$1
    [ ! -f "$LOG_FILE" ] && echo "Usage: $0 /path/to/run.out"
    
    awk '
        /\[OK\][\r]*$$/{ p++ }
        /\[FAIL\][\r]*$$/{ f++ }
        /\[SKIPPED\][\r]*$$/{ s++ }
    
        END {
            printf("%d test(s) passed, %d skipped, %d failed.", p, s, f);
            printf(" See all results in %s\n", ARGV[1]);
        }' $LOG_FILE

And use it like this:

    LOG_REPORT           = $(CURDIR)/report.sh

Best regards,
Zhangjin

> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
