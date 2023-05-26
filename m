Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF3C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=My1y61uInQFKJGAufnWTVEOYqqWM+DXYHZHyNdrtm28=; b=ILtH6I4jRuzDWu
	j/wl9424D+EUiUnvFFTbI1nBKcNswg5yjUk+pR0XUp4n5t2aUNi2pnb0YDl+n3GZ0P+PXKriyO7lJ
	zSfujNA1T8I0eUgunX7HTZj7cD7S9JpPP+k1+AkPILCUjtwUm20Fb3Os2rNI0nLQHTtLXXt63muJt
	Eia+fMJPUqHct9yELO5K9zr+wL1bTkJMGSPfH/9YMXF1fDjFxmka3NoJLUnTBEnGzuvR1OTJXHNaF
	zF7XQkXRSjAYZpepFGC+P0rLlaJ6LiY0arJEjTg2T8oCN57prt+2k32MuyAmcnoT0IwzEpGc7tCgg
	n6z5zyvxQQv8ojBwueLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tcx-001lh9-1i;
	Fri, 26 May 2023 09:20:51 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tct-001lcr-11
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 09:20:49 +0000
X-QQ-mid: bizesmtp86t1685092831tk05nm7x
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 May 2023 17:20:29 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: zT6n3Y95oi0OOe4oJd0XTOvYouL6ztJewAQudbeCnuvGUqGMwtkEls6aRow1/
	ms+/LDOG+HSUkm3CofTvcxZW9agcv2QpPYkesok5ytX+mMkzTNYOWph+Tug9f5Ve/1vMj6B
	lCeGH3TiqlibPxr1zZ1T3DKMMGunN4gb7kzyeS/j++fdcIdWcklxYQYDsI0m/evq1R3yWPg
	bggTVATzd91+1w+JIhvouBDtJkIZk1DaqenI6vR0ceth2IszRufH1fKmNSrAx9DSusew1z/
	fSc8UzNLK3OvoImtSJi6gir1cH/KtJk3R1ghbaqeBGAW+6DZZjwzmBoq/UJCrIQWl7LOutI
	DAoea1W7yHgSLY5tVI3bemgDZklKWHKGlMLcdlR3ZciTI9ovPw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13601143619123755579
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	w@1wt.eu
Subject: Re: [PATCH 05/13] selftests/nolibc: riscv: customize makefile for rv32
Date: Fri, 26 May 2023 17:20:29 +0800
Message-Id: <20230526092029.149351-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4a3b1cdf-91d5-4668-925e-21f8f5c64a92@t-8ch.de>
References: <4a3b1cdf-91d5-4668-925e-21f8f5c64a92@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_022047_676221_904EF647 
X-CRM114-Status: GOOD (  22.13  )
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

Hi, Thomas

> On 2023-05-25 01:50:57+0800, Zhangjin Wu wrote:
> > both riscv64 and riscv32 have the same ARCH value, it is riscv, the
> > default defconfig enables 64bit, to support riscv32, let's allow pass
> > "ARCH=riscv32" or "ARCH=riscv CONFIG_32BIT=1" to customize riscv32
> > setting.
> 
> What's the advantage of doing CONFIG_32BIT? For i386/x86_64, arm/arm64
> it's not necessary either.
> (Let's ignore the "x86" case)
>

Very good question, thanks.

This requirement may happen on mips, loongarch and even powerpc too, both x86
and arm are just the 'exception'.

It is 'designed' as a temp flag/variable to specifiy that current arch is
riscv32, not riscv64, of course, we can use something like this or even
use a meaningless 't' variable:

    # Allow pass ARCH=riscv|riscv32|riscv64, riscv implies riscv64
    ifneq ($(findstring xriscv,x$(ARCH)),)
      riscv32 := $(if $(findstring riscv32x,$(ARCH)x),1)
      override ARCH := riscv
    endif

Using CONFIG_32BIT instead of riscv32 has some extra considerations:

* Using it in command line is a 'side effect', if it is a meaningless
  variable, we will not use it for we can not remember it, here use it as a
  choice, riscv32 is enough, we can simply remove this comment from the
  commit message.

* The architectures like riscv, mips, loongarch share the same source code tree
  between 32bit and 64bit and even 128bit in the future, x86 and arm just not
  do so.

  The ARCH specified here differs from the one to kernel make, we should
  provide a flag/variable or anther ARCH variant to show the
  difference, _ARCH or XARCH have been used in my local patch.

  CONFIG_32BIT is meaningful to reflect the difference, even for future,
  we can use the same thing CONFIG_64BIT, CONFIG_128BIT, so simply
  BITS=32, BITS=64, BITS=128, but that is hard to be used as a oneline
  condition statement (although we can use something like findstring).

      $(if $(findstring x32y,x$(BITS)y),something whatevever)

      v.s.

      $(if $(CONFIG_32BIT),something whatevever)

  If not use a tmp flag/variable, this works too, but duplicated :-)

      $(if $(findstring xriscv32y,x$(ARCH)y),something whatevever)

* We are able to auto detect this config from include/config/auto.conf,
  there will be something like CONFIG_32BIT=y there.

  we did use such auto detect logic in my local patch, but it has some
  issues if we want a riscv64 build after we did a riscv32 config if we
  only pass ARCH=riscv, so, I just removed that logic but reserved the
  pontential for future.

> If for riscv the "normal" version is riscv64 then adding a new "riscv32" that
> works the same as the other architectures seems nicer and easier.
> 

The complexity here is what just explained above: The ARCH specified
here differs from the one to kernel make.

It is ok to add riscv32 like the other architectures as following:

    ifeq ($(ARCH),riscv32)
      _ARCH := riscv
    else
      _ARCH := $(ARCH)
    endif

    IMAGE_riscv32 = arch/riscv/boot/Image
    DEFCONFIG_riscv32 = rv32_defconfig
    QEMU_ARCH_riscv32 = riscv32
    QEMU_ARGS_riscv32 = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
    CFLAGS_riscv32 = -march=rv32im -mabi=ilp32

And all of the other 'ARCH' variables passed to kernel 'make' should be
changed to $(_ARCH), include most of the core targets, like:

    sysroot/$(ARCH)/include:
	$(Q)rm -rf sysroot/$(ARCH) sysroot/sysroot
	$(QUIET_MKDIR)mkdir -p sysroot
	$(Q)$(MAKE) -C ../../../include/nolibc ARCH=$(_ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
	$(Q)mv sysroot/sysroot sysroot/$(ARCH)

    defconfig:
    	$(Q)$(MAKE) -C $(srctree) ARCH=$(_ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
    
    kernel: initramfs
    	$(Q)$(MAKE) -C $(srctree) ARCH=$(_ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
    
It is not that easier, it touched more source code and make things a
little complex, we must mixes the using of ARCH and _ARCH in the whole
Makefile and that is not comfortable and may introduce more complexity,
for example, we may be worry about if the directories should be named
with the new $(_ARCH) ;-)

And CONFIG_32BIT variable is better than riscv32, because, we can share this
meaningful variable among mips, loongarch in the future if their maintainers
want to add more variants support for such platforms, they will meet the same
requirement.

Thanks very much.

Best regards,
Zhangjin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
