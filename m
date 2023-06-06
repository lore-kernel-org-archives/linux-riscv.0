Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF56AC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PafHH839GBR1dgxoPruR0UIwu+ZXq3I7hebUsaPjTE=; b=UUt0rizKxuaI77
	BdEBBT9f3rvnSTNxR3DJr1VYcyjFSEOBrC/2AsMLZIVlcXXej2XrMmGwEcNmA9cQZWR2TC4pLMY9w
	kozPZ1VWLYNquqazTQ1XrsRoSQu8FWcA4cKqxCm9HLCwTcDtxglxJzG1I1IOyFGcDiDn12jol6j5b
	Uo2KN/MOURx+zcgDw+QiM/CcSpm6d2SSyCbKrL4R4SlhCt4mTwcPHfl7Js7MowpAk8DhzcDF97kVr
	ajYuSe+3QSrflwHhfuD74g042wty8eY1gt25ZdT3ijema96Bdy3WYZqN8shK68xjpI5rA1cJ4vJsU
	3JKDUnRcOPkucBItzzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VU5-001YGA-2Z;
	Tue, 06 Jun 2023 12:08:21 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VU1-001YCs-30
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 12:08:20 +0000
X-QQ-mid: bizesmtp89t1686053276t98i3jm8
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 20:07:55 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: znfcQSa1hKajglO8GZtD0A58FeSeP/1PWkijK+XI8S8AKw25d1Xb+aXkSwg95
	VXWtowwEFO26BQ6vjp5rwC4OER1H/C6bkt8J6uWQUpDWTXJRIyfj2Tl7DigynoKIlhSuuef
	y3e1ZDlBMrHDjQh+D3etgEaknwArG/fyPuJnNEAETwq3KKDgPc/cudmG4X7cRac6bJc2AkB
	oGzctCe+d/8x/OxpUDappP96VYMrcR6GmSN4B73vtAZhn+1sy3PFy0QhxkCPgg7TjOPsoix
	NsvI9M4jP8vSIvK+RY7BLn7aqui/ejj+lsvfO+wNw2uWhcdW7VsiapkLwqRcMSxXqx9vo3v
	5Bcb0SvhrHFJYPuBe2jSfPHw7Fsin1dQ+KiZ6sNs53cp6pm7HWHgcoxWTXcHQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14342564991954658318
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: Re: [PATCH v3 3/3] selftests/nolibc: riscv: customize makefile for rv32
Date: Tue,  6 Jun 2023 20:07:55 +0800
Message-Id: <20230606120755.548017-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <63133024-e986-44e2-86f5-efc1c42207ac@app.fastmail.com>
References: <63133024-e986-44e2-86f5-efc1c42207ac@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_050818_285925_36C59C70 
X-CRM114-Status: GOOD (  30.21  )
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

> On Tue, Jun 6, 2023, at 13:12, Zhangjin Wu wrote:
> >> On Sat, Jun 3, 2023, at 11:05, Zhangjin Wu wrote:
> >> would seem more consistent with how x86 is handled, and would
> >> probably be more easily extensible if we want to also make
> >> this work with other sub-targets like mipseb, armv5 or ppc32
> >> in the future.
> >
> > As Arnd and Thomas suggested to align with x86, I just tried to find a
> > solution to avoid mixing the use of _ARCH and ARCH in this Makefile.
> >
> > Since both riscv32 and riscv64 share the same SRCARCH=riscv (arch/riscv),
> > and the kernel side doesn't accept riscv32 or riscv64 currently, we need to
> > manually convert them to _ARCH=riscv and pass them to the kernel makefile
> > like this: ARCH=$(_ARCH), it mixes the use of _ARCH and ARCH, this is why I
> > used the '$(if' method currently.
> >
> > The solution is adding something like x86 in the kernel Makefile:
> >
> >     diff --git a/Makefile b/Makefile
> >     index 9d765ebcccf1..a442c893d795 100644
> >     --- a/Makefile
> >     +++ b/Makefile
> >     @@ -415,6 +415,14 @@ ifeq ($(ARCH),parisc64)
> >             SRCARCH := parisc
> >      endif
> >
> >     +# Additional ARCH settings for riscv
> >     +ifeq ($(ARCH),riscv32)
> >     +        SRCARCH := riscv
> >     +endif
> >     +ifeq ($(ARCH),riscv64)
> >     +        SRCARCH := riscv
> >     +endif
> >     +
> >      export cross_compiling :=
> >      ifneq ($(SRCARCH),$(SUBARCH))
> >      cross_compiling := 1
>
> I've never been a big fan of the top-level $(ARCH) setting
> in the kernel, is there a reason this has to be the same
> as the variable in tools/include/nolibc? If not, I'd just
> leave the Linux Makefile unchanged.
>
> For userspace we have a lot more target names than
> arch/*/ directories in the kernel, and I don't think
> I'd want to enumerate all the possibilities in the
> build system globally.

Ok, agree very much, it is the root cause why we used the old method
before, because I don't want to touch the top-level Makefile, here
explains the details again just as did for Thomas and Willy [1] ;-)

Without the top-level makefile change, we must add something in
selftests/nolibc/Makefile like this, because the kernel makefile doesn't
accept something like ARCH=riscv32 and ARCH=riscv64 currently, it only
accepts ARCH=riscv (will paste the code later).

    ifneq ($(findstring riscv,$(ARCH)),)
      _ARCH = riscv
    else
      _ARCH = $(ARCH)
    endif

    ...

    sysroot/$(ARCH)/include:
	$(Q)rm -rf sysroot/$(ARCH) sysroot/sysroot
	$(QUIET_MKDIR)mkdir -p sysroot
	$(Q)$(MAKE) -C ../../../include/nolibc ARCH=$(_ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
	$(Q)mv sysroot/sysroot sysroot/$(ARCH)

    defconfig:
    	$(Q)$(MAKE) -C $(srctree) ARCH=$(_ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare

    kernel: initramfs
    	$(Q)$(MAKE) -C $(srctree) ARCH=$(_ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs

The above change really works, but it looks not that good, this is the
mixing use of _ARCH and ARCH I mentioned in last reply.

Otherwise, we will get such error:

    $ make run ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu-
      MKDIR   sysroot/riscv64/include
    make[1]: Entering directory '/labs/linux-lab/src/linux-stable/tools/include/nolibc'
    make[2]: Entering directory '/labs/linux-lab/src/linux-stable'
    Makefile:763: arch/riscv64/Makefile: No such file or directory
    make[2]: *** No rule to make target 'arch/riscv64/Makefile'.  Stop.
    make[2]: Leaving directory '/labs/linux-lab/src/linux-stable'
    make[1]: *** [Makefile:87: headers_standalone] Error 2
    make[1]: Leaving directory '/labs/linux-lab/src/linux-stable/tools/include/nolibc'
    make: *** [Makefile:129: sysroot/riscv64/include] Error 2
    $ make run ARCH=riscv32 CROSS_COMPILE=riscv64-linux-gnu-
      MKDIR   sysroot/riscv32/include
    make[1]: Entering directory '/labs/linux-lab/src/linux-stable/tools/include/nolibc'
    make[2]: Entering directory '/labs/linux-lab/src/linux-stable'
    Makefile:763: arch/riscv32/Makefile: No such file or directory
    make[2]: *** No rule to make target 'arch/riscv32/Makefile'.  Stop.
    make[2]: Leaving directory '/labs/linux-lab/src/linux-stable'
    make[1]: *** [Makefile:87: headers_standalone] Error 2
    make[1]: Leaving directory '/labs/linux-lab/src/linux-stable/tools/include/nolibc'
    make: *** [Makefile:129: sysroot/riscv32/include] Error 2

That's because in top-level Makefile, it doesn't accept ARCH=riscv32 and
ARCH=riscv64, but x86 and sparc and even parisc support such variants,
this allows the ARCH variants share the same arch/<SRCARCH>/ source code
tree, otherwise, they will directly find the arch/<ARCH>/ source code,
then fails.

    top-level Makefile:

    ...
    ARCH            ?= $(SUBARCH)

    # Architecture as present in compile.h
    UTS_MACHINE     := $(ARCH)
    SRCARCH         := $(ARCH)   ---> SRCARCH is assigned as ARCH by default

    # Additional ARCH settings for x86
    ifeq ($(ARCH),i386)
            SRCARCH := x86
    endif
    ifeq ($(ARCH),x86_64)
            SRCARCH := x86
    endif

    # Additional ARCH settings for sparc
    ifeq ($(ARCH),sparc32)
           SRCARCH := sparc
    endif
    ifeq ($(ARCH),sparc64)
           SRCARCH := sparc
    endif

    # Additional ARCH settings for parisc
    ifeq ($(ARCH),parisc64)
           SRCARCH := parisc
    endif

So, to really align with x86, we should let the top-level makefile be
able to get the right SRCARCH for riscv32 and riscv64 too ;-)

I even tried to pass SRCARCH=riscv to the top-level Makefile, but it
failed:

    diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
    index 1b2247a6365d..04067776b569 100644
    --- a/tools/testing/selftests/nolibc/Makefile
    +++ b/tools/testing/selftests/nolibc/Makefile
    @@ -14,6 +14,10 @@ include $(srctree)/scripts/subarch.include
     ARCH = $(SUBARCH)
     endif

    +ifneq ($(findstring riscv,$(ARCH)),)
    +SRCARCH := SRCARCH=riscv
    +endif
    +
     # kernel image names by architecture
     IMAGE_i386       = arch/x86/boot/bzImage
     IMAGE_x86_64     = arch/x86/boot/bzImage
    @@ -126,7 +130,7 @@ sysroot: sysroot/$(ARCH)/include
     sysroot/$(ARCH)/include:
            $(Q)rm -rf sysroot/$(ARCH) sysroot/sysroot
            $(QUIET_MKDIR)mkdir -p sysroot
    -       $(Q)$(MAKE) -C ../../../include/nolibc ARCH=$(ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
    +       $(Q)$(MAKE) -C ../../../include/nolibc ARCH=$(ARCH) $(SRCARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
            $(Q)mv sysroot/sysroot sysroot/$(ARCH)

     nolibc-test: nolibc-test.c sysroot/$(ARCH)/include
    @@ -150,10 +154,10 @@ initramfs: nolibc-test
            $(Q)cp nolibc-test initramfs/init

     defconfig:
    -       $(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
    +       $(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) $(SRCARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare

     kernel: initramfs
    -       $(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
    +       $(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) $(SRCARCH )CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs

     # run the tests after building the kernel
     run: kernel

    $ make run ARCH=riscv32 CROSS_COMPILE=riscv64-linux-gnu- QEMU_ARGS_EXTRA="-bios /labs/linux-lab/opensbi-riscv32-generic-fw_dynamic.bin"
      MKDIR   sysroot/riscv32/include
    make[1]: Entering directory '/labs/linux-lab/src/linux-stable/tools/include/nolibc'
    make[2]: Entering directory '/labs/linux-lab/src/linux-stable'
    Makefile:397: srcarch: riscv
    make[2]: Leaving directory '/labs/linux-lab/src/linux-stable'
    make[2]: Entering directory '/labs/linux-lab/src/linux-stable'
    Makefile:397: srcarch: riscv
      INSTALL /labs/linux-lab/src/linux-stable/tools/testing/selftests/nolibc/sysroot/sysroot/include
    make[2]: Leaving directory '/labs/linux-lab/src/linux-stable'
    make[1]: Leaving directory '/labs/linux-lab/src/linux-stable/tools/include/nolibc'
      CC      nolibc-test
      MKDIR   initramfs
      INSTALL initramfs/init
    make[1]: Entering directory '/labs/linux-lab/src/linux-stable'
    Makefile:397: srcarch: riscv32
      SYNC    include/config/auto.conf.cmd
    Makefile:397: srcarch: riscv32
    Makefile:687: arch/riscv32/Makefile: No such file or directory
    make[2]: *** No rule to make target 'arch/riscv32/Makefile'.  Stop.
    make[1]: *** [Makefile:795: include/config/auto.conf.cmd] Error 2
    make[1]: Leaving directory '/labs/linux-lab/src/linux-stable'

So, to keep consistent eventually, perhaps we do need to touch the
top-level Makefile.

Best regards,
Zhangjin

[1]: https://lore.kernel.org/linux-riscv/20230526092029.149351-1-falcon@tinylab.org/

>     Arnd


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
