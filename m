Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D4DC3DA61
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOoYPHiwh3cp4npJb0YA9OZL83L3bclNqVeNfTeuSP8=; b=LrUA/591a+8Y5QtrCXX5e3jeIn
	OBbTHeprwR76pklA9PrsvM0YsztDkCHopHhh0FZsDxNkNXb1pTIK5BA8xb90ObBEDXoqN6duS2i/a
	bR3yVflb42XzuS9CE3nja+YAX3SfZFUdvjrxCCCasCS/Tx0EqDzXKYs2flrAEhwuR+Jz097abBv5J
	iRol3Pnr2c/GBVR+EgfN+G28BlTC8wRQyHFidbfdkAM9V0ervRbUXLG5J34yuRTUkeAzZAhFxwpQq
	wVJ8vOA8AVrVKKdAx3WykJKOzZ/fIv6YxRMY+mHhCiFdaeq2coCwNvKKXVhUC6fKjkQIXVCPlbLVU
	cT2o90BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcsZ-0000000FZe6-3nOO;
	Wed, 24 Jul 2024 14:22:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcsX-0000000FZd4-2cdS
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 14:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA24461227;
	Wed, 24 Jul 2024 14:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC0AC32782;
	Wed, 24 Jul 2024 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721830924;
	bh=AUsCJZjVUYxs9p33RAVsq2J5Rd1jdLxKU8buKkg/hjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0//d6Tmxg1Qi1cnGHE8rrNgHpi0C8MVyaKTQs3X11aT8r/i6btuRH9J+PXfl37Wd
	 gJwk/X5QtjKGvf7XvCEzJLliXXhJSdXKVqxS1RGspj4R9xhGXd/MaXRkwi+DlHE9PJ
	 1FRbKewQqK0qqOEyz0BAwVDFMJzM0EMofrsKIuzlvpY+eGBpeScaZ657rg3lnh0NF7
	 Nf3KpqKrwzK2+uaF7eUDkXs0l3/2iYJDl+9M8zNcp0WaApd+jDUahqIghMwYMEuNC3
	 VUKYsshBaWz+jA+v+PrYG7ZLq5IZEpputEEsXc7nX9M5tX9naItMd1IjIDzTOadDIL
	 afOEoOHdp5/LQ==
Date: Wed, 24 Jul 2024 15:21:59 +0100
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
Subject: Re: [RFC v7 2/6] dt-bindings: interrupt-controller: document
 PolarFire SoC's gpio interrupt mux
Message-ID: <20240724-playable-chomp-48e45cef1f2e@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-uncouple-enforcer-7c48e4a4fefe@wendy>
 <3f732acc-6ed0-45f0-a2d6-ed8506b0fd6f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <3f732acc-6ed0-45f0-a2d6-ed8506b0fd6f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_072205_778787_1EFA0457 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: multipart/mixed; boundary="===============0475161111970091375=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0475161111970091375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aeYLJ8sZIu+qAi+O"
Content-Disposition: inline


--aeYLJ8sZIu+qAi+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 03:27:21PM +0200, Krzysztof Kozlowski wrote:

> > +examples:
> > +  - |
> > +    irqmux: interrupt-controller@20002054 {
> > +        compatible =3D "microchip,mpfs-gpio-irq-mux";
> > +        reg =3D <0x20002054 0x4>;
> > +        interrupt-parent =3D <&plic>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <1>;
> > +        status =3D "okay";
>=20
> Drop status

And the label too.

--aeYLJ8sZIu+qAi+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqEOBwAKCRB4tDGHoIJi
0jrkAQCIt+vRgxHnXwPt1M24O8vETAkSyxg1s4KtuFkdeaWcbwEA/lIbod0QoU3l
ny4OGR9vM076yhwZlwPmOt7BQsSH3gc=
=+jN8
-----END PGP SIGNATURE-----

--aeYLJ8sZIu+qAi+O--


--===============0475161111970091375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0475161111970091375==--

