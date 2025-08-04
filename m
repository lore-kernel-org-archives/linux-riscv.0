Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B97DC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5w9ga3gfwTm/2Be0Myni0bq6/E5RtW3R1G65daDFqg=; b=D3ZJCdcs2NP7I1IEj4QwWDnk0L
	yGgVAockw8joFrbbvvt6+yvw0IFkM8XYz3tkJAQFboV5yGcJlyDGs9GDcfGUaxGNP7I067BXtbu35
	Do6WlPtuSTf3qGCf+Wvn9Hhs1h+J0EeJ43uIqRMe/1MOLuUFBTnahEDKEd3FjQiuT+oSK5OBs5BFE
	qtHS+tqP4p+iUy+RBwldSUrSHcdYeqCrvGl9yPphnYUJVsewy92RaErrAlYS/B+R3tRKe3TxLfDbq
	xwCeOuIII7QtBykoeaHYOgk6h0iLBF3fbs7IKmPe/mrvcyXcmamUva6V6VrzT7HKHKQQ/CAZyz7OI
	mSkjuJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiso7-0000000AE4D-1uv7;
	Mon, 04 Aug 2025 10:52:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiseb-0000000AD26-0Nrn
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 10:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34087601D5;
	Mon,  4 Aug 2025 10:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454C3C4CEE7;
	Mon,  4 Aug 2025 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754304171;
	bh=m0mT9t4kvDpPBL2vj8DzXbWcyAMZuJv68f2sAk/zW7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMu2BTKqYSW0T7uFORi5MGJsjdnf9qzViR8XS8FspKLpKVV2YfL/gXg4TrFaZC+KV
	 JbaQi7/hz+yNhBFguxW6sXiUz330/bkY+s4vVPTxVtxagDlwFYV12aFLPrDrEyTM5J
	 PrvoSU/Zoz7CyzmzSI1219YaVjG78/T6HNq/uHLuvDo1LS3YqLgSRR4qE+vDcJNXMy
	 ZBknZKXgpsguVktH364EEkLngDBIPMLore0RRalQrwUYljWg+4qFuL70IFGE/10qfz
	 BcYpSDwzhSfc8tHCl+Ks9fmWx10VfAGP0s8wohh1Cn7nsidc4bVOuj0opGpnRB+QfS
	 DUIvXzQgUzzEg==
Date: Mon, 4 Aug 2025 12:42:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Nylon Chen <nylon.chen@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.16 41/85] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
Message-ID: <zecmbmpzmgjaccbjq2rh5z54ryqaqkbxup27yq7lzrxtncrqpn@4bmmk4bnhoai>
References: <20250804002335.3613254-1-sashal@kernel.org>
 <20250804002335.3613254-41-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250804002335.3613254-41-sashal@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============4273746914220698090=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4273746914220698090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="va72grwbkcpsl3ni"
Content-Disposition: inline


--va72grwbkcpsl3ni
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH AUTOSEL 6.16 41/85] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
MIME-Version: 1.0

Hello,

On Sun, Aug 03, 2025 at 08:22:50PM -0400, Sasha Levin wrote:
> From: Nylon Chen <nylon.chen@sifive.com>
>=20
> [ Upstream commit 7dbc4432ea6bf9d709391eb57f1e9fb44e99845a ]
>=20
> The `frac` variable represents the pulse inactive time, and the result
> of this algorithm is the pulse active time. Therefore, we must reverse
> the result.
>=20
> Although the SiFive Reference Manual states "pwms >=3D pwmcmpX -> HIGH",
> the hardware behavior is inverted due to a fixed XNOR with 0. As a result,
> the pwmcmp register actually defines the low (inactive) portion of the pu=
lse.
>=20
> The reference is SiFive FU740-C000 Manual[0]
>=20
> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b=
16acba_fu740-c000-manual-v1p6.pdf [0]
>=20
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Link: https://lore.kernel.org/r/20250529035341.51736-3-nylon.chen@sifive.=
com
> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Please drop this patch, see
https://lore.kernel.org/all/52ycm5nf2jrxdmdmcijz57xhm2twspjmmiign6zq6rp3d5w=
t6t@tq5w47fmiwgg/
for the rationale.

Best regards
Uwe

--va72grwbkcpsl3ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiQjqYACgkQj4D7WH0S
/k4iBggApLj6vvJ2LMGHqDHEQN/u7J935iBi0I94MQlm/tIYmPbHnvNB9xBcob/B
ayq17ymltOYUuOzBCWf5QI7O2Amb7tZQ4b7Teg/EmuSvBUR8cfDiMAD7iR0VzX6v
u3jiXXOGIIf92EqD/ss2p/kR8AZl9k4YletARjoiulGEzXfS2YxoFm6CVoD8RNKe
WOGCGRXr82DZbYu0NB1oczwTqT7fjCIxF5yV9q7Qr1Cu+s3S4pLkWDAki7u5rjg0
mWfew9WUmTq3EgbznyF+GjJ94EZK99/j6XBiiLRgwD+G+KO/PnGeT9+vx1829cUU
VeCbx/X9p+FhpGeY4F0WQCdGWD7k6g==
=4nYN
-----END PGP SIGNATURE-----

--va72grwbkcpsl3ni--


--===============4273746914220698090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4273746914220698090==--

