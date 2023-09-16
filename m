Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B354ACD37B7
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chDZj+8hGpamTx1ITP7RA3evR4TRFOOep2WYvwbAybQ=; b=T29fsrQhKXyI/i
	HwQZrCytrHgfNEg+QGwWGvQKhk9JgW2Kfn+fu2T740dkBz+u7sBCuWLy+GKNVxvdNIef3rvUNxHAM
	062DGucHEBDvzmraxRLNDT44k/eXnjl3VjF/r9RhHuU0YEiG1acRu9na5jLKEbMMl/Rf2pDD+j93Y
	w/GicLQHOjZ8wiAT0nsZ2M3EVG9jrOuCthxqqn7G9yvMTCkZ7ENvZt5d6DFJL6Gq9lruY56yM8l3X
	ATBTZMG9TjJk6C/tg5BD8pezZMLKVq+tIz9oKo+xTunEh/EVrlu6wEr/4idsfpoCX5taAbmtbOqfx
	ngk78WiiXHWxiL4x1OwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhRfd-00CFav-2V;
	Sat, 16 Sep 2023 09:32:57 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhRfb-00CFaL-0a
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 09:32:57 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-244-9HYSYDoAOBG_m3lja_VXfg-1; Sat, 16 Sep 2023 10:32:44 +0100
X-MC-Unique: 9HYSYDoAOBG_m3lja_VXfg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 16 Sep
 2023 10:32:40 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 16 Sep 2023 10:32:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Charlie Jenkins' <charlie@rivosinc.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH v6 3/4] riscv: Add checksum library
Thread-Topic: [PATCH v6 3/4] riscv: Add checksum library
Thread-Index: AQHZ5/ZuR2Nhj94ZDEWquHSBL7yNdbAdI/3w
Date: Sat, 16 Sep 2023 09:32:40 +0000
Message-ID: <0357e092c05043fba13eccad77ba799f@AcuMS.aculab.com>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
 <20230915-optimize_checksum-v6-3-14a6cf61c618@rivosinc.com>
In-Reply-To: <20230915-optimize_checksum-v6-3-14a6cf61c618@rivosinc.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_023255_494657_8AC976DF 
X-CRM114-Status: GOOD (  18.83  )
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

From: Charlie Jenkins
> Sent: 15 September 2023 18:01
> 
> Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> will load from the buffer in groups of 32 bits, and when compiled for
> 64-bit will load in groups of 64 bits.
> 
...
> +	/*
> +	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
> +	 * faster than doing 32-bit reads on architectures that support larger
> +	 * reads.
> +	 */
> +	while (len > 0) {
> +		csum += data;
> +		csum += csum < data;
> +		len -= sizeof(unsigned long);
> +		ptr += 1;
> +		data = *ptr;
> +	}

I think you'd be better adding the 'carry' bits in a separate
variable.
It reduces the register dependency chain length in the loop.
(Helps if the cpu can execute two instructions in one clock.)

The masked misaligned data values are max 24 bits
(if 

You'll also almost certainly remove at least one instruction
from the loop by comparing against the end address rather than
changing 'len'.

So ending up with (something like):
	end = buff + length;
	...
	while (++ptr < end) {
		csum += data;
		carry += csum < data;
		data = ptr[-1];
	}
(Although a do-while loop tends to generate better code
and gcc will pretty much always make that transformation.)

I think that is 4 instructions per word (load, add, cmp+set, add).
In principle they could be completely pipelined and all
execute (for different loop iterations) in the same clock.
(But that is pretty unlikely to happen - even x86 isn't that good.)
But taking two clocks is quite plausible.
Plus 2 instructions per loop (inc, cmp+jmp).
They might execute in parallel, but unrolling once
may be required.

...
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
...
> +		}
> +end:
> +		return csum >> 16;
> +	}

Is it really worth doing all that to save (I think) 4 instructions?
(shift, shift, or with rotate twice).
There is much more to be gained by careful inspection
of the loop (even leaving it in C).

> +
> +#ifndef CONFIG_32BIT
> +	csum += (csum >> 32) | (csum << 32);
> +	csum >>= 32;
> +#endif
> +	csum = (unsigned int)csum + (((unsigned int)csum >> 16) | ((unsigned int)csum << 16));

Use ror64() and ror32().

	David

> +	if (offset & 1)
> +		return (unsigned short)swab32(csum);
> +	return csum >> 16;
> +}
> 
> --
> 2.42.0

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
