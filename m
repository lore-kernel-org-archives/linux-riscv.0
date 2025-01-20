Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498A7C02182
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suVl2KvYha13Ph61yaQD9h1Q9xvsMeNDEpHhHutZXLw=; b=M0JReBMCC6ODN0aBLIuIui5oUv
	ml6ZRyMAp4bqNaFqhqPMBkeqMSa9ZfUp5PHB+prvSmEI1h8Vt0LdQcedtq4Udxv89SZiirx7GSiuS
	AMRpxE6oru5jmtgZeaA13nndM6T8/o5Zuq/VPtQezZqUSuDH1gUsgUx6IRnK8F8KIJWzUq25DW3ti
	oLwy8tMWXFrfgET3On7AtLOJbWHiom3ivcesSAhEagmm3G6O9i952yFXYMrI6o+HgsFNTaV1awkjw
	2++YhXPO7VHuZDiLUOxbb+bOJgs0mA9W28Vk/leONvxZXQzjI9WB2EjTlqZ4d/NzcWHBeg4Nbnr6t
	3ZQ4s+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvUe-000000067lv-2ArQ;
	Mon, 20 Jan 2025 17:23:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvOi-000000066IO-3gez
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 17:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E29D5C0701;
	Mon, 20 Jan 2025 17:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07188C4AF09;
	Mon, 20 Jan 2025 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737393431;
	bh=A923nmZtkqZm56LOWMtx0sXfsZZxUxKhZX5aBe4AcaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0kRbRymS6KzeYybpOJMY0LyrBu2anpENyASGOFzqsfF3et6I9aqi+ys8LIMOqctb
	 oOT1/wBk43bEhp0BNqoPu8w51qc0YJFsBybwQq1gzmUv4uDAb7GbOwDrXVOoZ3Wn7l
	 LyEKmJZaXxtWsdMKeTBdj+OyYE+HFtuFWPjOEhtGeI7wKaZr+YbQInE5EhqfQIxIiI
	 rUFSsWYp0H44nbdUqbWNfuSkv7Ajm06aXknG+YRcLN6ABY0C7xyHApOgPz+rHOAX6d
	 r9f9H9pLjvi5F/iVJv7xWb9gnVu0Qj8ZljxYbSBLkJ+Dhi9KMQ0gCGXyjnwLXiCcpX
	 hRm7NbhNs10lg==
Date: Mon, 20 Jan 2025 17:17:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: riscv: document vector crypto
 requirements
Message-ID: <20250120-veggie-yin-826152e1398f@spud>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
 <20241024-pungent-lasso-42dd3512a3c8@spud>
 <20241025022411.GB1781@sol.localdomain>
 <20241025024224.GC1781@sol.localdomain>
 <20241025-defile-blaming-12fc1e3a62e0@spud>
 <Z4r73Iq5IWM8Z633@ghost>
MIME-Version: 1.0
In-Reply-To: <Z4r73Iq5IWM8Z633@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_091713_004041_F0DCE6E0 
X-CRM114-Status: GOOD (  20.31  )
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
Content-Type: multipart/mixed; boundary="===============6545400745202065866=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6545400745202065866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PHDwxKNkyYTSVlll"
Content-Disposition: inline


--PHDwxKNkyYTSVlll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 04:54:52PM -0800, Charlie Jenkins wrote:
> On Fri, Oct 25, 2024 at 05:53:49PM +0100, Conor Dooley wrote:
> > On Thu, Oct 24, 2024 at 07:42:24PM -0700, Eric Biggers wrote:
> > > On Thu, Oct 24, 2024 at 07:24:11PM -0700, Eric Biggers wrote:
> > > > On Thu, Oct 24, 2024 at 01:34:33PM +0100, Conor Dooley wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >=20
> > > > > Section 35.2. Extensions Overview of [1] says:
> > > > > | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly =
the composite extensions Zvkn and
> > > > > | Zvks-- (sic) require a Zve64x base, or application ("V") base V=
ector Extension.
> > > > > | All of the other Vector Crypto Extensions can be built on any e=
mbedded (Zve*) or application ("V") base
> > > > > | Vector Extension
> > > > >=20
> > > > > Apply these rules in the binding, so that invalid combinations ca=
n be
> > > > > avoided.
> > > >=20
> > > > It looks like that part of the spec is wrong, though.  The Zvknhb a=
nd Zvbc are
> > > > correct, but the list of the composite extensions that at least one=
 of them is
> > > > included in is: Zvkn, Zvknc, Zvkng, Zvksc.
> > > >=20
> > >=20
> > > I am attempting to fix this in
> > > https://github.com/riscv/riscv-isa-manual/pull/1697
> >=20
> > Looks like at least one person agrees with you, but I'll wait til that's
> > merged before submitting another version. Thanks for reporting it.
>=20
> It's been merged now :)

Ye, I actually respun this last week, but opted to wait until after the
merge window to send another revision.

--PHDwxKNkyYTSVlll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ46FEgAKCRB4tDGHoIJi
0gzMAQDPuabHzzsol76+F6jUE8gwHHdY0OM8zByhgJ9+8VW86AEAnIAt+Wjm4iz7
Qk5p7MJZlDnf/Hb03lLSLz/Y+QcRGQI=
=8OWo
-----END PGP SIGNATURE-----

--PHDwxKNkyYTSVlll--


--===============6545400745202065866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6545400745202065866==--

