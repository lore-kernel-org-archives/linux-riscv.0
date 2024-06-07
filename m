Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B84C27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 21:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzXXHNdlgx6OYaaeJ8/4pSsMCU+U17EuvRhO6l5QHrs=; b=Ah7a+Q18go3PEy87Z19G7fBO16
	kmLZDHGo7BRZcJM0VkROWpm5IxmPm2D7efVBVohp2inVR8VrsWUESj2F5nZZdYCRYhAO+WUQUDE1H
	3pkiURH43mJsoFozjZh/lwgAg7fndILJJNEhPsfL2iia82hJz/ehslXPsKhOFHUVkBky93muPZovu
	c4t8o1rHDlk3jUvrA2kmpuwmr29WkJpu6BwR5dDhUSj+lsRQs+1n+1vjA0Ooi0Rzwk/me4eE+Ia0N
	NzIAss/8ZcgsVncfbThlO/ycvoS2on5h3AduHHGln56Pdyzp78p9i7K3MZ7KQoyylTzMZf9akRpQF
	bLGZ5nUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFh1g-0000000Fgdl-2Rgb;
	Fri, 07 Jun 2024 21:21:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFh1d-0000000FgdK-39ak
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 21:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB1D062067;
	Fri,  7 Jun 2024 21:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA52C2BBFC;
	Fri,  7 Jun 2024 21:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717795286;
	bh=4jVn0C4rP9izfuziEvxAHgC5wbR9Zw6PLZ6CYGJjwdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrCH+MBoJS1yRbTDYvFTdCKXFdTUcuwZz2Vu/J2EMfRx7GatNZwNGhtrcxRaoUOqB
	 2rOopd1WJ5V3DW6C2/1pHzQuIyMWV33jcgWvJANTIJ9smixfH6KtFJHEMtHix/fnj8
	 /jLnRUK+bTq13jYncBAj7VKfqJFEPpTH4YgTstFS5KMbsbaPP6bxaeA43xbrq3DBf/
	 D2MET/98UnTx+g3tnVazFolQgsNtv3lyBX4f5/ZaRaTfy+8YZzdqgYY9X98FpxmINH
	 YMKkONwJ6pin9hS5bt5ltx3j0qT7JX+macyrot/+ZvJ20DytxDt6I042NaeTftxgqE
	 TT+Q3CKLzwz8Q==
Date: Fri, 7 Jun 2024 22:21:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RISC-V: Detect unaligned vector accesses supported.
Message-ID: <20240607-wildfowl-baggage-54f622e18c4a@spud>
References: <20240606183215.416829-1-jesse@rivosinc.com>
 <20240606183215.416829-2-jesse@rivosinc.com>
 <ZmIqM3Cuui0HAwN1@ghost>
 <ZmJCq7bsglq7olSB@ghost>
 <a16ccf51-4b06-4c6d-94a1-cb43dc3f2945@rivosinc.com>
 <ZmN2U6BDAYRXxHEi@ghost>
MIME-Version: 1.0
In-Reply-To: <ZmN2U6BDAYRXxHEi@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_142129_940533_8632B81F 
X-CRM114-Status: GOOD (  19.22  )
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
Content-Type: multipart/mixed; boundary="===============3576380014974133711=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3576380014974133711==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8YS9Sx3fQh2vamL3"
Content-Disposition: inline


--8YS9Sx3fQh2vamL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 02:06:27PM -0700, Charlie Jenkins wrote:
> On Fri, Jun 07, 2024 at 03:53:23PM -0400, Jesse Taube wrote:
> > On 6/6/24 19:13, Charlie Jenkins wrote:
> > > On Thu, Jun 06, 2024 at 02:29:23PM -0700, Charlie Jenkins wrote:
> > > > On Thu, Jun 06, 2024 at 02:32:14PM -0400, Jesse Taube wrote:

> > > > Please use the exising UNKNOWN terminology instead of renaming to
> > > > SUPPORTED. Any option that is not UNSUPPORTED implies that unaligned
> > > > accesses are supported.
> >=20
> > Conor didnt like using UNKNOWN a proxy for "SUPPORTED"

I did say this, but in the context of wanting you to actually add the
performance probing (and potentially the other infrastructure that
Charlie added for scalar).

> > Having SUPPORTED is better then assuing the speed to be slow.
>=20
> The HWPROBE key is about misaligned access performance. UNKNOWN means
> that the performance is unknown.

Right. I also don't think that assuming "slow" is even problematic -
seemingly all extant hardware doesn't even support misaligned access.
But really, just whack in the probing, it shouldn't be too bad, right?

> The scalar and vector names need to
> match up.

That's definitely not the case. A different hwprobe key is allowed to
behave differently, but...

> UNKNOWN was already merged and is supported by linux so if you
> want to use SUPPORTED here then you need to add a scalar SUPPORTED key
> that is an alias of the UNKNOWN key.

=2E..this suggestion of a scalar change I disagree with anyway, so it's
moot. Unknown should be a state that we only have internally when we
actually do not know, and not something that userspace should ever see,
unless there's a bug in the probing code IMO. Unknown gives userspace no
actionable information anyways.

> I would rather keep UNKNOWN as it
> is, but that's up to you.

--8YS9Sx3fQh2vamL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmN5zwAKCRB4tDGHoIJi
0jBSAQDIvHDI37c072Vzga9uhMAIgoc0xvFIzXF+e0LwVNEQ/AEAysNxEGOD0UHM
UlCyN4BTtw9qVQIFJcyKgqX6txxrVAs=
=4Qyu
-----END PGP SIGNATURE-----

--8YS9Sx3fQh2vamL3--


--===============3576380014974133711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3576380014974133711==--

