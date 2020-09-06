Return-Path: <SRS0=OAdJ=CP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E3C43461
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2020 22:15:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A49E207BB
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2020 22:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QjfmHc3S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A49E207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+n1lZnnknvKx+wFOrBSLfpv/tH5ULopVfF9skTaeDY4=; b=QjfmHc3StdUssvkLIyAGGzBNN
	xFaSd0Xv9D4vLrlBBAODAzfxdrzw4DFJ4SToZtUdFQ0DQWJvosjR7GVelrvju0cX4scdfAIGHJR/7
	YtGW9f7Ks8XK27xzNBk60Wd+R/V6ohG9AmpBn05oRi+aN29bsnbS7YCyo6AQAL1Lk2WNMNAQ8yNxF
	/QQGh/jqJN/6bBr7eidQISAs1ZW9qQzLrXBm6CxzTqBxx4M8+0jiATg7o9CzR4uKrUR65tZDNJhi9
	cqn5aMvNP2poJuowM2GdQFyjarC9BgEp/tHeQsjsj8DaeQ7XKBUMRYEG9mlbBXgBXAhPpO+u4OhP8
	N2FjuHl7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kF2wX-000155-PA; Sun, 06 Sep 2020 22:15:25 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kF2wV-00014S-Ak
 for linux-riscv@lists.infradead.org; Sun, 06 Sep 2020 22:15:24 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mcpz0-1koviw2lzG-00ZzIC for <linux-riscv@lists.infradead.org>; Mon, 07
 Sep 2020 00:15:16 +0200
Received: by mail-qt1-f175.google.com with SMTP id n10so8746412qtv.3
 for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2020 15:15:16 -0700 (PDT)
X-Gm-Message-State: AOAM532MHxGEtJiQpic/E1AxDNJ2C1SZB7DTxtKdOWLLHRd1U9Nu1vPp
 QFrB+UafZ9UnBOFhvm4usDm9TszSMVM18HcZh4c=
X-Google-Smtp-Source: ABdhPJxwkpjvN/x7Qacu70mZjFWP8AmaMXUiYeZRlF/0mV8kkA+fzaouJtHyixrWIYKaJPrJakvGRGbLSRz/4O5f8dk=
X-Received: by 2002:ac8:5b47:: with SMTP id n7mr18419344qtw.7.1599430515531;
 Sun, 06 Sep 2020 15:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165216.1799796-1-hch@lst.de>
 <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
 <20200905071735.GB13228@lst.de>
In-Reply-To: <20200905071735.GB13228@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Sep 2020 00:14:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3BN-Afy4Gj+mGjxiKODUBZwjh+XRbXqQKV-uEhyhOTfA@mail.gmail.com>
Message-ID: <CAK8P3a3BN-Afy4Gj+mGjxiKODUBZwjh+XRbXqQKV-uEhyhOTfA@mail.gmail.com>
Subject: Re: remove set_fs for riscv
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:z4fJ30eqWYZLBgWMUp1MPM+omwc+U4exmbmze4VxfNj7pcThlkd
 nEA+AxM0jZ/g3Ex8tUFHgmLuPIK7BR8uIK0nVWza38L8d3ptBHe+UoLz6k2DvG6vo3qoSJH
 Ro4c7V57gqsOyfBIzSOrWhHnthRTTQmdd1cz314sqtViwJX6tMTSC3hAxjXY0LWwqCeTm9T
 uqeVjesVmELGZseplcfdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LdwDeb19eJM=:4XCyKomJ8xChxzXLsPkWI0
 85ii/2efkaw455B8ZgUr/fUYjeSOAn6OfVzp9O9Aoxqq1I9HHjlRDJz9ZSOMvCxUIVHUEkV24
 3zq1NoxlAwq8KDtJoiWGexRrwP41MLPboKWbBGP/CTYYZOIzRmADV41ZiOz6ptKx2CuFXYFim
 caTWQhmpe6kZi3lf6w6Ygg5BgKxkwTpOGRPXhpzgmoL1dq+H/GrwOYEjzd8+rucatqX4dSj3H
 JSIovQbg3hkVR7hO6cVkcmoEABf++QdA8cmi5bizExALkOU4BQjXEusTmdk8/u9d3Pg5P87mI
 yPW8Eh8RvDvg5xze04b6YC8peCUlizCB+/bkOPBgd2X4iXIjuQQUv+cycYJ0U4uqnPQWQnsv+
 JiqpSkA7JrW56Q9C3fyFstKyIm5BK5eCL92oeNAI58MOG8cqYds6eg82zwqhWDyCYglH+tM6O
 DViKcThwM3dqKHrIrb8QvaZu+pM3oIaHI+wE7A2bzlImdni7AVkb3uH1Zzw8HQzzQmDYkKbPJ
 oQSLqE2jdtSyQOkBSrYCg87zJBJJ1gWTQxkWOpYuHotSqGqEsKTHFkEu6RzDc7WxYk3L7HOyO
 ium7eQlIzIGALgAtBqbWXByyA1YBdUzhPaCe/YMpNxiSafF814UBNp3vuaWRZcOTFcPx7Xj6Y
 jlMClkBQIXOqGDdTBNP4E23ubV071E7uc+Bor5nHbCNcROZsrW8XRqtmCIUcOodzZdRXyKgxc
 xE+9YyzECRUkH+1aKUw2nLopB2SqDkhfoEuhd5IPt7r37rknpbLoc6EsBOxk27sc800xR9Xmj
 INSgroqvFr47virQmURMsr3DZ8lCYnmBbCOMLydKh8dStCIx2B6TbnzFkYaWw0I/UDymeVT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_181523_566415_5D0F0A86 
X-CRM114-Status: GOOD (  17.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Russell King <rmk@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 5, 2020 at 9:17 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Sep 04, 2020 at 08:15:03PM +0200, Arnd Bergmann wrote:
> > Is there a bigger plan for the rest? I can probably have a look at the Arm
> > OABI code if nobody else working on that yet.
>
> m68knommu seems mostly trivial and not interact much with m68k/mmu,
> so that woud be my next target.  All the other seems to share more
> code for the mmu and nommu case, so they'd have to be done per arch.
>
> arm would be my first target because it is used widespread, and its
> current set_fs implemenetation is very strange.  But given thar you
> help maintaining arm SOCs and probably know the arch code much better
> than I do I'd be more than happy to leave that to you.

I've had a first pass at this now, see

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=arm-kill-set_fs

There are a couple of things in there that ended up uglier than I was
hoping for, and it's completely untested beyond compilation. Is this
roughly what you had in mind? I can do some testing then and post
it to the Arm mailing list.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
