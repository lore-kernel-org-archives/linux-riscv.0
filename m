Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE42EC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8fTlE+naHdxSE94vQdkylXDMr/uC1vIAf8dAz9csvM=; b=kGQf39jGXQ6pWuLCYv8obkN78v
	Ut8HNacVLlxTOgSGveD22q1u1oAXUuhiuK0QF0Id/5YdiIsI/JrW1NnyDI9X1EmEPrUsdU0H7lHsM
	mvOlin4bOfPRfpgQTjLwiIBqg1l2NW683CeT9SlxZI7/5qjvgIwRsimBzD23fCQHcMpG4silYnWGl
	yvGEqS3+CqnUZniBdZinjwkePSKBCDMrydQW30KtnYVBInSrcqDts0BwtLclMX5sn/ZzUaLFI40tL
	Mpq8sf/gDWdBbMj1xBfIXQZ/cP1V8sgfGTfPbXemgCP4dDPcbNB9eYxLRkj6kbhOKI4UFSUepLiW5
	PWQI7sVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHYP-00000003cXF-3hRf;
	Mon, 01 Jul 2024 13:58:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHYM-00000003cVn-3zoK
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 13:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9A7061284;
	Mon,  1 Jul 2024 13:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C0FC4AF0A;
	Mon,  1 Jul 2024 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719842325;
	bh=VlYW+BVRr/2wR3yn9dKsp1GvB5pZ/gJsdlh3v7mNgNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCa34a/qdJvYWcajMBbpHf1rUBXPV8M31Y/m6W6pDSxBp/BQN1u40rg0iq5bk/Le8
	 orPJ3ALUY0f4N3TIb7UhKwLSN+GJq2QDHkKh5ru85nk36b+YAjW82s2IGIArx0NngQ
	 SBxfkb2Jd1yeNPdlIX3MhwVWTDEEUT454n18TPjNlrOtrNNlT+M81WKU6UOHAHIQ7S
	 obF/PBNv+P2tskoAm5FKNTDGx7keMpSS4k+n5M+vAdg+WVcsWhlyXnINg6SrHWdp+l
	 jvoDBNvt1mCHjJTN3LMLcu+1RVz3vB140YbeTiVL9//yqfcHVKsn3a6Zk1TSCwS5A6
	 jMRAmmFScPTWA==
Date: Mon, 1 Jul 2024 14:58:36 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
Message-ID: <20240701-ajar-italicize-9e3d9b8a0264@spud>
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
 <20240626-march-abreast-83414e844250@spud>
 <Zn3XrLRl/yazsoZe@ghost>
 <43941f48-9905-4b25-89ef-6ad75bf1a123@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <43941f48-9905-4b25-89ef-6ad75bf1a123@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_065847_150069_44752F1F 
X-CRM114-Status: GOOD (  33.46  )
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
Content-Type: multipart/mixed; boundary="===============1650575902547723320=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1650575902547723320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EnTioEvMPr9HA3hF"
Content-Disposition: inline


--EnTioEvMPr9HA3hF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 09:15:09AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 27/06/2024 23:20, Charlie Jenkins wrote:
> > On Wed, Jun 26, 2024 at 03:39:14PM +0100, Conor Dooley wrote:
> >> On Mon, Jun 24, 2024 at 08:49:57PM -0400, Jesse Taube wrote:
> >>> Check for Zicclsm before checking for unaligned access speed. This wi=
ll
> >>> greatly reduce the boot up time as finding the access speed is no lon=
ger
> >>> necessary.
> >>>
> >>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> >>> ---
> >>> V2 -> V3:
> >>>  - New patch split from previous patch
> >>> ---
> >>>  arch/riscv/kernel/unaligned_access_speed.c | 26 ++++++++++++++------=
--
> >>>  1 file changed, 17 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/=
kernel/unaligned_access_speed.c
> >>> index a9a6bcb02acf..329fd289b5c8 100644
> >>> --- a/arch/riscv/kernel/unaligned_access_speed.c
> >>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> >>> @@ -259,23 +259,31 @@ static int check_unaligned_access_speed_all_cpu=
s(void)
> >>>  	kfree(bufs);
> >>>  	return 0;
> >>>  }
> >>> +#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> >>> +static int check_unaligned_access_speed_all_cpus(void)
> >>> +{
> >>> +	return 0;
> >>> +}
> >>> +#endif
> >>> =20
> >>>  static int check_unaligned_access_all_cpus(void)
> >>>  {
> >>> -	bool all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus=
();
> >>> +	bool all_cpus_emulated;
> >>> +	int cpu;
> >>> +
> >>> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
> >>> +		for_each_online_cpu(cpu) {
> >>> +			per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIGNE=
D_FAST;
> >>
> >> - const: zicclsm
> >>   description:
> >>     The standard Zicclsm extension for misaligned support for all regu=
lar
> >>     load and store instructions (including scalar and vector) but not =
AMOs
> >>     or other specialized forms of memory access. Defined in the
> >>     RISC-V RVA Profiles Specification.=20
> >>
> >> Doesn't, unfortunately, say anywhere there that they're actually fast =
:(
> >=20
> > Oh no! That is unfortunate that the ISA does not explicitly call that
> > out, but I think that acceptable.
> >=20
> > If a vendor puts Zicclsm in their isa string, they should expect
> > software to take advantage of misaligned accesses. FAST is our signal to
> > tell software that they should emit misaligned accesses.
>=20
> AFAIK, Zicclsm is not even an ISA extension, simply a profile
> specification which means that only the execution environment which
> provides the profile support misaligned accesses (cf
> https://lists.riscv.org/g/tech-profiles/message/56).

I dunno, the specification status page used to describe it as an
extension:
https://wiki.riscv.org/display/HOME/Specification+Status+-+Historical
My understanding was that these could be considered extensions, just
like we are considering svade to be one.

> . I don't think we
> can extrapolate that the misaligned accesses will be fast at all.

That is my opinion on it too. If it doesn't say "fast" and give a
definition for what that means in the binding, then we can't assume that
it is fast. I'm also wary of extending definitions of extensions in the
binding, because a) I am 90% sure that people writing devicetrees don't
care and b) it'd be a potential difference between DT and ACPI without a
real justification (unlike the zkr or svade/svadu situations).

> > This allows for a generic kernel, like the one a distro would compile, =
to
> > skip the probing when booting on a system that explicitly called out
> > that the hardware supports misaligned accesses.

--EnTioEvMPr9HA3hF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoK2DAAKCRB4tDGHoIJi
0jMlAQDXSIyO1eIrZ/BuGBKJHLB7xCoNnG0MF/2pC2M8BmRSFgD/Z0rIDWJaRF7z
bgl9+NyRjblrbywgRXV4IPYh3mhDEww=
=/nDm
-----END PGP SIGNATURE-----

--EnTioEvMPr9HA3hF--


--===============1650575902547723320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1650575902547723320==--

