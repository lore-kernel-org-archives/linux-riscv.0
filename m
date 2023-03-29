Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5471EC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3px2XxFIHJ4sg8f7Gj12m7XbMMjOJO84pk/G3BzK/o=; b=bXJXrKahsBJJhk
	uBgJerm5dzy+lwzid05qBgEFgMdiHIDQjYll6KWVogk5St7f5z1wvd8vORw2IGg9sOiV67GzpjJHH
	OIxdR46k6dqaJjZiP3iIVD7SrfXEHPJwanBMQGzBOy3vqHanW93sMYVnHptngxK6FdOGW8ldl0UWe
	s9thRtjcH7SUXXxUvaPPnPBuEd8tPgDy1k0vco3wsI+8El1Dcob4Z/ee99VyLY4sEHCGWsitPyY2/
	yNe/DaHKVKfrG+5GUwMX3P6Ar+tMZ1BY96B5YLNHLOXGSvax2XukP5sDidamOUMomAzbY5AHLU5V0
	YQujc1bvHRJ6c4B8oYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phbLb-001bnt-2I;
	Wed, 29 Mar 2023 19:20:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phbLY-001bmW-27
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 19:20:38 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1phbLK-0006eg-Uh; Wed, 29 Mar 2023 21:20:22 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Eric Biggers <ebiggers@kernel.org>, christoph.muellner@vrull.eu
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au, davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject:  Re: [PATCH v4 4/4] RISC-V: crypto: add accelerated GCM GHASH implementation
Date: Wed, 29 Mar 2023 21:20:21 +0200
Message-ID: <2102949.OBFZWjSADL@diego>
In-Reply-To: <ZCSFXIAnl6LTVLJL@gmail.com>
References:  <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
 <20230329140642.2186644-5-heiko.stuebner@vrull.eu>
 <ZCSFXIAnl6LTVLJL@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_122036_693183_97A4A4F3 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Eric,

Am Mittwoch, 29. M=E4rz 2023, 20:37:16 CEST schrieb Eric Biggers:
> Hi Heiko,
> =

> On Wed, Mar 29, 2023 at 04:06:42PM +0200, Heiko Stuebner wrote:
> > diff --git a/arch/riscv/crypto/ghash-riscv64-zbc.pl b/arch/riscv/crypto=
/ghash-riscv64-zbc.pl
> > new file mode 100644
> > index 000000000000..691231ffa11c
> > --- /dev/null
> > +++ b/arch/riscv/crypto/ghash-riscv64-zbc.pl
> > @@ -0,0 +1,400 @@
> > +#! /usr/bin/env perl
> > +# Copyright 2022 The OpenSSL Project Authors. All Rights Reserved.
> > +#
> > +# Licensed under the Apache License 2.0 (the "License").  You may not =
use
> > +# this file except in compliance with the License.  You can obtain a c=
opy
> > +# in the file LICENSE in the source distribution or at
> > +# https://www.openssl.org/source/license.html
> =

> My understanding is that code that is licensed under (only) the Apache Li=
cense
> 2.0 cannot be included in GPLv2 programs such as the Linux kernel.

Thanks a lot for pointing out that possible licensing issue.
It seems I'm not touching enough non-GPL code most days to keep that
in the front of my mind :-) .


> Is this code written by Andy Polyakov?  What's been done in the past for =
his
> code is that he re-releases it in CRYPTOGAMS at
> https://github.com/dot-asm/cryptogams with a Linux kernel compatible lice=
nse.
> The Linux kernel then takes the code from there instead of from OpenSSL.

The git log for the original openssl ".pl" thankfully only contains
@vrull.eu addresses, so getting this in a compatible license shouldn't be
overly hard - I hope.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
