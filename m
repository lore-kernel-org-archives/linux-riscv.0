Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B42C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyboT7/utlViAx0kRV2erSVhyKdYEcDtvwQrmqCAo/k=; b=cLIBJhbljpnyWpDns2BwcJ+xG0
	7Y3LTNWdkfJLxc1qqgm/I41bVOhgLQKdgCtVfouxr+E3mbAvmGNUdYsCb4e5YgRrVcdfrkDIHYqfT
	3v0PIJmOj6yMaW2FBnzwiUJcY5pwIERhy0VYKZlpjvaX/Wqgwqiwdbi5ZWnxtfUnMtFnEBY3o+t2I
	ppM2m0zIQkM+hUFBNFbVREdZ6G4rr84DruIfR5SCbU6sOWJI/gz0lBcHgjkS4ktiToFYbQwTqbXm3
	zqmMshAHVt5UvD3Fchny9Bg/ejdYOA7UJu8rB3npgR0hXZmt4g8tO4evKH0GW1iMzUeBWQ+UTnKcE
	St+zn4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVe8-00000007clt-2DcN;
	Wed, 26 Jun 2024 16:37:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVdy-00000007chV-10ch;
	Wed, 26 Jun 2024 16:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFCBB61986;
	Wed, 26 Jun 2024 16:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDB2C116B1;
	Wed, 26 Jun 2024 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719419832;
	bh=1lD8fRLKhQDmXHyNmsSrGUGVXdUGFAPvH9RJeDgB7pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCG7hsy2l9mBP8DgUpW6XIpDt4uWVHlRvknHISmTPLOh1xGolLNBmOFqBxH6GtrC5
	 UTk7lYax8L91yj/c3jLL1NPP0w4ngeqTrcKad1GvCfrhYra5PkGsXQDl/AaC+b5FjQ
	 s7j2iQJYWL+wG5mW/fledGv2KPyPdX8ZVn/vOoPWaM5Ec+bPUS018GoOjpcDR2eubW
	 kQdj6p8tJW++NCGN+zCLRKuSrJp6OsKOBm1hiAO4GSReOLQYEgcUo9+39L/NrfA0vO
	 sBaf9nGoToLOZRtaUas/UJBBzxs2GwFd90GrjhS/tFZ5yHDWX/gs/XcYNcQsstGS27
	 DhuI6ppAYoUbQ==
Date: Wed, 26 Jun 2024 17:37:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to
 hpmevent mapping while starting cpus
Message-ID: <20240626-eraser-unselect-99e68a1f5a3e@spud>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
 <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_093714_402647_47BA498A 
X-CRM114-Status: GOOD (  16.84  )
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
Content-Type: multipart/mixed; boundary="===============7844504915799375494=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7844504915799375494==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ron7u5fHDD4eUMra"
Content-Disposition: inline


--ron7u5fHDD4eUMra
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 09:18:46AM -0700, Atish Kumar Patra wrote:
> On Wed, Jun 26, 2024 at 6:24=E2=80=AFAM Samuel Holland
> <samuel.holland@sifive.com> wrote:
> >
> > On 2024-06-26 2:23 AM, Atish Patra wrote:
> > > From: Samuel Holland <samuel.holland@sifive.com>
> > >
> > > Currently, we stop all the counters while a new cpu is brought online.
> > > However, the hpmevent to counter mappings are not reset. The firmware=
 may
> > > have some stale encoding in their mapping structure which may lead to
> > > undesirable results. We have not encountered such scenario though.
> > >
> >
> > This needs:
> >
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >
>=20
> Oops. Sorry I missed that.
>=20
> @Alexandre Ghiti

What's Alex going to be able to do?

> @Palmer Dabbelt : Can you add that while picking up
> the patch or should I respin a v4 ?

b4 should pick the signoff up though. "perf: RISC-V: Check standard
event availability" seems to be missing your signoff though...

--ron7u5fHDD4eUMra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnxDswAKCRB4tDGHoIJi
0jfRAQDzZpKiVTiVaovH+Q/5OxJQntjZIMNpZSGbTWqwqtdMoAEA9qF6f+d+BCB2
dVhzoaqpQ2mizAy1CcfVkCikmzqBlQM=
=RDz8
-----END PGP SIGNATURE-----

--ron7u5fHDD4eUMra--


--===============7844504915799375494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7844504915799375494==--

