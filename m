Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B313C00528
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AZrvClaMcKWLnlefAo3RfgyC+yU6qY3uCcP/WJzuU4=; b=y/Y+b00Jtp8vyoNA5gjzUXt65E
	OS/E2gEjKv+BJolPD2NufXDrz1IddJ7gb5RV2AmxWlQTb10HHFtEl+UtZBGyXOYT/DdHm9XOeDlLE
	B8y0kcYFnhlAPZFaC7yTPjvdX59Rh9CpkBLaurOYsumruU9tgQE9uhUiTleg3xhulPQL0P/enbYSw
	69hXWUIAGLoZLlU2DkMCoWYVfY6mPmR4maVFa4WC6BioMoFidclhP26adMQt+Q3nzhCwnmqzJYoOa
	YmjhCojLPyGybB5xtp1XTm08ykXcnztb52bbBesjTAsY1gmDQyww/bjy4qeLXHKSWUUvRSLPqYK1g
	1GKw8u0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzUA-0054c5-3C;
	Mon, 24 Jul 2023 17:36:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzU8-0054bb-23
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 17:36:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 227EF61312;
	Mon, 24 Jul 2023 17:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD88C433C7;
	Mon, 24 Jul 2023 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690220199;
	bh=wfpRK3iqU2vDNIEW0PQwmrw2Jp5S1c6RnHqkDJom1Ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1rzgNwRtzvQW44fcg+df3m1ltuUiQQvjTUO2Fqx9mZLulXrshPjMPxCu7zcphCNL
	 x27RWih7M3Nt0aNaaKbEr+v1ZZallVuboUXYIf0jgalUtjpSKOFqzVBTjHAn4WEq54
	 PUL6qi/tXrU1G8e/Xij0rjcJ4bJGOHOERnuaQYIMeQ+yztnnRYr/CMxKrC7GobuMxw
	 waq+Or+2u/4EfivG4PcbutSzyiP2Am41nVKn9UOyYCO0dNrFl/9vx2j7M5JoQNTqWs
	 y/6as2wBdgK+bY5rIvG3mdgWY9ge2GgaJG5VysseSnUACkNJ0S4aCbmjd0pWC0YxIc
	 vXtHbQmPMlFQA==
Date: Mon, 24 Jul 2023 18:36:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/3] riscv: Add BeagleV Ahead board support
Message-ID: <20230724-unwatched-left-f38189206b0d@spud>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_103640_740481_F5DB5D56 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: multipart/mixed; boundary="===============0552358549480588963=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0552358549480588963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D9uVPocj5ZxF/vpH"
Content-Disposition: inline


--D9uVPocj5ZxF/vpH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 10:20:37AM -0700, Drew Fustini wrote:
> The BeagleV Ahead single board computer [1] features the T-Head TH1520
> SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> minimal device tree file to support booting to a basic shell [3].
>=20
> Changes since v1:

> - Add dual license to dts file as Conor noted this is typical

I figure the dual licensing of the dtsi & sipeed board will be done
separately?

What's here is=20
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--D9uVPocj5ZxF/vpH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL62ogAKCRB4tDGHoIJi
0nJOAQD+jtDm9BjBEfTrhb0bd1bzMuFVIVMn22jD5gqDQhxVhgD9HONE83smPhGU
5cINM7em1QnEtx+OWctkUf+pnj/FkAw=
=rYTt
-----END PGP SIGNATURE-----

--D9uVPocj5ZxF/vpH--


--===============0552358549480588963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0552358549480588963==--

