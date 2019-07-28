Return-Path: <SRS0=hpeE=VZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6F9C7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Jul 2019 13:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF8F2075C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Jul 2019 13:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pHxpxcaA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Swl6CXvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FF8F2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPinoiVgUV7Ibi4jom6mUbiyP/bbYNecUn91hyCuHZQ=; b=pHxpxcaAFLBzQc
	iKSTv6lABwWBljDwzeVFFdB7y48mVIna1G4YKJTRJaRPo2875bb0j+wC0nVMVG/oVPua8wFW8XQ8O
	H+ncUmDnCZdP2FjRD87f1NbRDrdv4+mFFxDU8W49ZEAHk5tVe3PHAkEZL54n2ZsXPWmRBEFUcDONO
	DADHA4xA9cx6uyLCa5ESeOzlU1VUaZKfGbJLfO8/wPg858AsL8XRqrf4XCuUgHx3D90cnsVp3Qg2q
	BeRCMXMskHIH1VK2eageF3uQchz0LmXGIXSW7OpWPIT3QiQCVCgAOncFOd6WiTcOJRGbPeehicH+D
	sj6DTVQoXOijlkkuRmUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrjNo-0002Gn-7G; Sun, 28 Jul 2019 13:38:40 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrjNl-0002GU-NI
 for linux-riscv@lists.infradead.org; Sun, 28 Jul 2019 13:38:39 +0000
Received: by mail-ed1-x543.google.com with SMTP id k21so57068568edq.3
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jul 2019 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hy+mRQ+QZ9gGOKuMHdwHfkZBAGMRoDJYYoYSH6U8K7A=;
 b=Swl6CXvxlH7T2DPcTnYcdtPuLwjp1jS/fDPuuVE/laBJ+s8PYOLdZglXMZpo67fYxV
 Ll9W7uWM5Li2hT8noe7HHL1mJntUkro2fHHOkSwC+m1BmQ1Fmrw5cie3x79EYSGQ+qEW
 dDSUKFvyU7RQyyDmurzRgnF8B1hfYL/1RobTTgQxBaa5n/MXI4ZF4yMYq7crzJMhZqiX
 3V6GD3TrrIiqj4vh/O7j3WZfuJhnILDSXKOC68GWc2AqIKIokBi8C9XNSrdKdFLJkZIk
 tEVwtn390QhvG41kVuGNnusTPYkExko+27RGIUanjkwcZo+6ToZnx3n4ZgoiL/2EpvII
 qkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hy+mRQ+QZ9gGOKuMHdwHfkZBAGMRoDJYYoYSH6U8K7A=;
 b=QCeyGR+ycpxCQe3I7R4+GUVLggj61AaGFEHtSSOxjeRucsci/2a5o36VtA5DQ332TZ
 JvbUobwqhLZqhUVga+XwfwC+lV57jd2C/fPVkCPsDNAs2w7uyBogDSx8xRi0LyxFYj6W
 xeG0Gyp1Y/rTiiFsHO7rhi0mPjOuaPrCyK9Fywssh8Tbq5Vnr9jdODn2VS2QCjQ6iALa
 KpcnlAMsfqdDQxXeYEnDJQAlTUCXQNHxr+mPohhkD0KynlvUvCZe4YRIwsurMSToesil
 H0Ebu4wVpkm4ex03DA4TibG8xhVKBen5kgvdQhFzfHoB18WiGM7lKGiaVF15KnPr2shS
 K/jQ==
X-Gm-Message-State: APjAAAXoA64+bNrqAdcJ+rKnzyQO+A9nsadZ7qUrOj+7RDaqpVEu/VXc
 UIqRWFSt9Ncx+X/tqIiZOB3SJ9qp8IADDgmAFFc=
X-Google-Smtp-Source: APXvYqzJFhA4yfR/AhsQy7gz2M1fgFG9KBciwTB/MXLVkyXYEFdwGDN6sQjCRmCociC7RVSJJcTt/NzLrgI1xepJ8DY=
X-Received: by 2002:a17:906:81cb:: with SMTP id
 e11mr79541973ejx.37.1564321116352; 
 Sun, 28 Jul 2019 06:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1907261259420.26670@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1907261259420.26670@viisi.sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Jul 2019 21:38:25 +0800
Message-ID: <CAEUhbmUh0rJzFUoA05En9osy+Vv9AP0yOr-bs1goqk7+6SCv2g@mail.gmail.com>
Subject: Re: [PATCH] riscv: kbuild: add virtual memory system selection
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_063837_788610_A1869B3E 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 27, 2019 at 4:00 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> The RISC-V specifications currently define three virtual memory
> translation systems: Sv32, Sv39, and Sv48.  Sv32 is currently specific
> to 32-bit systems; Sv39 and Sv48 are currently specific to 64-bit
> systems.  The current kernel only supports Sv32 and Sv39, but we'd
> like to start preparing for Sv48.  As an initial step, allow the
> virtual memory translation system to be selected via kbuild, and stop
> the build if an option is selected that the kernel doen't currently
> support.
>
> This patch currently has no functional impact.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/Kconfig                  | 43 +++++++++++++++++++++++++++++
>  arch/riscv/include/asm/pgtable-32.h |  4 +++
>  arch/riscv/include/asm/pgtable-64.h |  4 +++
>  3 files changed, 51 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 59a4727ecd6c..8ef64fe2c2b3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -155,6 +155,49 @@ config MODULE_SECTIONS
>         bool
>         select HAVE_MOD_ARCH_SPECIFIC
>
> +choice
> +       prompt "Virtual Memory System"
> +       default RISCV_VM_SV32 if 32BIT
> +       default RISCV_VM_SV39 if 64BIT
> +       help
> +         The RISC-V Instruction Set Manual Volume II: Privileged
> +         Architecture defines several different "virtual memory
> +         systems" which specify virtual and physical address formats
> +         and the structure of page table entries.  This determines
> +         the amount of virtual address space present and how it is
> +         translated into physical addresses.
> +
> +       config RISCV_VM_SV32
> +               depends on 32BIT
> +               bool "RISC-V Sv32"
> +               help
> +                 The Sv32 virtual memory system is a page-based
> +                 address and page table format for RV32 systems.
> +                 It specifies a translation between 32-bit virtual
> +                 addresses and 33-bit physical addresses, via a
> +                 two-stage page table layout.
> +       config RISCV_VM_SV39
> +               depends on 64BIT
> +               bool "RISC-V Sv39"
> +               help
> +                 The Sv39 virtual memory system is a page-based
> +                 address and page table format for RV64 systems.
> +                 It specifies a translation between 39-bit virtual
> +                 addresses and 40-bit physical addresses, via a

The spec does not mention 40-bit physical addresses, but 56-bit.

> +                 three-stage page table layout.
> +       config RISCV_VM_SV48
> +               depends on 64BIT
> +               bool "RISC-V Sv48"
> +               help
> +                 The Sv48 virtual memory system is a page-based
> +                 address and page table format for RV64 systems.
> +                 It specifies a translation between 48-bit virtual
> +                 addresses and 49-bit physical addresses, via a

ditto.

> +                 four-stage page table layout.
> +
> +endchoice
> +
> +
>  choice
>         prompt "Maximum Physical Memory"
>         default MAXPHYSMEM_2GB if 32BIT
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index b0ab66e5fdb1..86d41a04735b 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -6,6 +6,10 @@
>  #ifndef _ASM_RISCV_PGTABLE_32_H
>  #define _ASM_RISCV_PGTABLE_32_H
>
> +#if !defined(CONFIG_RISCV_VM_SV32)
> +#error Only Sv32 supported
> +#endif
> +
>  #include <asm-generic/pgtable-nopmd.h>
>  #include <linux/const.h>
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 74630989006d..86935595115d 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -6,6 +6,10 @@
>  #ifndef _ASM_RISCV_PGTABLE_64_H
>  #define _ASM_RISCV_PGTABLE_64_H
>
> +#if !defined(CONFIG_RISCV_VM_SV39)
> +#error Only Sv39 supported for now
> +#endif
> +
>  #include <linux/const.h>
>
>  #define PGDIR_SHIFT     30
> --

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
