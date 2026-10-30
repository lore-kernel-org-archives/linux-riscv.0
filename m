Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC2606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 01:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IYxoIoXL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WocAb16/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LuoD9kmCHeKQvoxh37li1p78XYLn8NB8IfnR+sFaw44=; b=IYxoIoXLk1ura5Hme8lhTda4d1
	C7IQdczHpaZcveOoTxLlYR7JrNWqMQbvlroKpA+/IEheMUbHM6WrqZ0IEXrklo0wAEN4cN9cf0oa8
	EhYo5XlYT7Y4D6/lWvAkceXuqX9t1l7SmlMrpjUe9552B0m0+BqM13k1uudq0TQR8YQJGfSvNriq9
	538C4wh+rGxqLI/Y3iv2CLhAq2CqoRD55iZS6qSMiAnavGAmYU/K+RXHuDc9xypBu7B34FQVmv0EK
	Jg/Z97uhNT+d7aqKm4DMTGj9kSRimvnCml3d8GubaOHNDPiP+AURP+2yVZceFS2KROEjyMMMOlREx
	KTYqEoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbTP-0000000AcE7-1zUx;
	Fri, 30 Oct 2026 01:32:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbTN-0000000AcE0-2EaP
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 01:32:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2CE660267;
	Fri, 30 Oct 2026 01:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740721F000C1;
	Fri, 30 Oct 2026 01:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323920;
	bh=TGhDAr2dwZiPzS/mrS7vv+2diNojd8kC6t6N16uc0O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WocAb16/Jo33fJskuMJawb6P61oVLXyyUMJEfKRHsrU+31PDsWwsdCpE4bC972cU9
	 rFFQ7vZJXaVnArQuvLOUo32ho47lw4xU+TzlABRw4SyRGnpVlcUM1SGiHO7gEtq6E4
	 kkiQ5kmou1t6DcWpP+b7V5j4r1fqyYofq2aK7NsEMjuoO0sEIG71E2/jV9LOo3LYR5
	 Me/5DQDb/CVXntf65i25k7phsRslVE8UZdFlBMImOFD7RxVl/FGm735Aacy3mWejNm
	 n2kiJbuZcyORy53YGml0MX6KCpfo0pqPJglWLaN5pN/bdkkUKHp6Zfb7CEh6+/Iesz
	 jM7mdtpFBo7ig==
Date: Thu, 29 Oct 2026 18:31:59 -0700
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
Message-ID: <auPzj_N44iXtrR_3@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <55208f641473e0714e4509fd5d071343b3a0de98.camel@axis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <55208f641473e0714e4509fd5d071343b3a0de98.camel@axis.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0259983415539498271=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============0259983415539498271==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZrT0CggEIZoz5/F0"
Content-Disposition: inline


--ZrT0CggEIZoz5/F0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 01:02:22PM +0000, Kanak Shilledar wrote:
> On Fri, 2026-10-02 at 15:43 +0200, Kanak Shilledar wrote:
> > Fix almost all warnings thrown by dt-check-style after krzk's updates
> > to the tool [1] when run under the strict mode. There are still a few
> > warnings remaining which are documented in the relevant commit
> > message.
> > By doing this the files become easier to read and maintain.
> >=20
> > After this patch series only the following warnings are thrown:
> >=20
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:221: [child-name-
> > order] child node 'oscillator' out of name order
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:227: [child-name-
> > order] child node '32k-oscillator' out of name order
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:248: [property-name]
> > property name "snps,wr_osr_lmt" is using discouraged style
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:249: [property-name]
> > property name "snps,rd_osr_lmt" is using discouraged style
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:253: [child-name-
> > order] child node 'aon' out of name order
> >=20
> > These are left for future work as they create a very large diff.
> >=20
> > [1]
> > https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines
> >=20
> > Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> > ---
>=20
> Friendly ping :)

Thanks for submitting this series and sorry for the delay. I will apply
these to thead-dt-for-next once 7.4-rc1 is released.

Drew

--ZrT0CggEIZoz5/F0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCauPziwAKCRDb7CzD2Six
DDV9AP0XyxKiEZKezADR+IwYgkm3uHSS4vjMhhOh9me5W4tdZgEAtBrp5aIocVAk
sjQ04QnfKSV9NEf09vt0Aoay6ZsbJA4=
=1xB1
-----END PGP SIGNATURE-----

--ZrT0CggEIZoz5/F0--


--===============0259983415539498271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0259983415539498271==--

