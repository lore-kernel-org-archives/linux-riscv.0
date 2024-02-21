Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55660C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 19:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buYxL9qZrxGPt7k9LGQvHlgTGlnuniZdsgY1ufAXLaY=; b=3mNuVtp+WcbwOYubOKUvDXBmx/
	dI9vIONYHMiNlvJkUkh93ccdQxzuZcBte13z15gcqY4I0SBhdo65C+Brfxl2puekKzjEhZQ8OiSoz
	aigGQx9C28o9Xcwuzf0Zxb6ZkOAq3cDY0DbKcUx+h5diPLMDjvaTw1zjKwRfZFc3nk3VJMA4hjjHX
	PVIQj9lOsGc6S9V77c3m3yOmsmMz98bzQOlIqPdXtaptaxFmyK4IlvXOLtxihD2wTYBIV+3pSGt4z
	NSdY7loH9SjGC3DUin9DA41iEwqGk4vS9UiWqheWU5x9rRYWqfb4DmPXQKMuvqk69Y7Ry0NvoC/ZP
	/9TnPRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsR6-00000002JD3-0VJN;
	Wed, 21 Feb 2024 19:39:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsR3-00000002JCe-1bMQ
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 19:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1649CE11C4;
	Wed, 21 Feb 2024 19:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDFFC433F1;
	Wed, 21 Feb 2024 19:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708544355;
	bh=jpjoy9Fsa6//vmMr82XAl99quOukD/lr0ooCOOk0MCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QV4kJ7oSZqHBFzHeaGSRz0SBLAECwgsglXFHHqcnwn9fttT/26VU2chgTducZEQOB
	 yv94ChGVuehslh8yjnBL2gnt4qojlWuUXEeJuK3Ujbjj5GnK9r3wwgxjRmzutpgDn0
	 E6hcXqO2rnXU+NJsU70UXVTG25Yv1veO26XlxxlYToKrIzYUmsiDCy7wsZMzO5L1Xo
	 QKQjjY30FHe65H4EyDkjl0LngoPhF2nr0reQBR3bBMCxHeBTq9kRFwDiSy9Pi5mJp4
	 PSgyM28KNCZg7VhD6JKkNcy8hc+9b82m2clGcP2y3LYiK+z1yPOKH6prZoFSCcc07b
	 0rPttK8lRbXtQ==
Date: Wed, 21 Feb 2024 19:39:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alex Soo <yuklin.soo@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v2 1/6] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Message-ID: <20240221-overstep-degrading-f0aec67f1221@spud>
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com>
 <20240220064246.467216-2-yuklin.soo@starfivetech.com>
 <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org>
 <20240220-bottling-reverence-e0ee08f48ccc@spud>
 <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_113917_800272_7D973BDA 
X-CRM114-Status: GOOD (  19.98  )
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
Content-Type: multipart/mixed; boundary="===============8550437319104043834=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8550437319104043834==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oW1W+eroT4GxNUCm"
Content-Disposition: inline


--oW1W+eroT4GxNUCm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 08:24:26AM +0100, Krzysztof Kozlowski wrote:
> On 20/02/2024 20:10, Conor Dooley wrote:
> > On Tue, Feb 20, 2024 at 09:11:43AM +0100, Krzysztof Kozlowski wrote:
> >> On 20/02/2024 07:42, Alex Soo wrote:
> >>> Add documentation and header file for JH8100 pinctrl driver.
> >>>
> >>> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> >>> ---
> >>
> >>
> >> RFC? Why isn't this patch ready for review?
> >=20
> > The TL;DR is that Emil and I didn't want to apply the dts patches to
> > support a platform that hadn't actually been taped out yet.=20
> > For an SoC in that state, at least the bindings for, clock and pinctrl
> > could be subject to changes before tapeou. I think putting RFC on those
> > patches is a good idea, but of course the rationale should be mentioned.
>=20
> That would be useful information. We also could mark some bindings
> unstable and accept breaking ABI under certain conditions, like that it
> is early work without users for long time.

I don't want to discourage a vendor that's clearly doing a good job of
working on things before they've even taped things out, which is why I
suggested sending clocks/pinctrl as RFC until things are finalised.
I'm not sure what a good way to mention this in the bindings would be,
particularly for clock/pinctrl definitions where things could change
"behind the back" of a user - I'm thinking things like U-Boot here.

--oW1W+eroT4GxNUCm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdZRXAAKCRB4tDGHoIJi
0pHsAPsEyp2tYcjX2nSqPkPh9K+5WEkawzPSKZ3xZfBdBTNjeAEA2DQTPxP4sxi5
G4gYhkpSkY1LV81h9yz8W2TnAykKewY=
=Lo+3
-----END PGP SIGNATURE-----

--oW1W+eroT4GxNUCm--


--===============8550437319104043834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8550437319104043834==--

