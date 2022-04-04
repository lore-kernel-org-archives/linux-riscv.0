Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D172C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 10:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqqhwtVfM43Ltkhu2XNbVMkaeqAlwwwTuJznDc4UviU=; b=mrYTBEbF68EPVT
	QxXqK+nIS4/ZPRvEwl0I7JJnIUiQKUupY+Tc5NYDSy/VKjapQkQTeHzA7rDJbO6+Dq/Es7JUzip32
	Xcft9XIWAefj2lFntV3LDDZLoiK5d2KDDCEGko1NLCQ0sUYixmm5AnAVhTB6mOsR6iDwq+++/aeh0
	GtD3c7OEz+ZZo99he7jSuMhTlgMWUF7UNGpawKDYvdYy2A/iBSmMOGlpwxeFuhVWXgGV2hd3Wej3U
	PXq3mB/lujELHFUMnhXpBEOhC5pPyQi8NKhUwiGXJcwH/MhjSfSrd7I6ZrBdQO3iTQzZYq/YqSn7o
	s6tZhJrBIEqaf9mZTSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbJxS-00EVjp-Et; Mon, 04 Apr 2022 10:29:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbJwx-00EVMQ-Qv
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 10:28:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB82761507
 for <linux-riscv@lists.infradead.org>; Mon,  4 Apr 2022 10:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C72C3411A
 for <linux-riscv@lists.infradead.org>; Mon,  4 Apr 2022 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649068121;
 bh=zwUK1d+i5RXTJlC+Adlf8bRHaBsi5j9oBLcZmbARNm8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u4dSFjGSpxeBVGAvXWQzGvUL6K7TQjhSHgVk8lztuwj8tcx4m1KBz3SgHZNKdBNCq
 RkPWMP1i4E2I1HAkxFNP8aRfSKsf2wfPKMHTKAyvUsbrkkei9VwBYTKIdiRZp/QKfV
 QRnbhPz6AmERszYevwrQ7zuVac/siEyzDl/jtvNO4QZXm4ZynlJ+u6GirFFyNzbC6E
 y6RXT139lJZzdpOF/JXOmP1nRDdiHthJmaxrP1Mph8nM91pNKJGel+VrnTlNlEOg9B
 jnKmDShWDNYasHR/roiRPvu/cfsWxAkSQmukax8snjwlwLmIz+lSMmKmgDc/Rzi2Oc
 RGKb5W7HLx8BQ==
Received: by mail-vs1-f54.google.com with SMTP id k15so8697502vsr.11
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 03:28:41 -0700 (PDT)
X-Gm-Message-State: AOAM530VFhwku2RKzWOQmYUUVPe30ZEm8NG0yYfQBHDVM2PTTWuCVQwo
 H2CvzObbll971uVohX2C0ZXReXAdrSkk+iskIEE=
X-Google-Smtp-Source: ABdhPJx6e/VYOA2WWRLC+sB4i7fzBVJ1DvExFTqsC4UIP3lN3bWU9HoW+rJb6BZz/2iFzWa6yDJhtpd1cSTN4vx0DrM=
X-Received: by 2002:a67:efc3:0:b0:325:4fcf:60bf with SMTP id
 s3-20020a67efc3000000b003254fcf60bfmr6380956vsp.51.1649068120257; Mon, 04 Apr
 2022 03:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
In-Reply-To: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 4 Apr 2022 18:28:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS_uhdujc_9+mrqKi=41eyURtffqrd067zo7ew3s4-dwQ@mail.gmail.com>
Message-ID: <CAJF2gTS_uhdujc_9+mrqKi=41eyURtffqrd067zo7ew3s4-dwQ@mail.gmail.com>
Subject: Re: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
 Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_032844_028391_9DB3AA6A 
X-CRM114-Status: GOOD (  13.65  )
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

It caused by:

commit 03248addadf1a5ef0a03cbcd5ec905b49adb9658
Author: Eric W. Biederman <ebiederm@xmission.com>
Date:   Wed Feb 9 12:20:45 2022 -0600

    resume_user_mode: Move to resume_user_mode.h

    Move set_notify_resume and tracehook_notify_resume into resume_user_mode.h.
    While doing that rename tracehook_notify_resume to resume_user_mode_work.

    Update all of the places that included tracehook.h for these functions to
    include resume_user_mode.h instead.

    Update all of the callers of tracehook_notify_resume to call
    resume_user_mode_work.

    Reviewed-by: Kees Cook <keescook@chromium.org>
    Link: https://lkml.kernel.org/r/20220309162454.123006-12-ebiederm@xmission.com
    Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

I would solve it.

On Mon, Apr 4, 2022 at 5:58 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
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
>
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> metadata:
>     git_describe: next-20220404
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_sha: 696206280c5e5c028caf9fd259999cb72b1f6127
>     kconfig: defconfig
>     target_arch: riscv
>     toolchain: gcc-11
>
> steps to reproduce:
>   # To install tuxmake on your system globally:
>   # sudo pip3 install -U tuxmake
>   #
>
>   tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
> --kconfig defconfig
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
>
>
> [1]  https://builds.tuxbuild.com/27JdBBUbSHIhFJ9Wsq3Z6ssitb6/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
