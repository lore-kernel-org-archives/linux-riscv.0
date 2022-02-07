Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B2CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7hzuKiA7fM8cRaQi/0cbFqCwNJdwF4wuSQP4EbugYw=; b=fhrXHSJKjE1BPU
	kKF0OnMVjdR+cMAHAYIu1/OklS+hPwDQQ6V5BcEj+QCO26RojZWJEDuShFhKkDUUa2HjZ0hRwnU+c
	r7IZWpzuVPq+UxBmgmfnF5d8NVZJXJ2eVZv+V5gvbmVW0UEHAP3m5OUELsdg74rXwgwkwYkOq3L3N
	CnS2wdWeGqKwpi38GFriloUYj0Jvdf+kzj4KewJYUN8xHtMiKj6MwdImXuzvk+C4H5hkgr3OcDjgk
	0P9BHECTmaVp4mKT1oZf7ssuslf6uaGIxFEmyQd1ozpRVV0fZeZ6tqkz+1KkJ9YZ9QWIv7PbH8tzD
	Iu7V1IeEO9s+sX6MNZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH00P-009UzH-GC; Mon, 07 Feb 2022 09:08:17 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH00M-009UyN-Aa
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 09:08:15 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MpUEO-1o6YQZ49Vs-00pxPh for <linux-riscv@lists.infradead.org>; Mon, 07 Feb
 2022 10:08:12 +0100
Received: by mail-wr1-f41.google.com with SMTP id s10so20866529wra.5
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 01:08:11 -0800 (PST)
X-Gm-Message-State: AOAM530bLn+ONwHQDao7QIxw85ZEhJrvBqIV+oWEv7tzCVIHmGF1iAad
 mPZTHcOge7yeH/BB7Bl+81GyCTTTQlMdVHD9qXw=
X-Google-Smtp-Source: ABdhPJy2OAsF40cRhp1hQ7PY7Unl0deCaPSYBDIEWOpw8v3CO2PPO1fqgQT5QBnVuSRSgX6rbfXRrkb7Q4LqWG3ZD10=
X-Received: by 2002:a5d:500c:: with SMTP id e12mr9133772wrt.219.1644224891245; 
 Mon, 07 Feb 2022 01:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20220206174359.2986-1-jszhang@kernel.org>
 <CAEn-LTrZwq1-6F8PWScGPp1TRk1eaB-7qOrvPjyLhK=OzDTQBQ@mail.gmail.com>
 <87bkzjvzpt.fsf@igel.home>
In-Reply-To: <87bkzjvzpt.fsf@igel.home>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Feb 2022 10:07:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ncwMz-yngiv_waYYNBydveLrhX=kEfWC_hfonHZ7k4w@mail.gmail.com>
Message-ID: <CAK8P3a3ncwMz-yngiv_waYYNBydveLrhX=kEfWC_hfonHZ7k4w@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:rzJ2VOCXY7drbT4/PyYBwztCESOhaycJl8SMSFlywkThHPdjzeE
 3vwjVd4iOoKlbaCFgdBtl9UbYHvsUgiOYoz68vDjKerhmc7jdg8sl2ET7FDLEWKtqtQSX1N
 oNPyAQARqJ2PM9Wu7Y8ypcuDlU6Smn2Emhz4fbN4DMhnmLydvAiBGGgmm9LGDXqEVXq0oXb
 MVYp6wwURYMHZ3hmNA7Qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xWkFI1arQi8=:xmChBnFhpmXq7CDIl9pobw
 c3j2eJQ3Bye6JeCk+HKivbCv9S6nfhR4N433myMmUOvd+8aTWgdReepOffU4FNa4t3ODHxMex
 rn5OvVONM6G0/zzUXIlR34hLSjyL/ExFZfqVt3Lh6QD4CGtW56CR3JZEMcrmyIQ1FJVIjqirv
 CjzFq0AW7r6wPMEWdA093OatA8DoGr3zjjan3SYX2QBufERQovjHhtuIMxh7yWq4lRt85sfsJ
 l7ZmZSJgvF70+GlkuBt6vv/QcXb1qTv1t+D2N64KtxoVFrc/Kj3hhUz8oXimsr/BSHvImPE/B
 5e4lUZYV69OxiEpufNwISvJoCGOYxIYjunf+EGSVgIjQpFxdWaXNuXzS2S+Mi3vHV6d3tu6op
 33XUbq7jX8Uc8x+M3L2K+CaP7aeVeMxR+GcppyNGJUNuZ4cQ1LeIol4SjFp6PohJozZhPSJuY
 zxWvMpghc5TTsui/MMNNa0//xvjtvTS3I0dMkGNCUObnmr1fnyl2Zi5AonhiVfH08cAF3lDm2
 ix+gDamomIERAjKubLrpzTMyVFJULgKUy8OtOyk/vrkZAOFMUqhxZ3w3C1QkBUgp8tjU0cXhm
 H0ogBMeAY7k3vsVmv/jtUejaGDXy5Jfaq3Wtj6zk5WfZOXKq5BoGMHWhe+Ynu3PZ5qDa1ingc
 vFTrPgo+yws5TAH+es4OTLOiteXA7b4r5RFfAdUi2AMjSB5zyhfzb/w7v2xFZnyZsW5HYnP2c
 n97vTaSrDRS7BRc7/m33k+tSJ6qiL+8rw6dng608qSErJlwwSOvJr6wxJa8GeR3veVgP5ptcs
 oNYBEJDcHJx2piZUSKsYczVRgPZ0QZ6OzHj8ftAhCUbUtlt9CI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_010814_684274_9692AC8E 
X-CRM114-Status: GOOD (  17.33  )
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

On Mon, Feb 7, 2022 at 9:38 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Feb 07 2022, David Abdurachmanov wrote:
>
> > On Sun, Feb 6, 2022 at 7:53 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >>
> >> After irq stack is supported, it's possible to use small THREAD_SIZE.
> >> In fact, I tested this patch on a Lichee RV board, looks good so far.
> >
> > We went from 8K to 16K somewhere in mid-2020 on riscv64 because we
> > were seeing some random crashes in various distributions (Debian,
> > Fedora, OpenSUSE). Thus we matched what other popular arches do, i.e.
> > 16K.

It sounds like 2020 predates both HAVE_ARCH_VMAP_STACK and
IRQ stacks, so I would say that it was necessary back then because the
crashes were too hard to debug, but it's worth trying again now at least
as a compile-time option under CONFIG_EXPERT.

You need VMAP stacks to reliably get a backtrace out, and you need
IRQ stacks to make overflows happen reproducibly (and less often).

> I think NFS is one of the worst offenders.  I'm running an Unleashed
> with NFS root, which probably amplifies this.

I think there are a few others that can be equally bad, and some of them
might stack on top of others, such as swap over ecryptfs over nfs over
an encrypted network tunnel over infiniband. In the end, you just need
one badly written driver, or a compile bug to trigger it, and we have
plenty of both.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
