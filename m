Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A9ACE8373
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4DJz9hFznxQgZtHnw8wXQnApuhxQL1flih5GmEJ+0A=; b=Azg8hgZ7hG6m2zJzGxDEpzUnfj
	bUX0cHytl6aZ7llhZw9dFKYaDbntPLTkjGNZX5xGNi57IfFmRRbYVeZ1UgBNh4eDP6Cc6+I1JJDjK
	0Oe5QVRkANuCFvu4Uy+1qxgXaxH/LQslGblKp3g97WvVcf7llcxEdyNbumT8bdlFu5AeM9IwgsBHl
	b1PKZ9549jpWx/SVw+ihsBkNLEZ4x9vJWMSHcib3qqKopx3LsCK7sa+bfM2OBxj8RI0F18Ny8r4q3
	W0eRbjIDYTsO4JH7yPxsjhVMFSG+E7GDPZe6T7Ps/6g/aXjrwxjDnQdBohbJa25A8XEcUaNtETSu/
	wNCXXtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJOt-00000000FXB-2nYK;
	Mon, 30 Sep 2024 16:37:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJOr-00000000FVj-1pZS
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 16:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D4A3A402CF;
	Mon, 30 Sep 2024 16:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD860C4CEC7;
	Mon, 30 Sep 2024 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727714248;
	bh=OEea+N+ZjPGjpK21jvjrr1s1DyH+2HAyStoPS1VmXZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cX2j4Fnhb8B+ap9VHBSQ/yD/9hmgAtNO2eAEEXmYLiaV7UWod/13UWBuxsg6+wZXm
	 nTFSeiBwPU80M9dwYoSTe7EIcetotGWA0vOJ3zCGjJyjSeuPmvCL4fpqmHS4+6hNKs
	 oc5SUhAK+4vXCrJxqxAuDg7fNlPFDMXiMPPXVzp3GmlN/cR6K6eqKEUisReJeN69pe
	 jTRjyzLP3RpWmQWRoWNmkpikRagW0cunxD9JIVXOQCPEIDPYh9u1ZQjDNCRxM+ISYE
	 FJQUv59JGcd0VPMEX4WaRM3uTKihKPi+yKAZX/N4MjBwGOO530YKyCoDc6SIfXM40w
	 0P0/QgvyrlZrw==
Date: Mon, 30 Sep 2024 17:37:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: pierre-henry.moussay@microchip.com, Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
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
Message-ID: <20240930-skeletal-bolster-544f3a2b290a@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-2-pierre-henry.moussay@microchip.com>
 <20240930-voracious-hypersonic-sambar-72a1c5-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240930-voracious-hypersonic-sambar-72a1c5-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_093729_560528_99A9419C 
X-CRM114-Status: GOOD (  12.42  )
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
Content-Type: multipart/mixed; boundary="===============5789973829528227595=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5789973829528227595==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L5xF4s+PIzPhE/RQ"
Content-Disposition: inline


--L5xF4s+PIzPhE/RQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 06:32:29PM +0200, Marc Kleine-Budde wrote:
> On 30.09.2024 10:54:30, pierre-henry.moussay@microchip.com wrote:
> > From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> >=20
> > PIC64GX CAN is compatible with the MPFS CAN, only add a fallback
> >=20
> > Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
>=20
> Who is going to take this patch/series?

Ideally you take this patch, and other subsystem maintainers take the
ones relevant to their subsystem. And I guess, I take what is left over
along with the dts patches.

--L5xF4s+PIzPhE/RQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvrTwgAKCRB4tDGHoIJi
0khKAQCsE8hEXz8LI1xqSwIVZ4y5wc4iBPh7MmU6gV6cbW9Q2gEAw+Ers8hDKQpi
/5YIJ3xCLcFLMHF061k0iQv/9uHTFQ8=
=ukT/
-----END PGP SIGNATURE-----

--L5xF4s+PIzPhE/RQ--


--===============5789973829528227595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5789973829528227595==--

