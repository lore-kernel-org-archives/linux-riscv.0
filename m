Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4572C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 20:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72B272086A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 20:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmbppL0n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bFPKnxaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72B272086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=KCJJuA8nHplVf7zPMQgyabTYEPSezqpm7tNK1PKPcbs=; b=OmbppL0n5QQyJ06bKCjf/6xL2
	XS0lX3OZdn1xiU4kum2SHsQk0o+o0Uzo2qYEYtqSLGlvqdMa87m8yoBxRfmceRGKiVG0vygV3otB2
	eNlxzdP72jmoxqQq3BVtgHY7e2ks7BIOM4yYEtT1Df8FzujfIGC4qxR+jkQdX4knTRLC2F1jNWmal
	W/u/K3p1Tmk75vUyyvbyUu2e9bywB9SvFFf8uM6EsWfO3KL9UDJ7zycg8LZXOK1ylKgABz9bCLB6X
	KrVnXe4MQIaDTQTjYTY+EL5kMd/m0oKn+MHbpUPWQerSXtjOEA4Symh+/qREjGU6r12qy8Q5VfHFC
	dArGhnRGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOps6-0007gU-Vk; Mon, 19 Nov 2018 20:10:14 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOps3-0006Oo-WC
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 20:10:13 +0000
Received: by mail-pf1-x443.google.com with SMTP id c73so667194pfe.13
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 12:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gESZYH9uiBuTpB4Wq0Lob5Bt7Wx29khIhQqa01TkGDg=;
 b=bFPKnxaBTM0vaQcV98BkEz6gOgVil5ECTGfem5a5sSbKk03HFxS9KG/2qc8z9kYsc7
 Qmb7A/DEYpvtPclbv4569i59LM/fiVJT5PX7GdlwXzcsfk3OM4lCMoHMN+V6CZiPBpvO
 8wkhqExAiWaGuD+YHH7s/XTQ1fM0nSRUujCN1eO1w2ClFFGuxx+2+lJyL8ku2cgXkESH
 BSGvxvAL9qvOPRIpSK4iLTeaQto3fVSEttYIcTLr9xCdC3CnOoi2ki0nx1UR7aHRD2kl
 pY2CXENwlQqi31U7qmoEJjG2aKiM+v+i0gi02SLfbRYPCaJlHBPi1nC+jyj8KanQ1MRK
 jmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gESZYH9uiBuTpB4Wq0Lob5Bt7Wx29khIhQqa01TkGDg=;
 b=ZZEP3nqTZ2Fr4hkAF96jZXcIIMi8dYMoQvVDK78C2nGgva8Rti4W526ALoE2IFK+Tr
 piovSvwQKVXoIkiN1b7Ojw1CyIWJ+Xd2TZsALBrLFI0dGWq3c/KBxSee95c1i0gYQWTs
 GVOdS58EWnMyjNlcDO5D7IY9d6GbG4FaidlArVcFjISxmpQ2UhN/ZJyDMYE78gSG4h81
 I2iGgd4EP8wwUgOu+WmlMX7tqHfUiK0YhHHgTmFPUeLAfmoJwrDo+xLQRdoDdGg1F+MJ
 fmYNV5tiBPuERfsByeCtvCo/+WQy1J8V7pwh5jBxIr5gz7gLYuRhbFBNYInHjiwGsZV+
 ELhQ==
X-Gm-Message-State: AA+aEWaPSaYHQ9Eq1q9bO1fg0bjImpHMdJS52HOvgh+shvaLUnLEgk3v
 hNyl5p1RNIF/8Uuz44fa951GQw==
X-Google-Smtp-Source: AFSGD/XPoc0UFoFzE79tPFfK5JxXElpTAqQjQbRxXNl9Gdl1M8B7JHEzoFcHyVxNlw75uJACXLGp+w==
X-Received: by 2002:a65:534b:: with SMTP id w11mr12021136pgr.125.1542658201074; 
 Mon, 19 Nov 2018 12:10:01 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id h7sm40028851pfa.105.2018.11.19.12.09.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 12:10:00 -0800 (PST)
Date: Mon, 19 Nov 2018 12:10:00 -0800 (PST)
X-Google-Original-Date: Mon, 19 Nov 2018 12:09:55 PST (-0800)
Subject: Re: [PATCH] RISC-V: Build flat and compressed kernel images
In-Reply-To: <CAAhSdy3+w7xQ9=VdqvKa7HZX3FbcAbu4nJ0zXSKi9-4U0_2cNQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-76297324-9bc5-47a8-8be2-73cc11e38138@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_121012_041107_07489470 
X-CRM114-Status: GOOD (  29.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119201000.YkkFZ64Q2fOSxHSKtIRJ3DhnaLCHqIC_5MSM44GTmJ8@z>

On Fri, 16 Nov 2018 19:32:04 PST (-0800), anup@brainfault.org wrote:
> On Sat, Nov 17, 2018 at 2:43 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Sun, 11 Nov 2018 21:55:15 PST (-0800), anup@brainfault.org wrote:
>> > This patch extends Linux RISC-V build system to build and install:
>> > Image - Flat uncompressed kernel image
>> > Image.gz - Flat and GZip compressed kernel image
>> >
>> > Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of
>> > booting flat and compressed kernel images. In case of Uboot, booting
>> > Image or Image.gz is achieved using bootm command.
>> >
>> > The flat and uncompressed kernel image (i.e. Image) is very useful
>> > in pre-silicon developent and testing because we can create back-door
>> > HEX files for RAM on FPGAs from Image.
>> >
>> > Signed-off-by: Anup Patel <anup@brainfault.org>
>> > ---
>> >  arch/riscv/Makefile             | 15 ++++++++-
>> >  arch/riscv/boot/.gitignore      |  2 ++
>> >  arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
>> >  arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
>> >  arch/riscv/kernel/head.S        | 10 ++++++
>> >  arch/riscv/kernel/vmlinux.lds.S |  2 +-
>> >  6 files changed, 120 insertions(+), 2 deletions(-)
>> >  create mode 100644 arch/riscv/boot/.gitignore
>> >  create mode 100644 arch/riscv/boot/Makefile
>> >  create mode 100644 arch/riscv/boot/install.sh
>> >
>> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> > index d10146197533..d117a60362eb 100644
>> > --- a/arch/riscv/Makefile
>> > +++ b/arch/riscv/Makefile
>> > @@ -71,10 +71,23 @@ KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
>> >  # arch specific predefines for sparse
>> >  CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
>> >
>> > +# Default target when executing plain make
>> > +boot         := arch/riscv/boot
>> > +KBUILD_IMAGE := $(boot)/Image.gz
>> > +
>> >  head-y := arch/riscv/kernel/head.o
>> >
>> >  core-y += arch/riscv/kernel/ arch/riscv/mm/
>> >
>> >  libs-y += arch/riscv/lib/
>> >
>> > -all: vmlinux
>> > +all: Image.gz
>> > +
>> > +Image: vmlinux
>> > +     $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>> > +
>> > +Image.%: Image
>> > +     $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>> > +
>> > +zinstall install:
>> > +     $(Q)$(MAKE) $(build)=$(boot) $@
>> > diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
>> > new file mode 100644
>> > index 000000000000..8dab0bb6ae66
>> > --- /dev/null
>> > +++ b/arch/riscv/boot/.gitignore
>> > @@ -0,0 +1,2 @@
>> > +Image
>> > +Image.gz
>> > diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
>> > new file mode 100644
>> > index 000000000000..0990a9fdbe5d
>> > --- /dev/null
>> > +++ b/arch/riscv/boot/Makefile
>> > @@ -0,0 +1,33 @@
>> > +#
>> > +# arch/riscv/boot/Makefile
>> > +#
>> > +# This file is included by the global makefile so that you can add your own
>> > +# architecture-specific flags and dependencies.
>> > +#
>> > +# This file is subject to the terms and conditions of the GNU General Public
>> > +# License.  See the file "COPYING" in the main directory of this archive
>> > +# for more details.
>> > +#
>> > +# Copyright (C) 2018, Anup Patel.
>> > +# Author: Anup Patel <anup@brainfault.org>
>> > +#
>> > +# Based on the ia64 and arm64 boot/Makefile.
>> > +#
>> > +
>> > +OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
>> > +
>> > +targets := Image
>> > +
>> > +$(obj)/Image: vmlinux FORCE
>> > +     $(call if_changed,objcopy)
>> > +
>> > +$(obj)/Image.gz: $(obj)/Image FORCE
>> > +     $(call if_changed,gzip)
>> > +
>> > +install:
>> > +     $(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
>> > +     $(obj)/Image System.map "$(INSTALL_PATH)"
>> > +
>> > +zinstall:
>> > +     $(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
>> > +     $(obj)/Image.gz System.map "$(INSTALL_PATH)"
>> > diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
>> > new file mode 100644
>> > index 000000000000..18c39159c0ff
>> > --- /dev/null
>> > +++ b/arch/riscv/boot/install.sh
>> > @@ -0,0 +1,60 @@
>> > +#!/bin/sh
>> > +#
>> > +# arch/riscv/boot/install.sh
>> > +#
>> > +# This file is subject to the terms and conditions of the GNU General Public
>> > +# License.  See the file "COPYING" in the main directory of this archive
>> > +# for more details.
>> > +#
>> > +# Copyright (C) 1995 by Linus Torvalds
>> > +#
>> > +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
>> > +# Adapted from code in arch/i386/boot/install.sh by Russell King
>> > +#
>> > +# "make install" script for the RISC-V Linux port
>> > +#
>> > +# Arguments:
>> > +#   $1 - kernel version
>> > +#   $2 - kernel image file
>> > +#   $3 - kernel map file
>> > +#   $4 - default install path (blank if root directory)
>> > +#
>> > +
>> > +verify () {
>> > +     if [ ! -f "$1" ]; then
>> > +             echo ""                                                   1>&2
>> > +             echo " *** Missing file: $1"                              1>&2
>> > +             echo ' *** You need to run "make" before "make install".' 1>&2
>> > +             echo ""                                                   1>&2
>> > +             exit 1
>> > +     fi
>> > +}
>> > +
>> > +# Make sure the files actually exist
>> > +verify "$2"
>> > +verify "$3"
>> > +
>> > +# User may have a custom install script
>> > +if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
>> > +if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
>> > +
>> > +if [ "$(basename $2)" = "Image.gz" ]; then
>> > +# Compressed install
>> > +  echo "Installing compressed kernel"
>> > +  base=vmlinuz
>> > +else
>> > +# Normal install
>> > +  echo "Installing normal kernel"
>> > +  base=vmlinux
>> > +fi
>> > +
>> > +if [ -f $4/$base-$1 ]; then
>> > +  mv $4/$base-$1 $4/$base-$1.old
>> > +fi
>> > +cat $2 > $4/$base-$1
>> > +
>> > +# Install system map file
>> > +if [ -f $4/System.map-$1 ]; then
>> > +  mv $4/System.map-$1 $4/System.map-$1.old
>> > +fi
>> > +cp $3 $4/System.map-$1
>> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> > index 711190d473d4..fe884cd69abd 100644
>> > --- a/arch/riscv/kernel/head.S
>> > +++ b/arch/riscv/kernel/head.S
>> > @@ -44,6 +44,16 @@ ENTRY(_start)
>> >       amoadd.w a3, a2, (a3)
>> >       bnez a3, .Lsecondary_start
>> >
>> > +     /* Clear BSS for flat non-ELF images */
>> > +     la a3, __bss_start
>> > +     la a4, __bss_stop
>> > +     ble a4, a3, clear_bss_done
>> > +clear_bss:
>> > +     REG_S zero, (a3)
>> > +     add a3, a3, RISCV_SZPTR
>> > +     blt a3, a4, clear_bss
>> > +clear_bss_done:
>> > +
>> >       /* Save hart ID and DTB physical address */
>> >       mv s0, a0
>> >       mv s1, a1
>> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
>> > index ece84991609c..65df1dfdc303 100644
>> > --- a/arch/riscv/kernel/vmlinux.lds.S
>> > +++ b/arch/riscv/kernel/vmlinux.lds.S
>> > @@ -74,7 +74,7 @@ SECTIONS
>> >               *(.sbss*)
>> >       }
>> >
>> > -     BSS_SECTION(0, 0, 0)
>> > +     BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
>>
>> What does this do?
>
> If bootloader is loading vmlinux ELF then it will take care of
> zeroing BSS and SBSS section.
>
> If we have FLAT image then the head.S has to zero-out BSS
> and SBSS on boot HART. The secondary/non-boot HART
> don't need to clear BSS and SBSS.
>
> Now with BSS_SECTION(0, 0, 0), there is no alignment
> constraint on start of BSS and SBSS section so the BSS
> zeroing code in head.S has handle unaligned BSS and
> SBSS (i.e. not aligned to XLEN / 8 bytes). To simplify, I have
> made BSS and SBSS start as page aligned and put a simple
> assembly code in head.S to zero-out BSS and SBSS.
>
> Of course, we can also use BSS_SECTION(16, 16, 0)
> but I thought of avoiding magic values and made it
> page aligned (like few other architectures).

Makes sense, at least for now.  We might want to default to alignment to a 
larger alignment (2MiB on rv64i, 4MiB on rv32i) at some point, but that's a 
larger discussion.

I've already queued this up for this week's PR, which I'll tag as soon as I 
managed to get through my email :)

>
>>
>> >
>> >       EXCEPTION_TABLE(0x10)
>> >       NOTES
>>
>> Thanks!  I'm going to target this for the RCs as well: it's technically a new
>> feature, but it seems pretty safe -- assuming the BSS_SECTION change can be
>> explained to me :)
>
> Thanks,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
