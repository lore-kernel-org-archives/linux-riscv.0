Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C073CC27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvTuc6sZoRW55ztbKk/2Cc0q2zrTK/Vkks1qOVgBzSE=; b=nOA7RwTpr1/gX9bjcNZnOVe29S
	43D0ONHTkzh14eJ/5Ed1JeoFi3dqhBgsV+gFO9AlxXdX2pUl8ZefAckjQw5mr9Cy3EOoVAqfIkpIm
	zMucNYvzrxmRHvxRbhpe6vpPtP98o9v/LtYBtCxVc8WAcFSBG6lDXjCgBYN2HLx35Ev990WHnwq1n
	+mmbYyE02iAl/B4LsBIJHU+QHnvj4bsSguZzGi7d5KxZ0BAs65ho1OWHSpFXTW5CrFaFo+yVc0BRO
	uAMJVqADu7pjQlL4ggkWaBdfwPbTpKqx7iYIts+5nfz57L28nAny8L/XjizB3wxHKZH/2ZAbpKWVc
	iqfMENAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlbE-0000000GyUJ-2z1n;
	Thu, 13 Jun 2024 14:38:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlbB-0000000GyTA-1u8c
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 14:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96AB2CE262E;
	Thu, 13 Jun 2024 14:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA585C2BBFC;
	Thu, 13 Jun 2024 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289522;
	bh=NAAlrhBw8905EbYOUOmpTvwtHyyaFTaE9nUl4deDWHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WT5iNy5eziDZMHQYY5VkVW0WSf/ab41Vu/M/2Ps0gzFEgQ+w+QD6liVWUUSEz/qPp
	 gl7Y/x1kH2dcpDsLxtpyXnaup5D7Et20HSibtcQohhawFwHJaXMwxdEIAWQlxWabU9
	 eEa1UG/7KUP7wXkhc72AN/5mp2quzFtXGHEPuYr363BmeZIiW/Uk8NCoaoed7EYUpk
	 O7NP3rVRp8XJEPMUP2nZWeu590BkqE9LvubrQ2R3lLKdGzUf1kjyeQcZQsUWkZpx0v
	 G61ELzeYZOdui/dkN4Ewj6R+17+X9sOz3kANdEnlFgf1Kzc3xKwcPSPkEyiuYkn1v2
	 WZfecjyUpbH9w==
Date: Thu, 13 Jun 2024 15:38:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 08/13] riscv: Add xtheadvector instruction definitions
Message-ID: <20240613-skipper-datebook-ac170f7a9ad5@spud>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
 <20240610-xtheadvector-v2-8-97a48613ad64@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240610-xtheadvector-v2-8-97a48613ad64@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_073845_694197_5EBDB078 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: multipart/mixed; boundary="===============5208026775262561042=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5208026775262561042==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sqinyBkDFO4zELOw"
Content-Disposition: inline


--sqinyBkDFO4zELOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 03:56:45PM -0700, Charlie Jenkins wrote:
> xtheadvector uses different encodings than standard vector for
> vsetvli and vector loads/stores. Write the instruction formats to be
> used in assembly code.
>=20
> Co-developed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Where did Heiko's signoff go?

--sqinyBkDFO4zELOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsEawAKCRB4tDGHoIJi
0p2LAQCpFlZN+A/TCImkor3h1aTtu5LXLeAEwNXlTj5csNSu4gD9GhkXiH2Q4/EJ
ItTvEGIUQODpFkCmvLkOB3rllIA5ewQ=
=OscO
-----END PGP SIGNATURE-----

--sqinyBkDFO4zELOw--


--===============5208026775262561042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5208026775262561042==--

