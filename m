Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948A2EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lydRVXfjDShKIihADNYWtuXqexg9aDWKQGO6T6BmNI=; b=gNWav8n5yCzC8M+ar/XbAsujQ6
	aclOTfaQ5fXEAWiEbtmno02eDRpwvUt8kDrRjP+M5mpTdMh5ujdo0m7VPuEnQD9mDlCn6HjoknKZo
	Xl+1pYLX1SsENh99O1Vxl8xTbbVgempMlew7wFGAe/pxY5tPYwZiLi3aJEdkXh7Hk4uGv5hZg8WLz
	UMlr8/0hR/clGyjHSvmnXamd+SiYXx6G46o+6mkY2YGyxcN3oYOjBVDaiwqqqdEaRiX1xHJwZ7tr1
	5A2tD/EF31qSrOT7RARr+A9AFZu00PnORVZ8LTeEaqr6Z7XsApWL2jTf4Ntmu0y11A7zfXNiiZ1pY
	xr5NYPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qECiP-00Dkhi-0G;
	Tue, 27 Jun 2023 17:42:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qECiM-00Dkgv-0w
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 17:42:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DF7761199;
	Tue, 27 Jun 2023 17:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6E8C433C0;
	Tue, 27 Jun 2023 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687887772;
	bh=3zgdhuyrFC6SsBoe3wLBBlLUnpWWGaTZeYQukBm5EqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hqstb6AI4dmTpmLp8UV1hINQMfhmB5TPUy+LICqcMMged5gjIrkoAa7f4x6Nb+gOd
	 9jtlPNIXII28U4IEse3/2HbILIBUlspD4Inu2lwfgIRTPI0WytXkTOLbemUIq7qNyy
	 IninGIol3JiVuNEH7XThgZ7WvdeRxxtBJbNU3d8zeRvBD0oxOXLr5W8mdUETzF+LNJ
	 t/bJ001R355xjR763WuxPIIcytoJALWgj7Toa3SzblqjOIwgSSPQ5k/bU4QDcGfGjB
	 ASkOU8zwpC9c8O1JoAP69k6qqQ1v2WXZVPQfNYmsuuzmKvIUIRp50dsgufwqn7TfE7
	 LuXVEF4CWAIsA==
Date: Tue, 27 Jun 2023 18:42:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v1 7/9] RISC-V: split riscv_fill_hwcap() in 3
Message-ID: <20230627-prevail-jurist-7de0b50f2eed@spud>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-prevalent-heaviness-e35188de1225@wendy>
 <20230626-0176f6ea5768a6013a7aecdc@orel>
MIME-Version: 1.0
In-Reply-To: <20230626-0176f6ea5768a6013a7aecdc@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_104254_369559_931CA979 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: multipart/mixed; boundary="===============3673269717093069332=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3673269717093069332==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k6sMAfmx4wMaD7zR"
Content-Disposition: inline


--k6sMAfmx4wMaD7zR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 06:17:51PM +0200, Andrew Jones wrote:
> > +void __init riscv_fill_hwcap(void)
> > +{
> > +	struct device_node *node;
> > +	const char *isa;
> > +	char print_str[NUM_ALPHA_EXTS + 1];
> > +	int i, j, rc;
> > +	unsigned long isa2hwcap[26] =3D {0};
> > +	struct acpi_table_header *rhct;
> > +	acpi_status status;
> > +	unsigned int cpu;
>=20
> I see all these unused variables get removed in the next patch, but they
> should get removed here, lest they trigger some warnings and bots come
> after you!

Funnily enough, I'd pushed this out for LKP and it never complained
about the unused variables - but my own stuff on patchwork did.

--k6sMAfmx4wMaD7zR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJsflwAKCRB4tDGHoIJi
0lOkAQDCTj05VCKYILzRvRfUnZcGzqw9r9bdBbez5rNRofNHXgD/RSA5WAwLyGC6
k1l4a7QDIvTEug4W7pYln2cxrAAEPA4=
=RLJs
-----END PGP SIGNATURE-----

--k6sMAfmx4wMaD7zR--


--===============3673269717093069332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3673269717093069332==--

