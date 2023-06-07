Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE2C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 04:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MD8DPYrLrnPrO7gpHOGcsUG+FrZEq5icU+LZpFEvZ8=; b=M+nsPgscgv34dH
	d+85svrP5zUqm/nTNucFMoCccBY5HCE8mHxXEMcLImtZ07vg0A0DfuBw7kdDmYpjUyCgeAeAtSQAi
	gYLSMDO7Cx/JICYe8TwkrjwLRy8cg7SUKLfscapW3fT0D0zvoGLO0VEEVfGj+6w+0g0qjuT59Klu9
	jTH9EwctzZ/V2GQa3B7o9z1dW+XW/PQ72L/YErOa3TaSKp5JNPcbvJ6Xoeqc6eW/98Ej+UyB2EZWS
	MSfKyeF6XK+QFqe87u5jG01nvsV4V0OG7/OB5NFct7aHLRJwiH5YLXzYjXeEJAj2IFG88uTHkO0Ul
	i3zPE8bxTPFfMePZfw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6kQ5-004FOh-0f;
	Wed, 07 Jun 2023 04:05:13 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6kQ0-004FO1-2F
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 04:05:11 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3574515M030733;
	Wed, 7 Jun 2023 06:05:01 +0200
Date: Wed, 7 Jun 2023 06:05:01 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Message-ID: <ZIAB7bFYegCuXT9g@1wt.eu>
References: <7e76f099-4198-421c-8157-430201970c4c@t-8ch.de>
 <20230607003406.559638-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607003406.559638-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_210509_324350_C4B17C5B 
X-CRM114-Status: GOOD (  34.30  )
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

Hi,

On Wed, Jun 07, 2023 at 08:34:06AM +0800, Zhangjin Wu wrote:
> > Hi Zhangjin,
> > 
> > On 2023-06-06 16:17:38+0800, Zhangjin Wu wrote:
> > > Use __syscall() helper to shrink 252 lines of code.
> > > 
> > >     $ git show HEAD^:tools/include/nolibc/sys.h | wc -l
> > >     1425
> > >     $ git show HEAD:tools/include/nolibc/sys.h | wc -l
> > >     1173
> > >     $ echo "1425-1173" | bc -l
> > >     252
> > > 
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > ---
> > >  tools/include/nolibc/sys.h | 336 +++++--------------------------------
> > >  1 file changed, 42 insertions(+), 294 deletions(-)
> > > 
> > > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > > index f6e3168b3e50..0cfc5157845a 100644
> > > --- a/tools/include/nolibc/sys.h
> > > +++ b/tools/include/nolibc/sys.h
> > > @@ -108,13 +108,7 @@ int sys_chdir(const char *path)
> > >  static __attribute__((unused))
> > >  int chdir(const char *path)
> > >  {
> > > -	int ret = sys_chdir(path);
> > > -
> > > -	if (ret < 0) {
> > > -		SET_ERRNO(-ret);
> > > -		ret = -1;
> > > -	}
> > > -	return ret;
> > > +	return __syscall(chdir, path);
> > 
> > To be honest I'm still not a big fan of the __syscall macro.
> > It's a bit too magic for too little gain.
> > 
> > The commit message argues that the patches make the code shorter.
> > 
> > However doing 
> > 
> > __sysret(sys_chdir(path));
> > 
> > instead of
> > 
> > __syscall(chdir, path);
> > 
> > is only three characters longer and the same amout of lines.
> >
> 
> Yeah, I do like your version too, it looks consise too, the only not
> comfortable part is there are dual calls in one line.

For those who want to debug, having less macros or magic stuff is always
better, and in this essence I too find that Thomas' version is more
expressive about what is being done. Also, if some syscalls require a
specific handling (e.g. mmap() needs to return MAP_FAILED instead), it's
much easier to change only the code dealing with the return value and
errno setting than having to guess how to reimplement what was magically
done in a macro.

> > Otherwise we would have syscall() _syscall() and __syscall() each doing
> > different things.
> >
> 
> Yes, I'm worried about this too, although the compilers may help a
> little, but it is too later.

The issue is for the person who remembers "I need to use 'syscall'" but
never remembering the number of underscores nor the variations.

> Just brain storming, What about another non-similar name, for example,
> __syswrap() or __sysin() ?
> 
> Or even convert __sysret() to __sysout() and __syscall() to __sysin(),
> do you like it? or even __sysexit(), __sysentry(), but the __sysexit()
> may be misused with sys_exit().

I'd rather use "__set_errno()" to explicitly mention that it's only
used to set errno, but sysret would be fine as well IMHO as if we're
purist, it also normalizes the return value.

>     /* Syscall return helper, set errno as -ret when ret < 0 */
>     static __inline__ __attribute__((unused, always_inline))
>     long __sysout(long ret)
>     {
>     	if (ret < 0) {
>     		SET_ERRNO(-ret);
>     		ret = -1;
>     	}
>     	return ret;
>     }
>     
>     /* Syscall call helper, use syscall name instead of syscall number */
>     #define __sysin(name, ...) __sysout(sys_##name(__VA_ARGS__))
> 
>     static __attribute__((unused))
>     int brk(void *addr)
>     {
>     	return __sysout(sys_brk(addr) ? 0 : -ENOMEM);
>     }
> 
>     static __attribute__((unused))
>     int chdir(const char *path)
>     {
>     	return __sysin(chdir, path);
>     }

I still don't find this intuitive at all.

> If we really want something like __syscall()/__sysret(), I do think they
> should be a pair ;-)

Then one being called "call" while the other one being "ret" do form a
pair, no ?

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
