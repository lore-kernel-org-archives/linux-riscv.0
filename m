Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DCFEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5j/tun8yF7GegBMK6yes/IfqJma1LX/MU9MZNO15d7w=; b=anoOVwknk1SPF8
	ecXB7o+z+TPIk+rFVTFPAAM8B0EY9TrwbEpxTcFKLgSJI057P6Jqew85D2/oGwkPXM4lVJb3n0VUJ
	30RyexAqiNWsNjlVf/ge3OWnUpLXwCThJNC6WNsZUnAWKTVrzX71UV8dd/273ajteVXhextQlBsOY
	sZQVzE07srRrAUwHqrJ1mmqrgEpqj5F6xCnHbN+kVsgT77T+1KQsP3QlAXq1FJTODh48smlglJBg+
	SCkYM7TwyXdfaMNlGHxjRsrr8Qk33xLT1J6jvqN+IYK6bP6zdRe6c+pZV37zeRw6EZbsrlYzHZZEx
	Ynrh10g7TFxITwcpT7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGHXn-00ALUT-1N;
	Mon, 03 Jul 2023 11:16:35 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGHXj-00ALQ8-2u
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 11:16:34 +0000
X-QQ-mid: bizesmtp82t1688382943tgl4kp36
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 19:15:41 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: XBN7tc9DADJGmS+8V9nxPXH6WKrKZMAjM79vwg2x0KdxjTaUIu67ndj6OinDO
	p6MlWsFc27/KsIPxxFcQOruUnvI1u4LL2ewAANwXpNtLTLuLWMDJvR4KMvMGtmnKUZlrVFu
	FSfPJg+HQsPT0f3A02ZLk1P27cvupcIh3bOBiiNntHL/0UHrC4bCslREf/BO41pwwg/i9Ty
	TR7U9+xZ7iarF6GSKdLsUO6WhP1lzKFQ3Rbfmi2T2SZSr82U7e8x67Xgolmyx8pDitACNQt
	1aCQosEw3xPxoDEuIBBhBaxVCnUCchampVjHPcxYAOQdmXlCP5X3Wo3Uoo3OPlx21iC5z+K
	T1utUbbyMKU6B53zxe2lHSlmb5rOWlYS5+PJiMzYvEhJlJZm53cpUg2I+Uemp02VQEYK7b6
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16507692690246045464
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v5 10/14] tools/nolibc: __sysret: support syscalls who return a pointer
Date: Mon,  3 Jul 2023 19:15:41 +0800
Message-Id: <20230703111541.496900-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZKKdD/p4UkEavru6@1wt.eu>
References: <ZKKdD/p4UkEavru6@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_041632_257270_8D5CA1E7 
X-CRM114-Status: GOOD (  36.04  )
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

> On Mon, Jul 03, 2023 at 04:36:51PM +0800, Zhangjin Wu wrote:
> > > Syscalls that return pointer use that -MAX_ERRNO range to encode errors
> > > (such as mmap()). I just do not know if there is a convention saying that
> > > other ones also restrict themselves to that range or not. If you find
> > > some info which guarantees that it's the case for all of them, then by
> > > all means let's proceed like this, but in this case it should be mentioned
> > > in the comment why we think it's valid to do this. For now it's presented
> > > as an opportunity only.
> > 
> > Currently, I only found a prove-in-use case in musl:
> > 
> >     https://elixir.bootlin.com/musl/latest/source/src/internal/syscall_ret.c:
> > 
> >     #include <errno.h>
> >     #include "syscall.h"
> > 
> >     long __syscall_ret(unsigned long r)
> >     {
> >     	if (r > -4096UL) {
> >     		errno = -r;
> >     		return -1;
> >     	}
> >     	return r;
> >     }
> > 
> > Our new implementation (based on the one used by mmap()) is almostly the same
> > as musl. Not sure if this is enough. I have tried to 'git blame' on
> > __syscall_ret() of musl to find some clue, but failed, because the function has
> > been added before importing into its git repo.
> 
> OK, we already used the glibc-saved registers in the past to determine
> the official list of clobbered registers (and the ABI spec was even
> updated based on this). Here, musl is sufficiently deployed to consider
> this as valid. You can simply go that route and mention in the commit
> message that while you found no official reference stating that this is
> valid for int/long returns, you found at least one other implementation
> relying on this (i.e. if the kernel ever changes it will cause breakage).
>

ok.

> > > Also, the rest of the commit message regarding uintptr_t (which we don't
> > > use), bit values and modular arithmetics is extremely confusing and not
> > > needed at all. What matters is only to know if we need to consider only
> > > values -MAX_ERRNO..-1 as error or all negative ones. If so, then it's
> > > obvious that ret >= (unsigned long)-MAX_ERRNO catches them all, as the
> > > current mmap() function already does with -4095UL.
> > >
> > 
> > Yes, will clean up the commit message, but at first, let's continue get
> > more information about which one is ok:
> > 
> > - -MAX_ERRNO..-1 as error, for sys_mmap (we know in nolibc) currently
> > 
> > - all negative ones, for others currently
> 
> You can double-check in glibc for example, but I'm starting to guess
> you'll find the same test as above, i.e. errors are exclusively >-4096,
> regardless of the expected return type.
>

Your guest is definitely true ;-)

Glibc has the same logic in its INLINE_SYSCALL() macro:

    https://elixir.bootlin.com/glibc/latest/source/sysdeps/unix/sysv/linux/sysdep.h

    #undef INTERNAL_SYSCALL_ERROR_P
    #define INTERNAL_SYSCALL_ERROR_P(val) \
      ((unsigned long int) (val) > -4096UL)
    
    #ifndef SYSCALL_ERROR_LABEL
    # define SYSCALL_ERROR_LABEL(sc_err)					\
      ({									\
        __set_errno (sc_err);						\
        -1L;								\
      })
    #endif
    
    /* Define a macro which expands into the inline wrapper code for a system
       call.  It sets the errno and returns -1 on a failure, or the syscall
       return value otherwise.  */
    #undef INLINE_SYSCALL
    #define INLINE_SYSCALL(name, nr, args...)				\
      ({									\
        long int sc_ret = INTERNAL_SYSCALL (name, nr, args);		\
        __glibc_unlikely (INTERNAL_SYSCALL_ERROR_P (sc_ret))		\
        ? SYSCALL_ERROR_LABEL (INTERNAL_SYSCALL_ERRNO (sc_ret))		\
        : sc_ret;								\
      })

Nothing differs.

But 'git blame' has no clue to any 'spec' or 'standard' either.

- fcb78a55058fd, linux: Consolidate INLINE_SYSCALL

  Moved all of the arch specific INTERNAL_SYSCALL_ERROR_P() to common
  header

- 369b849f1a382, sysdeps/unix/sysv/linux/s390/s390-32/sysdep.h (INTERNAL_SYSCALL,...

  Firstly defined this macro: INTERNAL_SYSCALL_ERROR_P()

    $ git show 369b849f1a3 | grep "define.*INTERNAL_SYSCALL_ERROR_P"
    +#define INTERNAL_SYSCALL_ERROR_P(val)	((unsigned int) (val) >= 0xfffff001u)
    +#define INTERNAL_SYSCALL_ERROR_P(val)	((unsigned int) (val) >= 0xfffff001u)
    +#define INTERNAL_SYSCALL_ERROR_P(val)	((unsigned long) (val) >= -515L)
    +#define INTERNAL_SYSCALL_ERROR_P(val)	((unsigned long) (val) >= -4095L)

Willy, I plan to further use something like, is it ok for you?

    tools/include/nolibc/errno.h:

    -#define MAX_ERRNO 4095
    +#define MAX_ERRNO 4095UL

    tools/include/nolibc/sys.h:

    /* Syscall return helper for library routines
     * set errno as -ret when ret in [-MAX_ERRNO, -1]
     *
     * Note, No official reference states the errno range
     * here aligns with musl (src/internal/syscall_ret.c)
     * and glibc (sysdeps/unix/sysv/linux/sysdep.h)
     */
    static __inline__ __attribute__((unused, always_inline))
    long __sysret(unsigned long ret)
    {
            if (ret >= -MAX_ERRNO) {
                    SET_ERRNO(-(long)ret);
                    return -1;
            }
            return ret;
    }

Or we also directly use 4096UL here.

    static __inline__ __attribute__((unused, always_inline))
    long __sysret(unsigned long ret)
    {
            if (ret > -4096UL) {
                    SET_ERRNO(-(long)ret);
                    return -1;
            }
            return ret;
    }

Best regards,
Zhangjin

> Thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
