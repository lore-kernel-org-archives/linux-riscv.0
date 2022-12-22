Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56839C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 21:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGKq0w8kblk5ee7L1yNKJaID4sc0JYxFDzVQjwRZYww=; b=00bL7h5/rnxtCr
	zBQneo0rmPgj29DReolaUZfWcJ3P3MIH0nu3kupRQuBHzUywlTm3KXiXeXQZnLr5cHNCKdOQEOyIV
	Hf78/4djUrvm36/4AE5xoJ+9vs2tsQnFgIL/82gSp7D9GR8/OXtLzpdObqkL3phrMOmQSpzE8Ygno
	0yT8B2bny/LW7w+OhP+07koU6egBpFavqQ61Rikfn6W8l34vvOACpLFYCgiRAOqjPo7x4uSflNx01
	yi2YK59/8PZUF17VoMcCDcc1A8VPaESGQcyVbLpkbaOfYmf+pz1Ynn8Z0LZd4Ct2ZENR5npGmECeP
	+3AIKn0O/PgAMubH33vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8THu-00HOJy-87; Thu, 22 Dec 2022 21:39:38 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8THX-00HO7a-FT
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 21:39:17 +0000
Received: by mail-qt1-x832.google.com with SMTP id c11so2389669qtn.11
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 13:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBStxdfWa87rgGRrJi+qh1v8+8qqcljLsz7FdxpEw10=;
        b=iCnRGawe+pF4bJLIVlr+wtODw1QLs498Ud6+Uhm5f0Oplaqi/FJjTKt7gpcqqZcCkP
         lF/17AQMbsN1Ka17PkFTybBCoU3PGrp+DVliy2nRQz9OqCvjFpkRNLcNt0pjTaIIqexQ
         bSFFhXED/4hwp/DtNJs4BLsTmtCb26nzjPmWoYecJe1J8kh9+VjFLhxIKaoWzYtRrzea
         He1Q6azusoOExeqQWJgQX8uHiwgus8kE8Lq0bJ7uhLuN+3p9kkAJwd/7PtJeuZuo1VZ/
         xTILV13eiAgWLnKSwYX+URIH0sef4S7I6g2JmhLDDQlHdDJG979n9Txt+VK0hGmTq9hL
         YkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBStxdfWa87rgGRrJi+qh1v8+8qqcljLsz7FdxpEw10=;
        b=Xs5BEYv0MTQaaCy4o7ZM8ggnwLt1fhL4KgOc4CsN5DlPws7zQNKGI0ZCZk4P+G3AmQ
         a1egmJB96ICtl8Ee5QSEa+BHrJ3c1EFQMDOHviXc2OOKAbHuTwOy7u9HfOLmgaPvn0qS
         ABZvhaVcBilpnqayddfKQV4RQ+nYdV64XdxriPpTFWP6dbZC+S+uBf51qw0HGANj1At8
         T+W8xgunOGbLdoHiq1s+W9zKMBeJDSQCMocDVsyD4J/bxtGHLweC5BrlFUfGtHz0hstq
         4BivpLnr4zPG6cudpbe1gguUvEVEkHdQr8SAloNTvvAmXPc7a8VjU7X0uxiZb5sDsIgQ
         088Q==
X-Gm-Message-State: AFqh2krSS4UcXQJfkuhye0pNgnJVjRiu6ZH67FXz8yTPtb/TKV18mALV
	QJOuS425WOPVJqs/LZa+rjwKsvHhChgINMaO6I7fDDdvsatB36e2XMCXcz6jYHIwxZ3mO/DALef
	IFlUpW0Ce46Zc4IiSleF2C0m85DfHuHOzywM+P5hyRUFd9STJkQ80jBGLQr0UyNIZV1wI5IJHKx
	fwoqmEIA==
X-Google-Smtp-Source: AMrXdXvsDUnvatj99tzoq0Oqv+qLRaO4TXUF/DjNtQ9R0XOWKiWkwxLYff1hnI6I1Usb+DtmX21Yyw==
X-Received: by 2002:ac8:7ef7:0:b0:3a7:e2a1:331f with SMTP id r23-20020ac87ef7000000b003a7e2a1331fmr9721960qtc.7.1671745151261;
        Thu, 22 Dec 2022 13:39:11 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id u9-20020a05620a430900b006fba44843a5sm1018323qko.52.2022.12.22.13.39.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 13:39:09 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-45c11d1bfc8so43002397b3.9
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 13:39:08 -0800 (PST)
X-Received: by 2002:a0d:d883:0:b0:3d7:28d5:1c6f with SMTP id
 a125-20020a0dd883000000b003d728d51c6fmr516201ywe.227.1671745148129; Thu, 22
 Dec 2022 13:39:08 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <6b79d32c-2e59-09b6-2132-4b99e2a8923e@rivosinc.com>
In-Reply-To: <6b79d32c-2e59-09b6-2132-4b99e2a8923e@rivosinc.com>
From: Andrew Waterman <andrew@sifive.com>
Date: Thu, 22 Dec 2022 13:38:59 -0800
X-Gmail-Original-Message-ID: <CA++6G0A8eGmaT-YFgJBqokrMYNiP9SOkTLL=8ucCMBCF=Eqhwg@mail.gmail.com>
Message-ID: <CA++6G0A8eGmaT-YFgJBqokrMYNiP9SOkTLL=8ucCMBCF=Eqhwg@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Szabolcs Nagy <szabolcs.nagy@arm.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_133915_575910_30DCE184 
X-CRM114-Status: GOOD (  21.40  )
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

On Thu, Dec 22, 2022 at 12:30 PM Vineet Gupta <vineetg@rivosinc.com> wrote:
>
>
>
> On 12/21/22 21:32, Richard Henderson wrote:
> > On 12/21/22 11:52, Vineet Gupta wrote:
> >> This is not an issue, if we don't change sigcontext (in kernel and
> >> glibc) - it is essentially the case of existing binaries. kernel
> >> still saves regs on user stack, in
> >> rt_sigframe, its just that userspace is not able to access them in
> >> SA_SIGINFO signal
> >> handers. aarch64 have this implemented this approach and it is likely
> >> they can't do
> >> that either for SVE regs.
> >
> > aarch64 can certainly access the SVE regs on the signal stack.  It
> > simply requires that you parse the chain of extensions within
> > __reserved to find it.
> > It's quite well designed, really.
>
> Yep I've been staring at it this week and really appreciate the
> extensible design. Indeed one can do thru the existing __reserved in
> sigcontext to access that from userspace.

Sorry y'all had to reverse-engineer our logic: this was exactly our
intent for those reserved words when we defined the current ABI.  It's
also why the current ABI requires them to be zero: as a sentinel to
signify the end of the list of extension areas.

>
>
> >
> > What you can't do is "only" declare a sigcontext_t and be able to
> > construct a new context, nor copy the entire context via structure
> > assignment.
> >
> > There is room within the risc-v context for a similar scheme, via
> >
> >     sigcontext.sc_fpregs.q.reserved[3]
> >
> > E.g.
> >
> >     reserved[0] -> magic
> >     reserved[1] -> displacement to "extension area"
> >     reserved[2] -> size of "extension area"
> >
> > Thus the area can be located anywhere within 4GB and expand to 4GB.
> > Not that I'd hope any signal frame would require 4GB.  :-)
>
> Looks like we almost missed this. Thx for the pointer Richard.
>
> -Vineet
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
