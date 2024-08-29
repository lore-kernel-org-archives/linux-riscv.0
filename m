Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A045C83F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 15:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AvMmU9R++pAWshUMXWZDVR3CST4+n+wgU2HAbrcFOY=; b=E+8/tIqHg+JU7ETSjJCMVQKMu9
	o047YLGhX2HfP1y5zIKB0hzi8qIgQfFxYk2Ft3ODkZxBRRmRLdqZ5S+toGT/osktHqH1ATE5PQlKF
	fiLf821cZymhGtCSbrgmLMOrok7M58Pr7Y3GJuS22siPDHqC6b92LxAMpo2AA9LCAgIXF6ehHZFVX
	U8nrvdXaDuMMx/MAWgsKD97SYV2GU4NfmGxi63Ag3IOAexPvdr3N2WjnjRoZkwPoecoQow72VJa6X
	acjOCCvwy1ZqtU/nXyIqHCOyVAYP/ze2Ii3dku1SyzcKSngHpoC/mf/BI2pgElKOQ0mOctp+teVDX
	XBsXfHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjhTh-00000002i9m-2v6J;
	Thu, 29 Aug 2024 15:54:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjhTe-00000002i96-3Tnm
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 15:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 84349AE4DB7;
	Thu, 29 Aug 2024 15:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8F1C4CEC1;
	Thu, 29 Aug 2024 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724946864;
	bh=2q+OiF406XPSjiUS7iYMlpB+7HKrq4ShozAQkTfjXRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9hPUymUxrstMDsTKs13AgZR65chtL7fPFcSn+MTLCIUPKk1JCwPQkFNpYO9VrxfG
	 7ImlPiq3O0GAXn2hPJ8ElZoZUWrGPhUqeRnmhX2IuAaGnWoVzM/5j+i22Ml5SfBf/m
	 Hp63XIGSLbt08fE9NtXOPYY3Vb8KSQAIjWBSr4zi5XYMoyBte/sCOqM1Pq2UxDzeu/
	 sQtDFT5jORQ++a8mPrRJLZ17exCsxxAnjsrIG9vkXwHAuzKI19rvH7KeRAzR60Z8Dr
	 Sv4xfODowvi9ruzUOjjwdsS6vBcEjkqPyX1G1U42RRNXeROeiJZdhZp8f3F6ZltPp/
	 M3SC66xg/xiRw==
Date: Thu, 29 Aug 2024 16:54:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: iio: adc: sophgo,cv1800b-saradc: Add
 Sophgo CV1800B SARADC
Message-ID: <20240829-impolite-excretory-298dcd984e76@spud>
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
 <20240829-sg2002-adc-v5-1-aacb381e869b@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240829-sg2002-adc-v5-1-aacb381e869b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_085427_030712_E8BFC612 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: multipart/mixed; boundary="===============8078045862461664581=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8078045862461664581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JOvC/K7N02Ne9hmR"
Content-Disposition: inline


--JOvC/K7N02Ne9hmR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 02:31:50PM +0200, Thomas Bonnefille wrote:
> The Sophgo CV1800B SARADC is a Successive Approximation ADC that can be
> found in the Sophgo CV1800B SoC.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--JOvC/K7N02Ne9hmR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtCZqgAKCRB4tDGHoIJi
0tmFAQDuCBgWolSZSmmwKxidXOgVFEyAkp03nE56bxdV/mnZ1wEApMNmjk0lPQTq
OX3+1Bnc1D5utxnITTTEbgufgpj3LQM=
=hASc
-----END PGP SIGNATURE-----

--JOvC/K7N02Ne9hmR--


--===============8078045862461664581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8078045862461664581==--

