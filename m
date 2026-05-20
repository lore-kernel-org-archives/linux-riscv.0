Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14D6CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpWQgyKSwL6T857V3ZRERu4OfuL4GoENwhlDJI1YiEY=; b=gpdSKmef5BWkotdJXdcH/oDiFA
	nMx2x/wtCuZlQJUw+TY8Zj44zqxERksKJNnVuE6Q5piWep37HNeHsqCW6fERJzqJ2AAfYK+Locy4R
	WgsGSODZUmCK51i7y+sZD2GVlySrGRvF9BFHf74kzg0N2kjytLCj9yIX9Jikli72dKd7gugqYD095
	8EPNo2YWHkNVx7uWQe0bhJSWQeIfhkglQh0qFyHu2ia79DJfw10XsWr7RytThIhrO/2+gE8t7mgzU
	FC14zLwX6V2aIRLxZnphY34WuIu0uzXA7vetP9pBdLHRYFYqtADP5OUK4VPlaUM9/JjOE1Vdr1YEG
	XJsutOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjcV-000000058nn-0oGz;
	Wed, 20 May 2026 16:18:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjcU-000000058nL-0JIx
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 16:18:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2033C60120;
	Wed, 20 May 2026 16:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E21A1F000E9;
	Wed, 20 May 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293884;
	bh=s+bqyy4lTEXQwNzfLtdc2etOddCUPR1OWMokoRzfIoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fARxK0zJARFQEgwTsKoLeiDZ+mxDxjkgm2bcNzIa5GgybdhPHqeuxNw2PlQnTOUn2
	 3e7FSVPB4uJ/6ErTRAcvHAvbLnKEUwnMI8p/VuuRDEeLlX97iBX+lCum7nffoslDtY
	 zznloGWDkcx8rd1vUrrpUeBgQCPXz3rnALbQzs4cMZYDKNFuYzeewYE7TZpp6Dxhaq
	 BOtAyRDEowpGmzABD/4EOszoAw6ii5y3SOPXfWS10qnNWYFtFZ5OOQfCK/AMPcQsny
	 ou2l49/i1G5bG7sm+OqJ6fOsSyDx1mIysOSrZt5KIndcBUzCo5fpUsAcW5NmFURLQj
	 6WxqMBpJ9OWKg==
Date: Wed, 20 May 2026 17:18:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260-IFX board
Message-ID: <20260520-shimmer-tackling-b7be80a5a764@spud>
References: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
 <20260520-02-k3-com260-ifx-v1-1-3e17055dd488@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260520-02-k3-com260-ifx-v1-1-3e17055dd488@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============3796787701191687506=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3796787701191687506==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0U+RNkWJEZjoyol"
Content-Disposition: inline


--l0U+RNkWJEZjoyol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l0U+RNkWJEZjoyol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag3euAAKCRB4tDGHoIJi
0omcAQDg9uAlz+noF6oIqi4BKQ66FKsaUeoyoXbr/XSGjii6ZwEAllYef76J2Lzj
pZg7pT2UT4wV3gIwmDlYk0sa3uf3Vwk=
=GQTi
-----END PGP SIGNATURE-----

--l0U+RNkWJEZjoyol--


--===============3796787701191687506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3796787701191687506==--

