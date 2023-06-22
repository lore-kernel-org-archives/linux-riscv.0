Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C19EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWMBNlI+svsVkRV+aptGBWOY1/+3S/FvcmXSDPtlBfw=; b=PNQOS1NKWKGwmBkYRxPC47ZZKo
	kPMmfT4spIk3TGEYR26egazcqq8AqOJa/W1h4uMILH+o5sH8BsuvUJHBIDV3agGY7vHuyn1+L+17v
	T781MYBRC6ViGmldRQCjfUSMOze41CkFIukQsfpLsu5gxKAlVaOelpKbjjREdQuP0hCgSs6gKWoHp
	CE1gsRVLUq6NvGqx3Hx1G0/aYpcQwoYrg+Em+PAkqsfETOwyRli1RBIcbSNApK2z4HAmb/36hbyIx
	TuM+rhngJDrb9cS9bz4IZBtChf170dekkOABIFyGbYGfxBnr2yO9WvYVruwWpnYoGHEuinMQHZE7T
	lwT+lACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOJ8-001MSe-0l;
	Thu, 22 Jun 2023 17:41:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOJ5-001MRq-0s
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 17:41:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA7D7618CA;
	Thu, 22 Jun 2023 17:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9155BC433C0;
	Thu, 22 Jun 2023 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687455678;
	bh=YAOh3PltHuv3oiVdQk7pp6PuM5ji7zkTeX46kRr9GsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SLLthQNjRf6xNoc1hI5BkPHrZjL1FjjBmrbUNEM7rLK76EaHjMAwPGMaYsnG4NMgH
	 XGl317enxqEC0vOWOlZvBoLZsOWU/iRi5WgOywc+9VRbTpGs3AADnq1ioaStdEZULn
	 0HAPYCYsBsc9BKf9d6GgyK3cMYVsk880L0Vqq/mBFtHlJj4j77qVUZ7ubZ9nD9jRqt
	 QC9TzCb3fGYYmv4/H0GUCLyuQQtuSiS89PSvYT7FG5ZbS1BXGec+ZFc9g3YIBzqiHd
	 VgOByMiNMzIjJOht5jGLtLICV6qfbNvt4eVgOOwF1YxZQY77Xp9U3vrZcnz7yWg+s2
	 Q5mskb8E5DMfg==
Date: Thu, 22 Jun 2023 18:41:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <20230622-clone-overfed-21ec0886e904@spud>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-d6da578719f8af903d6746ef@orel>
 <20230622-4af59422f118ea634836d351@orel>
 <CAHVXubgJQhShbOfaQeOTxM61g_tUnLBxa-0JK+WE+YQRGkYRQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubgJQhShbOfaQeOTxM61g_tUnLBxa-0JK+WE+YQRGkYRQA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_104119_385483_0A78E7ED 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Song Shuai <songshuaishuai@tinylab.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8250850524460153860=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8250850524460153860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kh9jAV9zzKnGH3pC"
Content-Disposition: inline


--kh9jAV9zzKnGH3pC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 07:32:23PM +0200, Alexandre Ghiti wrote:
> On Thu, Jun 22, 2023 at 7:24=E2=80=AFPM Andrew Jones <ajones@ventanamicro=
=2Ecom> wrote:
> >
> > On Wed, Jun 21, 2023 at 02:19:50PM +0200, Andrew Jones wrote:
> > > On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
> > ...
> > > > +Hardware description
> > > > +--------------------
> > > > +
> > > > +The firmware can pass either a devicetree or ACPI tables to the RI=
SC-V kernel.
> > > > +
> > > > +The devicetree is either passed directly to the kernel from the pr=
evious stage
> > > > +using the `$a1` register, or when booting with UEFI, it can be pas=
sed using the
> > > > +EFI configuration table.
> > > > +
> > > > +The ACPI tables are passed to the kernel using the EFI configurati=
on table. In
> > > > +this case, a tiny devicetree is still created by the EFI stub. Ple=
ase refer to
> > > > +"EFI stub and devicetree" tree section below for details about thi=
s devicetree.
> > >                              ^ redundant 'tree' here
> > >
> >
> > Can whoever applies this drop this 'tree' I pointed while applying?
>=20
> Yes, sorry: @Conor Dooley give me the overly long lines you wanted me
> to break and I'll send a v3, it won't take much time and I'll fix this
> too!

Look, I said it was pure pedantry on my part, and not something that
helps with understanding. You've been warned!

diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.rst
index 019ee818686d..a52793fd9f6c 100644
--- a/Documentation/riscv/boot.rst
+++ b/Documentation/riscv/boot.rst
@@ -143,11 +143,12 @@ be carefully examined.
 Device-tree mapping via fixmap
 ------------------------------
=20
-The RISC-V kernel uses the fixmap region to map the devicetree because the
-devicetree virtual mapping must remain the same between :c:func:`setup_vm`=
 and
-:c:func:`setup_vm_final` calls since the :c:var:`reserved_mem` array is
-initialized with virtual addresses established by :c:func:`setup_vm` and u=
sed
-with the mapping established by :c:func:`setup_vm_final`.
+
+As the :c:var:`reserved_mem` array is initialized with virtual addresses
+established by :c:func:`setup_vm`, and used with the mapping established by
+:c:func:`setup_vm_final`, the RISC-V kernel uses the fixmap region to map =
the
+devicetree. This ensures that the same virtual mapping is used by both
+functions.
=20
 Pre-MMU execution
 -----------------

--kh9jAV9zzKnGH3pC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJSHuQAKCRB4tDGHoIJi
0jsVAQDEXMV48OW7eoZ1+j6mFXAUoK4gEfiDynMorze08Q3uqgEA6tiHd5oOT7Lt
VRIIRuWAwkwl7eEczS4ibrV8mm0sAAo=
=BX7b
-----END PGP SIGNATURE-----

--kh9jAV9zzKnGH3pC--


--===============8250850524460153860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8250850524460153860==--

