Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03E1C27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPodw44CQyQGbN7VX4NCX+ptjDSVAPH9c/2+nOc7mk8=; b=3PNvucH6N/M2GokRQjf/ImFRin
	wMYWCRk0R80YTA/JB0VQ144ZEMCNvqmVJCepTTMjnL4n9fVzPdq7uUI1CczlKyl/NeDKOQMQZleyk
	WeFj6pOGo3xzKe9cBGEVWpo97pUMOhDsp3RL1V9fxHWKYyJ63rxCNpf05y930OfKtMliNOPKTS1s9
	SQ1D57Ux4VxB0OC3WJ8vHz1DhMobyAEppuzwRYAbgMyIXipFR1lJ/w3FVChcaLTw6Xada1OwSaWkJ
	71FpaEc3lpCvI7hREKId1E1oQvyVwOsxwc0h3kyYY30QIy+An05QLDhfU2eOOZYQfjs+Meu4mjuL5
	f8hTmqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlXi-0000000GxkL-1VHr;
	Thu, 13 Jun 2024 14:35:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlXe-0000000GxjK-1h6m
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 14:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 870D661B4A;
	Thu, 13 Jun 2024 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9CEC32786;
	Thu, 13 Jun 2024 14:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289305;
	bh=JaP7qDY1oFoFZ4n3ApB2MhPSSgkthi/B+6BCfNqzZXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpWSvufSz4/6eYuosODegqx8fYaQJdmhbXOMc9p3b5WQ/gfIGYomNolbhKVu0XyEs
	 W2H0e+wQFo2NkfWXDAQ3LbTEDDBa2Alep0Fo++oTkFflawV4GEvJ9Wi9kiKocoOyXu
	 fIs689QlI2/OOyKKFS+JJohZLTVF2vzDfltpGmegtsEUMHY9J9XtRXAhn/OQjlS7AN
	 Mmo2SE5noT0cWKfvCzt91qNktweA/t/FLRttcxzlyVNGPmu4WlwLvnCi0XAQ/tlJrt
	 5M7dL1TY4lZA2RowibqCH1a4V1xRmTX8OuDJjQXYcjGojVOUCAUfkVjOtM3IOv6kmW
	 rvvZiMkjp8hjg==
Date: Thu, 13 Jun 2024 15:34:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Message-ID: <20240613-gauntlet-starlet-2aedade31a06@spud>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
 <20240610-xtheadvector-v2-2-97a48613ad64@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240610-xtheadvector-v2-2-97a48613ad64@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_073506_576099_177BFF6A 
X-CRM114-Status: GOOD (  10.66  )
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
Content-Type: multipart/mixed; boundary="===============6572580002886030251=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6572580002886030251==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AQap8GU9ejAJchW7"
Content-Disposition: inline


--AQap8GU9ejAJchW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 03:56:39PM -0700, Charlie Jenkins wrote:
> Add a property analogous to the vlenb CSR so that software can detect
> the vector length of each CPU prior to it being brought online.
> Currently software has to assume that the vector length read from the
> boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> instruction trap, so this property is required on such systems.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--AQap8GU9ejAJchW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsDkgAKCRB4tDGHoIJi
0u7xAP9LpPul5GSNB17Xr63YXTnJb87tSBlm5oBD3QK4jgiBbAD/WyZuDo4SvIBG
T0dxQyzZxI2/QiuOT6A0fzXSpA+tgwY=
=i6hR
-----END PGP SIGNATURE-----

--AQap8GU9ejAJchW7--


--===============6572580002886030251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6572580002886030251==--

