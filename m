Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B2ACA9EC8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 03:06:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD6521D80
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 03:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J5lLJAfM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="19h/jLrd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD6521D80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTUYeED3Jgo5jh3HmRUuNRna+UEtj5MvdUGhMSf9w1A=; b=J5lLJAfMEIJGiN
	HboOPTOBXsIsPWD4oQyWJRn0av0YvHgCGgHtIsKDPih6XBucTVgPyA+KvuhBOEHHS8zWyQrZDcxGp
	AFk7CFoBXO+pAMrM7XUPyc6KwNJbjLU6cAGAEcf9zxTA268yD+qHiPxrD6WkI0oltzIWI7MZuqNW/
	M0e1HbxX4M1wmLKDdHw+3qHsiyB7n9euFSi3Xi8oRQKkAkgbZCiCAur6uIPIzV2971yEW1Bl4cts+
	ziSgyHUVONdC48GhPwr5hsQ5dMRem1lxOGk4EeCG0BhJNgApVbCBb4Dw2hh55Z6BRib+bd1hjBE4W
	VvifHXcacBlAWH89ElKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLIbJ-0006T9-2m; Fri, 18 Oct 2019 03:06:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLIbG-0006Sa-A4
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 03:06:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id j18so4514663wrq.10
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9yj5eEKEUBkc8EGiDNUkG6uoCF1b8NJEVMhQxadJQgw=;
 b=19h/jLrdlN0B0n8LD8ZZQQHpidcoIaOwMafQQWuaDBcFghw3DpbmISFkIZf6JbOeJY
 HflrdbPbT0Y81K+zDisvGr/7nGSCcI9+c9LxtNdnjeIkrttEwlV1gof5CXb5NKRTszqE
 Gyimc1zuhUD2XrxIxEEdFgjEOAytYe1Uwlp5zfRwNYYj/1mggw4xcTogycK4uDNiDS9C
 3W9IIft16YhFIpE8CT0RvgU241dSnGZXG8JbhxF/st0rCeuLPktc9JG9eztKFdQG0GHb
 ONC4dNvNaHRIjqrAFPo6W5osvgrgdl5IM29T796hQ5L6voXRWbbApWvz8iMsuN1R8Vmz
 xPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9yj5eEKEUBkc8EGiDNUkG6uoCF1b8NJEVMhQxadJQgw=;
 b=mginfZrZ1SRQZAgs4stefpWBjJIBHxAVAtohs0nvHT3xHFX4qjStlzNLNmYf3TZRA+
 e7HsKvDYumstxoQ/xnsM1U7gxTLNriB5MzXQHFWuPDmcQL3M9buy4jEcDpZr0PCCp2zq
 Q7FjMg0YaBWttj11TFf+1QFI56+9NiYO8TffymeZTwLdQzek70OjzimYeZXjTQ36L83G
 Nm/RTsblsSeAPQDgn4Mby0SdPlF6xLkq6kCndZ4cAcxARQIB1Slcl5c1w9wnxAwsyDs8
 MH+R+n1ynhDJ4TEJqY8NR2G1uhPvrnk5OtbrPAAcFajOa/HUPrtzchrCLlN5OMgdIbUY
 olqA==
X-Gm-Message-State: APjAAAU8FboEVBiqbl7YtjQjZWA38XWKve7RLT65gnRJFx8Fq3pBEOY8
 feDkbdGe4MsZwnaDzNJkHFdbfSIGTU55sWm29tWcvw==
X-Google-Smtp-Source: APXvYqxzFrI5UMyMA5aJQHly/DUWh4eyoWG75O+lClRwzR/dl8s+0ZTRewFo4nozKJArAmHorKplmEuTajXS2YvtoMg=
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr5364797wrr.251.1571368004794; 
 Thu, 17 Oct 2019 20:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191017173743.5430-1-hch@lst.de>
 <20191017173743.5430-15-hch@lst.de>
In-Reply-To: <20191017173743.5430-15-hch@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Oct 2019 08:36:33 +0530
Message-ID: <CAAhSdy01FReApQOPY5B8jcZ34pyWaLpYok_+7G+hEvFKwhC4bQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] riscv: provide a flat image loader
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_200646_350461_8E6619F9 
X-CRM114-Status: GOOD (  16.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 11:08 PM Christoph Hellwig <hch@lst.de> wrote:
>
> This allows just loading the kernel at a pre-set address without
> qemu going bonkers trying to map the ELF file.
>
> Contains a controbution from Aurabindo Jayamohanan to reuse the
> PAGE_OFFSET definition.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Makefile          | 13 +++++++++----
>  arch/riscv/boot/Makefile     |  7 ++++++-
>  arch/riscv/boot/loader.S     |  8 ++++++++
>  arch/riscv/boot/loader.lds.S | 16 ++++++++++++++++
>  4 files changed, 39 insertions(+), 5 deletions(-)
>  create mode 100644 arch/riscv/boot/loader.S
>  create mode 100644 arch/riscv/boot/loader.lds.S
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index f5e914210245..b9009a2fbaf5 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -83,13 +83,18 @@ PHONY += vdso_install
>  vdso_install:
>         $(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>
> -all: Image.gz
> +ifeq ($(CONFIG_RISCV_M_MODE),y)
> +KBUILD_IMAGE := $(boot)/loader
> +else
> +KBUILD_IMAGE := $(boot)/Image.gz
> +endif
> +BOOT_TARGETS := Image Image.gz loader
>
> -Image: vmlinux
> -       $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> +all:   $(notdir $(KBUILD_IMAGE))
>
> -Image.%: Image
> +$(BOOT_TARGETS): vmlinux
>         $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> +       @$(kecho) '  Kernel: $(boot)/$@ is ready'
>
>  zinstall install:
>         $(Q)$(MAKE) $(build)=$(boot) $@
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index 0990a9fdbe5d..8639e0dd2cdf 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -16,7 +16,7 @@
>
>  OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
>
> -targets := Image
> +targets := Image loader
>
>  $(obj)/Image: vmlinux FORCE
>         $(call if_changed,objcopy)
> @@ -24,6 +24,11 @@ $(obj)/Image: vmlinux FORCE
>  $(obj)/Image.gz: $(obj)/Image FORCE
>         $(call if_changed,gzip)
>
> +loader.o: $(src)/loader.S $(obj)/Image
> +
> +$(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
> +       $(Q)$(LD) -T $(src)/loader.lds -o $@ $(obj)/loader.o
> +
>  install:
>         $(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
>         $(obj)/Image System.map "$(INSTALL_PATH)"
> diff --git a/arch/riscv/boot/loader.S b/arch/riscv/boot/loader.S
> new file mode 100644
> index 000000000000..5586e2610dbb
> --- /dev/null
> +++ b/arch/riscv/boot/loader.S
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +       .align 4
> +       .section .payload, "ax", %progbits
> +       .globl _start
> +_start:
> +       .incbin "arch/riscv/boot/Image"
> +
> diff --git a/arch/riscv/boot/loader.lds.S b/arch/riscv/boot/loader.lds.S
> new file mode 100644
> index 000000000000..47a5003c2e28
> --- /dev/null
> +++ b/arch/riscv/boot/loader.lds.S
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <asm/page.h>
> +
> +OUTPUT_ARCH(riscv)
> +ENTRY(_start)
> +
> +SECTIONS
> +{
> +       . = PAGE_OFFSET;
> +
> +       .payload : {
> +               *(.payload)
> +               . = ALIGN(8);
> +       }
> +}
> --
> 2.20.1
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
