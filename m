Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F567C2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 21:30:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4835260D07
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 21:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4835260D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94T3oYsz0OeGE5hOal0V9kX13Wz0elcEfHUa+HqFHwA=; b=RSgBJ1DmRseJkI
	9SuZawtOjWvcTF7XD4miHOxQjsw0CuPxmvOorMKu4q1xLW+CL5nnANujx+nqox9uNIuDdlPOlqo6X
	ISHm8j5an9GIyu+hbMdYdkYhj3EDayrvN8afxaqDZBSDRoqmYZsxsGsBXHtDZWgvZ/zyDthmj0N6i
	qpizmMc4APaJVbh1L90iHMbTck+uwi/+45wZbdjtrkw+FgJmCkoqHPFirjfIHj7psVcw7kA8pYYXP
	hh8ADvrxHbY1MS3jkFPdKO5vw7ZFLWncpSDHDf1FIViYYRVSbiwuBC2EZRFPDS5aVIdU7fMcYQtOh
	a6fLpZyeAz1PXGujXXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltzah-00BojO-Km; Thu, 17 Jun 2021 21:30:23 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltzaY-00BohZ-Kr
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 21:30:16 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-228-Sn8vyFVWOEeBXSXssr6CKA-1; Thu, 17 Jun 2021 22:30:07 +0100
X-MC-Unique: Sn8vyFVWOEeBXSXssr6CKA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 17 Jun
 2021 22:30:06 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Thu, 17 Jun 2021 22:30:06 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matteo Croce' <mcroce@linux.microsoft.com>, Guo Ren <guoren@kernel.org>
CC: linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, Emil
 Renner Berthing <kernel@esmil.dk>, "Akira Tsukamoto"
 <akira.tsukamoto@gmail.com>, Drew Fustini <drew@beagleboard.org>, Bin Meng
 <bmeng.cn@gmail.com>
Subject: RE: [PATCH 1/3] riscv: optimized memcpy
Thread-Topic: [PATCH 1/3] riscv: optimized memcpy
Thread-Index: AQHXYuC4XkdMIImxVUmoQbZ37iIZIqsYtSAg
Date: Thu, 17 Jun 2021 21:30:06 +0000
Message-ID: <f9b78350d9504e889813fc47df41f3fe@AcuMS.aculab.com>
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <CAJF2gTTreOvQYYXHBYxznB9+vMaASKg8vwA5mkqVo1T6=eVhzw@mail.gmail.com>
 <CAFnufp1OHdRd-tbB+Hi0UnXARtxGPdkK6MJktnaNCNt65d3Oew@mail.gmail.com>
In-Reply-To: <CAFnufp1OHdRd-tbB+Hi0UnXARtxGPdkK6MJktnaNCNt65d3Oew@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210617_143014_982588_CF8862D0 
X-CRM114-Status: GOOD (  20.06  )
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

From: Matteo Croce
> Sent: 16 June 2021 19:52
> To: Guo Ren <guoren@kernel.org>
> 
> On Wed, Jun 16, 2021 at 1:46 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Matteo,
> >
> > Have you tried Glibc generic implementation code?
> > ref: https://lore.kernel.org/linux-arch/20190629053641.3iBfk9-
> I_D29cDp9yJnIdIg7oMtHNZlDmhLQPTumhEc@z/#t
> >
> > If Glibc codes have the same performance in your hardware, then you
> > could give a generic implementation first.

Isn't that a byte copy loop - the performance of that ought to be terrible.
...

> I had a look, it seems that it's a C unrolled version with the
> 'register' keyword.
> The same one was already merged in nios2:
> https://elixir.bootlin.com/linux/latest/source/arch/nios2/lib/memcpy.c#L68

I know a lot about the nios2 instruction timings.
(I've looked at code execution in the fpga's intel 'logic analiser.)
It is a very simple 4-clock pipeline cpu with a 2-clock delay
before a value read from 'tightly coupled memory' (aka cache)
can be used in another instruction.
There is also a subtle pipeline stall if a read follows a write
to the same memory block because the write is executed one
clock later - and would collide with the read.
Since it only ever executes one instruction per clock loop
unrolling does help - since you never get the loop control 'for free'.
OTOH you don't need to use that many registers.
But an unrolled loop should approach 2 bytes/clock (32bit cpu).

> I copied _wordcopy_fwd_aligned() from Glibc, and I have a very similar
> result of the other versions:
> 
> [  563.359126] Strings selftest: memcpy(src+7, dst+7): 257 Mb/s

What clock speed is that running at?
It seems very slow for a 64bit cpu (that isn't an fpga soft-cpu).

While the small riscv cpu might be similar to the nios2 (and mips
for that matter), there are also bigger/faster cpu.
I'm sure these can execute multiple instructions/clock
and possible even read and write at the same time.
Unless they also support significant instruction re-ordering
the trivial copy loops are going to be slow on such cpu.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
