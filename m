Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C872C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMArHpB7RJ8I0XLOQHtfATkolnL1s4nD6UPulLI1x2A=; b=1hVQhgHyMHZJds
	ITYRYqVielpZV+5V4f3MbWq0oEpMjnrg4tGNaJsTwnCjhN6p+DGz5pgY6MAokBXPCiyYqsdbSqB5+
	9QPPok9VSRwXZ/ku55KEMEj6HtvCqTPNQL7rWojXrlkFajLpSpVp6FiD7w0stVqas8ZHyStLFMrmD
	gHvFLVX6sP9PwK3BVsnm+65dtZf+FmRwaGyBX2WYsNIiRYb+uE7gCVFKXBIC569lFm6mv0H/uj4dI
	po3xzLFisaVW+z0N9rjzvUcogbg+RZR2x7V2m//U03I/wmHzuCLwBlbvBMIGhpGph7Qidd7rtIbZt
	HMC/+9ayk7za3RazX0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbQ18-00Fs4x-U5; Mon, 04 Apr 2022 16:57:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbQ15-00Fs4R-Sq
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 16:57:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FC7560C90;
 Mon,  4 Apr 2022 16:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235B7C2BBE4;
 Mon,  4 Apr 2022 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649091441;
 bh=3DwgQQibm4QtCGLBPHzzEvuy5aoVnSuQo3AjjdM3vbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fk4AO+Sm8xS1TVN83Ht+dupzgBCUyMwmk3BdxRedx7gSUjUC8tNpe6fkePJnDCgvn
 6z1ffAw+tRmbJc42ieFu4+y8g6Py2fjyb6A9BWRheaeI2tn5z4tAHTbLbEp2080+S9
 CxB1WsVq5EIoeUe1he75gyGAxOSSKUfgy6CHbfw+TkSwcXK04OcBTqJ0zH0UGN8jud
 gmLhXFq4Iv4cp4M9T+2ayVMUt/M0PSzt/xTjSrezEkmuwfcU4AMwGoj8W8UL1mjetC
 QdQOK6sowskP4tRwiSnLlB0DFDguDCHON0Eg949oEq3JMuR6oVLAgcBK5/sITPY06j
 QtceSyWGBreOw==
Date: Mon, 4 Apr 2022 09:57:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
Message-ID: <Yksjb9Mkq658k4YJ@dev-arch.thelio-3990X>
References: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_095724_061472_451565FB 
X-CRM114-Status: GOOD (  10.43  )
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

On Mon, Apr 04, 2022 at 03:28:41PM +0530, Naresh Kamboju wrote:
> Linux next-20220404 riscv defconfig builds failed.
> 
> Regressions found on riscv:
>    - riscv-riscv-clang-14-defconfig
>    - riscv-riscv-gcc-10-defconfig
>    - riscv-riscv-clang-13-defconfig
>    - riscv-riscv-clang-12-defconfig
>    - riscv-riscv-clang-11-defconfig
>    - riscv-riscv-gcc-11-defconfig
>    - riscv-riscv-gcc-8-defconfig
>    - riscv-riscv-gcc-9-defconfig
>    - riscv-riscv-clang-nightly-defconfig
> 
> 
> arch/riscv/kernel/compat_signal.c:7:10: fatal error:
> linux/tracehook.h: No such file or directory
>   7 | #include <linux/tracehook.h>
>     |          ^~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[3]: *** [scripts/Makefile.build:289:
> arch/riscv/kernel/compat_signal.o] Error 1

For what it's worth, I also see:

$ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig all
arch/riscv/kernel/compat_vdso/compat_vdso.lds.S:3:10: fatal error: ../vdso/vdso.lds.S: No such file or directory
    3 | #include <../vdso/vdso.lds.S>
      |          ^~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.build:462: arch/riscv/kernel/compat_vdso/compat_vdso.lds] Error 1
arch/riscv/kernel/compat_vdso/rt_sigreturn.S:3:10: fatal error: ../vdso/rt_sigreturn.S: No such file or directory
    3 | #include <../vdso/rt_sigreturn.S>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
arch/riscv/kernel/compat_vdso/note.S:3:10: fatal error: ../vdso/note.S: No such file or directory
    3 | #include <../vdso/note.S>
      |          ^~~~~~~~~~~~~~~~
compilation terminated.
arch/riscv/kernel/compat_vdso/getcpu.S:3:10: fatal error: ../vdso/getcpu.S: No such file or directory
    3 | #include <../vdso/getcpu.S>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/rt_sigreturn.o] Error 1
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/note.o] Error 1
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/getcpu.o] Error 1
arch/riscv/kernel/compat_vdso/flush_icache.S:3:10: fatal error: ../vdso/flush_icache.S: No such file or directory
    3 | #include <../vdso/flush_icache.S>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/flush_icache.o] Error 1

I am guessing this code was never tested with $(srctree) == $(objtree).

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
