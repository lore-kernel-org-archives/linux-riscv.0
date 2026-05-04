Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0E4FF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Da2ehbWtduewcLECOJpNCb9Isr7zjw17SMlg0K7gOzg=; b=m/3PA8KUJVZt5g
	TKoRPEOWPrT3I03k6+OkOxvUWDUTp48PWPF6O8+8QBIuYQ9KXTZhKN21SLvC5rfmEHiK7BmuuWOV6
	4eYBevUOOKazBk9vQ7jisdFizhLnPXzgRu1fccSela8/6cfTf+pK2hezwqgDNgcw9scERI0xX8s69
	R0NT6H/N5OX4KXWRvLwtrR5Qyz+Ga83jr6j+nZNE05nO5Cf2PjD7bEKdH+VibJ9MRQevPRC8euhn9
	WQahL0pddR1zo2Rt92nYPByN+0tebLG2SFXpo4PH6OE0kWTgs4M6/ghePBD5AZC6PVIwW2D02k4gf
	JdfZG91H0Grhr9w/CLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsdx-0000000DC1v-00od;
	Mon, 04 May 2026 12:43:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsdu-0000000DBzm-3j0q
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 12:43:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so53650425e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898600; x=1778503400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ufm/8wyV7h2cWwxL5F4jbAArsiyVqXQndXIOjfMIX4=;
        b=b1J0XPyQH57EMyTBQaOaH79pMTWf8lstLzUqQKGpfBGCb92uJqQ3iXDrgnmhHxZvx7
         9HVexY9U5H6gawIyUcdVW+Jshcqvfte9gpdKprJI35ga4+dGovAItIikTpjgT3ONMrRX
         ujmbs2YaqhLc+wlQpsL2h4yVm+Qqz1WBwxuSr59YrQV1iOaUiKmQBgwCxNNkVgSNPbgs
         vnN/Y43ZD+aacZbB34o0+B+96Vf615AaeQ9Yuh2EgnVvpjkhTCHY3T4jPss1QJKK4iEs
         cW+QHFAJqsxy4S7+BHGXcM3C1yhOD4jdF5F+XjleevyPoz8KCkEWw47SqJs4cZcx7jhe
         UbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898600; x=1778503400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ufm/8wyV7h2cWwxL5F4jbAArsiyVqXQndXIOjfMIX4=;
        b=kfvyBlT/ux8peL/5SBIWbx3EF2u1M5EnQ86XVofUcAVSV8o18443EDHQAMCi4EkEDU
         gBSomNplc5PoYc1TijeZis9JfQfoFg2Fi6SQ+n6FDz2nVft1fq5SLrUd9Ct9clutM8rH
         tmcDJAi6B1JwZv/HSzcflNNLHDRsMh71l7CzuMVGRUUpCKhQOD+h6fXnJEs1SR7x5Ptt
         SfEb1qfekRbvOQDgyFuFkM3+I4QE6LTamBjDrIapif11lgcHNtxF1u7OGafZ/VM7fO0N
         IBQbeot50/qYTvWu32BY272xcSkkYiAqcqrsYOs6eXXx5hIeRHgHk+AAi1gPWfWy7/xi
         5pDg==
X-Forwarded-Encrypted: i=1; AFNElJ8FvrWjeb6LSoDNpqPzvQFiDxcmis/sclYhNYwoqMGo+1Vb90bo1zoqjQ7kSEgrA83ofAWimIFfqjJTJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX7T3va+c51kcMi2yv30UxfoLiJ3utG8I90AMnDjUVxO++EEhP
	d0keU68MqvYOwXzz35Qzt+wDiTuZK0HlqkghZCVpwC311YGwn+Kc0Ijk
X-Gm-Gg: AeBDietxK+BbWDBuseozLHX2vhcVEa9Ph5VOPVaCiBgNMSkPR6Wu0wsnLxLGbX2qZW9
	sGbozEg/HNpQklZAR6UtvE1pTYRjQMBHwt/crYeL49lLHYl3oKkhn06jZYqPTquDyN52tn4N0T/
	md87cZs3awyEv9S+o4sV0Cimu6J79spAKtnfcIrr+c4Swc6iV8ETvgDdE471JvUbMkWOCOlVp5g
	4Lfg3OGzdrJGECVm/R8pTuaqBz+x1M82FxVUd+g0ebyGukEGeu4k4ZbOL8L4zXQkrTePxd28WCc
	dNJE0UkrIjNSAcFIP6jL4FXw+vxoaZ3M4zxoMYwpX0mm6VGhjr9Kt22OyvttGrICbXzmPKJj5on
	5vFP0gjh4kIQ7/bv53BlKD3sMi0irFokYiQtxYzVBAg4ekM/0PuqyoBt9Cj5LIPSHafbcQ79T9x
	b5lZmyk9Uxro9jzHY/iv2jdmiy7lDoKg6V2ORMqo+7/M59vX/N93aWC8AoDtNUQV8cwyeviya4l
	1Y=
X-Received: by 2002:a05:600c:a411:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48a980fc3e7mr112517875e9.0.1777898600087;
        Mon, 04 May 2026 05:43:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fef2a67sm111207925e9.5.2026.05.04.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:43:19 -0700 (PDT)
Date: Mon, 4 May 2026 13:43:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Yury Norov" <ynorov@nvidia.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yury Norov" <yury.norov@gmail.com>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Jesper Dangaard Brouer" <hawk@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "Ruan Jinjie" <ruanjinjie@huawei.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Linux-Arch
 <linux-arch@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 bpf@vger.kernel.org, "Nathan Chancellor" <nathan@kernel.org>
Subject: Re: [PATCH 1/6] lib: include crc32.h conditionally on CONFIG_CRC32
Message-ID: <20260504134318.6eae8193@pumpkin>
In-Reply-To: <ec4ed7f5-b1c8-49e4-b83d-e29c5414b9de@app.fastmail.com>
References: <20260430211351.658193-1-ynorov@nvidia.com>
	<20260430211351.658193-2-ynorov@nvidia.com>
	<ec4ed7f5-b1c8-49e4-b83d-e29c5414b9de@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_054322_964879_940CEAFE 
X-CRM114-Status: GOOD (  28.26  )
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

On Mon, 04 May 2026 10:03:10 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Apr 30, 2026, at 23:13, Yury Norov wrote:
> > Currently, bitreverse API is either declared based on
> > CONFIG_HAVE_ARCH_BITREVERSE, wired to arch implementation, or if the
> > arch has no bitreverse, based on generic implementation.
> >
> > So, regardless of CONFIG_BITREVERSE=n, the corresponding API is always
> > declared. If that happens, the functions become declared but not
> > implemented, which is an error.  
> 
> I'm not following that description. Why is it an error to declare
> a funtion that is not implemented? Isn't that how optional interfaces
> tend to work in general?
> 
> > The only header requiring the crc32 and bitreverse prototypes is
> > include/linux/etherdevice.h. Thus, protect inclusion of corresponding
> > headers in the etherdevice with CONFIG_CRC32, together with the only
> > function depending on it.  
> ...
> >  #include <linux/if_ether.h>
> >  #include <linux/netdevice.h>
> >  #include <linux/random.h>
> > +#ifdef CONFIG_CRC32
> >  #include <linux/crc32.h>
> > +#endif
> >  #include <linux/unaligned.h>
> >  #include <asm/bitsperlong.h>  
> 
> Don't add #ifdef blocks around headers. If the header cannot
> be included without side-effects, change the linux/crc32.h
> file instead of its users.
> 
> It looks like the problem is the check for CONFIG_GENERIC_BITREVERSE
> in include/asm-generic/bitops/__bitrev.h, which ends up
> hinding the generic___bitrev32() helper without need.
> 
> Simply removing the #ifdef there should avoid the build failure.
> 
> > +#ifdef CONFIG_CRC32
> >  /**
> >   * eth_hw_addr_crc - Calculate CRC from netdev_hw_addr
> >   * @ha: pointer to hardware address
> > @@ -291,6 +294,7 @@ static inline u32 eth_hw_addr_crc(struct netdev_hw_addr *ha)
> >  {
> >  	return ether_crc(ETH_ALEN, ha->addr);
> >  }
> > +#endif  
> 
> I see there are only user users of this function, neither of
> them are performance critical. So the other options would
> be to either open-code this function in the two callers
> and remove it entirely, or move it into net/ethernet/eth.c.

Or change to a #define so that only the users need to have the
required headers included.

But open-coding in the callers saves anyone trying to read the code
having to look at another file to see what is going on.

-- David

> 
>       Arnd
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
