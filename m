Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FD6C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 21:14:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A9892086A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 21:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OdYWYdpU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iNSXSJch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A9892086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wR7LD544eNHDjR/JPPqLOWrxh/llnC8rQNLTm3ms4ec=; b=OdYWYdpUyuHtSoicHbwZJVQQI
	/RGlWOIIGpl4RUX7cNs7GErcHeV7n85NpiZToZvZR9NY2pl76e/g4YtoaJz1sm3uoXwZa8JNZZc0o
	tXpfhBDT/5VvxGb1cNjb6JbLUza1c+1+jUwsrCJiTtC0Oyz9LndBCJ5O9J5Xzqg7mPGKIscgQ0vFD
	hjgtckpN26wBI0MsypePnWe/wiHJkmLyLSB0U8TWe9vNO7hLAmjFa21xEEovALeYwtsXL1bwjhQ73
	q3a59GPfQHZ0d6gHD7ngnj1zbVFvd3ERSE3hXFqVWjyghdwDNA1U4B9PLJhl2OHSePMpN8rAG3Dof
	ZNFEbxxWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNlRI-0007FP-N9; Fri, 16 Nov 2018 21:14:08 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNlRF-0007EN-3q
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 21:14:06 +0000
Received: by mail-pl1-x644.google.com with SMTP id y6-v6so4135403plt.3
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 13:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aaTk0bWbw51/ERX74UIzuW2jg0W+7FNXeH0yCmTXpDk=;
 b=iNSXSJchw9iqKkKGKiKnYAyVHrV2UYoQMTalLRmd2w4PTt0BPY6y2IMFa0jvZokFvg
 DLCd/NhijH/P6E+iq6RH6/fvz97Djm3U6qzkQ8fLC9QWU0QQAl6/Vc9ccYHbf8y3PCqn
 RjyaGOoyMuPEfkTon/w4YfloDgNlCAJSLfDgZRXPWYiY2auKos95/K5F+R6iQ1KEe+K7
 Hd2C4AI+Bh6SiZCWIJ4GUBRD/9d+BhueLc3MBmp8gHIqbw8rJN+44Eet/hnqwNrGvbCL
 sBxXD04MzFEtbEuGymRatD+eYqq5Ml/SLIxBlOT1tMNgqcF8H2qZHJNaZCZjPmLisYKb
 NYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aaTk0bWbw51/ERX74UIzuW2jg0W+7FNXeH0yCmTXpDk=;
 b=E1Vpg9i+H0FjBRUeWMJQt78EyxQcPFUzHAkJGI0P3M30ljXgM2YD1Jt0Jmo2zDcb3M
 QfvqYquh5gDl7fz/gsW7FQED/UmWiIxwvyZm4sF5x/tPBGyJHOXCWJ5wTZog6/S7Q3uV
 JjzBg7DJLw4y/r0UHPhkWJeR03jAnVV7EwcRMr2v5MYMAQ/gOiwgFo8CyY1fpdo9LdUH
 WqDrr6WzD7BSgYq7ttQQka+CK/gkTjqxza7VaKx+Hie7Vfh9u95iD8KqP8A1na/s8X7A
 fM6ybvK6Y0M1PVO6IHBzybNSy7wSRhF+PDSJg2iRQWjr9bu9dOzJWY68QX+yAZORJeWa
 1+aw==
X-Gm-Message-State: AGRZ1gLZYLfnRpKWNE2kTdXbnYq8UVNRWq0xeXKUCW+y4s4aeXhRdYdi
 RvesH52hcjfxbyRrYcfI3/3PSg==
X-Google-Smtp-Source: AJdET5cxh2HCSR/0Fy717snGMoI6q5s/y5+nEOo4ppj6/OdOCSIuPQu3cUKnwid8QLtAsXGpQY3v+Q==
X-Received: by 2002:a17:902:2dc3:: with SMTP id
 p61mr10716142plb.166.1542402832819; 
 Fri, 16 Nov 2018 13:13:52 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y66-v6sm41013026pfy.24.2018.11.16.13.13.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Nov 2018 13:13:52 -0800 (PST)
Date: Fri, 16 Nov 2018 13:13:52 -0800 (PST)
X-Google-Original-Date: Fri, 16 Nov 2018 13:06:28 PST (-0800)
Subject: Re: [PATCH] RISC-V: Build flat and compressed kernel images
In-Reply-To: <20181112055515.20341-1-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-4c0df18a-5f01-4260-b3c9-3e4b8cce829b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_131405_157347_83C51C1F 
X-CRM114-Status: GOOD (  24.45  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116211352.iNbSKX4CuoQHZisxsmJwVPqAZmsq1I6VyGfOFpP0aJ8@z>

On Sun, 11 Nov 2018 21:55:15 PST (-0800), anup@brainfault.org wrote:
> This patch extends Linux RISC-V build system to build and install:
> Image - Flat uncompressed kernel image
> Image.gz - Flat and GZip compressed kernel image
>
> Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of
> booting flat and compressed kernel images. In case of Uboot, booting
> Image or Image.gz is achieved using bootm command.
>
> The flat and uncompressed kernel image (i.e. Image) is very useful
> in pre-silicon developent and testing because we can create back-door
> HEX files for RAM on FPGAs from Image.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Makefile             | 15 ++++++++-
>  arch/riscv/boot/.gitignore      |  2 ++
>  arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
>  arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/head.S        | 10 ++++++
>  arch/riscv/kernel/vmlinux.lds.S |  2 +-
>  6 files changed, 120 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/boot/.gitignore
>  create mode 100644 arch/riscv/boot/Makefile
>  create mode 100644 arch/riscv/boot/install.sh
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index d10146197533..d117a60362eb 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -71,10 +71,23 @@ KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
>  # arch specific predefines for sparse
>  CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
>
> +# Default target when executing plain make
> +boot		:= arch/riscv/boot
> +KBUILD_IMAGE	:= $(boot)/Image.gz
> +
>  head-y := arch/riscv/kernel/head.o
>
>  core-y += arch/riscv/kernel/ arch/riscv/mm/
>
>  libs-y += arch/riscv/lib/
>
> -all: vmlinux
> +all: Image.gz
> +
> +Image: vmlinux
> +	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> +
> +Image.%: Image
> +	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> +
> +zinstall install:
> +	$(Q)$(MAKE) $(build)=$(boot) $@
> diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
> new file mode 100644
> index 000000000000..8dab0bb6ae66
> --- /dev/null
> +++ b/arch/riscv/boot/.gitignore
> @@ -0,0 +1,2 @@
> +Image
> +Image.gz
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> new file mode 100644
> index 000000000000..0990a9fdbe5d
> --- /dev/null
> +++ b/arch/riscv/boot/Makefile
> @@ -0,0 +1,33 @@
> +#
> +# arch/riscv/boot/Makefile
> +#
> +# This file is included by the global makefile so that you can add your own
> +# architecture-specific flags and dependencies.
> +#
> +# This file is subject to the terms and conditions of the GNU General Public
> +# License.  See the file "COPYING" in the main directory of this archive
> +# for more details.
> +#
> +# Copyright (C) 2018, Anup Patel.
> +# Author: Anup Patel <anup@brainfault.org>
> +#
> +# Based on the ia64 and arm64 boot/Makefile.
> +#
> +
> +OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
> +
> +targets := Image
> +
> +$(obj)/Image: vmlinux FORCE
> +	$(call if_changed,objcopy)
> +
> +$(obj)/Image.gz: $(obj)/Image FORCE
> +	$(call if_changed,gzip)
> +
> +install:
> +	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> +	$(obj)/Image System.map "$(INSTALL_PATH)"
> +
> +zinstall:
> +	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> +	$(obj)/Image.gz System.map "$(INSTALL_PATH)"
> diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
> new file mode 100644
> index 000000000000..18c39159c0ff
> --- /dev/null
> +++ b/arch/riscv/boot/install.sh
> @@ -0,0 +1,60 @@
> +#!/bin/sh
> +#
> +# arch/riscv/boot/install.sh
> +#
> +# This file is subject to the terms and conditions of the GNU General Public
> +# License.  See the file "COPYING" in the main directory of this archive
> +# for more details.
> +#
> +# Copyright (C) 1995 by Linus Torvalds
> +#
> +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
> +# Adapted from code in arch/i386/boot/install.sh by Russell King
> +#
> +# "make install" script for the RISC-V Linux port
> +#
> +# Arguments:
> +#   $1 - kernel version
> +#   $2 - kernel image file
> +#   $3 - kernel map file
> +#   $4 - default install path (blank if root directory)
> +#
> +
> +verify () {
> +	if [ ! -f "$1" ]; then
> +		echo ""                                                   1>&2
> +		echo " *** Missing file: $1"                              1>&2
> +		echo ' *** You need to run "make" before "make install".' 1>&2
> +		echo ""                                                   1>&2
> +		exit 1
> +	fi
> +}
> +
> +# Make sure the files actually exist
> +verify "$2"
> +verify "$3"
> +
> +# User may have a custom install script
> +if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
> +if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
> +
> +if [ "$(basename $2)" = "Image.gz" ]; then
> +# Compressed install
> +  echo "Installing compressed kernel"
> +  base=vmlinuz
> +else
> +# Normal install
> +  echo "Installing normal kernel"
> +  base=vmlinux
> +fi
> +
> +if [ -f $4/$base-$1 ]; then
> +  mv $4/$base-$1 $4/$base-$1.old
> +fi
> +cat $2 > $4/$base-$1
> +
> +# Install system map file
> +if [ -f $4/System.map-$1 ]; then
> +  mv $4/System.map-$1 $4/System.map-$1.old
> +fi
> +cp $3 $4/System.map-$1
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 711190d473d4..fe884cd69abd 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -44,6 +44,16 @@ ENTRY(_start)
>  	amoadd.w a3, a2, (a3)
>  	bnez a3, .Lsecondary_start
>
> +	/* Clear BSS for flat non-ELF images */
> +	la a3, __bss_start
> +	la a4, __bss_stop
> +	ble a4, a3, clear_bss_done
> +clear_bss:
> +	REG_S zero, (a3)
> +	add a3, a3, RISCV_SZPTR
> +	blt a3, a4, clear_bss
> +clear_bss_done:
> +
>  	/* Save hart ID and DTB physical address */
>  	mv s0, a0
>  	mv s1, a1
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index ece84991609c..65df1dfdc303 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -74,7 +74,7 @@ SECTIONS
>  		*(.sbss*)
>  	}
>
> -	BSS_SECTION(0, 0, 0)
> +	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)

What does this do?

>
>  	EXCEPTION_TABLE(0x10)
>  	NOTES

Thanks!  I'm going to target this for the RCs as well: it's technically a new 
feature, but it seems pretty safe -- assuming the BSS_SECTION change can be 
explained to me :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
