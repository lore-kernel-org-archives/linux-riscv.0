Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF25606A332
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zaclZcLg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2haV1jf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hO8zWN/oXHycVrqbLNvSjod2V2AVF5y+6R5dE0zFpdE=; b=zaclZcLgjP1t2DVEMcH77bM36i
	OJhH7HuEO1W8u/zdjppAFnao+0TQYBdCaGpCetDJwSlQAZKQByL8tqKpe0a2kwAfaR7kwGmJ7LtMV
	PgDvev61Knbp3P5dz2fxpEV6ZgkP72NnwH4fNLZh3vcghMKZ0KV07RpdSRsHt1JgQLH3c43ID7KxJ
	QYguszvo90eSIbWz2yxiZN4jXoftIIkivt7MeAYlT0U7VY/TvlOWMcBUs8ZcS8LpT1z7elzuBaOLm
	xnnTnhcLzOF4fbn0MB3QJp06KX1d6OwbYAhazpeJLawneVdSPHhwkwOAB1ieu0WfVdN+/LeU0HNgI
	CzC4aqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO9l-0000000DJQT-3iYG;
	Fri, 06 Nov 2026 17:55:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO9k-0000000DJPt-0SZR;
	Fri, 06 Nov 2026 17:55:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 629A74062E;
	Fri,  6 Nov 2026 17:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27191F0089F;
	Fri,  6 Nov 2026 17:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987715;
	bh=Slw7IzCaqPRYPs5qP8w8RJF2WXLJYullyRST6UZQnck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d2haV1jfgqlnTB4aD+TrBInUFDaA6U7aLIycswQOy7Lb+8zKDUvBJoACRr2teqFoT
	 q0WSvqwcD7aNLSd7Hr4T7k1ZCA+liji7NGYjfFCsu3bmh67LnpXiIe/++epPs9Eok7
	 VPgvJn/Zri3XwYgI0quDILWRiyCkSaIgZH2HJ+qKmgoJHvFxiHRmCP9S6EVlgEETbD
	 Z1bEFtMMXxeHJGezK6yNwIPvpPHbn7FmCvYu3uvZ9txCDCkKI0XhxHoh171kYtrFnk
	 ZWgly+CyYxfVEiUNABjpm5DW6YrcU813UvNROm6VVH4Uily+CxJA4WG6/qGc0u9Ywi
	 x72KsIaWH7+pQ==
Date: Fri, 6 Nov 2026 17:55:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH RFC v3 06/17] dt-bindings: pinctrl: add Zhihe A210 pin
 controller
Message-ID: <20261106-either-smudge-c1b21b4a81cb@spud>
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn>
 <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
 <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, gaohan@iscas.ac.cn, Han Gao <rabenda.cn@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============3746562656492672655=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3746562656492672655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tpStlpzQjO9g692"
Content-Disposition: inline

--3tpStlpzQjO9g692
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:14:27PM +0100, Linus Walleij wrote:
> On Mon, Nov 2, 2026 at 8:45=E2=80=AFPM Han Gao via B4 Relay
> <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>=20
> > From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> >
> > Add a binding for the AON, PERI1 and PERI2 pad controllers of the Zhihe
> > A210. Every pad is muxed and configured on its own. Functions of the sa=
me
> > kind share one name unless a pad can select more than one instance of
> > them, as with the UARTs.
> >
> > Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>=20
> This LGTM, just waiting for a non-RFC version and DT bindings review.

This version seems okay, but I am also waiting for a non-RFC version to
ack.
I think stuff like pinctrl, that has no dependency on whether or not
SCMI is used, should be split off into standalone series.

Cheers,
Conor.

--3tpStlpzQjO9g692
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4UeQAKCRB4tDGHoIJi
0nGqAQD4uPonsKu1Nn5d2AXZzXklvHVCALSr5hp97wCKf60/IwD9FQ/JcPhJXo+G
8lVmOiMQ/Gmo0P47KaBRYh3sfdQOqgY=
=9UUN
-----END PGP SIGNATURE-----

--3tpStlpzQjO9g692--


--===============3746562656492672655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3746562656492672655==--

