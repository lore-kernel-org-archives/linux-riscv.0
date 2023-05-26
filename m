Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E94AC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFWeaQhVVdwd+q6o0dtrxw3JiMG3/bIVxAFwCASTO6Y=; b=2GWLEILPzBxOg3
	PweC77xZC1DHMTRVU2nULovfb633oxQ6HHYXrOuBfm3FjG1b6dVBimmV3eo2lf6ZSGAHAXK69QbuC
	AukNvN92AGI1lXeZwIuVs9vYnTOoqx9dTv3qAGVXvc3ybHA3p67055sUDtYsTW7Zh9KxHVchptsKi
	44lFVzyRuIYLg0e/3ID6pJVDguE2v5EIeqWfzOpg81V8Gc3k5BF4pgXnvMSQBBzfKuRFZp6zj0FlF
	roL35mDRJc4v1CUJu7tYGTyXd/xY0hgIiaJWKgROjys2UdjRedGM7R08J+IqJK89UbonVy4OsHzNl
	iHnumZ8v/FbQBIkUKfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VBQ-002Cg0-26;
	Fri, 26 May 2023 11:00:32 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VBK-002CVV-1U
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 11:00:30 +0000
X-QQ-mid: bizesmtp73t1685098803tuh3o3nn
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 May 2023 19:00:02 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: UMQM+3VOEYubwFG4eTf0xraKgpRd5gWS2yEiy7v3gdEJXjTVfMxvBDdt0o0aW
	1MynBUjeWTGOOWpwfoHYEsUSf+xKPkA8TDsfcf0ZksxHbLMy1tZtGdGz3AnUOAPZzNmsIwH
	Pd5MxhuYRwOgOueKlRBcpnGzeOQeM+4LiFIM+NLXOsv1F4T5T8sCPnCqIT99yNWDSwt7qFh
	stJKJknwKPMHOePk0uTLVgAedqcqgQ6lmWDJKJkjDKohGvMYHoJEUsi8A15+fM3D5/7dmbH
	TfKPnKjCmO9Ge3phYQi4v6PvvbJpUJxAShi8n5IDd0lxB6s4xHOukhq+d4YO1jr3UFzwLYA
	XAa1E/0DiGdVqtStxOwkb43pskkqtTVoqOAXkkWTp22wG5vqQg6/iOx1ZLkYw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8105341843970772384
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Date: Fri, 26 May 2023 19:00:01 +0800
Message-Id: <20230526110001.150368-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bf3e07c1-75f5-425b-9124-f3f2b230e63a@app.fastmail.com>
References: <bf3e07c1-75f5-425b-9124-f3f2b230e63a@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_040026_797592_D6AADE1C 
X-CRM114-Status: GOOD (  20.87  )
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

Hi, Arnd

> On Wed, May 24, 2023, at 19:59, Zhangjin Wu wrote:
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index c0335a84f880..00c7197dcd50 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -1041,8 +1041,13 @@ int sys_select(int nfds, fd_set *rfds, fd_set 
> > *wfds, fd_set *efds, struct timeva
> >  		struct timeval *t;
> >  	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
> >  	return my_syscall1(__NR_select, &arg);
> > -#elif defined(__ARCH_WANT_SYS_PSELECT6) && defined(__NR_pselect6)
> > +#elif defined(__ARCH_WANT_SYS_PSELECT6) && (defined(__NR_pselect6) || 
> > defined(__NR_pselect6_time64))
> > +#ifdef __NR_pselect6
> >  	struct timespec t;
> > +#else
> > +	struct timespec64 t;
> > +#define __NR_pselect6 __NR_pselect6_time64
> > +#endif
> 
> Overriding the __NR_pselect6 constant seems wrong here, this can
> easily lead to more bugs, as pselect6 and pselect6_time64 are
> not compatible because of the different arguments, so anything
> using the constant after including sys.h will be broken.
>

Yes, thanks, Thomas also pointed out this issue in another reply of this
message thread, it has been fixed locally with his suggestion, it looks
like this:

    #ifdef __NR_pselect6
    	struct timespec t;
    	const long nr_pselect = __NR_pselect6;
    #else
    	struct timespec64 t;
    	const long nr_pselect = __NR_pselect6_time64;
    #endif
    
    	if (timeout) {
    		t.tv_sec  = timeout->tv_sec;
    		t.tv_nsec = timeout->tv_usec * 1000;
    	}
    	return my_syscall6(nr_pselect, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);

I have applied this method for ppoll_time64 and clock_gettime64 too,
this method can save several duplicated lines for us, I have prepared v2
patches locally for them. 

> I would just use __kernel_timespec64 unconditionally and then
> use __NR_pselect6_time64 on all 32-bit architectures here,
> but use __NR_pselect6 on 32-bit architectures.
>

The 2nd 32-bit you mean is 64-bit?

This is related to the timespec64/time64_t definitions as you commented
in another reply. I will learn how to use the one from
<linux/time_types.h>, it may require to clean up the existing files in
tools/include/nolibc/ at first.

> I think we can also kill off the oldselect and newselect 
> cases, using pselect6/pselect6_time64 unconditionally here,
> and no longer care about building against pre-5.1 kernel
> headers, at least for the copy of nolibc that ships with the
> kernel.

As Willy commented in another reply, users may want to copy the recent
one and use them with an old kernel, even if want to drop them, a
standalone patch may be preferable.

Thanks very much,
Zhangjin

> 
>      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
