Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0907EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhPavWRmGNPNdjmDXfKi5mh/olWPaMeRGUlgMTaPMBU=; b=RzfY+YUajfA8jY
	u/jnvTXn0C+q1LAe3/VL2AGetDnCKaV9BZKlBob169MwlKq8aRW8zAE3k4g61vfQMKjVZpNbmJUPR
	nKhLkuA81KLKrTEfIw/uLXVDuvNT0v7s7XUFxngSGN6ilqOJwWYoGwHQwV5L1KBAmSNtQGGyGD9gC
	vinVWc7k1d4FelEKaxaBrSwURM5wwZgqZqs/C05Iqf3BKy611dFRYmxmSkl3UR796PvbKKYKaM4im
	MZzkYbnuSzNMJiMlRfcc6fTypEXf+XuYxjiG93Ur3N/iDgP+5aGiMFxbs2iJoNUIpY0HS9TGp9YqY
	+gZHh5ehyUqOIon4cpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q99H3-008v7B-0k;
	Tue, 13 Jun 2023 19:01:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q99Gy-008v6G-2c
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 19:01:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14E0A63931;
	Tue, 13 Jun 2023 19:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D73EC433D9;
	Tue, 13 Jun 2023 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686682902;
	bh=/JuClQfiInF4E+biL4mmyBg4GdWaji39UK48z39WAK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkxj4anxa9SwIR1rVD3AliSkIE6TiUP+JPyhWPaTAMASCYImM6Cj69VqV/Mtcji38
	 PGGhjmgEOlhC598j3OTvAFk5BngXgPFozP4Q4rjUmM3OG+aIHzEvXXg8SimdzXAUQ5
	 2EcR1OLu9zIhtTwQPeKzlbcreooITMgSpR9vNE4TWLXXoR2Kzs8jL93mnkK+mWOUDi
	 4gHH94BmCUyqc83ZesZQPPROYwhrLM1wzbiz9gKngJGqnsSlCrAGZjsMGSoO7POMOK
	 7zMiVl0AM3IdDCm2wTfIHvHN9BGYuT1cD4elm9WPPCRXgB+FiOkefM+Q0iRZlrbo7A
	 3QHifX5W7No4g==
Date: Tue, 13 Jun 2023 12:01:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu
Subject: Re: [PATCH v5 4/4] RISC-V: crypto: add accelerated GCM GHASH
 implementation
Message-ID: <20230613190140.GD1139@sol.localdomain>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
 <20230612210442.1805962-5-heiko.stuebner@vrull.eu>
 <20230613031006.GD883@sol.localdomain>
 <2236193.NgBsaNRSFp@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2236193.NgBsaNRSFp@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_120145_120505_B0D6FEFF 
X-CRM114-Status: GOOD (  32.85  )
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

On Tue, Jun 13, 2023 at 10:00:44AM +0200, Heiko St=FCbner wrote:
> Am Dienstag, 13. Juni 2023, 05:10:06 CEST schrieb Eric Biggers:
> > Hi Heiko,
> > =

> > On Mon, Jun 12, 2023 at 11:04:42PM +0200, Heiko Stuebner wrote:
> > > diff --git a/arch/riscv/crypto/ghash-riscv64-zbc.pl b/arch/riscv/cryp=
to/ghash-riscv64-zbc.pl
> > > new file mode 100644
> > > index 000000000000..677c438a44bf
> > > --- /dev/null
> > > +++ b/arch/riscv/crypto/ghash-riscv64-zbc.pl
> > > @@ -0,0 +1,427 @@
> > > +#! /usr/bin/env perl
> > > +# Copyright 2022 The OpenSSL Project Authors. All Rights Reserved.
> > > +#
> > > +# Licensed under the Apache License 2.0 (the "License").  You may no=
t use
> > > +# this file except in compliance with the License.  You can obtain a=
 copy
> > > +# in the file LICENSE in the source distribution or at
> > > +# https://www.openssl.org/source/license.html
> > > +
> > > +# This file is dual-licensed and is also available under the followi=
ng
> > > +# terms:
> > > +#
> > > +# Copyright (c) 2023, Christoph M=FCllner <christoph.muellner@vrull.=
eu>
> > > +# All rights reserved.
> > > +#
> > > +# Redistribution and use in source and binary forms, with or without
> > > +# modification, are permitted provided that the following conditions
> > > +# are met:
> > > +# 1. Redistributions of source code must retain the above copyright
> > > +#    notice, this list of conditions and the following disclaimer.
> > > +# 2. Redistributions in binary form must reproduce the above copyrig=
ht
> > > +#    notice, this list of conditions and the following disclaimer in=
 the
> > > +#    documentation and/or other materials provided with the distribu=
tion.
> > =

> > Is this worded properly for a dual license?  The paragraph about the Ap=
ache
> > License makes it sound like the Apache License must always be complied =
with:
> > "You may not use this file except in compliance with the License."
> > =

> > So I worry that this could be interpreted as:
> > =

> >     Apache-2.0 AND BSD-2-Clause
> > =

> > instead of
> > =

> >     Apache-2.0 OR BSD-2-Clause
> > =

> > It needs to be the latter.
> > =

> > So I think the file header needs to be clarified w.r.t. the dual licens=
e.
> =

> Hmm, I think the =

> 	"This file is dual-licensed and is also available under the following te=
rms"
> should be pretty clear?

As I said, IMO the problem is that it contradicts the Apache license blurb =
just
above it, specifically the part "You may not use this file except in compli=
ance
with the License".  So it's not clear what is meant.  That sentence does not
appear in other common license blurbs; it seems to be unique to Apache's.

I know that people often treat these blurbs as magic incantations, but I'm =
just
looking at the plain English meaning here.

To fix this ambiguity I think either that sentence should be removed, or the
intent to dual license should be clearly described in the *first paragraph*
before listing the two licenses.  (Or do both of those.)

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
