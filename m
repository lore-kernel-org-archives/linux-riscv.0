Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C6ECD54A1
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6rfl9GZZX7xLMSBJpsfTV45Xc20N9iPUu2UIrysCdA=; b=Pfdnh5zYRKlpo2
	z8l9/01ergHQCBlQGbagHNo4LY8SNmopc0uFF4lpVtSkT9cTtGJypsLPYJPlVXLe9xjTMHbC9Jfih
	smlEwTeyEuRWVt5iYbLBjOHVdywffV/KdC/T/yT90KgIRC/42oB3WrU9ea+fbrUOr9RkU/VlGcodX
	mDjljAX0HSBuOH9gQiNoA+jI18d3l0fUkbWSSix2SKhwgJ6T4TviHADIrkwNrYOVjPOX2u2+lWTEg
	+JHP0QLsZ07UX6c+5vM3mzedWONTZ9TwwRWcXEwzrBplpMP/L1Fovpy4XhllxJ3wVY0gyIijcx4j/
	GyFZ9KROu/uYjL1aOroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVey-00HJj3-0d;
	Tue, 19 Sep 2023 08:00:40 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVeu-00HJh6-1N
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 08:00:38 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-109-scVoAueRPmK64unopgoamQ-1; Tue, 19 Sep 2023 09:00:16 +0100
X-MC-Unique: scVoAueRPmK64unopgoamQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 19 Sep
 2023 09:00:12 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 19 Sep 2023 09:00:12 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Charlie Jenkins' <charlie@rivosinc.com>
Subject: RE: [PATCH v6 3/4] riscv: Add checksum library
Thread-Topic: [PATCH v6 3/4] riscv: Add checksum library
Thread-Index: AQHZ5/ZuR2Nhj94ZDEWquHSBL7yNdbAdI/3wgARFmYCAAGOr4A==
Date: Tue, 19 Sep 2023 08:00:12 +0000
Message-ID: <0fe9694900c7492c96dce6b67710173f@AcuMS.aculab.com>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
 <20230915-optimize_checksum-v6-3-14a6cf61c618@rivosinc.com>
 <0357e092c05043fba13eccad77ba799f@AcuMS.aculab.com> <ZQkOSf1b66lHzjaf@ghost>
In-Reply-To: <ZQkOSf1b66lHzjaf@ghost>
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
X-CRM114-CacheID: sfid-20230919_010036_724724_F0BFF62C 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

...
> > So ending up with (something like):
> > 	end = buff + length;
> > 	...
> > 	while (++ptr < end) {
> > 		csum += data;
> > 		carry += csum < data;
> > 		data = ptr[-1];
> > 	}
> > (Although a do-while loop tends to generate better code
> > and gcc will pretty much always make that transformation.)
> >
> > I think that is 4 instructions per word (load, add, cmp+set, add).
> > In principle they could be completely pipelined and all
> > execute (for different loop iterations) in the same clock.
> > (But that is pretty unlikely to happen - even x86 isn't that good.)
> > But taking two clocks is quite plausible.
> > Plus 2 instructions per loop (inc, cmp+jmp).
> > They might execute in parallel, but unrolling once
> > may be required.
> >
> It looks like GCC actually ends up generating 7 total instructions:
> ffffffff808d2acc:	97b6                	add	a5,a5,a3
> ffffffff808d2ace:	00d7b533          	sltu	a0,a5,a3
> ffffffff808d2ad2:	0721                	add	a4,a4,8
> ffffffff808d2ad4:	86be                	mv	a3,a5
> ffffffff808d2ad6:	962a                	add	a2,a2,a0
> ffffffff808d2ad8:	ff873783          	ld	a5,-8(a4)
> ffffffff808d2adc:	feb768e3          	bltu	a4,a1,ffffffff808d2acc <do_csum+0x34>
> 
> This mv instruction could be avoided if the registers were shuffled
> around, but perhaps this way reduces some dependency chains.

gcc managed to do 'data += csum' so had add 'csum = data'.
If you unroll once that might go away.
It might then be 10 instructions for 16 bytes.
Although you then need slightly larger alignment code.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
