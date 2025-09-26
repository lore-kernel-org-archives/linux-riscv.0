Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E30CAC5AE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTSJbEzScQgjNShkZdKH5gUAPDBMQzyCyUOQ1dMfzlU=; b=vDA0nHSSq8T4jyQ+z5pt6scHun
	HbQYch/e7TyiHPgtXWm/cntc/iMV+cRtH+UTbtqkOue6UoxsbB3xxV1aKQlpYLnQJExhFFRwkl3kX
	K4kvZ54A1EGFKbkXfD0bYm6lBbM+mScqSCV59jOoiUDYzsQ9IvaeWw33dnU1eTXNvKQbvkQfXtfFH
	9jIehwvwIZCCYi14qI0hMXI+gFDdjoCuzZ8hiTTQXMqmx+wTCdncckST6ictb2rrvacerADWmH/ZH
	/oqxHKSZXoTqHsdnFcDnryAj1RbofV5tML3QC8LlrvHphjHuy/j1yFhTqDciMiwdRz6gNqdj69Mbg
	vyDflFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26VH-00000000k73-49Ib;
	Fri, 26 Sep 2025 11:20:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26VG-00000000k4b-1EEv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 11:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B74BD61D2A;
	Fri, 26 Sep 2025 11:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FDAC4CEF4;
	Fri, 26 Sep 2025 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758885641;
	bh=c7XM5Cp6e5ot+aV345F+WYOKm/Hfl/9T18HNuk9qmEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpxeCM8Eb8U82a7Pj0UhpWw/5khoG5JXgSS8+XZqhYG1hfBzVXAdhv7KP9Ycl5uTX
	 h9fTo8/VU0QClfOcacO19w8jjiCoXOHTnsSvLumAcNbd2TJOAlDQAtAQv+4nIlDcVG
	 3JDmrXwxYSplJZUeqt4rx2SE3bfPjfL21QIyGRQ5fhKsRleIw6WMfzPSFGD7p4COVh
	 4u0cJnHKcHZwpEf+8lwF0J181QauW8LIRAYUg2b5mhXYmdD5iqFb5sVEk3Cn2KdmDg
	 u3ZF3T7fIwHfxW47vjwmF5n5FDmrX5gMn3CFW6WHt1jdt3nUKrkrUfNj3p8g4TBbyG
	 X7BHMn/zXdQ4w==
Date: Fri, 26 Sep 2025 12:20:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril.Jean@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: mpfs: fix setting gpio direction to output
Message-ID: <20250926-outsmart-galvanize-ac2078557e57@spud>
References: <20250925-boogieman-carrot-82989ff75d10@spud>
 <175888059620.38209.6546087887696517521.b4-ty@linaro.org>
MIME-Version: 1.0
In-Reply-To: <175888059620.38209.6546087887696517521.b4-ty@linaro.org>
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
Content-Type: multipart/mixed; boundary="===============3214258971284099921=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3214258971284099921==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hr2UoKeytqTZDB2w"
Content-Disposition: inline


--Hr2UoKeytqTZDB2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 11:57:30AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
>=20
> On Thu, 25 Sep 2025 16:39:18 +0100, Conor Dooley wrote:
> > mpfs_gpio_direction_output() actually sets the line to input mode.
> > Use the correct register settings for output mode so that this function
> > actually works as intended.
> >=20
> > This was a copy-paste mistake made when converting to regmap during the
> > driver submission process. It went unnoticed because my test for output
> > mode is toggling LEDs on an Icicle kit which functions with the
> > incorrect code. The internal reporter has yet to test the patch, but on
> > their system the incorrect setting may be the reason for failures to
> > drive the GPIO lines on the BeagleV-fire board.
> >=20
> > [...]
>=20
> I'm about to send my last PR with fixes for v6.17 and this hasn't been
> in next even for a day so let me queue this for v6.18 and it will get
> backported once it's upstream next week.


Ye, that's not a problem. It's an "always been broken" thing, so no real
rush. Thanks!

--Hr2UoKeytqTZDB2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNZ3BQAKCRB4tDGHoIJi
0vdVAQC450FuGTZX1Fl8Vjzn4qKrLcWlwaBPXJqzYkuFW8cdMQEAvIN/tLEIUbCa
qKHyddxOB6gipmSkhMm4baDJmDiBCwo=
=sDAR
-----END PGP SIGNATURE-----

--Hr2UoKeytqTZDB2w--


--===============3214258971284099921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3214258971284099921==--

