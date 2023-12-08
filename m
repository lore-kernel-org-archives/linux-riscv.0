Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF738C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmoNjle7vhc8TvfIBQEI0C9g5LP+q4kt3Bamyo/PiXA=; b=pxizdoIAo///a47q+xeWFkdmht
	jpEYJuegsGQL/XgPXh23tsX9Rn8tEwh2QfWGKatGCinUsnMBaRcK41PmxuqL30xxETfFFrhhaoJYl
	WcM7cbh7mM+pbhm1xXayme+88CBu1D//WX+QmvHcuPSx+jY24g8r6Su5ai+8JKblgdZbHSJ5G50zA
	PSF1SgP6R9DKtbARjD6ecroiPuw/vYqtGyEUGFjxo5iZQf/lpLU4ws5GB/5HPRSaY8A/Q/ZCcrWX5
	zxdI/fR+fMV5s2U198so1VOKg3Ykpn5k64Hs21jbrTAPfLxmtWtf0yAAX4OzT6RcYowsVcikAnXxD
	jG/PolUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeLk-00G7vP-13;
	Fri, 08 Dec 2023 17:09:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeLh-00G7tQ-1M
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:09:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4AA3FB82BC0;
	Fri,  8 Dec 2023 17:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3329C433C8;
	Fri,  8 Dec 2023 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055350;
	bh=/IphcbvtWoyG/fdkcm9lA/I86nGtTbDJid5q4OPmEp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ptJPFirgLLzF4T9HWYpbubQGoTykPHi7WT2waoDAsLMD6zIR3crBpBCYOU97GrC5M
	 0FTe8NhXD23I5iDp/Pbschttbk74s0fCaip0kwsrcfJJXJtJMdkVcITZJddmTj8K2E
	 2zdXeK8JrovcaeUTLQrqGbypNw8vpDB+XOxpsggn6sorHggDihewFzdAJJKkFnMydF
	 mBmtq9N89lMSWgH76ElNC+T35o3B+lDqEU+X7E+hscnZo9DL03TuOTduToMCkiLRBL
	 rz7Anh7o7D0lZSUYHDOPKpcZ6JkreGHTFnTSvefUOXnxSalgPiyO3wZVDJCH+Ljbom
	 ZAvDReaocRJjA==
Date: Fri, 8 Dec 2023 17:09:04 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 0/7] MPFS clock fixes required for correct CAN clock
 modeling
Message-ID: <20231208-majestic-train-ee55b30de95a@spud>
References: <20231208-sizably-repressed-16651a4b70e7@spud>
MIME-Version: 1.0
In-Reply-To: <20231208-sizably-repressed-16651a4b70e7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_090913_593530_1BF5A664 
X-CRM114-Status: GOOD (  14.31  )
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
Content-Type: multipart/mixed; boundary="===============2728895698725145964=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2728895698725145964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FA6cKNTv83r5pITX"
Content-Disposition: inline


--FA6cKNTv83r5pITX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 05:07:39PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> While reviewing a CAN clock driver internally for MPFS [1], I realised
> that the modeling of the MSSPLL such that one one of its outputs could
> be used was not correct. The CAN controllers on MPFS take 2 input
> clocks - one that is the bus clock, acquired from the main MSSPLL and
> a second clock for the AHB interface to the result of the SoC.
> Currently the binding for the CAN controllers and the represetnation
> of the MSSPLL only allows for one of these clocks.
> Modify the binding and devicetree to expect two clocks and rework the
> main clock controller driver for MPFS such that it is capable of
> providing multiple outputs from the MSSPLL.
>=20
> Cheers,
> Conor.

Whoops, that was meant to get a dry run arg... Please ignore!

--FA6cKNTv83r5pITX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXNNsAAKCRB4tDGHoIJi
0js1AP9ZqKk/YBSEPrALxRtNPh7qmxhWn6pQU0kY4tNa5xZ++wD/b+Aro0mcj91z
Tut9u4n6gLOaDGjwvPG1K/0/eD5mzAg=
=yfBZ
-----END PGP SIGNATURE-----

--FA6cKNTv83r5pITX--


--===============2728895698725145964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2728895698725145964==--

