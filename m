Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBEBC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wOcouyO9y03XKAZN1VhDAU6QWV/5hZ2hzSCngJUn6U=; b=10Goc2ud48OH3T
	bF0fLeFuYs2JZwh2xeQW25mDqfrRtfxvxBpOWL39LtALbIPbYhqEl0hPBIaFstPdYv9q4A1HkwZaV
	ZE2ry41RpNMVGMHI8raUMyqXAGtOvKgjhy6mdvNEWfdihHbrcQB00kOqp1W0TLrBux+HHsxpX/eVy
	HBu3MKObypWINRhkgqpF2irWaMRPzHSzEIJRZEALBIQObg1S6oYn3UR8zWnzK6Iga525xIK3k3LFR
	iPx1GuzLwxxIlURzUvgKPCacWJG9NvW5iJXW5IZotuoNsiaEHirE5cgl+bMO/vcPK7LRE8Zsy0gqJ
	FfuAaQQdziNb1i118lYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmeO-0000000GYsD-1Dfz;
	Tue, 30 Jan 2024 11:51:36 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmeL-0000000GYpi-0Gu7
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:51:34 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-241-VzaTdC0ENPqj-j_pQMBvdA-1; Tue, 30 Jan 2024 11:51:24 +0000
X-MC-Unique: VzaTdC0ENPqj-j_pQMBvdA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 30 Jan
 2024 11:51:05 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 30 Jan 2024 11:51:05 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jisheng Zhang' <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matteo Croce
	<mcroce@microsoft.com>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH 2/3] riscv: optimized memmove
Thread-Topic: [PATCH 2/3] riscv: optimized memmove
Thread-Index: AQHaUdxjAvIJPrdYsUmtWfJZGIT/drDvKbzwgAMSEICAAAQ2IA==
Date: Tue, 30 Jan 2024 11:51:05 +0000
Message-ID: <2391e924440d4e59b7859b8ede8f0954@AcuMS.aculab.com>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
 <59bed43df37b4361a8a1cb31b8582e9b@AcuMS.aculab.com>
 <Zbjd43y3s6PDfQE0@xhacker>
In-Reply-To: <Zbjd43y3s6PDfQE0@xhacker>
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
X-CRM114-CacheID: sfid-20240130_035133_418643_F42451E4 
X-CRM114-Status: GOOD (  18.65  )
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

From: Jisheng Zhang
> Sent: 30 January 2024 11:31
> 
> On Sun, Jan 28, 2024 at 12:47:00PM +0000, David Laight wrote:
> > From: Jisheng Zhang
> > > Sent: 28 January 2024 11:10
> > >
> > > When the destination buffer is before the source one, or when the
> > > buffers doesn't overlap, it's safe to use memcpy() instead, which is
> > > optimized to use a bigger data size possible.
> > >
> > ...
> > > + * Simply check if the buffer overlaps an call memcpy() in case,
> > > + * otherwise do a simple one byte at time backward copy.
> >
> > I'd at least do a 64bit copy loop if the addresses are aligned.
> >
> > Thinks a bit more....
> >
> > Put the copy 64 bytes code (the body of the memcpy() loop)
> > into it an inline function and call it with increasing addresses
> > in memcpy() are decrementing addresses in memmove.
> 
> Hi David,
> 
> Besides the 64 bytes copy, there's another optimization in __memcpy:
> word-by-word copy even if s and d are not aligned.
> So if we make the two optimizd copy as inline functions and call them
> in memmove(), we almost duplicate the __memcpy code, so I think
> directly calling __memcpy is a bit better.

If a forwards copy is valid call memcpy() - which I think you do.
If not you can still use the same 'copy 8 register' code
that memcpy() uses - just with a decrementing block address.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
