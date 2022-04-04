Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B148C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 19:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNvVd+p695JCY3Dd+WF8EA2j5vkSKC9ykHheD7SirTM=; b=h/Kk522Dfk8ulp
	WSQ46yRAid/IffjKSlFfE2TLBEw9xR23WE3HJ+H8ABJg9PjR1e+8sVjHRuVzCxIR3p4hwhwuxlePx
	UxVlYkwDluW6jnTPalPL4Mw7IXEyKIgXlozVL7WRkdr5gB6iNEFeh+BlyFW9VVAAuk+hgBKgRaPP0
	XTktj9VhN7UdeP/4PIyJkBko+8laY4M2pJCDDlmj9zq6f3EqdXhwqP0NSKaIPvCcYy0G54jHkizIv
	nzPcnuUd+n4A0Ua+dx8dp3ApL8lGv+n6Ey1ItmmbcVeNgDS5sLFSw2r5ojrz+bAvYs3/DKtyW0GB2
	/OWA5iLlyW+UUKhClakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbSdD-00GInZ-Ot; Mon, 04 Apr 2022 19:44:55 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbSdA-00GImX-Bv
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 19:44:54 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdvVu-1oBLbv3zF8-00b5sW for <linux-riscv@lists.infradead.org>; Mon, 04 Apr
 2022 21:44:45 +0200
Received: by mail-wr1-f42.google.com with SMTP id r13so16106915wrr.9
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 12:44:45 -0700 (PDT)
X-Gm-Message-State: AOAM532hAm/OnAQ0WCh2a8NuoNoLB8qSnLwVSiJzYt/Iig2+BwstQ6ug
 J86MimJCaH1Z4dxWW03ZUzjsCqsjzMWrC26EJ1Y=
X-Google-Smtp-Source: ABdhPJyRqH0qibkfjPRGnJDcURrE8ZPrQIGLNSwn/9l1FUg/Sz1o5iKs76jxTh4W551VdZ+S32lMVfdTx28z5w2iC30=
X-Received: by 2002:a05:6000:10c7:b0:206:135e:c84e with SMTP id
 b7-20020a05600010c700b00206135ec84emr984244wrx.12.1649101485314; Mon, 04 Apr
 2022 12:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
 <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
 <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
In-Reply-To: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Apr 2022 21:44:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
Message-ID: <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Arnd Bergmann <arnd@arndb.de>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:HLmPiCJNILnsMZbwCCxIR4rOJ0pxT9lJw57hNvDETcUjV7nX6ob
 pilbrM2/4SIcBplk1dgVaZMgPMq+jPW7Um8TTYNGIqaT+OvHC9CuhjDWR5nS6Rs9fD4BaPi
 KTppP45++Yoz2yhDY4OWUu/qNAv49KpLL8PglDUaoLDl5VMjlu9P4zLAl41SVF/r9PXRxbH
 5vcit+Q7XlWPVzp30f6nA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8IPYSvYfThk=:aFClFtYRmVDrVr6iUAJqgF
 4B0ociZwgkm0ZpgZQviYbdIjrnPPdIM9BsG6/kHQkbftrxAOjw8885vlnj24u/GxzDTyWJ0pD
 gR2cvMBK6TWCxfYq1BJMbd6e/v3cFHjepdCoSxwa9Aaq00n7SnXNLjBYlCKIal/4P2lwj1KiM
 374XSv4VRkJIyS0aGsXHr/howtX7dkrXMCiIIT1YComGvfgZvYic5TGuOnFyV0/Sru2C1r25M
 64qRJbykAwTLAtq1XTTTnri+nwiSCt4hci74HLoZQS+Qn7h1N6/XOiikXkfRN13d8bnTx+WZr
 Hbq21U9Fx8XsTAtq9rK4ljNPJ7pjD9ygjsQKcyHFbOIo1pJpyiQa5+UFtcEl27E8lUkISCrt8
 CBsjGynlJL0Sp/Kb6x2L79VBEETaOiCEuGlEloZ1vRUQ7cp2oCRHribCgw5wq4CfAMHcsTIkE
 bXdndsGbjzeEFeIy25BbY37yF7u0TOXjDDSfc3xkxPuyX8eaWjoiVfMDoYvgI4pJJ7F5CQZwQ
 sUuHapVPWXl/P2M03HIY8z2Frbfmu0/SULu6YODee33TKeRYeGSPX/Leyy17s1vHw78yQRsXB
 27A0wacIu1s4zKoQe28Q+Zk860TGPVueVBsozA/qmDpzY1Xj1XP+Tf5mGOWV7maDq2RRXdKFP
 KQTAuLP5+1YTZVkYYJf5CLqCSQijuTKie2VqH1S8/qn+lUTAc2iyIVo2k7cw73UAuvJ05l7Hj
 aCC+lS+GM3re6hxA7S+rHenVj0E8CKtb+hs8d3ERvwRmkd4waeJ4mr50Lxp9DJGaGbmwRA4bd
 fuLD6M6k4jWj05792sS7Nsaj1cQl7dRPYh0NujVntlsppQwPGU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_124452_722551_4AE33E83 
X-CRM114-Status: GOOD (  22.07  )
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

On Mon, Apr 4, 2022 at 9:35 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Apr 4, 2022 at 9:14 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > On Mon, Apr 4, 2022 at 12:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > > > Please let me know if you observe any specific build/runtime issues.
> > > xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
> > ...
> > > /git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
> > > /git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
> > > 'atomctl' for 'wsr' instruction
> >
> > Sure, one cannot use an arbitrary xtensa compiler for the kernel
> > build, the compiler configuration must match the core variant selected
> > in the linux configuration. Specifically, for the nommu_kc705_defconfig
> > the following compiler can be used:
> >
> > https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-de212-elf.tar.gz
> >
> > If you build the toolchain yourself using crosstool-ng or buildroot they
> > accept the 'configuration overlay' parameter that does the compiler
> > customization.
> >
> > Perhaps the documentation for this part is what needs to be improved.
>
> It sounds like a bug in the kernel Makefile. On all other architectures,
> you can generally just pick any (recent) compiler and build any kernel,
> as the compiler arguments set the exact target machine type based
> on the kernel config. You can't normally rely on the compiler defaults
> for kernel builds.

FWIW, the compiler I used is the one I built for kernel.org [1] using unmodified
upstream sources The config I used for this is

${SRCTREE}/configure ../log-gcc-configure /home/arnd/git/gcc/configure
--target=xtensa-linux --enable-targets=all
--prefix=/home/arnd/cross/x86_64/gcc-11.1.0-nolibc/xtensa-linux
--enable-languages=c --without-headers --disable-bootstrap
--disable-nls --disable-threads --disable-shared --disable-libmudflap
--disable-libssp --disable-libgomp --disable-decimal-float
--disable-libquadmath --disable-libatomic --disable-libcc1
--disable-libmpx --enable-checking=release

Let me know if I need to enable additional options to get a compiler
that works for all xtensa targets. Usually the --enable-targets=all
is meant to be sufficient.

        Arnd

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/11.1.0/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
