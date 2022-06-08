Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7F1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 19:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VLRc4KH7IdoNHuTZYxgQLaAvT1cISH4MI7urt53W1s=; b=wxJbLz1bVGSJqqfmk6jdksqZKZ
	U+wYIsIXFFhD/96nHSgkTgIU8cnlAgxD6jWlizqzrERznG/JZv1WbwVYj6xCxwJSXetHst37PjLMX
	G611MOCTHoawPvLmPizQG+lp7UlV+NcE6PwDRUo2S5331EHKKACPwDRfdqfXdxJ28p+U3JMVPor8A
	m9TlQtN8han8l19E6F1/VMamv6AVsnpeJz/k/lpQIg3cBMBSFaamKvKRGadR9f9QwqeQfiWdzTwhc
	tPlEt31OKvcAnBUEtDN3QtYF9m7374Lu0R4rGfyKc0xCAhYGOPNYh5xEtSG8YtUsqvyxuM8fZCRgN
	yaBjOFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz1hR-00EpNY-BY; Wed, 08 Jun 2022 19:50:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz1hO-00EpNC-IC
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 19:50:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A48C61932;
	Wed,  8 Jun 2022 19:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16874C34116;
	Wed,  8 Jun 2022 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654717836;
	bh=bF7wIbQ0JKZK1Dl2Z0CIz11yfYpJD9D+7HRVTxZAbWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bh+goBv7wPMYOS0PQsQp4EW9SlBe13kElbxrtbP3GWfG2tQNtP+aaN+OGdQmhqtth
	 Zx6QsJ1UA1ewyPLK+S++Bj5Pm0IHjf719rjbGWqHvifHpgl2rk1nG+TBqxZfcfLZIE
	 ABr5FxChiIV8a3tqhF2tpLPkAAsQyffhukmjlaFcFz0pB+W6IsoRkgQNKrIORJP8vY
	 gJxVZ6/Df8k0nGPS13FDH0jYOedXmrYVfthlPSSE3fIEYdczOSG3Za/hvHe9pAJoh0
	 BcnKC0kXrwmClAlsGUtZJrIvyFpjz325xGvZPvxt0Il5CN317mWv9Ve1EvZ8pUU63h
	 3n64VWBNpo8sg==
Date: Wed, 8 Jun 2022 21:50:31 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: i2c: convert ocores binding to yaml
Message-ID: <YqD9hxVO8nDy6kEl@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Conor Dooley <mail@conchuod.ie>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>, Rob Herring <robh@kernel.org>
References: <20220606201343.514391-1-mail@conchuod.ie>
 <20220606201343.514391-3-mail@conchuod.ie>
MIME-Version: 1.0
In-Reply-To: <20220606201343.514391-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_125038_717702_847A0431 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: multipart/mixed; boundary="===============3280655184237369267=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3280655184237369267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hGhNHd7MU3cinCJK"
Content-Disposition: inline


--hGhNHd7MU3cinCJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:13:42PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Convert the open cores i2c controller binding from text to yaml.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


--hGhNHd7MU3cinCJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKg/YcACgkQFA3kzBSg
KbYwqA/+J5zwS0FWLakgzC0GDLrb6NPSPg8enDq5wa1Mjp2m3KUZZ5kvfJNDyHRj
p9qAYOhyRKQcGWnvsWj4dYi3m2O9720V0VE/Jeld5J4TyviZZ/ZqKTCcyJXrQCo4
3GoZ+1FLM+/Ch6DBGvD1D3FkBpGE9S3zD8B6Ig7wqIo61cvJAUYTgCS3Su8X+iwB
FRRBL7capPTXZqRtsI95WzxKmu1mUvLpmqYihYe5j2zeAb2MfIdRjJbhBc2/oIEC
TOF6onGV4dH0Iu+z1jeos72qhFq+3t14mLbY2fFiXrpXGR/sPf9hKRrCFnAK/8F6
dhCTDyfYbpN3GGifuLwihxA2e/dNXGky7Xq2Fyy3mGcED3UY7DT6mlGHflcQfFqG
H/+XBLeLmSV9ltqmdiRcM9G2aYrZ27zlxs44hOtu+59ToCL8T4JU/qJCs0n0lO+7
FD2+YvQd0Riqsoz95gZYgHiULh39huSsK5drBe8LLBvZGbSf0bbBxKxbaZyAsx3c
BUexRAOzTlMvs4wQbi95+qLPZNuUXfOchyl4QYuGKiikOx9pIrin1zXjdPPDIeX7
4DBrOpgWM2p5YupnUWN5ujffzr3TpP+SfNHlrlzy0LfzsBL4ENlWS33Jc9CURXFw
7wtbm2S0/kTe2inRUQdWCPB6hLdTY53FnYDvetZ/orHb1y272ik=
=OKG+
-----END PGP SIGNATURE-----

--hGhNHd7MU3cinCJK--


--===============3280655184237369267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3280655184237369267==--

