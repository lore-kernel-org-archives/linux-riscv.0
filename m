Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5D7C27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAgkSjoLPwC3ldrMAQi9zF3lqGwaGSs1Is6hfOGVbb4=; b=nDxtaApjz421nTCLLF/N9ShWwb
	30acm04lrIfFL0nTDayOT+fsbUIrGmjNmYNpdqY7Z+pl9Z3uRh+MNzdi7AsjzbuzxiBCZQ1hxCLca
	XTW+iy5Cbqr3IYWIpGHkiPQGw8qtd/qj6bcLImtPhD6TMkfAtN7OKP4HUrktcDt+2XKWPshRlj8M4
	z1rE9UTdywOqXEWhB032yW+qI3qisbVAgrO06tnzESnAHWo3HemoTkbhnP1uLIICItX6nYu4NZ+18
	ipXAFOXtHShKsKTQ4ZL0B2hC/V5/lZCNQM+ltbYxd3uFgvPgL7cBFlB56uyLbF7VabV1HeXw5Flaa
	NPUc6zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHldV-0000000GzNA-26dm;
	Thu, 13 Jun 2024 14:41:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHldS-0000000GzKv-2dnz
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 14:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 44633CE2689;
	Thu, 13 Jun 2024 14:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BFEC2BBFC;
	Thu, 13 Jun 2024 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289662;
	bh=QudiikszfuUSRm1JTVmyxQn35gCQ8PIjI8z2PL0Fa5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvNk+DeKUwohEXf2HcghJVK2ISwGC59Kg2oUR4L6l2e34a/gOul8aSiTPUqfoAgFW
	 f8apKbdebeXia2nTHIAgeqQldDjToUDPysl5NEr0d3VTNCcFu5mp0A5rFo8Gn/GoaM
	 nVDG9tRVhcn8fn//ryWad9iYqNZBwJpRtSL1udNk7ii0tMocXltDecJXku6yaoS1Cg
	 /Bl7HfJENXroP0zuSjzEBE7iYKPVCMmUI7srqojPT05SiDrGRz7Pn7uMYQwlRPOZbx
	 vIp0TDf9Vw3Z8NpEzrjqKNGmq9Dsv7J3UBRT/atm9bPaE1QJTljvaYy9yrlYLTDrF0
	 6Dka+8PRkVCdQ==
Date: Thu, 13 Jun 2024 15:40:55 +0100
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
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 04/13] riscv: Add thead and xtheadvector as a vendor
 extension
Message-ID: <20240613-cofounder-curator-81e53a35dcbc@spud>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
 <20240610-xtheadvector-v2-4-97a48613ad64@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240610-xtheadvector-v2-4-97a48613ad64@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_074106_867781_B6D057C5 
X-CRM114-Status: UNSURE (   9.18  )
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
Content-Type: multipart/mixed; boundary="===============6720987716498945733=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6720987716498945733==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aZez57M5EwwC5uBl"
Content-Disposition: inline


--aZez57M5EwwC5uBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 03:56:41PM -0700, Charlie Jenkins wrote:
> Add support to the kernel for THead vendor extensions with the target of
> the new extension xtheadvector.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--aZez57M5EwwC5uBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsE9wAKCRB4tDGHoIJi
0sX3AQCV0JAgjlWHnjFIW32EH6kLNRxnf0K4C7KXnfzG3XGQOQEAp2wE6MnRyV//
+GtJNdRRVkKDTjAnuHMpsdBXy6n+kQQ=
=VC5A
-----END PGP SIGNATURE-----

--aZez57M5EwwC5uBl--


--===============6720987716498945733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6720987716498945733==--

