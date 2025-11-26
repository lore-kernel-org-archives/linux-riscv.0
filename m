Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20420D10F21
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOzmT2fm3wEdfA9NVtSPMEHpbNaK9lrAemXJbPM8wkg=; b=k2G0IBM8b1OIMGb7+fpPAFNCJj
	S58+b1Hi8xtdOzQWUYBIgTmx+bBQz6ECeM6zbXapu58Hk56ZYv4yLfzHj7KkYoFR/gy147WR9huD2
	UHt1cqOKQiVMKsz5pCjWXO4Co7lCm6d2+XM6VzRDYUDnNKlXR/SoqfPDt6hCN2NG96ejcmw8L6aV1
	8URhtASFNipCfq+6wikbAQrX5gTjpaoSgLEi3aVd1HmWx+W8tBip4vSCegpIlnN6W/2pyYnnJwaUr
	pjwB3jKrmW2A57WJBTKK7WlV/nEz4l55kVKYBFyMWoD4iozjrIWvtnCcbMNr27hXigkwyFuGgh8g6
	cUi2/R5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCn4-0000000EnYh-3pu1;
	Wed, 26 Nov 2025 10:30:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCn2-0000000EnY0-1qMu
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 10:30:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOCmt-0002y4-Ty; Wed, 26 Nov 2025 11:30:15 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOCmt-002aVC-2E;
	Wed, 26 Nov 2025 11:30:15 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6098D4A898D;
	Wed, 26 Nov 2025 10:30:15 +0000 (UTC)
Date: Wed, 26 Nov 2025 11:30:15 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [net-next v2] dt-bindings: can: mpfs: document resets
Message-ID: <20251126-rapid-quokka-of-wizardry-4f8c58-mkl@pengutronix.de>
References: <20251121-sample-footsore-743d81772efc@spud>
 <20251126-famous-hummingbird-of-fruition-13a9ac-mkl@pengutronix.de>
 <b1511382-1fce-4a1b-a1c3-962a05fc07b5@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b1511382-1fce-4a1b-a1c3-962a05fc07b5@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_023024_478745_CB5DB7EA 
X-CRM114-Status: GOOD (  12.88  )
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
Content-Type: multipart/mixed; boundary="===============6452940931654554989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6452940931654554989==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mru2i5tjkbyuvlgv"
Content-Disposition: inline


--mru2i5tjkbyuvlgv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [net-next v2] dt-bindings: can: mpfs: document resets
MIME-Version: 1.0

On 26.11.2025 11:26:17, Krzysztof Kozlowski wrote:
> On 26/11/2025 11:24, Marc Kleine-Budde wrote:
> > Hello,
> >
> > can I get a review from the DT people?
>
> We don't always review each other patches, so you kind of have DT review
> already. I can review, but I just did not plan to review this... less
> work needed...

Thanks for the quick reply and review.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--mru2i5tjkbyuvlgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm1rQACgkQDHRl3/mQ
kZwl/Qf+MI4CbcnKrFEQv7+JuZl3o+Jrg14DSr5/3l+5gdJZSbMTK5xO5N+Z5Ih4
3K4cXamu9YqHL6ZmUpIyOt+qOeTBTeK0wvgggakllupDMldabe6qqPauUkdl4zvf
cwm1mMQgGHpRzBJvgf12EE4aGVCq/LVJe/ojeZmc6pKM5+721hLEUtEjLii+V+FR
ZkX8fbTjQ6VRX+3NtR/bleoCHljy0YnBMqUGCe/2EpRJJAsYWTilDMPXnuREnnAV
DP85ydg8HUBaEzvMzQyygtU1BLlGHUHXONEMToGf8BR2hHtbB2287Xb4sSva0FUJ
IlQ5JYQ3HfvHf+FTtA1IthD/jLQokw==
=izFg
-----END PGP SIGNATURE-----

--mru2i5tjkbyuvlgv--


--===============6452940931654554989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6452940931654554989==--

