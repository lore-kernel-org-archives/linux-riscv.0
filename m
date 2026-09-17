Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49405C982D6
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/4GPf5RN31Ji5+DAuoG2yht1QnoIe6N/u6kH1QruN0=; b=RrWF6PH+YtColHDYA8+dBoLn1/
	HKK/cNmpTVS1T08Aod3w1HvmzsZbLFNP1XSnT5DM20gK139FPQlarBou6RTV+UIKmDg9otFRvL1NR
	Vw79GcEeOb3qr0XYIwxw7zb4QGvJphSUMxZ3gAZRT20dSNI937RvOTNoslTlFV1pYjBXkK7POZTDN
	/8ilO+LTr7v9g9bFnjqvndeD+wZGmGGL2h8yxPJ9+FmbJPDa+B1BlZL5noIWmYB3ZrTwdR15syMNK
	j/9G7/Qj80fGT63SRVQEI4L83GEaKVN6nQ8i0okbPEcKoPZ5/wNekSpciH4Fm+Z9d6g/FRzyThtB4
	+/rPFRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DZW-0000000BcJh-3T1u;
	Thu, 17 Sep 2026 14:58:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DZU-0000000BcJ3-0dyH;
	Thu, 17 Sep 2026 14:58:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96EA9403C5;
	Thu, 17 Sep 2026 14:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860661F000FF;
	Thu, 17 Sep 2026 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789657123;
	bh=Pf5LWvewJuTGwbuVcqvqZ/vgiaSwk27Npsb0/AK2Dn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqQA5MjqLMIkvuYS4AGF0Rd4vtXoWxYqlWUBftO/79PmF4lvyTsgfLnsB8vSGifvH
	 +OYVr89bgdfTyiqlagk1US7i3L8yyMYnAS1dDKXVMJsT2BIEG1dgT+viTahJ1rAIA3
	 TYcHiUlAxxS26oQLU2l1i/6ZqW4ZIwHDk6IczaQxVj5A/l9fr91Z4YBGtIfRnX1M5N
	 0V0wbAfTG9zSthlEuAVPvpTZBief1uzxA7Ugpd4Bg2kCBxj37nSGgk/eOAdmEZiafi
	 RjYqqpwuTXxHV6CAJkC47g+Uezbe4bbAWp9UX+W/76vyliPo6Hxh2LB7yNpw8ldfTh
	 tHT+i1Hf2qunA==
Date: Thu, 17 Sep 2026 15:58:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Ulf Hansson <ulfh@kernel.org>, Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>, Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	Atish Patra <atishp@rivosinc.com>, Shawn Guo <shawn.guo@linaro.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Okan Sahin <Okan.Sahin@analog.com>, devicetree@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
	linux-rtc@vger.kernel.org, Ricard Wanderlof <ricardw@axis.com>,
	patches@opensource.cirrus.com, Lukas Wunner <lukas@wunner.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Eugen Hristev <ehristev@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux@analog.com, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Expand flow lists to block lists
Message-ID: <1c1d5c42-0e0e-4dcd-ae73-bfdd8f586eba@sirena.org.uk>
References: <20260917144028.459053-1-matyasdaniel006@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260917144028.459053-1-matyasdaniel006@gmail.com>
X-Cookie: Whip it, whip it good!
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
Content-Type: multipart/mixed; boundary="===============6891542565333395557=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6891542565333395557==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T1VRYF8LKqrA2gy5"
Content-Disposition: inline


--T1VRYF8LKqrA2gy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 05:40:28PM +0300, Daniel Matyas wrote:
> Running dt_bindings_check returned:
> [error] string value is redundantly quoted with any quotes (quoted-string=
s)
>=20
> The files used quotation marks in flow lists because the strings had
> commas and these commas were interpreted as separators. Convert flow
> style lists to block style lists, so that there is no problems with the
> commas.

Acked-by: Mark Brown <broonie@kernel.org>

--T1VRYF8LKqrA2gy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsABYACgkQJNaLcl1U
h9DUEgf+KPueghXAo1OPJ9ovWXvqrLAw+P7bHJYXzsGs7WHDWdxwhOYO2uR6gAfg
8ZLb9ylPNNZ9AHlpFJwRURFngp67uFQIhifh/bIF3gaKwbwL86mvOBPF3wPpmgxl
1yM9fToilQFgliR8Psbmzp8M7JNF2cjGI8/u+jxSwIRan1J4OsJQF53lS4dDfQdS
UBJH8NzSkebpER/lT+MemvfK6Tu9r+cdcZWtOq4gW/45KhDrRJLolCArFGD0Lb41
rtqnAjBP2boqFZt7lCaTVN7dCODYgk6d0f8gVbeTBSEHwiJIRhp33VGLWnzSopjb
8cth11XidrgPdnhuks7ie7L3odf4/Q==
=kDOk
-----END PGP SIGNATURE-----

--T1VRYF8LKqrA2gy5--


--===============6891542565333395557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6891542565333395557==--

