Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58283C71153
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 21:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyooVNlKjWkACRm4Dv1eMkIckvMxmVIAhd86jhVFAs0=; b=OEpLZUDVyR7Wdg
	1AYkHdDR6nHZJDvAWk5N0sKF1CmptkW7ZK2z15aNpifcFgNUfuDdHRYKHFw23PCQrVRDNFCjbI/30
	FZRiIgT0HPVemEnTmuRd5q/COTDTYJa74xQUtbizAaD+PF3yQ5haZ6wyR4Wz0nQKjpFMqqfIrMkjH
	CdSmoXhS7M+MoxVH7Z4aM69B/tEWbsV1rUdoqk+avWpUud3w7VJU6hpMu4NxFy0KqsmulA4q16qlR
	t01KJZqR8uRersORneM8UOxjV5Si0Y4N6l1QTUmScdQDCypxMdnG+C10j8HLNbjpJtEhiBW/VRxSB
	UR4KkdEpANcQRg6cwEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfRrZ-00GuNd-0c;
	Sun, 10 Sep 2023 21:21:01 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfRrW-00GuN0-1P
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 21:21:00 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-146-jIjh0yxkNzCFrfh3QFoU7A-1; Sun, 10 Sep 2023 22:20:42 +0100
X-MC-Unique: jIjh0yxkNzCFrfh3QFoU7A-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 10 Sep
 2023 22:20:33 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 10 Sep 2023 22:20:33 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Charlie Jenkins' <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH v2 1/5] riscv: Checksum header
Thread-Topic: [PATCH v2 1/5] riscv: Checksum header
Thread-Index: AQHZ4bMJWeMEu2xwd0uaIDwvnyVCgbAUlGVw
Date: Sun, 10 Sep 2023 21:20:33 +0000
Message-ID: <cec0f23506a54b9aaaef054ea949e4aa@AcuMS.aculab.com>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-1-ccd658db743b@rivosinc.com>
 <20230907-f8c8993dbeb24d5ea5310ec7@fedora> <ZPoMAGYlIxPZsE7+@ghost>
In-Reply-To: <ZPoMAGYlIxPZsE7+@ghost>
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
X-CRM114-CacheID: sfid-20230910_142058_742191_9A979501 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

...
> > > +/*
> > > + *	Fold a partial checksum without adding pseudo headers
> > > + */
> > > +static inline __sum16 csum_fold(__wsum sum)
> > > +{
> > > +	sum += (sum >> 16) | (sum << 16);
> > > +	return (__force __sum16)(~(sum >> 16));
> > > +}

I'm intrigued, gcc normally compiler that quite well.
The very similar (from arch/arc):
	return (~sum - rol32(sum, 16)) >> 16;
is slightly better on most architectures.
(Especially if the ~sum and rol() can be executed together.)

The only odd archs I saw were sparc32 (carry flag bug no rotate)
and arm (barrel shifter on all instructions).

It is better than the current asm for a lot of archs including x64.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
