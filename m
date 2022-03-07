Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEE5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8c07Z6eR8WOs/bAdVVXgiSY8kE3vT3LJUQFdcSFwpc=; b=4/YXpcZ3w6JT1v
	lNIY/LCYQtXnmNWzGFMpBPqWMxn0Ud6Y5nGEZd3mRyTeHDCe+9D7R/BCdE6SLOj1hjVl4Ae+DJ6UI
	CMH6Hpoh/KhI7Az7sls7TT+NGgxyv+5D70e2V6ZKqgSV7hvSpeY/U1eYojFzQr5nA336gQMy47IgT
	crQgR3LWBBFTJdGApMFwHsjdIEhdjspa96RPsdCwbyPXDF8CFOsolbZYvcSOoOjqk37zGksBKj58V
	bLreN09LF6VIn6PU3ZUVuJlv28ed/rEfDQodSDU4lN+eC2NG0VtaZmI2QcGi0/UaOa2Y9HKmDudny
	8zyDN7BwnciLl+H0mB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nREPn-000P3i-SN; Mon, 07 Mar 2022 14:32:47 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nREPk-000P1X-F4
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 14:32:46 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-90-h5M8wZQmO6yot19GRlHRaQ-1; Mon, 07 Mar 2022 14:32:37 +0000
X-MC-Unique: h5M8wZQmO6yot19GRlHRaQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 14:32:34 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 7 Mar 2022 14:32:34 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jisheng Zhang' <jszhang@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] riscv: add irq stack support
Thread-Topic: [PATCH v2] riscv: add irq stack support
Thread-Index: AQHYMi3k+WYJFHSO9UyI1q+ElBcqo6yz+IIw
Date: Mon, 7 Mar 2022 14:32:34 +0000
Message-ID: <f7f46323619e4084b4cfc551cdb47dd0@AcuMS.aculab.com>
References: <20220307140804.1400-1-jszhang@kernel.org>
In-Reply-To: <20220307140804.1400-1-jszhang@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_063244_814951_82103262 
X-CRM114-Status: GOOD (  14.41  )
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
> Sent: 07 March 2022 14:08
> Currently, IRQs are still handled on the kernel stack of the current
> task on riscv platforms. If the task has a deep call stack at the time
> of interrupt, and handling the interrupt also requires a deep stack,
> it's possible to see stack overflow.
> 
...
I'd have thought that a single page is (probably) enough for the
IRQ stack.
Certainly its sizing isn't really related to the normal thread
stack size.

> From another side, after this patch, it's possible to reduce the
> THREAD_SIZE to 8KB for RV64 platforms. This is especially useful for
> those systems with small memory size, e.g the Allwinner D1S platform
> which is RV64 but only has 64MB DDR.

Are you sure?
Is the stack use likely to be very much less than that of x86-64?
The real problem isn't the stack use of the test you are doing,
but the horrid worst case stack of some path that has multiple
1k+ buffers on stack.

Apart from compiler fubar (which usually hit KASAN) that stack
is actually likely to be architecture independent.
(The difference between 32bit and 64bit is also likely to be
relatively small - unless there are on-stack arrays of 'long'.)

For VMAP stacks is there a 'guard' KVA page allocated below
all of the stacks?
64bit systems should have lots of KVA so this shouldn't be
a problem.
Then stack overruns will fault and panic rather than trashing
another data area - which is really hard to debug.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
