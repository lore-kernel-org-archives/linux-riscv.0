Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51485C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:39:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E516128B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E516128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0GYUmiviVH4+nPf8y88AV2J5AwHgM5wM4oJgubOoT8=; b=02oCtdlJT/SJaR
	CSal/RXB5MtCrlvsMNHw37BXZDLEnpD+x04/IqYkf8QahBCH+Ey42bW2AUqq/wjSEEN3YclBCjl/u
	50vICssZT4rqNyO3KIJZCEuozuXuABrhWX7sb5ou0sVffA9GcLCuftb6qNW25OV8eLQOSo0tG5cS1
	3t84z9L6n0rtPOVp6dxLyJk/cIEIagqkSo8Y7ZS5O+woDgg/3o2rOJfRBlQ0QFKTUl+pDd8AQJ+p8
	bxxiq1LNXxfBzHQAkgGP+dNEPKzpxtTdD0BGJS97jFI5aH8p6TZwdrrq6XrFz17iDeGS4VyP0eXfi
	99dQ0wB21lxle0vBUd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltEuC-002W6g-BC; Tue, 15 Jun 2021 19:39:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Bt-000ByJ-23
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=yQTCffkYuElbokhzN4bNs8HTTgjmJTVoXRoNt6Kz/88=; b=Y53DzctH/6vAlI683a8K+JLw6/
 xkbv+LJ1Sj9PPYLQEb5ZNGhBn5YqlEL6QybAy7oQR7sAOAhxA6sPn2YcnPg7xF0QTcMi7tneX6ryp
 09x0+xzN2EZiGsPRdoxH2epY8RcBHUOPKTC4lyorlK9iExhvvxSoLXIS5F5H1mwoQ9YMWqvdz4Zfk
 LRCDKobsmRppuyCA4gLF9cEAuN5Ecv8XrZgsHcfDgQX66AnHis1M0UqxJJaNGBQlp7w0NsAhbIZBP
 WMaWxFy27/o5zMWbeIu3tGkcUI2l7+/DBwaxen/23Odx8gtsJ78y97WDJaLE3pO1EHGTcsXGMQy0h
 9Kz/5q8g==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt8xb-007up8-5A
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 13:18:39 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-3-4Fuj9aaaNA-wL3sLBMdlZw-1; Tue, 15 Jun 2021 14:18:34 +0100
X-MC-Unique: 4Fuj9aaaNA-wL3sLBMdlZw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 15 Jun
 2021 14:18:34 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 15 Jun 2021 14:18:34 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bin Meng' <bmeng.cn@gmail.com>
CC: Matteo Croce <mcroce@linux.microsoft.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 "Drew Fustini" <drew@beagleboard.org>
Subject: RE: [PATCH 1/3] riscv: optimized memcpy
Thread-Topic: [PATCH 1/3] riscv: optimized memcpy
Thread-Index: AQHXYY/3XkdMIImxVUmoQbZ37iIZIqsUw3iggAA3zwCAABG+cA==
Date: Tue, 15 Jun 2021 13:18:33 +0000
Message-ID: <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
In-Reply-To: <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210615_141838_071988_FD296A0C 
X-CRM114-Status: GOOD (  13.17  )
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
> Sent: 15 June 2021 14:09
> 
> On Tue, Jun 15, 2021 at 4:57 PM David Laight <David.Laight@aculab.com> wrote:
> >
...
> > I'm surprised that the C loop:
> >
> > > +             for (; count >= bytes_long; count -= bytes_long)
> > > +                     *d.ulong++ = *s.ulong++;
> >
> > ends up being faster than the ASM 'read lots' - 'write lots' loop.
> 
> I believe that's because the assembly version has some unaligned
> access cases, which end up being trap-n-emulated in the OpenSBI
> firmware, and that is a big overhead.

Ah, that would make sense since the asm user copy code
was broken for misaligned copies.
I suspect memcpy() was broken the same way.

I'm surprised IP_NET_ALIGN isn't set to 2 to try to
avoid all these misaligned copies in the network stack.
Although avoiding 8n+4 aligned data is rather harder.

Misaligned copies are just best avoided - really even on x86.
The 'real fun' is when the access crosses TLB boundaries.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
