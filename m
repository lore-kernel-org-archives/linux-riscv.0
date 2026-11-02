Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B944606A32D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bHe9dnPi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kiff0D1h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4Hzh+3Bf72dy9/eAeevbG3ZJYWVczPR5SMerX+T2hV0=; b=bHe9dnPiFZpX7oLtF8t/+GQHMt
	Ivl4PRHvYYYdGjmNezPL45QCH9Waxktk/lSae8E1aVzE5ln2jmVYrnihQWeOyQghG/kmB+F9bwVIA
	eCXV+Pv+pzvBMSLQd7eCTm/iqlrRGjraaxvDFO8wzTId7z+BG7s9/I1LZ6KZZ9vQR+Qzk2sLqk9JB
	B+OVpuCN7KNyXJ1EbFT6JvTKxADvtmGoo86cBlb4/IixW1m2iFNYyAsxsQTEXht1YaR8MErLCBmU+
	LzGw+aUv9OMaEuu5KBGuzGxIniOyvomFNGKpUW5thVwWnGch9URoySEHiARBsXOYcCy8IITuU85/6
	0yLKQHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomy-0000000G6bU-1653;
	Mon, 02 Nov 2026 09:57:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomw-0000000G6aT-3KOa
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 09:57:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id E765460DD4;
	Mon,  2 Nov 2026 09:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EC15A1F00919;
	Mon,  2 Nov 2026 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793613433;
	bh=2cQyf8sKC1F7loKuPDRIdjy/GzV9dwagAXHv9zwCcFs=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To;
	b=Kiff0D1hzOFg0lPBzARDrDswtvyheTKFPGRY6Dhk1IRrG+fJRs6MIhAgBNie8TxNo
	 qv8Z2dIwsyL8p5KE3l85iESoMFUAhJlhQlQWLtQiv++Un14uePj29XUH/YqwG5y3nw
	 yq4MClM8NBo8OSpPr30z4+ifmZpvWgMR67iDRhk3NWrLlAs2/kh9eups5HmEK02ces
	 TIDTvzqBeBrNGYkz41UlqS/iD6OwK9WcP4KupAZHLmfVLEUDgYpGbtgw6c0O7yCqB+
	 kbxRhViJ7R1uvMokm8gHO5p2SSeaCAoq97d2tuDdOjy/A+Xt18Xl3Ks6QOF2ytMGw+
	 FPEND+fBTxj9w==
Date: Mon, 2 Nov 2026 10:57:10 +0100
From: "ukleinek@kernel.org" <ukleinek@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: "patchwork-bot+linux-riscv@kernel.org" <patchwork-bot+linux-riscv@kernel.org>, 
	"conor@kernel.org" <conor@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND v22 0/3] Add OpenCores PTC PWM support
Message-ID: <auheO4sRs4P36jgw@monoceros>
References: <20260810030714.48100-1-hal.feng@starfivetech.com>
 <179357141185.2624073.8394896290201314670.git-patchwork-notify@kernel.org>
 <NT0PR01MB11026FD52BC4266EFFEACBD5E66A2@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <NT0PR01MB11026FD52BC4266EFFEACBD5E66A2@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2382769523266364840=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============2382769523266364840==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7uwo5ayfmhz32zt"
Content-Disposition: inline


--g7uwo5ayfmhz32zt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND v22 0/3] Add OpenCores PTC PWM support
MIME-Version: 1.0

Hello,

On Mon, Nov 02, 2026 at 02:11:46AM +0000, Hal Feng wrote:
> > On 26.11.2 06:17, patchwork-bot+linux-riscv wrote:
> > This series was applied to riscv/linux.git (fixes) by Conor Dooley
> > <conor.dooley@microchip.com>:
> >=20
> > On Mon, 10 Aug 2026 11:07:11 +0800 you wrote:
> > > Add OpenCores PTC PWM driver which is used in StarFive
> > > JH7100/JH7110/JHB100 SoC.
> > >
> > > I will maintain this pwm module in place of William.
> > >
> > > Changes since v21:
> > > - Allow non-zero duty cycles shorter than one clock tick to round dow=
n to
> > >   zero.
> > > - Drop the .free() callback to preserve the PWM hardware state after
> > >   pwm_put().
> > > - Update the comment.
> > >
> > > [...]
> >=20
> > Here is the summary with links:
> >   - [RESEND,v22,1/3] dt-bindings: pwm: opencores: Update compatibles,
> > examples and maintainers
> >     (no matching commit)
> >   - [RESEND,v22,2/3] riscv: dts: starfive: Correct pwm nodes
> >     https://git.kernel.org/riscv/c/2186ec5f59c2
> >   - [RESEND,v22,3/3] pwm: Add OpenCores PTC PWM driver
> >     (no matching commit)
> >=20
> > You are awesome, thank you!
> > --
> > Deet-doot-dot, I am a bot.
> > https://korg.docs.kernel.org/patchwork/pwbot.html
>=20
> Has this patch series been applied? I've sent out the updated v23 patch s=
eries, but
> Krzysztof pointed out the Tested-by tag should not be added in the dt-bin=
dings patch.
> Should I send a v24 to drop the Tested-by tag tag, or should I make the c=
hanges on top
> of v22 if it has already been applied?

The way I read it, only patch 2/3 "riscv: dts: starfive: Correct pwm
nodes" was applied.

Best regards
Uwe

--g7uwo5ayfmhz32zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmroXnQACgkQj4D7WH0S
/k5t+ggAj8/tZvnqb0XSSo59bIxsRnNZ0QQf80PHn3F4h0SvL1vMUD08nW3IUOmf
n9mHe2fe0MQpH9Ay0uqyPUuMi/f1hyVyB0KtPruGqifQ/x2xknefeArHlRAZvGkR
r0SztUC5fIfUioGJfnynVl9rrIFi2HCfOMCRAnyP1YBvEALhHw/MpCQRbdZd7XKE
5LCVDb3aJBee7nktDXrsMYvbbLYHzAd43pU61W79zMhBQg/0SoiRZAJtmFRq90M6
QOQ43RbQj7cZLZ3xlIjhoXG18tvoJFZhFYqEf7bsAtSagCOe13mH/TKfiKxs3NZv
vj+/Csw3/gObvGnq1adib1xuZMwu6A==
=cSrd
-----END PGP SIGNATURE-----

--g7uwo5ayfmhz32zt--


--===============2382769523266364840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2382769523266364840==--

