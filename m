Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180C0C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vTlKiGEMV6b3GU4nfk+Q/C9aQWJKwtoplJNJ99i3fY=; b=N83m8ONlMSW7GS5z1pwGAUSBQC
	o3aTHgRArsK9kCFb2l6uMIWArG9MoRsdxuUlLTLL87cUMpfaaSo9ed0tC6wn1jNluxrvuk7ARwQy9
	tc6i70U4sAvv7pTC9i38IcxHW3jxsGZ5toTiE4nmUUTJCf2QZbqx0Yokn4i79URrOSnV4+zzqlk6e
	O9CaC2AB3V8b8tzo6owoTW7JgEwTF2c0kI8F5c+eDvHuVbsY67XtHKZRFtvcYQXJpvzbKpbUCaAO9
	qnSToFJrah0odpt8Fu9gLGSM32eDKRJmhTApVV42p0H654dOpEmZIn4R9rgTTq127qWLRNzJTAc8w
	WRk6Tmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU40E-0000000DmzK-2ba8;
	Wed, 17 Jul 2024 12:43:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU40B-0000000Dmxo-459K
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 12:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D98BBCE12E9;
	Wed, 17 Jul 2024 12:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C45C32782;
	Wed, 17 Jul 2024 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721220194;
	bh=o8L/1xWvvMqYhwIVZeAmc5Si5NeHaEu+RWc4qcM9T60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQLsAH+F7TI4KWqV18Ro9auCg3owA3fv1+BKhqGEUi3MLpBWNzYAsXAlAGjIJcI+0
	 Nw55t19kP6Yy7KtLF3IsJ27P5ppkwTx0W3CNCmUMeRETt0X6ee6okjTeRCbPayE/jD
	 ntnqVuP6nGl6mnWDvywqJzy5AJgPFxuTylxzJsnnyoBuBLcP0UYCuce1QCLLTMlMkQ
	 WNfTo0nUbH2Wg6/OKE8/3mdIAmhfokzp2Gw4BpMyvsBnhgkvs8n4X4Dh0UGYq0wVvM
	 UWWtXtxwjociB63ylyOXKYjtd+wgG4+5a8EnOCifYSNSB4wVxXit3QHIGZKftzmzJF
	 IugLKiBDRcLlA==
Date: Wed, 17 Jul 2024 13:43:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] riscv: Allow to build only with LLVM >= 17.0.0
Message-ID: <20240717-catsup-corny-def9db822c4e@spud>
References: <20240717111716.157149-1-alexghiti@rivosinc.com>
 <20240717-synapse-decade-a0d41bd7afce@spud>
 <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_054324_376111_7E371E32 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Type: multipart/mixed; boundary="===============3104627560150669802=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3104627560150669802==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QHQw7inv+90Ljupu"
Content-Disposition: inline


--QHQw7inv+90Ljupu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 01:41:23PM +0200, Alexandre Ghiti wrote:

> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomme=
nt-1645979992 [1]
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-l=
kp@intel.com/
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > If Nathan wrote the patch, you need to set him as the author of the
> > patch :)
>=20
>=20
> I thought I did, how should I do that then?

$ shazam 20240717-synapse-decade-a0d41bd7afce@spud
Grabbing thread from lore.kernel.org/all/20240717-synapse-decade-a0d41bd7af=
ce@spud/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 4 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH RFC] riscv: Allow to build only with LLVM >=3D 17.0.0
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  ---
  =E2=9C=93 Signed: DKIM/rivosinc-com.20230601.gappssmtp.com (From: alexghi=
ti@rivosinc.com)
---
Total patches: 1
---
Applying: riscv: Allow to build only with LLVM >=3D 17.0.0
$ git show
commit f64f8420ca518b5dde35224cfff7ccfd14e5b496 (HEAD)
Author: Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Wed Jul 17 13:17:16 2024 +0200

    riscv: Allow to build only with LLVM >=3D 17.0.0
   =20
    The following build failure happens when using LLVM < 17.0.0:
   =20
    kernel/sched/core.c:11873:7: error: cannot jump from this asm goto stat=
ement to one of its possible targets
   =20
    This is a known issue [1] so let's upgrade the minimal requirement for
    LLVM to the version 17.0.0, which is the first version to contain the
    fix.
   =20
    Link: https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment=
-1645979992 [1]
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-lkp=
@intel.com/
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
    Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


When you commited it, you needed to set --author. Just adding his
signoff is not sufficient.

Cheers,
Conor.

--QHQw7inv+90Ljupu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpe8XQAKCRB4tDGHoIJi
0hl7AQDHfW37RGUzqroCvREuQMRJha3XF9ktK9M72+YjcNoGHgD/apWw+RC/zTmt
Lk8+0u1e05REJLDm6x45cI++lSGY9gU=
=OrOa
-----END PGP SIGNATURE-----

--QHQw7inv+90Ljupu--


--===============3104627560150669802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3104627560150669802==--

