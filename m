Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1345DCA550A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6N4HyPV7pmZbCshXDIjPC9fZUVl0kf+SwSXQrkQGGE=; b=H4+CXa5Y+ZPUzT
	WexHK0OhC+DQcSQsjw6l0A6i7tpUQQpmPpbVMPou81MRGdclaqR59DuxIfNcLq4lU27+41ylULI8n
	RDV4chkxigaaHtJZv+NXbiUke7WESfdRYlvkkflFURJXYRpDk5t46cjrmVqjj3C6bg4tNwkm27K7o
	nVjlCrO76il+2hwABnO/iSlyvZZ/eix3LVYWGlsIZLX9wMSBxkc8L2DBdFZAzv/iGqlLK0VdwEVb5
	okQbwgoWUP/2LI6y3WOyw4wnXYDubNMPWmBgstkXyLHgufE/HIfbfPAkgnEUlD28EOMk51NQA8aFC
	4g3AnCafu+lYMlS6rL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLXf-005BGX-2M;
	Wed, 13 Sep 2023 08:48:11 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLXd-005BDm-02
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 08:48:11 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-266-m12S0s3ZOouc56uUjgkHeA-1; Wed, 13 Sep 2023 09:47:52 +0100
X-MC-Unique: m12S0s3ZOouc56uUjgkHeA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 13 Sep
 2023 09:47:49 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 13 Sep 2023 09:47:49 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Charlie Jenkins' <charlie@rivosinc.com>
Subject: RE: [PATCH v4 2/5] riscv: Add checksum library
Thread-Topic: [PATCH v4 2/5] riscv: Add checksum library
Thread-Index: AQHZ5QNmAqaxDkDqBUuW+t+6iXe0brAW2+/wgAEox4CAAGmkUA==
Date: Wed, 13 Sep 2023 08:47:49 +0000
Message-ID: <b503e341f2334d6b9b902a6e621ed7c3@AcuMS.aculab.com>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
 <1818c4114b0e4144a9df21f235984840@AcuMS.aculab.com> <ZQEn+8Bi8dxNgg3g@ghost>
In-Reply-To: <ZQEn+8Bi8dxNgg3g@ghost>
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
X-CRM114-CacheID: sfid-20230913_014809_331545_998CF0F6 
X-CRM114-Status: GOOD (  38.75  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins
> Sent: 13 September 2023 04:10
> 
> On Tue, Sep 12, 2023 at 08:45:38AM +0000, David Laight wrote:
> > From: Charlie Jenkins
> > > Sent: 11 September 2023 23:57
> > >
> > > Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> > > will load from the buffer in groups of 32 bits, and when compiled for
> > > 64-bit will load in groups of 64 bits. Benchmarking by proxy compiling
> > > csum_ipv6_magic (64-bit version) for an x86 chip as well as running
> > > the riscv generated code in QEMU, discovered that summing in a
> > > tree-like structure is about 4% faster than doing 64-bit reads.
> > >
> > ...
> > > +	sum   = saddr->s6_addr32[0];
> > > +	sum  += saddr->s6_addr32[1];
> > > +	sum1  = saddr->s6_addr32[2];
> > > +	sum1 += saddr->s6_addr32[3];
> > > +
> > > +	sum2  = daddr->s6_addr32[0];
> > > +	sum2 += daddr->s6_addr32[1];
> > > +	sum3  = daddr->s6_addr32[2];
> > > +	sum3 += daddr->s6_addr32[3];
> > > +
> > > +	sum4  = csum;
> > > +	sum4 += ulen;
> > > +	sum4 += uproto;
> > > +
> > > +	sum  += sum1;
> > > +	sum2 += sum3;
> > > +
> > > +	sum += sum2;
> > > +	sum += sum4;
> >
> > Have you got gcc to compile that as-is?
> >
> > Whenever I've tried to get a 'tree add' compiled so that the
> > early adds can be executed in parallel gcc always pessimises
> > it to a linear sequence of adds.
> >
> > But I agree that adding 32bit values to a 64bit register
> > may be no slower than trying to do an 'add carry' sequence
> > that is guaranteed to only do one add/clock.
> > (And on Intel cpu from core-2 until IIRC Haswell adc took 2 clocks!)
> >
> > IIRC RISCV doesn't have a carry flag, so the adc sequence
> > is hard - probably takes two extra instructions per value.
> > Although with parallel execute it may not matter.
> > Consider:
> > 	val = buf[offset];
> > 	sum += val;
> > 	carry += sum < val;
> > 	val = buf[offset1];
> > 	sum += val;
> > 	...
> > the compare and 'carry +=' can be executed at the same time
> > as the following two instructions.
> > You do then a final sum += carry; sum += sum < carry;
> >
> > Assuming all instructions are 1 clock and any read delays
> > get filled with other instructions (by source or hardware
> > instruction re-ordering) even without parallel execute
> > that is 4 clocks for 64 bits, which is much the same as the
> > 2 clocks for 32 bits.
> >
> > Remember that all the 32bit values can summed first as
> > they won't overflow.
> >
> > 	David

> Yeah it does seem like the tree-add does just do a linear add. All three
> of them were pretty much the same on riscv so I used the version that
> did best on x86 with the knowledge that my QEMU setup does not
> accurately represent real hardware.

The problem there is that any measurement on x86 has pretty much
no relevance to what any RISCV cpu might do.
The multiple execution units and out of order execution on x86
are far different from anything any RISCV cpu is likely to have
for many years.
You might get nearer running on one of the Atom cpu - but it won't
really match.
There are too many fundamental differences between the architectures.

All you can do is to find and read the instruction timings for
a target physical cpu and look for things like:
- Whether arithmetic results are available next clock.
  (It probably is)
- How many clocks it takes for read data to be available.
  I suspect the cpu will stall if the data is needed.
  A block of sequential reads is one way to avoid the stall.
  On x86 the instruction that needs the data is just deferred
  until it is available, the following instructions execute
  (provided their input are all available).
- Clock delays for taken/not taken predicted/not predicted branches.
  
> I don't quite understand how doing the carry in the middle of each
> stage, even though it can be executed at the same time, would be faster
> than just doing a single overflow check at the end.

You need to do half as many reads and adds.

> I can just revert
> back to the non-tree add version since there is no improvement on riscv.

The 'tree' version is only likely to be faster on cpu (like x86)
that can (at least sometimes) do two memory reads in one clock
and can do two adds and two read in the same clock.
Even then, without out of order execution, it is hard to get right.

Oh, you might want to try getting the default csum_fold() to
be the faster 'arc' version rather than adding your own version.

	David

> I can also revert back to the default version that uses carry += sum < val
> as well.
> 
> - Charlie

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
