Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEAFC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgT1P0cG4954UqHR3eRMP6OlfY6pCLnVduw6VzkxKv0=; b=ZJeue/qlHV6tut
	jpQ5NQPNdfyszz2Y8UogPak8eMj4EJFAL3rlqyNJgdOmdQJc/wxbbj6zSIq0M2WRPqfnsqBZxSyy+
	d0VMqTIxdYfQhJVMTXjWE4awEZQcRFYVibGVTnN/hhpa1ngJasMXqgxa6VvxVinsW27VzrEURZEA2
	qU+GPUwGz7NGZO/yAKIbvJysg/y53aEHxSdnCHmAmMAhjBgziMqFoVPIk0FoDkKtM6508ryJrjSi3
	WlfkaXpBMbBf9Hg4swPBZqjXWtSX7X9OonafCVIAfmB6B8q/wPiaKgCODERzwGaTY5+l6uExNpooW
	ubvKu7lk0BJAGztMgxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jOF-0000000CE2n-286c;
	Fri, 04 Apr 2025 15:55:31 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jOD-0000000CE1S-0usJ
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 15:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yOe9uz//SMDxuWVRWMVPDE6QGOnTyqzIEZ+QkHAgOCY=; b=JY/5IPL4YxFlzlOAZyBv1j4gvD
	caPYfIAA70Z4Q5WAnzFhgSjsLnLAjzLEIp34VTWCWGGAdeCWeHVgSq5RK/1QQNeC7iyhacimoNDRD
	BPw5Oq6kabuNQRfdygLdCkQfXNaY4jLf+TPvadMfDZ5lSaOAZKSH7+h4CJNeDzamrCvY6TzwYNN6x
	q3gnRJdpt7bJdil21IXtA0sJ/xtuOBwQ654633XpDuST+RlCrT3oGJqzEJLxjrkPd3ztXM+jBSJGq
	fSwBIpzsElIyaHuk8hf3Uvu4PWW0NffhPfumKWktV0PyXc0Wf6odDqdRiE7Py76vCwd+QvhSO/d6v
	TiTVtPVg==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1u0jO3-00BgMS-1f; Fri, 04 Apr 2025 16:55:20 +0100
Message-ID: <99b7b45a-4b18-4f0d-a197-4dccbb6c2352@codethink.co.uk>
Date: Fri, 4 Apr 2025 16:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
To: Ignacio Encinas <ignacio@iencinas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-arch@vger.kernel.org
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_085529_260076_49159633 
X-CRM114-Status: GOOD (  15.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03/04/2025 21:34, Ignacio Encinas wrote:
> Implement endianness swap macros for RISC-V.
> 
> Use the rev8 instruction when Zbb is available. Otherwise, rely on the
> default mask-and-shift implementation.
> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
>   arch/riscv/include/asm/swab.h | 43 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
> new file mode 100644
> index 000000000000..7352e8405a99
> --- /dev/null
> +++ b/arch/riscv/include/asm/swab.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_RISCV_SWAB_H
> +#define _ASM_RISCV_SWAB_H
> +
> +#include <linux/types.h>
> +#include <linux/compiler.h>
> +#include <asm/cpufeature-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm-generic/swab.h>
> +
> +#if defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)
> +
> +#define ARCH_SWAB(size) \
> +static __always_inline unsigned long __arch_swab##size(__u##size value) \
> +{									\
> +	unsigned long x = value;					\
> +									\
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
> +		asm volatile (".option push\n"				\
> +			      ".option arch,+zbb\n"			\
> +			      "rev8 %0, %1\n"				\
> +			      ".option pop\n"				\
> +			      : "=r" (x) : "r" (x));			\
> +		return x >> (BITS_PER_LONG - size);			\
> +	}                                                               \
> +	return  ___constant_swab##size(value);				\
> +}
> +
> +#ifdef CONFIG_64BIT
> +ARCH_SWAB(64)
> +#define __arch_swab64 __arch_swab64
> +#endif

I suppose if we're 64bit we can't just rely on values being in one
register so this'd need special casing here?

> +ARCH_SWAB(32)
> +#define __arch_swab32 __arch_swab32
> +
> +ARCH_SWAB(16)
> +#define __arch_swab16 __arch_swab16
> +
> +#undef ARCH_SWAB
> +
> +#endif /* defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE) */
> +#endif /* _ASM_RISCV_SWAB_H */
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
