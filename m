Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388D2C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUTIWzYe5uYRGZ8ZHUgM3PuOct7Y90uf0Et5HK22JSE=; b=2WxmxV143c+9zcRhpQ8G6S6nxU
	l4xv9chdaS7dMwXHZH6jUiYPH4puEvA+ci2W3tKJrfZR1IaHatlODaKhiGJwVYzTBTBRJDOovMoge
	eRRp/IrFoyxUxHaed+oxbQ7b/h+jhPUnpkwpI/Oea+0Iyi4v5n2tKeZNx45Phj8w5eWjKyqQnaALe
	wTXbHKgMrHF3Jlaj629uEmXWOT85eGSZV61JD5T8U51v6ZXUrRZ2erFD5L3Wel71MhWMn+n26eO7B
	TOhchQrzSTW0QoJ5y0kJwA1/V9IXx9clh58WloRyocR6RqbhxGJx5Wc03FwYCQLsqLT8DanYbtean
	12iWMKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknXq-0000000E0Y1-3bHc;
	Wed, 19 Feb 2025 17:07:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknXk-0000000E0Vz-1yAM
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 17:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62DCEA41E9B;
	Wed, 19 Feb 2025 17:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16B5C4CEDD;
	Wed, 19 Feb 2025 17:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739984846;
	bh=hAryitJnIAa30axFWXeMrq2DsntcJ0u5SXN3znJATEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqAzD7MUx6yyPo+t4ef6DxLjEy3DwHPL5S7aE9JoiSSDv6BF/bawG5Xu+Hkyc/T+w
	 XsBGqGRG3fRWPF+hUxgphbEqPNtjPcY5GvEDbKocI7U1RoSWa2VdG4/g3ZMj3Taz8m
	 +3mHcE21BxcBuVjYwTOIrle1MTK1Razb0/kp2q+xYVqFpkKF4iWIxgtuVJ6OdNv4Rv
	 /bfI0oyFZAjCyJ21xxoJeVg83TX9n4RZt/Hdq2g4PZGUcgyBB4uvtpUz5a6RxNC1Qs
	 V+tzt64/xyMbNzS5bAj3haUmAykY9ZLkHLIcp8eGMH3NQ3KHgDWzPpXXpFdP1bSyF2
	 rdDTRFIQU3jFw==
Date: Wed, 19 Feb 2025 17:07:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Xukai Wang <kingxukai@zohomail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/3] riscv: canaan: Add support for K230-Canmv clock
Message-ID: <20250219-provided-disregard-948f2988871f@spud>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com>
 <20250218-poplar-iron-c894fe8deca6@spud>
 <b2b9216c7c28e5eed267b9a39c8dcfb1.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b2b9216c7c28e5eed267b9a39c8dcfb1.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_090728_570599_4A50DB83 
X-CRM114-Status: GOOD (  13.69  )
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
Content-Type: multipart/mixed; boundary="===============2881110414933716932=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2881110414933716932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DRM8MpnQrs8Rzg6i"
Content-Disposition: inline


--DRM8MpnQrs8Rzg6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 01:51:38PM -0800, Stephen Boyd wrote:
> Quoting Conor Dooley (2025-02-18 09:02:32)
> > Stephen,
> >=20
> > Is the driver in this series satisfactory to you? If it is, can I send
> > you a PR containing it and the binding so that I can apply the final
> > patch in the series (and merge the basic support for the k230 soc)?
> >=20
>=20
> Sorry, the driver is not ready.

That's cool, was just basing off the v4 changelog being minimal, no
worries.

--DRM8MpnQrs8Rzg6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7YPsgAKCRB4tDGHoIJi
0m+pAP9zRwxRDmSEDI0bpcXZF3kIzUKuyLOHvSrhwH7btn+hvwD/WSTeoZC7nplx
fom2EPgk7xMN4Tlkm8WQwu9xQCe8Fww=
=DYtV
-----END PGP SIGNATURE-----

--DRM8MpnQrs8Rzg6i--


--===============2881110414933716932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2881110414933716932==--

