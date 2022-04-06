Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92B3C35273
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 01:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toq4EN6L0aaGPrU/O4IHKwDsYlHxUyfO4I+ZyicKucs=; b=ZgUOb3O6MoK3ox
	UzyB0jBDPAss2fWihZt3wTODcbSFkvsI4hKNR7DurYtGYdqCIjqbfh2577aB/ZThf/9tc8HQrmw+V
	2flrDyfsZZhWOiB9zxKXnjNxVIUROLtrRuKcuywKi8vYlDUkekuDFINlq7HKOvVRfktZ4Hd6AM70d
	b30P/CtSl0zRJ8SLWQjrGdKprGdyIUDgA/LEH8z/W7mNYEMSCsu5GtF366z0b75yTB+ug0YQkxXWn
	dVG2XqsZUe/in0bFwiPbQ1zZwm2qBeHoOq0FtCzQiexYMtLeCE1YJY1eYvTdIUuEoCFPGVLB/IHX3
	ICW+ECiWbHJQONUPmg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbuEp-003Brx-Si; Wed, 06 Apr 2022 01:13:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbuEl-003Bqz-MR
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 01:13:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C7A3B82030
 for <linux-riscv@lists.infradead.org>; Wed,  6 Apr 2022 01:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460AFC385BC
 for <linux-riscv@lists.infradead.org>; Wed,  6 Apr 2022 01:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649207607;
 bh=K2W88sa0e40FhxFM51hz1PVnPS6fYU/JKW4DlHd0JHk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HYGAzAvDvERjww1332qf4HBWmEBr8lBkHk5nMmpuHlcrS5xNhnbKDRvGd28nZ+kpN
 TyR2NMK9JSTMkmDUMQaAIe7sJuDWPs3BEWWckbImQOQQVb12qZhWymF9E6XURIGl3a
 ywXDWYdzLFYuIqxnrYkVbVipI7/38HCnjQcchEcsY3kjjiFKEn/sLMMxn3BglHVeeM
 CTPK108iZ1bfDOO75pm6RvAA1YcwofguWk2pYis7TDML2vBzhBJ34KsSC3mLhVZZoL
 RvjsW2J22HTbg1jpz9AndAsh4y5a+5KueCNel9rddnbDEZXBMQY2wLAx8cB7K3Bdi8
 GCpVhnbxbQaPg==
Received: by mail-ua1-f54.google.com with SMTP id h7so1002977uan.4
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 18:13:27 -0700 (PDT)
X-Gm-Message-State: AOAM531BJHBtGNYr4zEXXuIM3XDC9/6RdU+QrKgICafCX5FYXn0PeC1D
 TH2zLCf+C4b4cNDft4x8Dn4foun13f1g07GQAqc=
X-Google-Smtp-Source: ABdhPJwdlBT6DWcyITpQFk0eYMxDLklydODShGdQh3Dhz3gy5pvAEE1D7qv3EMRUsxW3oJsG0Lv+XReYvs2gnjTTYBE=
X-Received: by 2002:a67:efc3:0:b0:325:4fcf:60bf with SMTP id
 s3-20020a67efc3000000b003254fcf60bfmr1892801vsp.51.1649207606157; Tue, 05 Apr
 2022 18:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTQkGZnwXrXsbx8drL0AicVpOMW=JmOcrieuvyEf91XPhg@mail.gmail.com>
 <mhng-cfa7bfb9-bab8-423c-85ad-ecd407d6e806@palmer-ri-x1c9>
In-Reply-To: <mhng-cfa7bfb9-bab8-423c-85ad-ecd407d6e806@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Apr 2022 09:13:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQgU=V+snWp7a8_txsX49BzAct1nkB18k-p4BZEd+s+eQ@mail.gmail.com>
Message-ID: <CAJF2gTQgU=V+snWp7a8_txsX49BzAct1nkB18k-p4BZEd+s+eQ@mail.gmail.com>
Subject: Re: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Guo Ren <guoren@linux.alibaba.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_181332_068310_A73DA1CA 
X-CRM114-Status: GOOD (  25.41  )
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

On Wed, Apr 6, 2022 at 12:15 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> On Mon, 04 Apr 2022 22:17:24 PDT (-0700), guoren@kernel.org wrote:
> > On Tue, Apr 5, 2022 at 12:57 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >>
> >> On Mon, Apr 04, 2022 at 03:28:41PM +0530, Naresh Kamboju wrote:
> >> > Linux next-20220404 riscv defconfig builds failed.
> >> >
> >> > Regressions found on riscv:
> >> >    - riscv-riscv-clang-14-defconfig
> >> >    - riscv-riscv-gcc-10-defconfig
> >> >    - riscv-riscv-clang-13-defconfig
> >> >    - riscv-riscv-clang-12-defconfig
> >> >    - riscv-riscv-clang-11-defconfig
> >> >    - riscv-riscv-gcc-11-defconfig
> >> >    - riscv-riscv-gcc-8-defconfig
> >> >    - riscv-riscv-gcc-9-defconfig
> >> >    - riscv-riscv-clang-nightly-defconfig
> >> >
> >> >
> >> > arch/riscv/kernel/compat_signal.c:7:10: fatal error:
> >> > linux/tracehook.h: No such file or directory
> >> >   7 | #include <linux/tracehook.h>
> >> >     |          ^~~~~~~~~~~~~~~~~~~
> >> > compilation terminated.
> >> > make[3]: *** [scripts/Makefile.build:289:
> >> > arch/riscv/kernel/compat_signal.o] Error 1
> >>
> >> For what it's worth, I also see:
> >>
> >> $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig all
> >> arch/riscv/kernel/compat_vdso/compat_vdso.lds.S:3:10: fatal error: ../vdso/vdso.lds.S: No such file or directory
> >>     3 | #include <../vdso/vdso.lds.S>
> >>       |          ^~~~~~~~~~~~~~~~~~~~
> >> compilation terminated.
> >> make[2]: *** [scripts/Makefile.build:462: arch/riscv/kernel/compat_vdso/compat_vdso.lds] Error 1
> >> arch/riscv/kernel/compat_vdso/rt_sigreturn.S:3:10: fatal error: ../vdso/rt_sigreturn.S: No such file or directory
> >>     3 | #include <../vdso/rt_sigreturn.S>
> >>       |          ^~~~~~~~~~~~~~~~~~~~~~~~
> >> compilation terminated.
> >> arch/riscv/kernel/compat_vdso/note.S:3:10: fatal error: ../vdso/note.S: No such file or directory
> >>     3 | #include <../vdso/note.S>
> >>       |          ^~~~~~~~~~~~~~~~
> >> compilation terminated.
> >> arch/riscv/kernel/compat_vdso/getcpu.S:3:10: fatal error: ../vdso/getcpu.S: No such file or directory
> >>     3 | #include <../vdso/getcpu.S>
> >>       |          ^~~~~~~~~~~~~~~~~~
> >> compilation terminated.
> >> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/rt_sigreturn.o] Error 1
> >> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/note.o] Error 1
> >> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/getcpu.o] Error 1
> >> arch/riscv/kernel/compat_vdso/flush_icache.S:3:10: fatal error: ../vdso/flush_icache.S: No such file or directory
> >>     3 | #include <../vdso/flush_icache.S>
> >>       |          ^~~~~~~~~~~~~~~~~~~~~~~~
> >> compilation terminated.
> >> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/flush_icache.o] Error 1
> >>
> >> I am guessing this code was never tested with $(srctree) == $(objtree).
> > Thx for pointing it out:
> > I always use:
> > make -skj"$(nproc)" ARCH=riscv
> > CROSS_COMPILE=riscv64-unknown-linux-gnu- EXTRA_CFLAGS+=-g
> > O=../build-riscv/ defconfig all
> >
> > When I change to:
> > make -skj"$(nproc)" ARCH=riscv
> > CROSS_COMPILE=riscv64-unknown-linux-gnu- EXTRA_CFLAGS+=-g defconfig
> > all
> >
> > I got your problem.
>
> Just to be clear: this one wasn't supposed to go in via the csky tree,
> and had other build issues that were being found by the autobuilders
> (which is why it hadn't gone in via the riscv tree).  I do in-tree
> builds somewhat regularly so that probably would have caught it if
> nothing else did, but my guess is that some other autobuilder would have
> found it first (some of the earlier patches
The problem and other build issues (arm64 & 5.18-rc1 conflict) all
have been solved in v12:
https://lore.kernel.org/linux-riscv/20220405071314.3225832-1-guoren@kernel.org/

>
> Guo: please stop pushing things to linux-next that break the builds
> and/or aren't aimed at your tree.  This just makes things unnecessarly
> complicated.  If you don't want to deal with the build issues that's OK,
> just LMK when you send the patch sets out and I'll deal with them, but
> having linux-next's build break causes fallout for a lot of users.
Yesterday, I made my
https://github.com/c-sky/csky-linux/commits/linux-next with
linux-5.18-rc1 tag commit version.
So this only affected linux-next-20220404.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
