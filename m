Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814E7C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 04:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZax4/xZQktnGpVY1nDvU4Eew8W48aMZTzQ94t2EFsk=; b=COc6IlZno10oAG
	mJ6rkok7iD1E7kqDT7ESiP3JTuHP314RY5oJcMbL+s4JUgttcON3YW7ELYYCU/B3wFCjCPx0xw5rI
	4sQkPYieiH4ATXM2MFt02qjpIMuMlbnNe9xYl1mYJNAnIfFBZXwdiwSbn5oKfV2ib7nKeV32Wptzc
	3inSkBPsdNpfgJBv24KvN5x/OZfs++Du8l74rXBTscWKppIekuBgheoLZ2q6ssMEhLRHAu1K2+Hep
	Wudu0Biv78vAKWHPdF5CJlczwbh8bVJxhTvzFgZBHdTGAAuJVZZZ+H6MepgnygP4Vopj3KYtoyQTL
	/tGwE0rYBvB8eF0KHVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6kbn-004GsY-3A;
	Wed, 07 Jun 2023 04:17:19 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6kbl-004Grq-1y
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 04:17:19 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3574HDVJ030768;
	Wed, 7 Jun 2023 06:17:13 +0200
Date: Wed, 7 Jun 2023 06:17:13 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, thomas@t-8ch.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] selftests/nolibc: riscv: customize makefile for
 rv32
Message-ID: <ZIAEybZdXywKv43C@1wt.eu>
References: <20230606120755.548017-1-falcon@tinylab.org>
 <20230607012032.585223-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607012032.585223-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_211718_244338_D428B2ED 
X-CRM114-Status: GOOD (  29.45  )
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

Hi,

On Wed, Jun 07, 2023 at 09:20:32AM +0800, Zhangjin Wu wrote:
> Arnd, Thomas, Willy
> 
> > > >     +# Additional ARCH settings for riscv
> > > >     +ifeq ($(ARCH),riscv32)
> > > >     +        SRCARCH := riscv
> > > >     +endif
> > > >     +ifeq ($(ARCH),riscv64)
> > > >     +        SRCARCH := riscv
> > > >     +endif
> > > >     +
> > > >      export cross_compiling :=
> > > >      ifneq ($(SRCARCH),$(SUBARCH))
> > > >      cross_compiling := 1
> > >
> > > I've never been a big fan of the top-level $(ARCH) setting
> > > in the kernel, is there a reason this has to be the same
> > > as the variable in tools/include/nolibc? If not, I'd just
> > > leave the Linux Makefile unchanged.
> > >
> > > For userspace we have a lot more target names than
> > > arch/*/ directories in the kernel, and I don't think
> > > I'd want to enumerate all the possibilities in the
> > > build system globally.

Actually it's not exactly used by nolibc, except to pass to the kernel
for the install part to extract kernel headers (make headers_install).
It's one of the parts that has required to stick to most of the kernel's
variables very closely (the other one being for nolibc-test which needs
to build a kernel).

> Good news, I did find a better solution without touching the top-level
> Makefile, that is overriding the ARCH to 'riscv' just before the targets
> and after we got the necessary settings with the original ARCH=riscv32
> or ARCH=riscv64, but it requires to convert the '=' assignments to ':=',
> which is not that hard to do and it is more acceptable, just verified it
> and it worked well.
> 
>     ...
> 
>      LDFLAGS := -s
> 
>     +# top-level kernel Makefile only accept ARCH=riscv, override ARCH to make kernel happy
>     +ifneq ($(findstring riscv,$(ARCH)),)
>     +override ARCH := riscv
>     +endif
>     +

That can be one approach indeed. Another one if we continue to face
difficulties for this one would be to use a distinct KARCH variable
to assign to ARCH in all kernel-specific operations.

>      help:
>             @echo "Supported targets under selftests/nolibc:"
>             @echo "  all          call the \"run\" target below"
> 
> This change is not that big, and the left changes can keep consistent with the
> other platforms. but I still need to add a standalone patch to convert the '='
> to ':=' to avoid the before setting using our new overridded ARCH.

I don't even see why the other ones below are needed, given that as
long as they remain assigned as macros, they will be replaced in-place
where they are used, so they will reference the last known assignment
to ARCH.

>     ++ b/tools/testing/selftests/nolibc/Makefile
>     @@ -26,7 +26,7 @@ IMAGE_riscv64    = arch/riscv/boot/Image
>      IMAGE_riscv      = arch/riscv/boot/Image
>      IMAGE_s390       = arch/s390/boot/bzImage
>      IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
>     -IMAGE            = $(IMAGE_$(ARCH))
>     +IMAGE           := $(IMAGE_$(ARCH))
>      IMAGE_NAME       = $(notdir $(IMAGE))
> 
>      # default kernel configurations that appear to be usable
>     @@ -41,7 +41,7 @@ DEFCONFIG_riscv64    = defconfig
>      DEFCONFIG_riscv      = defconfig
>      DEFCONFIG_s390       = defconfig
>      DEFCONFIG_loongarch  = defconfig
>     -DEFCONFIG            = $(DEFCONFIG_$(ARCH))
>     +DEFCONFIG           := $(DEFCONFIG_$(ARCH))
> 
>      # optional tests to run (default = all)
>      TEST =
>     @@ -58,7 +58,7 @@ QEMU_ARCH_riscv64    = riscv64
>      QEMU_ARCH_riscv      = riscv64
>      QEMU_ARCH_s390       = s390x
>      QEMU_ARCH_loongarch  = loongarch64
>     -QEMU_ARCH            = $(QEMU_ARCH_$(ARCH))
>     +QEMU_ARCH           := $(QEMU_ARCH_$(ARCH))
> 
>      # QEMU_ARGS : some arch-specific args to pass to qemu
>      QEMU_ARGS_i386       = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>     @@ -72,7 +72,7 @@ QEMU_ARGS_riscv64    = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_T
>      QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>      QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>      QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>     -QEMU_ARGS            = $(QEMU_ARGS_$(ARCH)) $(QEMU_ARGS_EXTRA)
>     +QEMU_ARGS           := $(QEMU_ARGS_$(ARCH)) $(QEMU_ARGS_EXTRA)
> 
>      # OUTPUT is only set when run from the main makefile, otherwise
>      # it defaults to this nolibc directory.
>     @@ -87,11 +87,18 @@ endif
>      CFLAGS_riscv32 = -march=rv32im -mabi=ilp32
>      CFLAGS_s390 = -m64
>      CFLAGS_STACKPROTECTOR ?= $(call cc-option,-mstack-protector-guard=global $(call cc-option,-fstack-protector-all))
>     -CFLAGS  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
>     +CFLAGS_default := -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
>                     $(call cc-option,-fno-stack-protector) \
>                     $(CFLAGS_$(ARCH)) $(CFLAGS_STACKPROTECTOR)
>     +
>     +CFLAGS  ?= $(CFLAGS_default)

Why did you need to split this one like this instead of proceeding
like for the other ones ? Because of the "?=" maybe ? Please
double-check that you really need to turn this from a macro to a
variable, if as I suspect it it's not needed, it would be even
simpler.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
