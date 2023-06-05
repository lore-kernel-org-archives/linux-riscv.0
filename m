Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101FDC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 04:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgAc35v/F/Q4xa/FaxIggsNiEwfGWzHRMShNkPKUysE=; b=JT5QMnqtFYN49a
	CB7XY5/KbK24uU0vJA+HUFXk+Q0aR8PI8b3i4sLWUDUMzMouT2S1f/kyeHf25m/flP2MKV/QsV0zl
	txzTzGWKfBXdJnO8xEBxp04vAo6hWy4OW1mOLzGPnBUA/raxiY2BmsmpSfnmhMzq2K0Cq9hNwdCzB
	XIYuoJ9KOPPY40DBjk4ZiJ9BRQVbROZMDziqkuCZVDdiKovdnnkB1/t7jsRAUlf78w5mUIJUzUgRA
	zcqNrvu8MNqCHzdqEe4eFLg7IQmyJCA/oWLja0CRvbeIcHxJ1L52VkpN+4x+Rf3kMHKAvs9Q+bSov
	BQCSfOelyKpk2BWDnN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61fs-00E3m8-2W;
	Mon, 05 Jun 2023 04:18:32 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61fo-00E3l4-2P
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 04:18:30 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3554IMKL005432;
	Mon, 5 Jun 2023 06:18:22 +0200
Date: Mon, 5 Jun 2023 06:18:22 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH 1/4] selftests/nolibc: add a test-report target
Message-ID: <ZH1iDne+PiyZmIIB@1wt.eu>
References: <cover.1685936428.git.falcon@tinylab.org>
 <291c5437db94057a3b045a6f036b02658380b05b.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <291c5437db94057a3b045a6f036b02658380b05b.1685936428.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_211829_748043_BB03FB54 
X-CRM114-Status: GOOD (  12.58  )
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

On Mon, Jun 05, 2023 at 11:48:52AM +0800, Zhangjin Wu wrote:
> A standalone test-report target is added to let the run, run-user and
> rerun targets share them.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/Makefile | 26 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> index be4159837494..8149ace2938a 100644
> --- a/tools/testing/selftests/nolibc/Makefile
> +++ b/tools/testing/selftests/nolibc/Makefile
> @@ -127,14 +127,18 @@ nolibc-test: nolibc-test.c sysroot/$(ARCH)/include
>  libc-test: nolibc-test.c
>  	$(QUIET_CC)$(CC) -o $@ $<
>  
> -# qemu user-land test
> -run-user: nolibc-test
> -	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> +test-report:
>  	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
>  	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
>  	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
>  	         $(CURDIR)/run.out
>  
> +# qemu user-land test
> +_run-user: nolibc-test
> +	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
> +
> +run-user: _run-user test-report
> +

This will not reliably work, there's no ordering here, nothing guarantees
that test-report will run *after* _run-user (e.g. make -j). Another
approach is needed if you want to factor this, but in general creating
sequences in makefiles is difficult and often more painful than having
3 times the same 3 lines.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
