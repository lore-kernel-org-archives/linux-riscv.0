Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D4AC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzUNQh0qXnlceG555dAYNrHnBuQA/+4xvCCwCk+ER6Q=; b=ASd/AKc4gv6iVd
	K7JFhJ/9OXmexNMyI4dnf2y3F8kAqf3lZHw7Z8fOlqTxZNX25qJ+OPTLAlsYoixEG3CLZp9okJrLZ
	MfdU8A3Twr4IYLomFLicfyH734cvAz4qlOM7nn2uw9qe9n4Ra76aGpyUFCnjd5tm4Pwc+JYC5MVwU
	S5Og0zBO3AutcvU4+4h96HyEvZdMhypKgU13FxZIUFrvjIk1nerlgtsTQuHagPLu/EIdyaPs+An9w
	rOfdJtHFSWnpgzJR5E8IHTdcFTp8bCqxUV8S8mGdjcpWQ42BJ5FpNZCcycRMyPi9OriweP+PMsEnk
	V6e807cpWHrYpzSGuQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0jh-00000007Oqv-2AZy;
	Wed, 29 Jul 2026 09:38:01 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0jf-00000007OqU-29mQ
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 09:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jdJjAQ5usu/uPD4P5xeoaT+rcjDFpo2ZWXNtcZD+yKI=; b=mrMjcnY7nPhCaAbMQmxKfVOR94
	QnAM7D6AdTeeW+wn6FeoQR+WN0qHSGk/6cwltYj579cHeOAlA4aB83Fq6ZB5cfbJN8mUJtptQfd5C
	qQmQPsSwig5PQIVVU5JxVmkaTm+uOyA3hT5jACOf/XVI4H95YxIQ//dvyGd705OyH0p0TPlhC9sPl
	Le4dSOwv/Bw/mZXuM7CCdC17lfqwjKkWUI52ykN599iVjIxLRTjqjBv20gJQRXwGuehi3pLcQGO20
	Fz4mXXFawAd7Im3B924iNfACNFVLdZpuMyTYs5k0hf4FnprlB78x8qFjb3Ftltkgcd78B37e+UhcE
	zAk+N6Vg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp0jd-00000002Jo2-2BFi;
	Wed, 29 Jul 2026 11:37:57 +0200
Date: Wed, 29 Jul 2026 11:37:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Add a common board dtsi for
 Milk-V Jupiter boards
Message-ID: <amnJ8JmhGbH_sNV_@aurel32.net>
Mail-Followup-To: sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-3-aurelien@aurel32.net>
 <20260728212345.A0CFE1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260728212345.A0CFE1F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_023759_554871_549CC09C 
X-CRM114-Status: GOOD (  18.46  )
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

On 2026-07-28 21:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch incorrectly removes the original authors' copyright headers from k1-milkv-jupiter.dts and replaces them with a single copyright claim by the patch author.
> --
> 
> --- Patch [2]: [PATCH 2/3] riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter boards ---
> commit 97e4c73a96036da2bf4f3762abb7b076f18d6748
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter boards
>     
> This commit adds a common board dtsi file for the Milk-V Jupiter board
> variants. It factors out common configurations into the new dtsi while
> excluding CPU operating points, which are left for the specific board files.
> 
> [ ... ]
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > index 3c16d0c20050e..9c4aa4f8a533c 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > @@ -1,471 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0 OR MIT
> >  /*
> > - * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> > - * Copyright (C) 2025 Javier Martinez Canillas <javierm@redhat.com>
> > + * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
> >   */
> 
> [Severity: Low]
> This isn't a bug, but should the original authors' copyright headers be
> retained here?
> 
> While the original copyright headers were correctly preserved in the newly
> created k1-milkv-jupiter-common.dtsi file where the bulk of the code was
> moved, standard practice is to retain the original attribution in the
> existing file as well, alongside any new copyright claims.

Thanks for the hint, I'll fix that in the next version.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
