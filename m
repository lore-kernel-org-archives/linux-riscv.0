Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C10AC54E49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ERkm5DAigoI8INNKD3RGwq+Q02KIjhDLqzZoCGan7Q=; b=T47rwp1XbR92uZMhKPjVweg6aj
	gX+00qvmuRMitelizbvBNNP8GoDHhpV/IyQhnqY9xxkRUq08NlpHy54oY9v2rNM2ie5UrCGnFPKKw
	5rfLUBY7mXRAxlOvqi0vl+R9/y1J6SdlHEjb0P6niPB6zMHmVogHfhNdT/HIjDBhyBIqvO4eLJxji
	kESnSl3KKddcRVc8Ff7lrEIKkd5mIrQXFnXpJPdZV2ENEBP76+LiAi9vuA5QKRL5QBmGgHaKcjnOn
	H1096kU+W9YVEVZ2xJ1GCCiub/t0ON68UJX7l3oBzSQdk29+5ZkWI8crhlvpTQQwdTIwZMBMcc3ar
	KJDeXmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXa4-0000000HQaG-05Gj;
	Mon, 26 Feb 2024 09:47:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXZz-0000000HQWL-21Wn
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 09:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708940843; x=1740476843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GUBUJnhCJ+5svJV4Frsq2xuX833M2pcxXkLKdnw/2XQ=;
  b=1299ajWgzbIUFWWz0TOdoC+Tiv8nPbsiCJgikfmwYHyqc3IWCrW+XWhA
   p/0ZhvP79c/JIPFK9hoCYDilUHskaEHqSDU5h7jxR8ZiOeWzphPZ/X3Q+
   JvrG0Qt+0IHMiOjKnf+rK1pXjn4Ra9OXn6JKvpr1f00SOmfwmCmSuJiJO
   1RbFwPBIezQE+OGeFbNyUd0kYHS9yl7u/Sj6r3p/YKuFIrNpunKt4N0Y1
   5zAs6JUwMGANbRTv/R1u0U5YAnUOYcuquqbXcsc2FX32taHddF49oqgMU
   RRSRlEtqqbKeq8MbiaUs26rfVKVoMbseM0wYivmDZTcPO3Bpblaastq5x
   g==;
X-CSE-ConnectionGUID: 3TUWboU7Q1e+0wVDoOdcMg==
X-CSE-MsgGUID: Th18ok6cRYSjDiY187FfJw==
X-IronPort-AV: E=Sophos;i="6.06,185,1705388400"; 
   d="asc'?scan'208";a="16814562"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2024 02:47:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 02:46:59 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 02:46:58 -0700
Date: Mon, 26 Feb 2024 09:46:15 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: riscv: cpus: reg matches hart ID
Message-ID: <20240226-esteemed-bagginess-7373abcdcefe@wendy>
References: <20240128180621.85686-1-heinrich.schuchardt@canonical.com>
 <20240128-simile-endocrine-9e8af979d361@spud>
MIME-Version: 1.0
In-Reply-To: <20240128-simile-endocrine-9e8af979d361@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_014723_811637_FC4EFDA1 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: multipart/mixed; boundary="===============7709916467055894082=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7709916467055894082==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6pjag9RV18K1QWjn"
Content-Disposition: inline

--6pjag9RV18K1QWjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 06:20:46PM +0000, Conor Dooley wrote:
> On Sun, Jan 28, 2024 at 07:06:21PM +0100, Heinrich Schuchardt wrote:
> > Add a description to the CPU reg property to clarify that
> > the reg property must match the hart ID.
>=20
> That is the expected usage alright. Did you come across something where
> it was not being used in that way?
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I think I pinged Palmer to grab this, but since it's been a month and
not picked up, I've gone and applied this.

Thanks,
Conor.


--6pjag9RV18K1QWjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdxd5wAKCRB4tDGHoIJi
0rpKAQDtHi/6j4X2TxwcayQZ0w2Lut2Pa5wamAt/W3HRnT4ENAD/cOo9XIvgbe7q
tntBZhh1qRKSOacwcfw2GY4q5z0E+A4=
=ZusI
-----END PGP SIGNATURE-----

--6pjag9RV18K1QWjn--


--===============7709916467055894082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7709916467055894082==--

