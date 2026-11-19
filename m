Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F37606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zGzYINZb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GcDAX8ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dwkX9obfYIRVL1c12S59/iOrsSu0F5HKNHu3Ss3Wu98=; b=zGzYINZb7Q8ss+BEIzXHcY15rM
	0B4XTKWsZgOc37D1NJpX+HvrPOBlh/3EQsS/vd2ITL14rBbQhNdrmxLZiTTwinjFYvJ9jd9SxOV2f
	hEMCjGuAXgrC2lzJGqLppBhfsAQBruaYlPnTGu4zknOXBxafC/To0T2sMMTOOi6RjUOqy1TWjgTMC
	OPVagNCQpZGDVN2o7BRjDejiD6aMQzZN6JFi2YuCrxD9RxgSB2uEsCVGkkeo0cORA+BQwpNd0DDVz
	72pD7BrQnOQ94h76YXo1Pdnut7XqQGqrfKnPdTMezCrqsKM6ypFPWquvglYyWnySFHlJesqa2M0ZO
	OH3cWhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzuA-0000000Be6W-0tGE;
	Thu, 19 Nov 2026 11:02:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzu7-0000000Be5f-1a4w
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 11:02:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DBC861EC4;
	Thu, 19 Nov 2026 11:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E132A1F000C6;
	Thu, 19 Nov 2026 11:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086130;
	bh=iJ289iMCz5xAzHlapJusKbqEqrWvns+8UKRTR9Uk9iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GcDAX8chMsZcwHLAlbUXneBa+4Djex+cGrewl4QpZVADAJtpk/2QdeBi9SubUYoZo
	 muDKRCNF/nXOrXp9robQVqMFCNz6aFhcqAsx/lMI3CVgx3pwY/EFcBi7lPEDL4YYBV
	 XbdKu62wgd8VmCiOUzyAblklXJoW6aytT/Cr2ihON33oC0vKh+XHFP6UmOQ5xMtHBp
	 5135ucs6byeFJHFJ8IHGYH+0x1pDu6aWOAjuSyw2oZidfnWkmp6HDwL9MMkEo7/DpK
	 DbdEOQjQtGgQHkLLZ98jGpbomQ1WEn3LYpyOKQV57q9s2z+R4eGtXrl1oggk9UjoV8
	 ll/6ZfOoL2GpA==
Date: Thu, 19 Nov 2026 11:02:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Wang Yang <yang.wang@deepcomputing.io>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Yixun Lan <dlan@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	broonie@kernel.org, yh_chung@aspeedtech.co
Subject: Re: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
Message-ID: <20261119-defy-stumbling-72b230220a49@spud>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-2-yang.wang@deepcomputing.io>
 <20261118-backdrop-scrap-1bee34e06336@spud>
 <av4iWQb33bya48G1@aurel32.net>
 <20261119090553.1886090-1-yang.wang@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261119090553.1886090-1-yang.wang@deepcomputing.io>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7010647107085804815=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7010647107085804815==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3eRFCAKT41jyFTl"
Content-Disposition: inline

--d3eRFCAKT41jyFTl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 05:05:53PM +0800, Wang Yang wrote:
> Hi Conor, Aurelien,
>=20
> > How is this "eSPI" different to the eSPI described in fsl,espi.yaml and
> > implemented by a driver in drivers/spi?
>=20
> Thank you, Aurelien, for clarifying this. K3 uses the Intel-defined
> eSPI interface intended to replace LPC. It is a different protocol from t=
he
> Freescale/NXP SPI controller described by fsl,espi.yaml.

Ah I think this might be confusing af, because that device also
supports what it calls "eLBC"...

> On K3, the controller exposes a CPU-accessible window for the eSPI
> Peripheral Channel. The EC client accesses its command, response
> and memory-map regions through this window, rather than exchanging
> ordinary SPI messages.
>=20
> The proposed controller driver handles clocks, resets, link
> configuration and window setup. The EC transport handles the EC
> register mapping and host commands. The distinction is therefore
> the protocol and access model, rather than the use of MMIO itself.
>=20
> I will make the Intel eSPI terminology and this access model
> explicit in the binding description.

Please take a look at a similar series from Aspeed and see if you can
cooperate on creating something common between you:
https://lore.kernel.org/all/20260313-upstream_espi-v1-0-9504428e1f43@aspeed=
tech.com/

Thanks,
Conor.

--d3eRFCAKT41jyFTl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav7XJwAKCRB4tDGHoIJi
0jzJAQDtL5rkRZE8LnDVXeZtgQgA+RtqttjgRFyFtUphoHdWFAEA6xsUZag4jTnB
9N7iFMdYFqfgcKj+Eu+uiTeCMD2HRg4=
=jIrP
-----END PGP SIGNATURE-----

--d3eRFCAKT41jyFTl--


--===============7010647107085804815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7010647107085804815==--

