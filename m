Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A81C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r+wUx9QXNfZdqv70RAAWMtoL11F9iUq/yV3hC79OLo=; b=f3R7iV3YconEMXJeweJW4EbfEV
	vuRobZ0NW+pMX4mWYDoa4+I8qpCdk0cXhimONIv/vrL4tmpf6In2R99ZCV8w/bobDg/LvZ9x2JCxR
	CopHfSwUrIL2PUHXQJUvKTGIaqdiWShlXNKz2HzQNLF43sW6r63apqB+nPMnmhVfA8DbBDKeeJiGy
	hSH+Z5lJNF4SKZhthzODxdM548Ubs529U7E1GkX+aD0XxyO1ka6wUZLGumTy1B7heyIqk9ymK/Wc0
	0VRKT9OTmXk3eSpTAzbROrm5Svt8W4CkEGPe5QsAam+ez+ro7r7WqRlmTXbylUZuveJOCe1SKxKx8
	c8fydDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgRw8-000000063DJ-0T1m;
	Tue, 20 Aug 2024 16:42:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgRw5-000000063Cp-0JtK
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 16:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 895EBA4021C;
	Tue, 20 Aug 2024 12:42:13 -0400 (EDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDD9C4AF60;
	Tue, 20 Aug 2024 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724172139;
	bh=sdAcQwOaXWXKLtRmNTbqfHXhoFfXI/j3eIOc/WaewSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJt0DoJyvzXw780huXW00DpsfVtjUmG4t0IyBqCD6PLjg4hifTkikh1R6+7NrJBhR
	 T64DDjPlw+P97zLarW882gu1krW29tGBNvBP/PWPmKUP8RN+fxCg7BkXFBzp9hyKV/
	 BSrvNn5wmGF4uR8AUjT9xjgqrOQWKtt7hMb+I/6M6psreBJuPOjY6WC2KWueXjL4YE
	 SrLOpDpx9ZM6bNwbJdQTrCPQxXC+gsEzLhiXHpaY49wVxbs4KQOOfKfr3ApXXJwaf0
	 sQ9hzGEnPcXHlg6+dFla6w5CBBD32h63XVR1W/2TYDoZTYXAAR0y2IdvL12ITRr7bk
	 iXthrwpi4hUYw==
Date: Tue, 20 Aug 2024 17:42:12 +0100
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
Message-ID: <20240820-computer-viewable-eef06bef1bea@spud>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
 <20240809-slapping-graph-461287bac506@spud>
 <ZrqsqsCtKwfG4Q5B@ghost>
 <20240813-strode-revival-07b8556a8bfe@spud>
 <ZsPP4GMwPVBfq+fL@ghost>
MIME-Version: 1.0
In-Reply-To: <ZsPP4GMwPVBfq+fL@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_094221_266396_7E09C111 
X-CRM114-Status: GOOD (  35.35  )
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
Content-Type: multipart/mixed; boundary="===============0270275288310557786=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0270275288310557786==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t0GCzoRN/+6zEXXN"
Content-Disposition: inline


--t0GCzoRN/+6zEXXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 04:06:08PM -0700, Charlie Jenkins wrote:
> On Tue, Aug 13, 2024 at 04:55:27PM +0100, Conor Dooley wrote:
> > On Mon, Aug 12, 2024 at 05:45:30PM -0700, Charlie Jenkins wrote:
> > > On Fri, Aug 09, 2024 at 11:31:15PM +0100, Conor Dooley wrote:
> > > > On Tue, Aug 06, 2024 at 05:31:36PM -0700, Charlie Jenkins wrote:
> > > > > xtheadvector is a custom extension that is based upon riscv vector
> > > > > version 0.7.1 [1]. All of the vector routines have been modified =
to
> > > > > support this alternative vector version based upon whether xthead=
vector
> > > > > was determined to be supported at boot.
> > > > >=20
> > > > > vlenb is not supported on the existing xtheadvector hardware, so a
> > > > > devicetree property thead,vlenb is added to provide the vlenb to =
Linux.
> > > > >=20
> > > > > There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 t=
hat is
> > > > > used to request which thead vendor extensions are supported on the
> > > > > current platform. This allows future vendors to allocate hwprobe =
keys
> > > > > for their vendor.
> > > > >=20
> > > > > Support for xtheadvector is also added to the vector kselftests.
> > > >=20
> > > > So uh, since noone seems to have brought it up, in the light of the=
 issues
> > > > with thead's vector implementation, (https://ghostwriteattack.com/)=
 do we
> > > > want to enable it at all?
> > >=20
> > > I can make it clear in the kconfig that xtheadvector is succeptible to
> > > this attack and that it should be enabled with caution. I think we
> > > should let people that understand the risk to enable it.
> >=20
> > I think the clearest way might be "depends on BROKEN"?
>=20
> Sorry for the delay, I am not sure if BROKEN is the best way of doing
> this. There is the generic CPU_MITIGATIONS config that I think we should
> use to handle this at boot time. This would allow generic kernels to be
> used on the platform, but a kernel config of "mitigations=3Doff" would
> allow xtheadvector to be enabled. I'll look into this a bit more and
> send out a patch. Palmer merged a patch into for-next to enable
> GENERIC_CPU_VULNERABILITIES for riscv so I will add ghostwrite there
> as well.

Palmer also pointed out to me last week that not all implementations of
xtheadvector actually have the flaw, so it makes sense to not depend on
BROKEN. We should figure out exactly which CPUs are and are not
vulnerable (Guo Ren hopefully will know) and permit enabling it without
"mitagations=3Doff" on the CPUs that are not vulnerable.

Thanks,
Conor.

--t0GCzoRN/+6zEXXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsTHZAAKCRB4tDGHoIJi
0iQaAQCwGmipLGnRD4s+x/LBC6nmlI/0+Dt9WrwL3fRDmnQB0gD/W6WolEvdmFdM
5PFKmr6VraPXpNU9m8waceXzejLcRgs=
=gadf
-----END PGP SIGNATURE-----

--t0GCzoRN/+6zEXXN--


--===============0270275288310557786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0270275288310557786==--

