Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55090C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USaQ/e3VV2wa3VHdiA7FwngECeH0TKQivW4stXRBPpk=; b=Tw8Hp7507qgF1T9kr53ecuqyH6
	ZSYkK0Ks20g8Mh1frIOcRJEikh6evzkiZI058Qju81vjX7GvcBRCyrEy2RWq9JW1agNtUMjq6sHpi
	+FqLgdEErRD4ECLSds1oRbJY2iLh7eSl2crF571JPLxXU7n2deo/bTH2uZc5fw+AbxYTUEurIARI1
	tXUBhk+VeJRemFp0N9hMJZp3n4D0GNYcbKEyxQkPQi0jMxSxWy5LSUFLXRNydSTegyvOKFxTfbvlX
	pZa1WhB2YU+2tLF3mbztQfHYwWAxRL/Ks39/TFNql0qsi/+XVcBQymPdODnFwT3FNtyqPg44De4df
	A7Z+ZUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdts2-00000004Gy9-0wpt;
	Tue, 13 Aug 2024 15:55:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdtrz-00000004GwE-24mm
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 15:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BEF576174C;
	Tue, 13 Aug 2024 15:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B120C4AF09;
	Tue, 13 Aug 2024 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723564534;
	bh=2qbznLVAWa/HOCkibpwEKuFx9BRG0jfLiyGPm/O5D0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdDaa/og08j0LYWxMjIfmT62Kse6nlmDNAqFUWXRmeAOd4L8HUcdtoNGpFIKZ2ovK
	 Wo8eroMPA7ljNcvycCtAJoCPSOW0sL4ez8CU0njPbAl5s4w3e1pL1xt0z/5bkAsd3W
	 AyI8VSs3BZHOYosptDMzpeCBZYGxHn2H8y8LbYAnhcsMLr91GM20TL0ixceE9tPfzb
	 Vx1zlFj6nEUair4k8rdOYdoG4DTk8CIJwZHafLxB8o8P/RrW8+9bZFSBxfXNpqDFNr
	 VwMB5tfnO4Fx23eAhjULiqlqOWHy4r2C5DEKNZSBu0vrreLkayROtBxCfuvWvflTI4
	 xxXxYgEv0gapw==
Date: Tue, 13 Aug 2024 16:55:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v9 00/13] riscv: Add support for xtheadvector
Message-ID: <20240813-strode-revival-07b8556a8bfe@spud>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
 <20240809-slapping-graph-461287bac506@spud>
 <ZrqsqsCtKwfG4Q5B@ghost>
MIME-Version: 1.0
In-Reply-To: <ZrqsqsCtKwfG4Q5B@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_085535_644669_8D55E83A 
X-CRM114-Status: GOOD (  23.91  )
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
Content-Type: multipart/mixed; boundary="===============1832788651176568277=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1832788651176568277==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wVALGEdsN5/GZu0E"
Content-Disposition: inline


--wVALGEdsN5/GZu0E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 05:45:30PM -0700, Charlie Jenkins wrote:
> On Fri, Aug 09, 2024 at 11:31:15PM +0100, Conor Dooley wrote:
> > On Tue, Aug 06, 2024 at 05:31:36PM -0700, Charlie Jenkins wrote:
> > > xtheadvector is a custom extension that is based upon riscv vector
> > > version 0.7.1 [1]. All of the vector routines have been modified to
> > > support this alternative vector version based upon whether xtheadvect=
or
> > > was determined to be supported at boot.
> > >=20
> > > vlenb is not supported on the existing xtheadvector hardware, so a
> > > devicetree property thead,vlenb is added to provide the vlenb to Linu=
x.
> > >=20
> > > There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that =
is
> > > used to request which thead vendor extensions are supported on the
> > > current platform. This allows future vendors to allocate hwprobe keys
> > > for their vendor.
> > >=20
> > > Support for xtheadvector is also added to the vector kselftests.
> >=20
> > So uh, since noone seems to have brought it up, in the light of the iss=
ues
> > with thead's vector implementation, (https://ghostwriteattack.com/) do =
we
> > want to enable it at all?
>=20
> I can make it clear in the kconfig that xtheadvector is succeptible to
> this attack and that it should be enabled with caution. I think we
> should let people that understand the risk to enable it.

I think the clearest way might be "depends on BROKEN"?

--wVALGEdsN5/GZu0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZruB7wAKCRB4tDGHoIJi
0tDJAQCrAAwyJAAGcGaB0lSjHQowc1+M+60A33xWLVpFubDEggD+PdA/5VviAMYd
FtjIx2BGIAbBB5DLVfsxw4duVA3eAQc=
=/cR1
-----END PGP SIGNATURE-----

--wVALGEdsN5/GZu0E--


--===============1832788651176568277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1832788651176568277==--

