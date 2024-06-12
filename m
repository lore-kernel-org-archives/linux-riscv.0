Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98164C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4rsZGXfKkiNi5NfwieMkkMsSs8asTq3gHCWxjeWrQs=; b=jlsj+vVcN6jXe+MVhmIfqc5t4K
	zNMCRY83tHi2dG2SzQbq4v94pRU8kSuXgMLq3J0sCSv2OT6n1TWZ9xRlAVm5KrPEoMFADDd3vhc7B
	RsmD8/vwARI8XT2hw3nqSv2GWvbYeOSBqmir3lCWT7jar0prVVxdKUU2Rg7sm6AZ5I8fRyhw5dD4a
	IJrcXmNjXwxfFIVgovWOWMFMCNRRG/nW5xYLsZVgk+X5VOnRTqiQB0AzspAcXAq9czRB/JO514w5G
	GbgtCDwJN6Ayq2S+nsD7VU3i6J1gwUxNKy8+yujNm20qROSnQFXSfjjGzhmVgI9iGhv6g2i6Qs7Hw
	FKP0S5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR7P-0000000DRDQ-2uSo;
	Wed, 12 Jun 2024 16:46:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR7L-0000000DRCJ-2hZl
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 16:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EF4B5CE21F8;
	Wed, 12 Jun 2024 16:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49B9C116B1;
	Wed, 12 Jun 2024 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718210792;
	bh=q4OYz17flZuLgbGuuOwxi5CCitZmXBx2iQmSgXo/YpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0xJupUwYeVC+FXlzIcpVp6Yz+UZu9cGDWHfG5bjKDs6oY8ysl0pgRwo368TZTPrO
	 j5zpNMycbZ+7WFL6N4QyUmMJ7V4SnXpO3uEx/vR7amDfjg39+tupcWIIVAtCilEog+
	 yUVmhYUgpYuoTv8li8kEWC4SUSYcHhxyHwlLQO42Qces2KvNcTSb2zDXnzDAv0FhIL
	 gj4jwnoDQkZVua5tNEmrbglvK7CiAh/MrzEkt27vFIgL89S00nHbZPqjbyWL5vr70p
	 bTfukH0n1Xnd7NXB05qb98WSHvzkJbg3r7WyVBqklQ2ztLb9iy4i+tvW72y/vgEOM8
	 rUqIfQU4WTEng==
Date: Wed, 12 Jun 2024 17:46:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH v2 3/6] dt-bindings: timer: Add SOPHGO SG2002 clint
Message-ID: <20240612-violate-unmade-a310d133e5b8@spud>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-3-19a585af6846@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240612-sg2002-v2-3-19a585af6846@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_094635_956468_154B1FDE 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: multipart/mixed; boundary="===============7333138046031376805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7333138046031376805==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2p0/8tFuzhCfJUHx"
Content-Disposition: inline


--2p0/8tFuzhCfJUHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 10:02:33AM +0200, Thomas Bonnefille wrote:
> Add compatible string for SOPHGO SG2002 Core-Local Interrupt Controller.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2p0/8tFuzhCfJUHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnQ4gAKCRB4tDGHoIJi
0p6lAP9a1NLKF9juqOF+2O0g28e9Wi9JHHkMJ3CRhpeD6kRSbwD+I9GNNisFVzIm
RgDqcyrsNSVUeMcthTqV9O/fgdVH+gQ=
=dDND
-----END PGP SIGNATURE-----

--2p0/8tFuzhCfJUHx--


--===============7333138046031376805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7333138046031376805==--

