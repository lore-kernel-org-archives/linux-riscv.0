Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE230C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 05:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBQZttk5whKSbcjSKKVvljIWaeeo3jW26fl+JIUfeJI=; b=cq6k7n5iTNvLy7
	tFJZhS7cMkrtgudtwjKlrf/gZ71bImcWvRLrxeHhgNV8oVwGYQIR45ClFxr2IR66gE5hJgxmh3Xgn
	Mo6gXsCLo7rIHXIpQXdSgtkoWxhcy58dW0RsYxZ+RpLejLNBrLFXTbV6ezoNIQpY2fVxLlUA7Z/0D
	x5RYhg+hlnaWVKpbrG0jAig4VByZLcUKa+bhiBw9CEnmkRTazI6aSu5r6lLxeh0qOPJXY8tJbD6Eh
	bCs2AoBeQN62fsgl2Qe5054QXo0f1IffY0CiEbGAzWX/u54FB5N5DbLFiT2oJJUsv5p7nqcjpm0Gr
	J5tDu+g/T7iTGfubtp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbbZX-00H9DR-1R; Tue, 05 Apr 2022 05:17:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbbZU-00H9By-3r
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 05:17:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8028CB81B96
 for <linux-riscv@lists.infradead.org>; Tue,  5 Apr 2022 05:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6F6C34116
 for <linux-riscv@lists.infradead.org>; Tue,  5 Apr 2022 05:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649135856;
 bh=F4BmQX2Y63BrfJkQle/Kee5eiX9lFVCLsQ1STIVzAGs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dZrT9tlHLkA6Z2fmx2EGIMkYJG+2GcdgeYAhBLf+3ghitO5FbdzFychci3qHoiPwS
 5gTLjVg3FYJ7gCLHZ+u7fhr4TRFlLVEPJcT741lvrjqY5hlaUVZcltjHyEKwyUHzef
 3HkAC+bGcaMs0lY9jYnK+i4K5jJTYWmnhDilVV6gnow/mdTTKQghuGkqM/+uyiN0w8
 TzEWtCiEqCSz3gNlKAvVp3QOHRdyVVBxQq5UnE2xGg5nB9+A011q9Gv9oYuQvQmulM
 cSD637H0Na5dWVPkv1qsWFfz+Uo933sppnOREKxqpvKWcu9Fb04TymS+pZqwDdkjy4
 /peyhOqR6nm8Q==
Received: by mail-vs1-f51.google.com with SMTP id a127so11371662vsa.3
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 22:17:36 -0700 (PDT)
X-Gm-Message-State: AOAM533ReqVC3nrN+WAixUzl4+VnyMFiadgbzsRa+nle3SLfwfO1J+HK
 u6aJALpObU3wg4+Bw3rcDVBeJp8DzhlVQ8RJXxo=
X-Google-Smtp-Source: ABdhPJxwAHd5YmIGFxtQXjLGpWT1kmM7IBN8n/zhBH0Urpkbt1tUAG2ja7KTW5WzlcRcBYmbO9u1or/8w7wC2pBLezE=
X-Received: by 2002:a05:6102:dd1:b0:325:80a9:b5d7 with SMTP id
 e17-20020a0561020dd100b0032580a9b5d7mr514202vst.51.1649135855592; Mon, 04 Apr
 2022 22:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
 <Yksjb9Mkq658k4YJ@dev-arch.thelio-3990X>
In-Reply-To: <Yksjb9Mkq658k4YJ@dev-arch.thelio-3990X>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 5 Apr 2022 13:17:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQkGZnwXrXsbx8drL0AicVpOMW=JmOcrieuvyEf91XPhg@mail.gmail.com>
Message-ID: <CAJF2gTQkGZnwXrXsbx8drL0AicVpOMW=JmOcrieuvyEf91XPhg@mail.gmail.com>
Subject: Re: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
To: Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Guo Ren <guoren@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, 
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_221740_495949_4AEF9ED6 
X-CRM114-Status: GOOD (  13.67  )
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

On Tue, Apr 5, 2022 at 12:57 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Apr 04, 2022 at 03:28:41PM +0530, Naresh Kamboju wrote:
> > Linux next-20220404 riscv defconfig builds failed.
> >
> > Regressions found on riscv:
> >    - riscv-riscv-clang-14-defconfig
> >    - riscv-riscv-gcc-10-defconfig
> >    - riscv-riscv-clang-13-defconfig
> >    - riscv-riscv-clang-12-defconfig
> >    - riscv-riscv-clang-11-defconfig
> >    - riscv-riscv-gcc-11-defconfig
> >    - riscv-riscv-gcc-8-defconfig
> >    - riscv-riscv-gcc-9-defconfig
> >    - riscv-riscv-clang-nightly-defconfig
> >
> >
> > arch/riscv/kernel/compat_signal.c:7:10: fatal error:
> > linux/tracehook.h: No such file or directory
> >   7 | #include <linux/tracehook.h>
> >     |          ^~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[3]: *** [scripts/Makefile.build:289:
> > arch/riscv/kernel/compat_signal.o] Error 1
>
> For what it's worth, I also see:
>
> $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig all
> arch/riscv/kernel/compat_vdso/compat_vdso.lds.S:3:10: fatal error: ../vdso/vdso.lds.S: No such file or directory
>     3 | #include <../vdso/vdso.lds.S>
>       |          ^~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.build:462: arch/riscv/kernel/compat_vdso/compat_vdso.lds] Error 1
> arch/riscv/kernel/compat_vdso/rt_sigreturn.S:3:10: fatal error: ../vdso/rt_sigreturn.S: No such file or directory
>     3 | #include <../vdso/rt_sigreturn.S>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> arch/riscv/kernel/compat_vdso/note.S:3:10: fatal error: ../vdso/note.S: No such file or directory
>     3 | #include <../vdso/note.S>
>       |          ^~~~~~~~~~~~~~~~
> compilation terminated.
> arch/riscv/kernel/compat_vdso/getcpu.S:3:10: fatal error: ../vdso/getcpu.S: No such file or directory
>     3 | #include <../vdso/getcpu.S>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/rt_sigreturn.o] Error 1
> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/note.o] Error 1
> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/getcpu.o] Error 1
> arch/riscv/kernel/compat_vdso/flush_icache.S:3:10: fatal error: ../vdso/flush_icache.S: No such file or directory
>     3 | #include <../vdso/flush_icache.S>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/flush_icache.o] Error 1
>
> I am guessing this code was never tested with $(srctree) == $(objtree).
Thx for pointing it out:
I always use:
make -skj"$(nproc)" ARCH=riscv
CROSS_COMPILE=riscv64-unknown-linux-gnu- EXTRA_CFLAGS+=-g
O=../build-riscv/ defconfig all

When I change to:
make -skj"$(nproc)" ARCH=riscv
CROSS_COMPILE=riscv64-unknown-linux-gnu- EXTRA_CFLAGS+=-g defconfig
all

I got your problem.

>
> Cheers,
> Nathan


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
