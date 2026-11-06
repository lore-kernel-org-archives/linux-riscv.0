Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C36606BD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qTZllTso;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnbNNrmr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L84IgK574i4iMy6U7HMkRTELYnQnNQy/7TW5SOw5/d4=; b=qTZllTsocZy819LVsb4lLiHLiM
	dn5k/1NW37meJJhjGIYb6pu/mY+mB/7w46ZLYqzCTBmEFzbanswuFGhm/MBeK8rHGGrSlJV9hp6HK
	v6jimXx/xVio2ncckBxkMlQSYMQeoZP/VWasTpXC4ScwNZVltxZHC8Acf0B65MGhVQgcxRec1OR76
	ekU+pRh9ZjztTqMpLbdLjaDGKcJkUqk4Ym6qFkhJp0Arkokp0thO2e+2AmrWIta/CV/odZDUGNd/Z
	wRqxCKpI0Q1MDKovoJt3cZynI0j3pT5xJnrbVCo8RGQF5nKvkFvAWwHe/f6DMkVXJmCKY8S9Qg0Pw
	VsZ6bpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIIh-0000000CAsT-14WL;
	Fri, 06 Nov 2026 11:40:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIIf-0000000CAra-3X2m;
	Fri, 06 Nov 2026 11:40:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C91E418EE;
	Fri,  6 Nov 2026 11:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE95C1F01564;
	Fri,  6 Nov 2026 11:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965203;
	bh=Imy96n3mofst6REH68Pim2J1L8h9RbLyJ5/t3nqBh0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GnbNNrmrJZr1EXhA6fczuX6JFcb+YECs2G+PhXagcPR6XFiRifzm/UVe/AWF8zDaG
	 Sae75TZH85AQ+7wPNeaJaz8FIZ9hIeaIFUTcgeuoaXsXBBKp+nMQMnKs9heiiLHEdG
	 zBciFaenaq/E3LSxKIGYlFIxsPLRR92PJVjNxixbzVsdzobsBag4sX2l0vfdjH3w5R
	 E3H22Qr3GcNcn2aTtLIk1yR6yr9vpS/wpgd7vqwPBK8VbAdJEii6fR984SknkL+4g8
	 w9uIl7I2ombovQsTaNdsCccEDyaFa9XlhtgqAjV+0hreoDytPoyhLGPaI/tgOsCRZb
	 9VctFN5G0ELNQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id B334F27E8CA1; Fri, 06 Nov 2026 11:39:39 +0000 (GMT)
Date: Fri, 6 Nov 2026 11:39:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jun Chang <jun.chang@metanoia-comm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	CL Wang <cl634@andestech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Randolph Sheng-Kai =?utf-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 01/25] dt-bindings: vendor-prefixes: add Metanoia
 Communications
Message-ID: <4bc702d8-6f07-42f7-bdff-e0ce3ffceb35@sirena.org.uk>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-1-86087eaf5af4@bootlin.com>
 <8c625e53-7944-47df-9b91-268d0cdced48@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8c625e53-7944-47df-9b91-268d0cdced48@kernel.org>
X-Cookie: Whoever dies with the most toys wins.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3532464774484751328=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============3532464774484751328==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8nfF2+6VCmfv48fU"
Content-Disposition: inline


--8nfF2+6VCmfv48fU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:17:36PM +0100, Krzysztof Kozlowski wrote:
> On 06/11/2026 10:29, Beno=EEt Monin wrote:

> > Originally-by: Jun Chang <jun.chang@metanoia-comm.com>

> We do not have such tag (because we are not TIP). Drop everywhere,
> except for subsystems which explicitly accept it.

You might be thinking of Co-authored-by.

--8nfF2+6VCmfv48fU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau28ewAKCRAv73Ows9A4
id0tAQDOS9TiaPXjKxL5DtuumtSrZ/580roAZS7tEFRF113ZjwD/VYY9nSrCQvZC
HPSXOyFUJSaNLxctukdHGprNOTajWA4=
=w0do
-----END PGP SIGNATURE-----

--8nfF2+6VCmfv48fU--


--===============3532464774484751328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3532464774484751328==--

