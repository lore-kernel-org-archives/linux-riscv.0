Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB54AC3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezNaYDtoRFSzwkXWxIW9PZXa2t5CuUm9jEF3Mcy59OQ=; b=kdNix6R7IJI4zb9pM6kSo3OW+I
	wE/7t+xx7E8wFUNm6yaqtwqqJbdVBvQUlgOMvX5G9f4TMmaKE5P9N8qtLHnumBYWfwJXn3EUFxLLD
	j9Lj7AtBtwfvd7jX4t1ntZOOCEATWfq+Ut+BRyrLYIuFg9bu8oT2Pv9L/2dehg5MFGDlvSIXIxnLx
	5bRipazh0pTLfIk/xiMro46hQfUoAj1S/0j1GZiG9gguPCi8jTrmCgZ66VlWLbptM9DxR+PLmJ9mw
	KFYn+zhqn5C7fcfFL98dpWcvs5F8RgztVHpjFzzSccmDxwcJ5xg8WIdWfRutiKUZCOPFJxJ+IH1q4
	5CpsH+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWczy-0000000FbAk-10MC;
	Wed, 24 Jul 2024 14:29:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWczu-0000000Fb9H-36Z9
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 14:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11FBE611F6;
	Wed, 24 Jul 2024 14:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F22C32781;
	Wed, 24 Jul 2024 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721831381;
	bh=A92SMp5L8vHye59S+gIpJ3oRDF6rjc+krm1iL8GTSdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vsbrm+ARHzxUB9HwkUDAiki6u1+OirdVz3B5Wyd8s/xnM7KPb20rmiFciMjn6xLo0
	 LUbBmQ/fLjOJB4Hg8N8J9DBNehqWGvfI6BpvBMn3TQkedh96UlfQ4ifXnk7mV356d+
	 3SN3du/McYKnXzJa4uVoV8ylwsOVZGkZD2AMOlP0SGdgmb7JJscB5gd1cI2qbFZp4S
	 5mtaomHVMJt/7GUIV6xEJclBJVIPqz2Kk/gqOl+449TvOG2gm8HegbCkjj+2VgnK3f
	 lI1gbpbd63fgCSiHwfRgePmG+PZmTfqwZB4YVnFMUOqOGYJrq5UedCACMxGkWTY3Xu
	 dZJKwTMnY4INQ==
Date: Wed, 24 Jul 2024 15:29:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 1/6] dt-bindings: gpio: fix microchip,mpfs-gpio
 interrupt descriptions
Message-ID: <20240724-oasis-emerald-a4253b6e73cb@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-trash-issuing-e2bdd55b764e@wendy>
 <b07538f3-44e4-4d98-b64d-0d15428e720f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b07538f3-44e4-4d98-b64d-0d15428e720f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_072942_922861_256584E1 
X-CRM114-Status: GOOD (  25.93  )
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
Content-Type: multipart/mixed; boundary="===============0018230985654776533=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0018230985654776533==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5uHEoWlbGxcUMhZB"
Content-Disposition: inline


--5uHEoWlbGxcUMhZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 03:25:38PM +0200, Krzysztof Kozlowski wrote:
> On 23/07/2024 13:27, Conor Dooley wrote:
> > The microchip,mpfs-gpio binding suffered greatly due to being written
> > with a narrow minded view of the controller, and the interrupt bits
> > ended up incorrect. It was mistakenly assumed that the interrupt
> > configuration was set by platform firmware, based on the FPGA
> > configuration, and that the GPIO DT nodes were the only way to really
> > communicate interrupt configuration to software.
> >=20
> > Instead, the mux should be a device in its own right, and the GPIO
> > controllers should be connected to it, rather than to the PLIC.
> > Now that a binding exists for that mux, try to fix the misconceptions
> > in the GPIO controller binding.
> >=20
> > Firstly, it's not possible for this controller to have fewer than 14
> > GPIOs, and thus 14 interrupts also. There are three controllers, with
> > 14, 24 & 32 GPIOs each.
> >=20
> > The example is wacky too - it follows from the incorrect understanding
> > that the GPIO controllers are connected to the PLIC directly. They are
> > not however, with a mux sitting in between. Update the example to use
> > the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
> > the example - rather than the strange looking, repeated <53>.
> >=20
>=20
> You make ngpios required, which could be an ABI break except that there
> is no Linux user for this, so there is no ABI break, right? If so, would
> be nice to mention it. Rest looks good:

No upstream user at least, and I don't believe that there are any
non-linux projects using the GPIO controllers via DT. I could, I
suppose, not make it required and use 32 as a default - but that could
cause problems with existing devicetrees where all 3 controllers omitted
the property, despite having differing numbers of GPIOs.

Now that I look again, the driver actually doesn't enforce the presence
of the property and I think it should fail to probe if not present.

--5uHEoWlbGxcUMhZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqEP0AAKCRB4tDGHoIJi
0ryZAQDWgZQTcAZNOZjGXc3UbCVdXHcLhMvUltM54MOZgf2zbQD/YvX+QIIqkjKF
LEjNQ6dPuMCwh7g8e/IKFvQP9VkqkQo=
=R7Eb
-----END PGP SIGNATURE-----

--5uHEoWlbGxcUMhZB--


--===============0018230985654776533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0018230985654776533==--

