Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63907C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiLWRFjXPj8nFz/tavZui9lRF5WAUVCS0SxFUg7o1Yg=; b=zrPR5iBZRVq1mP
	mO2a4NmHJzund8WrHYXC7CSZNWU8XFVYQ7S6E6l0d8dTwrAPUpdD3TXHzyms9PFWUzTMWSOi7RgpD
	PuLfLWST6Sqq2R39g7FERRw9drof5NNVyd8IjOqMcKpbYPrkCH9NCDE4cXITV3bZTwlbhS3s+qpxA
	2Z0LyA4L6YtEngPX3R0054RxLNnaVRXEzpDt+/S2teQB5tblR8ZyD8rIKLVYsp15TgGBssehxvV8H
	2Q60HgC7Ce7UDau5+bi1/nMtYG7qiWkKu4LFfi4ekmgJak6KBwFgGogYt6gFXt2kESjKgR+ptiLf4
	w4YCyTs/ytMiMtmYsHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7YDG-00CNgQ-04;
	Fri, 09 Jun 2023 09:15:18 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7YDD-00CNfM-2f
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 09:15:17 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-311-q9nRy84GPH-DWMN5iDJwaQ-1; Fri, 09 Jun 2023 10:15:08 +0100
X-MC-Unique: q9nRy84GPH-DWMN5iDJwaQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 9 Jun
 2023 10:15:05 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 9 Jun 2023 10:15:05 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Zhangjin Wu' <falcon@tinylab.org>, "thomas@t-8ch.de" <thomas@t-8ch.de>
CC: "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "w@1wt.eu" <w@1wt.eu>
Subject: RE: [PATCH v2 1/4] tools/nolibc: sys.h: add __syscall() and
 __sysret() helpers
Thread-Topic: [PATCH v2 1/4] tools/nolibc: sys.h: add __syscall() and
 __sysret() helpers
Thread-Index: AQHZmozMSUsfyUxi2UiZnouHjWtcta+CLgRA
Date: Fri, 9 Jun 2023 09:15:05 +0000
Message-ID: <13d8756927914b578b076babc8b7f7fb@AcuMS.aculab.com>
References: <9edb16b4-0d3f-4355-a7b1-684a28f9b4cb@t-8ch.de>
 <20230609044230.165494-1-falcon@tinylab.org>
In-Reply-To: <20230609044230.165494-1-falcon@tinylab.org>
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
X-CRM114-CacheID: sfid-20230609_021516_151571_D724EFF3 
X-CRM114-Status: GOOD (  15.25  )
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

From: Zhangjin Wu
> Sent: 09 June 2023 05:43
> 
> Hi, Thomas, David, Willy
> 
> > Hi David,
> >
> > On 2023-06-08 14:35:49+0000, David Laight wrote:
> > > From: Zhangjin Wu
> > > > Sent: 06 June 2023 09:10
> > > >
> > > > most of the library routines share the same code model, let's add two
> > > > helpers to simplify the coding and shrink the code lines too.
> > > >
> > > ...
> > > > +/* Syscall return helper, set errno as -ret when ret < 0 */
> > > > +static inline __attribute__((always_inline)) long __sysret(long ret)
> > > > +{
> > > > +	if (ret < 0) {
> > > > +		SET_ERRNO(-ret);
> > > > +		ret = -1;
> > > > +	}
> > > > +	return ret;
> > > > +}
> > >
> > > If that right?
> > > I thought that that only the first few (1024?) negative values
> > > got used as errno values.
> > >
> 
> Thanks David, this question did inspire me to think about the syscalls
> who returns pointers, we didn't touch them yet:

I'm also not sure whether lseek() is expected to return values
that would be negative.

(I do remember having to patch out some checks (not Linux) in order to use:
    echo -n xxxx | dd of=/dev/kmem oseek=nnn
in order to patch a live kernel!)

Technically read() and write() can do longer transfers, but
Linux limits them to MAXINT.
IIRC both BSD and SYSV allow drivers return all values (except -1)
form ioctl().

The check for -4095UL is probably reasonable.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
