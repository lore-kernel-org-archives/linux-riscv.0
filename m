Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4F8C48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 23:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nhMSkTdcPl8WeSQbtNG3HVxfUk8OxdE7hz+m/73wt8=; b=VOBkvrIgh+b5lG
	3F1EPLPdNE0nVqKSsQ/PURJP2bq79ZDxCMhXURID25MOFDczJ0lZGttzjtsY6XJPrmnQ5qjFP4oAO
	Jp1dPtVkwtlTN4aSAO8Hot2tcP/xiJgGeeHCW8+OmWr3h2k1NsJ5ylYgEmKFrjm+iZa14PktUQtHD
	dV8i6/znjL9DhM4Ei2KSm/sp7Zc41HcX6O6/DF2WyNLEMgh9Fmr7Misr0+1OBgFyVM7DsrBDSmYWC
	0M76+bgpFzvVP1PyCQHnRzFftPycRrSAlLK6+1SNT3Wh3qZC/VhTm5tzBFkSnoibShps/1fIr+mtX
	QlGXLlPEeb9JTCxVBHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVg7R-00000009cR3-0bFQ;
	Thu, 01 Feb 2024 23:05:17 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVg7O-00000009cPr-1p4M
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 23:05:16 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-136-zJi0fKrcMoSXVrrBEVhQ3A-1; Thu, 01 Feb 2024 23:05:06 +0000
X-MC-Unique: zJi0fKrcMoSXVrrBEVhQ3A-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 1 Feb
 2024 23:04:48 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 1 Feb 2024 23:04:48 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nick Kossifidis' <mick@ics.forth.gr>, Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matteo Croce
	<mcroce@microsoft.com>
Subject: RE: [PATCH 3/3] riscv: optimized memset
Thread-Topic: [PATCH 3/3] riscv: optimized memset
Thread-Index: AQHaU3UjqUWW/ham3UKhY4ir1PAI6bD2G17g
Date: Thu, 1 Feb 2024 23:04:48 +0000
Message-ID: <26a7af6f33fa440f986adb4d690f47dc@AcuMS.aculab.com>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-4-jszhang@kernel.org>
 <b7ae944c-2b7c-4c8d-8623-a8387b8d4e02@ics.forth.gr>
In-Reply-To: <b7ae944c-2b7c-4c8d-8623-a8387b8d4e02@ics.forth.gr>
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
X-CRM114-CacheID: sfid-20240201_150514_774281_D3B854A2 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

...
> > +		/* Compose an ulong with 'c' repeated 4/8 times */
> > +#ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
> > +		cu *= 0x0101010101010101UL;

That it likely to generate a compile error on 32bit.
Maybe:
		cu *= (unsigned long)0x0101010101010101ULL;
> > +#else
> > +		cu |= cu << 8;
> > +		cu |= cu << 16;
> > +		/* Suppress warning on 32 bit machines */
> > +		cu |= (cu << 16) << 16;
> > +#endif
> 
> I guess you could check against __SIZEOF_LONG__ here.

Or even sizeof (cu), possible as:
		cu |= cu << (sizeof (cu) == 8 ? 32 : 0);
which I'm pretty sure modern compiler will throw away for 32bit.

I do wonder whether CONFIG_ARCH_HAS_FAST_MULTIPLIER is worth
testing - you'd really want to know there is a risc-v cpu
with a multiply that is slower than the shift and or version.
I actually doubt it.
Multiply is used so often (all array indexing) that you
really do need something better than a '1 bit per clock' loop.

It is worth remembering that you can implement an n*n multiply
with n*n 'full adders' (3 input bits, 2 output bits) with a
latency of 2*n adders.
So the latency is only twice that of the corresponding add.
For a modern chip that is not much logic at all.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
