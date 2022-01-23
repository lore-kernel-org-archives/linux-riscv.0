Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38E1C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 22:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Q6MEaPyt9uN64LTcYIwEgHHf3mRU2Aw5cJB3xTSBu0=; b=JngfOYe7q8Qvl/
	kxsK1YJkZkHr+USC48+x1R2ywsjD8Y/fRDrRFxrUjiDpDDikL+Nl3bFWW2Heq8ovAnuOA5OckQswC
	nGuD3KMsg8uSypIVwPcQ0/Z91XrlscS5HwHPuYQwXTJ0+h2xgxXvSW9ji8wJsAE4LNL5mE1BHeb31
	1YWnsFpK+ks7FPoAecRmEtD7E0F6PnrWMB738htMyWtS611hVRA/XzrRO6qSkloIDAbVOvpeOzU6q
	YdR9aK3yx5IkpgpAASzIkPV+AJMAUHeRtGqYZJ+RGcVJqmRnvRJ7XkqYVnTYA7g7PbLyX2Mlt00jv
	GR/G9CVKhy1mUc/6zuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBlSh-001rc0-PE; Sun, 23 Jan 2022 22:35:51 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBlSe-001rbN-LS
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 22:35:50 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-146-j431FoBtPWOTRkv9X37z6Q-1; Sun, 23 Jan 2022 22:35:43 +0000
X-MC-Unique: j431FoBtPWOTRkv9X37z6Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sun, 23 Jan 2022 22:35:40 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sun, 23 Jan 2022 22:35:40 +0000
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
Thread-Index: AQHYEHnD40bov+QiXEW/3JioguNB76xxMaEw
Date: Sun, 23 Jan 2022 22:35:40 +0000
Message-ID: <228cbdb42a5c4c2f9d7214d2685fcaeb@AcuMS.aculab.com>
References: <20220123034518.3717116-1-michael@michaelkloos.com>
 <fed7ee473044432180c67b4adc0eb45d@AcuMS.aculab.com>
 <c184c65e-c960-8ecc-7cfe-d58af1cde0a3@michaelkloos.com>
In-Reply-To: <c184c65e-c960-8ecc-7cfe-d58af1cde0a3@michaelkloos.com>
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
X-CRM114-CacheID: sfid-20220123_143549_017552_1BD315FD 
X-CRM114-Status: UNSURE (   4.49  )
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

From: michael@michaelkloos.com
> Sent: 23 January 2022 16:54
> 
> No.  It only uses tabs.  The previous version used spaces.

Ah, it was the old one that was wrong.
One of them was.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
