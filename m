Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2525FEB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 19:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnWfos6SDovuP+6d7R9UgWFnCi3Rer3priRyqgwOr4U=; b=Dt0DtOPgS9dlY4
	s7YTAxT1D/o7U8ndiUUXzkZTqgOlDUchpqFtxpeqjsHqJyNcnvU9m2hCKjDNJySLGC9mBM3mv24zJ
	NfR1n0BcDjBB6jKd+NiBv3KUO8xzvkxGrpkGNcivDjFAHmIvxXXdoD6GrnQiXWsSyniO12mSzoxDL
	a/CZQBYckpuyWkceHE+2qqS8crT2TRYfMnoCsJozYBlRgrJsP3gR+8fHEKYSpk8Ahi2EVUXTt4SVH
	3nHSjndnu7aLEbgqt3afpsYFPZvNkuJoDz8K8Ceq9OhzJvH9Jt1EDpYksp+pFhjn33SO/svMBI8cJ
	AORkcAYlPogB/vjURU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2ot-008TSs-09;
	Sun, 02 Jul 2023 19:33:15 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2op-008TSR-2A
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 19:33:13 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362JX6cW017544;
	Sun, 2 Jul 2023 21:33:06 +0200
Date: Sun, 2 Jul 2023 21:33:06 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v5 14/14] selftests/nolibc: add mmap and munmap test cases
Message-ID: <20230702193306.GK16233@1wt.eu>
References: <cover.1687957589.git.falcon@tinylab.org>
 <90179484b62c0bafb0fad9b03680136bd6fedee3.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90179484b62c0bafb0fad9b03680136bd6fedee3.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_123312_585544_4EF16C76 
X-CRM114-Status: GOOD (  14.70  )
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

On Wed, Jun 28, 2023 at 09:51:57PM +0800, Zhangjin Wu wrote:
> Three mmap/munmap related test cases are added:
> 
> - mmap_bad: the length argument must be greater than 0, otherwise, fail
>   with -EINVAL.
> 
> - munmap_bad: invalid (void *)-1 address fail with -EINVAL.
> 
> - mmap_munmap_good: mmap() a file with good offset and then munmap().
> 
> Note, it is not easy to find a unique file for mmap() in different
> scenes, so, a file list is used to search the right one:
> 
> - /proc/1/exe, for 'run' and 'run-user' target
>   'run-user' can not find '/proc/self/exe'
> 
> - /proc/self/exe, for 'libc-test' target
>   normal program 'libc-test' has no permission to access '/proc/1/exe'

Strictly speaking, if your executable is not readable (e.g. chmod 111
due to a restrictive umask) it will also fail that one.

> - the others, for kernel without procfs
>   let it pass even with 'worst case' kernel configs

You should include /dev/zero, which is commonly used to allocate anonymous
memory and is more likely present and readable than any of the other files.
And another file of choice is obviously argv[0] ;-)  In this case you don't
need any of the other extra ones. Thus I could suggest that you try in this
order:

    /dev/zero, /proc/self/exe, /proc/1/exe, argv[0]

and be done with it. That doesn't prevent one from extending the list if
really needed later, but I doubt it would be needed. Also, it's already
arranged in a read-write, then read-only fallbacks mode, so if we later
need to add more complex tests involving writes, the writable /dev/zero
will have precedence.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
