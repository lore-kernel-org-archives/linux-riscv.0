Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A931C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:59:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED8461158
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED8461158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NGDvdKHKDfX45hMoC/WDHPFMHOzecI32VNTFNicaaA0=; b=Vi6opKHE4Y7CM5CpzSMLO4qmB
	YYxTYw/bpd0e6Kn1E2frazXOuZOc9+xQglVybXVYg/CNP7mc09obv436JIjOwx/v3mgPzcoLs2aaE
	EEQl8M1q3T6LIyEtKJE3Wjzh+MUfw23csyzsjboMOUe2JxCRVPMTkgJXva8ibkHDC8iknPj/Z3Aqy
	V2s77GQKpoFEfNHYRdCflQD183BVzG6alfXmnv067M8sf55eqXYoyogVF6z3yS2USVxDrZKfrcMFn
	ySkux2SOhjH2tB4I5o8Qnplnx+KXCy280sR/v9YMjXCKSdtHk1bJNpUJB+RnBW8CWSjWqPaKWaSHs
	DhxtooPrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWhvI-00D5XA-Vc; Wed, 14 Apr 2021 15:59:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhvG-00D5WI-5d
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 15:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=z4Eh/Jj8xNXjHx7gV7iYyknJVAlPcmXcFKWa6XalOEE=; b=YoGwxZruB3iEGUK79uN0+Qi5tI
 jYrDF7EwMbmk3SUhr6lAmKhhFqyJFmisINkG/eCV5bMg4434MrhJeCbXcZotkAbSdGQwc/fgJdngC
 O035S88m9Gmm2L3RUnX6axcQjJHQ73w/86LHTVhwIspmKgXyIDk3v/DoKnrUdKR++KcAawsjWtcFb
 ZUGthZqYvHwZMczuwfvXLXdlBUXhKs3YlXP1JtKoImLxiNH6hBr6IxJufWSsRsZX7k0ucgNDZE3+K
 bXhqyq5s/C/2bHlrmkozGliMD2QJHSL6iMd4tH0yKaJesCJT2gFlEou4QSX5P+8Pk6TwYjgSDNegt
 mk0vw1Gg==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhvD-007vbl-Df
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 15:59:20 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-231-gB8-kn-7OJerCywESBUe9A-2; Wed, 14 Apr 2021 16:59:15 +0100
X-MC-Unique: gB8-kn-7OJerCywESBUe9A-2
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 16:59:12 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 16:59:12 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peter Zijlstra' <peterz@infradead.org>, Guo Ren <guoren@kernel.org>
CC: =?iso-8859-1?Q?Christoph_M=FCllner?= <christophm30@gmail.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Jonas Bonn <jonas@southpole.se>, "Stefan
 Kristiansson" <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>
Subject: RE: [RFC][PATCH] locking: Generic ticket-lock
Thread-Topic: [RFC][PATCH] locking: Generic ticket-lock
Thread-Index: AQHXMS3QDy7Ki/2OMUKsa3pFr4OLI6q0KzPA
Date: Wed, 14 Apr 2021 15:59:12 +0000
Message-ID: <9b3bbe8f20e14a7b91dc85737ecb99c0@AcuMS.aculab.com>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <CAJF2gTRsQQ=RunxK6R9MfK70dULt=RJOXXGCOT9oDPEsBgvKtQ@mail.gmail.com>
 <YHbmXXvuG442ZDfN@hirez.programming.kicks-ass.net>
In-Reply-To: <YHbmXXvuG442ZDfN@hirez.programming.kicks-ass.net>
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
X-CRM114-CacheID: sfid-20210414_085919_757902_C1F0FC6D 
X-CRM114-Status: UNSURE (   9.59  )
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

From: Peter Zijlstra
> Sent: 14 April 2021 13:56
> 
> > I've tested it on csky SMP*4 hw (860) & riscv SMP*4 hw (c910) and it's okay.
> 
> W00t :-)
> 
> > Hope you can keep
> > typedef struct {
> >         union {
> >                 atomic_t lock;
> >                 struct __raw_tickets {
> > #ifdef __BIG_ENDIAN
> >                         u16 next;
> >                         u16 owner;
> > #else
> >                         u16 owner;
> >                         u16 next;
> > #endif
> >                 } tickets;
> >         };
> > } arch_spinlock_t;
> >
> > Using owner & next is much more readable.
> 
> That almost doubles the line-count of the thing ;-)

And relies on the compiler not ever spilling it to stack.
Which it is much more likely to do that for the version
that uses shifts.

Have you checked what happens with -O0 ?
I don't think that is banned by the build system.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
