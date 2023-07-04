Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872B7EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nom4JPp7QNOc3oW2R0JxrDSTsuUsTOyrtN6xymfk9Nw=; b=X+l4fAsbVSW6Q7Ch2tcuymwBrw
	49wIx5xET0Jrfxz2h8bQSwiwXHXm2dGJN9G4Z98b/D54PFcBylOqSlOM10FdCEG5DpH9YehUZVyO9
	A3NN7WMF30LHL8rucVV8ZH9aMuhZxZc9LufHYD7amEMqc7BbchwoiFvaqtBx3hkpoINQxi4QsK196
	n5M3YyqlNU5RQVzxrobDo0lFRDPBAKDnqzoy+OgV3zyftYjukXCtg2nl9HxdvH/7uUvRKIwdJPIuW
	Kv0+ATJrMZWuJYF36B059PTcQ5v6awSrwAqv1nX7wqyeseN5YeLT4qzOUysdhSzGvZylYzn0+p00p
	2CsiXe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf6j-00DGNH-1m;
	Tue, 04 Jul 2023 12:26:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf6h-00DGMy-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 12:26:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B15156122B;
	Tue,  4 Jul 2023 12:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DB6C433C7;
	Tue,  4 Jul 2023 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688473570;
	bh=w5Afb4XWjxOhR3PdDC5/dWU4ESSRpE7tbnpWTqpze6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmBK1ZxKi3vPvuNJFPWoXidDeHkATevaFIYAYB8Exj12AB7CguWsstOl+K5xSR4kE
	 kxrJAdfzquoJKGKtFtOa5eweKL+VfDGeMRJOqsC9YX54GEoSmAf3mS4jBIPGJNa84Y
	 xU2W+aE/AALQmXi56RJvXv+EHsKNmiUc0KS3f4Q0wLBW43h9S/3g+39kEun9DlhCZ4
	 /hDfwrd9rVV1Jz+2zxX3E/kiJ3wBFd9ISxMvaBpsPhLvKzNPBQpoP6653vBmiC+ujY
	 EFcCf3SjsHA2spkeqylbJb8UK7qycznK64MZ/dqQvW2QakxmEe1m+uwTdvxqPIOusA
	 D/L2bRftQkJUA==
Date: Tue, 4 Jul 2023 13:26:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND v1 2/2] riscv: dts: starfive: Add spi node for JH7110 SoC
Message-ID: <eba1e868-6371-42fe-91be-bcbee54d1aff@sirena.org.uk>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-3-william.qiu@starfivetech.com>
 <7f3b600d-d315-22d6-b987-eabfe1b04fdf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <7f3b600d-d315-22d6-b987-eabfe1b04fdf@linaro.org>
X-Cookie: Memory fault - where am I?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_052611_570160_C880452B 
X-CRM114-Status: GOOD (  11.00  )
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
Content-Type: multipart/mixed; boundary="===============4700792853980976594=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4700792853980976594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OO8jAjJ1e96WJdbG"
Content-Disposition: inline


--OO8jAjJ1e96WJdbG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 11:39:29AM +0200, Krzysztof Kozlowski wrote:
> On 04/07/2023 11:22, William Qiu wrote:
> > Add spi node for JH7110 SoC.
> >=20
> > Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>=20
> Missing SoB.

It's fine not to have a signoff for the codeveloper of codeveloped
patches, see case (a) for the DCO.

--OO8jAjJ1e96WJdbG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSkD9wACgkQJNaLcl1U
h9BTigf+LfNH/CBAYdHfe3VZllj07Uk+C8zJO27te847iom4iGuhCC+jcGSITT+r
u4PaSovtoVAJjyknu8Ns2AuKQDJocuR0qa65kY9Q38AcZhWEDchiZP93cbb/ukN+
9LfbJdhX/H4V2mcsb1m5qX0mmgDm7TFdiwYXn43mamyeV2S9t6mgMAXcs7emO4Q/
ZvKpAAVWi77lhHDqU5vCu7vywRdUIXWcDxHMzzvRySIKeqlPwHZpVxRfASMhy7ty
OggCESMVtDcJRCG5x9EO7HbLAuDfNX5KDAcDlGZWYgNMu3FpTe4zkPknDWhN9Bm7
gQPUvZVzPu0+Q3YvijgMyNP5VfM4mQ==
=5CMq
-----END PGP SIGNATURE-----

--OO8jAjJ1e96WJdbG--


--===============4700792853980976594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4700792853980976594==--

