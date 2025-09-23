Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A130CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jiGMtP6YeKXLMkePHPpswPzhpDltkiFNTNKVuT8IGQ=; b=Rh9q2PpX1GmIUb/DtWefVSy/mE
	l4gSdCEWd0cO4OGkjr//VfJRklM5etoCQdEN/+kydtRC27tXKStnoy0PDLrjhULEGfLf7TawgpKXj
	Y/F9PQUvHCzLdDj1XZIqIBA5pqdTlM0pNDe293IaONFGz8Qxbty5XqqHjgNYnmTq9gU05rKfSCmKO
	ysTDAcMSVi+zJ7IHu0EKUZZ7b2WZafgwistQF5Uq+cDPC2bwUSLmqOhI9nCCkQ4bMivKcH/Ds/a9j
	znxprrH9g7YxBNECK2QN1nOq6oHiCicL4yjJgLk1It61pf51u/hdSiGis6pTXIrTAwfBi/+cSNNjV
	ZPQT8lyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Lf-0000000EcSy-0r22;
	Tue, 23 Sep 2025 19:06:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Lc-0000000EcSa-3dfY
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:06:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B17340579;
	Tue, 23 Sep 2025 19:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEDFC4CEF5;
	Tue, 23 Sep 2025 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654404;
	bh=7P42Q/vcWhmWMXKCBhXjJM9Hy40nKSHi835euslZlmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Phvwjb00clUqKrLEIDqT+JUWC1IMZOHYQvn3zsRlsU7iAsonB3a4/hhk+1+wA5QOY
	 iRKfO6UKWhZWw/EwbZWaIAPUKaBLIJ7/w3BdfYbP+EyVwaihnzaA0DhBFtNFiFUOdN
	 Txs+FruZeY0gyxU2mFygy7Ec+sm6+bXj0SOYvi5S2yRR6xBdxGqpVgA9mS0SaYDkSN
	 aErHOp05ViG37S33PIufOgkhJ55N7jLmi12QHj6RcE5ilvAgLsNIlFobcLPsNEAF2t
	 h7S6m5XCTlwzdwsXSSBshK56WsgeVxy0uQFzwz+VTC0bXOfxR+o0Q2vH40F1ktRGka
	 iZr7IB3MvqmMw==
Date: Tue, 23 Sep 2025 20:06:38 +0100
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
Subject: Re: [PATCH v2 05/11] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 PLIC
Message-ID: <20250923-reward-washroom-8982b121b0da@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-5-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-5-64d28500cb37@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120644_918398_49133FA4 
X-CRM114-Status: UNSURE (   6.73  )
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
Content-Type: multipart/mixed; boundary="===============2056102052793001059=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2056102052793001059==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1+aBwOsY00baIh+O"
Content-Disposition: inline


--1+aBwOsY00baIh+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1+aBwOsY00baIh+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLvvgAKCRB4tDGHoIJi
0t9eAQDg4LDFpDPzjWSwixC0UScRcXJASZEIdXfu8SMBE7UYGgEAqLALUB/4kBOw
iuLF2GErnxYpG+cgPUXKx8iW3/Z6LA8=
=tGbp
-----END PGP SIGNATURE-----

--1+aBwOsY00baIh+O--


--===============2056102052793001059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2056102052793001059==--

