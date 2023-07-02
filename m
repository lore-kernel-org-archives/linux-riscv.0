Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A91EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy/D1fRi7x1GFBZj/2IJP1rxV+EzbrG1zq+XnikF8/g=; b=NnwEUv05RknaJO
	uUhcIhjh+tuMWawcndRa3Fi0mzzI+B0e3cGYRNezTMaKtc7vMVuHJeorYXpFd51r6VISNZ9AqxAye
	y02SKMyaF8cxZvkBYXS6s+qjAfL5f/qq1ZjBDj+6JscTeEnRjhr4bNUYQfcKVwCfCE8eSXcCM+Fvm
	4KOVQ8zhNdjozjeS6somZsrj7yDBVW/bdL+NNQUQVqh8hjMlSHR3187No0d8Rkdr/dRwxfwW0mK2A
	PFryrO6dyKyuzRXl/Uq1zVx8ZwAy3vV3e4GcoApy/OnJwKAkBJccZZDrIB3fMd68G6VEvswYeBn0Z
	YOo2Eb6pgmDrYo6BVEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG0IQ-0089WD-33;
	Sun, 02 Jul 2023 16:51:34 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG0IM-0089VV-2m
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 16:51:32 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362GpRrH016840;
	Sun, 2 Jul 2023 18:51:27 +0200
Date: Sun, 2 Jul 2023 18:51:27 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v5 1/5] tools/nolibc: fix up #error compile failures with
 -ENOSYS
Message-ID: <20230702165127.GC16233@1wt.eu>
References: <cover.1687176996.git.falcon@tinylab.org>
 <1a823ba7b250ba5190f802dfc4428d4e248f71b3.1687176996.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a823ba7b250ba5190f802dfc4428d4e248f71b3.1687176996.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_095131_739628_29148FA0 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, Jun 19, 2023 at 08:24:15PM +0800, Zhangjin Wu wrote:
> Compiling nolibc for rv32 got such errors:
> 
>     In file included from nolibc/sysroot/riscv/include/nolibc.h:99,
>                      from nolibc/sysroot/riscv/include/errno.h:26,
>                      from nolibc/sysroot/riscv/include/stdio.h:14,
>                      from tools/testing/selftests/nolibc/nolibc-test.c:12:
>     nolibc/sysroot/riscv/include/sys.h:946:2: error: #error Neither __NR_ppoll nor __NR_poll defined, cannot implement sys_poll()
>       946 | #error Neither __NR_ppoll nor __NR_poll defined, cannot implement sys_poll()
>           |  ^~~~~
>     nolibc/sysroot/riscv/include/sys.h:1062:2: error: #error None of __NR_select, __NR_pselect6, nor __NR__newselect defined, cannot implement sys_select()
>      1062 | #error None of __NR_select, __NR_pselect6, nor __NR__newselect defined, cannot implement sys_select()
> 
> If a syscall is not supported by a target platform, 'return -ENOSYS' is
> better than '#error', which lets the other syscalls work as-is and
> allows developers to fix up the test failures reported by nolibc-test
> one by one later.
> 
> This converts all of the '#error' to 'return -ENOSYS', so, all of the
> '#error' failures are fixed.

Yeah, I like this! Initially we wanted the ifdef to spot include file
issues (which were the major concern at the beginning), and the selftest
was very limited. But now the coverage has significantly improved, the
major concern is cross-platform support and we know we won't get all of
it at once, so -ENOSYS is far better.

Thanks for this!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
