Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A642EDE990
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8fffIwkS2dqSMe63RctIe3SNZGT7fosdrqpV7fTAw0=; b=sLwT2sn+0vtqh2
	bw/b+M5kUX20ZGTi+pbHKRIwpyNTtFNmulCsA/JYCPmALk6qlLjyJdlt3GLkzQhe0HVtTqJJAtVCS
	zarAvuMuO/lM7DKZjqJnqX1COt0JSd4kBBDwZhcdWZm725DNzra4ps+OiW/xaV9cINE/s9lq2NbLK
	voOehVYZtZ6u+/ohhJX0iWXdq7PC/AWzprqD1dsSbsKysJmTgt80bsJSBDUEcSAfFSfhex7vvhyYt
	IFkkwBMBrZA5Z9gbN+6ejZCfKptEvzZb/RY6WA/yD9hNqSm6V8G+mX09bdSIe4pJ96M+DXdB4qu7x
	weErMhrMMGsDsQ3vwPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi0B-007k3H-1J;
	Thu, 14 Sep 2023 08:47:07 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi08-007k2B-3B
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 08:47:06 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-236-xJwBvLsLMwuuTmppwXLEdw-1; Thu, 14 Sep 2023 09:46:57 +0100
X-MC-Unique: xJwBvLsLMwuuTmppwXLEdw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 14 Sep
 2023 09:46:54 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 14 Sep 2023 09:46:54 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>, Evan Green
	<evan@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Conor Dooley
	<conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang
	<jszhang@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, "Sia Jee
 Heng" <jeeheng.sia@starfivetech.com>, Marc Zyngier <maz@kernel.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon
 Hosie <shosie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Albert
 Ou <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alexghiti@rivosinc.com>, Ley
 Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xianting Tian
	<xianting.tian@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Andy
 Chiu" <andy.chiu@sifive.com>
Subject: RE: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
Thread-Topic: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
Thread-Index: AQHZ5t2uDoI3R+Ee30ay/cEMVFilT7AaADQQ
Date: Thu, 14 Sep 2023 08:46:54 +0000
Message-ID: <de95229a14614198894a8ce421c30d94@AcuMS.aculab.com>
References: <20230818194136.4084400-1-evan@rivosinc.com>
 <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
 <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
 <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com>
In-Reply-To: <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230914_014705_291214_35153E80 
X-CRM114-Status: GOOD (  18.52  )
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
> Sent: 14 September 2023 08:33
...
> > >     rzfive:
> > >         cpu0: Ratio of byte access time to unaligned word access is
> > > 1.05, unaligned accesses are fast
> >
> > Hrm, I'm a little surprised to be seeing this number come out so close
> > to 1. If you reboot a few times, what kind of variance do you get on
> > this?
> 
> Rock-solid at 1.05 (even with increased resolution: 1.05853 on 3 tries)

Would that match zero overhead unless the access crosses a
cache line boundary?
(I can't remember whether the test is using increasing addresses.)

...
> > >     vexriscv/orangecrab:
> > >
> > >         cpu0: Ratio of byte access time to unaligned word access is
> > > 0.00, unaligned accesses are slow
> 
> cpu0: Ratio of byte access time to unaligned word access is 0.00417,
> unaligned accesses are slow
> 
> > > I am a bit surprised by the near-zero values.  Are these expected?
> >
> > This could be expected, if firmware is trapping the unaligned accesses
> > and coming out >100x slower than a native access. If you're interested
> > in getting a little more resolution, you could try to print a few more
> > decimal places with something like (sorry gmail mangles the whitespace
> > on this):

I'd expect one of three possible values:
- 1.0x: Basically zero cost except for cache line/page boundaries.
- ~2: Hardware does two reads and merges the values.
- >100: Trap fixed up in software.

I'd think the '2' case could be considered fast.
You only need to time one access to see if it was a fault.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
