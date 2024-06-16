Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BDEC27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vrsfwm8roHH7HcgmsyMTg28d3jS12dtzAcmzXK98BE=; b=fNflOeYxxCZ22GcEiCUzWrdqeA
	JZFzEfGi8JfJgSjf6ILBKzB6rL9smAHa9TsBXYcCTffPGN+KCtTN4Yv8Mt/LMVQjNR8e8Oy8VmgG+
	1aVjfdqg2gbSRE7Npm27lZ23+2lFikfF5jDMLRgXtY7yRrLvhD43kPlAb4BEHUGGESfWO6Kiz1D8I
	Jc0cwU97cOywSWVGX/hWmqTl55vXX0AYYAYR5v8qmqQ5nbLoEhMPprKC9ozmef6sFx3DjzZYzKPTq
	+iyyDDDoAacR5vXAFuxcJHEvnUtpySwUkLAhla54YpbyDfocQe2tfHe7YAMLgvBYrUlwPNFgmSVQd
	uBwZYxOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIuj6-000000086c4-3Opy;
	Sun, 16 Jun 2024 18:35:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIuj3-000000086ay-0rnt
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 18:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01C5460DDA;
	Sun, 16 Jun 2024 18:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4654FC2BBFC;
	Sun, 16 Jun 2024 18:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718562933;
	bh=cCKxq9tl4NR2OLs8Y2/gZJnVAyUm8QjK2yLyN/vAu8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7bp7BwVBB+vOxSNNOqc7w2dV0jNV26la3je0nwV8+sOGAfTTTSN6fWzPbOZ1r9LN
	 F5YDnRrFg/9VqG2pQ5kSXyp5SFUti5qSJmKACyDsEoJkFfth8j1rpkrl0kKH7L+Wcc
	 K+zAsBuCfGvqbzCK5OodepGgGt/ZfKu2N7/uikAJ0r4qDnpYxgAxMOLopxik5AewCb
	 CMlEUkR18HKUnS//JSaWImZtEqqn02KAo0H6Jhaf3ThjSXySyUUoTZSUoerLAykQPh
	 +CqyiSBJscTVpketohBAOVWXUTG6uXGow0zuEzBe5aTaKxbQhLW2WOWScoLBvrwFhZ
	 KhZckyCD1a4tg==
Date: Sun, 16 Jun 2024 19:35:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <20240616-exorcism-computing-e11e26084a62@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_113537_315943_8B298CE2 
X-CRM114-Status: UNSURE (   8.78  )
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
Content-Type: multipart/mixed; boundary="===============8818337274528719871=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8818337274528719871==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hyrkTx1xiIXK1tLb"
Content-Disposition: inline


--hyrkTx1xiIXK1tLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 01:18:52AM +0800, Yangyu Chen wrote:

>  .../sifive,plic-1.0.0.yaml                    |   5 +-
>  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
>  .../devicetree/bindings/riscv/spacemit.yaml   |  24 ++
>  .../bindings/timer/sifive,clint.yaml          |   4 +-
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/riscv/Kconfig.socs                       |   5 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/spacemit/Makefile         |   2 +
>  arch/riscv/boot/dts/spacemit/bananapi-f3.dts  |  19 ++
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 281 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   1 +

No MAINTAINERS update, so I figure that means you don't want to maintain
it going forwards? If there's someone out that that does care about the
spacemit k1 (Jesse maybe?), then I'd be more than happy to have them
look after it.

Thanks,
Conor.


--hyrkTx1xiIXK1tLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm8wcQAKCRB4tDGHoIJi
0ullAPwIwHO7QvY8o2OTJfZuxL1RvaJtHCpIEcjp5JGF6SHaDQEAyVpJmVs0wZpq
20DChxYrgBQSB7yAGtbtrfsQI4j+5gE=
=dj44
-----END PGP SIGNATURE-----

--hyrkTx1xiIXK1tLb--


--===============8818337274528719871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8818337274528719871==--

