Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43291C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 17:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED06F60FED
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 17:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED06F60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSPGFeykMeTJeIZIxh83DywozBQFBLlxz8og7fnARHQ=; b=I/F7Bmkv9Xfoh+
	/Pbgg3BuiYPghfmG+KX4xJUqRprQVTyLt8C0cgdehhkmwF3Gzgxvm8mDVSMdSDBAPkkyB49RByNU3
	6CPzBhKHP8offgzysaJ5F4HnrGeEJ0Bro6uFnjEXRleDdrOHwG/OL5eugkPchwSiDNO4C/uXljaXm
	c7MckvbLkgrNyXPmVcEvojAPMEZ+mtTll5Sc8GAFhN34LDt+KravYjwV/mz/EtbUt3ntq6RsEYBNp
	BvQ1shexZrJvWtxUQTnLdRPkie1VCogvhr1GKxiglWe0dSx64J0S8EMIoVzZpuR7+872BAFxCX+Uk
	R3ACctIRViSXmMGc+LXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mP6li-00FI25-8K; Sat, 11 Sep 2021 17:26:22 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mP6lf-00FI16-AC
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 17:26:21 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-87-4qc9EUa1M6qeRLmgOwokUA-1; Sat, 11 Sep 2021 18:26:13 +0100
X-MC-Unique: 4qc9EUa1M6qeRLmgOwokUA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Sat, 11 Sep 2021 18:26:12 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Sat, 11 Sep 2021 18:26:12 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Palmer Dabbelt' <palmer@dabbelt.com>, "mcroce@linux.microsoft.com"
 <mcroce@linux.microsoft.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Atish Patra <Atish.Patra@wdc.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
 "akira.tsukamoto@gmail.com" <akira.tsukamoto@gmail.com>,
 "drew@beagleboard.org" <drew@beagleboard.org>, "bmeng.cn@gmail.com"
 <bmeng.cn@gmail.com>, "guoren@kernel.org" <guoren@kernel.org>, "Christoph
 Hellwig" <hch@infradead.org>
Subject: RE: [PATCH] riscv: use the generic string routines
Thread-Topic: [PATCH] riscv: use the generic string routines
Thread-Index: AQHXpr/5qgNlr7pPJkaLpUnMWph5s6ufDaMA
Date: Sat, 11 Sep 2021 17:26:12 +0000
Message-ID: <241c29b27c4c4acbbf893516bfa6f5aa@AcuMS.aculab.com>
References: <CAFnufp0eVejrDJoGE900D2U5-9qi-srVEmPOc9zHC5mSH4DgLg@mail.gmail.com>
 <mhng-22e6331c-16e1-40cc-b431-4990fda46ecf@palmerdabbelt-glaptop>
In-Reply-To: <mhng-22e6331c-16e1-40cc-b431-4990fda46ecf@palmerdabbelt-glaptop>
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
X-CRM114-CacheID: sfid-20210911_102619_674619_01943674 
X-CRM114-Status: GOOD (  18.01  )
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

..
> These ended up getting rejected by Linus, so I'm going to hold off on
> this for now.  If they're really out of lib/ then I'll take the C
> routines in arch/riscv, but either way it's an issue for the next
> release.

I've been half following this.
I've not seen any comparisons between the C functions proposed
here and the riscv asm ones that had the fix for misaligned
transfers applied.

IIRC there is a comment in the asm ones that the unrolled
'read lots' - 'write lots' loop is faster than the older
(asm) read-write loop.

But I've not seen any archictural discussions at all.

A simple in-order single-issue cpu will execute the
unrolled loop faster just because it has fewer instructions.
The read-lots - write-lots almost certainly helps
avoid read-latency delaying things if multiple reads
can be pipelined.
The writes are almost certainly 'posted' and pipelined,
But a simple cpu could easily require all writes finish
before doing a read.

A super-scaler (multi-issue) cpu gives you the ability
to get the loop control instructions 'for free' with
carefully written assembler.
At which point a copy for 'life cache' data should be
limited only by the cpu's cache memory bandwidth.

If reads and writes can interleave then a loop that
alternates reads and writes (read each register
just after writing it) may mean that you always
keep the cpu-cache interface busy.
This would be especially true if the cpu can execute
both a cache read and write in the same cycle.
(Which many moderate performance cpu can.)

None of the requires out-of-order execution, just
execution to continue while a read is in progress.

I'm also guessing that any performance testing has been
done with the (relatively) cheap boards that are readily
available.

But I've also seen references in the press to much faster
riscv cpu that are definitely multi-issue and may have
some simple out-of-order execution.
Any changes ought to be tested on these faster systems.

I also recall that some of the performance measurements
were made with long buffers - they will be dominated by the
cache to DRAM (and maybe TLB lookup) timings, not the copy
loop.

For a simple cpu you ought to be able to measure the
number of cpu cycles used for a copy - and account for
all of them.
For something like x86 you can show that the copy is
being limited by the cpu-cache bandwidth.
(FWIW measurements of the inet checksum code on x86
show it runs at half the expected speed on a lot of
Intel cpu - no one ever measured it.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
