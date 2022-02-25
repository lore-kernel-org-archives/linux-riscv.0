Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F753C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qTT8LNc8dzwvJ0SRnC4tvoI/K7CtyEH+5/oNVeyI8Q=; b=XW/nbC7g1UxOKf
	hG8eCMsQXXQdBCzoA2D61SE2uN3YT0sIS0IrVXaPjtPRf0LDMVFbZjjxFRUl8jQJzW4BpXIA5fUGv
	iLEFq6X1bGvxq0uVBm0wkvXJi0r/t8jOox6ahHKcVMwQgd1QHnFrv1f6El9EnRfSUQ50CwPvdkEYx
	bus3G5nyFSlKYpNV5cWiwwMND/foFXJiGxiSXpLG0Zlamgk3+lAAuLYewL29ccRvrxFIRTHy/bxPq
	rl/SMc/NeSC0JP7loh+DMK4zmUCoHTLdQ7x2sP32LPExH3TUnFvrjER5H4jj8PFfyiFiw7wA94G9b
	WimNM54vxXI3CoRFvQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNd8K-005odz-WD; Fri, 25 Feb 2022 16:07:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNd7n-005oQK-EJ; Fri, 25 Feb 2022 16:07:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15F66B83281;
 Fri, 25 Feb 2022 16:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40082C340FA;
 Fri, 25 Feb 2022 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645805236;
 bh=KbJfW32hJ/F19yfN7A1bXil25wuVvtsMCViBmRGt63Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WkbIlFcJhtK50zmM1SUqT+c2BPoPb/PAsS5g6c6LqFS7dLJTZxLAPvig1x6SXi8te
 l5Cx5rIlFRnbSFqV0Md2Gt99TvNmEAE85nc8zZkW2KAysaFXNYW8weU3KRSI1Joub1
 XfgGa954+3/CiMxkbGo51ZitZf59ze3/G/mztC6h6fIENRXkrcAjUFFN1d6J+PDcBw
 gx1uVRfyOgaOR4bZKjVcG7PIz/MCA3RNLoXSnngVfstymXQ0A55zH1r8rE0BbpfyBI
 53H/HcqUiVVHaCBF70mR9z8l6owgUIz3VOsTGHF1gt/NgeAutWcTYSskkxOKLmnMHx
 9rb/DOmJIf44g==
Received: by mail-ua1-f50.google.com with SMTP id g18so2677200uak.5;
 Fri, 25 Feb 2022 08:07:16 -0800 (PST)
X-Gm-Message-State: AOAM533QHQbXemA02v+ScwMBzPaISSBGUFkIvZyFYK+WcQW/LurD4Hwn
 pHSCjIZ9tf2IcQ5vH73Drq5HyFwHXtHzuF6SS+o=
X-Google-Smtp-Source: ABdhPJzyFkCkLFwk2uiu55UbxfUmfSs3x9iDpfEO2XzZ1mh9E9zaiS00R4pCw1xb9Wsx0R973/NIBGmLnXTfXz/Q4Mk=
X-Received: by 2002:ab0:1112:0:b0:33e:802f:e335 with SMTP id
 e18-20020ab01112000000b0033e802fe335mr3769822uab.57.1645805235064; Fri, 25
 Feb 2022 08:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-17-guoren@kernel.org>
 <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
 <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
 <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
In-Reply-To: <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Feb 2022 00:07:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQtUonLQn+aRyf6f1Ei9o6wWCrjHXNkfa2rxKMEGuDw2g@mail.gmail.com>
Message-ID: <CAJF2gTQtUonLQn+aRyf6f1Ei9o6wWCrjHXNkfa2rxKMEGuDw2g@mail.gmail.com>
Subject: Re: [PATCH V6 16/20] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_080719_789261_CC90AEB5 
X-CRM114-Status: GOOD (  20.51  )
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

On Fri, Feb 25, 2022 at 11:50 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Feb 25, 2022 at 4:42 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Arnd & Palmer,
> >
> > Here is the new modified compat_vdso/Makefile, please have a look,
> > first. Then I would update it to v7:
> > ===========================================
> > # SPDX-License-Identifier: GPL-2.0-only
> > #
> > # Makefile for compat_vdso
> > #
> >
> > # Symbols present in the compat_vdso
> > compat_vdso-syms  = rt_sigreturn
> > compat_vdso-syms += getcpu
> > compat_vdso-syms += flush_icache
> >
> > ifdef CROSS_COMPILE_COMPAT
> >         COMPAT_CC := $(CROSS_COMPILE_COMPAT)gcc
> >         COMPAT_LD := $(CROSS_COMPILE_COMPAT)ld
> > else
> >         COMPAT_CC := $(CC)
> >         COMPAT_LD := $(LD)
> > endif
> >
> > COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
> > COMPAT_LD_FLAGS := -melf32lriscv
>
> Have you come across a case in which a separate cross toolchain
> is required? If not, I would leave this out and just set the flags for the
> normal toolchain.
Okay

>
> I also think it would be a nicer split to build the two vdso variants
> as vdso64/vdso32 rather than vdso/compat_vdso. That way,
> the build procedure can be kept as close as possible to the
> native 32-bit build.
Yes, current native 32-bit vdso & 64-bit vdso use the same
vdso/Makfile. So, I think it could be another patch for this cleanup.

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
