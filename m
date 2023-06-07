Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B942C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NofUfyoPUpU7jpdMQuB62GvKqKE62rV/ZLZbFcXrN/g=; b=hIZgrZ27fMXGxa
	/tv/7D7jc+4FswBnkviadKovXcL0l1ms+kxtGCRCe3osos5xlodvCTlf8hB2NnWgTc3vqL2EkaNYo
	ambFjQV0kUHyNdqf1SKuVCs8V2mt1ktfyVnqqbuSegAUK8uc35H+kEOreZRhqCoEivsNlFlFanJUm
	xcmQA/a4zXJU1C6UJfiSD112mPsKwMCioFTR2AfWJrqv2lIaKBGOKcHxIwh0IBXnMF2/Sf3IAKtjB
	giO+tCLWZZDJ+BrR9PPYa09AjjSCs/gSZ1kM0j4TNToBNk63BaK/niw5mcaNp1wUs7PZFHt9bQPqf
	hw1jf3eaBs5dN/RsxqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qf7-005XoK-1V;
	Wed, 07 Jun 2023 10:45:09 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qf4-005XnI-15
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 10:45:08 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 357AixTA001922;
	Wed, 7 Jun 2023 12:44:59 +0200
Date: Wed, 7 Jun 2023 12:44:59 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v3 3/3] selftests/nolibc: riscv: customize makefile for
 rv32
Message-ID: <ZIBfq3p29Z5QlIcj@1wt.eu>
References: <ZIAywHvr6UB1J4of@1wt.eu>
 <20230607081103.746962-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607081103.746962-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_034506_957080_B8056A40 
X-CRM114-Status: GOOD (  27.12  )
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

On Wed, Jun 07, 2023 at 04:11:03PM +0800, Zhangjin Wu wrote:
> This did inspire me a lot, so, what about simply go back to the KARCH
> method without any overriding:
> 
>     diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
>     index 4a3a105e1fdf..bde635b083f4 100644
>     --- a/tools/testing/selftests/nolibc/Makefile
>     +++ b/tools/testing/selftests/nolibc/Makefile
>     @@ -14,6 +14,12 @@ include $(srctree)/scripts/subarch.include
>      ARCH = $(SUBARCH)
>      endif
> 
>     +# kernel supported ARCH names by architecture
>     +KARCH_riscv32    = riscv
>     +KARCH_riscv64    = riscv
>     +KARCH_riscv      = riscv
>     +KARCH            = $(or $(KARCH_$(ARCH)),$(ARCH))
>     +
>      # kernel image names by architecture
>      IMAGE_i386       = arch/x86/boot/bzImage
>      IMAGE_x86_64     = arch/x86/boot/bzImage
>     @@ -21,6 +27,8 @@ IMAGE_x86        = arch/x86/boot/bzImage
>      IMAGE_arm64      = arch/arm64/boot/Image
>      IMAGE_arm        = arch/arm/boot/zImage
>      IMAGE_mips       = vmlinuz
> 
> And this:
> 
>     @@ -117,7 +132,7 @@ sysroot: sysroot/$(ARCH)/include
>      sysroot/$(ARCH)/include:
>             $(Q)rm -rf sysroot/$(ARCH) sysroot/sysroot
>             $(QUIET_MKDIR)mkdir -p sysroot
>     -       $(Q)$(MAKE) -C ../../../include/nolibc ARCH=$(ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
>     +       $(Q)$(MAKE) -C ../../../include/nolibc ARCH=$(KARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
>             $(Q)mv sysroot/sysroot sysroot/$(ARCH)
> 
>      nolibc-test: nolibc-test.c sysroot/$(ARCH)/include
>     @@ -141,10 +156,10 @@ initramfs: nolibc-test
>             $(Q)cp nolibc-test initramfs/init
> 
>      defconfig:
>     -       $(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
>     +       $(Q)$(MAKE) -C $(srctree) ARCH=$(KARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
> 
>      kernel: initramfs
>     -       $(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
>     +       $(Q)$(MAKE) -C $(srctree) ARCH=$(KARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
> 
> It is almost consistent with the original Makefile now.

If it works, I like it!

> I do like this method more than the override method now, the override
> method may break the maintainability a lot especially that the
> developers may be hard to know which ARCH value it is when he touch a
> line of the Makefile.

Yes definitely, add to this the risk that a patch applies at the wrong
line and only breaks one or two archs, etc.

> > Generally speaking when you try to
> > add support for your own arch here, you look there for similar ones,
> > where commands are called, and read in reverse mode till the beginning,
> > hoping to understand the transformations. I think the current ones and
> > the proposed ones above are self-explanatory. Anything doing too much
> > magic renaming or doing too much hard-coded automatic stuff can quickly
> > obfuscate the principle and make things more complicated. I already
> > despise "override" because it messes up with macros, but I agree it can
> > sometimes have some value. If you dup it into ORIG_ARCH or USER_ARCH,
> > and modify the few lines overriding arch in an explicit manner, I think
> > it would preserve its maintainability.
> >
> 
> Agree, let's give up the 'override' stuff.
> 
> > What do you think ?
> 
> So, let's go with the KARCH method if you agree too.

I'm fine with it!

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
