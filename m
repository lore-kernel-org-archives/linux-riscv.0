Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EADC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ULd/XJxO/AZsMf5qjsTVbp0ycoprjMAL1hi4JoDVmA=; b=GGUVUy4yEYL7yFM5/HfewZOYKy
	Nk6dfohtIVuYOZ0vMFVaiGsAuK/Y0y/4iA45F3kn3LOPXjgluZxT3GH5wKeFOUC5b5xqU+I46vjQz
	dIi2Kb/gsdhZOlZ4eiOn5XHWc9mOgBo2KOwzrYWE+kcSR1wfmtfm9wxhvsldCRnXcjm8qBR9xvMBe
	nlDYjwuDMHk6zEsh+nOKz9X3Dxpj6NR3KnYCYjSMTyBZeEuHuIOeH59rmDksqAnpCEWwQmIAWLB3g
	77uh3EcGAfo8pEa3mVtyykUaNklairiee2LTiS/nE4jiRgtz4rAtL0QLLE5DDHdPGtUZ71k7z+Hxw
	MY4dn6bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aYm-00EMCY-57; Tue, 06 Dec 2022 16:12:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aYj-00EM8K-H6; Tue, 06 Dec 2022 16:12:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F15F86179C;
	Tue,  6 Dec 2022 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2D0C433C1;
	Tue,  6 Dec 2022 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670343160;
	bh=HgFTfC9zyZQkoZmePhkz0MAY8w2m/nlUZpikKauzyNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQOA1wFB7IjdbpNtB0kXUsH1jicB3zphJhix3CVdp7LRImEsvXizZS1+It1XCfvu0
	 lzYC0HGDJUy1Rb2tVGlMB2dxjzI6bNi+p1+UMps0Za75Ua/rrbeVOnP4zBzZuqg3Ik
	 oxl8BGNdB5yXmN6vl62fB4iKA7FITecNLHthCrt6eAb0NEgJ7swPvt5tUdqYgtN2OO
	 E6UToeESPi6hVkSDfw0Jcp0FTiBVgSPEW8jWVNw4pqUzoVgAFUtBwLP6rf10cOIL9M
	 4XaVIX3Jf8qCdwjqs9ctO1rEo0k3evwFI+FIZAjcyueXUE57OBzDe8MfBwtWKAa+kp
	 zhs7703F9YS1A==
Date: Tue, 6 Dec 2022 16:12:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y49p82Iac/+iYQ+1@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <10190559.nUPlyArG6x@diego>
 <Y45LRu0Gvrurm5Rh@spud>
 <12207576.O9o76ZdvQC@diego>
 <Y49Zi2CNv8pZSAe5@xhacker>
MIME-Version: 1.0
In-Reply-To: <Y49Zi2CNv8pZSAe5@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_081241_627297_98F381B6 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: multipart/mixed; boundary="===============6810460166166572045=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6810460166166572045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0yfmBJphl5BauK+i"
Content-Disposition: inline


--0yfmBJphl5BauK+i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2022 at 11:02:35PM +0800, Jisheng Zhang wrote:

> > > Higher Powers here, but some sort of logical ordering would probably =
be
> > > a good idea so as not to hold each other up?
> > > The non-string bit of your series has been fairly well reviewed & wou=
ld,
> > > in theory, be mergeable once the tree re-opens? Timing aside, Jisheng=
's
> > > idea seems like a good one, no?
>=20
> IMHO, it will be better if Palmer can merge Heiko's alternative improveme=
nts
> into riscv-next once well reviewed and the window is reopen. Then Drew,
> Prabhakar and I can rebase on that tree.

Unless I missed something, we're saying the same thing in different ways
:)


--0yfmBJphl5BauK+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY49p1QAKCRB4tDGHoIJi
0h75AQCs7HqktVAyyk++q+81eShEP/hyMgLVqh7NhSCXaYUMIQEA8Fq3lpbnzAbi
JQrKm36mZz/R5qyDiB9pd5bml2HvoQA=
=xqAW
-----END PGP SIGNATURE-----

--0yfmBJphl5BauK+i--


--===============6810460166166572045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6810460166166572045==--

