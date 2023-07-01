Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400B5EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/MJ6psjr9Rk0Hqs1q8Yoo35Y1beyNoSjrrlIhuSzSA=; b=1kgE03uQyx28tHRYsX0a0FqL62
	cO6/MkoalhjmNsrY9i8rlGochz/Ia2rXa5BrgsgH+vsu2+49VpgcVVTGRnxMAS7B04G2D27ihe21N
	acqkrVshmn/hg3siCMiV+SeLcNVFyVN9QviymmUj5i978e6ZPEtGdDu/s1b0VOMKBCeQ7il0TtrGZ
	642+PUTczHA//qgPv4mtKkt2WKThXpptnG2jOUSPrfE6fP9aK5kMh5f46jVr27oVM0ZIHx63+rzsG
	lx83vA9nM9I1IGvAUAufJN7PyS0NilezhwEK1gVwi0+Vm5szhJxXuYwbYcJo7Km1ACwZxTGzrhZ/2
	zJktYxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYjq-005ksJ-2E;
	Sat, 01 Jul 2023 11:26:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYjo-005krs-0K
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 11:26:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A398D60B52;
	Sat,  1 Jul 2023 11:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544AAC433C7;
	Sat,  1 Jul 2023 11:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688210757;
	bh=+x6m0cvYRRqSFpoP4GprjYx6gT0lhtmBKoDo81qBycI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBK724BgCd2zXxc/AehUnet8tsxSUevHDljuSP6RqlyOah1mwVAsBIgpd4gl9LohU
	 V/FgZq6n7w8DqXsKF+gY/tw3kIOVJvas5IlP8luOeBh5FkgoydwsQZdeZZcrT8PqJX
	 qE4NOatGq0h9Mz5AixVFslEWhf/mOeM4Nda+UQs4V+8PPVq9bmDZwhrmz04k/XQNTA
	 FtBnebK7EKccBOEbw0/JkkqhYQcJwpopOdJlRKRXuF1mAz3qHIN8S6Yblssf1Aamdl
	 QiVOCVwE0bNK3E9ePX/vwKS0IPA88ZU3hshWQaNQljdYzkjakCKWmy7pgKY4/EzqIf
	 NK88rPFtI+kQA==
Date: Sat, 1 Jul 2023 12:25:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
	Leo <ycliang@andestech.com>, Oleksii <oleksii.kurochko@gmail.com>,
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
	u-boot@lists.denx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230701-pencil-predefine-3f8a2bc2b889@spud>
References: <20230630-very-greedless-16522d7b7830@spud>
 <20230701-b348653e432924f090c513db@orel>
MIME-Version: 1.0
In-Reply-To: <20230701-b348653e432924f090c513db@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_042600_209288_AA7F1604 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: multipart/mixed; boundary="===============0109475031579730134=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0109475031579730134==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+9VGfXQGZ6FfDNJx"
Content-Disposition: inline


--+9VGfXQGZ6FfDNJx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 01, 2023 at 01:01:40PM +0200, Andrew Jones wrote:
> On Fri, Jun 30, 2023 at 07:04:04PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> ...
> > +oneOf:
> > +  - required:
> > +      - riscv,isa
> > +  - required:
> > +      - riscv,isa-base
> > +
>=20
> I guess this means a DT must have either isa or isa-base, but not both.
> What should QEMU and other platforms which want to provide DTs that work
> for older kernels, but also start using the new schema do? I'd guess
> they'd like to provide both, where they'd expect isa-base to be used by
> newer kernels and isa by the old.

Sure, is just s/oneOf/anyOf/.

--+9VGfXQGZ6FfDNJx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKANPgAKCRB4tDGHoIJi
0kSxAP0c3x3Cd0SVAM/6s3YkdDjlEZuy4M3AWjQUW+T9v+oGOQD/ZF2BeCgQo9tN
OlycxibdtZ5wGfZzEsJ7zuE42+qwNAE=
=iqnd
-----END PGP SIGNATURE-----

--+9VGfXQGZ6FfDNJx--


--===============0109475031579730134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0109475031579730134==--

