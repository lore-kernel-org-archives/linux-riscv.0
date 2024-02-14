Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C575DC48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlnEeEzPJL4wUUK+gY3GnWAzjS+Nn89+nTQcFIkb2nU=; b=XpTuzLpxZqr0e4GqvnIjBAyOq9
	4mM4Iy5zY4mE/d938TxOpwH4bZqP1qM1F0jZjIhWN7kAnet7o3rfJ6KnL0u/doXTGuDKfCGSaZjCX
	kG5HKzcqx86q6M4X856xZed/Rb0/maY7jzx5iHq/ir8XYQr5pygHJzvrFnr9cCJGVzNDd8lf48zm3
	I7gpTOOKpIQ/nE0UNDSeA3JYEGKunG2BjEvFyT1w8rVP5fR4UowzI1jT8cgSM4uajgPbqv+rkAaXo
	aM7liBNhoNQ2JtgjjRvkr+QxWTnV8J6NkhZtzBr5sNkB8QYZSXQaxlxix1kk5AqVKkrXzCGwRm1jH
	O6U/PKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBI7-0000000CEed-3WTl;
	Wed, 14 Feb 2024 09:10:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBI4-0000000CEcp-0duu
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74F8ACE20B6;
	Wed, 14 Feb 2024 09:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0549C433F1;
	Wed, 14 Feb 2024 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707901849;
	bh=fNHUiW86EzkCwmyziYTavgpL3+buKSWAsMq0nNd8g1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFha+yhylkqUtTXMsTN1o3cC94Lqz5mRBorfN1ynQAhsRuTPCND6xdFvCAVxP8UnH
	 j53tzf1t/bknwvX7gemXzOBwKvwg8CVxwkbzbwX5gtDZO3Csw0EzdNU97gza31P2y1
	 W2bSdop/WIJMXVnNYL0hhF3aWfVBDxfOL1mGTf2w1d00WOzXmscT+jsDrhw56r0a78
	 VJX6YW92hncjV/s+eWF50LC8Z5Fwd2Wgai3eZj6tqaOZ4ZiwCb/frAv/RWXmG+ZTOo
	 Q6WVUkK0F7/2jrYBin9ZXtjlqMPojSBRXk6HFo8me+lSltqe1QTPPbaDaH35OBG4Q6
	 9RtTmfcsiTkXQ==
Date: Wed, 14 Feb 2024 09:10:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: dts: sifive: add missing #interrupt-cells to pmic
Message-ID: <20240214-stoplight-banjo-b446d2d322f2@spud>
References: <20240213-protegee-shoplift-c9bc09f62a7a@spud>
 <4854dbc3-7c35-432d-b991-0951496eaa2b@sifive.com>
MIME-Version: 1.0
In-Reply-To: <4854dbc3-7c35-432d-b991-0951496eaa2b@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_011052_420010_A8C05327 
X-CRM114-Status: GOOD (  11.52  )
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
Content-Type: multipart/mixed; boundary="===============5963912937168315841=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5963912937168315841==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iIM6nDrH4LCobvFl"
Content-Disposition: inline


--iIM6nDrH4LCobvFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 03:49:53PM -0600, Samuel Holland wrote:
> On 2024-02-13 1:47 PM, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > At W=3D2 dtc complains:
> > hifive-unmatched-a00.dts:120.10-238.4: Warning (interrupt_provider): /s=
oc/i2c@10030000/pmic@58: Missing '#interrupt-cells' in interrupt provider
> >=20
> > Add the missing property.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Applied so, thanks :)

--iIM6nDrH4LCobvFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcyDlgAKCRB4tDGHoIJi
0qIsAPwM5vDe/hVF8UGr42xgRBmwIis7xs5FoEPp7AVsAj9RTwEA9e1RbbN42Wdl
R4qJyYFP+7AKO+PT781tnfhDyyVcRAc=
=WPk+
-----END PGP SIGNATURE-----

--iIM6nDrH4LCobvFl--


--===============5963912937168315841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5963912937168315841==--

