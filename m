Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF57C46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDEdRpwBSXGeLrLk/PpYl24huE4tcVwA+a3uKvWUo5w=; b=Kxs2+Nli/J4ywFhWoaNTJoadtU
	aAzmSefuTt9uiQBWTnLIPgqb29ke7VfaCn3jB+8MJkFs1yWI02Acwk44KaNcB3pwaYrf8BNaDCIIg
	KhDpDbvyxEuuP/Qk6ZIjtD90YDZIbwEhC1Nm1kn58wBNyhYo/4xUORaLtxki3plU2O5KMpSA6S15m
	pJ1TN0CH32ozPsLmFZxyN1Rt1YHb5TTzgIfu4VpFqQguhMMPw4VRX5gMCIa1/+MPH7SOwwsXJtdfr
	1vuz3LPQlNQqRTCUEh7dYrtetFDAy17VbJYAJTXstJKxdH7AWkyPrUhno6slCJosfX4qBWKPy0apO
	HSAmKOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgxF-001Ndw-Kp; Tue, 03 Jan 2023 13:03:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeNj-000g0T-7T
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 10:18:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9185B6120E;
	Tue,  3 Jan 2023 10:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA7CC433EF;
	Tue,  3 Jan 2023 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672741134;
	bh=HSkVcDE93TTwdgQxX+NA/uwZL5WLjZtqGQP1f8SU5p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agDOiY9giFZqyqoG3aX1QNO2DsCG6ek4ASaFfVcZKSsPpBPaioUkl+2uUMGUC15L/
	 4IHlfN8H0PS2uvrpzIBZfK6QApOSQPNvGVPxXUE7TbvTW2PzcRmBmK6+NsUGBzePXI
	 htwc/2oRapfGIZv0ZSnT//3WVwCLjEj+FwbgARQsYhWYVexmank2TaBYKThcBQ0m2a
	 goB5v27HnyHmT6/rleh344S3IwvZnJ4FtwAu05i+iZk/zWRUN3ucJKj++LeG66qhtY
	 jsegLAStQZI4KzVYDdp8HjiXxy6JOC7hgEJ5nDfy0HqTEJK3ILq6N0nLognr1QC5WS
	 bBNETEftCZ+3A==
Date: Tue, 3 Jan 2023 10:18:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, uwu@icenowy.me
Subject: Re: [PATCH RESEND 2/2] riscv: errata: prefix T-Head mnemonics with
 th.
Message-ID: <Y7QBCeqh96rKmZvf@spud>
References: <20230103062610.69704-1-uwu@icenowy.me>
 <20230103062610.69704-2-uwu@icenowy.me>
 <5641668.DvuYhMxLoT@diego>
MIME-Version: 1.0
In-Reply-To: <5641668.DvuYhMxLoT@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_021855_488226_CDFE4392 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8438472899497970995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8438472899497970995==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hAPl3w13QUb7Di8T"
Content-Disposition: inline


--hAPl3w13QUb7Di8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> T-Head now maintains some specification for their extended instructions
> at [1], in which all instructions are prefixed "th.".
>=20
> Follow this practice in the kernel comments.
>=20
> [1] https://github.com/T-head-Semi/thead-extension-spec
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Hey Icenowy,
This (yet again) appears to not have made it to the list.
It's not on patchwork, nor lore:
https://lore.kernel.org/linux-riscv/2668919.mvXUDI8C0e@diego/T/#t
https://lore.kernel.org/all/2668919.mvXUDI8C0e@diego/T/#t

Since you CCed lkml & not just linux-riscv, but it is not showing idk
what's wrong..
Your reply to me the other day came through:
https://lore.kernel.org/all/dda144a8397a175f3ce092485f08896c9a66d232.camel@=
icenowy.me/

Thanks,
Conor.


--hAPl3w13QUb7Di8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7QBCQAKCRB4tDGHoIJi
0tAGAPsFQ8k9MUuX4iWMfvfLGnFocl2dh5/008Fu0QoDJl3+aAD9G/mDs4wbC+hu
PcisOihXXbQQPYBicsUO15UAgnF7Tgo=
=Q0QQ
-----END PGP SIGNATURE-----

--hAPl3w13QUb7Di8T--


--===============8438472899497970995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8438472899497970995==--

