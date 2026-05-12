Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B46CD4F25
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNlPLk+aV/MoLb9DsuSVB6kbWUfxmmmC5ufM973ltY4=; b=NGl/dPlAR2GzyDO+dDU27cxaeL
	+S498eF+lFLITOskpjPlg9BtSkL5Q6rw/wdVVbLsNoYiqVgRK9HRu1ToGjOFlBPpiKs4HV4YEuwA+
	MPDNu4X9BnWPOSDnKZ6Ktm0RfpvCjP4f60SxxdzG5yoY8svSqW+zEgGC7y7ChE2Y6Xe5q++a+ZzpX
	NXg54wRWr1r4NMgqgkSwtaqvLBZDIVu2VOYbzuRMaOr0QlYtwPtgrZ15FdDkWtIFCXzUp1NQQli1K
	F5McFTSXUfJ8TQ8xU/Z3BsV+BTwGq0cDpdl75fn4jUzhfcHdbJx9sgWF+vPcPFsxNFc+Z768e9wvi
	Y9aVagCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMr5j-0000000HZNg-35pX;
	Tue, 12 May 2026 17:40:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMr5h-0000000HZN6-2SiW
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 17:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 439B841A74;
	Tue, 12 May 2026 17:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31351C2BCB0;
	Tue, 12 May 2026 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778607621;
	bh=npkKRkbCHuMxxTkGtz0jU2eTI/JHbbUGkLRNiKOOGlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mI23ETlazG0WQcd23pxLGOtXql7Un4dbtL/1JY3eBHUa+zSuVqPEXXNHU21LD/ehq
	 addy2DWxreyPVa/vxFEuS3BknSl5rBkQa4pKUHA4Itt/oJhfo5RuC5O5zM55Z0H64s
	 izM/pt6gJZNVtYT2mq+F3PQI5s42jjwtoCMhyzoBj/DQ12QAnrBtNmsnGCs7FO5vI/
	 lD/eJgvZiD1mbxQLEhk/xSLdDGwr/pela+zSyh9KjysZZKWFElXjmViBkwqc7ciW3P
	 eXJN6zr/6zQnuSJxLya8k4k5U+f9xJms7tiKsO6tomHTPH6yr4goRCIcq14xm3jrZk
	 Fq5gG5cRwLthw==
Date: Tue, 12 May 2026 18:40:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 00/12] Add StarFive JHB100 syscon modules
Message-ID: <20260512-sponsor-glider-1c2d81fb6eae@spud>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_104021_649644_D9D2DE25 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6014181478617717094=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6014181478617717094==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qFOL+G6TXxlTic1U"
Content-Disposition: inline


--qFOL+G6TXxlTic1U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 01:35:09AM -0700, Changhuang Liang wrote:

> Changhuang Liang (12):
>   dt-bindings: clock: Add system-0 domain PLL clock
>   dt-bindings: clock: Add peripheral-0 domain PLL clock
>   dt-bindings: clock: Add peripheral-1 domain PLL clock
>   dt-bindings: reset: Add StarFive JHB100 reset generator

For these 4,
Acked-by: Conor Dooley <conor.dooley@microchip.com>


--qFOL+G6TXxlTic1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNl/wAKCRB4tDGHoIJi
0s+AAQDMLz+eCs+7dNGUIwrc/NShFxM3bCgz4vWoNxbGIAzhswEAvzdtnz4lornN
+iG7zRMlLHmKjxY2P9FbjCCEf5SeSgc=
=pohG
-----END PGP SIGNATURE-----

--qFOL+G6TXxlTic1U--


--===============6014181478617717094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6014181478617717094==--

