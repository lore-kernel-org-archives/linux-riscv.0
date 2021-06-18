Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50106C48BDF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 08:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13ECC6121D
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 08:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13ECC6121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8+h9Abm8zHB8zcToTmC7o1vSEJSf1EpxQkUJVPG+FM=; b=2wvhPVx0Ki5Oa8
	hWkD2wB7tz50GuEwWuWjzdK2OV9BRQSsfS+vsIRwXnO+nU5dZT2+2o+6SkxWp2nFYfVmtPBG8jOL4
	OlsAoP/eVNMN2+jIriaWGEaww3Q0Z03e3/jvWvfpOP2LI2BSNY9tzFeu2E55jzreu+Emb0wxl7SyC
	KOR3HcrbPKz/pt5ZiLDm/R7O05enMM/lEvR1qLn1ZBRMnwUapttS0aYPVijw1HFBwNkU9vrDGtk4R
	na1WgGUMLDDcrUnrycc555+e3wP+G1F+iukRFZCdoMd0FfNVwMsAQTP2X9Z3yWr6YAuhVg+4vX7z4
	gOLHqIomFA74yKuOQIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9vK-00DJcO-Dl; Fri, 18 Jun 2021 08:32:22 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9vH-00DJRS-1x
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 08:32:20 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-11-fKdMvnO2P96mfGP2YKpuQQ-1; Fri, 18 Jun 2021 09:32:15 +0100
X-MC-Unique: fKdMvnO2P96mfGP2YKpuQQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 18 Jun
 2021 09:32:14 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Fri, 18 Jun 2021 09:32:14 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matteo Croce' <mcroce@linux.microsoft.com>
CC: Guo Ren <guoren@kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, Emil
 Renner Berthing <kernel@esmil.dk>, "Akira Tsukamoto"
 <akira.tsukamoto@gmail.com>, Drew Fustini <drew@beagleboard.org>, Bin Meng
 <bmeng.cn@gmail.com>
Subject: RE: [PATCH 1/3] riscv: optimized memcpy
Thread-Topic: [PATCH 1/3] riscv: optimized memcpy
Thread-Index: AQHXYuC4XkdMIImxVUmoQbZ37iIZIqsYtSAggABBV22AAHkiQA==
Date: Fri, 18 Jun 2021 08:32:14 +0000
Message-ID: <0fe90e43868f49b5953afe5abba41327@AcuMS.aculab.com>
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <CAJF2gTTreOvQYYXHBYxznB9+vMaASKg8vwA5mkqVo1T6=eVhzw@mail.gmail.com>
 <CAFnufp1OHdRd-tbB+Hi0UnXARtxGPdkK6MJktnaNCNt65d3Oew@mail.gmail.com>
 <f9b78350d9504e889813fc47df41f3fe@AcuMS.aculab.com>
 <CAFnufp1CA7g=poF3UpKjX7YYz569Wxc1YORSv+uhpU5847xuXw@mail.gmail.com>
 <CAFnufp2LmXxs6+aH7cjH=T4Ye_Yo6yvJpF93JcY+HtVvXB44oQ@mail.gmail.com>
 <CAFnufp0qjJG4fr=rcAHYrZp3CVfSs0TBuDN_eAOwOM-K804yow@mail.gmail.com>
In-Reply-To: <CAFnufp0qjJG4fr=rcAHYrZp3CVfSs0TBuDN_eAOwOM-K804yow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210618_013219_419170_92B093B0 
X-CRM114-Status: GOOD (  17.78  )
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
> Sent: 18 June 2021 02:05
...
> > > It's running at 1 GHz.
> > >
> > > I get 257 Mb/s with a memcpy, a bit more with a memset,
> > > but I get 1200 Mb/s with a cyle which just reads memory with 64 bit addressing.
> > >
> >
> > Err, I forget a mlock() before accessing the memory in userspace.

What is the mlock() for?
The data for a quick loop won't get paged out.
You want to test cache to cache copies, so the first loop
will always be slow.
After that each iteration should be much the same.
I use code like:
	for (;;) {
		start = read_tsc();
		do_test();
		histogram[(read_tsc() - start) >> n]++
	}
(You need to exclude outliers)
to get a distribution for the execution times.
Tends to be pretty stable - even though different program
runs can give different values!
	
> > The real speed here is:
> >
> > 8 bit read: 155.42 Mb/s
> > 64 bit read: 277.29 Mb/s
> > 8 bit write: 138.57 Mb/s
> > 64 bit write: 239.21 Mb/s
> >
> 
> Anyway, thanks for the info on nio2 timings.
> If you think that an unrolled loop would help, we can achieve the same in C.
> I think we could code something similar to a Duff device (or with jump
> labels) to unroll the loop but at the same time doing efficient small copies.

Unrolling has to be done with care.
It tends to improve benchmarks, but the extra code displaces
other code from the i-cache and slows down overall performance.
So you need 'just enough' unrolling to avoid cpu stalls.

On your system it looks like the memory/cache subsystem
is the bottleneck for the tests you are doing.
I'd really expect a 1GHz cpu to be able to read/write from
its data cache every clock.
So I'd expect transfer rates nearer 8000 MB/s, not 250 MB/s.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
