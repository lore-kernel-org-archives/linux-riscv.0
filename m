Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A16FC77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bGK7GGulRYkrvARB7HdoXZ7uVRNH9pR2q/szenGSoc=; b=cO1kHM0oJEjbTV4NdPn8bjbWw0
	QL0G08e4HyY/T3lSo6Mm4JSiYFCJK4hVmU5xh5WBWrkPRPIpb2RGkkYfA7rDn0o7qo6XvH7jQ+o5K
	yKnlch6P/wI+eCcOkitRd9ZO+Hms4f+EdW8MVhCX9cTnzAZmjNDgeUhTi4XeJ/rFjJEhIMndqToQB
	bjbhsyowMiqyjVAj2urUAV2Rl0aLpzFWySbHXtbNlsL2lIUl3E06ucRfR+rA3+gcm2EustPdY9SLa
	qUxFr4CNYuu8K7ZuBNbC6tEu8fZKg+TJ3Qoo/q+Dl2ruVHsLmu+YedjjSiPDZ64S61Z41Df3n/X4M
	31GjngpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEmv-00ABfg-1W;
	Thu, 11 May 2023 22:29:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEmt-00ABf0-1K
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:29:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E528865021;
	Thu, 11 May 2023 22:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92B0C433EF;
	Thu, 11 May 2023 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683844166;
	bh=JTzpkxSr+WUr9mtwXRAATmDWd54k8NYw09DpF3q2F8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7xHg04127AaUCeXJEtiVTjf+c2HWlvGS2BaNojXk9aqOgK9I4+rTaXlC3dBOg5Wx
	 yquhLWhV0pIh3nJ2gBQ02OwcpUueebcI9okxB7dxkaY1t55EzqHvlvC82CrtLBfR3m
	 Te45ZfCRrUb9mFZ2X9h3ZaeWE1mZy+R6LOjQcbDMAw3MeBF2cOLvoBW2+kR+I9cwPL
	 /nXqfT0JnCdd+wrwzi3jPnMx/KI15bZl/7lvZ5s0XzOmOuMFy/QmnuKczuDHnbnpSS
	 nFNMWQFdYEfsU1zWZM2KBKHJQrPS94n0iAVjExjGLNnF5CaEAGwbUQK+Y3Shrm0w2w
	 GK8LIZVQjPgfw==
Date: Thu, 11 May 2023 23:29:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Pranavi Somisetty <pranavi.somisetty@amd.com>,
	nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, linux@armlinux.org.uk,
	palmer@dabbelt.com, git@amd.com, michal.simek@amd.com,
	harini.katakam@amd.com, radhey.shyam.pandey@amd.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: cdns,macb: Add
 rx-watermark property
Message-ID: <20230511-unhidden-mummify-800fe847e25d@spud>
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
 <20230511071214.18611-2-pranavi.somisetty@amd.com>
 <20230511-canned-gray-005130594368@wendy>
MIME-Version: 1.0
In-Reply-To: <20230511-canned-gray-005130594368@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_152927_506538_0233AE51 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: multipart/mixed; boundary="===============4278891555935625404=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4278891555935625404==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cp1Gsw0Yd1cfGjfb"
Content-Disposition: inline


--cp1Gsw0Yd1cfGjfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 08:25:15AM +0100, Conor Dooley wrote:
> On Thu, May 11, 2023 at 01:12:13AM -0600, Pranavi Somisetty wrote:
> > watermark value is the minimum amount of packet data
> > required to activate the forwarding process. The watermark
> > implementation and maximum size is dependent on the device
> > where Cadence MACB/GEM is used.
> >=20
> > Signed-off-by: Pranavi Somisetty <pranavi.somisetty@amd.com>
>=20
> Please send dt-binding patches to the dt-binding maintainers and list.
> get_maintainer.pl should have told you to do so & without having done
> so, the bindings will not get tested :/

The automation we run for the linux-riscv did actually run against
this though, and even dtbs_check complains about this binding:

Documentation/devicetree/bindings/net/cdns,macb.yaml: properties:rx-waterma=
rk:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

Please test your bindings :/

Cheers,
Conor.

--cp1Gsw0Yd1cfGjfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF1sQAAKCRB4tDGHoIJi
0mx8AQDvCXrHHAJUliEbLe3FqTXIyyuFRBHjHbmN16sg23MaCwEAwYNs6Dk9vDu4
ES17DcW0ax+qchBDdyxacGBtlx2oswU=
=lc3I
-----END PGP SIGNATURE-----

--cp1Gsw0Yd1cfGjfb--


--===============4278891555935625404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4278891555935625404==--

