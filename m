Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA400C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prbnJaHzRyiw8gmI7rr80pDw08Y5I9zr7jaNm6wMevs=; b=NhkcfaASOgrhQt
	FnTIHKoWdJgzmjgoL3FghK5Hj9yx17dJT1AB4HZ0a7CG3G+95HGTiu6Fq/5Z6NRJFbMOalWQwFjdg
	+WHqJdsThd5sDBg3NzlODnODgKODdXYbxm71AaZRBdUEkzUvO6IhjQeEnRoQZG4VnFwzUtx0rRIHH
	w+U/VmxWNwTdhD/rdvnoiD4hkKCmN+dchvYCXDjFIs/g5LSPtDoubDW+giDVF1REZNTRj5soDENYH
	t5OiZo0A21f43uPlhCwGg5Zu/2VHIITyT17aRUitVqkb4w4/vWM98OO8j3t6DOmehtOQMQErDahv3
	44IhUqgwvh8f5AAAHKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAYt0-00C0F8-7e; Thu, 20 Jan 2022 14:58:02 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAYsm-00C09s-LN; Thu, 20 Jan 2022 14:57:51 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQMdz-1mx0DA0iNF-00MOl5; Thu, 20 Jan 2022 15:57:45 +0100
Received: by mail-oi1-f182.google.com with SMTP id bb37so9266729oib.1;
 Thu, 20 Jan 2022 06:57:44 -0800 (PST)
X-Gm-Message-State: AOAM5305b9oocwL+CVvcslr31T8QH8WLgRL+rKidpgx+cmMplCsQu6Y/
 7mTdJuB/a2d+aQBZViKoT6Z8TvK2VsPFlftqT+s=
X-Google-Smtp-Source: ABdhPJwjtLdN6iyHNeRuxhdvl9Y6OeJzbUgAsOZS1tuaBlnRH/pfBDfrQe9jdzUZRHtHuLOgUQesyOgPAeGaNPDH+P4=
X-Received: by 2002:a05:6808:9a:: with SMTP id
 s26mr7926312oic.108.1642690663723; 
 Thu, 20 Jan 2022 06:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-8-guoren@kernel.org>
 <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
 <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
 <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
In-Reply-To: <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 15:57:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3FLnqibdXCGR8c+mm92HSiuvocZDeW8MyoTO_L1sYT=w@mail.gmail.com>
Message-ID: <CAK8P3a3FLnqibdXCGR8c+mm92HSiuvocZDeW8MyoTO_L1sYT=w@mail.gmail.com>
Subject: Re: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
To: Guo Ren <guoren@kernel.org>
Cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:vZNR0yE03rfU5Ig3wBZGcTyND9mmulccVaR8rW3eon3WAcQ8t4B
 d2lbPDz5Il9zrpqHY/qx5SecxZf1AeG2GRQ9wcQIhsd1sDQ+1ih4hbGHKuhwqoXJN2aPU1B
 1Me7WxpmsGROHxeKeyIVeWHIYh9JMXqb1mNtfAirFgLak4rSYAj6eVTDTStwO0LFggNFJ+a
 979TFHWVpUcNS3rYbTEVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ayoi7gMc8J8=:tCLAbglx61VPMTXsgdfETF
 j67n4HZfRGW6V7hkc5nS5ri1aqcHcoQ5E+fuz9HCc9JNSkzd71mYddo2GDJDo4iVJ8aJlMxHg
 Syh9T0+qMm22NUcqKsiXtqJua8VOiIKngcnjjzhhSyO9qNHcQaj+S/cUXttQGT7g1MHnj0ejj
 j8JwU+2y7/bm3Dzjt73T+ZnRna99wNvsGXoTDOYLOhLuAD3dHlrvEY5hkAgjrjOKyIS1kgyaE
 sqXPiFkFw5tBpjOsErDc9EgGdQl6WO5dEwZAP406FMnV4y1Ifdhu70B5rjC4qSkZehuIiCqRi
 UvibPRKj7APR16oiU3H7JhbxMKXrkMe8IUqS7qeC4w2odSoe35C++SoiMhz0lVTCNNilNQW5K
 wACNvPFbSX3hqj9hWtJjbYKpxBkuPBtx3pfZ2jb7ZqVcT0TDdtz2LsUnyXcnidCkPgMtXDtzv
 5yFXqt9s1nhuDQ/YzZ4i8wSdzfnzc6WawUTxUSzOFRZSoiNUNJ3Y73JSwFQ43X4O+b6C7R+Og
 n7GJaKu9jYlo6K9wtGuatEXFnnnO/XT3/f3TiQjuTJmgv+IFQn0WzNW9RWsuuTCgEB4P/Gzfg
 GK4QYT4Y8E8HRHkV3JsqsKYJZoOd9E1JQRShKBQUPnVghHnB10cbczXgEJ0szs0XX5OMDjTPg
 K6wAaim1f3dTt1Jm+s06t1MKrIsp68JHHakxkIItkZGrBbvjY5oSViDkb4vB1SH8UiE8jgmyh
 CyMn0m28XM6nRg29cAweQWU4tLUvh8L7A+KxkwX5nKvv/mqzqQto3bFRQYc0HmZep/tj62bl5
 MmOqoBfRpl1fN+4qXpwHgY90gWR9kbM0HbnbgetXX2aX6Ib+yY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_065749_017049_AC2C2AD5 
X-CRM114-Status: GOOD (  17.29  )
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

On Thu, Jan 20, 2022 at 2:27 PM Guo Ren <guoren@kernel.org> wrote:
> On Thu, Jan 20, 2022 at 8:53 PM David Laight <David.Laight@aculab.com> wrote:
> > I think the x86-64 32bit compat code even puts the boundary at 4GB.
> Yes, we could give rv32 compat for 4GB with some effort. But it's unnecessary.
>
> There are no history issues for rv32, we use compat mode to reduce
> memory footprint. eg: only 64MB memory available.
>
> At end compat for 4GB is another topic, let's give the initial compat
> for 2GB support to riscv.

I think it's fine either way. Having the entire 4GB space available is nice
when you are trying to build 32-bit software natively rather then using a
cross-compiler, as you can just do it on a larger machine that supports both.

One example of software that runs into virtual memory size limitations is
the gnu linker when building large applications, but it's unlikely that you'll
actually need to run applications that run into this, while also needing to
build them natively.

Using the same limit as on native 32-bit machines can help with compatibility
of certain software, but again this is rarely a problem and I have not seen any
reports of issues with the 4GB TASK_SIZE_32 on arm64. On x86, there
is an option to use the native 3GB TASK_SIZE for compat tasks. This was
introduced to work around buggy applications a long time ago, but is
probably not used any more in practice.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
