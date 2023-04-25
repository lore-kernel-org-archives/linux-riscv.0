Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF9C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs+UFnENGIuM3jxWP+gvECkwgOjOXZpKPg/k2hXnO9I=; b=aN8pAyt+3d4QcBlLA87xaNJFU0
	hmKaO8NrRE1yvmLPSec2kC+o9EPn1rSpXgF+0T15TysyLtMpS880xb2qM2os2eGyZrsUAJ9pW5KpG
	uLv66AOA8ep9GBuf91lqIXcOwkkJIa58//mMl0iBjeWtPsurakupJBSxwN7hcs8qC8jKd5pbNmyhC
	tprP7pQfCrH3raMg1Ege7flj+wlMteIwDW8H5eDrlvV3AlXLOeHcGC/ZS+EZgzY7k5Z11HvaLaEwk
	cQFIFP3YIBneu0wZK0VjkoJROjO311kD++53kLT3JPBb1H06xNmkoXkjFPclCDOBco2hE0209vFiE
	c5lyNbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFlr-000jbJ-18;
	Tue, 25 Apr 2023 10:19:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prFlm-000jaq-1d
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 10:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682417974; x=1713953974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1U7KCXqbQAMRemqrEYBgqdxtxhcKoQfQ/X2AP+POLQ8=;
  b=AhvDcGU1yGoxU0S2XU1zF83fMiLgDX/SRtnsixN+CyCFrbUUYEIB0++y
   M5mC1te0aZqK4OWaTPZOlOBAIyz4Mo9WmWxltsVJzo2xxJMyT39gWHwJE
   J9RCSltaGfE6osBlRIaN/HwGmpyVvHgXskALDdoE9PGrXbMoLXpfNGmWn
   dk+nmhsvGL9hraEN0Tis7uR+wg5uNkuxbB+uooK86RlBg9qcrlzAVcvvo
   9GQk+jCzShD+R5kIPwz+la6g0bGBLVLfJWwPMOeCZRVVKh/SsjXd1HYtc
   IOlcF5CyyFutz/EMqjDvdc2iX5rtUoCok6o/+c9UhY1mtBNz0dYDihiq3
   w==;
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; 
   d="asc'?scan'208";a="210575882"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Apr 2023 03:19:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 03:19:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Apr 2023 03:19:31 -0700
Date: Tue, 25 Apr 2023 11:19:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Woodrow Shen <woodrow.shen@sifive.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <aou@eecs.berkeley.edu>,
	<alexghiti@rivosinc.com>, <greentime.hu@sifive.com>
Subject: Re: [RFC PATCH v1] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC
 must be readable
Message-ID: <20230425-omnivore-another-783f6e3f5917@wendy>
References: <20230425034407.1601585-1-woodrow.shen@sifive.com>
 <20230425-frolic-cough-b775f8d6ca29@wendy>
 <CABquHATUGZpzhmJNRDZ55Z2Cm3bxgJApRUdiftscU7sGEALyYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABquHATUGZpzhmJNRDZ55Z2Cm3bxgJApRUdiftscU7sGEALyYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_031934_786342_1B804395 
X-CRM114-Status: GOOD (  22.57  )
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
Content-Type: multipart/mixed; boundary="===============5701568054689395842=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5701568054689395842==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+dduNeCR4NTDL6wE"
Content-Disposition: inline

--+dduNeCR4NTDL6wE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 06:10:36PM +0800, Woodrow Shen wrote:
> Hi Conor,
>=20
> On Tue, Apr 25, 2023 at 2:55=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > Hey Hsieh-Tseng,
> >
> > On Tue, Apr 25, 2023 at 11:44:07AM +0800, Woodrow Shen wrote:
> > > From: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
> > >
> > > The commit 8aeb7b1 allows riscv to use mmap with PROT_WRITE only,
> > > and meanwhile mmap with w+x is also permitted. However, when userspace
> > > tries to access this page with PROT_WRITE|PROT_EXEC, which causes
> > > infinite loop at load page fault as well as it triggers soft lockup.
> > > According to riscv privileged spec, "Writable pages must also be mark=
ed
> > > readable". The fix to drop the `PAGE_COPY_READ_EXEC` and `PAGE_READ_E=
XEC`
> > > should be just used instead. This aligns the other arches (i.e arm64)
> > > for protection_map.
> > >
> > > Fixes: 8aeb7b1 ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
> >
> > This fixes tag should be:
> > Fixes: 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_RE=
AD")
> > as checkpatch would have told you :/ Perhaps Palmer can fix that up on
> > application?
> >
> > > Signed-off-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
> > > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> >
> > This is not v1, it's v2 right?
> > Please include a changelog between versions.
>=20
> Yes, it's v2. I copied the outdated comment as my first version was
> verified by script correctly. Will fix it in v2.
>=20
> >
> > Also, what makes it an RFC, it's an actual fix that you would like
> > merged, right?
>=20
> I was suggested to use "RFC" internally, so should I just re-submit v2
> with [RESEND v2]?

If you want? It's Palmer's call whether he'd be happy with fixing up the
tag or not, not mine.

If you do resend, it would just be "v2" though IMO.

Cheers,
Conor.

--+dduNeCR4NTDL6wE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEepIgAKCRB4tDGHoIJi
0vv2APsGN0q7nSNNMr+4gN6tKlms47xX4JwnMbsHtWbnT6jUMAEAs8SaLbUpoWFp
LfAFBRhNCd65IhvblTY538C5f3efnAE=
=qe8K
-----END PGP SIGNATURE-----

--+dduNeCR4NTDL6wE--


--===============5701568054689395842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5701568054689395842==--

