Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAB7C47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4Sn8ODHRNyh+TgleiZrL2vnExfgedTK07pPgyvMZls=; b=ShkLwZYnvpR0sx
	lPymzUdYr2Dw8UsjO18hQzEfu6s5oN0Cx5aLWW5Qyr7HdH6L9BALLF874kLcR9FqXoxOT7WYQ2Ghi
	IzgSV9roEdqB8rGTKqqXw5/b1vdmL0FdZeUq9ii70mw7clFgIQySbi8TBJMnBblHAOlG4VEnY9vVz
	r4gGTJPWbh4TFScWFcrwXRb5ZzRknicNfbH9wiEiXku+TuhY1T0AW3CNczKJ4EYnW9pcG9aUDRsMQ
	okqqz5/EaxAwr9O6br9lrDMSGK2St693cHlgZQyxjeI+MDTegr+vGmIWrtI73wzKRiK9PQ7oKUNlC
	13YdAyTINEtKqj0o1E5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPn34-00Cksv-1c;
	Tue, 16 Jan 2024 17:16:26 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPn31-00Ckru-1s
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 17:16:25 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-70-O4suwSxkO-eGETgMSyPNLQ-1; Tue, 16 Jan 2024 17:16:15 +0000
X-MC-Unique: O4suwSxkO-eGETgMSyPNLQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 16 Jan
 2024 17:15:56 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 16 Jan 2024 17:15:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andrew Jones' <ajones@ventanamicro.com>, Xiao Wang
	<xiao.w.wang@intel.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "heiko@sntech.de" <heiko@sntech.de>,
	"haicheng.li@intel.com" <haicheng.li@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: Optimize crc32 with Zbc extension
Thread-Topic: [PATCH] riscv: Optimize crc32 with Zbc extension
Thread-Index: AQHaSI1C2Wp5kEQM1k+UoNSZlBGjlrDcqukw
Date: Tue, 16 Jan 2024 17:15:56 +0000
Message-ID: <1153d2dd82cf43adb6062627d8d89b27@AcuMS.aculab.com>
References: <20240105080830.3738117-1-xiao.w.wang@intel.com>
 <20240116-9f09b002afc2337ab5e41e3f@orel>
In-Reply-To: <20240116-9f09b002afc2337ab5e41e3f@orel>
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
X-CRM114-CacheID: sfid-20240116_091623_908069_E4C78BA5 
X-CRM114-Status: GOOD (  11.23  )
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
> > +static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
> > +#if (BITS_PER_LONG == 64)
> > +					  size_t len, u32 poly, u64 poly_qt,
> > +#else
> > +					  size_t len, u32 poly, u32 poly_qt,
> > +#endif
> 
> How about creating a new type for poly_qt, defined as u64 for xlen=64
> and u32 for xlen=32 to avoid the #ifdef?

unsigned long ?

...
> > +	for (int i = 0; i < len; i++) {
> > +#if (BITS_PER_LONG == 64)
> > +		s = (unsigned long)crc << 32;
> > +		s ^= __cpu_to_be64(*p_ul++);
> > +#else
> > +		s = crc ^ __cpu_to_be32(*p_ul++);
> > +#endif
> 
> Could write the above without #ifdef with

Haven't I seen a bpf patch that rather implies that byteswap
is likely to be truly horrid?

I've not tried to parse the crc code (although I do understand
how it should work). But I'm surprised you need a byteswap.

After all, the crc is basically a long division of the buffer
by the crc constant.

The CRC I've done recently is the hdlc crc-16.
My nios version (also mips-like) has:

static __inline__ uint32_t
crc_step(uint32_t crc, uint32_t byte_val)
{
#if defined(crc_step_ci)
    return crc_step_ci(byte_val, crc);
#else
    uint32_t t = crc ^ (byte_val & 0xff);
    t = (t ^ t << 4) & 0xff;
    return crc >> 8 ^ t << 8 ^ t << 3 ^ t >> 4;
#endif
}

I normally use a custom instruction for the logic - one clock.
But the C code is only a couple of clocks slower that the best
table lookup version.
On anything pipelined and multi-issue the C code is likely to
be faster than a lookup table!
I don't know if any of the 32bit crc can be reduced the same way.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
