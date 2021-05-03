Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFEBC433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 12:21:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544B961185
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 12:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 544B961185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JDbPASbB6tO4zhDn/ZrHJfH18LnIMf+EU+VmQKdrCjw=; b=TzPew0mYPuvf40DGQDc4waVlC
	odRUHZOIqSyfvUkmRCpNM9Z9WpgGIn17EFiguvlLbVmXvO/73zqjpTh4aa40gkNHHhTpSkp4ZD3xN
	mDwL4doKaEJ0dNyN61+okG8elblVADuHCUKODT/se0g01KSi08lgC9s3SsrDCpV8KwrWgNdeg9RTm
	+mHJVYEcc7QGGhHgKVLorJ8g+WJXuIWioMLaviLItisI7qXqZdfHznJh5K1Zm8GEmv+9v4JM0tASk
	I+B9u3W80OT0je27UDq3AH777TFG/taHd9z3jxQnA8dlO9CJ6DKVclGMKYiBgJsuooHPBcZJI2/0f
	+wMgVNPBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldXZN-00DqKB-7v; Mon, 03 May 2021 12:21:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldXZK-00DqJq-D1
 for linux-riscv@desiato.infradead.org; Mon, 03 May 2021 12:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:To:
 From:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=0LujNnbzw+Wyg7fYCtv7X8l50bl9t/eYCg65R/D4e+A=; b=5GVJjS5whHymAmzZTGyJ+SH0VY
 KjxzYtY8tvXIz869GpCbcJWfiD50asK2jwXrlekGQkP2nqGjTb4/QNAkdq99AO/v9VEmmwpvGsmBp
 SiTMAxv5bTyJx4j30WakezERV/dIJsWErN2Gb6h1YLecEjV4dZOGIzdCT/N8+vhJv9AW7Tikp7aiw
 G43W3ikZQtJzTWgzghwtpemOMZWA1mhShYKrjHIwTBvqNhp3fsTl4KcyTsBC1hX/Lhx9xT3L6FIqy
 VIcikIo8x+em64qQ72YQPUp+c2tc59ZgjqOSxLnncaPkMH9OsswidrF4w2ux5btS+f9rX9F/WvLJv
 bvj+8Nqg==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldXZG-0033Ab-DI
 for linux-riscv@lists.infradead.org; Mon, 03 May 2021 12:20:56 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-158-eNDpXcXQN7-pDpflGzOLyg-1; Mon, 03 May 2021 13:20:47 +0100
X-MC-Unique: eNDpXcXQN7-pDpflGzOLyg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 3 May 2021 13:20:46 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Mon, 3 May 2021 13:20:46 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Segher Boessenkool
 <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, "Linux Doc
 Mailing List" <linux-doc@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras
 <paulus@samba.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] Raise the minimum GCC version to 5.2
Thread-Topic: [PATCH] Raise the minimum GCC version to 5.2
Thread-Index: AQHXP/5biZEe8rdCR0StYtnq1hyuzarRqk5g
Date: Mon, 3 May 2021 12:20:45 +0000
Message-ID: <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
In-Reply-To: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210503_052054_744929_A05143B0 
X-CRM114-Status: GOOD (  18.70  )
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

From: Arnd Bergmann
> Sent: 03 May 2021 10:25
...
> One scenario that I've seen previously is where user space and
> kernel are built together as a source based distribution (OE, buildroot,
> openwrt, ...), and the compiler is picked to match the original sources
> of the user space because that is best tested, but the same compiler
> then gets used to build the kernel as well because that is the default
> in the build environment.

If you are building programs for release to customers who might
be running then on old distributions then you need a system with
the original userspace headers and almost certainly a similar
vintage compiler.
Never mind RHEL7 we have customers running RHEL6.
(We've managed to get everyone off RHEL5.)
So the build machine is running a 10+ year old distro.

I did try to build on a newer system (only 5 years old)
but the complete fubar of memcpy() makes it impossible
to compile C programs that will run on an older libc.
And don't even mention C++, the 'character traits' is just
plain horrid - enough to make me want to remove every
reference to CString from the small amount of C++ we have.

To quote our makefile:
# C++ is fighting back.
# I'd like to be able to compile on a 'new' system and still be able to run
# the binaries on RHEL 6 (2.6.32 kernel 2011 era libraries).
# But even linking libstdc++ static still leaves
# an undefined C++ symbol that the dynamic loader barfs on.
# The static libstdc++ also references memcpy@GLIBC_2.14 - but that can be
# 'solved' by adding an extra .so that defines the symbol (and calls memmove()).
# I've also tried pulling a single .o out of libstc++.a. This might work if
# the .o is small and self contained.
#
# For now we statically link libstc++ and continue to build on an old system.
C++LDLIBS := -Wl,-Bstatic -lstdc++ -Wl,-Bdynamic

It would be nice to be able to build current kernels (for local
use) on the 'new' system - but gcc is already too old.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
