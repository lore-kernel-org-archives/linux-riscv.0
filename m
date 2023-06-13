Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962EEC7EE29
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPZdzb+6rK9mjY+nD+WUv07YUVUK0HTmq3M4+7LwfW0=; b=DLYcsC2cHLosSa
	lxan3ubJI5FDJ3H0Eta+L7MRXPD83Pu5CoBNMTAKIjTJzswQrZTgR/Ut8DfjVKFqHaYbmJ3dy1ZF0
	WFktPrXy3Ws0YJEXyCKa99VtbjIyAwmyzESteN4MBMNxM2vZrMBbaTWd9c2gj22gcRRoOsQYHKQqU
	PcQApDDBH+wqgEt9LjeU1vcG1K8lPvdfHVo0vAGYO0t/5HUf3r2DqJ2bNbxVfOezLFsRdyEKTq8s7
	4MqrZpTz6SqSZCew4kxbKcLMcscFEt/Mzd7GczDAaKUqAL118TokSJ+f8jdsreEi5PMD7Wdn4FQ7E
	yDd1v/aqjYSeCJrhRxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8yxh-007JKA-04;
	Tue, 13 Jun 2023 08:01:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8yxb-007JIf-2d
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 08:01:07 +0000
Received: from i53875b22.versanet.de ([83.135.91.34] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q8yxK-0000QG-0v; Tue, 13 Jun 2023 10:00:46 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au, davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu
Subject: Re: [PATCH v5 4/4] RISC-V: crypto: add accelerated GCM GHASH implementation
Date: Tue, 13 Jun 2023 10:00:44 +0200
Message-ID: <2236193.NgBsaNRSFp@diego>
In-Reply-To: <20230613031006.GD883@sol.localdomain>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
 <20230612210442.1805962-5-heiko.stuebner@vrull.eu>
 <20230613031006.GD883@sol.localdomain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_010105_175576_C04FD9D3 
X-CRM114-Status: GOOD (  24.45  )
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

Am Dienstag, 13. Juni 2023, 05:10:06 CEST schrieb Eric Biggers:
> Hi Heiko,
> =

> On Mon, Jun 12, 2023 at 11:04:42PM +0200, Heiko Stuebner wrote:
> > diff --git a/arch/riscv/crypto/ghash-riscv64-zbc.pl b/arch/riscv/crypto=
/ghash-riscv64-zbc.pl
> > new file mode 100644
> > index 000000000000..677c438a44bf
> > --- /dev/null
> > +++ b/arch/riscv/crypto/ghash-riscv64-zbc.pl
> > @@ -0,0 +1,427 @@
> > +#! /usr/bin/env perl
> > +# Copyright 2022 The OpenSSL Project Authors. All Rights Reserved.
> > +#
> > +# Licensed under the Apache License 2.0 (the "License").  You may not =
use
> > +# this file except in compliance with the License.  You can obtain a c=
opy
> > +# in the file LICENSE in the source distribution or at
> > +# https://www.openssl.org/source/license.html
> > +
> > +# This file is dual-licensed and is also available under the following
> > +# terms:
> > +#
> > +# Copyright (c) 2023, Christoph M=FCllner <christoph.muellner@vrull.eu>
> > +# All rights reserved.
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions
> > +# are met:
> > +# 1. Redistributions of source code must retain the above copyright
> > +#    notice, this list of conditions and the following disclaimer.
> > +# 2. Redistributions in binary form must reproduce the above copyright
> > +#    notice, this list of conditions and the following disclaimer in t=
he
> > +#    documentation and/or other materials provided with the distributi=
on.
> =

> Is this worded properly for a dual license?  The paragraph about the Apac=
he
> License makes it sound like the Apache License must always be complied wi=
th:
> "You may not use this file except in compliance with the License."
> =

> So I worry that this could be interpreted as:
> =

>     Apache-2.0 AND BSD-2-Clause
> =

> instead of
> =

>     Apache-2.0 OR BSD-2-Clause
> =

> It needs to be the latter.
> =

> So I think the file header needs to be clarified w.r.t. the dual license.

Hmm, I think the =

	"This file is dual-licensed and is also available under the following term=
s"
should be pretty clear?

Also this is wording openSSL uses since 2004 in other parts like
crypto/LPdir_*.c . So I'd guess any "issue" should've come up already
in all these years?


> Side note: can you please also include a SPDX-License-Identifier?

ok, will add them


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
