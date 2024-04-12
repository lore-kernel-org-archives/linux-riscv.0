Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65913C00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cnajP1xAXpFI4hSlqyzZMdg6ryNouCkIap9ycC/OhU=; b=4yM6l/lGuFJPvtzt3+pzoRyR6U
	NNxs8UeWdgu/jPnuOPTRsPd91ln0NMvLUUJ2caa7u9/8U/ABaO6RSCX/gYq14H9NW5IwwbM/A5KVt
	DHpIro6pfXWseld9WeIY+ClAv9goJyFshUPRQJGvfOKNZA4BNtPFt/Mcu3tfssnRkGH1XChQAvj32
	cSLhsBulW3FJjWTEoM7854RR82P4zeYSUBwU8X+FSFe+670/AsCciO/3voeK0hVS8027+bj8VCs22
	EfwD4WM9K9muAm9CHvNilY7oGC191xyQAmS3fyDSBJJh6iZzBi4e0PlxPQwNoonhTPK4VxbzYhv4O
	6FdDgswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvM7s-00000000xzR-3IT5;
	Fri, 12 Apr 2024 18:59:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvM7p-00000000xxt-2Eud;
	Fri, 12 Apr 2024 18:59:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9CF2614F6;
	Fri, 12 Apr 2024 18:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9DBC2BBFC;
	Fri, 12 Apr 2024 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712948387;
	bh=LuLEqLX3JLgh1GzFv1vsjyQM7SgJUCT9K8xbIt5Uo5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mw30pxNB+RuhG0Eg6RLHx0nvRwAHBHW+UMA78SHhSenayouFGw636u5+aZEMbs48u
	 Z4OdOpjIHXdliZT0DbX3uwJ021wUPeRQ5VYMQiGoX+GmVJlQo//SARrCfV0uajBvt+
	 pesRNDzSUTKDdgRfgX1eDrFzi72ikiW4TW7bvtbMf8Q3ZYz2WUZmXSBJlRALj7D+wf
	 JPiii9gXxroeixv8+8Mp+JI+bRqaFLipDLSi9+4rUFgGPfqzc5WHMXfTInHUKEYKtF
	 ztbHkT9vIdkVVsWnTFcPYgyvkVy9sjrF1NafQ6QIQONuZChPON/S1loIowHoead7r1
	 3hHVQMi2LTdtQ==
Date: Fri, 12 Apr 2024 19:59:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 06/19] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240412-factsheet-attain-1a2d1c5306a2@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746@rivosinc.com>
 <20240412-sprawl-product-1e1d02e25bca@wendy>
 <ZhloHGxa5jRRR9xg@ghost>
MIME-Version: 1.0
In-Reply-To: <ZhloHGxa5jRRR9xg@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_115949_722474_4D8357A3 
X-CRM114-Status: GOOD (  31.81  )
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
Content-Type: multipart/mixed; boundary="===============5177682386754347320=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5177682386754347320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CsanCPP69sx4whwN"
Content-Disposition: inline


--CsanCPP69sx4whwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 09:58:04AM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 01:30:08PM +0100, Conor Dooley wrote:
> > On Thu, Apr 11, 2024 at 09:11:12PM -0700, Charlie Jenkins wrote:
> > >  static void __init riscv_parse_isa_string(unsigned long *this_hwcap,=
 struct riscv_isainfo *isainfo,
> >=20
> > > -					  unsigned long *isa2hwcap, const char *isa)
> > > +					struct riscv_isainfo *isavendorinfo, unsigned long vendorid,
> > > +					unsigned long *isa2hwcap, const char *isa)
> > >  {
> > >  	/*
> > >  	 * For all possible cpus, we have already validated in
> > > @@ -349,8 +384,30 @@ static void __init riscv_parse_isa_string(unsign=
ed long *this_hwcap, struct risc
> > >  		const char *ext =3D isa++;
> > >  		const char *ext_end =3D isa;
> > >  		bool ext_long =3D false, ext_err =3D false;
> > > +		struct riscv_isainfo *selected_isainfo =3D isainfo;
> > > +		const struct riscv_isa_ext_data *selected_riscv_isa_ext =3D riscv_=
isa_ext;
> > > +		size_t selected_riscv_isa_ext_count =3D riscv_isa_ext_count;
> > > +		unsigned int id_offset =3D 0;
> > > =20
> > >  		switch (*ext) {
> > > +		case 'x':
> > > +		case 'X':
> >=20
> > One quick remark is that we should not go and support this stuff via
> > riscv,isa in my opinion, only allowing it for the riscv,isa-extensions
> > parsing. We don't have a way to define meanings for vendor extensions in
> > this way. ACPI also uses this codepath and at the moment the kernel's
> > docs say we're gonna follow isa string parsing rules in a specific vers=
ion
> > of the ISA manual. While that manual provides a format for the string a=
nd
> > meanings for standard extensions, there's nothing in there that allows =
us
> > to get consistent meanings for specific vendor extensions, so I think we
> > should avoid intentionally supporting this here.
>=20
> Getting a "consistent meaning" is managed by a vendor.

IOW, there's absolutely no guarantee of a consistent meaning.

> If a vendor
> supports a vendor extension and puts it in their DT/ACPI table it's up
> to them to ensure that it works. How does riscv,isa-extensions allow for
> a consistent meaning?

The definitions for each string contain links to exact versions of
specifications that they correspond to.

> >=20
> > I'd probably go as far as to actively skip vendor extensions in
> > riscv_parse_isa_string() to avoid any potential issues.
> >=20
> > > +			bool found;
> > > +
> > > +			found =3D get_isa_vendor_ext(vendorid,
> > > +						   &selected_riscv_isa_ext,
> > > +						   &selected_riscv_isa_ext_count);
> > > +			selected_isainfo =3D isavendorinfo;
> > > +			id_offset =3D RISCV_ISA_VENDOR_EXT_BASE;
> > > +			if (!found) {
> > > +				pr_warn("No associated vendor extensions with vendor id: %lx\n",
> > > +					vendorid);
> >=20
> > This should not be a warning, anything we don't understand should be
> > silently ignored to avoid spamming just because the kernel has not grown
> > support for it yet.
>=20
> Sounds good.
>=20
> - Charlie
>=20
> >=20
> > Thanks,
> > Conor.
> >=20
> > > +				for (; *isa && *isa !=3D '_'; ++isa)
> > > +					;
> > > +				ext_err =3D true;
> > > +				break;
> > > +			}
> > > +			fallthrough;
> > >  		case 's':
> > >  			/*
> > >  			 * Workaround for invalid single-letter 's' & 'u' (QEMU).
> > > @@ -366,8 +423,6 @@ static void __init riscv_parse_isa_string(unsigne=
d long *this_hwcap, struct risc
> > >  			}
> > >  			fallthrough;
> > >  		case 'S':
> > > -		case 'x':
> > > -		case 'X':
> > >  		case 'z':
> > >  		case 'Z':
> > >  			/*
> > > @@ -476,8 +531,10 @@ static void __init riscv_parse_isa_string(unsign=
ed long *this_hwcap, struct risc
> > >  				set_bit(nr, isainfo->isa);
> > >  			}
> > >  		} else {
> > > -			for (int i =3D 0; i < riscv_isa_ext_count; i++)
> > > -				match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
> > > +			for (int i =3D 0; i < selected_riscv_isa_ext_count; i++)
> > > +				match_isa_ext(&selected_riscv_isa_ext[i], ext,
> > > +					      ext_end, selected_isainfo,
> > > +					      id_offset);
> > >  		}
> > >  	}
> > >  }
>=20
>=20

--CsanCPP69sx4whwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmEnAAKCRB4tDGHoIJi
0pNvAP0cufmJeVfjqNNvS2amdK3cPxp6+XoZZuLVZYI1W7JTkAD9Etz7Xt95pEBt
HBVc3vyRX/GytuvTJoIkVsfPSrRlpA0=
=aGbN
-----END PGP SIGNATURE-----

--CsanCPP69sx4whwN--


--===============5177682386754347320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5177682386754347320==--

