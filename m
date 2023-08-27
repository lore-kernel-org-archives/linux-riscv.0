Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61B7C83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCVfPXce7zeX7C7+RQ9AgBlAYh2k+mc1LYdag2dNjO8=; b=xrj+GVcBHho581Yy9yRIfoSMWk
	Z7NeGNSANsDCPS/02rVVG6xhE9QAB72UYDHmYXrNPXRsot+YWP42Irb9So2wS52TFVDmmrjJpUPW7
	W8Qlb5XzLXQqma3qJScL7R9VGstIF8Bs1JGwC6N6PTEY+iiAghPlv9vEgvrHawAKA1DamEYxWKsai
	BrXKg4N3vBVLP24Au4omb95lMYwVvT9IKNP2NpmFXRHvJjTCQ2wzWAqTUCfk8jCyfTilS3EZAW69y
	ixn9M3eSZaBrM40k57ODCnZ1HxrGJn5EFOoQDWIG5/mHW4eFsw7Q+SEGvwxzyZxP1oiupeXqy2iOL
	1RFLu/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEBi-007zbE-2O;
	Sun, 27 Aug 2023 11:44:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEBf-007zau-1U
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 11:44:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BE2F6116A;
	Sun, 27 Aug 2023 11:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44ACC433C8;
	Sun, 27 Aug 2023 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693136648;
	bh=IcVpAPNpIn17kOmFoY2QEQ5tyz9Ce608Zcrvuu2eoDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJ2S5Td307+0hg/FuzqdroPc9RdJAq5ugOFbsX/GmGcaNyRZwdwxFgYxTzTAvjkNS
	 d7atn6Qw+m2MMNhJ1/o1zKeF/YtXwSsavhcSVz+jSv3as8EmHAj6Dz99nteRwbzPhI
	 M2JIPbisa6Yhx3tpRN1pwTnlMlGeJKvYuQFbzkodaRc/wY9oFjHtaNFp1RRXt2aSpR
	 uuV070JlcvstONA8dxC9J03aax83uTvK7PD9PXEHsvQwRALmQK6Gw02AJUknKEL9e4
	 1O0pgExL7DRTCaP/mVuHI+pj4qYwgQBKeQi965vyJjCco862dYW6uMToHbqtRWDyyF
	 W/NJdyDG5SQqA==
Date: Sun, 27 Aug 2023 12:44:04 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Nam Cao <namcaov@gmail.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] riscv: Only consider swbp/ss handlers for correct
 privileged mode
Message-ID: <20230827-dispute-platform-83b494acf090@spud>
References: <20230827114003.224958-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230827114003.224958-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_044411_638164_93C8F60F 
X-CRM114-Status: GOOD (  17.79  )
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
Content-Type: multipart/mixed; boundary="===============3036267883914879557=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3036267883914879557==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zntgtklq8QDoOTU5"
Content-Disposition: inline


--zntgtklq8QDoOTU5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 01:40:03PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> RISC-V software breakpoint trap handlers are used for {k,u}probes.
>=20
> When trapping from kernelmode, only the kernelmode handlers should be
> considered. Vice versa, only usermode handlers for usermode
> traps. This is not the case on RISC-V, which can trigger a bug if a
> userspace process uses uprobes, and a WARN() is triggered from
> kernelmode (which is implemented via {c.,}ebreak).
>=20
> The kernel will trap on the kernelmode {c.,}ebreak, look for uprobes
> handlers, realize incorrectly that uprobes need to be handled, and
> exit the trap handler early. The trap returns to re-executing the
> {c.,}ebreak, and enter an infinite trap-loop.
>=20
> The issue was found running the BPF selftest [1].
>=20
> Fix this issue by only considering the swbp/ss handlers for
> kernel/usermode respectively. Also, move CONFIG ifdeffery from traps.c
> to the asm/{k,u}probes.h headers.
>=20
> Note that linux/uprobes.h only include asm/uprobes.h if CONFIG_UPROBES
> is defined, which is why asm/uprobes.h needs to be unconditionally
> included in traps.c
>=20
> Link: https://lore.kernel.org/linux-riscv/87v8d19aun.fsf@all.your.base.ar=
e.belong.to.us/ # [1]

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308271841.HlnnHFL7-lkp@i=
ntel.com/

Delete these, LKP did not report the probes issue. The LKP bot says:
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags



--zntgtklq8QDoOTU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOs27AAKCRB4tDGHoIJi
0uIzAP9VFVImAMhEoiHMLw6VZPzHi34oUeM90dG0Y7fIejzh9wEAgHzA1d7ozX0G
/DMHBJX7ykfHPJlmz6CkOUW7IuMugQo=
=0HR+
-----END PGP SIGNATURE-----

--zntgtklq8QDoOTU5--


--===============3036267883914879557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3036267883914879557==--

