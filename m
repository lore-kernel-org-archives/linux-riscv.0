Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9B1C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlpZe3nm7VJubjef+/gUfBnK+Zu3LVlrlD86eeMjGQM=; b=FCmvySyw1Ttu5DaXss3NE20q2Z
	NGP9P7mjiW4W8HasWxHGbd0rl60K7EYgsfrnxFAUJ5liDKcO2qWnAZkZtS28w5QEquSFGz22RDOpi
	AvDhvlaWq2N2I+XqcOWeHlgoVumfFUfsS1807cXkaesPkQaxhmwP6qCX6lzFZ/WjmaBI7/rjusBoH
	/tBYtdvvHMLHrvYkh65Rizq770pRjGp2ZPFn4ZokdX4kFjgyP6n5vxgx1T2vfPw7fKhBg3s42E8S6
	Y5OHkeKWk/5t7yCE6rg3mRSd5AQZ0GjNymubWjLcd9Wemd60zXh43+h6cvBVt+E1oGKsrNpqbTQvd
	TvWuBxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWDF-0096Sx-Dv; Tue, 21 Feb 2023 17:13:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWDC-0096SI-Ax
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 17:13:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B29A5B80EF4;
	Tue, 21 Feb 2023 17:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0598AC433EF;
	Tue, 21 Feb 2023 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676999631;
	bh=UTWxdc56Bg+YO8XilIbhRusXF7346//1k4aqaSaRM1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hP96ZN9UTZzYGWST0dk16C5FXdoBfma6+G541tCU9g3TeAa/+C3jXPvTUmrkL0JRP
	 jvDubqdRNPKR9UzaB5eeRgyRV48363T5k/9dGI63InzzBdoc5lcvzeCxlJt6Cuic8u
	 QgB4k8wmrEimyeZy3WiCAxO5F8Zbz95yucNyhtpvSb3w+hs3M3qMQfeWxAdO8B+DwA
	 w4CUO8CKCuJ7hEPg5kZYwGQS7YQr8QcYVSXgHRWhSD/tRA7u43xcIYOyMD6HocuuvU
	 4/5fu9X7jBAT+6388bZfC4zRc4q/2fFiMAoSD/VGzyLbnhTwQTCysKeziPxmCC9jKH
	 z16n1MbpmQJGQ==
Date: Tue, 21 Feb 2023 17:13:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/19] reset: starfive: Extract the common JH71X0
 reset code
Message-ID: <Y/T7yVD1mHLxoQ1a@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-7-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-7-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_091354_538757_DF098301 
X-CRM114-Status: GOOD (  11.20  )
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
Content-Type: multipart/mixed; boundary="===============4861029173837006759=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4861029173837006759==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aqcjb486AUxWSCDg"
Content-Disposition: inline


--aqcjb486AUxWSCDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:46:32AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Extract the common JH71X0 reset code for reusing them to
> support JH7110 SoC.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Split out makes it easier to follow, thanks.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--aqcjb486AUxWSCDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/T7yQAKCRB4tDGHoIJi
0mzCAQCzNX7ciETyNNPQvAwhWFyXvywt5DtH5jI3CcjZGeLMvgEAqU7NT1fMnV3w
9ZxpB97C+S6RTgF9h6k1xLAmeb9rswA=
=XwAV
-----END PGP SIGNATURE-----

--aqcjb486AUxWSCDg--


--===============4861029173837006759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4861029173837006759==--

