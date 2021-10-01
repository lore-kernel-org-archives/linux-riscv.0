Return-Path: <SRS0=1++v=OV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22287C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Oct 2021 08:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0F96138F
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Oct 2021 08:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC0F96138F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sF1cbDDdOLdiZNYYYwgkpc2mjHr9hF9+eB4f8BNDmpI=; b=u8i9r11q6Ps5X6
	0Hye/gaATlyhw9xaRXpmf1odmwuv0RbGVs8g5fq/Cf09tOC2QMBwi9pHLerSEb8SjXyqhn/wJGm/V
	/3hDGvng+ZlYmriV7UpST+u/z6lmT8x67jV1ihGxSfnZZpbq80W15iCeF//WHtDFWj1jZz4wj/5b6
	NISzj+GP1OuIl0iabtXRe8HQxOBU9Y7zA/N6jloMOOn+oWxFYLgCs5MvhW/AvvyT8CHZKziSSX99w
	zgqUFJ3dOMuynJc3FdfnXasD4Mjo34EnR3+UolAMEJyo4ephVG7jG5/6bbpuH0f7F8+ZWinuD8E/D
	B5Ef1FdmNRRugb4bTyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWDYm-00GydN-S1; Fri, 01 Oct 2021 08:06:24 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWDYj-00Gyb8-HH
 for linux-riscv@lists.infradead.org; Fri, 01 Oct 2021 08:06:23 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-34-W05ZMRukNYqLxn2NGHWQgw-1; Fri, 01 Oct 2021 09:06:14 +0100
X-MC-Unique: W05ZMRukNYqLxn2NGHWQgw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Fri, 1 Oct 2021 09:06:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Fri, 1 Oct 2021 09:06:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Vineet Gupta' <vgupta@kernel.org>, Matteo Croce
 <mcroce@linux.microsoft.com>, Guo Ren <guoren@kernel.org>
CC: linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
 <atish.patra@wdc.com>, "Emil Renner Berthing" <kernel@esmil.dk>, Akira
 Tsukamoto <akira.tsukamoto@gmail.com>, Drew Fustini <drew@beagleboard.org>,
 Bin Meng <bmeng.cn@gmail.com>, Christoph Hellwig <hch@lst.de>, Philipp
 Tomsich <philipp.tomsich@vrull.eu>
Subject: RE: [PATCH v5 1/3] riscv: optimized memcpy
Thread-Topic: [PATCH v5 1/3] riscv: optimized memcpy
Thread-Index: AQHXtjOD+7ayCntxxUO0SHdTnQy2G6u9yEmA
Date: Fri, 1 Oct 2021 08:06:13 +0000
Message-ID: <63ab9e73cb58404c99e271b11b2b5bf5@AcuMS.aculab.com>
References: <20210929172234.31620-1-mcroce@linux.microsoft.com>
 <20210929172234.31620-2-mcroce@linux.microsoft.com>
 <CAJF2gTRSVeUOwmaUcpMJL+jOofvX5iWLRLCfMajQcut_T409qA@mail.gmail.com>
 <CAFnufp1wHVY-yoUUDxT1mhv8HV=cmHZSwMP+8r-2CzNAYEn4DQ@mail.gmail.com>
 <a9ce9ea2-9e5d-0e56-d980-5dedd087f62d@kernel.org>
In-Reply-To: <a9ce9ea2-9e5d-0e56-d980-5dedd087f62d@kernel.org>
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
X-CRM114-CacheID: sfid-20211001_010621_904595_2E28C314 
X-CRM114-Status: GOOD (  11.16  )
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

...
> BTW off topic (but relevant to this patchset), I strongly feel that
> routines like memset/memcpy are better coded in assembly for really
> water tight instruction scheduling and ease of further optimizing (e.g.
> use of CMO.zero etc as experimented by Philipp). What is blocking you
> from optimizing the asm version ? You are leaving the fate of these
> critical routines in the hand of compiler - this can lead to performance
> shenanigans on a big gcc upgrade.

You also need to worry about the cost of short transfers.
A few cycles there could have a much bigger difference
that something that speeds up long transfers.
Short ones are likely to be fairly common.
I doubt the loop unrolling optimisation in gcc is actually
any good for loops that might be done a few times.

Fortunately the kernel doesn't get 'hit by' gcc unrolling
loops into the AVX instructions.
The setup costs for that (and I-cache footprint) are horrid.
Although I suspect it is that optimisation that 'broke'
code that used misaligned pointers on overlapping data.

It is a general problem with the 'one size fits all' memcpy().

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
