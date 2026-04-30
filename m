Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50FEFF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 04:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jreiQskbMXH08CMY+sW1juhPeYqVIQ9jW8zwNTbtAJI=; b=Kmt1t998ChZe7m
	R4JAHlF7QTkQdl9gg8ze+5VIqHr/izt6or73V1VmoVtb+fkK+OhkMmfsE0yEFLP4VKfVPie97iWS2
	BOCZ/t/4cvp2pyR5+P2Ni8b7Jzg93pBA/E+wrgzqDNn8klQAjggqPPssxSGGsYvHmZG4ofJ9qjFXN
	wOf2aLTCrAugr9I31hfoA5gp0+aY25iXP9IEh3LI2vZK1AUYYcZcF8S1OuM1HyInd0an0hbs/Ek+W
	/WFX/pWb7EYo1yTm0VyOz2/Bu2qx8ZWNhCeVOnqIpDeQ/5X4ztnG/1CPetOBcHgnk2I4vhyKCyMWW
	o24Dgtgld6WnIn4+1oMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIZ7-00000004cU5-1VEw;
	Thu, 30 Apr 2026 03:59:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIZ5-00000004cTx-3qyj
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 033B461119;
	Thu, 30 Apr 2026 03:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD48BC2BCB8;
	Thu, 30 Apr 2026 03:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777521590;
	bh=kg0mJxcdJMLR7EVPDQcGXETyksPPs3sOsdETaEE1pDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkiBM3j9gtrFPYylxQq45Rosd8mdQUVkFM+PYsnZsd2ZNYCc7EZYt2fzp5MpVpC09
	 EaGNmFF9HvExtQPsN+iIwKKhSqC8nlKGQQ/BVjYFYJH6koTa2wK7zxPOiTWq3PD6H1
	 gOwY+KiTTZKnCBhv2SKKZ+qG1lQmLYIwghx791WnFqLmVcRtCg2RRBt0yONCfCMukC
	 kQb1F3GIScJgst5LQGeTnFWP1Q3FrYb/BprWynUxZlGFGMo+XvXhpVPM50nwRaX0Ey
	 oVHWkmsmitRy4ngDPVMJ+75Lgp0rzHGWY2U+YZ+DtS8sFiRFz3GmkZXsqIAbTqiptP
	 dOJbSn5fVUztw==
Date: Wed, 29 Apr 2026 20:59:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, arnd@arndb.de, akpm@linux-foundation.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, david.laight.linux@gmail.com,
	cp0613@linux.alibaba.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v5 2/3] bitops: Define generic __bitrev8/16/32 for reuse
Message-ID: <20260430035943.GA2164248@ax162>
References: <20260421130752.607500-1-ruanjinjie@huawei.com>
 <20260421130752.607500-3-ruanjinjie@huawei.com>
 <20260429202922.GA3575295@ax162>
 <afK0oL5FS8eLobpV@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afK0oL5FS8eLobpV@yury>
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

On Wed, Apr 29, 2026 at 09:47:12PM -0400, Yury Norov wrote:
> + networking maintainers
> 
> On Wed, Apr 29, 2026 at 01:29:22PM -0700, Nathan Chancellor wrote:
> > Hi Jinjie,
> > 
> > On Tue, Apr 21, 2026 at 09:07:51PM +0800, Jinjie Ruan wrote:
> > > Define generic __bitrev8/16/32 using the implementation
> > > in <linux/bitrev.h>, so they can be reused in <asm/bitrev.h>,
> > > such as RISCV.
> > > 
> > > Reviewed-by: Yury Norov <ynorov@nvidia.com>
> > > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > > ---
> > >  include/asm-generic/bitops/__bitrev.h | 25 +++++++++++++++++++++++++
> > >  include/linux/bitrev.h                | 20 ++++----------------
> > >  2 files changed, 29 insertions(+), 16 deletions(-)
> > >  create mode 100644 include/asm-generic/bitops/__bitrev.h
> > > 
> > > diff --git a/include/asm-generic/bitops/__bitrev.h b/include/asm-generic/bitops/__bitrev.h
> > > new file mode 100644
> > > index 000000000000..f06af929678d
> > > --- /dev/null
> > > +++ b/include/asm-generic/bitops/__bitrev.h
> > > @@ -0,0 +1,25 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef _ASM_GENERIC_BITOPS___BITREV_H_
> > > +#define _ASM_GENERIC_BITOPS___BITREV_H_
> > > +
> > > +#ifdef CONFIG_GENERIC_BITREVERSE
> > 
> > The dependencies of this symbol seem insufficient, as I can trigger a
> > build failure on next-20260429 like so:
> > 
> >   $ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390-linux- mrproper tinyconfig fs/select.o
> >   In file included from include/linux/crc32.h:6,
> >                    from include/linux/etherdevice.h:23,
> >                    from include/linux/if_vlan.h:11,
> >                    from include/linux/filter.h:21,
> >                    from include/net/xdp.h:10,
> >                    from include/net/busy_poll.h:19,
> >                    from fs/select.c:33:
> >   include/linux/etherdevice.h: In function 'eth_hw_addr_crc':
> >   include/linux/bitrev.h:16:20: error: implicit declaration of function 'generic___bitrev32' [-Wimplicit-function-declaration]
> >      16 | #define __bitrev32 generic___bitrev32
> >         |                    ^~~~~~~~~~~~~~~~~~
> >   include/linux/bitrev.h:67:9: note: in expansion of macro '__bitrev32'
> >      67 |         __bitrev32(__x);                                \
> >         |         ^~~~~~~~~~
> >   include/linux/crc32.h:107:36: note: in expansion of macro 'bitrev32'
> >     107 | #define ether_crc(length, data)    bitrev32(crc32_le(~0, data, length))
> >         |                                    ^~~~~~~~
> >   include/linux/etherdevice.h:292:16: note: in expansion of macro 'ether_crc'
> >     292 |         return ether_crc(ETH_ALEN, ha->addr);
> >         |                ^~~~~~~~~
> >   make[5]: *** [scripts/Makefile.build:289: fs/select.o] Error 1
> >   ...
> > 
> >   $ scripts/config -s BITREVERSE
> >   undef
> > 
> >   $ rg BITREVERSE .config
> 
> Confirm the same for x86 tinyconfig.
> 
> The problem is that the patch makes generic bitrevXX() conditional
> on CONFIG_GENERIC_BITREVERSE, while before they were conditional on
> !CONFIG_HAVE_ARCH_BITREVERSE. So if you don't have arch bitreverse(),
> and dont' enable BITREVERSE, the generic implementation is not defined
> now.
> 
> Luckily, the only user of bitrev() in unconditionally compiled objects
> is CRC32, and it's not needed if CRC32 is disabled.
> 
> This is the minimal working fix for me. Please let me know what do you
> think. I can prepend Jinjie's pathes in my tree with it if it's OK for
> you.

I will run it through my full build matrix overnight and report back
with any problems noticed.

> diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
> index df8f88f63a70..245b206dd38b 100644
> --- a/include/linux/etherdevice.h
> +++ b/include/linux/etherdevice.h
> @@ -20,7 +20,9 @@
>  #include <linux/if_ether.h>
>  #include <linux/netdevice.h>
>  #include <linux/random.h>
> +#ifdef CONFIG_CRCC32

Initial testing shows that this should be

  #ifdef CONFIG_CRC32

here and below though.

>  #include <linux/crc32.h>
> +#endif
>  #include <linux/unaligned.h>
>  #include <asm/bitsperlong.h>
>  
> @@ -281,6 +283,7 @@ static inline void eth_hw_addr_random(struct net_device *dev)
>  	dev->addr_assign_type = NET_ADDR_RANDOM;
>  }
>  
> +#ifdef CONFIG_CRCC32
>  /**
>   * eth_hw_addr_crc - Calculate CRC from netdev_hw_addr
>   * @ha: pointer to hardware address
> @@ -291,6 +294,7 @@ static inline u32 eth_hw_addr_crc(struct netdev_hw_addr *ha)
>  {
>  	return ether_crc(ETH_ALEN, ha->addr);
>  }
> +#endif
>  
>  /**
>   * ether_addr_copy - Copy an Ethernet address

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
