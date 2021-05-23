Return-Path: <SRS0=hCbr=KS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C6CC47080
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 17:13:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA796610A8
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 17:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA796610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XF88mQjl6im8tckecz31TYXbX2nCKMBS/eVt8X629Sc=; b=C24lOL/K6Bk5mIesqGjn0ey3V9
	FRoMhqxhqLVgPMutfwNnpasMVPAr74Xx5E3hL3iuSbq65hwPqkbgDP5pqyo31xvazmWtnimVfXqaK
	PiXvATWtS4muRrRePwJF4WEAuS8AGGA76EGYHhcFT6QwOV/3iz4jao4NKeW9M2QFBjcDNiFY+HR5f
	GKLOKtIO0x5bOdhMT60pUvx2ZViwXOo/WuaVOPuWar80Q/mtDQWsrQIER8Y9DHhBIbYPiGSFb8WSs
	LpADdaulJTs6DArjPdG7go6NRahb/B4+dGAIaXcWGqmxnd2ia0QOwMZIP3aHf/41U8CZWYOMTK2h3
	9j63eulQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkrec-004eu3-G8; Sun, 23 May 2021 17:12:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkrea-004etp-6A
 for linux-riscv@desiato.infradead.org; Sun, 23 May 2021 17:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=0Ug6Y6AyF3WIjCH203nWl5Hz6evAm3Nu934idoq11Ak=; b=anffOp0aDgbcoX9IWNmELYFa40
 OY9Xw9iZBDieuaGmV6ZdniNnqniTCyLwbAVyYRA78sfBpxl2hsPvHWZ4LkMq0w9UTnj/tUW49ANbt
 iKdstN2cyvNQmlyJaSHD0Li8GDxfa/X2gRmbFjjn8yb9zEC1cL48KgdM3Mo4KFcty2xRwoRXbvZhq
 KKTWVlnGxILp3GjXaBBUb9LiuYBTQtMPfZS3Ln1J9Suze57JhAHQKYlfWNUEJhDTXlciODY1Z9XD5
 D1okTpevKHXJ027c+rnAX6FfEg7tYjpEBiIwtRaZXaJWyEWw6jWEZaBh07SraJvifs4e2rw769Qk9
 oJ1zyPQA==;
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkreW-000Vma-4B
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 17:12:37 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-6-cLEc0GmiMieukhPjIpklkg-1; Sun, 23 May 2021 18:12:26 +0100
X-MC-Unique: cLEc0GmiMieukhPjIpklkg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sun, 23 May 2021 18:12:24 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sun, 23 May 2021 18:12:24 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Palmer Dabbelt' <palmer@dabbelt.com>, "gary@garyguo.net"
 <gary@garyguo.net>
CC: Paul Walmsley <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "nickhu@andestech.com" <nickhu@andestech.com>,
 "nylon7@andestech.com" <nylon7@andestech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: fix memmove and optimise memcpy when misalign
Thread-Topic: [PATCH] riscv: fix memmove and optimise memcpy when misalign
Thread-Index: AQHXT3WL0lTofUR6TU66MVYMSFr0J6rxS6gA
Date: Sun, 23 May 2021 17:12:23 +0000
Message-ID: <17637b10e71b41b89126cbb1b2fa61cf@AcuMS.aculab.com>
References: <20210522232256.00003f08@garyguo.net>
 <mhng-fdda10f7-fc83-4654-a0b2-e9c86b92c37e@palmerdabbelt-glaptop>
In-Reply-To: <mhng-fdda10f7-fc83-4654-a0b2-e9c86b92c37e@palmerdabbelt-glaptop>
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
X-CRM114-CacheID: sfid-20210523_101236_458212_478F9BC0 
X-CRM114-Status: GOOD (  11.26  )
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
> Sent: 23 May 2021 02:47
...
> IMO the right way to go here is to just move to C-based string routines,
> at least until we get to the point where we're seriously optimizing for
> specific processors.  We went with the C-based string rountines in glibc
> as part of the upstreaming process and found only some small performance
> differences when compared to the hand-written assembly, and they're way
> easier to maintain.
> 
> IIRC Linux only has trivial C string routines in lib, I think the best
> way to go about that would be to higher performance versions in there.
> That will allow other ports to use them.

I certainly wonder how much benefit these massively unrolled
loops have on modern superscaler processors - especially those
with any form of 'out of order' execution.

It is often easy to write assembler where all the loop
control instructions happen in parallel with the memory
accesses - which cannot be avoided.
Loop unrolling is so 1970s.

Sometimes you need to unroll once.
And maybe interleave the loads and stores.
But after that you can just be trashing the i-cache.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
