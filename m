Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A297C48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 12:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFD661287
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 12:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BFD661287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7Yi25wPOmtc9JMeiM8XcGasGacsMRjnoNUjC/fKcSE=; b=uGmChNt/Rtli4L
	2LdTGev4t9hI2qvxfLIbj/uVrN4VeiYBzuyBwSIYVeKFKQprwIrsiBFgPGcjxtXQc23/lVWorMMkN
	QfIQSV9Mm4bL9eyRt9MU+EmYRAKJYtAvmr2nu/xpMALA08XjbuL8CThCwI3JnOs2LSWPXmnzoKVvI
	PwcFeTtBfXf+zObT6rfZeMDzQycCEp/3lIVvY1c92BWuuJehFEpwfGvgomAfjvetN7kkFcD2H7+kO
	0tjgDFd025NfT38hLx4dJYqJnFyczAtfxouxaCGr+MLcj+DLpz2X5RTG1luAHVCWokEsUdiUyck7L
	gV/e3mxV/Q9XdM3v02og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls2Zv-008Rfd-O8; Sat, 12 Jun 2021 12:17:31 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls2Zt-008Rex-As
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 12:17:31 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-13-dZBTIf2VMkmyrAJF_oOoUw-1; Sat, 12 Jun 2021 13:17:23 +0100
X-MC-Unique: dZBTIf2VMkmyrAJF_oOoUw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sat, 12 Jun
 2021 13:17:22 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Sat, 12 Jun 2021 13:17:22 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Palmer Dabbelt' <palmer@dabbelt.com>, "akira.tsukamoto@gmail.com"
 <akira.tsukamoto@gmail.com>
CC: "akira.tsukamoto@gmail.com" <akira.tsukamoto@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gary@garyguo.net" <gary@garyguo.net>, "nickhu@andestech.com"
 <nickhu@andestech.com>, "nylon7@andestech.com" <nylon7@andestech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] riscv: prevent pipeline stall in
 __asm_to/copy_from_user
Thread-Topic: [PATCH 1/1] riscv: prevent pipeline stall in
 __asm_to/copy_from_user
Thread-Index: AQHXWSgp7oRD1A6yb0KBcJjcvPCgrasJ/LbggAXAiYCAAJBmMA==
Date: Sat, 12 Jun 2021 12:17:22 +0000
Message-ID: <de82d455e12e44898a6f14a3885d9f0c@AcuMS.aculab.com>
References: <67dab8dc517f4add8b0c29074a6b3f06@AcuMS.aculab.com>
 <mhng-e4f1484c-052f-4981-83f9-3884ee4d5ea0@palmerdabbelt-glaptop>
In-Reply-To: <mhng-e4f1484c-052f-4981-83f9-3884ee4d5ea0@palmerdabbelt-glaptop>
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
X-CRM114-CacheID: sfid-20210612_051729_675753_6CA7A860 
X-CRM114-Status: GOOD (  21.09  )
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
> Sent: 12 June 2021 05:05
...
> > I don't know the architecture, but unless there is a stunning
> > pipeline delay for memory reads a simple interleaved copy
> > may be fast enough.
> > So something like:
> > 	a = src[0];
> > 	do {
> > 		b = src[1];
> > 		src += 2;
> > 		dst[0] = a;
> > 		dst += 2;
> > 		a = src[0];
> > 		dst[-1] = b;
> > 	} while (src != src_end);
> > 	dst[0] = a;
> >
> > It is probably worth doing benchmarks of the copy loop
> > in userspace.
> 
> I also don't know this microarchitecture, but this seems like a pretty
> wacky load-use delay.

It is quite sane really.

While many cpu can use the result of the ALU in the next clock
(there is typically special logic to bypass the write to the
register file) this isn't always true for memory (cache) reads.
It may even be that the read itself takes more than one cycle
(probably pipelined so they can happen every cycle).

So a simple '*dest = *src' copy loop suffers the 'memory read'
penalty ever iteration.
At out-of-order execution unit that uses register renames
(like most x86) will just defer the writes until the data
is available - so isn't impacted.

Interleaving the reads and writes means you issue a read
while waiting for the value from the previous read to
get to the register file - and be available for the
write instruction.

Moving the 'src/dst += 2' into the loop gives a reasonable
chance that they are executed in parallel with a memory
access (on in-order superscaler cpu) rather than bunching
them up at the end where the start adding clocks.

If your cpu can only do one memory read or one memory write
per clock then you only need it to execute two instructions
per clock for the loop above to run at maximum speed.
Even with a 'read latency' of two clocks.
(Especially since riscv has 'mips like' 'compare and branch'
instructions that probably execute in 1 clock when predicted
taken.)

If the cpu can do a read and a write in one clock then the
loop may still run at the maximum speed.
For this to happen you do need he read data to be available
next clock and to run load, store, add and compare instructions
in a single clock.
Without that much parallelism it might be necessary to add
an extra read/write interleave (an maybe a 4th to avoid a
divide by three).

The 'elephant in the room' is a potential additional stall
on reads if the previous cycle is a write to the same cache area.
For instance the nios2 (a soft cpu for altera fpga) can do
back to back reads or back to back writes, but since the reads
are done speculatively (regardless of the opcode!) they have to
be deferred when a write is using the memory block.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
