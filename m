Return-Path: <SRS0=Ffl8=L7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13888C07E9B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jul 2021 10:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD42D61A06
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jul 2021 10:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD42D61A06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpIoxB4COOQDOCGqSI7EAFPG/5kQw21gGyXSiafivx0=; b=ZWKlb6Qgshxz5l
	0MesTfxf2iRIQORLSVp5jskTsJowxmBijKM57X6LjdtferwS8eJjws1IGOBFhj8IzpxRorWwi9vo9
	ukNcZpB/BLDs20QSb4djVzLCSfqgDHhKLtbT7wIS/6AM3vpvzaxOoqOLsWwzmFTUrbnNfU3MDaF5L
	A5bHAZOxo+CB1pmtzVAIYmc8Q2nBp/s/zRrK6YLLF79ROM3vFIqdLJCbtBZt4XBYyjjlHIpVokecd
	DIBwqZVf+x+rBC+cbR0vXx8YCq5CUgt5/8jol7K8Ff6yVYFHCnnk2itdCVVqbanV18VT0YW8vTgJL
	m7Lk2k5IMKFE4aOVP13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m14vr-00EVuG-5k; Wed, 07 Jul 2021 10:37:31 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m14Sf-00EPBk-HB
 for linux-riscv@lists.infradead.org; Wed, 07 Jul 2021 10:07:23 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-6-g79YA_UqNSq2doqSydWg2A-1; Wed, 07 Jul 2021 11:07:17 +0100
X-MC-Unique: g79YA_UqNSq2doqSydWg2A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 11:07:16 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Wed, 7 Jul 2021 11:07:16 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Palmer Dabbelt' <palmer@dabbelt.com>, "akira.tsukamoto@gmail.com"
 <akira.tsukamoto@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
Thread-Topic: [PATCH v3 1/1] riscv: __asm_copy_to-from_user: Optimize
 unaligned memory access and pipeline stall
Thread-Index: AQHXcr0E9zBxyMGA8EqGz08GSOYzlas3R1qQ
Date: Wed, 7 Jul 2021 10:07:16 +0000
Message-ID: <7f6e56390954403fb07a1c606fbc7e6d@AcuMS.aculab.com>
References: <60c1f087-1e8b-8f22-7d25-86f5f3dcee3f@gmail.com>
 <mhng-f4c7d64b-f4e9-491a-8868-bc1baa7a72a7@palmerdabbelt-glaptop>
In-Reply-To: <mhng-f4c7d64b-f4e9-491a-8868-bc1baa7a72a7@palmerdabbelt-glaptop>
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
X-CRM114-CacheID: sfid-20210707_030721_905953_C35B9EC6 
X-CRM114-Status: GOOD (  10.85  )
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

...
> > +	fixup REG_L   a4,        0(a1), 10f
> > +	fixup REG_L   a5,    SZREG(a1), 10f
> > +	fixup REG_L   a6,  2*SZREG(a1), 10f
> > +	fixup REG_L   a7,  3*SZREG(a1), 10f
> > +	fixup REG_L   t1,  4*SZREG(a1), 10f
> > +	fixup REG_L   t2,  5*SZREG(a1), 10f
> > +	fixup REG_L   t3,  6*SZREG(a1), 10f
> > +	fixup REG_L   t4,  7*SZREG(a1), 10f
> > +	fixup REG_S   a4,        0(a0), 10f
> > +	fixup REG_S   a5,    SZREG(a0), 10f
> > +	fixup REG_S   a6,  2*SZREG(a0), 10f
> > +	fixup REG_S   a7,  3*SZREG(a0), 10f
> > +	fixup REG_S   t1,  4*SZREG(a0), 10f
> > +	fixup REG_S   t2,  5*SZREG(a0), 10f
> > +	fixup REG_S   t3,  6*SZREG(a0), 10f
> > +	fixup REG_S   t4,  7*SZREG(a0), 10f
> 
> This seems like a suspiciously large unrolling factor, at least without
> a fallback.  My guess is that some workloads will want some smaller
> unrolling factors, but given that we run on these single-issue in-order
> processors it's probably best to have some big unrolling factors as well
> since they're pretty limited WRT integer bandwidth.

But a single-issue cpu is unlikely to have an 8 clock data delay.
OTOH a cpu than can do concurrent memory read and write might
not have enough 'out of order' capability to do so with the above loop.

You may want to interleave the reads and writes - starting with
two or three reads (possibly with the extra ones outside the loop).

I don't know the microarchitectures well enough (well at all)
to know the exact pitfalls.

The very simple cpu might have the same 'issue' the Nios2 has
(another MIPS clone fpga soft cpu) where there can be a pipeline
stall between a write and read.
I doubt the non-trivial riscv have that issue though.

> > +	addi	a0, a0, 8*SZREG
> > +	addi	a1, a1, 8*SZREG
> > +	bltu	a0, t0, 2b

For a dual-issue cpu you want to move the two 'addi' higher
up the loop so that they are 'free'.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
