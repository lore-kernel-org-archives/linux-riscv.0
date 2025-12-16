Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62287D609BB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBqbv+uRHX4RLpV/NMTdh1Kmy8owWD+paIwWeC9IBi8=; b=JHO3mEod8G6j7O/2PWV/bStxx6
	tH0VBWB1fw98AawkV9wkVbut/tU5L5jF34AmAU/F4iCCgcfzrVQP44fRdOhLBtZYYVUdUwwWPRs0R
	Qd4Yrwtvh80r/37DrANsXcdOtZGN2pR2Rvsif0oWXb6UEJ/k1mQvll9r10GPI1GmLqvxwQJTROLSd
	k7u0UaNO7ENvuqJNaaewZG2QWje9RHAgmRyJYS3Tr+7WQavrkQryVLgQifHVOSpIwdz1SYmEa/B9V
	4VXNFtLY4HQ3GwubJu6Vb3zpkbXaPnIwIJzYhHl+z0DEy+Zx2fk4l0+u+vJamS+eYC/dmO1I/L30m
	3BiEys1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6H-00000005Xkz-1ZaG;
	Tue, 16 Dec 2025 16:40:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6D-00000005XkH-2gMZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 16:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45D784421C;
	Tue, 16 Dec 2025 16:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79251C4CEF1;
	Tue, 16 Dec 2025 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903233;
	bh=IyXZRoNRbL0WbL68f2jfKpHRWTYsrTX6ecv3orlH2DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pz/uO5OAcXJwx0OQVP3qbACJTye9uv10Z3DI4Ykogwt1CZtIx9ay+xEYXYEuezOFC
	 2xUkESb204/GWq+9luBZc2ufVfi2mJh52bE65akZWXCoHPa4LUPvBIKPXVt4A/03Vr
	 ELW4yE+TmYCgglEZkKVeX0qe2xKnBHx4YmTSTPihmCjpl7io26dBXgyE/VzwemUMZU
	 GmrRvXWFdn+vZ/8RJTbye2iJrBMniUCbILF2WW0F4GmmCgpiZ/SIijFQX5TYv9SKH7
	 YiduLD0GFgiNu3jJPOD1whIOL6ITvoT0wCywGIKRo0h2lL8ZQGHuA13XYO3PxLkefy
	 qf0UgrAaoUWCg==
Date: Tue, 16 Dec 2025 16:40:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: timer: add SpacemiT K3 CLINT
Message-ID: <20251216-reexamine-civic-79110198c948@spud>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-2-a0d256c9dc92@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251216-k3-basic-dt-v1-2-a0d256c9dc92@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_084034_916267_3140B5A6 
X-CRM114-Status: UNSURE (   6.06  )
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
Content-Type: multipart/mixed; boundary="===============8443090176381245180=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8443090176381245180==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oiXnzifGyDDDbsIe"
Content-Disposition: inline


--oiXnzifGyDDDbsIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oiXnzifGyDDDbsIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGLegAKCRB4tDGHoIJi
0hwwAPoDrtroebIfLkFlyWTb0bc8LgUEOYjMYPCEYfw50ls0rwEAiNLuqpsrff8R
wHgSUxm7Hd6joVfLniWEW5RfZJviEQI=
=b8Yc
-----END PGP SIGNATURE-----

--oiXnzifGyDDDbsIe--


--===============8443090176381245180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8443090176381245180==--

