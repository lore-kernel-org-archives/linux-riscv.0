Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90448C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 14:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58F8061493
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 14:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58F8061493
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w12itQs4HnlODsLXc9oVJBGehsLlgdl6QT/e2JAjjbk=; b=BMYw09a0yXD2pG
	7jwpaAH92/b7UROLtLFKbKQqoF2UZ+E0uCohe0iw5rZub0lxgClisJ1y1ZsHEU9TFy45bjZnMRjgK
	yiwkTcn63I1YIDaEfD8ONbAr+TOdVpkmW5zJ/Dhzmo54S1N3LYbAj/9vklt+Pum8oeha7cYbZ15Pl
	i4iSreaoCABuiYa3Jn7TSa5PeYuQU1hOeMsn3Ma8Tvrie91N/TZkSw6+8Q520rezQ+/7S8PUJcmjH
	za44V4uJRcK2qDLYhPBoBOoebsz8O/Z90kE40BV6kjwIMiF53/0JOZlCYhUwdoheOBhpzbQps1nzV
	j2KBmMpUhPWhDL4G3fHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltA1R-000Zz8-AO; Tue, 15 Jun 2021 14:26:33 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Il-000FC5-E4
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 13:40:25 +0000
Received: by mail-yb1-xb30.google.com with SMTP id h15so20480536ybm.13
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2bninJQzLYLiLyEZnoHibEA952wacAzi8eRw8B/sbgM=;
 b=tkEyXCty7/BpQtj1Wvr1kO/TdoIz6mfhYnF3xuyQct2w+VqmXOP2h3PVtbFkvEUcvb
 bT0GUBP3kcNDI9NxSzrz7jhTknQeri8H8fYo0+dqQekekc+gwvf1M2HFQOO3pnv83FGw
 wA1rrCc7UrQITnD2vSl2xlSpIkopCWvSQVXdmR3LNBGl23pl3ZHknYF2wZqH55CFKKpN
 fn2q2NOfgfw15qtqduaa89gLfbMN08bddIqkh0LLWBLve0GnyBURHAocpQCdIowF0GIl
 AnoIB3AvOL7h53cZNkrvY45oe8pVJBD1L1O1mutkMLc8f3miUh6E7TGtZpuCeBX37dN4
 dRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bninJQzLYLiLyEZnoHibEA952wacAzi8eRw8B/sbgM=;
 b=N/RepA7ttNPQid4QBUiYZ8nXAbptCNtTQTPWY9dW0zRwqnLdfr9qa0cHgvj+3j2Jcd
 Du1TJvnYudDn+R+AXdCsN3e/uw/EMmljVkefq472tqG03+X3NPaZ83oe0YEi3AjPwYsi
 7Yr+C/SeH2U2VDLOpABL4790BZm8gFg3YHXUYt6gqw/43iuZSUzAPgIS7Si1U9G6S5vb
 qD+pMWER04EdSJwEZTaFqHqIqy8Kl0GZF7qb+R/dYQBcPs8SpLNt3OrKHNvnxMHI/1m7
 MJrsbEo0TXV1AHeKNN3iWBzVfGgHBfWTFDe0T7LAomVjyV58ZU/Mt9QPRxKz0vzxn64X
 tOgQ==
X-Gm-Message-State: AOAM531Mc8I+/22RNXQuxTMSQdQCnNXLbP6J7DjPKDc0bpIoqoWD/TkQ
 Ik8q0HynOc1+mWFoGHpSo4hZLHVJDz8/1Qat643CA1uLSJw=
X-Google-Smtp-Source: ABdhPJyTm2ZJXQyVMUO7d5Y5CMDVt9qLpiRiCe7z8HVFKMkCu1YnhvD6pp2syW7qpbTCcJlgi7aCj5QHIIb3vk3ptiI=
X-Received: by 2002:a25:b701:: with SMTP id t1mr22019966ybj.517.1623764421204; 
 Tue, 15 Jun 2021 06:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210522232256.00003f08@garyguo.net>
 <mhng-fdda10f7-fc83-4654-a0b2-e9c86b92c37e@palmerdabbelt-glaptop>
 <17637b10e71b41b89126cbb1b2fa61cf@AcuMS.aculab.com>
 <20210525153431.0000508d@garyguo.net>
In-Reply-To: <20210525153431.0000508d@garyguo.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 21:40:10 +0800
Message-ID: <CAEUhbmXvYdVSsY3oH=XdyT2fOC1X9=-Rh0P1Q5TP1DcmzFfRrQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix memmove and optimise memcpy when misalign
To: Gary Guo <gary@garyguo.net>
Cc: David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "nylon7@andestech.com" <nylon7@andestech.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_064023_582108_3EF01662 
X-CRM114-Status: GOOD (  37.22  )
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

On Tue, May 25, 2021 at 10:37 PM Gary Guo <gary@garyguo.net> wrote:
>
> On Sun, 23 May 2021 17:12:23 +0000
> David Laight <David.Laight@ACULAB.COM> wrote:
>
> > From: Palmer Dabbelt
> > > Sent: 23 May 2021 02:47
> > ...
> > > IMO the right way to go here is to just move to C-based string
> > > routines, at least until we get to the point where we're seriously
> > > optimizing for specific processors.  We went with the C-based
> > > string rountines in glibc as part of the upstreaming process and
> > > found only some small performance differences when compared to the
> > > hand-written assembly, and they're way easier to maintain.
>
> I prefer C versions as well, and actually before commit 04091d6 we are
> indeed using the generic C version. The issue is that 04091d6
> introduces an assembly version that's very broken. It does not offer
> and performance improvement to the C version, and breaks all processors
> without hardware misalignment support (yes, firmware is expected to
> trap and handle these, but they are painfully slow).
>
> I noticed the issue because I ran Linux on my own firmware and found
> that kernel couldn't boot. I didn't implement misalignment emulation at
> that time (and just send the trap to the supervisor).

Similarly, I noticed exactly the same issue as what you saw on
mainline U-Boot SPL that it suddenly does not boot on SiFive
Unleashed. Bisect leads to the commit that brought the kernel buggy
assembly mem* version into U-Boot.

> Because 04091d6 is accepted, my assumption is that we need an assembly
> version.

That's my understanding as well. I thought kernel folks prefer
hand-written assembly over pure C :)

> So I spent some time writing, testing and optimising the assembly.

Thank you for the fix!

>
> > >
> > > IIRC Linux only has trivial C string routines in lib, I think the
> > > best way to go about that would be to higher performance versions
> > > in there. That will allow other ports to use them.
> >
> > I certainly wonder how much benefit these massively unrolled
> > loops have on modern superscaler processors - especially those
> > with any form of 'out of order' execution.
> >
> > It is often easy to write assembler where all the loop
> > control instructions happen in parallel with the memory
> > accesses - which cannot be avoided.
> > Loop unrolling is so 1970s.
> >
> > Sometimes you need to unroll once.
> > And maybe interleave the loads and stores.
> > But after that you can just be trashing the i-cache.
>
> I didn't introduce the loop unrolling though. The loop unrolled
> assembly is there before this patch, and I didn't even change the
> unroll factor. I only added a path to handle misaligned case.
>
> There are a lot of diffs because I did made some changes to the
> register allocation so that the code is more optimal. I also made a few
> cleanups and added a few comments. It might be easier to review if you
> apply the patch locally and just look at the file.

I would vote to apply this patch, unless we wanted to do "git revert
04091d6", but that would break KASAN I guess?

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
