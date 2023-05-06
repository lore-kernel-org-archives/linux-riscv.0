Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951C5C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5YZdG0AeV+L+3WJx+8ZsTAokgLY06AcytuHMnUTtCg=; b=GScrjnmKzGWnch3BWW7RplozM6
	JmczjBwDdnchfQkirvcza1YOxl4J85h1Kze8O1PtDsk24jcA1ftvm+8R/EgL7CaVwAtJXrWshy3r9
	hwcKNEnGYYQlX3a6qqZHKbFQyhHykjDjHoZCWL3/H6qXJ/tfj9jqk2xElx+VDhzbgZhGr4Ygoee41
	uKu+2solBMkl3YADluMLqnRvt1k6EBAvYc14Smyiq/IUDdxam8mdZZYwT0PeiIZCOw1Es70hra1Ns
	Vig+Jguek583AHU4ZqDMHHw9Kgz8PfBzxbL64dg76Z9APRueMbB/EKS64cPcBqaAbO0sLnsz/nlqu
	US/qwrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFR1-00D74e-1X;
	Sat, 06 May 2023 10:46:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFQx-00D73Y-37;
	Sat, 06 May 2023 10:46:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87EC361A10;
	Sat,  6 May 2023 10:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DA7C433D2;
	Sat,  6 May 2023 10:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683369994;
	bh=ZlRWQ95zd+5sTAIL7gAqnoDe9APBh7ECq48G+NXjqBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IqcwzGWNSOiBOx2a9oADjHiDrb00JicUT9jRND2AmVJZdpWiXnNRpmNhGENf/7/xV
	 Mo1atovpgajhmYn216HVE5rZHVPJtJJlJGYKaE64qeFRF+dM5/2/Jk8sQv5Hrt8gaz
	 QR/KMRMHn7kbzwNgtQJ4vuPN0fkWq+WIIL/xcQBDMvWgTysNKZPYzvAiJhW/EfzjTC
	 SUOKofzPtaQE1UoP4sL14B0wCTJQ8TRp2ti8vQoFPCqZe2xTtIoPd3wiDNqAGEtS0E
	 6cojbUC7BL86T0iiM1Ha7cFNXG2Pj0Eg3YY6/E1vRocFfKYKiVQ+/gsrfE66k45dpU
	 ijQCMyedaZVuA==
Date: Sat, 6 May 2023 11:46:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/6] riscv: dts: allwinner: d1: Add SPI0 controller
 node
Message-ID: <20230506-synapse-shelving-cc61b168d7c2@spud>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-7-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230506073018.1411583-7-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_034636_039600_487235D7 
X-CRM114-Status: GOOD (  12.99  )
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
Content-Type: multipart/mixed; boundary="===============1791892517144428100=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1791892517144428100==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SEplYM9AlrXlDGun"
Content-Disposition: inline


--SEplYM9AlrXlDGun
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 10:30:14AM +0300, Maksim Kiselev wrote:
> Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
> an optional SPI flash that connects to the SPI0 controller.
>=20
> This controller is the same for R329/D1/R528/T113s SoCs and
> should be supported by the sun50i-r329-spi driver.
>=20
> So let's add its DT node.
>=20
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--SEplYM9AlrXlDGun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFYwBAAKCRB4tDGHoIJi
0gugAPsFaNmurMn1m04GZaPBTMtKIju4z0TINH9oqp4Bn2TkJQD/QsCEt441QKoQ
fvXJ1d3lQBaor6kkuScmKeu7JcdV4QI=
=KWaz
-----END PGP SIGNATURE-----

--SEplYM9AlrXlDGun--


--===============1791892517144428100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1791892517144428100==--

