Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BEFC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg6AWmNeM+gytCPEXdWPuJ/3pJKKqjocEp5ZI4G8GRw=; b=xDy8qIbvGUGNwYcR2q0dcpz3Ug
	L1XvZmWOBPebs1El8CnjJRPi/TvWvR9oC3lxy/EFK4Zsjray/q330bB5lAW0dua+bk7M5HFaa4mWb
	m6vsauFHTJycGRwEZmhGivmWA7pwIZ+re9hmlIrEUfbT7v5UlcnFUpwoTumPnxBp+BJ/KI636BVao
	sdTw05KS533zZy+Mxqb/57Bdk4gvyubUDiK+F07AyzcCBPdHh39RDXnX8kQpGu0FfDjWXumQmOtk5
	Up878MsvLy1tbszF/k7bwEEecvGTI5QIhi+ncbB87DAemeIIf5taSY+m2/8gH+w+vf1nUUDTbCTwx
	y4YZ2Iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lPY-001YRd-2g;
	Wed, 22 Nov 2023 11:28:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lPW-001YR2-2K
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5E559CE10A8;
	Wed, 22 Nov 2023 11:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6C2C433C8;
	Wed, 22 Nov 2023 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700652527;
	bh=nd29HlBeBDrnX7RmuEDzI2lVmEwQmMASfSYYYr5JFg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4caps0ZnFGaM00pnG5/NA9htCJdRb4ndMuCq99cMHA4qlxlfdFxt+gAiZVWidUQP
	 wJinw27dr8gIyIZ3LqhnJYvgYm5HD7qNM46e188lnUiW1EgI3+cfSxM0HmBC7Z3WuF
	 1auiMro9qE/todxKFWQJcnAndlMB85RyRNTMGVG8QwN8Ijf1jocygipaPOuqVvua9/
	 UN+aw3lRemlbYj3vWem//BZyF2htvlHZMBsVBHmgnDHMKvn1L3KtjS6MUm+vkuJF7o
	 zr95EvAe4GxPjiTLTyK6fNQ+AU87niZLWULgpyhbBCo01IhWzoOuWsGXeGVHQc/2Sm
	 xo0WwHIn9HULg==
Date: Wed, 22 Nov 2023 11:28:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: Remove unused members from struct
 cpu_operations
Message-ID: <20231122-undiluted-five-d40876e02215@spud>
References: <20231121234736.3489608-1-samuel.holland@sifive.com>
 <20231121234736.3489608-3-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231121234736.3489608-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_032851_011325_6B9C95A0 
X-CRM114-Status: GOOD (  10.18  )
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
Content-Type: multipart/mixed; boundary="===============4231349981206130299=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4231349981206130299==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gXVNW1QTj3aHYLp1"
Content-Disposition: inline


--gXVNW1QTj3aHYLp1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 03:47:25PM -0800, Samuel Holland wrote:
> name is not used anywhere at all. cpu_prepare and cpu_disable do nothing
> and always return 0 if implemented.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Part of me says this should be split so that it can be partially
reverted whenever we grow users for these, but I doubt that the
implementer of that will notice nor that anyone will remember you
removed them. Certainly wouldn't object if there was a split though.
I guess in general this was a case of copy-pasting stuff from arm64
that we did not yet have users for.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--gXVNW1QTj3aHYLp1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV3l6wAKCRB4tDGHoIJi
0kl1AQDhseUuUd0jU6qSScl/lRKQnVwGX8tlmltIkuT/WI8aCgEAwZuWythyAXhC
jdsv0bHcPQywC95asqRQCp5PUulYBwQ=
=1A/a
-----END PGP SIGNATURE-----

--gXVNW1QTj3aHYLp1--


--===============4231349981206130299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4231349981206130299==--

