Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F19EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gf0Xn24XZf+RvxD1/ZpsIGpI0Z48m2Xd6DNMHn7K71I=; b=rJHKgq6uFdl4lb
	pN4sEopPTeoSe1bRXF/X/c6RLULpji/d6UQLxIQNKdwONCJ67eG2rzBpS+LoJv5PLrlHEqnrfMAKT
	vcPZkU1mfsZhevA8+xj0bMjWhiRl4v+lNXBJu+m22e2yF2Vanpw9g4HjbWJXXi9SwVwpJp8q+FjcG
	nua1KCiPwDrYrBgB66IUc0RRdC0DsQPKC8N5ibVWrmtzQqoiNWWmz1ZPj57Tq+gmJULIt63XxUM0b
	ZL0bR4r9BvsdqkWYG7qvERW1VI/qffJqJ3WFlupUxXHNnAuNKI2DCkrLccy9wnD0JbARu098Eny5E
	UVSOlc9P9z+n7LNJQUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG0hO-008BOa-1k;
	Sun, 02 Jul 2023 17:17:22 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG0hL-008BO8-2p
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 17:17:21 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362HHF1L016977;
	Sun, 2 Jul 2023 19:17:15 +0200
Date: Sun, 2 Jul 2023 19:17:15 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v5 5/5] selftests/nolibc: riscv: customize makefile for
 rv32
Message-ID: <20230702171715.GD16233@1wt.eu>
References: <cover.1687176996.git.falcon@tinylab.org>
 <2ebfb48c66b18a5fd7d0bd6b7c832a5d8ce6486f.1687176996.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ebfb48c66b18a5fd7d0bd6b7c832a5d8ce6486f.1687176996.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_101720_588743_7CDB76AD 
X-CRM114-Status: GOOD (  26.38  )
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

On Mon, Jun 19, 2023 at 08:29:38PM +0800, Zhangjin Wu wrote:
> Both riscv64 and riscv32 have:
> 
> * the same arch/riscv source code tree
> * the same tools/include/nolibc/arch-riscv.h
> * the same ARCH=riscv value passed to top-level kernel Makefile
> 
> The only differences are:
> 
> * riscv64 uses defconfig, riscv32 uses rv32_defconfig
> * riscv64 uses qemu-system-riscv64, riscv32 uses qemu-system-riscv32
> * riscv32 has different compiler options (-march= and -mabi=)
> 
> So, riscv32 can share most of the settings with riscv64, add riscv32
> support like the original ARCH=riscv support.
> 
> To align with x86, the default riscv is reserved for riscv64 and a new
> riscv64 is also added to allow users pass ARCH=riscv64 directly.
> 
> Since top-level kernel Makefile only accept ARCH=riscv, to make kernel
> happy, let's set kernel specific KARCH as riscv for both riscv32 and
> riscv64.
> 
> And since they share the same arch-riscv.h, let's set nolibc specific
> NARCH as riscv too.
> 
> Usage:
> 
>     $ make defconfig ARCH=riscv32 CROSS_COMPILE=riscv64-linux-gnu- ...
>     $ make run ARCH=riscv32 CROSS_COMPILE=riscv64-linux-gnu- ...

I'm hesitating on this one. Till now the ARCH variable taken on input
was *exactly* the one used by the kernel. We include some scripts very
early and we don't control the possible usage of ARCH. There's also
this at the top of the makefile:

  # when run as make -C tools/ nolibc_<foo> the arch is not set
  ifeq ($(ARCH),)
  include $(srctree)/scripts/subarch.include
  ARCH = $(SUBARCH)
  endif

So as you can see $(ARCH) is still very intimate with the kernel's.
For x86 it's no big deal because the i386 and x86_64 names are real
valid archs. The difficulty we're having with riscv is that 32 and 64
are two distinct archs for all tools but not for the kernel, and it
looks like the only difference is in the config itself.

Given that we call all tools explicitly and that the kernel does a lot
of implicit things with $(ARCH), I'm wondering if it wouldn't be more
robust for the long term to instead add a "VARIANT" variable for the
test only that would enforce "riscv32" or "riscv64" where needed (note
that I'm not sold on this variable's name, it's to illustrate). Because
if you look closely, you'll note that the nolibc source does not use
this difference since its arch is always equal to the kernel's, and
only the test requires it. I wouldn't be shocked by having more test
options than we have architectures, and I noticed in another series
that you were also proposing to extend config options, so I think it
goes in the same direction. Then we could have in the test's Makefile
a check for this VARIANT being set, which would preset ARCH when
defined, and being used to configure Qemu. Maybe it could more or
less look like this (for the selftest Makefile I mean) :

  # maps variants to nominal archs
  ARCH_VARIANT_riscv32 = riscv
  ARCH_VARIANT_riscv64 = riscv

  # default variants for some archs
  DEF_VARIANT_riscv    = riscv64

  VARIANT :=
  ARCH    ?= $(or $(ARCH_VARIANT_$(VARIANT)),$(VARIANT))
  VARIANT ?= $(or $(DEF_VARIANT_$(ARCH)),$(ARCH))

Modulo the possible typos above, you probably get the idea. If ARCH is
set, it will be used and automatically set the variant to the default
one for the arch. And if VARIANT is set, it will set the correct
default ARCH. It's possible to force the two in conflicting ways that
will not work but we don't care, it's like for the rest of the variables.
But at least we're never passing invalid values into ARCH anymore and I
find this much safer.

What do you think ?

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
