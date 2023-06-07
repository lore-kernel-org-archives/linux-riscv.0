Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E13C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 00:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cw9AlSNAnnDMEzPHZrJSHH3RLiFdUOusyk2KCcvYFvs=; b=3qcoPSGl3GyBxl
	gGo+MuWxFCqeaIooOvAAl12ILm7D0b2cZORhDoetnEU6EMCAIkwNjRlM9b/uVtAUuZCUauURwLGJZ
	MjBgKQ2f6gbNnb5/R/n+NZT6FEISLhCmAyEOqE2EvmqmMJZRrFUhYl8GQejtc7a5yCBSzFod0/XYP
	3KnIrcubptxAXZEP0r8jr22fj2Huo4KGeqGS6IlxLwVmB5tvzelXfVOwTXqWntJcQquAsbT0lZU5I
	eDnav8yQGJKoOzPsEc1d1T89ISsPpeSDARDTkYDmVZHs6tvw/zWz10VjEwIHwjkHeyjSe6tv7/HOy
	LzfhMVU2iRhC2QbCkq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6h8F-003mr0-1k;
	Wed, 07 Jun 2023 00:34:35 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6h8B-003mpU-0N
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 00:34:34 +0000
X-QQ-mid: bizesmtp80t1686098048tb6ncj0o
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 08:34:07 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 2qli6fYqcypcLY99/zUQyFc7OGvqHYqz5PiHI7yQ7HnWszpIoNcsoAMUj02ew
	Wey8rV7CTOMl0Y+ApPuSc3Cbnpx7QkY2Wvjso2OA5T31VwSz4Nxa/gm77aJOQBY+6Cl/hEx
	S/dvpbhonG0Fyips2ThCWreyj3PqH4IOmYOhaDoEqnqEDhW1i71CubLWPuuCrUzdMiFrLEn
	gopznRXZeMfi3ZpUvVnsBfoXIR4zUPnH8FbvFr3ONszDpMgLeOePr7UCr9ZX/Fb1xQU0k4k
	AnHSoiVH9o095/x6cDWNFOL0uZ1Yk0wXD3WOhMwW/J7SN8BF0fJSEAQNC1PIttK6Q0SPX1j
	UDZBWvKMR72PNl7m9KYNbcf7RYxdQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1982007782142480683
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Date: Wed,  7 Jun 2023 08:34:06 +0800
Message-Id: <20230607003406.559638-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7e76f099-4198-421c-8157-430201970c4c@t-8ch.de>
References: <7e76f099-4198-421c-8157-430201970c4c@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_173431_491508_FE56CB8A 
X-CRM114-Status: GOOD (  27.70  )
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

> Hi Zhangjin,
> 
> On 2023-06-06 16:17:38+0800, Zhangjin Wu wrote:
> > Use __syscall() helper to shrink 252 lines of code.
> > 
> >     $ git show HEAD^:tools/include/nolibc/sys.h | wc -l
> >     1425
> >     $ git show HEAD:tools/include/nolibc/sys.h | wc -l
> >     1173
> >     $ echo "1425-1173" | bc -l
> >     252
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/sys.h | 336 +++++--------------------------------
> >  1 file changed, 42 insertions(+), 294 deletions(-)
> > 
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index f6e3168b3e50..0cfc5157845a 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -108,13 +108,7 @@ int sys_chdir(const char *path)
> >  static __attribute__((unused))
> >  int chdir(const char *path)
> >  {
> > -	int ret = sys_chdir(path);
> > -
> > -	if (ret < 0) {
> > -		SET_ERRNO(-ret);
> > -		ret = -1;
> > -	}
> > -	return ret;
> > +	return __syscall(chdir, path);
> 
> To be honest I'm still not a big fan of the __syscall macro.
> It's a bit too magic for too little gain.
> 
> The commit message argues that the patches make the code shorter.
> 
> However doing 
> 
> __sysret(sys_chdir(path));
> 
> instead of
> 
> __syscall(chdir, path);
> 
> is only three characters longer and the same amout of lines.
>

Yeah, I do like your version too, it looks consise too, the only not
comfortable part is there are dual calls in one line.

> Otherwise we would have syscall() _syscall() and __syscall() each doing
> different things.
>

Yes, I'm worried about this too, although the compilers may help a
little, but it is too later.

Just brain storming, What about another non-similar name, for example,
__syswrap() or __sysin() ?

Or even convert __sysret() to __sysout() and __syscall() to __sysin(),
do you like it? or even __sysexit(), __sysentry(), but the __sysexit()
may be misused with sys_exit().

    /* Syscall return helper, set errno as -ret when ret < 0 */
    static __inline__ __attribute__((unused, always_inline))
    long __sysout(long ret)
    {
    	if (ret < 0) {
    		SET_ERRNO(-ret);
    		ret = -1;
    	}
    	return ret;
    }
    
    /* Syscall call helper, use syscall name instead of syscall number */
    #define __sysin(name, ...) __sysout(sys_##name(__VA_ARGS__))

    static __attribute__((unused))
    int brk(void *addr)
    {
    	return __sysout(sys_brk(addr) ? 0 : -ENOMEM);
    }

    static __attribute__((unused))
    int chdir(const char *path)
    {
    	return __sysin(chdir, path);
    }

If we really want something like __syscall()/__sysret(), I do think they
should be a pair ;-)

> And __syscall does not behave like a regular function.
> 
> The rest of the patchset looks great.
>

Thanks for your nice review.

> Maybe Willy can break the tie?
>

If there is no better solution, I think your version is also a first
step to go.

> 
> Thomas
> 
> 
> Note: If we figure out a way to build syscall() without macros I would
> like that also :-)

Yes, but it is not easy to cope with the variable number of arguments
without a macro.

BTW, do you like to convert the my_syscallN() of sys.h to the syscall()
you added? I do worry about it will make the checking of arguments
mismatch, exspecially, the checking of number of them hardly.

Best regards,
Zhangjin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
