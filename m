Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59C606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Moq63Oe7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJvy2Jum
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0AUHERcKdU3OIR2Dd+UfCe8P4ESbpY+RetDzhP89N14=; b=Moq63Oe7mQmWfeu5wC1kT3EN4Q
	LijxOq8GZ1zRmyczLQ8G7yIFsHZOQM1NYGJNEN7LevkWolQZ2B1kB8V1+zaEymgUlnpL+6ppavnBH
	i3T75TUkNXCaZEqdvKPUWrf6mZjg9y1+CuOeHSJInjo3lRyZIL2XdFj4dGTeEUhbpLw6M9u37E3Le
	HrZZdKEMo0TniwzoRezDFvIk/MP7Vb/i093ZC82fYbdvZrB5op0IUO7nC9svkGsqbQjjw+NliMoXj
	ChWRu3mY6yRGIkcrUhxU6lZRyhQad6iHs1bLpwxFDffkOD2A41FW792+Vhap5I8mIqoYAu68n/udx
	dhkFRpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn9G-0000000AJCK-1aQG;
	Wed, 18 Nov 2026 21:24:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn9F-0000000AJCE-0Tb1
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 21:24:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7E3D41779;
	Wed, 18 Nov 2026 21:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CADF1F000C5;
	Wed, 18 Nov 2026 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795037096;
	bh=HgEH5cLrinHq9eSROFAW3XpxSzq5TUujP250dxuo8uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AJvy2Jumdmfk9Z2YWPaQm8LglDiyY/Dj8MkUU8VGJJfVX3ZPHwDf2TTSZws0TlkNw
	 xhSZnxH16nOw8TvstdnSfzIkl+5fm2IxLf/Zy9Z40mTkoqxWuT4wF9S+e77WGRXAcg
	 XmOSnCjT4BdfDGwyQc8EHBSc7AlzjFSf18Cz5z+s53Zvh0h8o0KX/24GkcnuzerEkq
	 /YtmtUlj8FhsVqPf03i94x7C+xMufhPGR5d4wZmWToHX8qBjlq2//sf643zCQ1WJa/
	 4UA+T5MKrSjuGzkW17MNi0Yb1tJo13zGVLzSLQY3z9wAJuQU/APlbqRSkj0I8JdF3N
	 nzFqN+nUeQtwg==
Date: Wed, 18 Nov 2026 13:24:55 -0800
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <Kanak.Shilledar@axis.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"wefu@redhat.com" <wefu@redhat.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] riscv: dts: thead: Cleanup with dt-check-style
Message-ID: <av4Xp-apSyZxSgb8@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <55208f641473e0714e4509fd5d071343b3a0de98.camel@axis.com>
 <auPzj_N44iXtrR_3@thelio>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <auPzj_N44iXtrR_3@thelio>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8160066020210882346=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============8160066020210882346==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UAw8jnEInJTNEJJi"
Content-Disposition: inline


--UAw8jnEInJTNEJJi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 06:31:59PM -0700, Drew Fustini wrote:
> On Mon, Oct 26, 2026 at 01:02:22PM +0000, Kanak Shilledar wrote:
> > On Fri, 2026-10-02 at 15:43 +0200, Kanak Shilledar wrote:
> > > Fix almost all warnings thrown by dt-check-style after krzk's updates
> > > to the tool [1] when run under the strict mode. There are still a few
> > > warnings remaining which are documented in the relevant commit
> > > message.
> > > By doing this the files become easier to read and maintain.
> > >=20
> > > After this patch series only the following warnings are thrown:
> > >=20
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:221: [child-name-
> > > order] child node 'oscillator' out of name order
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:227: [child-name-
> > > order] child node '32k-oscillator' out of name order
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:248: [property-name]
> > > property name "snps,wr_osr_lmt" is using discouraged style
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:249: [property-name]
> > > property name "snps,rd_osr_lmt" is using discouraged style
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:253: [child-name-
> > > order] child node 'aon' out of name order
> > >=20
> > > These are left for future work as they create a very large diff.
> > >=20
> > > [1]
> > > https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines
> > >=20
> > > Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> > > ---
> >=20
> > Friendly ping :)
>=20
> Thanks for submitting this series and sorry for the delay. I will apply
> these to thead-dt-for-next once 7.4-rc1 is released.
>=20
> Drew

I have applied all 4 patches to thead-dt-for-next:

  [1/4] riscv: dts: thead: beaglev-ahead: Cleanup with dt-check-style
        https://git.kernel.org/fustini/c/27da5ff6ffb2
  [2/4] riscv: dts: thead: th1520: Cleanup with dt-check-style
        https://git.kernel.org/fustini/c/eda5b545ffd3
  [3/4] riscv: dts: thead: th1520-lichee-module-4a: Cleanup with dt-check-s=
tyle
        https://git.kernel.org/fustini/c/0cfb7b8f5073
  [4/4] riscv: dts: thead: th1520-lichee-pi-4a: Cleanup with dt-check-style
        https://git.kernel.org/fustini/c/5b1f375d891a

Thanks,
Drew

--UAw8jnEInJTNEJJi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCav4XlAAKCRDb7CzD2Six
DLNqAP0evKW2cYpDjM5kWGd/p29FC08eDapYN8/RIJfRxhqvlAEA7zVEtHenGSaY
+U+1z7GHgLr+6iXCQvG1iLEGnnoHBgE=
=ivEq
-----END PGP SIGNATURE-----

--UAw8jnEInJTNEJJi--


--===============8160066020210882346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8160066020210882346==--

