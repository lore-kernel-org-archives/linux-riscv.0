Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F6C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8QPdU6/GspN1AqzeaFSY/vLtublPtzmXnAWoGsdU/Y=; b=JQZRrkcxkEkzS3
	V/ma3WkxpkYkCWEIgYSyEJRR/yxMQ4v/gGmxc17YNtEc0hIJnMcNi7MKJkuHSB+/1SaCSzdL8H97I
	hVcqvOE+mNNbdvyjStNzreR1ZHDjXy/gY1wG+Fsp5JxjQx3c1QmpfQuuiwE1InblF9Vxq2dAZwsVK
	14fGXXdmBLXMeApNwg1hlWpLHOD070ZXzcOI00DK309dqFb2/peb88Wcj+EtnspKxZSfM24EL3Zlp
	gu1h1oDoL287TV7O2W9dZ+GhzcyZMyVlf3cWX6jZGjJQ7GPLtKoNrRD+E8LScKLrUiNFj502HMI4C
	I7Z1oNGbXrM7Q/a+Wo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwib-00DQ3s-V5; Fri, 17 Feb 2023 09:07:49 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwiY-00DQ2p-A7
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 09:07:48 +0000
Received: by mail-qt1-f174.google.com with SMTP id t8so195608qtp.9
        for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 01:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uETbKlrc042hse1IeL+66tEEBop9Jun/9u11FjpcZk=;
        b=MBFcHXV3A0rrON+8y1Gm4VQJdgvn4brYffGij5Htzj4K7vlxyfPHWyyo9upwekAJcD
         KF2CewO0t2XDSLtW1EV3s5MRso2hx7HDgSAQyc8HFCoa4wPqfOSZYgPb1wNxtD5xJ/Ov
         IxVA0gGok1fNvNGU2NMKnzqGpP70QI02t5yZoH3QUphI85pBEG5lRqzheF8HhghA3Rnf
         ymByMkvaVqwtustRxKI/M130psvLTtpClv4Y3JVIPdCU18fQaX9+A8V/H59Y36DnIWgw
         qw4wdYEefgukDE8QICbH4oQ47xjMj/dnvzqrWVpIoxOUBHtIcwtAt5usyiLdVhqUMrJd
         frzg==
X-Gm-Message-State: AO0yUKWsNQaUj7a7JKC/NllkhdqtgY+RGgZedo00azSH+FTcaFhqS3XX
	xEM+DxSVQLGh7wnmAuicePaY8GDVUD0quRdx
X-Google-Smtp-Source: AK7set+M7CivGcMItnj7k1aXUmhWlcrGP3iNRnMgdy8AEJHuoHOBMWO/FcBC14akOUGK/+lsony3VQ==
X-Received: by 2002:ac8:5c50:0:b0:3a8:e35:258f with SMTP id j16-20020ac85c50000000b003a80e35258fmr818746qtj.31.1676624863078;
        Fri, 17 Feb 2023 01:07:43 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b20-20020ac844d4000000b003b84b92052asm2877828qto.57.2023.02.17.01.07.42
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 01:07:42 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-535a11239faso15721727b3.13
        for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 01:07:42 -0800 (PST)
X-Received: by 2002:a0d:f347:0:b0:4fc:962d:7dc1 with SMTP id
 c68-20020a0df347000000b004fc962d7dc1mr1001435ywf.301.1676624862400; Fri, 17
 Feb 2023 01:07:42 -0800 (PST)
MIME-Version: 1.0
References: <202302171144.sffQigLX-lkp@intel.com>
In-Reply-To: <202302171144.sffQigLX-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Feb 2023 10:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3yhaqYo1bqN_AH3QFfiyMPwZ8TpiwzsAZTYML8ReFww@mail.gmail.com>
Message-ID: <CAMuHMdX3yhaqYo1bqN_AH3QFfiyMPwZ8TpiwzsAZTYML8ReFww@mail.gmail.com>
Subject: Re: drivers/iommu/io-pgtable-arm.c:330:8: error: instruction requires
 the following: RV64I Base Instruction Set
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_010746_371123_464A10D8 
X-CRM114-Status: GOOD (  19.62  )
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

CC linux-riscv

On Fri, Feb 17, 2023 at 4:50 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3ac88fa4605ec98e545fb3ad0154f575fda2de5f
> commit: 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1 riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
> date:   3 months ago
> config: riscv-buildonly-randconfig-r003-20230216 (https://download.01.org/0day-ci/archive/20230217/202302171144.sffQigLX-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8292493c22c8e28b6e67a01e0f5c6db1cf231eb1
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iommu/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302171144.sffQigLX-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/iommu/io-pgtable-arm.c:330:8: error: instruction requires the following: RV64I Base Instruction Set
>            old = cmpxchg64_relaxed(ptep, curr, new);
>                  ^
>    include/linux/atomic/atomic-instrumented.h:1968:2: note: expanded from macro 'cmpxchg64_relaxed'
>            arch_cmpxchg64_relaxed(__ai_ptr, __VA_ARGS__); \
>            ^
>    include/linux/atomic/atomic-arch-fallback.h:60:32: note: expanded from macro 'arch_cmpxchg64_relaxed'
>    #define arch_cmpxchg64_relaxed arch_cmpxchg64
>                                   ^
>    arch/riscv/include/asm/cmpxchg.h:354:2: note: expanded from macro 'arch_cmpxchg64'
>            arch_cmpxchg((ptr), (o), (n));                                  \
>            ^
>    arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from macro 'arch_cmpxchg'
>            (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>                                 ^
>    arch/riscv/include/asm/cmpxchg.h:324:4: note: expanded from macro '__cmpxchg'
>                            "0:     lr.d %0, %2\n"                          \
>                            ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            0:      lr.d s4, 0(s0)
>                    ^

This is a bug in arch/riscv/include/asm/cmpxchg.h, which doesn't
cater for the CONFIG_32BIT=y case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
