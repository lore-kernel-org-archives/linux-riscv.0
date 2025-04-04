Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E997C369A2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZCcvA72EzPYWLl/yRO5dLoOFDXZNGdOIaq5QT1gQ/o=; b=SKSeEgK+iQxUBY
	ALIZOKcpzPe2oC0k3xFbgSiRpAlNi8NIiBoY1ib2yJuEfEONS1E118wLELM5mPLEJxzJsRASR3ASh
	keBP5LGUr98UVL8OcSR4b/HTDMaGD8Gr+nLTKF9px2jFjB5ksE1AhT2P27XN+mUT7J/RAX0VarAP0
	iBiFjp9HPGqgOREDVF2wmmjjvUn1QwRcvBsNpW36+oTz2rtQcfE+IhpYuxmYV86tLGK0WY9kXv87t
	yqSEpMO/5xPw5lYpj491RCu/4/mcV0MDzoDZf/N/dVJS5dvbxxsRFwzRm8ALxa8TiwUptKHbf1OIV
	gmGUEvC0dkfSuaQsItMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mms-0000000CdgA-05pZ;
	Fri, 04 Apr 2025 19:33:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0miW-0000000Cd2X-2W0Y
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 19:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A7C361139;
	Fri,  4 Apr 2025 19:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3764BC4CEDD;
	Fri,  4 Apr 2025 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743794919;
	bh=8ON196eganUBVW2Uw3mgBt0Ay+BgxYwGYYvK3t0u8LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIZiimYduGQlYd2eRXB0bT5WZbNtqoQs2X2vWnGNkb2RfYrSSYo+3b6Ksd92L9QkU
	 3jTvER9D2qhCfD9RD9u/HIRwBDb2e0HR7zlu61b9pTLeOexX0PTE7wJ3bxWUgk4Jcy
	 zkMeQ3h7tMs9VzyZ+QHUKlI5yRqZuBQeMHQ/zFynTEaUp1PEMNUH+UCgw6lXpws8m7
	 2cCkadlCNXtEL3GiPvoFWON3JPIq2P1cviH3f4bkUyEGRAxW29fZhUZ3xN+mvx3Ons
	 /zRuTDVoMUKMBP7EsS5b/ybQq7GLbbEKO80kjE9FspuudRcr3yy4rA0jgqHMvbbCRR
	 jPcbU/YWFP0+g==
Date: Fri, 4 Apr 2025 12:28:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Ignacio Encinas <ignacio@iencinas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
Message-ID: <20250404192832.GC1622@sol.localdomain>
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
 <aa29e983-78b9-430b-b8a6-e64de5f4ca12@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa29e983-78b9-430b-b8a6-e64de5f4ca12@codethink.co.uk>
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

On Fri, Apr 04, 2025 at 04:47:52PM +0100, Ben Dooks wrote:
> On 03/04/2025 21:34, Ignacio Encinas wrote:
> > Implement endianness swap macros for RISC-V.
> > 
> > Use the rev8 instruction when Zbb is available. Otherwise, rely on the
> > default mask-and-shift implementation.
> > 
> > Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> > ---
> >   arch/riscv/include/asm/swab.h | 43 +++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 43 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
> > new file mode 100644
> > index 000000000000..7352e8405a99
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/swab.h
> > @@ -0,0 +1,43 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _ASM_RISCV_SWAB_H
> > +#define _ASM_RISCV_SWAB_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/compiler.h>
> > +#include <asm/cpufeature-macros.h>
> > +#include <asm/hwcap.h>
> > +#include <asm-generic/swab.h>
> > +
> > +#if defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)
> > +
> > +#define ARCH_SWAB(size) \
> > +static __always_inline unsigned long __arch_swab##size(__u##size value) \
> > +{									\
> > +	unsigned long x = value;					\
> > +									\
> > +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
> > +		asm volatile (".option push\n"				\
> > +			      ".option arch,+zbb\n"			\
> > +			      "rev8 %0, %1\n"				\
> > +			      ".option pop\n"				\
> > +			      : "=r" (x) : "r" (x));			\
> > +		return x >> (BITS_PER_LONG - size);			\
> > +	}                                                               \
> > +	return  ___constant_swab##size(value);				\
> > +}
> > +
> > +#ifdef CONFIG_64BIT
> > +ARCH_SWAB(64)
> > +#define __arch_swab64 __arch_swab64
> > +#endif
> > +
> > +ARCH_SWAB(32)
> > +#define __arch_swab32 __arch_swab32
> > +
> > +ARCH_SWAB(16)
> > +#define __arch_swab16 __arch_swab16
> > +
> > +#undef ARCH_SWAB
> > +
> > +#endif /* defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE) */
> > +#endif /* _ASM_RISCV_SWAB_H */
> > 
> 
> I was having a look at this as well, using the alternatives macros.
> 
> It would be nice to have a __zbb_swab defined so that you could do some
> time checks with this, because it would be interesting to see the
> benchmark of how much these improve byteswapping.

FYI if you missed the previous discussion
(https://lore.kernel.org/linux-riscv/20250302220426.GC2079@quark.localdomain/),
currently the overhead caused by the slow generic byte-swapping on RISC-V is
easily visible in the CRC benchmark.  For example compare:

    crc32_le_benchmark: len=16384: 2440 MB/s

to
    
    crc32_be_benchmark: len=16384: 674 MB/s

But the main loops of crc32_le and crc32_be are basically the same, except
crc32_le does le64_to_cpu() (or le32_to_cpu()) on the data whereas crc32_be does
be64_to_cpu() (or be32_to_cpu()).  The above numbers came from a little-endian
CPU, where le*_to_cpu() is a no-op and be*_to_cpu() is a byte-swap.

To reproduce this, build a kernel from the latest upstream with
CONFIG_CRC_KUNIT_TEST=y and CONFIG_CRC_BENCHMARK=y, boot it on a CPU that has
the Zbc extension, and check dmesg for the benchmark results.

This patch should mostly close the difference, though I don't currently have
hardware to confirm that myself.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
