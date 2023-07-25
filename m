Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832C9C00528
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrQTxoKKqK4oTOiYBx58r7iLW9yclxkXMGqO80NEpPs=; b=IIDnY1UNUfcT0z6Iuiga4+TUgy
	TN72Mbrk3Rn/5mT+JEs8gvdohDVONY02nOKV870dSIwTlr5ShsBgoRKHKidlCT4tq7JoJCBU+L45h
	pagffkwvaVdEKVHKgjGro201gmKsqTvXD09LQRdlZ+EW8o6YgBemt80daGmkR2Hqtw2w6kdf0ZQ/1
	OLqA9lr0MpMsYxzsWEe2U0sdSlvf5mGt1cFjBJ0pYgo0rqqvddb1sGvkM0yfg+ZvRrrL5eBfj5sVd
	MLaIQOuSCAcIYTpdc3I2c15LRTbr7jsLdf51TPtEDTPT8OqcAzAgA7dSgR9DXrnq7WdZG8OAlJ5vU
	sr4KwzZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCiu-006eL6-0j;
	Tue, 25 Jul 2023 07:44:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCir-006eKe-0b
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690271084; x=1721807084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GkLqQ6DAg/UKQuy+uWECAwtfkMKE2HdTGALC1tF0kGs=;
  b=zCMFL38670WYMXpQTHH82cNVGSxsbT2hBKAcBdIzVOOgeh1zCZTa8905
   4WrIkGKtebYJit3xNv08XYB48mME9HERFhgH9rbsIb1m/2020GeetpW8s
   Lr1VreBreMQwz7uaC75HI55qpfPltNQ50MRA9ksPC9JIsbLawuKTt2SWF
   cJAxhaCvuxi9qWRoHVd0vbZHT7ClKmTi3VbcglajjxZEjKkEa4UGE/am4
   jwRfSheJjoRXo4Dd0Zaw0R9UQ3df8lzOnEtHfQC7d8ZZTHnugeHenHimh
   YNAzDkt3EzwXTK/WTfjbEutqE4v6rdGuWKcpqvxdxcm7JX13BLSKbyNmv
   A==;
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="asc'?scan'208";a="237576831"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2023 00:44:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Jul 2023 00:44:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Jul 2023 00:44:40 -0700
Date: Tue, 25 Jul 2023 08:44:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samin Guo <samin.guo@starfivetech.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Conor
 Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [-next v1 1/1] riscv: dts: starfive: visionfive 2: Add v1.3B
 gmac phy configuration
Message-ID: <20230725-rental-struck-d49a18d1c382@wendy>
References: <20230725073039.14382-1-samin.guo@starfivetech.com>
 <20230725073039.14382-2-samin.guo@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230725073039.14382-2-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_004445_303236_784BC34C 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Type: multipart/mixed; boundary="===============3597419538340034701=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3597419538340034701==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gtc3Rp2UzxbWAgFm"
Content-Disposition: inline

--Gtc3Rp2UzxbWAgFm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 03:30:39PM +0800, Samin Guo wrote:
> Add visionfive 2 v1.3B gmac phy configuration, including drive strength
> and inverting configuration.
>=20
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>

I opted to squash this (and my temporary revert that becomes a NOP) into
the original patch. It should appear in linux-next tomorrow as 0104340a67b1
("riscv: dts: starfive: visionfive 2: Add configuration of gmac and phy").

Thanks,
Conor.

--Gtc3Rp2UzxbWAgFm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL99RgAKCRB4tDGHoIJi
0tXtAP9Ky4whbpfoJQYqSCSbEjzqKFKnZ3OObobEooJ0DczHqAEA/ADUDL0f+5tB
8g3hgSIQ+p70NnxwTPSaYMzK5/JqLwc=
=G3zZ
-----END PGP SIGNATURE-----

--Gtc3Rp2UzxbWAgFm--


--===============3597419538340034701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3597419538340034701==--

