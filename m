Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550B4C77B60
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PMeXkrjPovYTE4yUptssFSvgUSOOwK6ApTu5h+dBDI=; b=EbNhJuCreEwPlk
	2GC8ua8cJpksXc93wf5t+b7EvdZ/oDN2PIRsvyTh4++IolQx2ss21iAEvs+K7BOLrvvhiNNpdEdg/
	+mxGrbF+0NyK9G/yyWQ+nsGq1uI8+h64jic6RQb0XiJ2eNOlwMA7hoyyms6qnEq/S6Rpnw9SjYr7H
	D9YwsztbOnewhX7gejbKQNBwBGO3ZatFVuGZWMKbJtPV+JZdnHFLX8tqE1ANmZA+ZglriqitHOb4N
	oWa3bXWH8VNuNPYl3uyn8n6kvkuiy3fBmXjG1Vu8Sh2djBFXJVn2MITz5ABkxSxB3pVBP5bAHmBkS
	Drj8r6IURcrH8LcZ/Vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4hG-004l30-04;
	Wed, 05 Apr 2023 15:05:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4hC-004l0I-35
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 15:05:12 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pk4h0-0007m8-0z; Wed, 05 Apr 2023 17:04:58 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Eric Biggers <ebiggers@kernel.org>, christoph.muellner@vrull.eu
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au, davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject:  Re: [PATCH v4 4/4] RISC-V: crypto: add accelerated GCM GHASH implementation
Date: Wed, 05 Apr 2023 17:04:57 +0200
Message-ID: <45936818.fMDQidcC6G@diego>
In-Reply-To: <2102949.OBFZWjSADL@diego>
References:  <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
 <ZCSFXIAnl6LTVLJL@gmail.com> <2102949.OBFZWjSADL@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_080510_992482_3BBCDD1C 
X-CRM114-Status: GOOD (  27.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi again,

Am Mittwoch, 29. M=E4rz 2023, 21:20:21 CEST schrieb Heiko St=FCbner:
> Am Mittwoch, 29. M=E4rz 2023, 20:37:16 CEST schrieb Eric Biggers:
> > On Wed, Mar 29, 2023 at 04:06:42PM +0200, Heiko Stuebner wrote:
> > > diff --git a/arch/riscv/crypto/ghash-riscv64-zbc.pl b/arch/riscv/cryp=
to/ghash-riscv64-zbc.pl
> > > new file mode 100644
> > > index 000000000000..691231ffa11c
> > > --- /dev/null
> > > +++ b/arch/riscv/crypto/ghash-riscv64-zbc.pl
> > > @@ -0,0 +1,400 @@
> > > +#! /usr/bin/env perl
> > > +# Copyright 2022 The OpenSSL Project Authors. All Rights Reserved.
> > > +#
> > > +# Licensed under the Apache License 2.0 (the "License").  You may no=
t use
> > > +# this file except in compliance with the License.  You can obtain a=
 copy
> > > +# in the file LICENSE in the source distribution or at
> > > +# https://www.openssl.org/source/license.html
> > =

> > My understanding is that code that is licensed under (only) the Apache =
License
> > 2.0 cannot be included in GPLv2 programs such as the Linux kernel.
> =

> Thanks a lot for pointing out that possible licensing issue.
> It seems I'm not touching enough non-GPL code most days to keep that
> in the front of my mind :-) .
> =

> =

> > Is this code written by Andy Polyakov?  What's been done in the past fo=
r his
> > code is that he re-releases it in CRYPTOGAMS at
> > https://github.com/dot-asm/cryptogams with a Linux kernel compatible li=
cense.
> > The Linux kernel then takes the code from there instead of from OpenSSL.
> =

> The git log for the original openssl ".pl" thankfully only contains
> @vrull.eu addresses, so getting this in a compatible license shouldn't be
> overly hard - I hope.

just to follow up with the current state.

We're currently trying to see if openSSL allows us to dual-license the
files inside openssl itself [0]. It looks a bit like we're the first to
try something like this, so the decision gets to be made by the OMC.

If that fails, we'll provide our own files dual-licensed in a separate
repository, similar to Andy's way of doing things.

Heiko

[0] https://github.com/openssl/openssl/pull/20649



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
