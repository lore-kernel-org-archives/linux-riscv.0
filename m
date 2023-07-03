Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2738EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Du9RpwGBLDCSCKoDnZ5mvfvoMu/hPVBHEA9Iw1Rf3Sc=; b=AqZZFrSiVXQWf1
	MWHYDEuZII5oVTPjQDSy5bcnqFYxaB9sppgGJqU8sGnY/KIrXekWw4zU4QKoxd6qECAsPXt0HFS/3
	x2r3Rr1FS3w9Vh2PMojiw+0MqKkIOPXEMBmcVqwR/u8cU5JBOsfETtIdGkAtus/2oL63Ii9kMEiwP
	ajyIdKh6zpg7adhhnSy0hzOkszaJbRZhS/CYg8WX+xJeztLNKe8ojjOtxr+nT0n+Y3wY26aOZMhOG
	6HDio97xEGrsG8LL1MuiY4QuV1YQGfjZu+6RvoA3kaqKY/VPXQqfIp8LnDZfjrbKf09Z3JsIKvvSR
	Y/RdUl2La5yT6tq/s8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGF3q-009mO1-1q;
	Mon, 03 Jul 2023 08:37:30 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGF3k-009mLK-0T
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 08:37:29 +0000
X-QQ-mid: bizesmtp77t1688373413t8yeuy3h
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 16:36:52 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: cbck7jzG4waxmtAyZOM8J8Vsk/O4lRHB8gEo7BxRdBy9c92QqQQ4tlBc7MY9E
	KAm4AlasFZ94a+Plz1Tc4zhbDw9VdqGMVSwXdRq/LGR8CslVesPAIiuK4/+Dx7yUlHm1/Ww
	EcxZWW+2L23J96t2HzAb9wggbf5SowHJS7L+9UAB/GgxFr0Rcs19VRsre7fQnONONJAR+iP
	TAYvAdoIO+/6bF4ESE0/4wL3WDYOcsQK/pDbeAbjCeN3sVKVJHxWbuyQvfwuWZZuVi/xfyw
	aMIS3mh6uT1bt5WWWu/pOljmrTjkKPCEaP5oeYr55WwvX71brL+RO3OPGlUTuQpgFqIuhKk
	XOZE3hrfN9A5LZ0kBFZl1WW06EImp3GJDu0x8RMUdkMnoWMRpddF4O1WxdDSN9bD35RpZP2
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12812962611774565405
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu,
	arnd@arndb.de,
	david.laight@aculab.com,
	thomas@t-8ch.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 10/14] tools/nolibc: __sysret: support syscalls who return a pointer
Date: Mon,  3 Jul 2023 16:36:51 +0800
Message-Id: <20230703083651.491785-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230702191733.GI16233@1wt.eu>
References: <20230702191733.GI16233@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_013724_505032_2BFB9D62 
X-CRM114-Status: GOOD (  32.23  )
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

> On Wed, Jun 28, 2023 at 09:39:56PM +0800, Zhangjin Wu wrote:
> > To support syscalls (e.g. mmap()) who return a pointer and to allow the
> > pointer as big as possible, we should convert the negated errno value to
> > unsigned long (uintptr_t), otherwise, in signed long, a potential big
> > pointer (whose highest bit is 1) will be treated as a failure.
> > 
> > tools/include/nolibc/errno.h defines the MAX_ERRNO, let's use it
> > directly.
> 
> It might or might not work, it's an ABI change that, if validated, at
> least needs a much more detailed explanation. What matters is not what
> errno values we're willing to consider as an error, but what the
> *syscalls* themselves return as an error. If a syscall says "< 0 is an
> error equal to -errno", it means that we must treat it as an error,
> and extract its value to get errno. If that errno is larger than
> MAX_ERRNO it just means we don't know what the error is.
>

Yes, we do need to find a 'spec' or 'standard' to follow.

welcome suggestions from Arnd, Thomas and also David.

> Syscalls that return pointer use that -MAX_ERRNO range to encode errors
> (such as mmap()). I just do not know if there is a convention saying that
> other ones also restrict themselves to that range or not. If you find
> some info which guarantees that it's the case for all of them, then by
> all means let's proceed like this, but in this case it should be mentioned
> in the comment why we think it's valid to do this. For now it's presented
> as an opportunity only.

Currently, I only found a prove-in-use case in musl:

    https://elixir.bootlin.com/musl/latest/source/src/internal/syscall_ret.c:

    #include <errno.h>
    #include "syscall.h"

    long __syscall_ret(unsigned long r)
    {
    	if (r > -4096UL) {
    		errno = -r;
    		return -1;
    	}
    	return r;
    }

Our new implementation (based on the one used by mmap()) is almostly the same
as musl. Not sure if this is enough. I have tried to 'git blame' on
__syscall_ret() of musl to find some clue, but failed, because the function has
been added before importing into its git repo.

> 
> Also, the rest of the commit message regarding uintptr_t (which we don't
> use), bit values and modular arithmetics is extremely confusing and not
> needed at all. What matters is only to know if we need to consider only
> values -MAX_ERRNO..-1 as error or all negative ones. If so, then it's
> obvious that ret >= (unsigned long)-MAX_ERRNO catches them all, as the
> current mmap() function already does with -4095UL.
>

Yes, will clean up the commit message, but at first, let's continue get
more information about which one is ok:

- -MAX_ERRNO..-1 as error, for sys_mmap (we know in nolibc) currently

- all negative ones, for others currently

> I just don't know where to check if we can generalize that test. In the
> worst case we could have two __sys_ret(), the current one and a second
> one for pointers. But I would suspect we could generalize due to ptrace,
> as there it makes sense to be able to detect failures, even unknown ones.
> I just need something more convincing than an intuition for a commit
> message and to take such a change :-/
>

Of course, must be clear enough.

Best regards,
Zhangjin

> Thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
