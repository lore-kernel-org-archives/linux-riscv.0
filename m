Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAC2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 13:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bELUAyaUE9UYNbss4tMM/5oezlgeJttm9rmwxecE7rE=; b=LsW9SQD+VSYAb6
	pPojaAExuE+o2VAB9VNKB5gudz1R64eh58slBm9RInLILdEAW50b4atQ6m5VvVvMWrqi20y/SJbj/
	7My3xTFc7XTJmT07cv7E6u3whtjEoTP3gc8GeODH2Ndpbnnf42hhB94dni9rA7X8RwS+5JDGNa3N4
	pFTN9Xw+wjsuyRHfYQ+VcII7qxMxxAfdwBVtJxH/o8fbcwjuGd68KQ7VIXvjSaZCXSy1jmyWWh3s6
	7tfNx3TXydQ1+eZadw+s360lwEZrFfMzlLchu7WePFaYHuw9mPEA9+Q5+O7R//KTO8qsaS8lVHM5I
	pdU4pQmQzXdPAaywQfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxhr-002oc8-Du; Tue, 15 Feb 2022 13:17:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxhn-002oal-UV; Tue, 15 Feb 2022 13:17:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 812E361703;
 Tue, 15 Feb 2022 13:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A72AC340ED;
 Tue, 15 Feb 2022 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644931038;
 bh=yV4ORJd5b6IZao4Zu1H2u9bAD/0nkvfeGMC8j+boEO0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=en41RouE/EA/f7wz63guGOJgQDzTzpSHu1gIzDlk0eh3+3mMTSAf00BnXMZlARt6s
 lMs/qZOv6PL6+MghQnSbA+7NV4vESrRm3svOh5B/rWCfo6LLtIapnoPyUEXNUCVUxZ
 SM5/eNjHSVB0faWLDASH4Z3RBCxDND/GXUOk0wBzYzTo35C9/bozc9mrIpu4PzzP4L
 vdJ0tSnn6vVBCH3McB/vLyXMNRN/hK/qgW/7ElOPsieLxNJU0DX0VVdQVgbX81UPGp
 543MNrYS2T69bw5l7VfHlP0ByvGETR6i+fo7tz93ZNH2MLTYoNKcSPZjc3aKvb3lb/
 rnqKGi4/pbe3g==
Received: by mail-wm1-f51.google.com with SMTP id c192so11327167wma.4;
 Tue, 15 Feb 2022 05:17:18 -0800 (PST)
X-Gm-Message-State: AOAM531oeLvY3WxMoFcUMY9OhyTyXcrAeQlI/3cEV+wtNqbgIogdpfob
 Rq1Y4+5X2c/EXeJadG7oLhCrxzSkecmiUeoSwek=
X-Google-Smtp-Source: ABdhPJzhbiTSvbv50mQWSJ7smaLZnr2q978YJ0F6+MeQ3SrwEp5s0NrkvRE5+WnWUVexqYiFblH5E9BGGqHgxsxWGyI=
X-Received: by 2002:a05:600c:4ecb:: with SMTP id
 g11mr3088436wmq.98.1644931026534; 
 Tue, 15 Feb 2022 05:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-6-arnd@kernel.org>
 <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
In-Reply-To: <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 14:16:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2+qG=Q9Si_2D7wjM7Qao2JCnYqKgU=W-SFwoG+fT-U3A@mail.gmail.com>
Message-ID: <CAK8P3a2+qG=Q9Si_2D7wjM7Qao2JCnYqKgU=W-SFwoG+fT-U3A@mail.gmail.com>
Subject: Re: [PATCH 05/14] uaccess: add generic __{get,put}_kernel_nofault
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_051720_065025_8DBD8790 
X-CRM114-Status: GOOD (  24.39  )
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

On Tue, Feb 15, 2022 at 1:31 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:43PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > All architectures that don't provide __{get,put}_kernel_nofault() yet
> > can implement this on top of __{get,put}_user.
> >
> > Add a generic version that lets everything use the normal
> > copy_{from,to}_kernel_nofault() code based on these, removing the last
> > use of get_fs()/set_fs() from architecture-independent code.
>
> I'd put the list of those architectures (AFAICS, that's alpha, ia64,
> microblaze, nds32, nios2, openrisc, sh, sparc32, xtensa) into commit
> message - it's not that hard to find out, but...

done.

> And AFAICS, you've missed nios2 - see
> #define __put_user(x, ptr) put_user(x, ptr)
> in there.  nds32 oddities are dealt with earlier in the series, this
> one is not...

Ok, fixed my bug in nios2 __put_user() as well now. This one is not nearly
as bad as nds32, at least without my patches it should work as expected.

Unfortunately I also noticed that __get_user() on microblaze and nios2
is completely broken for 64-bit arguments, where these copy eight bytes
into a four byte buffer. I'll try to come up with a fix for this as well then.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
