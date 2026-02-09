Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE1DE7E0D0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ghg+NcXUdExV6soXxmAVutgcCl6L+O1T1s6hGdYrIwk=; b=ZCLcnIEGxpMUIoGRsNu892Lq6v
	rh5JcQW4ztuCUlEI+ljniDZ9kiiMNC13A36IsNCzWuFbvOk2TF5ZlARnb4AIoGNLmdVwiMcm7HXYQ
	GtdsbCjxmz/bNSiuF6eGL03jdJaI32GD7EvWLqDQgHS94/C36HCYHKWbDR53w+GMXjXK0bqWFEDNm
	KZ71oJUzFbvWDfeNi1ybA2SWZCTexWxbMe3jVqNcBsTZrBe7OhpxxZR7EOHKzBH65Cnpe6bjN46BK
	z2Bo7YAGNpQeuN1Iu+wprCqkgNrYDiIBcF4YxdgoMSiLu+MuzniIfic4Zy3bjEssQtiuWh0aIIpaW
	ZQg4+2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWUl-0000000FtQh-3F8i;
	Mon, 09 Feb 2026 19:00:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWUj-0000000FtQH-23Nw
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 19:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A06E8400F9;
	Mon,  9 Feb 2026 19:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329D3C116C6;
	Mon,  9 Feb 2026 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770663624;
	bh=Gn3cwiqxljCA6W7Xej1NCrQLFaTw7sAtTr+ABKnyH2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkYUrFkGrnvTiA6w5MxcH3P17ja0YaUjXz77gmeRnRRGz696SWcD1O6r7ctqtXV1I
	 GV+SD+lva2MWzE6nKC69UpBOzQ5409wkS0pb3Pfm58CSpMsVSXcW8UlQuZZUD3/Au9
	 5pTgiX9LPuyy3N8uuWxzoMlErH7KCfO4yYlCHEbLSMcUQEt192+Owaq/AgJZcyysp+
	 WNy7cvnCp1CyRDWA5I87TNoohDqhYKl7G/EjhI2D+vLPXlo4BqnZI5srn2VMabzPCg
	 eCIKsM0DETM1Suus8f7KVREL1EeQ2NIJiFvoDXYzbpyZePGHKOLU4BubflUxVtdhPS
	 R2btjGssrrOQw==
Date: Mon, 9 Feb 2026 19:00:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260209-bulgur-unshaken-2d8ca2532c9b@spud>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
 <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_110025_567984_464EEB65 
X-CRM114-Status: UNSURE (   6.35  )
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
Content-Type: multipart/mixed; boundary="===============9017465947303448421=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9017465947303448421==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9LY5svYI3ft3HkXV"
Content-Disposition: inline


--9LY5svYI3ft3HkXV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9LY5svYI3ft3HkXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYouwgAKCRB4tDGHoIJi
0oHYAQD5dcqTHGaB2vUdjmgXkceRiPIWmj6CyrpB2mDxwv3j9AD+LbSsaMDqL+SJ
Ud7aHz9IAPULwU2v+jIaYhBZ1jD1Hwo=
=NpqU
-----END PGP SIGNATURE-----

--9LY5svYI3ft3HkXV--


--===============9017465947303448421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9017465947303448421==--

