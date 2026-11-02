Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC18606A33E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ny4Q8hU8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqGnCmL9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cZNfUxDPB0sObuDVNq2nB4LlM4fczM/bVyBplmRJiOk=; b=Ny4Q8hU8am7okrDej7xKW05Lob
	wetcE4Yzc0wci67S6plh6pBoniiTyvPGIFg2sTqdh/qoRd2Uey0ouRfag1jza5ks6A2S9xFDJzCuK
	NWQ/by7tF1x7S4z23I2qRwutuFVVTo02N9ZlfGpL5JJujh7/4wuXR8UFq6rUfyUo8pKNaZ0gB+1kN
	mebZfagXLAD6eZNea2ABL58arQE/qDv82sIXKB07A25/RjAgvGS7WSVHYiKHtPha/tjUSaoB0Dh6H
	zXO11YzR1qKWQROfkIeCMewEA6xNQbs3q1tBP4k4pttYKyWdQUc43m8LJN5l+3vgekdqF18kks8fW
	O52RzGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxvd-000000007oD-233N;
	Mon, 02 Nov 2026 19:42:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxvb-000000007nO-3tly
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:42:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EA00601FA;
	Mon,  2 Nov 2026 19:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642A71F00A16;
	Mon,  2 Nov 2026 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648567;
	bh=xYM2w+R+s64GsgyYN0vH9vlqjZhy326IFMYWXn8QM+c=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To;
	b=UqGnCmL91cb8o0RZa9AlcojqHd3NUoVze7hhFa8SslvzoohKM0vCByoWxY2tq2oSJ
	 GBQ67ti/d4c7M6n/qCanFt6OgwcYM+NdcWM5eXrGKgdaeknPu9pU+e09+e6yrR3mdO
	 mHEeyc4z7p94vZCMydTjR5bh4LZdctFYDKpySRLtsULm5Pf06LmbQcF4bkwCVJoOdI
	 mHj6ycFAWqkwDKa6nB6lnbx8ITyvsRDcAKLBTsyc4NqiN+2puCQBCjkSA/a5NiaKu9
	 LgsE8qcf3vMfZlydP6I7j58hmywN0qWeUQe1mpdE66XxAdD/Bau9Wc/fpYQ1y6nlK3
	 QQHDPQbO+/kxQ==
Date: Mon, 2 Nov 2026 19:42:42 +0000
From: Conor Dooley <conor@kernel.org>
To: "ukleinek@kernel.org" <ukleinek@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	"patchwork-bot+linux-riscv@kernel.org" <patchwork-bot+linux-riscv@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND v22 0/3] Add OpenCores PTC PWM support
Message-ID: <20261102-tidal-quintet-3867b525d891@spud>
References: <20260810030714.48100-1-hal.feng@starfivetech.com>
 <179357141185.2624073.8394896290201314670.git-patchwork-notify@kernel.org>
 <NT0PR01MB11026FD52BC4266EFFEACBD5E66A2@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
 <auheO4sRs4P36jgw@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <auheO4sRs4P36jgw@monoceros>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5263564576100395075=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5263564576100395075==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CrMnFs07IEUOttHU"
Content-Disposition: inline

--CrMnFs07IEUOttHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 10:57:10AM +0100, ukleinek@kernel.org wrote:
> Hello,
>=20
> On Mon, Nov 02, 2026 at 02:11:46AM +0000, Hal Feng wrote:
> > > On 26.11.2 06:17, patchwork-bot+linux-riscv wrote:
> > > This series was applied to riscv/linux.git (fixes) by Conor Dooley
> > > <conor.dooley@microchip.com>:
> > >=20
> > > On Mon, 10 Aug 2026 11:07:11 +0800 you wrote:
> > > > Add OpenCores PTC PWM driver which is used in StarFive
> > > > JH7100/JH7110/JHB100 SoC.
> > > >
> > > > I will maintain this pwm module in place of William.
> > > >
> > > > Changes since v21:
> > > > - Allow non-zero duty cycles shorter than one clock tick to round d=
own to
> > > >   zero.
> > > > - Drop the .free() callback to preserve the PWM hardware state after
> > > >   pwm_put().
> > > > - Update the comment.
> > > >
> > > > [...]
> > >=20
> > > Here is the summary with links:
> > >   - [RESEND,v22,1/3] dt-bindings: pwm: opencores: Update compatibles,
> > > examples and maintainers
> > >     (no matching commit)
> > >   - [RESEND,v22,2/3] riscv: dts: starfive: Correct pwm nodes
> > >     https://git.kernel.org/riscv/c/2186ec5f59c2
> > >   - [RESEND,v22,3/3] pwm: Add OpenCores PTC PWM driver
> > >     (no matching commit)
> > >=20
> > > You are awesome, thank you!
> > > --
> > > Deet-doot-dot, I am a bot.
> > > https://korg.docs.kernel.org/patchwork/pwbot.html
> >=20
> > Has this patch series been applied? I've sent out the updated v23 patch=
 series, but
> > Krzysztof pointed out the Tested-by tag should not be added in the dt-b=
indings patch.
> > Should I send a v24 to drop the Tested-by tag tag, or should I make the=
 changes on top
> > of v22 if it has already been applied?
>=20
> The way I read it, only patch 2/3 "riscv: dts: starfive: Correct pwm
> nodes" was applied.

Yeah. And the mail is a quirk of me not removing the thread from the
linux-riscv patchwork and pw-bot autoresponding when the series was
"applied" by me to that tree when Paul fast-forwarded it.
There should have been a b4-ty email from me a while ago saying that I
had applied the dts patch.

--CrMnFs07IEUOttHU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujnsgAKCRB4tDGHoIJi
0vGgAP9gqJ8aLAjZxjxqcBKs8ePNSulSrB7JgAx+3rNCP7DK4AEA7fKaU0A4JXOu
VrSrRZ/T+DWcsS8PHwzW9l9w/VPFPgE=
=n+9e
-----END PGP SIGNATURE-----

--CrMnFs07IEUOttHU--


--===============5263564576100395075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5263564576100395075==--

