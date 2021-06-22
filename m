Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7796FC2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 08:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2E9600D1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 08:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D2E9600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QvNSX5o+IZay5V2lHH6TCjrPiZjuBSkU0L1btiVJ4U=; b=li9icqnAHFDlvd
	InVgYw3zi/r9CwjTowSwiw9Miouax6pSiA+5Xood7zzQLzCUIcYJ5F/NBGnh+obH8Z5YzWJnZAchv
	p5YyCWaSeM3TO/7j+76cMKtyoP7449Xbq+wbhHmwIhFJb097IAjxaRtzCy4GV7t/CpML7Ru6Bj0mU
	l6WpGL3YR3WCjGvCxgMGBTTyyZyhG6R24/YCu4BDvKnWow/0T18QS3U96fn2c4N4gFemdWDCoCl3+
	yF7YwlLUrEINlegR2siar1dyd4WGh9G8v4zZtzyEbGH5dj1Jsr6EyQJMWMRUzc/0LqTM1y0O+W4vy
	glcGmVq6qyhp70g5j8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvbcw-006D5V-6G; Tue, 22 Jun 2021 08:19:22 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvbct-006D4P-6d
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 08:19:20 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-282-wLA-a1MnNfeOyAoMKIhy9g-1; Tue, 22 Jun 2021 09:19:14 +0100
X-MC-Unique: wLA-a1MnNfeOyAoMKIhy9g-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 22 Jun
 2021 09:19:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 22 Jun 2021 09:19:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@infradead.org>, Matteo Croce
 <mcroce@linux.microsoft.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 "Drew Fustini" <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, Guo Ren
 <guoren@kernel.org>
Subject: RE: [PATCH v3 1/3] riscv: optimized memcpy
Thread-Topic: [PATCH v3 1/3] riscv: optimized memcpy
Thread-Index: AQHXZqmHnPZVnMdu5kGR4HMAzUIzKqsfrz9Q
Date: Tue, 22 Jun 2021 08:19:13 +0000
Message-ID: <17bb90eef20145cd9cca1b8e72a514ad@AcuMS.aculab.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-2-mcroce@linux.microsoft.com>
 <YNChl0tkofSGzvIX@infradead.org>
In-Reply-To: <YNChl0tkofSGzvIX@infradead.org>
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
X-CRM114-CacheID: sfid-20210622_011919_555643_7B4E2A94 
X-CRM114-Status: UNSURE (   7.46  )
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

From: Christoph Hellwig
> Sent: 21 June 2021 15:27
...
> > +		for (next = s.ulong[0]; count >= bytes_long + mask; count -= bytes_long) {
> 
> Please avoid the pointlessly overlong line.  And (just as a matter of
> personal preference) I find for loop that don't actually use a single
> iterator rather confusing.  Wjy not simply:
> 
> 		next = s.ulong[0];
> 		while (count >= bytes_long + mask) {
> 			...
> 			count -= bytes_long;
> 		}

My fist attack on long 'for' statements is just to move the
initialisation to the previous line.
Then make sure there is nothing in the comparison that needs
to be calculated every iteration.
I suspect you can subtract 'mask' from 'count'.
Giving:
		count -= mask;
		next = s.ulong[0];
		for (;; count > bytes_long; count -= bytes_long) {

Next is to shorten the variable names!

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
