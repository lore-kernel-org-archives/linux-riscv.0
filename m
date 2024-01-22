Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE49C46CD2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 21:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oOl2vBFT0IRGjd8Yp5K5QlQeaBizBoWI042Yz9Rlms=; b=Q/3KjIPq37ARz8
	yksGRg35+RZTa7AAUABj81/HHTPfc2o2ojO1RDgOvT311DVxuKpJjMwUiMj+3Ngy5gVsMgDLPak68
	vwDooMzYWFggIo0BCExa6I9C1EFNeoluuNEXsmhWslzAjswn9P/mSL4+ei0I6A7CvfXduGWyoxT2W
	NvFTtlBF6GF9H/tZTE/tuo7lsBu7HrsWP6zylkfttWgY+ITh2MvOZkxVBf7aUmW9JVVJaLQfI/P/F
	NjDNYdHiKoz1OCmDPDuM73d3GzLklLoin2+w9TBWuqHg8wgLGenfsengziGQBISuyIbSzF1buvPRi
	oGlnrcm1yYs6qMSA95oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS23l-00EDGo-0E;
	Mon, 22 Jan 2024 21:42:25 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS23h-00EDGO-1d
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 21:42:23 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-133-d2RyxRAbOJurcsKymIa9DQ-1; Mon, 22 Jan 2024 21:42:17 +0000
X-MC-Unique: d2RyxRAbOJurcsKymIa9DQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 22 Jan
 2024 21:41:49 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 22 Jan 2024 21:41:48 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guenter Roeck' <linux@roeck-us.net>, Charlie Jenkins
	<charlie@rivosinc.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>, Xiao Wang
	<xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>, Guo Ren
	<guoren@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Thread-Topic: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Thread-Index: AQHaTVGn8AUolzpWZEe7KQadoytUPLDmCvsQgAAHpwCAAEjwsA==
Date: Mon, 22 Jan 2024 21:41:48 +0000
Message-ID: <be959a4bb660466faba5ade7976485c8@AcuMS.aculab.com>
References: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
 <20240108-optimize_checksum-v15-5-1c50de5f2167@rivosinc.com>
 <2c8e98b6-336e-4bc7-81ba-5a4d35ac868a@roeck-us.net>
 <6b0dc20f392c488a9080651a2a2cd4bd@AcuMS.aculab.com>
 <1dd253a5-9fe9-4d0a-b0cd-3775f089ca0c@roeck-us.net>
In-Reply-To: <1dd253a5-9fe9-4d0a-b0cd-3775f089ca0c@roeck-us.net>
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
X-CRM114-CacheID: sfid-20240122_134221_825360_B009695B 
X-CRM114-Status: GOOD (  27.44  )
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

From: Guenter Roeck
> Sent: 22 January 2024 17:16
> 
> On 1/22/24 08:52, David Laight wrote:
> > From: Guenter Roeck
> >> Sent: 22 January 2024 16:40
> >>
> >> Hi,
> >>
> >> On Mon, Jan 08, 2024 at 03:57:06PM -0800, Charlie Jenkins wrote:
> >>> Supplement existing checksum tests with tests for csum_ipv6_magic and
> >>> ip_fast_csum.
> >>>
> >>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >>> ---
> >>
> >> With this patch in the tree, the arm:mps2-an385 qemu emulation gets a bad hiccup.
> >>
> >> [    1.839556] Unhandled exception: IPSR = 00000006 LR = fffffff1
> >> [    1.839804] CPU: 0 PID: 164 Comm: kunit_try_catch Tainted: G                 N 6.8.0-rc1 #1
> >> [    1.839948] Hardware name: Generic DT based system
> >> [    1.840062] PC is at __csum_ipv6_magic+0x8/0xb4
> >> [    1.840408] LR is at test_csum_ipv6_magic+0x3d/0xa4
> >> [    1.840493] pc : [<21212f34>]    lr : [<21117fd5>]    psr: 0100020b
> >> [    1.840586] sp : 2180bebc  ip : 46c7f0d2  fp : 21275b38
> >> [    1.840664] r10: 21276b60  r9 : 21275b28  r8 : 21465cfc
> >> [    1.840751] r7 : 00003085  r6 : 21275b4e  r5 : 2138702c  r4 : 00000001
> >> [    1.840847] r3 : 2c000000  r2 : 1ac7f0d2  r1 : 21275b39  r0 : 21275b29
> >> [    1.840942] xPSR: 0100020b
> >>
> >> This translates to:
> >>
> >> PC is at __csum_ipv6_magic (arch/arm/lib/csumipv6.S:15)
> >> LR is at test_csum_ipv6_magic (./arch/arm/include/asm/checksum.h:60
> >> ./arch/arm/include/asm/checksum.h:163 lib/checksum_kunit.c:617)
> >>
> >> Obviously I can not say if this is a problem with qemu or a problem with
> >> the Linux kernel. Given that, and the presumably low interest in
> >> running mps2-an385 with Linux, I'll simply disable that test. Just take
> >> it as a heads up that there _may_ be a problem with this on arm
> >> nommu systems.
> >
> > Can you drop in a disassembly of __csum_ipv6_magic ?
> > Actually I think it is:
> 
> It is, as per the PC pointer above. I don't know anything about arm assembler,
> much less about its behavior with THUMB code.

Doesn't look like thumb to me (offset 8 is two 4-byte instructions) and
the code I found looks like arm to me.
(I haven't written any arm asm since before they invented thumb!)

> > ENTRY(__csum_ipv6_magic)
> > 		str	lr, [sp, #-4]!
> > 		adds	ip, r2, r3
> > 		ldmia	r1, {r1 - r3, lr}
> >
> > So the fault is (probably) a misaligned ldmia ?
> > Are they ever supported?
> >
> 
> Good question. My primary guess is that this never worked. As I said,
> this was just intended to be informational, (probably) no reason to bother.
> 
> Of course one might ask if it makes sense to even keep the arm nommu code
> in the kernel, but that is of course a different question. I do wonder though
> if anyone but me is running it.

If it is an alignment fault it isn't a 'nommu' bug.

And traditionally arm didn't support misaligned transfers (well not
in anyway any other cpu did!).
It might be that the kernel assumes that all ethernet packets are
aligned, but the test suite isn't aligning the buffer.
Which would make it a test suite bug.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
