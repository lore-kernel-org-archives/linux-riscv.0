Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A84DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EP8fIBHEj+E9us0QRjuNz2zPX+D/wuId9eN1hVb2WY=; b=5GZIXOGLTxJYHJ
	M2Rqm1QkHxQxlcLhsajSDjA+jDKMMeTo3iQJXBR2YiYuFxeRrgVcIiSK0x9m1gKzvU6mUhk/6gXe2
	5lihtYqFUWFgHFhIcXAU9wZyuLJGhBNCDgHMw0AYfuYksER1DN1oPOxz6+AVzXgieH/4F63KYLDz5
	objowwZgPP+6e3g2rhIq8pPCUNuCByheyHOnTo3sQX49UNA91rRxpbXEGEV7XRTD1mCrHTAxL6Pgk
	mx0cg9WhtFU+wvFqblyPQGu8bYgtqdUN+dhxdGbMVVndyz4MVWOWm934P3VwR6AMzzmuicoEmr5Z/
	qYp3xIK1oEo+Zo1ll2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEpEi-00BcUg-MF; Tue, 01 Feb 2022 09:14:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEpEW-00BcRt-Dy; Tue, 01 Feb 2022 09:13:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13436B82D1B;
 Tue,  1 Feb 2022 09:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED9EC340F0;
 Tue,  1 Feb 2022 09:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643706828;
 bh=hnac9oX2VXGbCvTtbNqKOCdN7oRwr6SWdV4YiEu9kyM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=osid9LTeTz41TprB3lECyF7yxevcSe3lIV4ZL99JzOMfl72MojScFC3KFSuxo0GG6
 70X7q6bsJNhjiYW4eYtM9zavsWFzGHmX86k9Ml9HGuOJ1orLTwnnB/8IKA1zhgYXgW
 hSlvL+cQdKAdDBSohj3VnNdOp8d4C22kdbe4qC69gelcFnJI7j5B49J5FTE04dedNl
 P/ryvvU3GDEs/ZJtT4weo0WgAKGCjVclvJKH46nYcgccaUjSCHheiE5OG55xQ15AO6
 Knswca+0CXvzLPDMd7M6D20RiLGupntu6utpPUX04UUDdi0VLzhoKrW0Nxf/6moTC0
 fgmqq3tGL2XIA==
Received: by mail-vk1-f181.google.com with SMTP id n14so9958475vkk.6;
 Tue, 01 Feb 2022 01:13:48 -0800 (PST)
X-Gm-Message-State: AOAM530U19W2eQse4T3gq6bB0USznynoHhgqCttgZQSM4+Nl+eDk5bma
 4uT2NkssZMlp8yLEh1ExSxFFcBLYaw1BodbvRTo=
X-Google-Smtp-Source: ABdhPJz8fzguZPbFnae5j7V9pl/dv5oQGM4hOb4aA5V9NpHM4cr9OW86mUtht2VbhtSN0zWJb+F+yH9GTu4P2KsI3X0=
X-Received: by 2002:a05:6122:1c5:: with SMTP id h5mr9895590vko.2.1643706827991; 
 Tue, 01 Feb 2022 01:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
In-Reply-To: <20220201074457.GC29119@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Feb 2022 17:13:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
Message-ID: <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Christoph Hellwig <hch@lst.de>
Cc: Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_011352_775495_2A889D47 
X-CRM114-Status: GOOD (  21.25  )
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

On Tue, Feb 1, 2022 at 3:45 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jan 31, 2022 at 09:50:58PM +0800, Guo Ren wrote:
> > On Mon, Jan 31, 2022 at 8:26 PM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > Given that most rv64 implementations can't run in rv32 mode, what is the
> > > failure mode if someone tries it with the compat mode enabled?
> > A static linked simple hello_world could still run on a non-compat
> > support hardware. But most rv32 apps would meet different userspace
> > segment faults.
> >
> > Current code would let the machine try the rv32 apps without detecting
> > whether hw support or not.
>
> Hmm, we probably want some kind of check for not even offer running
> rv32 binaries.  I guess trying to write UXL some time during early
> boot and catching the resulting exception would be the way to go?

Emm... I think it's unnecessary. Free rv32 app running won't cause
system problem, just as a wrong elf running. They are U-mode
privileged.
>
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
> ---end quoted text---



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
