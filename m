Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186FFEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JEO6L+Mq9kU0WbCcwfOTkLooX7q7TEEJtm1ONTP2e4=; b=yDM+ImUXexK6Ih
	dLJYsJoWmgUicz/z7n3Oc0w0ozzKJgZUtWlIHW/Zgh5RjYYz3tYICGZs9prVCCYD3TbKfJrtsBk8s
	44SVPWifXJmzn5KuvNPeRLeDOmkbLtPc0qoKYplLCwny6DCxRHfv+zkqRkJ6tZ8hwgIU70PSiT5gM
	r6QtzfuPZEb9Iu+ioGLwJPA0XeOjuI/gQnjL5NZllsuNXAoCszCnQLTorZ6Sn3H6G73xNshhxdgMY
	nbbJaiVSZnO8+IGLR7Ab5szwWafbkKeMkqR/VpgXfwlA+mt4L42B4XIwJ2aSmtntjMxTVLyf09NHD
	SiyTw/3UkdR8TI66mFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGPh-00A305-2q;
	Mon, 03 Jul 2023 10:04:09 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGPe-00A2zW-1z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:04:08 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 363A3xSs023937;
	Mon, 3 Jul 2023 12:03:59 +0200
Date: Mon, 3 Jul 2023 12:03:59 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, david.laight@aculab.com, thomas@t-8ch.de,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 10/14] tools/nolibc: __sysret: support syscalls who
 return a pointer
Message-ID: <ZKKdD/p4UkEavru6@1wt.eu>
References: <20230702191733.GI16233@1wt.eu>
 <20230703083651.491785-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703083651.491785-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_030406_951568_60AF4BF0 
X-CRM114-Status: GOOD (  27.74  )
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

On Mon, Jul 03, 2023 at 04:36:51PM +0800, Zhangjin Wu wrote:
> > Syscalls that return pointer use that -MAX_ERRNO range to encode errors
> > (such as mmap()). I just do not know if there is a convention saying that
> > other ones also restrict themselves to that range or not. If you find
> > some info which guarantees that it's the case for all of them, then by
> > all means let's proceed like this, but in this case it should be mentioned
> > in the comment why we think it's valid to do this. For now it's presented
> > as an opportunity only.
> 
> Currently, I only found a prove-in-use case in musl:
> 
>     https://elixir.bootlin.com/musl/latest/source/src/internal/syscall_ret.c:
> 
>     #include <errno.h>
>     #include "syscall.h"
> 
>     long __syscall_ret(unsigned long r)
>     {
>     	if (r > -4096UL) {
>     		errno = -r;
>     		return -1;
>     	}
>     	return r;
>     }
> 
> Our new implementation (based on the one used by mmap()) is almostly the same
> as musl. Not sure if this is enough. I have tried to 'git blame' on
> __syscall_ret() of musl to find some clue, but failed, because the function has
> been added before importing into its git repo.

OK, we already used the glibc-saved registers in the past to determine
the official list of clobbered registers (and the ABI spec was even
updated based on this). Here, musl is sufficiently deployed to consider
this as valid. You can simply go that route and mention in the commit
message that while you found no official reference stating that this is
valid for int/long returns, you found at least one other implementation
relying on this (i.e. if the kernel ever changes it will cause breakage).

> > Also, the rest of the commit message regarding uintptr_t (which we don't
> > use), bit values and modular arithmetics is extremely confusing and not
> > needed at all. What matters is only to know if we need to consider only
> > values -MAX_ERRNO..-1 as error or all negative ones. If so, then it's
> > obvious that ret >= (unsigned long)-MAX_ERRNO catches them all, as the
> > current mmap() function already does with -4095UL.
> >
> 
> Yes, will clean up the commit message, but at first, let's continue get
> more information about which one is ok:
> 
> - -MAX_ERRNO..-1 as error, for sys_mmap (we know in nolibc) currently
> 
> - all negative ones, for others currently

You can double-check in glibc for example, but I'm starting to guess
you'll find the same test as above, i.e. errors are exclusively >-4096,
regardless of the expected return type.

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
