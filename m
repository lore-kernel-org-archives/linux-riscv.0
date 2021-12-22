Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED9EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txrMyYTp8xdssQtXg+JKUQ8f4d9y78txWA0vw9DaH/I=; b=afQKo7ogUSXYZq
	Rkp4acwd4FymQBMLRN5Mn6oQzRoKD1TSa6nC6zfisvXN68/4j2lwGmZ6JyaWx72eDUykQ6qDM94Ul
	FNQMWDGxp7xjjyDfXO9E7hvipBpgITNTlj2gS8zutiY7h9sR8dJYSnWhNZio1HGeI0CkeIrnQ5OZ0
	wJ7467bwh3iELVA3Kc4tX8DgNpHw3b/wIxnw1cIlXwD7QZkaRfUCU3NhLFjBwJxs6pxFEuxXGLLUg
	Gn2jBnecB0d3yKtGYEeINfEuUOUbjTQFm9E5mPqVXYfwIjDPFEVwfJAyGXxdk2s68m02eyoyNVJKb
	mKOLUXh+3/gad8r6Mlwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n00Li-00ADpi-UK; Wed, 22 Dec 2021 12:04:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n00Lf-00ADp8-DR
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 12:04:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9BB0619E9
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CA9C36AEE
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640174638;
 bh=U+TPVOLF6BgXdmpEAt6iPjDJBLkn0NoPAUmdT0tglpM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DrbdBzZCmKrlDQEWXXhG+g9wyDWbVY3Rny16fORbCrzUCSmKkRnuvQyyBPgEco3ab
 Z7qVZ92PqYLoUbyjhjj9zdn41GYStvJOcTGztSeXV469oYNKsnbWg1J5e+XwauWyGJ
 MD7MmDPb6TnjjfFEhOO6rTviv/bH/EV/oEKh7xf0gXiT+PEuAXyLMCt2K/BI1DvUyg
 AO0FMCm2moZrjfWhjppBofUASIMtRQQ2TPFhEaN9l/XCtiKkj9iQ9Av5DZ58KDh0Eh
 WBcjUknI/zUtbOomJ+viKlbGT1q2XHRhaYoZSIOA+Ohevqjc+03fnZqsZC6nTcDVBK
 xWqvTqtU/Immg==
Received: by mail-ua1-f49.google.com with SMTP id y22so3980251uap.2
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 04:03:58 -0800 (PST)
X-Gm-Message-State: AOAM5300UvJUeTXD/eJtWI+wBWPzBxP74A2zNSDdm2en0uo80qYj59Ug
 k2j3HZwqHlu+7bTViIR2KGlSzB35f/TkbbNZ75M=
X-Google-Smtp-Source: ABdhPJxA8UfmeTMZxAQvlcXPjE2yJPCWv7FK497e7SoRSycDfZSx1xBpfGkQsQ3tiAkQ2ooUzwKy7f0F8S9QkRxgieg=
X-Received: by 2002:a67:e244:: with SMTP id w4mr785309vse.51.1640174637095;
 Wed, 22 Dec 2021 04:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-4-guoren@kernel.org>
 <CAK8P3a3navO2Z2F5zxisby5EBNDo8rwQ6hxSuyniFgFxrQ5qXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3navO2Z2F5zxisby5EBNDo8rwQ6hxSuyniFgFxrQ5qXQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 20:03:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSssufQOQTXqzRjY8h_JjAmMs8jC6R+6d09K728=4fOOA@mail.gmail.com>
Message-ID: <CAJF2gTSssufQOQTXqzRjY8h_JjAmMs8jC6R+6d09K728=4fOOA@mail.gmail.com>
Subject: Re: [PATCH 03/13] riscv: compat: Add basic compat date type
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_040359_558402_9C402945 
X-CRM114-Status: GOOD (  21.16  )
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

On Wed, Dec 22, 2021 at 1:13 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement asm/compat.h for struct compat_xxx, RLIM_INFINITY,
> > OFF_T_MAX, is_compat_task, compat_user_regset, regset convert.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  arch/riscv/include/asm/compat.h      | 259 +++++++++++++++++++++++++++
>
> Since both the native and compat side use the generic interface, I think this
> should all be part of asm-generic/compat.h, in case other architectures want to
> share this in the future. Maybe see if any other architectures use the
> same definition
> for some of the structures and then remove the duplicates.
Agree.

>
> > +struct compat_stat {
> > +       compat_ulong_t  st_dev;
> > +       compat_ulong_t  st_ino;
> > +       compat_uint_t   st_mode;
> > +       compat_uint_t   st_nlink;
>
> You should not need a compat_stat, because native rv32 does not have a
> stat() syscall.
We need it:

$ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
EXTRA_CFLAGS+=-g O=../build-riscv/ Image -j > /dev/null
/home/guoren/source/kernel/riscv-linux/fs/stat.c: In function 'cp_compat_stat':
/home/guoren/source/kernel/riscv-linux/fs/stat.c:645:21: error:
storage size of 'tmp' isn't known
  645 |  struct compat_stat tmp;
      |                     ^~~
/home/guoren/source/kernel/riscv-linux/fs/stat.c:645:21: warning:
unused variable 'tmp' [-Wunused-variable]
/home/guoren/source/kernel/riscv-linux/fs/stat.c:674:1: error: control
reaches end of non-void function [-Werror=return-type]
  674 | }
      | ^
cc1: some warnings being treated as errors
make[2]: *** [/home/guoren/source/kernel/riscv-linux/scripts/Makefile.build:287:
fs/stat.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/home/guoren/source/kernel/riscv-linux/Makefile:1846: fs] Error 2

>
> > +static inline int is_compat_task(void)
> > +{
> > +       return test_thread_flag(TIF_32BIT);
> > +}
> > +
> > +struct compat_user_regs_struct {
> > +       compat_ulong_t pc;
> > +       compat_ulong_t ra;
>
> These clearly need to stay in arch/riscv
Okay

>
>         Arnd

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
