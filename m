Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD4EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2HbHcngJ41EOKi2EGmdD86umOOuF3iEjhyTSeAknyc=; b=Co/CH9Z1Xc8IJrshOf9ryzuwkV
	oPeGWtb+Xf81a945gsfAZ0rYswc0D1p0qbcexv2jIpEIKSqJVSLE0x1OvoN22gm6NnfOMAwe89Ebz
	qYQuQ/8vdnaW6vlRD0ByhS8vsuzhUZkqPfpPqzRFF8lW9eaUGzsx6tyZGAyV5JgFRmwmmHEwUzVSn
	7wdw1/6aFhr5KrKnHLxtxAlj5fMidz7s1UmMymiKMbvWXNyo/1ZUynQ0Lin3YoXjuoKp+m3Et7IPb
	m+wBaJjeJjorPHOvUje9JzoJjiFHyCWbF2jVNYfG8AdQCn9yiex1xLF9H30YnCmOkGs4cIUUH5f+K
	qAsp11SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBY7e-00AnDR-2P;
	Tue, 20 Jun 2023 09:58:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBY7a-00AnCf-1s
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 09:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687255078; x=1718791078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4oXu7FJQwjSx64LQSoiKpv9H6LNtuO8vmXzyXeUjBE8=;
  b=oNrUXRq2SCzXE0H1rsV82/QTwbGc9EnGYRxOJPEz3pW4u0NjaRuNQlJ4
   4i++IMiJk2vJzDHL3sV/Dc39C6MOjfD7W9U1l9trzcBSpR5T5ClIM2bkA
   1wRhEE2HukebbgcfCENxPrzPL+pk4Fy13d0N7Bn26gjIVAncQ7dBzl4eA
   J971WLblv0+Gfk2G3co06nmAips3gZ0b9V9BUGyi7P3kVLJ0afhbjpf77
   Eoa50/I7MptRsaUj28INH5uIYoisuE0eBT9jtpx6ZIsGvhg+OIX/M2KoH
   /SFSs5b12lgHHdQLKa0r8BGgoW2cE5LNiawZuG8isPMQWDqiqGz1vttsv
   g==;
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="asc'?scan'208";a="221063445"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2023 02:57:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 20 Jun 2023 02:57:48 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 20 Jun 2023 02:57:46 -0700
Date: Tue, 20 Jun 2023 10:57:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jonathan Corbet <corbet@lwn.net>
CC: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Kumar Patra <atishp@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
Message-ID: <20230620-slot-bobtail-4f41b59f4cf9@wendy>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <20230619-kerchief-unmixed-cfdbeb1cf242@wendy>
 <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
 <20230619-sponge-armful-6beeaf4a8624@spud>
 <87r0q7v1o9.fsf@meer.lwn.net>
MIME-Version: 1.0
In-Reply-To: <87r0q7v1o9.fsf@meer.lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_025758_789183_E1FE8ED3 
X-CRM114-Status: GOOD (  21.78  )
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
Content-Type: multipart/mixed; boundary="===============0943379559153211920=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0943379559153211920==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HyYzIEwuf18tdy7k"
Content-Disposition: inline

--HyYzIEwuf18tdy7k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 10:48:06AM -0600, Jonathan Corbet wrote:
> Conor Dooley <conor@kernel.org> writes:
>=20
> > On Mon, Jun 19, 2023 at 04:04:52PM +0200, Alexandre Ghiti wrote:
> >> On Mon, Jun 19, 2023 at 2:26=E2=80=AFPM Conor Dooley <conor.dooley@mic=
rochip.com> wrote:
> >> > On Mon, Jun 19, 2023 at 11:47:04AM +0200, Alexandre Ghiti wrote:
> >
> >> > > diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/bo=
ot.rst
> >> > > new file mode 100644
> >> > > index 000000000000..b02230818b79
> >> > > --- /dev/null
> >> > > +++ b/Documentation/riscv/boot.rst
> >> > > @@ -0,0 +1,181 @@
> >> > > +.. SPDX-License-Identifier: GPL-2.0
> >> > > +
> >> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> > > +Early boot requirements/constraints on RISC-V
> >> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >
> >> > Please use "title case", here and elsewhere in the doc.
> >>=20
> >> You mean using "title: " instead of "=3D=3D=3D=3D"? Or using uppercase=
 for the
> >> first letter of each word? FYI I followed
> >> https://docs.kernel.org/doc-guide/sphinx.html?highlight=3Dtitle#specif=
ic-guidelines-for-the-kernel-documentation
> >
> > The latter. That's weird, I guess it would be nice to see what Jon
> > thinks about that.
>=20
> I have Never Been Fond of Excessive Use of Capital Letters, so my
> preference would be capitalization as in a normal sentence.
>=20
> That said, I don't really feel that something like this is important
> enough that we need to define and enforce a policy around it.  If the
> maintainers for specific subsystems feel differently, then I guess
> that's up to them.

Okay, thanks.

--HyYzIEwuf18tdy7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJF3/wAKCRB4tDGHoIJi
0gG8AP9nAmYRkCd6aA3KqwDS5VO/mXdodl6DpCx3vgU2BjkDYgEAu1/lkHz2Ig9k
R2kxyNWLJ055DoTuTXnCUGXDO043/Qs=
=plo2
-----END PGP SIGNATURE-----

--HyYzIEwuf18tdy7k--


--===============0943379559153211920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0943379559153211920==--

