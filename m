Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14370C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFxYfEh92S4HGoYroVvPoxOS9C/uV54f2dfDJeIpGpg=; b=3oyKR4kJkBBDo0PxShfQCJ2LfK
	KKsZUaqLg5/Iyu9/BQkm6a21FudrliCklbTajbLrV7kazRxvXE2IKgswILURBBprVj3UCpChutUqM
	1mdADFm1pEUS6HvobtWfs9QDZG3G3zMSRaCFlyzKswT1dxE/pLQ/BMaeHkSg14x751E1ltpULBVo3
	iT2CS5AHeH/b1qzcQ4wfc/gBg3C5e9P44H/GcnTuUkhbTGibAX9YQPhHGmRtZnjGljVv0WnsEIXcP
	HT1rm1X2PfH7b/LtTCzdyxn2SyAMmn3qt/5hwi3ecG2tCR62VqdNzXjxSsIfPkfDRbXUHho4400Y5
	nWOhfwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q86yH-00HBPt-04;
	Sat, 10 Jun 2023 22:22:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q86yD-00HBNq-1G;
	Sat, 10 Jun 2023 22:22:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B71BA60BC9;
	Sat, 10 Jun 2023 22:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A29C433EF;
	Sat, 10 Jun 2023 22:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686435724;
	bh=3G3f8N5bw9bPZuUwFvkGw5TpAvDPD5mrCfUFG44YYu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZmRw6nJZmmJ3oB1R9o7fjsIjUNKxvqYmiANiWgX+JFujKMSWN6+5RLD5wp8Z8qq2
	 Rwbk8inB0HFKfzbjZkRs6FK3aX84bAFlXvImKdNEnnDgdyjhWB6t2PwNsyoPUf0qfz
	 JlcTU4OYKLdgXyrYs55Ek0ziOGHUgF1aTB/f+YTnmxtDmvfgF4em3TcObTSBg0+Ckh
	 vteZDpHcjgGTfLI+Fn8aDcoi4UhtTOXSmnjDRvzWoI7GUqcQeZX7FwV9hRvKb6mlEI
	 86q76+kP5j4LvybWodauHSN21Gub5ZPZEjnRTmjvbyorGpNqh+AsNJn8Yvbl1W1P3x
	 c9OPUeAUdxZ5A==
Date: Sat, 10 Jun 2023 23:21:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
Message-ID: <20230610-shaky-candy-5114b855e2eb@spud>
References: <20230610204225.1133473-1-bigunclemax@gmail.com>
 <20230610204225.1133473-2-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230610204225.1133473-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_152205_467068_32159BDB 
X-CRM114-Status: GOOD (  11.40  )
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
Content-Type: multipart/mixed; boundary="===============7254154028095366082=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7254154028095366082==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tsbDwtX3UkzIgwos"
Content-Disposition: inline


--tsbDwtX3UkzIgwos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 11:42:18PM +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> Add a binding for D1/T113s thermal sensor controller.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

btw, please try not to resubmit patches while there's still some
discussion on the previous version, as things are likely to get
lost/muddled.
One of the downsides of email!

Cheers,
Conor.

--tsbDwtX3UkzIgwos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIT3hQAKCRB4tDGHoIJi
0pqaAP9XIUE94BjJUfjdeVAqkpCWVHs0k1o4amUxgGuGEWCJPgEA+CKVVZxSDEQm
j92laT4D1unIJ2y7+HMuphbA7JSAvQ4=
=mHXG
-----END PGP SIGNATURE-----

--tsbDwtX3UkzIgwos--


--===============7254154028095366082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7254154028095366082==--

