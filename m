Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C4FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrDRmmjKmPhwnh7vr7zKnIdrp5aGSFF/ka3L2GFDl8w=; b=RAK2derr2Nq2mu
	gU+Bngc2mNIUQ8xQERy3Og4yJ75RtxKPscmCMAItxujNlKYQE5Uf668jDLc3nifudBx2BD6I9eZvb
	a7f5D0FP7FjEFjRO9IvdsYPcqod83XshWedUdmkGN+eciCUfeesiQacnxM0EKQjckczt8RHYJqEGy
	FBaNbsXSx3j3BChEaeOC3DDnJC0WtJx2wQeaTrD/kGlWF8fJOFtvZi5qp4+k5VVGMhG2p6FdMb1IX
	JID+fj5zb9WNiplz9fASA6vmZN7fD8FLZupx/ZKFJL/fkJLeIJgbnaF4h9lO4deejFm5olfSSnMV7
	Z4z8AvTIVloLa0a2RfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBXF-00000004CDq-3D5w;
	Wed, 29 Apr 2026 20:29:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBXF-00000004CDi-1wIU
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 20:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC2AB60180;
	Wed, 29 Apr 2026 20:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A652EC19425;
	Wed, 29 Apr 2026 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777494567;
	bh=HH+KQvkzBNqRGxUjoFpvNFOMjZKpfO8LsdVYeYm3uOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9lGsPgLSrCXmU8d7mjNx7wf9uQT/2BqyvHTxM8svYyt0+Sdpahq3xIQrTXuOpAQm
	 MjtsSt23NnFUOfCiUxFdMKs9qyTCDiicq85kS+uKugrdpzaGEEGPdot6VlvXi7VBHC
	 ryoHkioB1F73N0Bz0YH81b+yq5l/QQuopEsvVuzZJsT5VopbPlgFo9WaDYv/wfW1w4
	 gkfCoeLDB45K4cEmDmJ2+S1KljBMAw2EOREBSR3+0EB15/nEku3u1MSRZaD14wVTxO
	 qjX0aq39gOMn5ZGBIpdp2mIFLEZaRJxC1V7i7L+a1pNtonkz0K79MjQhwpi7xUY6Bn
	 vgB4tOd/rDt6g==
Date: Wed, 29 Apr 2026 13:29:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, yury.norov@gmail.com, linux@rasmusvillemoes.dk,
	arnd@arndb.de, akpm@linux-foundation.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, david.laight.linux@gmail.com,
	cp0613@linux.alibaba.com
Subject: Re: [PATCH v5 2/3] bitops: Define generic __bitrev8/16/32 for reuse
Message-ID: <20260429202922.GA3575295@ax162>
References: <20260421130752.607500-1-ruanjinjie@huawei.com>
 <20260421130752.607500-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260421130752.607500-3-ruanjinjie@huawei.com>
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

Hi Jinjie,

On Tue, Apr 21, 2026 at 09:07:51PM +0800, Jinjie Ruan wrote:
> Define generic __bitrev8/16/32 using the implementation
> in <linux/bitrev.h>, so they can be reused in <asm/bitrev.h>,
> such as RISCV.
> 
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  include/asm-generic/bitops/__bitrev.h | 25 +++++++++++++++++++++++++
>  include/linux/bitrev.h                | 20 ++++----------------
>  2 files changed, 29 insertions(+), 16 deletions(-)
>  create mode 100644 include/asm-generic/bitops/__bitrev.h
> 
> diff --git a/include/asm-generic/bitops/__bitrev.h b/include/asm-generic/bitops/__bitrev.h
> new file mode 100644
> index 000000000000..f06af929678d
> --- /dev/null
> +++ b/include/asm-generic/bitops/__bitrev.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS___BITREV_H_
> +#define _ASM_GENERIC_BITOPS___BITREV_H_
> +
> +#ifdef CONFIG_GENERIC_BITREVERSE

The dependencies of this symbol seem insufficient, as I can trigger a
build failure on next-20260429 like so:

  $ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390-linux- mrproper tinyconfig fs/select.o
  In file included from include/linux/crc32.h:6,
                   from include/linux/etherdevice.h:23,
                   from include/linux/if_vlan.h:11,
                   from include/linux/filter.h:21,
                   from include/net/xdp.h:10,
                   from include/net/busy_poll.h:19,
                   from fs/select.c:33:
  include/linux/etherdevice.h: In function 'eth_hw_addr_crc':
  include/linux/bitrev.h:16:20: error: implicit declaration of function 'generic___bitrev32' [-Wimplicit-function-declaration]
     16 | #define __bitrev32 generic___bitrev32
        |                    ^~~~~~~~~~~~~~~~~~
  include/linux/bitrev.h:67:9: note: in expansion of macro '__bitrev32'
     67 |         __bitrev32(__x);                                \
        |         ^~~~~~~~~~
  include/linux/crc32.h:107:36: note: in expansion of macro 'bitrev32'
    107 | #define ether_crc(length, data)    bitrev32(crc32_le(~0, data, length))
        |                                    ^~~~~~~~
  include/linux/etherdevice.h:292:16: note: in expansion of macro 'ether_crc'
    292 |         return ether_crc(ETH_ALEN, ha->addr);
        |                ^~~~~~~~~
  make[5]: *** [scripts/Makefile.build:289: fs/select.o] Error 1
  ...

  $ scripts/config -s BITREVERSE
  undef

  $ rg BITREVERSE .config

> +#include <asm/types.h>
> +
> +extern u8 const byte_rev_table[256];
> +static __always_inline __attribute_const__ u8 generic___bitrev8(u8 byte)
> +{
> +	return byte_rev_table[byte];
> +}
> +
> +static __always_inline __attribute_const__ u16 generic___bitrev16(u16 x)
> +{
> +	return (generic___bitrev8(x & 0xff) << 8) | generic___bitrev8(x >> 8);
> +}
> +
> +static __always_inline __attribute_const__ u32 generic___bitrev32(u32 x)
> +{
> +	return (generic___bitrev16(x & 0xffff) << 16) | generic___bitrev16(x >> 16);
> +}
> +#endif /* CONFIG_GENERIC_BITREVERSE */
> +
> +#endif /* _ASM_GENERIC_BITOPS___BITREV_H_ */
> diff --git a/include/linux/bitrev.h b/include/linux/bitrev.h
> index d35b8ec1c485..11620a70e776 100644
> --- a/include/linux/bitrev.h
> +++ b/include/linux/bitrev.h
> @@ -12,22 +12,10 @@
>  #define __bitrev8 __arch_bitrev8
>  
>  #else
> -extern u8 const byte_rev_table[256];
> -static inline u8 __bitrev8(u8 byte)
> -{
> -	return byte_rev_table[byte];
> -}
> -
> -static inline u16 __bitrev16(u16 x)
> -{
> -	return (__bitrev8(x & 0xff) << 8) | __bitrev8(x >> 8);
> -}
> -
> -static inline u32 __bitrev32(u32 x)
> -{
> -	return (__bitrev16(x & 0xffff) << 16) | __bitrev16(x >> 16);
> -}
> -
> +#include <asm-generic/bitops/__bitrev.h>
> +#define __bitrev32 generic___bitrev32
> +#define __bitrev16 generic___bitrev16
> +#define __bitrev8 generic___bitrev8
>  #endif /* CONFIG_HAVE_ARCH_BITREVERSE */
>  
>  #define __bitrev8x4(x)	(__bitrev32(swab32(x)))
> -- 
> 2.34.1
> 

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
