Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13702C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 16:11:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA47A61059
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 16:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA47A61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUzBqNLsLxk2IQQaGCpS8cChvmNMZlS0thtIjxIJa/w=; b=Uu40sH/sKmTsLy
	H1hiXvVi+w8A63h/yOiefMQhh8yUvQ/5rkgUCIlGAbwni4U8/03b5Z57u0XmOYCoUB2OJ6xh/ErIY
	j33P5/MhKjV4SkcB9Pmwhhci1vbH7cXEKfZirxQIPdRDF7s01rNeUX9suG417dHtviraxxfVWUkeo
	S8d5hbdtkMtFXl8NbFrQh4AS6lTUuLIfqzJWDsMwO+hA330CwJ2PlkFVX83BRzd3W9eC/FFhQ6Gar
	605uognijFYI1b4qol1YguJyY4Xe6Emn6nM5Ap0HHkIICfjtZKjQd4lpfjta7G0rM8jCgZooXr1qS
	d/5mHw1cKZups7Pm/4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqeK5-009Sc0-0H; Tue, 08 Jun 2021 16:11:25 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeK2-009SaO-8w
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 16:11:23 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-234-62pR9OyRO-SSSIbw5JosqQ-1; Tue, 08 Jun 2021 17:11:16 +0100
X-MC-Unique: 62pR9OyRO-SSSIbw5JosqQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Tue, 8 Jun 2021 17:11:15 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 8 Jun 2021 17:11:15 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>
CC: Guo Ren <guoren@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>, "Drew
 Fustini" <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>, "Palmer
 Dabbelt" <palmerdabbelt@google.com>, "wefu@redhat.com" <wefu@redhat.com>,
 =?utf-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, Guo Ren
 <guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Benjamin Koch <snowball@c3pb.de>, Matteo Croce <mcroce@linux.microsoft.com>,
 Wei Fu <tekkamanninja@gmail.com>
Subject: RE: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Topic: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Index: AQHXW2Yf+E+HbgFRkkm3Xv2DTkp7y6sKNaKQ///5qoCAABnpEA==
Date: Tue, 8 Jun 2021 16:11:15 +0000
Message-ID: <7a11939f4c7f4494a7d86b8d5f1bb702@AcuMS.aculab.com>
References: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
 <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
 <20210607062701.GB24060@lst.de>
 <2db975b5f24149b19191120b9f0f506b@AcuMS.aculab.com>
 <20210608153203.GA6802@lst.de>
In-Reply-To: <20210608153203.GA6802@lst.de>
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
X-CRM114-CacheID: sfid-20210608_091122_603264_8681D9E0 
X-CRM114-Status: GOOD (  14.45  )
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

From: 'Christoph Hellwig'
> Sent: 08 June 2021 16:32
> 
> On Tue, Jun 08, 2021 at 03:00:17PM +0000, David Laight wrote:
> > It is almost impossible to interface to many ethernet chips without
> > either coherent or uncached memory for the descriptor rings.
> > The status bits on the transmit ring are particularly problematic.
> >
> > The receive ring can be done with writeback+invalidate provided you
> > fill a cache line at a time.
> 
> It is horrible, but it has been done.  Take a look at:
> 
> drivers/net/ethernet/i825xx/lasi_82596.c and
> drivers/net/ethernet/seeq/sgiseeq.c

I guess that each transmit has to be split into enough
fragments that they fill a cache line.
That won't work with some (probably old now) devices that
require the first fragment to be 64 bytes because it won't
back-up the descriptors after a collision.

It's all as horrid as a DSP we have that can't receive ethernet
frames onto a 4n+2 boundary and doesn't support misaligned accesses.

Mind you, Sun's original Sbus ethernet board had to be given
a 4n aligned rx buffer and then a misaligned copy done in kernel
in order to not drop packets!

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
