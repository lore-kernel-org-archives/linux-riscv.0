Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638D5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 22:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEe0TUvdm2Hpfk5plxJiWVxYTw6KMrkj4kQjMoZAvI0=; b=nScRPxqpPh8/+b
	i5A274dSMHTr0MDV8e+d8eRd5jQVEXQGNa+XcHcOctAfriv+gWXxL4jI87eG0miGkTRhFspzf/ZpY
	FNRrVYd05KLJhLtUGVOiEtakcfvhhROco68mMzs3I+oMvcmKtP50X6c1SxXN8E5AZHmm0DyVwMJ1T
	tNVDazMmiiC5sxoBSLwtXPdS7ijge9Pp4Y5BKalMKkhwUyIQkD4qTuliGAovyUi8rv1fvgjMlLfqh
	pM7oSTAgrAcC6gKNHljPmYITQwXzCgFZcQ6g6/gEDYP4QZOoidN8umrS6f0jLqj/nMnUFx/DRjmh9
	OAJzfW9xKKpEdJ+2d5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC7pD-005SXy-Gu; Mon, 24 Jan 2022 22:28:35 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC7p9-005SXS-SC
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 22:28:33 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-403-wZBAgXQyNgW9L0sW707gJQ-1; Mon, 24 Jan 2022 22:28:24 +0000
X-MC-Unique: wZBAgXQyNgW9L0sW707gJQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 24 Jan 2022 22:28:24 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 24 Jan 2022 22:28:24 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'michael@michaelkloos.com'" <michael@michaelkloos.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] Fixed: Misaligned memory access. Fixed pointer
 comparison.
Thread-Topic: [PATCH v2] Fixed: Misaligned memory access. Fixed pointer
 comparison.
Thread-Index: AQHYEVdKMW4neByjLUyzfoYpVaSTlKxyvXYg
Date: Mon, 24 Jan 2022 22:28:23 +0000
Message-ID: <394ff54c0b574484a4656e52c3c7e244@AcuMS.aculab.com>
References: <20220123034518.3717116-1-michael@michaelkloos.com>
 <4fa1c4bbf27242cf9835dde0abdc89d5@AcuMS.aculab.com>
 <fdbf6e1c-6ed1-bb82-1a56-f7188de7f83f@michaelkloos.com>
In-Reply-To: <fdbf6e1c-6ed1-bb82-1a56-f7188de7f83f@michaelkloos.com>
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
X-CRM114-CacheID: sfid-20220124_142832_228394_605A8120 
X-CRM114-Status: GOOD (  17.32  )
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

From: michael@michaelkloos.com
> Sent: 24 January 2022 19:19

Re-instating the bit I commented on ..
> > ... Additionally, hardware support may not exist and would likely
> > still run slower than aligned accesses even if it did.
> 
> > That may not be true.
> > On x86 the cost of misaligned accesses only just measurable.
> > It isn't even one clock per cache line for reads (eg ipcsum).

> I know that the Intel manuals still recommend alignment on x86.  I
> haven't tried to measure performance differences yet.

IIRC they recommend aligned writes in particular.
(And don't do misaligned locked accesses that cross page boundaries.)

I've done some measurements for reads and the cost really was minimal.
You'd need to be doing a high proportion of multi-kb misaligned transfers
to cover the cost of any conditional test on aligned tranfsers.

> I think the issue here is that RISC-V is designed as a modular
> architecture.  Unlike x86, we don't know that misaligned accesses
> will or will not be supported.  I will grant you that if they are
> supported by hardware, it will probably be faster to let the hardware
> natively take care of it.  However, if the hardware doesn't support
> it, the kernel won't be compatible with that hardware.

Indeed you really don't want to be fixing up alignment faults - ever.
I've no idea why that ever became acceptable.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
