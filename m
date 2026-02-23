Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D6BEA4FD8
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl620gB6jC5ag0uFfrUDfPnw2GEfnUb97rZwobUfZLA=; b=fC4ZuX3DxqEMd+fBulwo6AxISB
	Zb/MiOeYKBGj7b7O1JTSwG5AUj0HamN3MGtzm3GUeT+zmuQDn2GgX+EI/rx+b6g3Sid6n0XcusNTl
	0eVo+jPC5a8gUiWCij+Ms74AHZqTFWlw5+zjoOA7lBHAxav977MMgYAozrU/BNZyQ1pH4XX/kdi83
	GWe2bSuwky3c7ck88CS2VYdOuLFLDhSEL04vxZPKhpPdVbecag7BEyrQEJMT0Q8gxDPfPGx76JC6D
	2YaY2r3WcGAA63Li7GFEdqbWI/nhR1nhtcU6N/OYA9Uhhai/QZKA0S1PCKLK58NlqGP+1SrNkMRqy
	VHRuybPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXrA-00000000ZbU-1pn8;
	Mon, 23 Feb 2026 15:28:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXr7-00000000Zar-1uLw
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 15:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771860497; x=1803396497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGk+H4006zmMAlGLukg7Ze2tiNB+iOK4R4Mit7+56iA=;
  b=GREdi4etyoVZduocyFVdAFnOeUVq5yVUMm5B2qcvGntakoMLtsD1ZfW1
   f+b83wFv1yUpITs+BKO3WlQVm/5TexUFzKF04Ug3qJWA6tGa9b9ibMcfj
   J5pJAYndu5mih2/+Hs5pP/s9WKj96w7sBOo05VjfjOLELA/5eaqmODGLY
   2Iaq352Z56QQrBldTHHXu1e8YBCxVhdvfMone1+vaoDUPciliXH4Dxwky
   Sa+Vtp7gH5RL410mdMXtNzpsze6uaTm85YMdyT1AlKT1aH0Hp1/LTUk4C
   WOjt4yVcqGxmfqkMo38nqUzFpcBLowPPckYp2aDUFFm0EMlkk+DRS4y3W
   A==;
X-CSE-ConnectionGUID: bzMGrKsuTG+NBUg/lZ3EpA==
X-CSE-MsgGUID: 5B74SaMqRq2mAvJBLiyEWw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; 
   d="asc'?scan'208";a="221005511"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:28:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 08:27:34 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Feb 2026 08:27:29 -0700
Date: Mon, 23 Feb 2026 15:27:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Puranjay Mohan <puranjay12@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Andy Chiu <andybnac@gmail.com>,
	<linux-riscv@lists.infradead.org>, <alexghiti@rivosinc.com>,
	<palmer@dabbelt.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Mark Rutland <mark.rutland@arm.com>,
	<paul.walmsley@sifive.com>, <greentime.hu@sifive.com>, <nick.hu@sifive.com>,
	<nylon.chen@sifive.com>, <eric.lin@sifive.com>, <vicent.chen@sifive.com>,
	<zong.li@sifive.com>, <yongxuan.wang@sifive.com>,
	<samuel.holland@sifive.com>, <olivia.chu@sifive.com>, <c2232430@gmail.com>,
	<arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook
	<kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	<llvm@lists.linux.dev>, <pjw@kernel.org>
Subject: Re: [PATCH v4 10/12] riscv: Implement
 HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
Message-ID: <20260223-respect-chaste-60c3403b5bc9@wendy>
References: <20250407180838.42877-1-andybnac@gmail.com>
 <20250407180838.42877-10-andybnac@gmail.com>
 <20260221-repeal-emphatic-ddc2e9b94208@spud>
 <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_072817_881324_B6D842E0 
X-CRM114-Status: GOOD (  40.41  )
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
Content-Type: multipart/mixed; boundary="===============5029772673235048513=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5029772673235048513==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k/9IywnAJZZAgTS4"
Content-Disposition: inline

--k/9IywnAJZZAgTS4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 03:18:17PM +0000, Puranjay Mohan wrote:
> On Sat, Feb 21, 2026 at 12:15=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > Hey,
> >
> > On Tue, Apr 08, 2025 at 02:08:34AM +0800, Andy Chiu wrote:
> > > From: Puranjay Mohan <puranjay12@gmail.com>
> > >
> > > This patch enables support for DYNAMIC_FTRACE_WITH_CALL_OPS on RISC-V.
> > > This allows each ftrace callsite to provide an ftrace_ops to the comm=
on
> > > ftrace trampoline, allowing each callsite to invoke distinct tracer
> > > functions without the need to fall back to list processing or to
> > > allocate custom trampolines for each callsite. This significantly spe=
eds
> > > up cases where multiple distinct trace functions are used and callsit=
es
> > > are mostly traced by a single tracer.
> > >
> > > The idea and most of the implementation is taken from the ARM64's
> > > implementation of the same feature. The idea is to place a pointer to
> > > the ftrace_ops as a literal at a fixed offset from the function entry
> > > point, which can be recovered by the common ftrace trampoline.
> > >
> > > We use -fpatchable-function-entry to reserve 8 bytes above the functi=
on
> > > entry by emitting 2 4 byte or 4 2 byte  nops depending on the presenc=
e of
> > > CONFIG_RISCV_ISA_C. These 8 bytes are patched at runtime with a point=
er
> > > to the associated ftrace_ops for that callsite. Functions are aligned=
 to
> > > 8 bytes to make sure that the accesses to this literal are atomic.
> > >
> > > This approach allows for directly invoking ftrace_ops::func even for
> > > ftrace_ops which are dynamically-allocated (or part of a module),
> > > without going via ftrace_ops_list_func.
> > >
> > > We've benchamrked this with the ftrace_ops sample module on Spacemit =
K1
> > > Jupiter:
> > >
> > > Without this patch:
> > >
> > > baseline (Linux rivos 6.14.0-09584-g7d06015d936c #3 SMP Sat Mar 29
> > > +-----------------------+-----------------+--------------------------=
--+
> > > |  Number of tracers    | Total time (ns) | Per-call average time    =
  |
> > > |-----------------------+-----------------+--------------------------=
--|
> > > | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (ns=
) |
> > > |----------+------------+-----------------+------------+-------------=
--|
> > > |        0 |          0 |        1357958 |          13 |             =
- |
> > > |        0 |          1 |        1302375 |          13 |             =
- |
> > > |        0 |          2 |        1302375 |          13 |             =
- |
> > > |        0 |         10 |        1379084 |          13 |             =
- |
> > > |        0 |        100 |        1302458 |          13 |             =
- |
> > > |        0 |        200 |        1302333 |          13 |             =
- |
> > > |----------+------------+-----------------+------------+-------------=
--|
> > > |        1 |          0 |       13677833 |         136 |           12=
3 |
> > > |        1 |          1 |       18500916 |         185 |           17=
2 |
> > > |        1 |          2 |       22856459 |         228 |           21=
5 |
> > > |        1 |         10 |       58824709 |         588 |           57=
5 |
> > > |        1 |        100 |      505141584 |        5051 |          503=
8 |
> > > |        1 |        200 |     1580473126 |       15804 |         1579=
1 |
> > > |----------+------------+-----------------+------------+-------------=
--|
> > > |        1 |          0 |       13561000 |         135 |           12=
2 |
> > > |        2 |          0 |       19707292 |         197 |           18=
4 |
> > > |       10 |          0 |       67774750 |         677 |           66=
4 |
> > > |      100 |          0 |      714123125 |        7141 |          712=
8 |
> > > |      200 |          0 |     1918065668 |       19180 |         1916=
7 |
> > > +----------+------------+-----------------+------------+-------------=
--+
> > >
> > > Note: per-call overhead is estimated relative to the baseline case wi=
th
> > > 0 relevant tracers and 0 irrelevant tracers.
> > >
> > > With this patch:
> > >
> > > v4-rc4 (Linux rivos 6.14.0-09598-gd75747611c93 #4 SMP Sat Mar 29
> > > +-----------------------+-----------------+--------------------------=
--+
> > > |  Number of tracers    | Total time (ns) | Per-call average time    =
  |
> > > |-----------------------+-----------------+--------------------------=
--|
> > > | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (ns=
) |
> > > |----------+------------+-----------------+------------+-------------=
--|
> > > |        0 |          0 |         1459917 |         14 |             =
- |
> > > |        0 |          1 |         1408000 |         14 |             =
- |
> > > |        0 |          2 |         1383792 |         13 |             =
- |
> > > |        0 |         10 |         1430709 |         14 |             =
- |
> > > |        0 |        100 |         1383791 |         13 |             =
- |
> > > |        0 |        200 |         1383750 |         13 |             =
- |
> > > |----------+------------+-----------------+------------+-------------=
--|
> > > |        1 |          0 |         5238041 |         52 |            3=
8 |
> > > |        1 |          1 |         5228542 |         52 |            3=
8 |
> > > |        1 |          2 |         5325917 |         53 |            4=
0 |
> > > |        1 |         10 |         5299667 |         52 |            3=
8 |
> > > |        1 |        100 |         5245250 |         52 |            3=
9 |
> > > |        1 |        200 |         5238459 |         52 |            3=
9 |
> > > |----------+------------+-----------------+------------+-------------=
--|
> > > |        1 |          0 |         5239083 |         52 |            3=
8 |
> > > |        2 |          0 |        19449417 |        194 |           18=
1 |
> > > |       10 |          0 |        67718584 |        677 |           66=
3 |
> > > |      100 |          0 |       709840708 |       7098 |          708=
5 |
> > > |      200 |          0 |      2203580626 |      22035 |         2202=
2 |
> > > +----------+------------+-----------------+------------+-------------=
--+
> > >
> > > Note: per-call overhead is estimated relative to the baseline case wi=
th
> > > 0 relevant tracers and 0 irrelevant tracers.
> > >
> > > As can be seen from the above:
> > >
> > >  a) Whenever there is a single relevant tracer function associated wi=
th a
> > >     tracee, the overhead of invoking the tracer is constant, and does=
 not
> > >     scale with the number of tracers which are *not* associated with =
that
> > >     tracee.
> > >
> > >  b) The overhead for a single relevant tracer has dropped to ~1/3 of =
the
> > >     overhead prior to this series (from 122ns to 38ns). This is large=
ly
> > >     due to permitting calls to dynamically-allocated ftrace_ops witho=
ut
> > >     going through ftrace_ops_list_func.
> > >
> > > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > >
> > > [update kconfig, asm, refactor]
> > >
> > > Signed-off-by: Andy Chiu <andybnac@gmail.com>
> > > Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> >
> > I bisected a boot failure to this commit [c217157bcd1df ("riscv:
> > Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")] yesterday, that appears
> > to be affecting all LLVM versions that I currently have installed. From
> > some initial testing of Kconfig options, it looks like the issue is
> > CFI_CLANG related because when I disable CFI_CLANG things work once
> > more. Since this option depends on !CFI_CLANG, but is def_bool y, I
> > modified Kconfig to force disable it at all times and tested
> > !DYNAMIC_FTRACE_WITH_CALL_OPS && !CFG_CLANG, which did boot.
> >
> > I dunno anything about what's going on in this patch, but so little in
> > it relates to having DYNAMIC_FTRACE_WITH_CALL_OPS, that I was able to
> > figure out that the problem is -fpatchable-function-entry=3D8,4
> >
>=20
> DYNAMIC_FTRACE_WITH_CALL_OPS can't work together with CFI_CLANG.
>=20
> arm64 has:
>=20
> select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
> if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
>    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
>=20
> would need something similar for riscv if not already done.


I think you've misunderstood my email. We already have:

	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WITH_ARGS && !=
CFI)

The problem is that the patch broke using CFI_CLANG, due to the
fpatchable-function-entry change.

Cheers,
Conor.

--k/9IywnAJZZAgTS4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZxx0AAKCRB4tDGHoIJi
0hZ2AQCJsgz7wd2DUBlnm9B9PddWNSIe/63gugstmYQrfXtUAgD9GwPez1Kci42H
5tpyUgCsNyzu820HBicCyULaebhQbgU=
=1stI
-----END PGP SIGNATURE-----

--k/9IywnAJZZAgTS4--


--===============5029772673235048513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5029772673235048513==--

