Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F006DC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvgQcMLQ1StmDLislX3SkCVAVp5NrrAWpBCwlFG3O+w=; b=Nbl82x72fCU9qsHhx84Dp8E6eV
	b9Q2OnJ5k6HvRFRNVYYYXbL435BaKvwFhdujx0rFKK8iiYjCh6PKFbPBIrTsM/LGamLb6MfAoV5wP
	2iPpm6FkfP2l8ifxKN6Y3ouUcCAWH55z6x/O4ogkPkPM+pdG+ELfWwL8gdhE0O8gVKJnf6xgHm4cG
	d45L8RASfbbH2vphrGxDtipK9UE0F4mTHAzvM98qyz7U3HRr4Thhc0UPvv3MFkxPD4tgNSYhqK6f9
	URhQ3PTRYOWJovP+NS4DCEKKMGeVfDTC31P3rGpsiR1qelra6jP23ZzjfPpaw2hKh30N3xs5jgbG8
	Gt1w7PDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4vX-0000000Dvwb-0gAH;
	Wed, 17 Jul 2024 13:42:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4vU-0000000Dvvr-06PY
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:42:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B4E6617B4;
	Wed, 17 Jul 2024 13:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3F9C4AF0D;
	Wed, 17 Jul 2024 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223755;
	bh=OUqIMtjVeiKpTtaIAlYI6sa7gaYOLRReI4XGc/N5mfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtviZWWcIerFEJZYEp6y3kkaTE2RkITWziH5krmkHYqSRBdTk27RunKE+gxGlFyqO
	 7ygIO9Dd1KeaBCCYcPtRPNngcTVXh6nGyw5aS5TJ/iTYbcFCXkeDm7CkG3j5zXHBCj
	 99r1n6EX3zif8auA0YcEoAho6Yt5ymbpPxndSvIUFHadxP0gggQcOamfggCxirYifb
	 AIdeCCjfbqbatvLB/C97rZCcElQwfBK+irz/Zw801Udjc3Gt0W4vz4LHyguE4lvkr/
	 Fwa0d2CdAjfjsFF+bCfnVnk+VdgDP5I26D2dcIeH8jNbp0puwyn5+UQi0tcMjJYC1H
	 ewkQDGvMYsAZw==
Date: Wed, 17 Jul 2024 14:42:30 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: hwprobe: sort EXT_KEY()s in
 hwprobe_isa_ext0() alphabetically
Message-ID: <20240717-unluckily-collide-1aa35c97662c@spud>
References: <20240717-dedicate-squeamish-7e4ab54df58f@spud>
 <cba0c880-a1b2-4bb8-bef0-d280d87ec308@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <cba0c880-a1b2-4bb8-bef0-d280d87ec308@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_064236_157131_9842F137 
X-CRM114-Status: GOOD (  16.38  )
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
Content-Type: multipart/mixed; boundary="===============3893693027633810574=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3893693027633810574==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QH2DqXGUy+ZdMcY/"
Content-Disposition: inline


--QH2DqXGUy+ZdMcY/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 03:34:06PM +0200, Cl=E9ment L=E9ger wrote:
> On 17/07/2024 10:54, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Currently the entries appear to be in a random order (although according
> > to Palmer he has tried to sort them by key value) which makes it harder
> > to find entries in a growing list, and more likely to have conflicts as
> > all patches are adding to the end of the list. Sort them alphabetically
> > instead.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >  		if (has_fpu()) {
> > -			EXT_KEY(ZFH);
> > -			EXT_KEY(ZFHMIN);
> > -			EXT_KEY(ZFA);
> >  			EXT_KEY(ZCD);
> >  			EXT_KEY(ZCF);
> > +			EXT_KEY(ZFA);
> > +			EXT_KEY(ZFH);
> > +			EXT_KEY(ZFHMIN);
> >  		}
> >  #undef EXT_KEY
> >  	}
>=20
> I'd prefer that to be done after removing the "if
> (has_vector()/has_fpu()) by using the .validate callback for ISA
> extension. This way, you'll have only a single commit reordering everythi=
ng.

Right, and I do have some WIP for that here
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dva=
lidate_fpu_and_vector
but won't be sending that until it's cleaned up after the merge window.
I was intentionally sending this during it so that there would be no
moving pieces for this to conflict with - because it will conflict with
any other patch adding things to the list tails.

--QH2DqXGUy+ZdMcY/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpfKRgAKCRB4tDGHoIJi
0tuBAP4xR2iBKZLXlrM2beOQBYy76+eg35CePlufL/1bi/2akQD9GK3RQVgmlN4X
6n7zSdmdkP7k0Z5bzLQoEOqkHa6ZHgY=
=zp9K
-----END PGP SIGNATURE-----

--QH2DqXGUy+ZdMcY/--


--===============3893693027633810574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3893693027633810574==--

