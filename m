Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BE4C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 15:00:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1408F61185
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 15:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1408F61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zN0rlagZRn4dOszFdYNDPaPk4wGTrHczH6Hi6afMdWI=; b=oOx9n6+y6NgLD8
	bSRT5ydgMp1LA/f2cBx9+RbWvnxzdRcKTYZLKrUlUZm9Gg34CSDvcof0S8qaS4BnahuWjmiNF1970
	q9Mxx1EG3+jYzEuFCqGJ00csgaTKyAkuD7idfBzdlIbCmN0i78wz5Ck94IPKjCfYzA+BPHhpeeiMW
	DNTy4c1HGlU5Cr0CY/KaZBxU3yTHgGfSmcMCIk5Pb58NlwuiupdwEv2Fgb7HS/DNrFsljIOk5zbge
	EnCUPAgBV8rz7oASzm51IdlwB5b8Gplq0/j04KDvd/NvKmoNJZcQczJeXBmcUckJj4eEoqlWaukBg
	LSCJs22+ifdn778JiVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdDO-0094Na-9M; Tue, 08 Jun 2021 15:00:26 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdDL-0094Kw-0K
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 15:00:24 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-162-9RBwFXs0Nk6I40uBzgaFIw-1; Tue, 08 Jun 2021 16:00:19 +0100
X-MC-Unique: 9RBwFXs0Nk6I40uBzgaFIw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Tue, 8 Jun 2021 16:00:17 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 8 Jun 2021 16:00:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Guo Ren <guoren@kernel.org>
CC: Nick Kossifidis <mick@ics.forth.gr>, Drew Fustini <drew@beagleboard.org>, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "wefu@redhat.com" <wefu@redhat.com>, =?utf-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>, linux-arch
 <linux-arch@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, Guo Ren <guoren@linux.alibaba.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: RE: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Topic: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Index: AQHXW2Yf+E+HbgFRkkm3Xv2DTkp7y6sKNaKQ
Date: Tue, 8 Jun 2021 15:00:17 +0000
Message-ID: <2db975b5f24149b19191120b9f0f506b@AcuMS.aculab.com>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
 <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
 <20210607062701.GB24060@lst.de>
In-Reply-To: <20210607062701.GB24060@lst.de>
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
X-CRM114-CacheID: sfid-20210608_080023_364738_53A97A8B 
X-CRM114-Status: GOOD (  14.01  )
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
> Sent: 07 June 2021 07:27
> 
> On Mon, Jun 07, 2021 at 11:19:03AM +0800, Guo Ren wrote:
> > >From Linux non-coherency view, we need:
> >  - Non-cache + Strong Order PTE attributes to deal with drivers' DMA descriptors
> >  - Non-cache + weak order to deal with framebuffer drivers
> >  - CMO dma_sync to sync cache with DMA devices
> 
> This is not strictly true.  At the very minimum you only need cache
> invalidation and writeback instructions.  For example early parisc
> CPUs and some m68knommu SOCs have no support for uncached areas at all,
> and Linux works.  But to be fair this is very painful and supports only
> very limited periphals.  So for modern full Linux support some uncahed
> memory is advisable.  But that doesn't have to be using PTE attributes.
> It could also be physical memory regions that are either totally fixed
> or somewhat dynamic.

It is almost impossible to interface to many ethernet chips without
either coherent or uncached memory for the descriptor rings.
The status bits on the transmit ring are particularly problematic.

The receive ring can be done with writeback+invalidate provided you
fill a cache line at a time.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
