Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BEAC30658
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpSz4niJt+OC4X8jTCh5zuYw6Q3MWzS9CmQXs6hOfLU=; b=tT1JiC3Jc7Ny0dA55eRApALaMy
	39ha8XZXK/7AazhF2U3Ww37Uskq/dDvN+Gp5ofHLQOrzoUNpQOW1pHzCnLMucs4nFHp7dErHuXxzU
	4lAUEGoq08mmO054rAVAjdG0hmIOmcQmgWalMUbCjNDNalGstUroUBRmfk4lJTU33PEpKV8mxvoat
	PKgB02r3i95yaM81EClfY056ae7XaiBuhM2PtWJWIjxtyvSNOzRWgCKLWKinc+/UFJeINhE+PPuFB
	BmBC6HH3vPY2dAwWHKGC6G0jQAEMroinpmDWPdS0k/UkRnEaLnRxrT92ZmJt8j6oQqEaHYeid846p
	5OHMR4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOf1G-000000077qn-1WTL;
	Tue, 02 Jul 2024 15:02:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOf1C-000000077pi-44vi
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 15:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B0E3618C5;
	Tue,  2 Jul 2024 15:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B19C116B1;
	Tue,  2 Jul 2024 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719932526;
	bh=B6tjxGnLQgoj1IytQ/eo5Iu+R/q+hbepkK4xDFWja10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbDrvLqAfr4EkF0ngzbtNAxvqJxvlPYJgHBuOYeheEWJNgYfZeOxVTEckERxqu5hf
	 VWxmzMFWByxd5WPqk9abRZlRvxrWTPFIJbZwiuOB/f6ZVrcFSG0RKGLaeZyLnQMSuX
	 /LlhFgm6Ub24+efRXxocYe61vEKAZfI2IQfX5IfNuvbFdl8Rt85M2mA7R1tgYDRrOh
	 c1YeR5zgpKPsixLHqC1rsnNeIGR9jYadtSCK5qJNxkhfyG1pWDmQvB8Q+tHBKDXn9y
	 1C8a7HYh+ryHWfPYxDVFPG/A3HPAMvZUd6ge2owX1KG7IV1VUkfecD3BwVvXXEEY3B
	 qOTvz48Hm7myw==
Date: Tue, 2 Jul 2024 16:02:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: riscv: Add Svvptc ISA extension
 description
Message-ID: <20240702-levitate-yearling-ccaf46b3f3fd@spud>
References: <20240702085034.48395-1-alexghiti@rivosinc.com>
 <20240702085034.48395-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240702085034.48395-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_080207_097583_4DF4B938 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Type: multipart/mixed; boundary="===============4758269861059411079=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4758269861059411079==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qgVSvZz6tV6lbu8E"
Content-Disposition: inline


--qgVSvZz6tV6lbu8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 10:50:32AM +0200, Alexandre Ghiti wrote:
> Add description for the Svvptc ISA extension which was ratified recently.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--qgVSvZz6tV6lbu8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQWaQAKCRB4tDGHoIJi
0t4RAP0YMZ30aVVzvbxUbn8v2FFdUJrA5ZRltgEOSgdCP7X5WwD/YF2VzRyRAHAs
o3Z63Gv1hdsVHwsL9qo8IICWs8kNSQA=
=7tPq
-----END PGP SIGNATURE-----

--qgVSvZz6tV6lbu8E--


--===============4758269861059411079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4758269861059411079==--

