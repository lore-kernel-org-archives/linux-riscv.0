Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBA5C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkCCMLKysEkGOBnHMP3B/A/ym2ql9iIJc+hBpi2dZHQ=; b=Q07WOwfGNT7IzG0P+7xvppEXIi
	1FJds2Hn4r3fKR8SFF/SSgv2s5PKZSsA/tzxYd1zUhdnFqZj0rmy2U9bsmTDdD3c1kAuC6P7KGbov
	nRyBiqjp+iELHCx1f9EVAkubTw/Z3ay3kkzwSW9NnJ99d0Z0A9PnbC9XFleJ61/qquBIBxGwOHPv1
	afFjDU//CZ0nVNrhyzsjENumSH/bS8J+DmtX1774EJaT96jq7Xo6DLk0h6VrA7FOllRzLtUtw97WY
	2w7dR2r4ftN1Gs9GT72hkQt5NjpDdePO7UlTbsj1XK+9DAY/Ta059rKzCaWnd8EGeX/1CKLEAAlUX
	rgX72dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paKjz-00BWcQ-Fw; Thu, 09 Mar 2023 18:11:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paKjw-00BWby-Nr
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 18:11:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EB1A61CB8;
	Thu,  9 Mar 2023 18:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184F5C433D2;
	Thu,  9 Mar 2023 18:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678385503;
	bh=N6Wj3AQY5fxCb5ci7bzQ52zTXB3Nk+OsjegljZXqjpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRS4L/VR71sl4K8yevfuM0ECGp9XVDoFrcir8SSeH5FHo0z+6WWcTlBJiw9a/Tljh
	 TEj8Lou6Bi9L1VRLZK6MVxEVno1MV1rR0vcNHrMvBJeeHJMNZuf3Q4Va5gVTTC6fUa
	 hQgD61WU2VjKA726UIjFqRRisnwPM/Bf8eKhL6Gcc1jLACbQp4RWFVXj30902L34FX
	 trN+WOR5hMBvdbYgWFZj31extQgavPplIP0zaf7dNEUMWDbbxG3wmhgsZ8wRIUVHIK
	 9BfWG4TUPrcHEMhqS+fDg6csHSpZe2xtkHJBtKlEOeOg34c45ap7kcNNNmr5hIoPox
	 bDv7I6E0L1icw==
Date: Thu, 9 Mar 2023 18:11:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on
 clock driver
Message-ID: <032f9254-482a-4b97-8e7e-4afb1f78eb21@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-13-hal.feng@starfivetech.com>
 <CAJM55Z8H4qmy_BiD0SHW-w5ifzhzokdO-QxpUUz9aeUd+htrZg@mail.gmail.com>
 <8c30220a-abef-7518-cb44-abcea91408e2@starfivetech.com>
 <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
 <CAJM55Z9YGjD+1haWcXEZNkHnWNRZckdBmTTykTt7QZV_LUohgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9YGjD+1haWcXEZNkHnWNRZckdBmTTykTt7QZV_LUohgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_101144_890783_713FDAA8 
X-CRM114-Status: GOOD (  23.05  )
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
Content-Type: multipart/mixed; boundary="===============7959311580612530079=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7959311580612530079==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BsPusMLI7B8oDAmr"
Content-Disposition: inline


--BsPusMLI7B8oDAmr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 03:06:13PM +0100, Emil Renner Berthing wrote:
>  On Thu, 9 Mar 2023 at 10:44, Hal Feng <hal.feng@starfivetech.com> wrote:

> > The AON clock driver provides clocks for gmac0 which is used frequently.
> > So I think it would be more convenient if we set "default y" here.

> You're right that if we default y for the ethernet driver then the aon
> clock/reset should also default y. Personally I don't think we should
> default y for every ethernet driver that might be used on some
> supported risc-v platform, but I see now that
> arch/riscv/config/defconfig already contains CONFIG_MACB=3Dy,
> CONFIG_E1000E=3Dy, CONFIG_R8169=3Dy and CONFIG_MICROSEMI_PHY=3Dy, so maybe
> I'm wrong or just too late.

The defconfig really needs a good bit of cleanup (one of the many things
that I am telling myself I will do as part of kconfig.socs cleanup).

w.r.t defconfig Palmer said it pretty well earlier on IRC: "defconfig
should be useful for kernel devs, which means it should boot on the
common dev boards".

IMO, that means enough to boot an initramfs and poke the thing to see
that it is alive, so: ethernet & serial, and the clocks/resets/pinctrl
stuff required to get those going can all be set to y in defconfig.

In the driver Kconfig entries, to me, it's more or less the same.
I guess, answer the question "Will your customer's board get to the
point where it can load a module ithout building this into the kernel?".
If the answer to that question is yes, then don't make it default y.

That's my =E2=82=AC0.02!

--BsPusMLI7B8oDAmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAohWQAKCRB4tDGHoIJi
0v/JAP94ulofNy+GppyQaKtW1Xy2+zpJyXSF00negiy+E6OD1AEA5XbUBFuifxqA
NFwySuVpSd4k8Gw3ygG1xTBXYFvBsAg=
=EJc4
-----END PGP SIGNATURE-----

--BsPusMLI7B8oDAmr--


--===============7959311580612530079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7959311580612530079==--

