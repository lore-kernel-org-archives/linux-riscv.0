Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C87DC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0dcwmPzYodRZaOmIxsN+Q1HJgi9rCL8I5jN8tItExM=; b=SdtZHly9OIdGCy89t6czPrP2g0
	+ukXj0GikNVS65jcoR3+5UHMjWr87i2NnUqfY92MvhzURkiZWWZeGV8QxYsIINTMenFy/vfpeNkg5
	Zn5+yDmy3DIDSiWVx5Ar59XiC+j3fLw4Fpx0fhOM7xBNAJtknmZ0adshlpse4Ye27SjUXwo77ZHyA
	RrkA7k/4foEk+TckQOfcvt6+RKI7H/6O2atvLKdgdkyZavO2OT26Zj8cVE3poA6gTyNr9+t+L2toQ
	sCa/7KckxNad7KNCIH7RZK8GH9Vx7eTfWyeSdu8lx+Xt9HJNBxePqHSPWyZRCTWG7BleQaaL2Y53F
	Cl8A0XLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXc9-00000000qwt-2sNl;
	Mon, 12 Aug 2024 16:09:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXc6-00000000qvt-003F
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 16:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CFC161351;
	Mon, 12 Aug 2024 16:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8947FC32782;
	Mon, 12 Aug 2024 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723478981;
	bh=3Svd3WfttCoDPIdU5P1nIEjvO5M5AcTlMkgRnjhK89g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0pj/HrlrJovaqTOHnuSxB8GPDImP+gwkOG9tRCjeNlMyv7A3A6uiNpGVX1RuKPQF
	 KaxKa9qMn5vXADHf4fC7KwHBs7zWwICe6r39ewgfkhReNeR9fUSRnPPUcr8gHshRcD
	 Cos8rQOVd0lEvT0enV6Pr3Bcyiy6W2EPS7CwWmncZcAyV10OZXzHIyHfGIi8QzOm+X
	 weT80dz6jwYcTuw5SnwbmRit9P7dkufxmR418fa9rHSfo2Uh52eRhKHgy2Hq+/x0i/
	 pS7+HDZ33H7PNdhq34Xm0yDvVz/j80qDYvOV0r2Je8jVfSbeoyAoY73KJK2pmqfgzJ
	 wlxcHCpxcpdqA==
Date: Mon, 12 Aug 2024 17:09:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 1/3] dt-bindings: dmaengine: Add dma multiplexer for
 CV18XX/SG200X series SoC
Message-ID: <20240812-herbicide-altitude-93ea45b7c79d@spud>
References: <IA1PR20MB495324F3EF7517562CB4CACFBB842@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953C5A099A0F99FA12B98F1BB842@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953C5A099A0F99FA12B98F1BB842@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_090942_123355_67E8DDBE 
X-CRM114-Status: GOOD (  10.12  )
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
Content-Type: multipart/mixed; boundary="===============0522124797891460766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0522124797891460766==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t1SEqS2W3FwKupq5"
Content-Disposition: inline


--t1SEqS2W3FwKupq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 01:16:37PM +0800, Inochi Amaoto wrote:
> The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
> an additional channel remap register located in the top system control
> area. The DMA channel is exclusive to each core.
>=20
> In addition, the DMA multiplexer is a subdevice of system controller,
> so this binding only contains necessary properties for the multiplexer
> itself.
>=20
> Add the dmamux binding for CV18XX/SG200X series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--t1SEqS2W3FwKupq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrozwAAKCRB4tDGHoIJi
0isCAPwKylWrtHOQHoGnqGn92rLYykjnmDlsYxP3Yxl2EFSwhgEAjjTpA+CzP0xU
wq7RdzhPndaEZkg6RVLpxtxiq8bDrgQ=
=LzEz
-----END PGP SIGNATURE-----

--t1SEqS2W3FwKupq5--


--===============0522124797891460766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0522124797891460766==--

