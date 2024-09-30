Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C75CE8347
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7o0IWU0L/Xun8PdJTjTPjf9QBqq77JmN9q/FR1/aW0=; b=bXArLE4oO5Yij895d3x6RthyWG
	jf3aXLrHwEs0My8EmZfLzL45mnFYWOeRUv1pZOv8DtBaKqzzoBj2VQhXViuA1XKHSwuGDtXliVEqf
	nMbUhzrX672RNAb30yib+A60VyODUCLztnStSuNVtFrYJWUL5kIiSL3Y0U37oa22m2IcNkpZLCrC2
	P5M7NBolrofeiyiCYwiil+aiZsUTxTBb5+tNzNB8zvwsa5TVbkKK51v5oArA6Ywzr/xQZ94A13EXY
	yBYcKAMRDTPIyBaFc2W/23e5butV00pFK3xxAFgGKvXzZg3WHgHIA5bYWH4gpHPlk9jGot3nnBDrY
	V2GUyCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svH8z-0000000HSe1-1q6b;
	Mon, 30 Sep 2024 14:12:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGec-0000000HLSS-1AGB
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E5FC5C1F2A;
	Mon, 30 Sep 2024 13:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34562C4CECE;
	Mon, 30 Sep 2024 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703693;
	bh=XuIxcWV90Pt6xKt7ogNiIxpo5TOpoq4J541bjNJwqag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/PWdgjGHFmG4a9TeIg92cCR3b53QtlukirDa0WYMdHKixucwR9yo13JHac/Cxbij
	 tntZ/2FwufIcSYwmBoJBBK4do+bRogXXJFVPI7fImhhJa40MJ3wS951qvfbNMHq/G0
	 bpqHHiIDY+j0LLwjkuYefn3ToR3bWuAsq3XJ2jqDJ/2uMQ9fYf2SHvvx1G9ibfdnCd
	 2aJ4M/cAnfW4kAaDgMFhrQ6bap8Rn7qAvvq496T76Z5jDB5pkcYeo7JlVVSSphDX8x
	 0hJV877W2z/I7VFx6nHWwgAGIHRWUq3xacHJelunGpWo/+NnRpilCa2aOtT3xpmUgR
	 POJBFfImmhGBQ==
Date: Mon, 30 Sep 2024 14:41:25 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 01/20] dt-bindings: can: mpfs: add PIC64GX CAN
 compatibility
Message-ID: <20240930-transpose-isolating-5c20f43745b1@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-2-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-2-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064134_380516_B1E9BF4C 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: multipart/mixed; boundary="===============9028595203875332473=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9028595203875332473==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ITDHeWGvw1IVSKQ3"
Content-Disposition: inline


--ITDHeWGvw1IVSKQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:30AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX CAN is compatible with the MPFS CAN, only add a fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ITDHeWGvw1IVSKQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqqhQAKCRB4tDGHoIJi
0jNVAP0ZEUhs6p76YEPVv+A3Xa03N4ZG3xl3Y1mmGJW8BNWHuAD4wyvWl7QbHbq/
Px7FmbCsj+wyZHmXwRcSgEpzuMnuBA==
=s7yU
-----END PGP SIGNATURE-----

--ITDHeWGvw1IVSKQ3--


--===============9028595203875332473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9028595203875332473==--

