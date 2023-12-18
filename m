Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE848C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPE44bvAxCnt6MvavZCXuiIHlewRGGT08CihSpjglDk=; b=dNv6MR5ct1SjDb
	PPbTMXCxqz+vEWvjL/wcZcRrQsemzTxBgK4VzSiLntLLux4CZgenEJBVq9ZzMZVgTeNa6N3HETxi+
	1eV6rF/xBcBnkQCFuE15waHWbt4GW88edxL1iSlhPk8vPdxgggf0T+7l8MimPaauqyU0NWswgvfZk
	do8ZshnvNIber6yXh2/0SlNYUQD9WvfJE4z0Ws2wzLwizAA0+pYFVZa3X8XsCYIQMabxOS0rzpgZv
	7JQ87YSfnAnWj6xi5buLffFvC8ncMw4d3IOFaXAmltMgBpEH7pibxg/XN2TT0MuN49VOqOTpPgHhE
	29J3FQSBj2sPRCmf7jjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFAbv-009mhc-2d;
	Mon, 18 Dec 2023 10:12:31 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFAbs-009mgn-1Z
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:12:30 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-52-2lOzyjfMNFygAJUXwze_iw-1; Mon, 18 Dec 2023 10:12:22 +0000
X-MC-Unique: 2lOzyjfMNFygAJUXwze_iw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 18 Dec
 2023 10:12:00 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 18 Dec 2023 10:12:00 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ivan Orlov' <ivan.orlov0322@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "samuel@sholland.org"
	<samuel@sholland.org>, "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
Subject: RE: [PATCH] riscv: lib: Optimize 'strlen' function
Thread-Topic: [PATCH] riscv: lib: Optimize 'strlen' function
Thread-Index: AQHaLduBo9lhsHug1EOTPi9OJpSM+LCttqAAgACUUYCAAH5N8IAADeeAgAABdOA=
Date: Mon, 18 Dec 2023 10:12:00 +0000
Message-ID: <9b0c5afd66454c39892898dc95e7302c@AcuMS.aculab.com>
References: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
 <86d3947bce1f49c395224998e7d65dc2@AcuMS.aculab.com>
 <de80b4c7-1ffb-478e-9117-9d5b829470bd@gmail.com>
 <bd9159806a2e4fd188a78515b58ec51e@AcuMS.aculab.com>
 <f12ef9ea-14fe-491a-890b-a645bb4827cb@gmail.com>
In-Reply-To: <f12ef9ea-14fe-491a-890b-a645bb4827cb@gmail.com>
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
X-CRM114-CacheID: sfid-20231218_021228_882625_FC76BE26 
X-CRM114-Status: GOOD (  26.29  )
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

From: Ivan Orlov 
> Sent: 18 December 2023 10:03
> 
> On 12/18/23 09:20, David Laight wrote:
> > From: Ivan Orlov
> >> Sent: 18 December 2023 01:42
> >>
> >> On 12/17/23 17:00, David Laight wrote:
> >>> I'd also guess that pretty much all the calls in-kernel are short.
> >>> You might try counting as: histogram[ilog2(strlen_result)]++
> >>> and seeing what it shows for some workload.
> >>> I bet you (a beer if I see you!) that you won't see many over 1k.
> >>
> >> Hi David,
> >>
> >> Here is the statistics for strlen result:
> >>
> >> [  223.169575] Calls count for 2^0: 6150
> >> [  223.173293] Calls count for 2^1: 184852
> >> [  223.177142] Calls count for 2^2: 313896
> >> [  223.180990] Calls count for 2^3: 185844
> >> [  223.184881] Calls count for 2^4: 87868
> >> [  223.188660] Calls count for 2^5: 9916
> >> [  223.192368] Calls count for 2^6: 1865
> >> [  223.196062] Calls count for 2^7: 0
> >> [  223.199483] Calls count for 2^8: 0
> >> [  223.202952] Calls count for 2^9: 0
> >> ...
> >>
> >> Looks like I've just lost a beer :)
> >>
> >> Considering this statistics, I'd say implementing the word-oriented
> >> strlen is an overcomplication - we wouldn't get any performance gain and
> >> it just doesn't worth it.
> >
> > And the 32bit version is about half the speed of the 64bit one.
> >
> > Of course, the fast way to do strlen is add a custom instruction!
> >
> >> I simplified your code a little bit, it looks like the alignment there
> >> is unnecessary: QEMU test shows the same performance independently from
> >> alignment. Tests on the board gave the same result (perhaps because the
> >> CPU on the board has 2 DDR channels?)
> >
> > The alignment is there because it can overread the string end
> > by one byte - and that mustn't cross a page boundary.
> > So you either have to mark the second load as 'may fault return
> > zero' or just not do it.
> >
> > If the data isn't in cache the cache load will dominate.
> > The DDR channels only affect cache load times.
> > Get a TLB miss and add a few thousand more clocks!
> >
> 
> Ah, right, sounds reasonable...
> 
> Overall, I believe your solution is better and it would be more fair if
> you send it as a patch :) Here is benchmark results for your version vs
> the original (the old) one on the Starfive VisionFive2 RISC-V board:

You might want to try reading 4 bytes before checking any.
It might be quicker on your cpu.
It is hard guessing what is best across multiple implementation.
(For testing I'd not worry about falling off the page.)

I'll let you do the patch, I don't even have a toolchain, never mind
anything to test it on.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
