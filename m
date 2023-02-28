Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2616C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0JQMvOZiLr+qm6+He4G6z5Hi+DE5J8OfcSJfaxMVT8=; b=DFma8e9tIqm/7Gzkhx9q/RtAe8
	CGBe5zXLfItEke7Jw2xkiySJhUWF9CH4no6yiGENRUPmQW3DtXaFxgYrddSecdsW9gPAZvbBQu/9R
	NTsQJeFObmMT4Ha17O+LuOQt/XtTF3DX9+nZxjbGV0XY2eOB/A1yUBT/Pij6/5Kko2egapQFZmSAf
	bREEN/x9iiyX221IzKzKLUdpeEwWd1xOqOd4DuomFg/klEHX3DjOZ+CufafdesbzFeKnEVwaBAvgh
	atRDl9pguQA1k6OmssJXroOzo8exDeh0E0jY+1l1Z/ptVB9Yypzzb+Bip4Md6+NGdhRKzVr/h8KV6
	W7x6TiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX88V-00ESGe-K4; Tue, 28 Feb 2023 22:07:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX88R-00ESG1-T7; Tue, 28 Feb 2023 22:07:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F985B80ECB;
	Tue, 28 Feb 2023 22:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC476C433D2;
	Tue, 28 Feb 2023 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677622064;
	bh=FApbKilY3GXJ4q89pXMD20d4s4g8bNIn5KjKszQhVjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQBWRFx7k93CR0cw9Cb6i3MAbh5DNDM7hP3Vyt8lDR084A4h0Tc8gH54eeddC7UVg
	 sC3Ja57LIBCLkJidvWeJQbAIzGEgJ2cY8Z9n9RaH6OUTbaRz5gdwWPGvatLL+RgOoV
	 yNk3tw+X7Z4M4DiQzDBKH13k9SAVJ34fdvoOpY6JQPEG5a8OGlr87seFs7ZjKBm7SN
	 ZuzvzzRf8zcuI/1mYctq7zfv60nBRB6JiZB3F7ersDLGL6GIQnaUdxNUs6+UH+n8bH
	 DS6JVaW7mZHp9UNlPncNZ83DwWcjjZBQ1tEgE3I2zxXExsyuB0tA0xlN5woTPH+DC5
	 duv2VoUpDXiyQ==
Date: Tue, 28 Feb 2023 22:07:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Guo Ren <ren_guo@c-sky.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>, Dao Lu <daolu@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH -next v14 02/19] riscv: Extending cpufeature.c to detect
 V-extension
Message-ID: <Y/57KguRXH4H5zDd@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-3-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-3-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_140748_097562_04760A0A 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: multipart/mixed; boundary="===============0716173882294573667=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0716173882294573667==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TTOC1DDLd5I06q+Z"
Content-Disposition: inline


--TTOC1DDLd5I06q+Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:01PM +0000, Andy Chiu wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>=20
> Add V-extension into riscv_isa_ext_keys array and detect it with isa
> string parsing.
>=20
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Looks grand, and thanks for switching to IS_ENABLED().
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--TTOC1DDLd5I06q+Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/57KgAKCRB4tDGHoIJi
0qhbAQDvniHcdbGl6PEkgQ/Y+JTRcHbc8r6Qu04xT5YNTTRlOgD9EjJIwx8OCOwo
ghoz1TDN+aklvl21oLAoJhe8b1JR9gc=
=1fxM
-----END PGP SIGNATURE-----

--TTOC1DDLd5I06q+Z--


--===============0716173882294573667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0716173882294573667==--

