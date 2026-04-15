Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54649F41991
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOhPhxvg6xfmhwumbur/myJKNv05FIo/G3vNkfIIfYU=; b=ErDU5OSp5NUcBu
	zthbgApymMn/Aj/jFSVVh24XTWK1nrKsL6O8avs25Q4al1v1sfXJHZQ/u7uzpdIVGAA3Koiwth9HC
	zlzHMI7+OHgF1SmMX4pSH7axItN9NrkvEyAfrDVVUZWHojvvhg8qeYZOf0KvbZZZ2f1hk0sGJKxG+
	clDMNRGfG3eXM+qYtVtRO2QwcLTtwj8gVqTyOyK8Wdyll7CBjAy9itSg0RYxxUyw+ALLSrNi6h8t7
	ukkUfP6nH4EJHCPI48FvuhxnKcqbrM11tjyMjpSSB0RIn5ogVBKXXvzh+TXhcy5NiVXvQGw6ETR1n
	0V5pgVYmd0hLRRxT+vnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyUO-000000012vg-1j1j;
	Wed, 15 Apr 2026 11:33:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyUL-000000012vK-2ccb
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 11:32:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so4782100f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Apr 2026 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776252775; x=1776857575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2FCUrZRaW+mZzvA8FAeIT0/MW/6T/TDKPdP+BgE9zU=;
        b=sdxtHKQhc8PhsiosvLtKb7EV+oWRa77w/7NvjSddb4JbeAma7MHMn1EREZp7MfgPTB
         jpHbQfyZclNDO5PpdBgUFQ1CO/8VlLzcjjweQgs0S/kFJFCcTKncvHus4TZWuN7u8+6G
         XdiF1TuYuvfpHAELwwaOnjVPN0xP+cdwsA7+gMBka+qt7aDYCrleIeLslwhp+w6mSeLG
         BXGoK5HkL2tbMBzTa9cNUiFwECjg45sndid+9RrEptWV+eTwMQRLMN0T84CiKtpQqKvv
         Y0dWmy386r+BFMw9ZrwVX/yr3S5ZR5pTQHiBTUcYfJWp6WzJEd47C7N2CNKh9DQ2Sujs
         2XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252775; x=1776857575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u2FCUrZRaW+mZzvA8FAeIT0/MW/6T/TDKPdP+BgE9zU=;
        b=EdZ+4NI6tn9g4+yTV1ZGdGa0rEF08SQcM5XN4SymI2fG1hcqeTOmKRqEh0fGs011OR
         0ETbPg+7fGk00hkRy/HPEhlFfnEIdh2kA+2V9mIjFnKSP3uP8kSc3KzhB/ajY2/GSjms
         bZaAOl0uwL3E2F99iY6rFAvQEQUKB1oSmXLf/fBPlWiznlshGl5qbfLvVeEkE6UGD1zu
         bmNWXIHQ1L530VrCxK6EOFEEDEwjEJ1X5syY2GgqO6ISOvn69hneCRvidN6p7miVzxbd
         RKFlOUokW9CYCMsTibnJ19FfQNMv/0r+d0uYGm81uivJIeMjPOhILoLKfi3X67fMqLSd
         2wsA==
X-Forwarded-Encrypted: i=1; AFNElJ/tVNzG87HRTBHE/60YPFRxkNhHuAdfkpTL8thTA9AJZiFG7bnG762Xv5ddy3+COqHDPXLyhXuGVC4V/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yweyir8GlaIbhdI0MleexyFypXGhMD0H48J8dvxK+MYMVZxTY4D
	zkFCJ3zAbq7W/0jVjTxPX6UjKS9WhNA8zxK4SRg26hKZoDUlyt/gardF
X-Gm-Gg: AeBDiev2R9oCEgdQLxt7o1um++e53+92E8Pojj9hI94sjRVI90/FXRsjdoDFjPIU0gO
	eii+9tWCn0G2R7GrZCsOKU9s9HP6MPoiOLMo1egcC2KbyMqKu7yMhBxcYxgceBW6trmDLMNs+B5
	eumRc6qo2CXPDE3TV6HuiQIwjxmT6TEeyTl5gMDE7IIabnBHawYwlUzoSnPzbn/xaIjwMGoJbxw
	FfL1BAfW1K/GPLqsyADVP2XNQiBSilthNB94o5oBWudtHrR3llHJ8L6QhF77/jr1cw0RGwhjAPe
	XE5rVH2H2Gt+EkDYr2JWQtkbrq+UGXXQn6oAxz1rNC8bgOozNXwxPSw4r6seOPclMeE4bkZvZnI
	wj6YANrOPZEmfKAiNmad/MSsxLFp/bsmvMwWXZ65jOB0/LKIb1S0LujWPK+gGZQzyqW8chy2pv3
	4JLMEwaIvgEb/SjQ7thwwOLUhNB1DHs1AFdzGeXt781aq4QFv6l3muAYbt4P0pIVaJ
X-Received: by 2002:a05:6000:240e:b0:43e:aefa:db84 with SMTP id ffacd0b85a97d-43eaefadc12mr935013f8f.34.1776252775085;
        Wed, 15 Apr 2026 04:32:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3e00b3sm4261659f8f.27.2026.04.15.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:32:54 -0700 (PDT)
Date: Wed, 15 Apr 2026 12:32:52 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
 <arnd@arndb.de>, <cp0613@linux.alibaba.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arch/riscv: Add bitrev.h file to support rev8
 and brev8
Message-ID: <20260415123252.017bd5e2@pumpkin>
In-Reply-To: <20260415093827.2776328-3-ruanjinjie@huawei.com>
References: <20260415093827.2776328-1-ruanjinjie@huawei.com>
	<20260415093827.2776328-3-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_043257_717768_D849FB77 
X-CRM114-Status: GOOD (  28.95  )
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

On Wed, 15 Apr 2026 17:38:27 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The RISC-V Bit-manipulation Extension for Cryptography (Zbkb) provides
> the 'brev8' instruction, which reverses the bits within each byte.
> Combined with the 'rev8' instruction (from Zbb or Zbkb), which reverses
> the byte order of a register, we can efficiently implement 16-bit,
> 32-bit, and (on RV64) 64-bit bit reversal.
> 
> This is significantly faster than the default software table-lookup
> implementation in lib/bitrev.c, as it replaces memory accesses and
> multiple arithmetic operations with just two or three hardware
> instructions.
> 
> Select HAVE_ARCH_BITREVERSE and provide <asm/bitrev.h> to utilize
> these instructions when the Zbkb extension is available at runtime
> via the alternatives mechanism.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/bitrev.h | 41 +++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 arch/riscv/include/asm/bitrev.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 90c531e6abf5..05f2b2166a83 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>  	select HAS_IOPORT if MMU
>  	select HAVE_ALIGNED_STRUCT_PAGE
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_BITREVERSE if RISCV_ISA_ZBKB
>  	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
>  	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/bitrev.h b/arch/riscv/include/asm/bitrev.h
> new file mode 100644
> index 000000000000..9f205ac84796
> --- /dev/null
> +++ b/arch/riscv/include/asm/bitrev.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_BITREV_H
> +#define __ASM_BITREV_H
> +
> +#include <linux/types.h>
> +#include <asm/cpufeature-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm-generic/bitops/__bitrev.h>
> +
> +static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
> +{
> +	unsigned long result = x;
> +
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
> +		return generic___bitrev32(x);
> +
> +	asm volatile(
> +		".option push\n"
> +		".option arch,+zbkb\n"
> +		"rev8 %0, %0\n"

It would be better to pass (long)x in for the source.
Might save the compiler doing a register-register move.

> +		"brev8 %0, %0\n"
> +		".option pop"
> +		: "+r" (result)
> +	);
> +
> +	if (__riscv_xlen == 64)
> +		return (u32)(result >> 32);

Is that right?
ACAICT __riscv_xlen is 32 for 32bit builds and 64 otherwise.
(No idea why riscv has its own private constant for that.)
I'm guessing that 'brev' is bit-reverse (or each byte) and 'rev'
a byteswap, the '8' suffix rather implies it acts on 8 bytes
which makes is 64bit only.
So does 'rev8' even compile for 32bit.
You are also likely to get a warning on 32bit for 'result >> 32'.

> +
> +	return (u32)result;
> +}

I'm not sure is is a good idea inline that into its callers.
But I can't think of a way to get either the instructions or
a call patched in at the call site.

> +
> +static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
> +{
> +	return __arch_bitrev32((u32)x) >> 16;
> +}
> +
> +static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
> +{
> +	return __arch_bitrev32((u32)x) >> 24;

That seems excessive when it could just be a 'brev' instruction.

Oh, and none of the casts on the function call parameters or results
are needed - they are all implied.

	David


> +}
> +#endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
