Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AACE64001
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+lxbyh9vEl6obn4VxuB90As12AAg9jpsngF/mb8XMs=; b=dfYcN6oBUIQ0M8
	nuJRrl+EdK9xHT2W0O0A2lQ35TB01DJZZF5MD0vEkten7mAFI3YX5UBSczfwYRYJeqTM2EjOzrgYL
	TVY6KXTqlngZ4mNlWZPk5+uq0CpHu6IE05aqmh2vl4spKEw5nyzeQx1HHZ+4Jll0WdE7dt9jRKlYH
	Q7EjhpFQBPWWIfFD0lh7XH+SfbWAQ3Rx33CQhb0i1qISvdU0Cj2KTBqimZSlC9SMG84+wzQuO1j+n
	U3G1RYLzlkM62YHm98EJLcd4LlTz3dPshcuZJ+7BqlGKIcjGExgeGL3L6Xg2lsGR6IEt5BEj2lqUs
	Av/jAEfV8hd3YpiyRaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqcT-0000000EAek-0B0N;
	Sun, 12 Apr 2026 08:56:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqcQ-0000000EAdp-0fdS
	for linux-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 08:56:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43d75312379so133516f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775984196; x=1776588996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=KeTG3CbapSM0EIG7IwunQXiAUsve6wtDmI+nJ3GcZsMqV+QgvksO7LRXwVzubIeb9P
         8+bFZAf5KzZ52a0vrAKHCg3p8CVptIxKowQLgvPVjXcIXWpxBuPWwYqVYC68iUZ6Co9Z
         cJ0Ofoa7hvgPIIfal7f2p+8ouJi3qa1DXGTyNC3rvif40zkHBRcRyQ1yk/ZdVPqQS1HZ
         Daq8jv8AunPKehX/7VEWcEq7LNFn/RD1v7+cP/g2KmmjS+xu/CoBN7+vLAJ9Yo19jEfx
         RTaFlxcSW2nyT36ErZ/B6rO/+uAkIFTe/m+2WVEZDQOATIeQ+wMk1HQWv5mEn0AGIs/h
         tZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775984196; x=1776588996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=cmwXC/+4C73j4DPnqyGM3DqWTifKz8xQ3ZyyAKMJ85TVfTuDpEGLUlWAzJM5UJTdpI
         h04vECGEiC+7rSWg6aGbkNcpjMCw8bg29GjsUXJ/BxI2+lYwM26h/6hGAr4G6G6pUtsw
         JR+DqQOkhaYDPSS8NMM9ptb3AqjN70VCXosWi/lmatpKan+mIFdy6GSGGfuor8PeOVlO
         jKuvvJWx8S/2/eloeh+wN1UrYb2RFVdYwxqIhJEXqvbjH5Roas0191DVjT1rpytKdScI
         97gM6J5DZ/N9tCFyEcYEo4SoENjmABD68zi5KA8RMkU2dHToBWDtWXV1UydEBhYHo0Yt
         KvHw==
X-Forwarded-Encrypted: i=1; AJvYcCUb0kXz0j9XEmbb4q8sJQjku5odhDUtEtsJkgyPQWw32wVrIWHHO5MxYTF6TJPQ9RuEbbA5GaPsBuabFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRHvAbDsBloXSgGdb6dXZg5PEped4DiNq04yCIZz6M+lOPXwUe
	j94a4TQN3glGPPknlFb5xZftesIeLIrn/08VJRmVrqpRSfQuKG2CDTra
X-Gm-Gg: AeBDiessO6h+y8Zt2LLCKHF9Uriv8MDnB2iN92pgJ59TlG0pWkKmkfjVjwkzrTz5M55
	B4Ni2qyHGnSXKK0rncdsxpBDlzX6CI5mG/ic+bYsWYCC+XEEs/+onD0Ygl87LsFRlDSr+DPzR1h
	bXJyjZ3rgYSBFQqmKtHbvTEtSLIoSNLFHO9JxitkS8eqIVyHth7uFMV6K2Ks7G+cgm3Iw5meC4P
	KUgAl1gHHYT2hsPc1LfbX0mk9BBoGFDXTP73ivhUlS5Cpg2DyvkbSEjBOc8MDomec4d85RFH4RN
	xtgdfmO7/LzyiKdZIDdF3w1GfrSur3cDA0EWA3ud9USrLZx+Xaie2i6aO9SuCNHCr5/QXqV8e7E
	NZZgcOZpmuxhUwh+kvx2pUjo9BdAVvApWPJzMi74CV184PCNkZxLPQOrrhr+PQWbh0SZq/07TF4
	HtbZcRCy96bU/d2M8K5N+uJQoTwpYHUl1yZz2GP9/KMG4ff8yg1SUTPc4Asse9u+6ISdbQ5ok6n
	ssAIg==
X-Received: by 2002:a05:600c:698d:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488d6ac9ce5mr126951995e9.14.1775984195334;
        Sun, 12 Apr 2026 01:56:35 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ed4dsm197923925e9.4.2026.04.12.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:56:34 -0700 (PDT)
Date: Sun, 12 Apr 2026 09:56:33 +0100
From: Stafford Horne <shorne@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jonas Bonn <jonas@southpole.se>,
	linux-openrisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>,
	iommu@lists.linux.dev,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org
Subject: Re: [patch 30/38] openrisc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <adteQSw8c65MtX5l@antec>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.593798781@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410120319.593798781@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_015638_217252_AA2F2E34 
X-CRM114-Status: GOOD (  19.14  )
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

On Fri, Apr 10, 2026 at 02:20:55PM +0200, Thomas Gleixner wrote:
> The only remaining non-architecture usage of get_cycles() is to provide
> random_get_entropy().
> 
> Switch openrisc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Add 'asm/timex.h' includes to the relevant files, so the global include can
> be removed once all architectures are converted over.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: linux-openrisc@vger.kernel.org

This looks good to me.

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/Kconfig              |    1 +
>  arch/openrisc/include/asm/random.h |   12 ++++++++++++
>  arch/openrisc/include/asm/timex.h  |    5 -----
>  arch/openrisc/lib/delay.c          |    1 +
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -10,6 +10,7 @@ config OPENRISC
>  	select ARCH_HAS_DELAY_TIMER
>  	select ARCH_HAS_DMA_SET_UNCACHED
>  	select ARCH_HAS_DMA_CLEAR_UNCACHED
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select GENERIC_BUILTIN_DTB
>  	select COMMON_CLK
> --- /dev/null
> +++ b/arch/openrisc/include/asm/random.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_OPENRISC_RANDOM_H
> +#define __ASM_OPENRISC_RANDOM_H
> +
> +#include <asm/timex.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return get_cycles();
> +}
> +
> +#endif
> --- a/arch/openrisc/include/asm/timex.h
> +++ b/arch/openrisc/include/asm/timex.h
> @@ -9,13 +9,9 @@
>   * OpenRISC implementation:
>   * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
>   */
> -
>  #ifndef __ASM_OPENRISC_TIMEX_H
>  #define __ASM_OPENRISC_TIMEX_H
>  
> -#define get_cycles get_cycles
> -
> -#include <asm-generic/timex.h>
>  #include <asm/spr.h>
>  #include <asm/spr_defs.h>
>  
> @@ -23,6 +19,5 @@ static inline cycles_t get_cycles(void)
>  {
>  	return mfspr(SPR_TTCR);
>  }
> -#define get_cycles get_cycles
>  
>  #endif
> --- a/arch/openrisc/lib/delay.c
> +++ b/arch/openrisc/lib/delay.c
> @@ -18,6 +18,7 @@
>  #include <linux/init.h>
>  
>  #include <asm/param.h>
> +#include <asm/timex.h>
>  #include <asm/processor.h>
>  
>  bool delay_read_timer(unsigned long *timer_value)
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
