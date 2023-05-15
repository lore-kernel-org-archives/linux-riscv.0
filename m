Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DBC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cy54fDnEAJTFhXBqdCi43wAv9MvWUbSN83/FCPGRspo=; b=JKwQgEoL8aMvFGhdBPdx7kdu7C
	C4NwKpoIhrB1nitkomloOiriIs3QAysBBCpHTLfT3qCBYfdRHOkSn5p84cQokhX4pz2OpcL0qlrGH
	Nt58Z249S3RYoHb5Yts9u9ROkFJ57S+6z7X+0gdgV0rLDcTeY1pM1U32kUboZm9wL//pNrhZq4IaM
	+yA9WJG7nAhaQwrVbrsUKdLeJQinz9insHNx2JJx8hAH880W171RaMLK1llrsk2GqCAH7cSo3f+Hi
	MYsUa8X0I4xvuoG/y3ope6ha9BVpeQSpMXDC7+3nLAw+KwtTfwGJx3CURw+gXrD914dLJk5wr30od
	Ql6Gqixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pySXo-001G9w-1h;
	Mon, 15 May 2023 07:22:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pySXk-001G8f-2T
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 07:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684135372; x=1715671372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8Xgi03YncOZGRJJderrrJ4xjST8h4en5g7rhUUCfnw=;
  b=jqHWTpPz5aOeyxSNkDecC4XXyRJ3kryOEEZhYaFkpu+yf3qqfpIVfs8v
   +0Mm/zRFZpbUMY2cPn5rplvPQx/7KBkXi7qfVn5RcrhTA7jJUb6Et9CiS
   9mGfUDTNTSEp81EbED8Xad95VsJwdTJb/poUZKU0vzUGuasv/XZcKiMsC
   Qj+ovA9IV0lrWL/1ORMgS28Ya1MC50AMbbyag2qfzBCPtjB32JmCwEZXB
   SE9SyXRwQWO+AFpfSHGXNEGsKTOvU9Zt/4bE2X9xrruIbxZirAUCipZWg
   x/qas6quT/Gi2fN0DgnOqbdTNLGy9m4iTdYhYLbh47XlH5YPuipEsxE1L
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,275,1677567600"; 
   d="asc'?scan'208";a="215381233"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2023 00:22:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 15 May 2023 00:22:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 15 May 2023 00:22:43 -0700
Date: Mon, 15 May 2023 08:22:22 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: jh7110: Add watchdog node
Message-ID: <20230515-quarrel-vocalize-930a189e719b@wendy>
References: <20230509151723.84989-1-xingyu.wu@starfivetech.com>
 <20230509151723.84989-3-xingyu.wu@starfivetech.com>
 <20230512-barrack-catchable-1f4072b9355b@spud>
 <ec5693b7-1ace-2215-1115-971d8086a171@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <ec5693b7-1ace-2215-1115-971d8086a171@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_002252_889871_7378FF21 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Type: multipart/mixed; boundary="===============0621583308703423489=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0621583308703423489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ujRRX7HonzNFd21D"
Content-Disposition: inline

--ujRRX7HonzNFd21D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 09:47:44AM +0800, Walker Chen wrote:
>=20
>=20
> On 2023/5/13 6:27, Conor Dooley wrote:
> > On Tue, May 09, 2023 at 11:17:23PM +0800, Xingyu Wu wrote:
> >> Add the watchdog node for the Starfive JH7110 SoC.
> >=20
> > Emil or Walker, could I get a review on this please?
> > It's the only dts patch on the list right now for the jh7110 that I can
> > actually apply, so it'd be nice to do so.
>=20
> Of course, thank you for helping to review and apply.

I was hoping that you would reply with a "Reviewed-by", your thanks is
nice to but I can't do anything with that!

Cheers,
Conor.

--ujRRX7HonzNFd21D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGHdogAKCRB4tDGHoIJi
0k4CAQD4BEwpPDxRdIPtEhcDK2WdnRhIn6XAPAXknR/EmUxJxQEAgDqhW5gWb+Qr
YvI20G0S7y44BvGbGHd8JA9I4IontgY=
=1VMT
-----END PGP SIGNATURE-----

--ujRRX7HonzNFd21D--


--===============0621583308703423489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0621583308703423489==--

