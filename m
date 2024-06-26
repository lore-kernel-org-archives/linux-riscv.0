Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB522C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9paE4pvF8XliLbNVtiBx5L2jfelBkMcQmPUmDO6OBE=; b=PXc81OE2RxbyiLwodR6UaMnLo+
	dTcg1JPzaXjCIQbnVwaQ2n8QGrYcfLBgKwu2B7zL/0YD9vsJs0AHbUZMKzlAmxRxIyzSa88L7ThxC
	AkndLeRn8k1PbNCBd9FjsJ895vmWsg6O9/hYFKEN8S0BkVz7bjcDBf5GrXBOXQyvtA4IMJDSwYhUz
	mPM6YEkygfvM0xZ1OKvi2uUuXMMkNjtEukbeuC025dIbJzzXFOpAPpE9i6UQRH5cSaOsuOLS/Vr10
	1JlRabhfDRoWVOMs4bRRCemPbxI84MBmlzcjdkFPlOfr6euPV5AGT71VI5eaS3JA3n2YwFlXBdrAQ
	7yi6GaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVgi-00000007dSO-0JfI;
	Wed, 26 Jun 2024 16:40:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVgZ-00000007dOe-1uy9;
	Wed, 26 Jun 2024 16:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 955F66181B;
	Wed, 26 Jun 2024 16:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10966C32789;
	Wed, 26 Jun 2024 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719419994;
	bh=2PIGptfu7Q6IJYjxdK4gnMcXpRqy+KgrEzlHWeWHipg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVEeMRkK91SZfmGSS4KOvWnt+VMC1hj25VJkNV95C414FgBfOEXos8yU+6ls5YVX+
	 rGKvDVSHjHvMd/SgQJVBKWeV5R4by02/TT0prfUcJcC0beCPDQhOQkPcJhXhON+v9H
	 fgTApVTS3doKRbsSMiXFP8wKi3XGjV9Anq37vAFVNwuSCJekV0aowMTieJTL1qks7w
	 uyZQ2niXeXh1qkR1Rtd66AoP68zG4qzehgVRYVlAgBQbnQ8WR5CV0/l5SCJtbyWe4U
	 Ktd4GlozG/zGYUnfWJf+sUKyObD1mpqjYw2MeeyDxvgoQsKm6cb6VKOsQQMHkJf2K+
	 OMPttVlqoz74A==
Date: Wed, 26 Jun 2024 17:39:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to
 hpmevent mapping while starting cpus
Message-ID: <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
 <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
 <20240626-eraser-unselect-99e68a1f5a3e@spud>
MIME-Version: 1.0
In-Reply-To: <20240626-eraser-unselect-99e68a1f5a3e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_093955_659485_AA8E413C 
X-CRM114-Status: GOOD (  18.81  )
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
Content-Type: multipart/mixed; boundary="===============5775363623493653340=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5775363623493653340==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FU7Zc89k4QCiR7WV"
Content-Disposition: inline


--FU7Zc89k4QCiR7WV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 05:37:07PM +0100, Conor Dooley wrote:
> On Wed, Jun 26, 2024 at 09:18:46AM -0700, Atish Kumar Patra wrote:
> > On Wed, Jun 26, 2024 at 6:24=E2=80=AFAM Samuel Holland
> > <samuel.holland@sifive.com> wrote:
> > >
> > > On 2024-06-26 2:23 AM, Atish Patra wrote:
> > > > From: Samuel Holland <samuel.holland@sifive.com>
> > > >
> > > > Currently, we stop all the counters while a new cpu is brought onli=
ne.
> > > > However, the hpmevent to counter mappings are not reset. The firmwa=
re may
> > > > have some stale encoding in their mapping structure which may lead =
to
> > > > undesirable results. We have not encountered such scenario though.
> > > >
> > >
> > > This needs:
> > >
> > > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > >
> >=20
> > Oops. Sorry I missed that.
> >=20
> > @Alexandre Ghiti
>=20
> What's Alex going to be able to do?
>=20
> > @Palmer Dabbelt : Can you add that while picking up
> > the patch or should I respin a v4 ?
>=20
> b4 should pick the signoff up though. "perf: RISC-V: Check standard
> event availability" seems to be missing your signoff though...

Huh, this doesn't really make sense. I meant:
	b4 should pick the signoff up, though "perf: RISC-V: Check standard
	event availability" seems to be missing your signoff...

--FU7Zc89k4QCiR7WV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnxEVAAKCRB4tDGHoIJi
0hINAP48KsydcVtxBdutJ7PLHDXPIJwaexLkCAn12KujpGyUXwD/ayGbi7swPtlU
FUXHQj/AMQOOQenoBkNfM/k44jEYCQE=
=a7Yq
-----END PGP SIGNATURE-----

--FU7Zc89k4QCiR7WV--


--===============5775363623493653340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5775363623493653340==--

