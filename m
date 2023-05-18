Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C84C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 21:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4T6EXi9UbB4D6749IGVXgWaph6hbb6O2CvEYzg7bwo=; b=Ci2z2MCBIExFu0viUMgICXO29b
	f4SAQwDbHBTbh5/ZTiG2JpKiSKAB6feUElgEpF1ugrn6WlP6tSBmZwXzEcphZxgEOsUUJQqw9S34m
	DOQOQxmir8l28bIJZsIe2QovmLJDFLvdG+kUkcK8Qrhesr0IWzf3F7jSj85QMWXAMMCICUC+LEX1W
	xK0iO/hpxWz00Gr7cY9XVO2WSAxdsjOj/Wlh8SaGuMm6+Tm72g8WZa6el6ZCiFUEdK4/rr3F3Yhou
	fjDx7ytUtCa+GRoZvZ94qFqiDtsH4FFt1PLnwSKX21xT9/xQtyBbDu537ml2+e+7ON+4MavRaj9me
	zfI4nxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkyE-00EDs8-1X;
	Thu, 18 May 2023 21:15:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkyC-00EDrI-0i
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 21:15:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B14D961592;
	Thu, 18 May 2023 21:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C84C433D2;
	Thu, 18 May 2023 21:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684444531;
	bh=0GbRJmmb0szX5Z8KR+w8kYqd1Pn/50zYZ8c5pZKtZ6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGosN9iS6qcYJgmfGiTFfLMjRkSUz3iR3zEFShczRoYHaoEbnAhJpVYT2epeomjZB
	 /lNAmQsSOMNzrQb+Ostyy6U0jifRJJHKtJZizGLP2x153NW/pjARAaQ1gSPJB3mZjr
	 4nvtDobnAOm3ki3FUtbPtI/zH1l7f9tCqZRWHEvuKEPULRM7AQO4eatNkNB7BwXsvj
	 XEksc4kNZof/MzHIgjFmlZPCj0+NqcgVkEcUrAEDjZQV/LVqGnzNMp1T0hourHzZtz
	 j6J0/sOVv2VqH5jbNVL1SZnPSz1tGTAbJEFO3vQqx1VsAK7ATnMw/Tf8hQNAufux/O
	 6ttcsVq3EJn7A==
Date: Thu, 18 May 2023 22:15:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230518-rebalance-crushed-e9887935e886@spud>
References: <20230518-reactive-nursing-23b7fe093048@wendy>
 <20230518-dandy-bless-fbd1e2c23dd0@wendy>
 <20230518151425.fy45t6brs7a7rmdm@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230518151425.fy45t6brs7a7rmdm@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_141532_322123_A32E66D1 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: multipart/mixed; boundary="===============6019397120625650903=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6019397120625650903==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0BfJ5Y3OwcESuf5w"
Content-Disposition: inline


--0BfJ5Y3OwcESuf5w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 05:14:25PM +0200, Uwe Kleine-K=F6nig wrote:

> Thanks for perseverance,

It has felt a bit like it was never going to end.. Hopefully I don't get
some customer asking why they're limited in period options.

Thanks for your perseverance in reviewing it, at least you got someone
nodding along to your FOSDEM talk out of it!

Conor.

--0BfJ5Y3OwcESuf5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaVbwAKCRB4tDGHoIJi
0k3BAQChZNCcWspoAd2XAqkDwy2CUQcxetYLpBikSE0flsdVJgD/Wxqb4T9tXEw+
4pYome42taVpjqOtyrThWWAAT9b1IAo=
=p+on
-----END PGP SIGNATURE-----

--0BfJ5Y3OwcESuf5w--


--===============6019397120625650903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6019397120625650903==--

