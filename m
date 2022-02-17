Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA898C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2sBjXee3GKVsIJ/cNeFpZRDqyTT+dm5z2QT2RuoyqU=; b=kxArmVqPiIvX5S
	Fmus15flc+D4SG/q/lAco23wk5UP1J9xZegFhrqkHe/6aRnWtlwFJUNO59VLP64V+5CkPtMiZGqoP
	iL2jv1PAyy9U2gkEx+Tc5DRdWqsdmTMGJdi3yz0PKdQfPW3T1gSRABhR6xLBl+Vc0vLzxyG74nCX/
	w9J/BchaM9pybzAwbPZWq2jEWbsXOOmayZHbcf7gStH0NAzLQLYZWrA3xVNKhYdInnSSzAmqt9n7x
	5ksAAdsiC/WA14weKakaUZpoN7MvuH9bcAMH9rUbgK9dRccxSr1Rhuu/sljZ2JkBUxYu8ubWXcsgP
	u88KkxSmVPLIqhZNS7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKduf-009sfZ-D8; Thu, 17 Feb 2022 10:21:25 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKduc-009seL-6k; Thu, 17 Feb 2022 10:21:24 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M1YlB-1nIB4J1pPv-0039HM; Thu, 17 Feb 2022 11:21:16 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso3664622wmj.2; 
 Thu, 17 Feb 2022 02:21:16 -0800 (PST)
X-Gm-Message-State: AOAM530PqmkdqhTs92N9Q+MvEVvQTkmf4SNg/R4gWki3ePk3/2bobsZv
 udCky9x0kH6j3lLEeRDj9oAT74/LvzPsUcbgEuQ=
X-Google-Smtp-Source: ABdhPJwu2NVHGHLxx29UDj0eC2QtTDz9ABoGgqvKd5FtPXFo3D/c1j3IHxwDsslquGRbQQhg+y3kZFZQ6qJy+rJ75Go=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr4990966wms.82.1645085639420; Thu, 17
 Feb 2022 00:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Feb 2022 09:13:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] clean up asm/uaccess.h, kill set_fs for good
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>,
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>,
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-Provags-ID: V03:K1:X2nYiP+gKLSe5A41jSu111OtopmdXz0IIAs8KCSIx09WZc3OEbx
 iDWwy6NxSWPN71NIMWVtQ7v6zDscSerObDELL1EcmAHlzSSMNGAYYljq1O7OeYdTFL9W/S8
 uELth5pLYpNQGN0n5ANecfYeD1XEnTwF9Oe/e616R1yDNk7FxeVi+BHQ4SMuuk1mXVMgqIF
 AC7o7ShcKqdIWIQtQHjVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6YoiPyWTlMU=:xI3vGPwszP7y4P3jHxgCkG
 GUXOVqEob9YElHUFy8LZGYVj7bXzmmUeNPxGYOmF5bMf8jZ/yUDK17JcklWBmu+OSJcgEQanB
 s9IJReHBrc8ueWJVI3lXLzd1mxSkTDhtZROYenqVTRhTdaXT0UC6/zgArUVOkWtCg5agCNxBn
 zC/iFiB9C+3R9qy2gr6AtuS3Wrk23PCSHfHOQhmSPWeyDa9LJlZnoUdH8zv6LOe38glAIwJfX
 9Z52VyjTg5I9zAUIKU3eCO7qJmBLD4AfMgo42FRBs+ZazBfuRgdzMtTbqW6XUHoZfUK4ctWbP
 64GGlkENXMQKIjeUxboUpdlhNT1xNYYTt+PWoUKbVG1aHwy870G8OxAssD9CyKYham0/bUxK2
 bkxZ1oBGIco3XQnwZnHbl1DPSnzV/PD/2Tx6HsKTpXG7mQCeL7cV9W4017302LSjzOvWvmkUR
 2BTrlet7guxR5kuVXEbvA6Ve2KYPhxyJebv2PtBBqUs2Q6ka7xabaMrQTTdhrdGF6jn6Gmvpx
 nsgZx1Pcq4RWx7+6y3Dj0jGyZiRr71MCkc9CE27rP6PJx4oZtw43nQarnj5uhXMtHIofZaeOX
 An/9rZPpk3drWV2D+ySaoEuxbPHpST7RiR4W9PuBRM+cV6CJM76pwwaSECqwBApx9vOQ4zfzZ
 zZxKu583uNmhGjXtG9stI8TduP1FihAH5a0FndpIRcPiddCQxHc6XP51gMZpYwmP4Y9E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_022122_548575_D28F440C 
X-CRM114-Status: GOOD (  20.88  )
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

On Wed, Feb 16, 2022 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Christoph Hellwig and a few others spent a huge effort on removing
> set_fs() from most of the important architectures, but about half the
> other architectures were never completed even though most of them don't
> actually use set_fs() at all.
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().
>
> Three architectures (sparc64, ia64, and sh) needed some extra work,
> which I also completed.
>
> The final series contains extra cleanup changes that touch all
> architectures. Please review and test these, so we can merge them
> for v5.18.
>
> The series is available at
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=set_fs-2
> for testing.

I've added the updated contents to my asm-generic tree now to put them
into linux-next.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
