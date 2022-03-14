Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E0BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4agQ3/S7jtLuCLgkgvW2UqM3jCbRYX9Bs3nEXKZ4jYA=; b=aaUe57WghXO+cM
	HPctHMeU8y73rP/HFTyxuHpx8/PyRpTuJ5PEfJ3fVAefph61f1P/HU5w9FvlrOUTNIwntGxUzX8Zb
	qPcWfzTnP09qb4TuZaEr7NwHGNQzd3srmPcdsSOAEsP1MJwRLy8e8Vpit03kndCBpJnFgT903r4kN
	OheGnR9rAAn3Ajk8xdJAkF2SIGDEQzVC5S6BeBBnsgEiYI8IkxBpSv1TA9gXNwFp1i7s3ns47Ji/2
	fBCpq1ITX4G/srj3eXwte9hHpu1fZlR+yLtIt+6Q2Q/WnENi0V9dJKguxfPnoRJdQIzkbfuJq3qDU
	wR4H2JxgW6RL/7G/B8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTjS0-005KHY-Jh; Mon, 14 Mar 2022 12:05:24 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTjRw-005KFr-BU
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 12:05:23 +0000
Received: by mail-oo1-xc34.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso19868098ooc.7
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pU9uPGpxANVVIsgcKvz7K/tE4whMaqHpIgoLY54UlzI=;
 b=fFBE2zBqOW+xujSQr8CaSD78WW9sRE+zJEFn/EDFTxjhCNW8VpKV1g41OMj7TiyZAu
 iUBbomn/izP5EZEVMdsumuc+XGcHrI8+CXNdDRIkO/IfB0/qUbYNEEnFtwHIise1Q/vA
 wauwo733B8lvPOUUr/EyBpPbLxW4CdGY2FGT8DD9eMEI2XpqTLLU4UDnKSY7A4ZNgfcW
 czck7SIybF6Vq99KSErtsu6tlPRmIJZ4X8fXMdfTxDQKKi0RplLWE/fkatQ+kuc13vzF
 +1hkviP8Dl/j26McxJW9pXn3pNPfA/SHfFoX8el8wOlQsg/YzI8NJi3rImz7uoTq1EfH
 HREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pU9uPGpxANVVIsgcKvz7K/tE4whMaqHpIgoLY54UlzI=;
 b=uFsXi8vEUnZjUWEDf689eu1uVj1umV5flpluo4PQDwC04vUxBsT4adWjFJPJ3hbaMx
 TdiOZAWuhuBaCoRQ2RTncWMrg7EFNkHfM+aX14aSOsHiPTI9a8ZDwVbd3pXNVCEYZHzo
 7wN62edwDtg4xrAldUFiSvvluHaKpQ4kfvC1ouuNLNsiXAWxHWVRKsGRp8HoDfMDYdaS
 +8OJZ8V/w8MPDVfG3Ha7+xVb9LRW3+ypl5mScvxEaZCKCLdO/E0Zi34verkeO6LWjf5i
 BIRTq10FBk6Muw6+7h6G7e/b/3BawSF9VHgobu50q103YOli0S2B7eer4MB3EyY4mpym
 qnzA==
X-Gm-Message-State: AOAM533XStQuH7ngoumU5htLsXN1eBT29pZKyFhmJMdql74lxDud4eqK
 AOACwmlpFGFLgi8wX0JZ1DjxcFLTBzpSV5jDVE5W9g==
X-Google-Smtp-Source: ABdhPJw1RA8znJT/hN+bAS4MYap2EO+2EYDpBtnfmfEOGkxzFMtWAaxnlgzhcuEKmiInZcwpRIjPFkYbZvZ8lhZbGiI=
X-Received: by 2002:a05:6870:d254:b0:db:12b5:da3 with SMTP id
 h20-20020a056870d25400b000db12b50da3mr2285214oac.211.1647259518800; Mon, 14
 Mar 2022 05:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008ec53005da294fe9@google.com>
 <CACT4Y+YXzBGuj4mn2fnBWw4szbb4MsAvNScbyNXi1S21MXm8ig@mail.gmail.com>
 <CACT4Y+a1AvU4ZA3BXPpQMQ15A2T0CT_mrNTXv0NttJ0B06fH=w@mail.gmail.com>
 <fb12b19d57c34928895e0faa8067f64c@AcuMS.aculab.com>
In-Reply-To: <fb12b19d57c34928895e0faa8067f64c@AcuMS.aculab.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 14 Mar 2022 13:05:07 +0100
Message-ID: <CACT4Y+ae7WRhnmiTuFg6zrL7z_8rUrmWzopOGMZv6f0ONmd3yg@mail.gmail.com>
Subject: Re: [syzbot] kernel panic: corrupted stack end in rtnl_newlink
To: David Laight <David.Laight@aculab.com>
Cc: syzbot <syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>,
 "dsahern@kernel.org" <dsahern@kernel.org>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>, 
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_050520_429979_23BA9DBC 
X-CRM114-Status: GOOD (  12.78  )
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

On Mon, 14 Mar 2022 at 11:44, David Laight <David.Laight@aculab.com> wrote:
>
> From: Dmitry Vyukov
> > Sent: 14 March 2022 09:09
> >
> > On Mon, 14 Mar 2022 at 09:22, Dmitry Vyukov <dvyukov@google.com> wrote:
> > >
> > > On Mon, 14 Mar 2022 at 09:17, syzbot
> > > <syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > syzbot found the following issue on:
> > > >
> > > > HEAD commit:    0966d385830d riscv: Fix auipc+jalr relocation range checks
> > > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=17fe80c5700000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=6295d67591064921
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=0600986d88e2d4d7ebb8
> > > > compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for
> > Debian) 2.35.2
> > > > userspace arch: riscv64
> > >
> > > +linux-riscv
> > >
> > > Riscv needs to increase stack size under KASAN.
> > > I will send a patch.
>
> With vmalloc()ed stacks is it possible to allocate an extra page
> of KVA that isn't backed by memory as a 'guard page' so that
> stack overflow faults immediately?
>
> Probably worth enforcing for KASAN builds where the compilers
> have a nasty habit of using lot more stack space that might
> be expected.

Yes, this would be useful. At least for x86 we use and rely on this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
