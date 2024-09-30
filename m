Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9F9CE8373
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mu72L9kZaFYTrZYBM+/qgLzXf1FcKeIU1jgkYZy3SdU=; b=IsT6L2T+PkNYzXri+fIbvUL91J
	WfdZIAGxXGPAbuSBuTOKT1UGpLbVfcDAlCDxcGfkgGDAxAttQS88Rhe8yOjSSXKr4bXGx542n5Cnw
	229VKVLT/Y4qt5Ut4txZglSfUuhMU8lGd+DEmaCt6g6l9zBtkjU2Gxl9YJVh1HyORACamiLh8yvFc
	MXnDUMLz8F1bldm/0Tw7KUSJ7g/HKWY0mIBDHjkQLkJBb8Ez+XM+1t9DuZnIqUpn5S3s/5upjOPAX
	tm34+3nUW7pT7qifvVw5fjwC1Pza7j3ExE7LpghMBy0aE8aVi03di0PzGwgVA5xgRJxe4W+1rqgoa
	pcDEIq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJKJ-00000000EqI-0VmB;
	Mon, 30 Sep 2024 16:32:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJKF-00000000Epu-47LV
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 16:32:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1svJK3-0004om-H1; Mon, 30 Sep 2024 18:32:31 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1svJK1-002fmI-S5; Mon, 30 Sep 2024 18:32:29 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 71A61346DF7;
	Mon, 30 Sep 2024 16:32:29 +0000 (UTC)
Date: Mon, 30 Sep 2024 18:32:29 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 01/20] dt-bindings: can: mpfs: add PIC64GX CAN
 compatibility
Message-ID: <20240930-voracious-hypersonic-sambar-72a1c5-mkl@pengutronix.de>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-2-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-2-pierre-henry.moussay@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_093244_040400_B1047274 
X-CRM114-Status: GOOD (  10.44  )
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
Content-Type: multipart/mixed; boundary="===============5411544560736727733=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5411544560736727733==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3vfz4jn6utc6r4q"
Content-Disposition: inline


--w3vfz4jn6utc6r4q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30.09.2024 10:54:30, pierre-henry.moussay@microchip.com wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX CAN is compatible with the MPFS CAN, only add a fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>

Who is going to take this patch/series?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--w3vfz4jn6utc6r4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmb60poACgkQKDiiPnot
vG8ztwf9FfTevY46BOb3reEY53hT0hxZT5Por2f2CeBT/2LT2pbj8Dv2by2HQJbW
KMbHzms1wdCP80EEDhLWa8KRKDNGb5uEP/OpGNMFw8G189KidS0XIRIF2CilHESh
muohcWHwDr5N1Te40j809WQRcGSnlporsoc+YHdOviE74d5TsW5fvsdL1TJa29nB
xoPG8nmdIPOs0b/fYK30kIIQxSItwQMyT5eO+MwBoUqHGpwcQYLMzDr+CyMaUtb/
dz0D/hcjEjqtUyFQCqZQ2wZs9OTyhxCMx6FpOVK/PIF9ZTZpSk8FZqdRij/m77hq
vKGe3xjy+6GirBkzeBuBn8Lj1+binA==
=RlVK
-----END PGP SIGNATURE-----

--w3vfz4jn6utc6r4q--


--===============5411544560736727733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5411544560736727733==--

