Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56DAC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 08:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B6361003
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 08:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B6361003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbTZuLP5h6TvDc5ZxtRxSecwIQHWXkC5uP1aq5wkgzk=; b=R/KWcwR/i6E8sS
	B7WxAMZaLHZt23PE4JEU2cmg9LYOMn+ml8qBGbIRaDyig8pw+2+YhsFSAl6rsbkT5ksw4cNyBWnlH
	Oh4byqFgnNvvmMk6P93gotTO0r7um9L0w4VwV2V6QMguKkJicq9zPt3t+5PtAs+bm0UDJADpcckGW
	F98t0yeWyfMwPD0MF6cQc499Vaqp7bCIjcS8YM4LzkuXORyMRpZDiaXOSG0+zgY10RaVPV8orHMj7
	Stex1mTWs90TYdzjRNp9iMCwTD1iNGz1ZBtJIShFcbeC50JqZwMZXaP+0KnUAD+hkMr72F+Ru1Scp
	KfR5b07B7D0YhNNdZcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQrO-005N24-MO; Wed, 16 Jun 2021 08:25:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQrN-005N1g-A5
 for linux-riscv@bombadil.infradead.org; Wed, 16 Jun 2021 08:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=9AnmbmNaXNQt9FzoFcF++EXig0Je92MVae7ZQRHBwZU=; b=NZMYBy8hYcsWCFhssMr8aoavPu
 ls2b7NEOPOIEb6dKT5Wy3+HPevvUdAMPUnlpv07MypYPSKfJuMG9WdGALfMaP9fTN50iQvR6gjHkI
 Rk+Sdh3NbMhPXSAG1JxIvghMPFpVXExW7GIFdWj8YVuogS0okwdHa6jkovkqSFJinAIIbu77bzpBF
 ecYox1JEofMlaKFr37JWm+b2Hzzbqh0XFAakbOZdChLRn5f8Yltrlx4AmLNR78T+iqX1NIzBP8aJA
 T8861FtxEoZU2DSx6t1lVy5ESsTRhBxMcVWYRGTsFkwko+C/vtswU1nL43T0aob6KEiWfoJZ6RWK7
 vnGL3JPA==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQr5-007nle-7d
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 08:25:07 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-87-_scVxX6UNMWzThH1QiY4nA-1; Wed, 16 Jun 2021 09:24:44 +0100
X-MC-Unique: _scVxX6UNMWzThH1QiY4nA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 16 Jun
 2021 09:24:43 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Wed, 16 Jun 2021 09:24:43 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matteo Croce' <mcroce@linux.microsoft.com>, Bin Meng <bmeng.cn@gmail.com>
CC: Emil Renner Berthing <kernel@esmil.dk>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, Akira Tsukamoto
 <akira.tsukamoto@gmail.com>, Drew Fustini <drew@beagleboard.org>
Subject: RE: [PATCH 1/3] riscv: optimized memcpy
Thread-Topic: [PATCH 1/3] riscv: optimized memcpy
Thread-Index: AQHXYlOHXkdMIImxVUmoQbZ37iIZIqsWSUKQ
Date: Wed, 16 Jun 2021 08:24:43 +0000
Message-ID: <db7a011867a742528beb6ec17b692842@AcuMS.aculab.com>
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
 <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
 <CAEUhbmU0cPkawmFfDd_sPQnc9V-cfYd32BCQo4Cis3uBKZDpXw@mail.gmail.com>
 <CANBLGcxi2mEA5MnV-RL2zFpB2T+OytiHyOLKjOrMXgmAh=fHAw@mail.gmail.com>
 <CAEUhbmX_wsfU9FfRJoOPE0gjUX=Bp7OZWOZDyMNfO6=M-fX_0A@mail.gmail.com>
 <20210616040132.7fbdf6fe@linux.microsoft.com>
In-Reply-To: <20210616040132.7fbdf6fe@linux.microsoft.com>
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
X-CRM114-CacheID: sfid-20210616_092505_523619_4415B820 
X-CRM114-Status: GOOD (  13.67  )
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
> Sent: 16 June 2021 03:02
...
> > > That's a good idea, but if you read the replies to Gary's original
> > > patch
> > > https://lore.kernel.org/linux-riscv/20210216225555.4976-1-gary@garyguo.net/
> > > .. both Gary, Palmer and David would rather like a C-based version.
> > > This is one attempt at providing that.
> >
> > Yep, I prefer C as well :)
> >
> > But if you check commit 04091d6, the assembly version was introduced
> > for KASAN. So if we are to change it back to C, please make sure KASAN
> > is not broken.
> >
...
> Leaving out the first memcpy/set of every test which is always slower, (maybe
> because of a cache miss?), the current implementation copies 260 Mb/s when
> the low order bits match, and 114 otherwise.
> Memset is stable at 278 Mb/s.
> 
> Gary's implementation is much faster, copies still 260 Mb/s when euqlly placed,
> and 230 Mb/s otherwise. Memset is the same as the current one.

Any idea what the attainable performance is for the cpu you are using?
Since both memset and memcpy are running at much the same speed
I suspect it is all limited by the writes.

272MB/s is only 34M writes/sec.
This seems horribly slow for a modern cpu.
So is this actually really limited by the cache writes to physical memory?

You might want to do some tests (userspace is fine) where you
check much smaller lengths that definitely sit within the data cache.

It is also worth checking how much overhead there is for
short copies - they are almost certainly more common than
you might expect.
This is one problem with excessive loop unrolling - the 'special
cases' for the ends of the buffer start having a big effect
on small copies.

For cpu that support misaligned memory accesses, one 'trick'
for transfers longer than a 'word' is to do a (probably) misaligned
transfer of the last word of the buffer first followed by the
transfer of the rest of the buffer (overlapping a few bytes at the end).
This saves on conditionals and temporary values.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
