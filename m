Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0E0C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 07:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgzaSNsUaCqfnQeZY5wwp7xDP0QRnEONzIjYRhWtTsc=; b=pGhXwijlga0quG
	YK5bxE1b58Nfk1X4RAFle50GiYqKLxRK7JSvDJXuuF2MIjU/f0bjlG3jv4uq8Of6YXlOyEjTl8e1u
	V72dQfo070Wtxr+PwIoiwyXT4vwZez/Nbg5kIPpNqRGTNtdAmm0lUf7SK24zFyFIsVFGAEpIUVVcj
	DCCGXuWlFrEmYgOTGBjE97EYnxVl14HVMX9CUciMcz94CRwItA/u7HhlrOdGsSXIiMJQ5RKP0Zb8M
	XArFyfcFgMS2k1woD3HhlRjGnNYTgSKQlRjXi+iR22m8+GLo8fRcJPdJMIKSNUvsKAHVfUtM5ZbXp
	3XZu88T5p8+1yK1gFIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ng2-004kPe-1k;
	Wed, 07 Jun 2023 07:33:54 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nfy-004kKZ-2V
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 07:33:53 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3577XKq2032278;
	Wed, 7 Jun 2023 09:33:20 +0200
Date: Wed, 7 Jun 2023 09:33:20 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v3 3/3] selftests/nolibc: riscv: customize makefile for
 rv32
Message-ID: <ZIAywHvr6UB1J4of@1wt.eu>
References: <ZIAEybZdXywKv43C@1wt.eu>
 <20230607063314.671429-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607063314.671429-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_003351_429646_E3DCA8FA 
X-CRM114-Status: GOOD (  27.58  )
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

On Wed, Jun 07, 2023 at 02:33:14PM +0800, Zhangjin Wu wrote:
> > That can be one approach indeed. Another one if we continue to face
> > difficulties for this one would be to use a distinct KARCH variable
> > to assign to ARCH in all kernel-specific operations.
> >
> 
> Yeah, I have replied that method to Arnd and Thomas too, it looks like this:
> 
>     ifneq ($(findstring riscv,$(ARCH)),)
>       _ARCH = riscv
>     else
>       _ARCH = $(ARCH)
>     endif
> 
>     ...
> 
>     sysroot/$(ARCH)/include:
> 	$(Q)rm -rf sysroot/$(ARCH) sysroot/sysroot
> 	$(QUIET_MKDIR)mkdir -p sysroot
> 	$(Q)$(MAKE) -C ../../../include/nolibc ARCH=$(_ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
> 	$(Q)mv sysroot/sysroot sysroot/$(ARCH)
> 
>     defconfig:
>     	$(Q)$(MAKE) -C $(srctree) ARCH=$(_ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
> 
>     kernel: initramfs
>     	$(Q)$(MAKE) -C $(srctree) ARCH=$(_ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
> 
> Using KARCH seems better than _ARCH:
> 
>     ifneq ($(findstring riscv,$(ARCH)),)
>       KARCH = riscv
>     else
>       KARCH = $(ARCH)
>     endif
(...)

At least it suggests what it's going to be used for instead of just
being marked as "special" (something the underscore does).

> but the new method mentioned here differs, it split the whole Makefile
> to two 'parts', the before part accept something like ARCH=riscv32,
> ARCH=riscv64, ARCH=riscv, the after part use the ARCH=riscv, this avoid
> touch the targets context:

We don't care about touching *code*. What is important is that it scales
and is understandable, thus maintainable. Code that has many exceptions
or requires a lot of head scratching to figure what's being done is a
pain to maintain and nobody wants to take the risk to touch it. That was
exactly the purpose of the enumeration of per-target args, flags etc in
the makefile: nobody needs to be expert in multiple areas to touch their
own area. If we face a showstopper, we need to address it, and not work
around it for the sake of touching less context.

>     ... variable assignments before this line ...
> 
>     +# Some architectures share the same arch/<ARCH>/ source code tree among the <ARCH>xyz variants
>     +# Top-level kernel Makefile only accepts ARCH=<ARCH>, override <ARCH>xyz variants to make kernel happy
>     +ARCHS := riscv
>     +_ARCH := $(strip $(foreach arch, $(ARCHS), $(if $(findstring x$(arch),x$(ARCH)),$(arch))))
>     +ifneq ($(_ARCH),)
>     +override ARCH := $(_ARCH)
>     +endif
>     +

So actually this is a perfect example of head scratching for me. I suspect
it would replace x86_64 with x86 if x86 would be placed there for example,
though it would not change anything for i386. Maybe for s390/s390x,
arm/arm64 or ppc/ppc64 etc it would act similarly while these are different
archs. Thus this seems to be trying to generalize a rule around a single
particular case.

Probably that instead this particular case should be addressed explicitly
until we find a generalization (if ever) to other archs:

  ifeq($(ARCH),riscv32)
  override ARCH := riscv
  else ifeq($(ARCH),riscv64)
  override ARCH := riscv
  endif
  endif

Or maybe even better you can decide to remap arch names explicitly:

  # use KARCH_from=to to rename ARCH from $from to $to past this point.
  KARCH_riscv32 := riscv
  KARCH_riscv64 := riscv
  ...
  ifneq($(KARCH_$(ARCH)),)
  override ARCH := $(KARCH_$(ARCH))
  endif

And this does deserve an explicit note in the makefile that anything
using $(ARCH) using a macro will see the renamed arch while anything
using it as a variable before that line will see the original one.

If you want to avoid the '=' vs ':=' mess you can even keep a copy of
the original ARCH at the beginning of the makefile:

  # keep a copy of the arch name requested by the user, for use later
  # when the original form is preferred over the kernel's arch name.
  USER_ARCH = $(ARCH)

> Willy, Which one do you prefer?

The most explicit ones like above. Generally speaking when you try to
add support for your own arch here, you look there for similar ones,
where commands are called, and read in reverse mode till the beginning,
hoping to understand the transformations. I think the current ones and
the proposed ones above are self-explanatory. Anything doing too much
magic renaming or doing too much hard-coded automatic stuff can quickly
obfuscate the principle and make things more complicated. I already
despise "override" because it messes up with macros, but I agree it can
sometimes have some value. If you dup it into ORIG_ARCH or USER_ARCH,
and modify the few lines overriding arch in an explicit manner, I think
it would preserve its maintainability.

What do you think ?

thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
