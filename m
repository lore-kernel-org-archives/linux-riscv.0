Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA920C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg7hjEoXtmppfv0045qT7V3oNS/UNTwBuSMjcWCLuxU=; b=cIqRyuIu+pxouz
	GvkXou/8D0OK0pYw+F9bUYdID3sGFZXJNtFbG5hPOGBT0U1SmQTOjxwVxTalqOb5LXiwn9U2iCpeP
	Js6Df9ay0L6Pnnyq0Axj5WpGLgYpgKjWJyOgdGRCM6MfnIuFLfBepwZlHsaROXAfCETg+2HNwj/jN
	mZTJV5cu5eJHz8eufPrUMpu9zwZ3XItGLzdhuXCn6F/cYMsUhuNvUvlgneeKYP9auozvqqTkICKjf
	E1NsTJL9G44yhXluFmCn2T1rsKVhv3eGiJRcbWIve/xa919FsCw0T5O8c7LWKID71/BSnkxzBVgIz
	0mMHZriQN+I2R7sKrnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9gR-009cmD-30;
	Mon, 18 Dec 2023 09:13:07 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9gO-009cjZ-0j
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 09:13:06 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-269-EFmJvLQYPUOJ2E6UmrH6ng-1; Mon, 18 Dec 2023 09:12:58 +0000
X-MC-Unique: EFmJvLQYPUOJ2E6UmrH6ng-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 18 Dec
 2023 09:12:36 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 18 Dec 2023 09:12:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ivan Orlov' <ivan.orlov0322@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "samuel@sholland.org"
	<samuel@sholland.org>, "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
Subject: RE: [PATCH] riscv: lib: Optimize 'strlen' function
Thread-Topic: [PATCH] riscv: lib: Optimize 'strlen' function
Thread-Index: AQHaLduBo9lhsHug1EOTPi9OJpSM+LCtyBWAgABcPYCAAKHfoA==
Date: Mon, 18 Dec 2023 09:12:36 +0000
Message-ID: <6aa468db18c04ad39e46612b343b2a60@AcuMS.aculab.com>
References: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
 <a210197c479e48778672aa13287eef88@AcuMS.aculab.com>
 <45351e30-d197-4b9c-864f-8ff5f9b6ab61@gmail.com>
In-Reply-To: <45351e30-d197-4b9c-864f-8ff5f9b6ab61@gmail.com>
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
X-CRM114-CacheID: sfid-20231218_011304_543468_2098874B 
X-CRM114-Status: GOOD (  13.82  )
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

From: Ivan Orlov
> Sent: 17 December 2023 23:23
> 
> On 12/17/23 18:10, David Laight wrote:
> > From: Ivan Orlov
> >> Sent: 13 December 2023 15:46
> >
> > Looking at the old code...
> >
> >>   1:
> >> -	lbu	t0, 0(t1)
> >> -	beqz	t0, 2f
> >> -	addi	t1, t1, 1
> >> -	j	1b
> >
> > I suspect there is (at least) a two clock stall between
> > the 'ldu' and 'beqz'.
> 
> Hmm, the stall exists due to memory access? Why does two subsequent
> accesses to the memory (as in the example you provided) do the trick? Is
> it because two "ldb"s could be parallelized?

On the fpga RISCV (and probably other 'small' implementations)
there is a two clock result delay from memory loads while the
result is written to the 'register file'.
ALU results get short-circuited so can be used in the next instruction.

The memory loads themselves are pipelined and can be issued
every clock.
(On the fpga version actual memory delays stall the pipeline.) 

...
> Maybe we could enhance it even more by loading 4 consequent bytes into
> different registers so the memory loads would still be parallelized?

You need the loads to be pipelined, not parallelized.
That will help if there are longer delays accessing cache memory.

I'd expect any cpu with (say) a 4 clock cache read latency to
pipeline reads so that one can be issued every clock provided
the results aren't needed.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
