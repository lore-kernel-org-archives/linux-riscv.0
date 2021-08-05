Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D7EC4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 08:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C885D60230
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 08:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C885D60230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JHbz5CQLoN8OqnyodGbv6SeOugZGzdFTLkkt78akj4=; b=Sxn5zt7eA+QwXu
	nAUe+mJx2ypa9XguPSNRx7rD2kcoTi8NhUVEe9JTqZaG/SIlJ5+xAMDSWx4erYHyrAKIBAfr3uNr7
	1h2B6lkJRBotUNv/uwrlrL91juQfoQlFPekC3Rrh+7yNzdGQWDd6DX0aPgo5V4jNhBpd1faTnZKLa
	NfOJrhNhLZrrf9iQzA4FIwcLmc7SME4EZggsm9VQA++FOuzdvkw6JxM30KXMRtUicQv+i4B8qI/gy
	+h8+sWZ02Tw5MnSYYSbeRPWSr7w+zKgOMYhMfzLAnqbz/6/AK2NDCIpmOnqzaxOdeTDZ3k+K0wEyI
	FBBqb+d5VnS2jtwfrseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBYc7-008egP-N2; Thu, 05 Aug 2021 08:20:27 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBYc4-008eeS-1W
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 08:20:25 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-222-ItXAGynfMm2D6VX6lXBPsw-1; Thu, 05 Aug 2021 09:20:16 +0100
X-MC-Unique: ItXAGynfMm2D6VX6lXBPsw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 5 Aug 2021 09:20:15 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 5 Aug 2021 09:20:15 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Palmer Dabbelt' <palmer@dabbelt.com>, "mcroce@linux.microsoft.com"
 <mcroce@linux.microsoft.com>, "mcroce@linux.microsoft.com"
 <mcroce@linux.microsoft.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Atish Patra <Atish.Patra@wdc.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
 "akira.tsukamoto@gmail.com" <akira.tsukamoto@gmail.com>,
 "drew@beagleboard.org" <drew@beagleboard.org>, "bmeng.cn@gmail.com"
 <bmeng.cn@gmail.com>, "guoren@kernel.org" <guoren@kernel.org>, "Christoph
 Hellwig" <hch@infradead.org>
Subject: RE: [PATCH] riscv: use the generic string routines
Thread-Topic: [PATCH] riscv: use the generic string routines
Thread-Index: AQHXiXDwMuHx//JaRE+MHXqCWo1pFatkkT8w
Date: Thu, 5 Aug 2021 08:20:15 +0000
Message-ID: <b8d9437cae2248c7a2cb6244f5d760ec@AcuMS.aculab.com>
References: <CAFnufp1QpMc87+-hwPa887iQQGCjjkGNanVSKOUsE-0ti82jrA@mail.gmail.com>
 <mhng-7b8d3a12-e223-4b69-a35a-617b0d7ac8f7@palmerdabbelt-glaptop>
In-Reply-To: <mhng-7b8d3a12-e223-4b69-a35a-617b0d7ac8f7@palmerdabbelt-glaptop>
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
X-CRM114-CacheID: sfid-20210805_012024_408012_E9F96299 
X-CRM114-Status: GOOD (  20.19  )
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
> Sent: 04 August 2021 21:40
> 
> On Tue, 03 Aug 2021 09:54:34 PDT (-0700), mcroce@linux.microsoft.com wrote:
> > On Mon, Jul 19, 2021 at 1:44 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >>
> >> From: Matteo Croce <mcroce@microsoft.com>
> >>
> >> Use the generic routines which handle alignment properly.
> >>
> >> These are the performances measured on a BeagleV machine for a
> >> 32 mbyte buffer:
> >>
> >> memcpy:
> >> original aligned:        75 Mb/s
> >> original unaligned:      75 Mb/s
> >> new aligned:            114 Mb/s
> >> new unaligned:          107 Mb/s
> >>
> >> memset:
> >> original aligned:       140 Mb/s
> >> original unaligned:     140 Mb/s
> >> new aligned:            241 Mb/s
> >> new unaligned:          241 Mb/s
> >>
> >> TCP throughput with iperf3 gives a similar improvement as well.
> >>
> >> This is the binary size increase according to bloat-o-meter:
> >>
> >> add/remove: 0/0 grow/shrink: 4/2 up/down: 432/-36 (396)
> >> Function                                     old     new   delta
> >> memcpy                                        36     324    +288
> >> memset                                        32     148    +116
> >> strlcpy                                      116     132     +16
> >> strscpy_pad                                   84      96     +12
> >> strlcat                                      176     164     -12
> >> memmove                                       76      52     -24
> >> Total: Before=1225371, After=1225767, chg +0.03%
> >>
> >> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> ---
> >
> > Hi,
> >
> > can someone have a look at this change and share opinions?
> 
> This LGTM.  How are the generic string routines landing?  I'm happy to
> take this into my for-next, but IIUC we need the optimized generic
> versions first so we don't have a performance regression falling back to
> the trivial ones for a bit.  Is there a shared tag I can pull in?

I thought the actual problem was that the asm copy functions were
doing misaligned transfers and faulting.

There is no way that the simple C loop should be as fast as
the asm function given the delay cycles reading from memory.

You definitely need to test much smaller copies where the
buffers are resident in the L1 data cache.
Anything else is completely dominated by the cache line fills/spills.

You also need to test on the much faster riscv implementations
not just on the beaglev board.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
