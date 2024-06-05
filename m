Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68F8C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgFqmEBtjG3m8a9KqQHOk0b33vzY7qnba0uOFvMvGc4=; b=nnZFsZ4q8MWXJSyjT52V+sY0qN
	9eCGq1HDVpuBAdJS674I538nXF6pQnCCJNVrOj5fizzDrIbwszeEClwAPzTZz7/4AJjLR8qogOFcz
	JXmzjJZSQInfcSRVjFqcRg/EBU3GwVNZVzhg9XgE9xP7G/SdW8M8I4WCPxYDtAqCH1hj63zMuYQQP
	LR2VdPzP/umamSMFcJFL8fl4Hcr6CSgEQQtnbAq8mvjT9Cqiy05KX8F+sY4qTm7norNg9NUyX/Kb3
	rz76tjF10BhqiLIOEaA+0W9+wIZBc1Wx4EEXLGTVoNpccDYmqtpEAcDVxYv+kS5nJPHuqk7nbF/iK
	Q5cxSDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEtbL-00000006roM-0hCi;
	Wed, 05 Jun 2024 16:35:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEtbI-00000006rnU-0Wih
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 16:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ECB9ECE1874;
	Wed,  5 Jun 2024 16:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB2EC2BD11;
	Wed,  5 Jun 2024 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717605297;
	bh=xUjOgD1MyQ9M5v+aEoVa+5lBN47le78b6xl8mERqNMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQBIbr1KCC2UDPT1LxhnakDfxnaoCREnhIPWuz0dcxbM21NXf3c5aD2MLx1YzZ75a
	 0504O+ZkHJ90rqRDmXZfBSKzybYjRdR4LuG/xKKeehpAvnzDx0i5ylN5qL2E/8MGmQ
	 9LYLUZx1Is3g88LL47P80XZHqOva46h9iDq2af82/j39TkZxQ71WBJiFVZN+Y79vVw
	 MJVxUAzzLTl7Ub5TvfwqP/zs8aY4wC95C64eu5LQEsWDHTQZi9xGpl7x/9Egvggr7B
	 jABJvOFRQzf4uk7JXGc+YjUhza+k6b3hdy9Ru9WEtoLLyTKPRPpSPzhUM0xvq+9luL
	 7uWNo+RBv7REw==
Date: Wed, 5 Jun 2024 17:34:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Erick Archer <erick.archer@gmx.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v0] RISCV: Report vector unaligned accesses hwprobe
Message-ID: <20240605-swipe-giant-2f9659fbf430@spud>
References: <20240604162457.3757417-1-jesse@rivosinc.com>
 <CALs-Hsu5LakOVKvGRP0-sbq5ptH8FLPGhBAkupv3tRLKVAdnUA@mail.gmail.com>
 <20240605-bullfight-ivory-b0151ad2b987@spud>
MIME-Version: 1.0
In-Reply-To: <20240605-bullfight-ivory-b0151ad2b987@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_093500_371990_605831B3 
X-CRM114-Status: GOOD (  18.69  )
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
Content-Type: multipart/mixed; boundary="===============7920942431983440760=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7920942431983440760==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8xKL+FQLxTuCrMWr"
Content-Disposition: inline


--8xKL+FQLxTuCrMWr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Jun 05, 2024 at 08:54:21AM -0700, Evan Green wrote:
> > On Tue, Jun 4, 2024 at 9:25=E2=80=AFAM Jesse Taube <jesse@rivosinc.com>=
 wrote:
> > What value should be returned when V is not enabled in the kernel, or
> > V is not supported in the hardware? Currently in the code it would be
> > UNKNOWN, right? Is that what we want, or is it worth differentiating
> > "no support for V" from "I don't know the speed of misaligned loads"?
> > Maybe UNKNOWN is the right value, as there are other values to tell
> > you V is not enabled.
>=20
> I think UNKNOWN is fine for !V, assuming identical definitions as scalar.

I dunno, maybe we should set it to UNSUPPORTED in that case, but there's
probably some funny behaviour around the v prctl we might need to be
aware of. If the system has vector, we should probably figure out the
actual speed is, but not report it while vector is disabled from the
prctl?

--8xKL+FQLxTuCrMWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCTqwAKCRB4tDGHoIJi
0iTYAQDoRc7CTqJQPG3KQEVPKCP3+Otu7uuOldxgilGh0Fu6VAD/Twk8nc9C3hfp
zLZbFEP0/FzGD0K2QtWUaQT0WccX7Qs=
=dr74
-----END PGP SIGNATURE-----

--8xKL+FQLxTuCrMWr--


--===============7920942431983440760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7920942431983440760==--

