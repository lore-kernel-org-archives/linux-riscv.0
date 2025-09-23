Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC10CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwSHLQi3YryecW6r9kkCiye1+apP3H7zfvLQB9KtapI=; b=TAP7Yyv2GkX5ISYvTVd4bxf9t4
	iZkeoc7VGNSK/W2MXiLbMTPOsn+uxKGg2KTN+XMz3mWTepeAApZ/JI+uAL37bfS0t1x7Z2gtRL3Rv
	5Tpb8Buit/YWEn9C0Uj2NZ9Q+CVfR/w8IkX6g40Rob7L1bU6rim497w0ioVuOMkAGpxyLndBdXfbl
	bqKDEEZmTuG3A1/GtDJ8/fpKLjAw1W6uopatfZadiTHx9BsAAlWlAEtbxKf4vACd73HkEnlquT3Df
	PSAWaGiaR4amxnnSZYGUCUixa5A3UBn1bn4NMGtdCqWdDX+lSu2KRIB+btDYfUPp7f+G7kyp0yblI
	uWVYVxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Hm-0000000EbVQ-08pJ;
	Tue, 23 Sep 2025 19:02:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Hl-0000000EbUi-0Nwn
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07FED60258;
	Tue, 23 Sep 2025 19:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA248C4CEF5;
	Tue, 23 Sep 2025 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654163;
	bh=MNCGLYKm4on4u/ee0QpshIh7g/1iu74HGsb1YK+Aibw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFE0L+0+CvqhghdBr8GrcfXgzMghGeuzg82fZL/ANbMx8p06EM+pmPK6qW7giVxMY
	 4lezfrGeVb3lwff6JszTyLnYRHLZvQMUpuHS9QXgWnK4lkAy9vBWiDrKnWDi8YDf9S
	 SZAsgeMVH2YnSwg2cUd8lhnT8XY5kA6KnMpy/h0c16NI0UY6EcznUXuCWPTKBgVyu1
	 wJctx6hS/CrMzwwmw6i88ZSHiQpFDG/KAInowVijjdSTR85m+jqZerjrw353nxOZuA
	 q3B4rOlHp869XST1wzhNcyJ311w4OrBDauYJAjja59Wq++RUMsxI2JXsTWJZJpth94
	 5mFHF04PKnX6g==
Date: Tue, 23 Sep 2025 20:02:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	"fushan.zeng" <fushan.zeng@anlogic.com>
Subject: Re: [PATCH 2/5] dt-bindings: clock: add Anlogic DR1V90 CRU
Message-ID: <20250923-cork-clarity-40358e06d361@spud>
References: <20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech>
 <20250922-dr1v90-cru-v1-2-e393d758de4e@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-cru-v1-2-e393d758de4e@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============2200559693326889707=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2200559693326889707==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXQbIvmswZwfd+Xe"
Content-Disposition: inline


--cXQbIvmswZwfd+Xe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--cXQbIvmswZwfd+Xe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLuzgAKCRB4tDGHoIJi
0rwtAP0fn0XwIXbjq5PVgdtSJxA38UMz2JFYXsDJnwLnKO8rUAD+MHiGKBTenito
DVaMH1nw1vvZWEhPOZgX/2B/yC+LzQE=
=BIbT
-----END PGP SIGNATURE-----

--cXQbIvmswZwfd+Xe--


--===============2200559693326889707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2200559693326889707==--

