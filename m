Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E85C19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 19:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fq7tbXpwS7ZKA5djBh1IOFLFpN7Z1ugOVZ6zpcAjRQE=; b=yxD18Dru/VoDdS
	bgy4Ki8Tc7gs9HmivPCSnsKR8PxWbdzc5vFxK6JDu1uEaLsJnyPeSqqwAHC95ye/PF6RPqk8Om22u
	3jqFyk0Bm+avcr5JAKLsPMAEj2fLOsjp2JgVTz/d/2sP+DU4drlWcpME51VuuxflWkIxieWgpEyXd
	NrCvBr0N9R4nXgai+MS0scxcw5pwD0f4g3Rp39TC6tsHq3BH+zqwyEoLOypR2Z7Abwl0QfF3EAxTp
	84RMVYWbAMnaiMtoZGkp6grMf0VDQCsSRlk6D9yh/AkgOKuuTZOgtVik6BwaXBtWrUMw0faSf600/
	yew1+4FjwGJT7SSWCcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKmCx-001s58-Vr; Sun, 07 Aug 2022 19:45:08 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKmCu-001s3v-IO
	for linux-riscv@lists.infradead.org; Sun, 07 Aug 2022 19:45:06 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2Unv-1nPY8p0WMR-013vkW for <linux-riscv@lists.infradead.org>; Sun, 07 Aug
 2022 21:45:00 +0200
Received: by mail-wr1-f47.google.com with SMTP id j7so8758210wrh.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 12:45:00 -0700 (PDT)
X-Gm-Message-State: ACgBeo1YaD3XMbwe+acpb5F79Tf8zFaUt3DvF0PGhysxMiAUdUftsME5
	JuPUhEcPz3LVZk5FTKOP++j497g4WeGMTaijatQ=
X-Google-Smtp-Source: AA6agR7WvYipqruEUqI3FozO1bMoMLoFg3gTNr1wJxvZ4oY3kYpws83YatqbI24HkVKiWoEkfQMs1s6P8NVFSqcphg4=
X-Received: by 2002:adf:f5c7:0:b0:220:6871:de96 with SMTP id
 k7-20020adff5c7000000b002206871de96mr9685215wrp.516.1659901499836; Sun, 07
 Aug 2022 12:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220807172854.12971-1-rdunlap@infradead.org>
In-Reply-To: <20220807172854.12971-1-rdunlap@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 7 Aug 2022 21:44:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0FR2ySLXAMGR1ZmaAQMbVwB4MFBPvBw4py_pbgtQSfgA@mail.gmail.com>
Message-ID: <CAK8P3a0FR2ySLXAMGR1ZmaAQMbVwB4MFBPvBw4py_pbgtQSfgA@mail.gmail.com>
Subject: Re: [PATCH] asm-generic: unistd.h: make 'compat_sys_fadvise64_64' conditional
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
X-Provags-ID: V03:K1:Fv1XzN7p5DKzOI1VWQNAZojJDihjycijh02vfDM9d9tZOqk7Aw+
 E4gtilug7DMjS2nm0rDiLUsgi8AZWRFQXZAbVUVqtUAdSSKAcdjizL1isUFidgxnB/yWJYS
 AWEdk9Hjgx+Uv54jcEjrkFTanE2dRKcyQM/d8wpRmnWtLPfa9I14kH2PHrZAPP2krf4hl9I
 lt+UiOgjbbT58Uu/+WV8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oAR+CiO95gE=:W891Xoprm96EjUleRMknRc
 lnqnfi2SqXW6mFqGF3vBWnQ8jsx1vdolGBWSOt2eM7oKGgj1+AAExki96ONhqYyDNE+ee08rT
 0DWfjaeXWVrWj5J/XiM6IQvTGuCT3bQfI7wVcnZQGGYNHpbCK4/L0xUYYV+Y8gpMcdP8Qp+Ss
 iJlmAtwzY/2AAa2qYDqyxHtQM7Zf7f/cA1YQC7WYWo6prRG5KueJnKpmIVZn0eWKO00y7HByN
 eRZBpy4JkzSh/1GvNBN1rmuKfzaGJ+Nsfa1RXy60mSXJtmviTglrntLx9qefRKV8m4/Xjwzp6
 aCR8Fk/k6AHavfcYNy9bKH5jSFPLepNT3QrQlX2O2OycZrjU3YebNg7qpT5XfddwY7YUKgQoJ
 fqNbZlGWrX4XjXr6DENgeW1QgDf+On4J0phx2h4UWVHyo6W3/FRyxHeegd3qwzhUbBFREahdR
 2FCpjkfeepC1ygxqLuG9A8am87WKUgBcMtZeSUAyejaaxFyOol8M8DIhJcGbrqmkyRYIzzMFM
 gRe8+xYd6ZZc1wewyFcvdGldaixC1mD+VQTV+G45gWUHspu+fnoqPrwrSGionzSCU8RoPAOAW
 IXchnxImhjT7euy8UeCOGswlHmRwXT/exB+OByU89qLmczS9QNyUUtjFm/GM0fJ6LVPAEdku8
 xqdSnhAxRZv+z95L9S74Dq9x2BNRH0+BKNd+IVoe0U+IXUIPzRi3EihMqbnJEroOlOHSeVtXV
 QHUUA0yGqu0KaLfXcNKxFovYWBXWgYIHJO19fOH4yitvE9Tnot8tiG0xO74gLwbEk+3lH9AUv
 7bhadUHEo+zqXYXk91Mya0coPmaStW/AIy6vFDfHIpepcSCEzB+YQvF+aGSraczfBYRjjXwKM
 yZ9TzxMX2Ddl3+TuBNuA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_124504_946227_2B7EE2EF 
X-CRM114-Status: GOOD (  18.84  )
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

On Sun, Aug 7, 2022 at 7:28 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Don't require 'compat_sys_fadvise64_64' when
> __ARCH_WANT_COMPAT_FADVISE64_64 is not set.
>
> Fixes this build error when CONFIG_ADVISE_SYSCALLS is not set:
>
> include/uapi/asm-generic/unistd.h:649:49: error: 'compat_sys_fadvise64_64' undeclared here (not in a function); did you mean 'ksys_fadvise64_64'?
>   649 | __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
> arch/riscv/kernel/compat_syscall_table.c:12:42: note: in definition of macro '__SYSCALL'
>    12 | #define __SYSCALL(nr, call)      [nr] = (call),
> include/uapi/asm-generic/unistd.h:649:1: note: in expansion of macro '__SC_COMP'
>   649 | __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arch@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> ---
>  include/uapi/asm-generic/unistd.h |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- a/include/uapi/asm-generic/unistd.h
> +++ b/include/uapi/asm-generic/unistd.h
> @@ -645,8 +645,10 @@ __SC_COMP(__NR_execve, sys_execve, compa
>  #define __NR3264_mmap 222
>  __SC_3264(__NR3264_mmap, sys_mmap2, sys_mmap)
>  /* mm/fadvise.c */
> +#ifdef __ARCH_WANT_COMPAT_FADVISE64_64
>  #define __NR3264_fadvise64 223
>  __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
> +#endif
>

This does not work: __ARCH_WANT_COMPAT_FADVISE64_64 is defined in
arch/riscv/include/asm/unistd.h, which is not a UAPI header. By making the line
conditional on this, user space no longer sees the macro definition.

It looks like you also drop the native definition on all architectures other
than riscv here. What we probably want is to just make all the
declarations in include/linux/compat.h unconditional and not have them
depend on architecture specific macros. Some of these may have
incompatible prototypes depending on the architecture, but if we run
into those, I would suggest we just give them unique names.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
