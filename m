Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668E5D1118E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 18:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q5nqWGgyfq+B42IvlY+dBvaAMYtPi8xrsJOAJmiOn8=; b=aaavbF1Y02GRRuKhnq6keUhJG9
	t+/aIdqQ90VmFHux9cLrHzyCHSwg5cpBA0Hduo5vn8H+21gHoBFpJFfMpXrhJ2Vd8EguQdzZk1hQA
	X6l8+8K1+2sEzClxVhjq//2yZAfTCSDFxEHTywGzanXrZw0Iq6K6C/Sx60+BNXyMaBeFft8wE8o5Q
	/rOeJz1tBXFJX88rCEY+wbQTw2H0EMEMz71IDX0LRK+Racx5iepGuzef2xYGe0InxiudnJ0KY19JR
	6QKK9LHnPr2ggjHN71gNKaGyn+BLAuS53Hy8Ip2ynWWopceBV4LAiyFZ+92BSF1x4ZJreW47UE3kV
	QGREeq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOK2b-0000000FUFf-2dgp;
	Wed, 26 Nov 2025 18:14:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOK2Z-0000000FUFI-06IP
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 18:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AAFE440C5;
	Wed, 26 Nov 2025 18:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E904C4CEF7;
	Wed, 26 Nov 2025 18:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764180894;
	bh=fOuR367yqt+TUGOq10HVUIFhRj+cHm45vZHykln0M38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVNmYADKGSlooLI9Xzma/XL3vTkALXSFnIQr2g2/o31potjF8j5oWU+YlPEoN8jdY
	 dZTSZz6BBIPd25CpcczcwoPQTJTHxjfLss/gV2mPzw/VUKPuca9Zf3gbtcSCLKTrkO
	 x4BY2toROUBmwkbt16h2AKHDYnEzChc/wxHTawgvVk4qROTnzWEqAuX5W6IQULtKxw
	 5HBwHMj9OuQcRktNZltpLlhAts6roJhIFrKfIvCPkCtWGKuSfpEvxL21QEKe/xPdrl
	 t/cxZq0SJJ170MkPRBTP+hRTz6+FB1MVh8zaZd3jdPSzS8dzqCzHZu64K/DaL3C4sI
	 DAgTIz3Gv88pg==
Date: Wed, 26 Nov 2025 18:14:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [net-next v2] dt-bindings: can: mpfs: document resets
Message-ID: <20251126-unworn-mayflower-c135cf7710a7@spud>
References: <20251121-sample-footsore-743d81772efc@spud>
 <20251126-famous-hummingbird-of-fruition-13a9ac-mkl@pengutronix.de>
 <b1511382-1fce-4a1b-a1c3-962a05fc07b5@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b1511382-1fce-4a1b-a1c3-962a05fc07b5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_101455_111642_B151E718 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: multipart/mixed; boundary="===============4793087688369089588=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4793087688369089588==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KGgTrLDeJGsfYJic"
Content-Disposition: inline


--KGgTrLDeJGsfYJic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 11:26:17AM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2025 11:24, Marc Kleine-Budde wrote:
> > Hello,
> >=20
> > can I get a review from the DT people?
>=20
> We don't always review each other patches, so you kind of have DT review
> already. I can review, but I just did not plan to review this... less
> work needed...

I think it was a pretty reasonable ask here, because the v1 had a
problem.

--KGgTrLDeJGsfYJic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSdDmQAKCRB4tDGHoIJi
0shhAQCLWTb6LuCfCy2om4FfMVJhtv/g3PU/1PeKwL6qG4mdFQD9HhbKn4TeFWbB
VddagDUcmlffjW4Ig6xfQbA8EpfZ+AI=
=c1IA
-----END PGP SIGNATURE-----

--KGgTrLDeJGsfYJic--


--===============4793087688369089588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4793087688369089588==--

