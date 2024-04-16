Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21CDC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 21:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zUkvuotQZR3FDQ748aLa0JMmD5FSyqYs3TJPA2u4qc=; b=mJlO/ZCRLV61MIbsT6mr0LVSz3
	3GLj9iDvWR1BBLdBn+HCEgghxmbXmTvm8iezWONTWduGX4TKs2vM2xj2wLsMaRQXY78xGzBCgcAX2
	SBAwyYuujApk90GfRdm5sboVcSdjbKsFjkPVnKzOC3GsSM052BhRVue5EkCBiL7H/7Fjmnl6BmCBO
	zX/35xQvXSmXw1I2TpDklRweX6HSoFTEd4uu5o6dkEc1rTHtY7ljpKo8onaNHeED+d7hThSbSWaGG
	pNK+E4CZU4VI/ovnIiS2KgRKUhSaiJZdv1Icd2G1C1anBj3Y+RelJ3ezjm7uvxBW0pZOmlJD3iojC
	ws67bimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwq4q-0000000Doxq-1aIK;
	Tue, 16 Apr 2024 21:10:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwq4l-0000000DovV-15NC;
	Tue, 16 Apr 2024 21:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 276946123C;
	Tue, 16 Apr 2024 21:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B04AC113CE;
	Tue, 16 Apr 2024 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713301845;
	bh=6SKY8bqj53o+GZYyijFSxu3zJnsN2yU7FXXH7uzjaJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b37s1TWztoEP1XtKjvnrYhTztn6FEZSBRfS0CB5E/U2BBjp0zO04UvRS5kEmszB8L
	 2ZSzdsdQuVvsFeKpVdqg8pBTpg/B/DuOCBe4UGtZTDtsUoTVS53u6IEeCTU/9X/btu
	 gVT1MTAal9in/KAKNRctjS4hF7PK3Gn3VXjqow1RSmhAuKZMhKsJJhxDHnjJASdGFK
	 velt7R45/pMbac6a2dg8Pk+zO7MuKRdtuo8813r7UOcMGTKClRdEXACNsm1mLQwLKh
	 AoUclerCfq7D68JiZg/fJswcJi6GyHh5ghp4zX7el4+4XH2Jp9DLmI+v5ptUZmy5G8
	 oZlcN1+GPeUCg==
Date: Tue, 16 Apr 2024 22:10:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Message-ID: <20240416-budget-cause-c4002a9cc05b@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
 <20240416-underwire-bright-b2ab0fa991ec@spud>
 <Zh7i2pir0j6tXfPD@ghost>
MIME-Version: 1.0
In-Reply-To: <Zh7i2pir0j6tXfPD@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_141047_371248_983C54EC 
X-CRM114-Status: GOOD (  15.56  )
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
Content-Type: multipart/mixed; boundary="===============3332505804360297438=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3332505804360297438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N+EO9PqJ6paNtHI3"
Content-Disposition: inline


--N+EO9PqJ6paNtHI3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 01:43:06PM -0700, Charlie Jenkins wrote:
> On Tue, Apr 16, 2024 at 04:16:30PM +0100, Conor Dooley wrote:
> > On Mon, Apr 15, 2024 at 09:11:59PM -0700, Charlie Jenkins wrote:
> > > The xtheadvector ISA extension is described on the T-Head extension s=
pec
> > > Github page [1] at commit 95358cb2cca9.
> > >=20
> > > Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358c=
b2cca9489361c61d3
> > > 35e03d3134b14133f/xtheadvector.adoc [1]
> >=20
> > This should not be wrapped btw.
> > Otherwise,
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I don't believe it is wrapped? It appears wrapped in your response but
> it appears on lore correctly:
>=20
> https://lore.kernel.org/lkml/20240415-dev-charlie-support_thead_vector_6_=
9-v2-2-c7d68c603268@rivosinc.com/

IDK man, looks wrapped on lore too. The other copy of the same link
isn't wrapped & I've never had mutt wrap stuff like this before.

--N+EO9PqJ6paNtHI3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh7pTwAKCRB4tDGHoIJi
0oe3AQDQG/kHZeAldrMoBtsuQPLTNJ0Epz1UV1aUIpGum4LtuQEAogQ6sgpTP4rw
9y6K4GRRCRzQDtYDNsq3qY/MEznY0As=
=fCu9
-----END PGP SIGNATURE-----

--N+EO9PqJ6paNtHI3--


--===============3332505804360297438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3332505804360297438==--

