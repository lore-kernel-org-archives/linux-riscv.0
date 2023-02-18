Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B2C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1g9Aa5YsJ7yTb4wN4Vpr80b4gedBmMsoREXCfV05w8=; b=akYizIq5FONqXua9ThXoDtr73U
	iPpfcCHZyKvPPxEWknQhuM5PPaOAELoj8N0uMfhPjDbW9FB8IKwIx4MlxDWcgXkrtZoedRDvh7/QT
	oOQV+Yb7vaAWQkHdO14ykm/w7pkE8HXacUgxHCMj2e7vwM15twp58jmzZmnc2zltqoVm8K14HOvzR
	GQ0GQXUn+6+p0MZXyo7ERET2ZSlnMwCHzsFuYAouKZe3OJFKVZUFn7HH/zvLIOKwrFStzOdHcWuLJ
	ur4iOdj/P44gOPKkjfMCWH1+/jLiKfkBHUi8ONFKc3l6YF4WKcJq+//8tEU0M+lWNVmlfI444OC+w
	kBF3OVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTOpM-00HAfC-MG; Sat, 18 Feb 2023 15:08:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTOpJ-00HAeY-AT
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 15:08:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5795360B95;
	Sat, 18 Feb 2023 15:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B55C433D2;
	Sat, 18 Feb 2023 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676732913;
	bh=sPa0pH2g0UXFbG2oKpJGFWnf16edjVekfceTCAy0iO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjCcLFyPtY4eX0lG4GQFGcPX/VgqDZI4nA14qNkjlygE9mU7Fs/8865bB6r+p0mgb
	 27juK2Yn9jCS5V0oTFwHevhsrkcirvCHLmaeOL7mIOQdI//baC3OfrKA1aJStZLrDM
	 ebGqXsKBwPrlsKFCd5YLynJNKZY5/8yv77Q73X7EMEJYxR6aKvL2XK5iBKXJmO6LSk
	 7Xt0u68wcWxDxtQIp9mPjJ44pdzMCNwMHaxUcHE90FrPT81nh145cOFrZddWkILOxS
	 8PmMHsOIDFXnNVC4XGcJCCfpDQwqqQRvqdQftTcDiDeNTd+ilp+ySckjbUgz1o1xhI
	 Y7kOpzhUxztig==
Date: Sat, 18 Feb 2023 15:08:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y/Dp7OSNIAL39DSV@spud>
References: <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
 <Y++B43uCnPQlRYFi@wendy>
 <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
 <Y++q9ln8P3XegqfN@spud>
 <41e4f293-99eb-f157-b4a9-3d00b15f4652@linaro.org>
 <Y/CztNs6laTzttrI@spud>
 <a3217699-7b23-35e6-84b2-fe9e52158481@linaro.org>
MIME-Version: 1.0
In-Reply-To: <a3217699-7b23-35e6-84b2-fe9e52158481@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_070837_490621_C6A71F61 
X-CRM114-Status: GOOD (  34.98  )
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
Content-Type: multipart/mixed; boundary="===============8703810906192797853=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8703810906192797853==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d3e604Nj3oEHKdcd"
Content-Disposition: inline


--d3e604Nj3oEHKdcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2023 at 03:55:25PM +0100, Krzysztof Kozlowski wrote:
> On 18/02/2023 12:17, Conor Dooley wrote:
> > On Sat, Feb 18, 2023 at 11:20:30AM +0100, Krzysztof Kozlowski wrote:

> >>>> That's a long thread, please summarize what you ask. Otherwise I hav=
e no
> >>>> clue what is the question.
> >>>
> >>> Sorry. I tried to preserve the context of the conversation the last t=
ime
> >>> I cropped it so that things would be contained on one email.
> >>>
> >>> For me at least, I am wondering how you convey that out of a list of
> >>> clock inputs (for example a, b, c, d) that two of the clocks are inpu=
ts
> >>> to a mux and it is only required to provide one of the two (say b & c=
).
> >=20
> > You skipped this part which was what I was trying to ask you about.
>=20
> Yeah, I skipped a lot because there was one big thread with a question:
> what do you think? Sorry, I will not dig 8 emails thread to figure out
> which question is to me and which is not...

This was in the cut-down message & a fake scenario to avoid you needing
to understand the full thread.
I kept the context originally so that you would not have to dig out the
thread & provided the fake scenario this time for this very reason.

> > Do you know how to convey this situation, or is it even possible to
> > express those rules?
>=20
> oneOf:
>  - clock-names:
>      minItems: 3
>      items:
>        - a
>        - b
>        - c
>        - d
>  - clock-names:
>      items:
>        - a
>        - b
>        - d
>=20
> or maybe:
>  - clock-names:
>      minItems: 3
>      items:
>        - a
>        - b
>        - enum: [c, d]
>        - d

Thanks for the suggestions. Without actually going and playing with it,
the first of those two looks like it may be the right fit for this
situation, depending on what Hal says the hardware can do.

> >>>> Does the mux works correctly if clock input is not connected? I mean,
> >>>> are you now talking about real hardware or some simplification from =
SW
> >>>> point of view?
> >>>
> >>> I'm coming at this from an angle of "is a StarFive customer going to =
show
> >>> up with a devicetree containing dummy fixed-clocks to satisfy dtbs_ch=
eck
> >>> because they opted to only populate one input to the mux".
> >>> I don't really care about implications for the driver, just about
> >>> whether the hardware allows for inputs to the mux to be left
> >>> un-populated.
> >>
> >> Whether hardware allows - not a question to me.
> >=20
> >> BTW, this is rather question coming from me...
> >=20
> > I don't understand what you mean by this, sorry.
>=20
> You said to a letter addressed to me "whether the hardware allows for
> ...". Why would you ask me about hardware I know nothing about? That was
> my question - I am asking - whether hardware allows it or not. Then
> write bindings depending on that.

There was no question here, instead it was an answer to this question of
yours:
> I mean,
> are you now talking about real hardware or some simplification from SW
> point of view?

In which I was saying I cared about the "real hardware". For obvious
reasons, I wouldn't ask you to explain whether the hardware is capable
of it or not!
Perhaps your original question here was misunderstood.

Thanks for the suggestions,
Conor.


--d3e604Nj3oEHKdcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/Dp2gAKCRB4tDGHoIJi
0k8fAP9J1L6UC9WiKthxZyx3ScL304V9dCIoiKl7RfN3APwx8QEAtNgO+U4h/T3x
XP94Chr0S+Ck/9gT1OENwU5YFD/x2QE=
=O/TG
-----END PGP SIGNATURE-----

--d3e604Nj3oEHKdcd--


--===============8703810906192797853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8703810906192797853==--

