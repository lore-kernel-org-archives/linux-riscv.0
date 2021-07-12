Return-Path: <SRS0=emcE=ME=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33366C07E99
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 08:16:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0434661414
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 08:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0434661414
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgVyAOCu5KZcjpRrqIBQh17/gRdk3e15gSgvCLLVUWk=; b=zoRDIYlF/PdC9h
	n2W28pRBz+3nGlQTov+9rhTeAq6/7PUptztCgT/718/axP7yAScScRTrfTXvjv73Nj3ePJGWyP+n1
	EFn7t9MV6mT0omwBpdRXH8ye7mFUUGv7dYyCStkLLojDn6b1N4Ss8vuLT1NH8lIexVmY+VhJWN8n1
	Quvlsv9yJpKxKU+iFHrSdyd41lEkt4cmlZgOGKXjSD6dUANqi9S0Pqolc4V6429b/qMVE4TlYa/hC
	OpC4uXQN8bRR9OzAb97L/KI/XWBQKvIhVNn1tWpLmvfMxVXVt5kvwL7mCadV22zBsyPuldGCGmNpI
	DLI/gaDHqhxq+nzxx3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2r6X-006YBO-Vi; Mon, 12 Jul 2021 08:15:53 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2r6U-006Y3C-Bw
 for linux-riscv@lists.infradead.org; Mon, 12 Jul 2021 08:15:52 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-172-16XOylRrMuGIO2YWwYe6Qg-1; Mon, 12 Jul 2021 09:15:43 +0100
X-MC-Unique: 16XOylRrMuGIO2YWwYe6Qg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Mon, 12 Jul 2021 09:15:42 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Mon, 12 Jul 2021 09:15:42 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matteo Croce' <mcroce@linux.microsoft.com>, Andrew Morton
 <akpm@linux-foundation.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Kossifidis
 <mick@ics.forth.gr>, Guo Ren <guoren@kernel.org>, Christoph Hellwig
 <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>, linux-arch
 <linux-arch@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 0/3] lib/string: optimized mem* functions
Thread-Topic: [PATCH v2 0/3] lib/string: optimized mem* functions
Thread-Index: AQHXdeB//rSAJETS7k2opSDlamOLfqs+/N5w
Date: Mon, 12 Jul 2021 08:15:41 +0000
Message-ID: <af19820cd24544cd8833d6db6d38154b@AcuMS.aculab.com>
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
 <20210710143109.fd5062902ef4d5d59e83f5bb@linux-foundation.org>
 <CAFnufp1d+FH1K5QAx+Z=KvMUvrveJAVnjJJc8xoDCn2wmzUOoQ@mail.gmail.com>
In-Reply-To: <CAFnufp1d+FH1K5QAx+Z=KvMUvrveJAVnjJJc8xoDCn2wmzUOoQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210712_011550_708492_BA2D4D8B 
X-CRM114-Status: GOOD (  19.26  )
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
> Sent: 11 July 2021 00:08
> 
> On Sat, Jul 10, 2021 at 11:31 PM Andrew Morton
> <akpm@linux-foundation.org> wrote:
> >
> > On Fri,  2 Jul 2021 14:31:50 +0200 Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > > From: Matteo Croce <mcroce@microsoft.com>
> > >
> > > Rewrite the generic mem{cpy,move,set} so that memory is accessed with
> > > the widest size possible, but without doing unaligned accesses.
> > >
> > > This was originally posted as C string functions for RISC-V[1], but as
> > > there was no specific RISC-V code, it was proposed for the generic
> > > lib/string.c implementation.
> > >
> > > Tested on RISC-V and on x86_64 by undefining __HAVE_ARCH_MEM{CPY,SET,MOVE}
> > > and HAVE_EFFICIENT_UNALIGNED_ACCESS.
> > >
> > > These are the performances of memcpy() and memset() of a RISC-V machine
> > > on a 32 mbyte buffer:
> > >
> > > memcpy:
> > > original aligned:      75 Mb/s
> > > original unaligned:    75 Mb/s
> > > new aligned:          114 Mb/s
> > > new unaligned:                107 Mb/s
> > >
> > > memset:
> > > original aligned:     140 Mb/s
> > > original unaligned:   140 Mb/s
> > > new aligned:          241 Mb/s
> > > new unaligned:                241 Mb/s
> >
> > Did you record the x86_64 performance?
> >
> >
> > Which other architectures are affected by this change?
> 
> x86_64 won't use these functions because it defines __HAVE_ARCH_MEMCPY
> and has optimized implementations in arch/x86/lib.
> Anyway, I was curious and I tested them on x86_64 too, there was zero
> gain over the generic ones.

x86 performance (and attainable performance) does depend on the cpu
micro-archiecture.

Any recent 'desktop' intel cpu will almost certainly manage to
re-order the execution of almost any copy loop and attain 1 write per clock.
(Even the trivial 'while (count--) *dest++ = *src++;' loop.)

The same isn't true of the Atom based cpu that may be on small servers.
Theses are no slouches (eg 4 cores at 2.4GHz) but only have limited
out-of-order execution and so are much more sensitive to instruction
ordering.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
