Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CC7CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xEAoVIUqQc0UQ7FHeOKBHzvpSswXFW0a4dD1BfSPMw=; b=fupXEv1UVDy/Tt7kx6HbFeEdL4
	iPan8aJ5EYZdASxGfIAUSbe0XPNKgeYLUt88bGHon6vFParuj2UGLdYb3bAcGsvLCp2/izV7fP8Ge
	RIMRlJyeKpSTBp1+SJUCY/DmTRlEsjDX4NsP0PqY1ST9vleJsAjle4OyEU1BWFOZWMzGQdwO7iw1P
	+93ra/7YGLg2Ch73wOjIoabB9tmeg1mBIOK2kaH2TUKjBgjDSAH5BG6k6kpw1qagSe4gFFHlMKGo/
	OAFKHRfs5A003psZacPUVgOCNGscXQFeVEn8Fqtk3DtizvBTdiiMFM7inDZkp3cYrpK/+69f/bDB4
	hfebKOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18NZ-0000000EdCu-3bRH;
	Tue, 23 Sep 2025 19:08:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18NY-0000000EdCY-2CUm
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E74186025A;
	Tue, 23 Sep 2025 19:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267E4C4CEF5;
	Tue, 23 Sep 2025 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654523;
	bh=dNTH0LFPnJYw+5TtlI2X+f4AebUw6GIjjz4HiRoWJHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k13PRQRk8h9bxWH0e0xMcb75b5k7xjKMjKCLLJ0R1gIUMxdw/gPHwuY2MUuef6+Ac
	 a3RS5ct0b4/ZFQrZGDpMgzVRRDo8ft3+GTiVbJaSk3RSTpeNIbhT6y2cJ0obirdvSE
	 eTgyZDF8ZaPFNb5erErT35IfOm7aFVeDo7ehPDr/jGDfPrV1ulKTY1awGMxQPrBwD4
	 NHJQJa7Ixx8PpfSHWH7Ei45kN18Xqajh2Q9a2kEdf5zNj4MXPZcwtPon+v1rKe80u8
	 egA/rd3Qm0RasUO2Il+PNfb0tKfIMlmT3BPrR2XGndVvijzGNAauSM3fkPbLBDrtXt
	 Xn7ng+n25lzHg==
Date: Tue, 23 Sep 2025 20:08:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 09/11] riscv: dts: anlogic: Add Milianke MLKPAI FS01
 board
Message-ID: <20250923-banknote-from-2995e8dee5b5@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-9-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-9-64d28500cb37@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============1192249766929476845=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1192249766929476845==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XXP0VzvVz61GMMd9"
Content-Disposition: inline


--XXP0VzvVz61GMMd9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XXP0VzvVz61GMMd9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLwNQAKCRB4tDGHoIJi
0uK/AQCY5lymPH+5dOHHaxoasXWiHQgYlnnTSy7BNi1lCs7meQEA7N+nykk1UMpv
SC3yBmtZJTwtlhjw58G3Eb9OJnYJ+gI=
=zrg4
-----END PGP SIGNATURE-----

--XXP0VzvVz61GMMd9--


--===============1192249766929476845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1192249766929476845==--

