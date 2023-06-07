Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDEBC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gQrtScmt19n9MS7BG43ufkq2MpoLbRjAedgg5CDq7s=; b=POsrwvQVVTYVG/
	/cdufjmxVQMKmhkO4wQqlki20e2i2AtwSMRAk2R8ln8wihGVJia02o8SAx6LZBBIrjkbDi/JBGKn/
	zTjBMtulJfAhcJABbQb02gGy23O3XqgAPngUpTkwG2edY/0IbcRZ/vc8pdOWh8ljZdK/wZTzCX+1W
	2WsPdX+ko8gaebaUZaE4L9ZL7QklWDcyxo7ZpAl4fxW0AwP3lvBl5Xc0h5HMr8E2eK2XUAIoBhO/T
	0YXoeF0sV77rGhFCJg/Qc4wSrED52N+44B4W9slBVzmNbrrG2fh4/b89nv7+GbYtYmqA3ghOPPc/h
	aJsBMmt9AySbzwZA8Dew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ltc-004S5u-39;
	Wed, 07 Jun 2023 05:39:48 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ltZ-004S3w-2L
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 05:39:47 +0000
X-QQ-mid: bizesmtp83t1686116362t3310e0v
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 13:39:20 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: pQPC2yl/OPKHnEh0fu3Xx+jOViHnsOolz5ZP698W9YEzxBo2d2Sj6Ako9agp4
	HhQVLy0P7NcbJ7WM0j4C3bDh/L8eXj+GG1DSBNrSLdzg2dKC+5AVjps/hs2AZ3xvav4rrzn
	+uqbh8unqZcF3L3nLpALMjPc3b8Rd5uKcGNjAlWKL3X4fOx3z7GUDvl+JPaRAfjDuOPGY3x
	CvKdR2AIXZC4lIVJ6zxzCagzEnKLVbtSjFO1nLsguI7TD1LSLS6Q/H2DvhyTt289oT5S59m
	WnfHrmKJBe/9JCs5ANlhvxI39JeQN+OpjK1iZUTr2XAKVYRBVhpfTMiKlL1YpWC9Vh0GVok
	CvhcpaK8f8l3eZIlic8EbIV8Y6mYv60VyZRxr8L/jKdbMZ0l9PWr2/WJa96AJsDrbjEY0a9
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 287981042937728525
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Date: Wed,  7 Jun 2023 13:39:20 +0800
Message-Id: <20230607053920.667272-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZIAB7bFYegCuXT9g@1wt.eu>
References: <ZIAB7bFYegCuXT9g@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_223946_088503_65FC55AE 
X-CRM114-Status: GOOD (  43.85  )
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

> On Wed, Jun 07, 2023 at 08:34:06AM +0800, Zhangjin Wu wrote:
> > > Hi Zhangjin,
> > > 
> > > On 2023-06-06 16:17:38+0800, Zhangjin Wu wrote:
> > > > Use __syscall() helper to shrink 252 lines of code.
> > > > 
> > > >     $ git show HEAD^:tools/include/nolibc/sys.h | wc -l
> > > >     1425
> > > >     $ git show HEAD:tools/include/nolibc/sys.h | wc -l
> > > >     1173
> > > >     $ echo "1425-1173" | bc -l
> > > >     252
> > > > 
> > > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > > ---
> > > >  tools/include/nolibc/sys.h | 336 +++++--------------------------------
> > > >  1 file changed, 42 insertions(+), 294 deletions(-)
> > > > 
> > > > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > > > index f6e3168b3e50..0cfc5157845a 100644
> > > > --- a/tools/include/nolibc/sys.h
> > > > +++ b/tools/include/nolibc/sys.h
> > > > @@ -108,13 +108,7 @@ int sys_chdir(const char *path)
> > > >  static __attribute__((unused))
> > > >  int chdir(const char *path)
> > > >  {
> > > > -	int ret = sys_chdir(path);
> > > > -
> > > > -	if (ret < 0) {
> > > > -		SET_ERRNO(-ret);
> > > > -		ret = -1;
> > > > -	}
> > > > -	return ret;
> > > > +	return __syscall(chdir, path);
> > > 
> > > To be honest I'm still not a big fan of the __syscall macro.
> > > It's a bit too magic for too little gain.
> > > 
> > > The commit message argues that the patches make the code shorter.
> > > 
> > > However doing 
> > > 
> > > __sysret(sys_chdir(path));
> > > 
> > > instead of
> > > 
> > > __syscall(chdir, path);
> > > 
> > > is only three characters longer and the same amout of lines.
> > >
> > 
> > Yeah, I do like your version too, it looks consise too, the only not
> > comfortable part is there are dual calls in one line.
> 
> For those who want to debug, having less macros or magic stuff is always
> better, and in this essence I too find that Thomas' version is more
> expressive about what is being done. Also, if some syscalls require a
> specific handling (e.g. mmap() needs to return MAP_FAILED instead), it's
> much easier to change only the code dealing with the return value and
> errno setting than having to guess how to reimplement what was magically
> done in a macro.
>

Ok, so, let's go with Thomas' version ;-)

> > > Otherwise we would have syscall() _syscall() and __syscall() each doing
> > > different things.
> > >
> > 
> > Yes, I'm worried about this too, although the compilers may help a
> > little, but it is too later.
> 
> The issue is for the person who remembers "I need to use 'syscall'" but
> never remembering the number of underscores nor the variations.

Yeah, it is hard to remember.

> 
> > Just brain storming, What about another non-similar name, for example,
> > __syswrap() or __sysin() ?
> > 
> > Or even convert __sysret() to __sysout() and __syscall() to __sysin(),
> > do you like it? or even __sysexit(), __sysentry(), but the __sysexit()
> > may be misused with sys_exit().
> 
> I'd rather use "__set_errno()" to explicitly mention that it's only
> used to set errno, but sysret would be fine as well IMHO as if we're
> purist, it also normalizes the return value.
>

Ok, let's take the shorter sysret() seems no similar sys_xxx calls.

> >     /* Syscall return helper, set errno as -ret when ret < 0 */
> >     static __inline__ __attribute__((unused, always_inline))
> >     long __sysout(long ret)
> >     {
> >     	if (ret < 0) {
> >     		SET_ERRNO(-ret);
> >     		ret = -1;
> >     	}
> >     	return ret;
> >     }
> >     
> >     /* Syscall call helper, use syscall name instead of syscall number */
> >     #define __sysin(name, ...) __sysout(sys_##name(__VA_ARGS__))
> > 
> >     static __attribute__((unused))
> >     int brk(void *addr)
> >     {
> >     	return __sysout(sys_brk(addr) ? 0 : -ENOMEM);
> >     }
> > 
> >     static __attribute__((unused))
> >     int chdir(const char *path)
> >     {
> >     	return __sysin(chdir, path);
> >     }
> 
> I still don't find this intuitive at all.
> 
> > If we really want something like __syscall()/__sysret(), I do think they
> > should be a pair ;-)
> 
> Then one being called "call" while the other one being "ret" do form a
> pair, no ?

The 'ret' currently is a part of our old '__syscall', seems not that like a
'pair', it differs from entry/exit ;-)

As a summary, will use 'sysret()' and something like:

   static __attribute__((unused))
   int chdir(const char *path)
   {
   	return sysret(chdir(path));
   }

to renew the syscall helper patchset, Thanks you very much.

Best regards,
Zhangjin

> 
> Thanks,
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
