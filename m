Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5A5C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mMVGL4e57YIrsiGUIVe/qFpLxaIT0WFTydDPf/topA=; b=iELjTaVVHFxOmT
	dxfbLYYNKzepz+SHhKuJ1BclDDX/PtPw4OdKAE2R7LcnUxR9WPAgaZAw3XnQNcfBouswPfTiuG3df
	7ADNspDCR849BceRHAOVwCeU2U4OkUDNhLkpegOLKbW81LF1JVZr/hsGYBKfxDNC2s/qWLlVAMah7
	hnhWIP4vJxVJTH8po7ZB9dCGvdoqGxqNtbZ4+YyvbSWbgI0S83sRJO9QxgXMR1gmBExIuGekE48Sc
	UJz8J/takceQ7s6f5ktwsjRspBIi0fmOjgZx0Ub5mqFCmM9NtmxR57oiXkqA1VFdZOqJ6w4uuqT3a
	blInc4mFDt8fbmAddyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJcmy-00FjaV-G9; Mon, 14 Feb 2022 14:57:16 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJcmu-00FjYb-N6
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 14:57:14 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-214-fl88X-xMPqWO--GZQOB3Tw-1; Mon, 14 Feb 2022 14:57:06 +0000
X-MC-Unique: fl88X-xMPqWO--GZQOB3Tw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:57:05 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 14 Feb 2022 14:57:05 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
CC: Joshua Kinard <kumba@gentoo.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, 
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, "Andy
 Lutomirski" <luto@kernel.org>, Kees Cook <keescook@chromium.org>, "Lennart
 Poettering" <mzxreary@0pointer.de>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>
Subject: RE: [PATCH RFC v0] random: block in /dev/urandom
Thread-Topic: [PATCH RFC v0] random: block in /dev/urandom
Thread-Index: AQHYIa/RMksFr1LZVEWsiQom7rZ3n6yTITWQ
Date: Mon, 14 Feb 2022 14:57:05 +0000
Message-ID: <63afd299c8df4495b27456a7f92aec75@AcuMS.aculab.com>
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
 <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
 <CAMuHMdXDj+BVCs4Syg39vjnHGKcwJnCgDxrGoOiEFM_T4ojwPg@mail.gmail.com>
In-Reply-To: <CAMuHMdXDj+BVCs4Syg39vjnHGKcwJnCgDxrGoOiEFM_T4ojwPg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220214_065713_049863_AB3D7BCE 
X-CRM114-Status: GOOD (  12.02  )
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

From: Geert Uytterhoeven
> Sent: 14 February 2022 14:26
...
> I'm afraid you missed one important detail.  You wrote:
> 
> > On every platform, random_get_entropy() is connected to get_cycles(),
> > except for three: m68k, MIPS, and RISC-V.
> 
> The default implementation in include/asm-generic/timex.h is:
> 
>     static inline cycles_t get_cycles(void)
>     {
>             return 0;
>     }
> 
> Several architectures do not implement get_cycles(), or implement it
> with a variant that's very similar or identical to the generic version.

Add to the list nios2 and old x86 (I think rdtsc is a pentium instruction)
I can't see it in my 386 book, and i don't think 486 added it.

I'm not sure if/when sparc added one.
I don't remember it being there in the late 1980s.

nios2 (soft cpu on Altera/Intel fpga) is annoying.
There is a 'read control register' instruction and plenty of space ones.
But you can't define your own and one isn't a clock counter.
You can add one as the result of a custom instruction.
(Even the same custom instruction that does byteswap.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
