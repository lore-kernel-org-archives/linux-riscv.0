Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420FFC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPhv4SeGGB6IfmDwW3LZgcIlRfyYuWw2Uo9wvaI3/To=; b=tPcOKj4PutUa2twR9TRE5yV2p1
	llZ9ru1dOHKYXeAaTpxkKmLDundQ+i/IM4VYiitgYhbUhSqlaz4jR9AwEXDS5Ge+FIaNY8yQflt4P
	nvRZKjL5lcj/j8CjdU/7/URubzwPytBSMkvdc3jh0Vr+1XTk9WWKqpE00XdXGmYKIMz03YnqHxzjX
	x3c4O9H10LdgFCG38QOkJpl07sBDUNN6444rrme5WGHj2OxYxPuudugK/2HGrOIF49UoWTV+09bwt
	omybvHciF4577CXb7bguPLaV9vQo5x/Y/fHgZ7ARBWv3uN//jesDZKcwKm4pqM0YUdPBfEfXA30M5
	Qu7Qe61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR6o-0000000DR4Z-0Z6l;
	Wed, 12 Jun 2024 16:46:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR6g-0000000DR3e-1FzA
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 16:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 786F3CE21F1;
	Wed, 12 Jun 2024 16:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DA3C116B1;
	Wed, 12 Jun 2024 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718210751;
	bh=8w9ShgPS5TN17Vgq4/FFJj6VXTdhI8xmQ63ahvkxhdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDzuo8wObD64mZR2bYEWIGnEbTIH8wewjHs/Iag6eiIv+NpxYmgjJLz1q9iXW3lSn
	 mharen142TxgEJQvoYAjlIA8KjpT681ujrWkKaT4WPLz4FwT833LNS6lENvvlUzrbY
	 m6GlctBFzmSjJeIturTITA67dUMa+aAWxMokbxaky6VKcTPTwi5dFBPFneGYQ2hNNL
	 FsdxKBL1vFbDO3jOMIr1BhaizDPo1/pWdN8LD0/SzXV9DuKSPUgdm7zj25wDa+dsjf
	 eDJbtk6hEYvP1L8KJoWZDyhaM4XFyXyw36EGYyzvgI1iyTugK3V4YRVZQ40DByZhi2
	 yaD9D+z/rD8XQ==
Date: Wed, 12 Jun 2024 17:45:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller: Add SOPHGO
 SG2002 plic
Message-ID: <20240612-dripping-ligament-df108345e61a@spud>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-2-19a585af6846@bootlin.com>
 <20240612153051.GA2633500-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240612153051.GA2633500-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_094554_540556_EE3C1EDC 
X-CRM114-Status: UNSURE (   9.63  )
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
Content-Type: multipart/mixed; boundary="===============6859288711406141360=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6859288711406141360==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vP3fUDhDzW4Xnwx4"
Content-Disposition: inline


--vP3fUDhDzW4Xnwx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 09:30:51AM -0600, Rob Herring wrote:
> On Wed, Jun 12, 2024 at 10:02:32AM +0200, Thomas Bonnefille wrote:
> > Add compatible string for SOPHGO SG2002 Platform-Level Interruter
> > Controller.
> >=20
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>=20
> Missing Conor's ack. When sending new versions, it is your=20
> responsibility to add tags.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vP3fUDhDzW4Xnwx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnQuQAKCRB4tDGHoIJi
0oGXAP9jq4hT6rwjb+4Rzk+jSXSxZtKrvLO+xrJjdgNSa0VHvAEAu3e4/SedACde
/k8mLIpxN0vOBrZWA4GSTPUkPkfyDA8=
=gfD1
-----END PGP SIGNATURE-----

--vP3fUDhDzW4Xnwx4--


--===============6859288711406141360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6859288711406141360==--

