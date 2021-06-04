Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB89FC07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA2C613E9
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA2C613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pu7DN5F/AKwIfe1/kX5qEA+bmUeiTkwHf5OSiJ9Tds8=; b=x3XU8XniLW56LX
	U1ndiImawvUrHuuCFzNmasUwto+yqRSpAOjf6MmbC9mucFce6yZWCV3/D9Zj3EOtl/tK7CmX8+ErF
	mF3d2ZIKxf6v949Ou7kWYn/dvteEOWa+wRdzB/mMj6jmXAcKHfHMxjrxllCOFwnt4O+7C6aab5oDV
	HGc6iUeJ/Bef0kq4flyacQyMvoWWuaUqZrQPgrNcPEXAar1cjuKKx3UCXEnplgIA7fi9aiEQVA1qi
	fvSszCHPsaFpqdJ1NWxBWPnXWo9uP1GNJpLcyMT9eOv0SImdmZc/LscWNpZ5NCrC12NGi+uxjvp1E
	rlHXSQdlptCqRxYOC17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp5ln-00CTaQ-B7; Fri, 04 Jun 2021 09:05:35 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp5iv-00CSK6-Ix
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 09:02:42 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-237-NXl5cs6NMkGVq-pfDNrTRg-1; Fri, 04 Jun 2021 10:02:30 +0100
X-MC-Unique: NXl5cs6NMkGVq-pfDNrTRg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Fri, 4 Jun 2021 10:02:29 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Fri, 4 Jun 2021 10:02:29 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Palmer Dabbelt' <palmer@dabbelt.com>, Anup Patel <Anup.Patel@wdc.com>
CC: "guoren@kernel.org" <guoren@kernel.org>, "anup@brainfault.org"
 <anup@brainfault.org>, "drew@beagleboard.org" <drew@beagleboard.org>,
 Christoph Hellwig <hch@lst.de>, "wefu@redhat.com" <wefu@redhat.com>,
 "lazyparser@gmail.com" <lazyparser@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "guoren@linux.alibaba.com" <guoren@linux.alibaba.com>, Paul Walmsley
 <paul.walmsley@sifive.com>
Subject: RE: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Topic: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Index: AQHXWI67+E+HbgFRkkm3Xv2DTkp7y6sDjh4w
Date: Fri, 4 Jun 2021 09:02:29 +0000
Message-ID: <f3d84841a80e4244887939624f6d3c10@AcuMS.aculab.com>
References: <CO6PR04MB7812D8905C6EEBDE8513866F8D3C9@CO6PR04MB7812.namprd04.prod.outlook.com>
 <mhng-3875d1bc-74dd-4dc8-b71d-18a8f004039a@palmerdabbelt-glaptop>
In-Reply-To: <mhng-3875d1bc-74dd-4dc8-b71d-18a8f004039a@palmerdabbelt-glaptop>
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
X-CRM114-CacheID: sfid-20210604_020237_942609_DA8840FC 
X-CRM114-Status: GOOD (  12.07  )
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

From: Palmer Dabbelt
> Sent: 03 June 2021 16:39
...
> An example here would be the errata: every system has errata of some
> sort, so if we start flipping off various vendor's errata Kconfigs
> you'll end up with kernels that only function properly on some systems.
> That's fine with me, as long as it's possible to turn on all vendor's
> errata Kconfigs at the same time and the resulting kernel functions
> correctly on all systems.

ISTM that if you can (easily) detect the errata then the detection
should be left it - but the kernel fail to boot if the system
needs the errata fixed.

The same would be needed for DMA in systems with non-coherent memory.

Only a hardware engineer would build a system with non-coherent memory
and without the ability to do uncached accesses and flush/invalidate
small sections of cache.

Mind you we did get a dual-cpu system that didn't have cache-coherency
between the cpus! That was singularly useless.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
