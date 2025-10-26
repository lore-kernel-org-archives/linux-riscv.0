Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B80CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 21:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5m1pYt/fYH6fyzHcjs4tlp22E2hXhh/X/pFsEehJrM=; b=TFgZdjtw8amlbcNHQgAWvMRTWs
	+PKL9vbEWEf++UgL6cakhOUXKgEjn4UrkbK0yXoTdg0k11ZsJimjC0kE7/BN4StsCjSZaHVgrOtY+
	LEFPKTBHilP/HMh8+6txg/GIIyVGYJN1mj/sEu4mOv1bIo4IzddT/ZvB0qh+dOOeiXgJNQ1k5cQ/5
	gSacCU6XYtazVaTlux07B5HeBHowYJYd3kGsTm6xou/V0+OREl9H+mK4HbGL/7oVoHkpzFnyvjPzf
	4CtoAsHIapfT+VtmyEIiO3UzIcTkaV/vxl8XgZJhUhWsI0Pu1CvhdzIECe10jD9CXJLDEwLrrnpXO
	Y/GInqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8XD-0000000CmKN-3ebt;
	Sun, 26 Oct 2025 21:44:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8XD-0000000CmK9-0Kgv
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 21:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 784906040D;
	Sun, 26 Oct 2025 21:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0191CC4CEE7;
	Sun, 26 Oct 2025 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761515058;
	bh=R0wcc8nBYPNtNsZgoclsUuWvcDYQ/fWNcQurv3oEFFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4I8beub56lCXDtQIIagRhZqCf1bllEDpY3pxIA5Dcbx7FonZGyEcgla/0yTWVv8N
	 8BqIY+tucyymuIdV2DPISSxzeeXVFrwQ6QjiXiUE35LcDNXWn8Lw9XowOdA17NVbdr
	 6Wtmkd9zZs4MCmQr3U1b+o6KLW2N1769htiwx+YuEc25ish0S2nx/yBUw4239n4WRO
	 7V+B6Gnr8vlewOifX/Rhi5YKOcnQxTe14oHdnJW7CZtzPX/PUgo6Rz/ugjqrRSs+N1
	 89S1fmoI2Rb37fl4yUG/7OaCCSyoSYn5jv01asHXGeUW54TmI797JQ20loFvabHJQN
	 PJ1h/DoOtDzsA==
Date: Sun, 26 Oct 2025 21:44:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20251026-registrar-impart-0f714e11e410@spud>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
 <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
 <20251025-shakable-jujitsu-3a5e9c8895a5@spud>
 <ugmphokne6ssc7ou7apvbldxg7xxk24wp5jrzdasjiplnu6gfy@ebbuxnjqlsw4>
MIME-Version: 1.0
In-Reply-To: <ugmphokne6ssc7ou7apvbldxg7xxk24wp5jrzdasjiplnu6gfy@ebbuxnjqlsw4>
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
Content-Type: multipart/mixed; boundary="===============0634275400819810611=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0634275400819810611==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rdoDAXfg92n9Nn02"
Content-Disposition: inline


--rdoDAXfg92n9Nn02
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob, Longbin,

On Sun, Oct 26, 2025 at 05:47:32PM +0800, Longbin Li wrote:
> On Sat, Oct 25, 2025 at 01:44:00PM +0100, Conor Dooley wrote:
> > On Sat, Oct 25, 2025 at 10:27:13AM +0800, Longbin Li wrote:
> > > On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:
> > >=20
> > > > > ...
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: sophgo,cv1800b-top-syscon
> > > > > +          - const: syscon
> > > > > +          - const: simple-mfd
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  "#address-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +  "#size-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +  ranges: true
> > > >=20
> > > > Do you actually use ranges?
> > > >=20
>=20
> Actually, I do not use it.
> I added it following Rob's suggestion in
> https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/.
> Should I drop it or not?

I don't know why he suggested it, if it is not being used. Rob?

--rdoDAXfg92n9Nn02
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP6WKQAKCRB4tDGHoIJi
0ineAQCnx3f0EpPMqkkkFJY8iwI9lwZHPviAEyjHA0s0o85JLgEA7KvXDig05rNH
efVLx5OW3aA366PJ2D35x3+QPI785go=
=H40P
-----END PGP SIGNATURE-----

--rdoDAXfg92n9Nn02--


--===============0634275400819810611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0634275400819810611==--

