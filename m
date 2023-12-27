Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA3CC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ef/v3PHcc/D8W4GdrsgTsg0afaeTEFWcNqFKbL1RMlE=; b=Kfqr4ICkgLLlNO
	ZOoIMqq63kmTgsSjpBfknL4jJF4X18COtf2NO/aGItVIhgEj0nh1MdpUm9BwI1ieGtg9eIum/MOjB
	gMFyYgG02pn5NFpz/lE5YVVjX2AVqG4VNZlkJH3GdEm6BjtCMPRpxn68MzgMJVjaKAXfsQoABtWLK
	wGfFMkOVNLIHg0X+ZhnirqnMyQMxXp2jVk8KNZkyFzOW07T17iGe9bWwdwCfnfQks6xsphFLjWQJL
	HvF9QSYldC/eROwUoXX3ihQuKTx+4ymMN89zC02L71eRpWPBUlSe1QNQtXTbC5P4tRcsrAIh65X5k
	VK1BVzTwDAgAkzgV5PAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRMk-00ENBH-1h;
	Wed, 27 Dec 2023 10:42:22 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRMg-00ENAn-38
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 10:42:20 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-50-QI0vpALcOICqpEAYQ6T2Mw-1; Wed, 27 Dec 2023 10:42:11 +0000
X-MC-Unique: QI0vpALcOICqpEAYQ6T2Mw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 27 Dec
 2023 10:41:53 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 27 Dec 2023 10:41:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jisheng Zhang' <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Biggers
	<ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, "Qingfang
 DENG" <dqfext@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
Subject: RE: [PATCH v4 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Thread-Topic: [PATCH v4 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Thread-Index: AQHaNu5/tgkH4SyC6kWXjxrDsB1U3bC88TvA
Date: Wed, 27 Dec 2023 10:41:53 +0000
Message-ID: <b289d77481724391ad75c585b82506d7@AcuMS.aculab.com>
References: <20231225044207.3821-1-jszhang@kernel.org>
 <20231225044207.3821-2-jszhang@kernel.org>
In-Reply-To: <20231225044207.3821-2-jszhang@kernel.org>
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
X-CRM114-CacheID: sfid-20231227_024219_297950_CD799BA1 
X-CRM114-Status: UNSURE (   7.63  )
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

From: Jisheng Zhang
> Sent: 25 December 2023 04:42
> 
> Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
> support efficient unaligned access, for performance reason we want
> to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
> avoid performance regressions on other non efficient unaligned access
> platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globally selected.

How efficient are these EFFICIENT_UNALIGNED_ACCESS ?

For single word accesses it doesn't matter much (since they don't fault).
But for memcpy() (and similar) if they are slightly slow (eg the same
as two aligned accesses) it is likely still worth doing misaligned
transfers for both ends and aligned transfers for the middle.

For example, on modern x86 it really isn't worth worrying about
misaligned transfers of 64bit registers.
AFAICT accesses within a cacheline just use byte enables - so are zero
cost. Accesses that cross cache line boundaries do get split - but the
out-of-order execute, store-buffer and the ability to do two reads in
each clock cycle make the overall cost only just measurable.

Not sure how the various RISC-V cpu compare though.
You might get an extra clock delay a lot more often.
So, while mostly you 'don't care' about the alignment, there may
still be a few places where it does matter.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
