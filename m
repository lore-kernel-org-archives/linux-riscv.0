Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85474C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:14:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F1164E56
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6F1164E56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aLDKKETEApxCvpkQ5tNupMQT4MdD4N0q8YunUoihWRs=; b=fequSAfLCpK8+oyV2TLCOE8JK
	SrFSTNl0Wpe35EcAGEYp7KKuLZ1Du0fF2YCERELVqoIpCbEYq1G6TEJWO5/UT6r3yWWnaB2rDMyXN
	VyUBtgC7gYTQrlYz8prvCGah19pZD1xtJVOQmuEwUcvdP4B/2Rebg6VjWfYdZTU+T3w0jbvYSEXlb
	glSIgBUAqVDz82NV/jnIus704XyWbSYK4jf6fnSD8nfhNI74Tw1/4IYZRM5cb6w0C13/1JZR843F/
	EE5/QBJnCJ9BntuDjfUg78rWK6OUCyt22bhkB88Tn9BjNhdqSRo+rpXNdZ08mI09SPABzokn+IYjG
	QWHX+lhHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9DrT-0008TC-Jn; Mon, 08 Feb 2021 21:14:23 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9DrQ-0008S2-PR
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 21:14:22 +0000
Received: by mail-io1-xd2f.google.com with SMTP id f2so4644029ioq.2
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 13:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3FeiA79iLSDi0k0ZMiFHmOL8NHbfXhIuWSoTn/fGVeY=;
 b=ZclT1m870hHFi+lNdB6+VkCpGEahDMU00K4AuTfI994iegwXHwBXf6+iWDUUY1LGyR
 XFQH3YCADT7wCjJhqwG6cxOmKdutCmhDRQTxpSaqhujCxhiAqHojoEXzcYSryf/Aa+ym
 WgChKCCtgJxmsswJzN5qFl0y+bHQj0H5ecmf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3FeiA79iLSDi0k0ZMiFHmOL8NHbfXhIuWSoTn/fGVeY=;
 b=KT6pV1S+LpqXX/Y1N2YwtEbxU2ItiwKFCt4MoFzDrQHxHMRxu69B/KHFaTpD41NlUE
 Iu+GFagItw/tp1Z5w6FlNjLAOsjkGxGfAiJZ1gMuvZ902X6RTAiU+TJS1hsXl4Q1IFXz
 4tI3jElwv12eh5OxaXrgsfr8pOblaIhUqakHl6v/GtW2zPnAXh5tJsMCyU7lcu0fBoTs
 RUEHaLRHx7WYJEML3E46X0hsbhimWJ1y+jHTvMWhZrcSAR7fjt4TYv1zCXV+Po3HPnO/
 lJkgjksocU1JxLGMswFRnpFfBxMAEwcUyqz9MgbXEowkiEdb6TnpElghBi+QT4QKpxWE
 gwRQ==
X-Gm-Message-State: AOAM533onFHcZsrUlvW0bgymjVQeWlhZ5KHoUI50jaMILMM/Wgenkb3t
 WyDSKTU03wXPQMBs1XgEb2JMxelBJ3f5IiuJBv0u
X-Google-Smtp-Source: ABdhPJy0kax2flx8hj7WBbhdgj5nWwuM1G6DARrTIESg+pfqzKkTAS3xb9t2X4Tbcm8zJFirRtRmlKFMR1eDtkR0g5M=
X-Received: by 2002:a05:6602:2d4d:: with SMTP id
 d13mr16157926iow.0.1612818857262; 
 Mon, 08 Feb 2021 13:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20210206100115.58074-1-xypron.glpk@gmx.de>
In-Reply-To: <20210206100115.58074-1-xypron.glpk@gmx.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 8 Feb 2021 13:14:06 -0800
Message-ID: <CAOnJCUJ+CvBHt1MXzGn2Hmc2J-NZYdxf4MGka7sh1SmozTbWCg@mail.gmail.com>
Subject: Re: [PATCH] docs: update EFI stub description
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_161420_966277_AFEF61E4 
X-CRM114-Status: GOOD (  37.58  )
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Feb 6, 2021 at 2:02 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> * Mention RISC-V.
> * Update code references.
> * initrd= does not specify a path relative on the ESP but to the partition
>   from which the EFI stub was loaded (as specified in the loaded image
>   protocol).
> * Mention that ACPI tables and device trees are alternatives.
> * Provide the FDT GUID.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  Documentation/admin-guide/efi-stub.rst | 47 +++++++++++++++-----------
>  1 file changed, 27 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/admin-guide/efi-stub.rst b/Documentation/admin-guide/efi-stub.rst
> index 833edb0d0bc4..9e1bb79e8655 100644
> --- a/Documentation/admin-guide/efi-stub.rst
> +++ b/Documentation/admin-guide/efi-stub.rst
> @@ -8,15 +8,20 @@ it as an EFI executable. The code that modifies the bzImage header,
>  along with the EFI-specific entry point that the firmware loader
>  jumps to are collectively known as the "EFI boot stub", and live in
>  arch/x86/boot/header.S and arch/x86/boot/compressed/eboot.c,
> -respectively. For ARM the EFI stub is implemented in
> -arch/arm/boot/compressed/efi-header.S and
> -arch/arm/boot/compressed/efi-stub.c. EFI stub code that is shared
> -between architectures is in drivers/firmware/efi/libstub.
> +respectively. For ARM the EFI stub entry point is implemented in
> +arch/arm/boot/compressed/efi-header.S.
>
> -For arm64, there is no compressed kernel support, so the Image itself
> -masquerades as a PE/COFF image and the EFI stub is linked into the
> -kernel. The arm64 EFI stub lives in arch/arm64/kernel/efi-entry.S
> -and drivers/firmware/efi/libstub/arm64-stub.c.
> +For ARM64 and RISC-V, there is no compressed kernel support, so the Image
> +itself masquerades as a PE/COFF image and the EFI stub is linked into the
> +kernel. The EFI stub entry point is in  arch/ARM64/kernel/efi-entry.S for
> +ARM64 and in arch/riscv/kernel/efi-header.S for RISC-V.
> +
> +EFI stub code that is shared between architectures is in
> +drivers/firmware/efi/libstub.
> +
> +The common secondary entry point efi_pe_entry() for ARM, ARM64, and RISC-V
> +into the stub is in drivers/firmware/efi/libstub/efi-stub.c while x86 uses
> +drivers/firmware/efi/libstub/x86-stub.c.
>
>  By using the EFI boot stub it's possible to boot a Linux kernel
>  without the use of a conventional EFI boot loader, such as grub or
> @@ -35,7 +40,7 @@ the extension the EFI firmware loader will refuse to execute it. It's
>  not possible to execute bzImage.efi from the usual Linux file systems
>  because EFI firmware doesn't have support for them. For ARM the
>  arch/arm/boot/zImage should be copied to the system partition, and it
> -may not need to be renamed. Similarly for arm64, arch/arm64/boot/Image
> +may not need to be renamed. Similarly for ARM64, arch/arm64/boot/Image
>  should be copied but not necessarily renamed.
>

Should we change the title of the paragraph to something like "How to
install EFI image"
 RISC-V image location can be added as well.
>
> @@ -55,10 +60,11 @@ multiple initrd files using the "initrd=" option. This is the only EFI
>  stub-specific command line parameter, everything else is passed to the
>  kernel when it boots.
>
> -The path to the initrd file must be an absolute path from the
> -beginning of the ESP, relative path names do not work. Also, the path
> -is an EFI-style path and directory elements must be separated with
> -backslashes (\). For example, given the following directory layout::
> +The path to the initrd file must be an absolute path from the beginning of
> +the partition from which the kernel was loaded, relative path names do not
> +work. Also, the path is an EFI-style path and directory elements must be
> +separated with backslashes (\). For example, given the following directory
> +layout::
>
>    fs0:>
>         Kernels\
> @@ -83,18 +89,19 @@ is passed to bzImage.efi.
>  The "dtb=" option
>  -----------------
>
> -For the ARM and arm64 architectures, a device tree must be provided to
> -the kernel. Normally firmware shall supply the device tree via the
> -EFI CONFIGURATION TABLE. However, the "dtb=" command line option can
> -be used to override the firmware supplied device tree, or to supply
> -one when firmware is unable to.
> +If ACPI tables are not available, a device tree must be provided to the
> +kernel. Normally the firmware shall supply the device tree as an EFI
> +configuration table with GUID b1b621d5-f19c-41a5-830b-d9152c69aae0.
> +However, the "dtb=" command line option can be used to override the
> +firmware supplied device tree, or to supply one when firmware is unable
> +to.
>
>  Please note: Firmware adds runtime configuration information to the
>  device tree before booting the kernel. If dtb= is used to override
>  the device tree, then any runtime data provided by firmware will be
>  lost. The dtb= option should only be used either as a debug tool, or
> -as a last resort when a device tree is not provided in the EFI
> -CONFIGURATION TABLE.
> +as a last resort when a device tree is not provided as an EFI
> +configuration table.
>

Some more clarification is required here as this option is only
enabled with EFI_ARMSTUB_DTB_LOADER.
That config option is not enabled for RISC-V to avoid legacy.

>  "dtb=" is processed in the same manner as the "initrd=" option that is
>  described above.
> --
> 2.30.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
