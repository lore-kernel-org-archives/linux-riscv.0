Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E27C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YZz0US3nMkFHWz7Ubg5i9Kzk+VB7KDLJvbC1jG2Oo8=; b=4ADKbfLHCm5t5/
	XlVcyWHC1sNFFOoJY7r1CEfR+RhsqEEjwOuJUso5YeGuYhJU3ECysXNgjxkqk3c5EYEyPMp+RZliA
	CQVv3cSt04CFGfXA75DPe6+pPmpx0z4Wx1B1qT53vqVTmMOb6bBIOaC5hr2qSvFShHaPBSyYBlZw/
	u1nYByJpdlCBq/pNx0lO/Nc5YpK039DlUm3Q/TBkv+chkgheSO9CTzWvKizcKmUBtoNZ9ESdHZ0IC
	rDqWrOrED7Aiet1/F/gpXBbfsy5vDtnYX1IdCsDieqMKhDM4yqz30CzKrYYRVGU+0ByVAvQb0+Yyc
	ENJkhXDaRTtZ7ed8AGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEuVz-008A1n-0k;
	Sun, 17 Dec 2023 17:01:19 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEuVw-008A1A-1d
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 17:01:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-91-vRzNanjRPfeqkSuhywGmvQ-1; Sun, 17 Dec 2023 17:01:07 +0000
X-MC-Unique: vRzNanjRPfeqkSuhywGmvQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 17 Dec
 2023 17:00:48 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 17 Dec 2023 17:00:48 +0000
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
Thread-Index: AQHaLduBo9lhsHug1EOTPi9OJpSM+LCttqAA
Date: Sun, 17 Dec 2023 17:00:48 +0000
Message-ID: <86d3947bce1f49c395224998e7d65dc2@AcuMS.aculab.com>
References: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
In-Reply-To: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
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
X-CRM114-CacheID: sfid-20231217_090116_824087_3E67624B 
X-CRM114-Status: GOOD (  10.24  )
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
> Sent: 13 December 2023 15:46
> 
> The current non-ZBB implementation of 'strlen' function iterates the
> memory bytewise, looking for a zero byte. It could be optimized to use
> the wordwise iteration instead, so we will process 4/8 bytes of memory
> at a time.
...
> 1. If the address is unaligned, iterate SZREG - (address % SZREG) bytes
> to align it.

An alternative is to mask the address and 'or' in non-zero bytes
into the first word - might be faster.

...
> Here you can find the benchmarking results for the VisionFive2 board
> comparing the old and new implementations of the strlen function.
> 
> Size: 1 (+-0), mean_old: 673, mean_new: 666
> Size: 2 (+-0), mean_old: 672, mean_new: 676
> Size: 4 (+-0), mean_old: 685, mean_new: 659
> Size: 8 (+-0), mean_old: 682, mean_new: 673
> Size: 16 (+-0), mean_old: 718, mean_new: 694
...

Is that 32bit or 64bit?
The word-at-a-time strlen() is typically not worth it for 32bit.

I'd also guess that pretty much all the calls in-kernel are short.
You might try counting as: histogram[ilog2(strlen_result)]++
and seeing what it shows for some workload.
I bet you (a beer if I see you!) that you won't see many over 1k.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
