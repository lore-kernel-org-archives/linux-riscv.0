Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3129DC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L/cmNqPr9pAgCmZP6IGqqcSYFJ5ICpPv4OLYntm8Ng=; b=i++aqxnzt08zqPu4LcqvaevJTK
	Gpj0+Kr62ocUWIPGkkNFw49Y547bZUQJIttKj4k1PaMHlH8wyXFKdaz/bhHwagtArxd6QTgultAsX
	YE2kW7V8qm5WK1HgU+yxPFSlA3uEEz4wQaYwefiEYaqUinBvOoOZJW5VRKRfbT2W9EnmyYC1u6Q2f
	+8A5S5UNKhpAxFP8Z+BpM3iP3wfx1nnn1dh5jHYFb9F8yQxuF9qGSfbcWLJFtleZVlmN7KXtfBpnL
	IWzLTNSqJJ3vwbqiA/+2GK3EX3LftaxVd//EbvBy7T0rgXl0djmOPmmK164PyGQ21PpeAfxIOX0jV
	YySImNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9qg6-00000003oFA-289N;
	Wed, 22 May 2024 18:27:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9qg2-00000003oE5-2Vhn
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 18:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AFDF6CE1192;
	Wed, 22 May 2024 18:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6100EC2BBFC;
	Wed, 22 May 2024 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716402420;
	bh=6TjRp44/5yttUKhYEKEOpP4vhcfVOGvGpjaQvSnlrVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLTJUGX3868LPM8o5ryPUtjvM3WFmliDpMHMAXs4FjniRV3Y4tICOB/704yC6Gxtc
	 qgvbja1zxqdtwFLnpyl7oNkSICh487WTXZYJBf90tzpciVkiL1oz93opIWw8bCkj5t
	 QbMHWYZWemeX/0s/AzrIFVWMM/m0/SkAOU9zJp8xoFfLBD3hlqs3V199/R28XAtUS2
	 o402M3g6mlTbvB9wB72xpMPZq+lsYfLeGEFR8s6lIsv3pn+yc7H1pDrF2LLK2ruy2E
	 8vs6esC6d8eZLG/o0H9nRb9Ns4dsKobQCddcYGc9LAL9TiStKLNUPXcLD8GpJN2W0E
	 ovQTQV1YCZbIQ==
Date: Wed, 22 May 2024 19:26:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
Message-ID: <20240522-customs-jaws-d0c792b274b4@spud>
References: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
 <20240522-yoga-blurt-dc5e40a0ae3a@spud>
 <CAGLn_=vfnQrNh63jWtUCojONAYqX3dm6qnXgA--Zi1KQ0P0o-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGLn_=vfnQrNh63jWtUCojONAYqX3dm6qnXgA--Zi1KQ0P0o-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_112703_033256_F639B898 
X-CRM114-Status: GOOD (  29.60  )
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
Content-Type: multipart/mixed; boundary="===============6151139185752118904=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6151139185752118904==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TFXhTa38hHk0eS3i"
Content-Disposition: inline


--TFXhTa38hHk0eS3i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 10:11:20PM +0530, Kanak Shilledar wrote:
> Hi Conor,
>=20
> On Wed, May 22, 2024 at 9:34=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, May 22, 2024 at 09:08:34PM +0530, Kanak Shilledar wrote:
> > > This series of patches converts the RISC-V CPU interrupt controller to
> > > the newer dt-schema binding.
> > >
> > > Patch 1:
> > > This patch is currently at v3 as it has been previously rolled out.
> > > Contains the bindings for the interrupt controller.
> > >
> > > Patch 2:
> > > This patch is currently at v2.
> > > Contains the reference to the above interrupt controller. Thus, making
> > > all the RISC-V interrupt controller bindings in a centralized place.o
> >
> > Don't do this, it breaks tooling:
> >
> >         b4 shazam 20240522153835.22712-2-kanakshilledar111@protonmail.c=
om
> >         Grabbing thread from lore.kernel.org/all/20240522153835.22712-2=
-kanakshilledar111@protonmail.com/t.mbox.gz
> >         Checking for newer revisions
> >         Grabbing search results from lore.kernel.org
> >         Analyzing 3 messages in the thread
> >         Looking for additional code-review trailers on lore.kernel.org
> >         Will use the latest revision: v3
> >         You can pick other revisions using the -vN flag
> >         Checking attestation on all messages, may take a moment...
> >         Retrieving CI status, may take a moment...
> >         ---
> >           =E2=9C=93 [PATCH v3 1/2] dt-bindings: interrupt-controller: r=
iscv,cpu-intc: convert to dtschema
> >             =E2=9C=93 Signed: DKIM/gmail.com
> >             + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >           ERROR: missing [2/2]!
> >         ---
> >         Total patches: 1
> >         ---
> >         WARNING: Thread incomplete!
> >          Base: using specified base-commit 20cb38a7af88dc40095da7c2c909=
4da3873fea23
> >         Applying: dt-bindings: interrupt-controller: riscv,cpu-intc: co=
nvert to dtschema
> >
> > If you change one patch in a series, the whole series gets a new versio=
n.
> > Just let git format-patch do that for you with the "-v N" argument and
> > you'll not have to worry about breaking people's tooling.
>=20
> Sorry for the tooling breaking. I used the "-v N" argument to make the
> v2 patches but I bumped up the "riscv,cpu-intc"patch
> to v3 due to it being in v3 already and it gave errors in the previous
> patchset and you mentioned that I missed the v3 in subject line.
> How shall I proceed with this version mismatch? Shall I make the
> patchset as v3 and have both the patches at v3?

I would make it "RESEND v3".

> > Patches themselves are
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I shall include this in my commit message. Is it required to bump the
> version of the patch just for the reviewed flag?

Usually there's no need to resend patches for tags alone. Some people
treat tag-only resubmissions as a "RESEND vN" and others as "vN+1". The
latter is less likely to upset anyone.

Cheers,
Conor.

--TFXhTa38hHk0eS3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk447wAKCRB4tDGHoIJi
0tDmAQDppLY/t7sUt1v1hsx+ZW0rob6GusyQlodM3Y8Vtby7owEAqwNrm7dtUjb9
76loQdmxiWzfyhx4a6tq85+Nihcxow8=
=cqmE
-----END PGP SIGNATURE-----

--TFXhTa38hHk0eS3i--


--===============6151139185752118904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6151139185752118904==--

