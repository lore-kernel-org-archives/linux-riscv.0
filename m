Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD747C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 16:28:10 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2B386157F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 16:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2B386157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Kn1wjuzOeoHZujWXa61krFfjr3tPAPvXGMKbpHHemE=; b=MnWim9vQPrDmg0
	Symf3idcRyxHlUQNzohEFiOBS491PhI+a+MhajXset6T/mQDnkbboCezXpPFRNomvI7Vd+Jd/DoaT
	PXN7TGhTNfoelg4XaFBjdRfT8WZZoB5O4u87ZCbWc2ke13c/OxPcYkQTo/JBYep7wWAEKUuBd7ubt
	JXLlFzMPtmU70aMAOVQNQSNBjb9OSBBrqloQ+C0aYmgGtthj3iJrUesvtyvbgixrFsJEnKJR9NeSL
	on/mDc0o1COjkqTiG5bqkgU1JPYB3op1sjS3ueMl6tFJLMiWgHAl1CeUj/oskGs2tVbciZdK8Z3ld
	dIDCcMl5G8N9xnAhFrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBtt-001LVQ-4s; Tue, 15 Jun 2021 16:26:53 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9kT-000Ssc-8K
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 14:09:03 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-10-0BSCW0PNMeiUs_3ZDkVtBw-1; Tue, 15 Jun 2021 15:08:28 +0100
X-MC-Unique: 0BSCW0PNMeiUs_3ZDkVtBw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 15 Jun
 2021 15:08:27 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 15 Jun 2021 15:08:27 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bin Meng' <bmeng.cn@gmail.com>, Gary Guo <gary@garyguo.net>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "nickhu@andestech.com" <nickhu@andestech.com>, "nylon7@andestech.com"
 <nylon7@andestech.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: fix memmove and optimise memcpy when misalign
Thread-Topic: [PATCH] riscv: fix memmove and optimise memcpy when misalign
Thread-Index: AQHXT3WL0lTofUR6TU66MVYMSFr0J6rxS6gAgCPtaRCAAANAsA==
Date: Tue, 15 Jun 2021 14:08:27 +0000
Message-ID: <44e4e70491164ef5b777d06f48b6684f@AcuMS.aculab.com>
References: <20210522232256.00003f08@garyguo.net>
 <mhng-fdda10f7-fc83-4654-a0b2-e9c86b92c37e@palmerdabbelt-glaptop>
 <17637b10e71b41b89126cbb1b2fa61cf@AcuMS.aculab.com>
 <20210525153431.0000508d@garyguo.net>
 <CAEUhbmXvYdVSsY3oH=XdyT2fOC1X9=-Rh0P1Q5TP1DcmzFfRrQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXvYdVSsY3oH=XdyT2fOC1X9=-Rh0P1Q5TP1DcmzFfRrQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210615_070901_606847_58044EB8 
X-CRM114-Status: GOOD (  16.65  )
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

From: Bin Meng
> Sent: 15 June 2021 14:40
...
> > I prefer C versions as well, and actually before commit 04091d6 we are
> > indeed using the generic C version. The issue is that 04091d6
> > introduces an assembly version that's very broken. It does not offer
> > and performance improvement to the C version, and breaks all processors
> > without hardware misalignment support

There may need to be a few C implementations for different cpu
instruction sets.
While the compiler might manage to DTRT (or the wrong thing given
the right source) using a loop that matches the instruction set
is a good idea.

For instance, x86 can do *(reg_1 + reg_2 * (1|2|4|8) + constant)
so you can increment reg_2 and use it for both buffers while
still unrolling enough to hit memory bandwidth.

With only *(reg_1 + constant) you need to increment both the
source and destination addresses.

OTOH you can save an instruction on x86 by adding to 'reg_2'
until it becomes zero (so you don't need add, cmp and jmp).

But a mips-like instruction set (includes riscv and nios2)
has 'compare and branch' so you only ever need one instruction
at the end of the loop.

Having to handle misaligned copies is another distinct issue.
For some 32bit cpu byte copies may be as fast as any shift
and mask code.

> > (yes, firmware is expected to
> > trap and handle these, but they are painfully slow).

Yes, to the point where the system should just panic and
force you to fix the code.

When I were a lad we forced everyone to fix there code
so it would run on sparc.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
