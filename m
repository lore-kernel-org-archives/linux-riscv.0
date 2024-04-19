Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A28C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nV1WxIdhw7PrBArAH9IKvRGtGt/J538J65lscI97mMY=; b=u4BOoQAo/2O1WokKjb82Uki1TY
	ub7bcuguS0a/cl7uN0an5HpN6K42nyyPXT9Z15cIbLJ3aUIHR3RP3/eA2QUFblDzxWReIYbVGIAW5
	fyTTQL4UkKkyMapFftlGTZJzgW4RRRNJp0RxfXRKgRw67yfjKBLvuux5AGvo/pr9atHwj67DF0XjV
	J1ZJUBM6zlMSc5Okc8HFApX/LK6dh0t356DC/MO19gvYIpGbnIp/M+ewl6w4gKqwYVfWI8AMfChhe
	0tfd+ckXtdPcywZz/Bf5sMrL5xzmA+3SZaaVjOuC5xUSGCeA7w9kgrdZrWambwSwpVQ4N3epUvdjj
	Qo8pYjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxm5K-00000005PJR-39Jt;
	Fri, 19 Apr 2024 11:07:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxm5H-00000005PHE-0DKw
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 11:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41E7061921;
	Fri, 19 Apr 2024 11:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F72C072AA;
	Fri, 19 Apr 2024 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713524829;
	bh=mSXR23jlHV5BHfSPWs++D8AqjLUnBZW6KvQt4xvDWn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOJiKRH/i1llOBMc2CMgBDL3F3E/3VccV26cTv1L6cZFWS1mAsts0JddOoI8RtZJ/
	 sFvJ8WAMS62lPPwqJPfXeiIs1B2uDfRZ0aUi6NIF194jTM4e62zjho7c08+ogwB9nP
	 3rwG02HkzCiWv4icSHaTCSg5v8DFarZSz6xIG8YdrTDxgSrxdZCYvSyYpJ/k4zx0AB
	 dEIDMCp3o3SuO1QXCbrm73nAbabvTHZ5l7GSQxUbWYk1HNqOMLLGJ15CBcIEhu1apr
	 KHc8F9HpJx5aicTAnc7MvjJWrNS4KQ5QGaTgUpxwniej0/XCP+1CNeez4SZSr44gKC
	 5YkLwbpYH5mnA==
Date: Fri, 19 Apr 2024 12:06:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: clarify what some RISCV_ISA* config options do
Message-ID: <20240419-excretory-dwarf-ba817cc725ea@spud>
References: <20240418-stable-railway-7cce07e1e440@spud>
 <20240419-ea2b867f6bde90e711464c95@orel>
MIME-Version: 1.0
In-Reply-To: <20240419-ea2b867f6bde90e711464c95@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_040711_203755_A8141681 
X-CRM114-Status: GOOD (  24.26  )
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
Content-Type: multipart/mixed; boundary="===============2240551575276010848=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2240551575276010848==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXxXh+HAbGw7IqI4"
Content-Disposition: inline


--xXxXh+HAbGw7IqI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 01:01:52PM +0200, Andrew Jones wrote:
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 6d64888134ba..c3a7793b0a7c 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -503,8 +503,8 @@ config RISCV_ISA_SVNAPOT
> >  	depends on RISCV_ALTERNATIVE
> >  	default y
> >  	help
> > -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> > -	  time and enable its usage.
> > +	  Add support for the Svnapot ISA-extension when it is detected by
> > +	  the kernel at boot.
>=20
> I'm not sure we need the 'by the kernel', since I guess that's implied by
> being in a Kconfig help text, but either way is fine by me.

I think we do, given some of the options are required for userspace to
use it and others are not. Distinguishing between them doesn't cos us
more than a few characters so I think it is worthwhile.


> > @@ -686,7 +687,8 @@ config FPU
> >  	default y
> >  	help
> >  	  Say N here if you want to disable all floating-point related proced=
ure
> > -	  in the kernel.
> > +	  in the kernel. Without this option enabled, neither the kernel nor
> > +	  userspace may use floating-point procedures.
> > =20
> >  	  If you don't know what to do here, say Y.
> >
>=20
> Zicboz could also use some clarification, right? Or is the fact that
> RISCV_ISA_ZICBOZ enables the use in both the kernel and userspace the
> reason "Enable the use of the Zicboz extension (cbo.zero instruction)
> when available." looks sufficient? Maybe Zicboz should follow the
> "Say N here if..." pattern of V and FPU?

Yeah, I think I just overlooked Zicboz. If the kernel option is needed
for userspace to use it then yeah, it should follow the same wording as
V/FPU.

--xXxXh+HAbGw7IqI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiJQUwAKCRB4tDGHoIJi
0rtbAP9iMXxB8DrBGngeQXmuQC3Wu502D171FBM8vEvzq+o1VQD7BWq3wCFfhv3g
/BYUFiY+cP49HKDaH0fQQzqtPLw5IQ0=
=xrDK
-----END PGP SIGNATURE-----

--xXxXh+HAbGw7IqI4--


--===============2240551575276010848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2240551575276010848==--

