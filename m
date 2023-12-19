Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B704C46CCD
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pr4lpnraROtlQRWv61XZEVcRlFnm3MQWuXKdRqEhe7I=; b=RULtmOuy9f9od4lEOQvV0Wc4XP
	g4MsQzowMMcREtgxkJB9lowFAmuBnRU3GACjIJyfLflDqdwBr2tVvbq/n3MrtHvlCJSKOgD2ponLr
	qj/gcJo1ptrIIoD7t+9SRtySOL+6Npi8x1fDozjHdcpo4pYfx5KOJoxQ8hKzjOeQMoECHGxhAYQLR
	fGmq4mSc3eF8ZseFzdSrrUJnMfvgJXL8NLUAlUhFJTcxL7eunISTBb3lhJ8n4lA6bf17w9vzAmM5h
	gD8XFyqkZAD6TwRJWvrIW1xC7u2ETGQP+gBL2dGS7Me9DlaoqrQ25vcsVrR403Xg2HuzWHJwiwZxY
	K2xhZdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbKe-00EQIH-0u;
	Tue, 19 Dec 2023 14:44:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbKa-00EQGf-0N;
	Tue, 19 Dec 2023 14:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 910E7B8179D;
	Tue, 19 Dec 2023 14:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A9EC433C8;
	Tue, 19 Dec 2023 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702997061;
	bh=Ec49Y1Ch4Y7DbynL5qJ3/M6jv5kHIuiLATbynFYdEYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dehLBIGr1LajE1OtvLVTLPVToTCjSzGsWdAe/pHVJeX2MIrC9m1mPTvooMTQrt3ta
	 7RGV4aXSoxoCh+Xnx0YICqWv36ry11nHS/nzEb8E87JqaOK6O/XvQtbWdjvWtFdlFk
	 Ax4IumnD102EC7x7VhIiWz1tdIygL5RL82izs263RsC/22KrDePCqEiQffo0bzg/fx
	 IH02+GzjOlMJyhx/ApVqSUrufavub2gGPQRrSNemUpbfH1eoTb1/7OlF+Izlp0YFig
	 o46oeV75pUDtP1526DL2IImMqbrWtaAdCOgm36G8fWwsiUQCOCxzS0D6au1TxDVNBI
	 BlUl90OFPwCbA==
Date: Tue, 19 Dec 2023 14:44:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	joe@perches.com, nathan@kernel.org
Subject: Re: [PATCH v4 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <20231219-twitch-many-ca8877857182@spud>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-6-bhe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231213055747.61826-6-bhe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_064424_304242_EF4DF233 
X-CRM114-Status: GOOD (  13.14  )
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
Content-Type: multipart/mixed; boundary="===============6245077241828171567=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6245077241828171567==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/6JoYHenWk4BZK6"
Content-Disposition: inline


--s/6JoYHenWk4BZK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 01:57:45PM +0800, Baoquan He wrote:
> Then when specifying '-d' for kexec_file_load interface, loaded
> locations of kernel/initrd/cmdline etc can be printed out to help debug.
>=20
> Here replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.
>=20
> And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> because loaded location of purgatory and device tree are only printed
> out for debugging, it doesn't make sense to always print them out.
>=20
> And also remove kexec_image_info() because the content has been printed
> out in generic code.
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>

I'm sorry - I meant to look at this several days ago but I forgot.
Apart from the typo that crept back into $subject, this version explains
the rationale behind what you're changing a lot better, thanks.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--s/6JoYHenWk4BZK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYGsQQAKCRB4tDGHoIJi
0m1fAP9g+8AFIV/8mpsN7yszSR98AoukUk319L4Cyd7Ffhkl6wEA7poQh+JBuAOa
YQJL75j4TedEPF5Y6iyMMP3w1MeKMAs=
=JnLd
-----END PGP SIGNATURE-----

--s/6JoYHenWk4BZK6--


--===============6245077241828171567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6245077241828171567==--

