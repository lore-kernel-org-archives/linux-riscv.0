Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4C0C636D3
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/efQCID2UM9K8QHulUlxdX2BqNyOHkWUep/aoedYOY=; b=fJ7sCR4OnRcykf2qSwpBHrUcTf
	vqTsAS2YSgitxox8nESf26T0Nst9tKvxjRTbkj7N58L41ZAgL1Ti6Dqu5/Nw1kJfmxi+1cJsxl8mJ
	6DZ2UXyBt/k5H9/VF9w4lx/cVIuJMJqL3hh1MLW+UmPtltCY1/y4rUVVL0iK5tLMAdLlDqXceg7/s
	YXdLfxsAun//ku9nZWQkexHivC81vZoB4lfwaOAOmUAXgiUS7RkKSo4bOybMe7ktAOsRaxNiw5OrK
	iTkutxoZ+vjbr+PveKqaBDv+wsFZSf1fV67DS/LT/L0e03GMK9yqExIfXYdnT/8CnmYC5qGoZNvUQ
	kubzluUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPp2S-00GagH-P7; Wed, 08 Feb 2023 18:19:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPp2P-00GafT-PA; Wed, 08 Feb 2023 18:19:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 961A161785;
	Wed,  8 Feb 2023 18:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7343FC433D2;
	Wed,  8 Feb 2023 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675880360;
	bh=6KoBeMpeRHFeimH5d0ziYXzYBp1yUeV/0hV0eN2Wxyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjh1vN3mKT0iPCq+xThdF1HLZpgWOw5GP4vdzmO6bRJ7aSatMSwkhFvvb4bZg5doD
	 vpLq1v+rzaJRdQ2An0Vm1k4xWvT8QSW0EQgQf8BKyH8WfrP7136Xk8N40bJcl8QrrX
	 mx3gYHqtfFMcNAKz0+HjICOgbgvnfabMgYXKTWWlJyk7xlohRzarr8qubU8tsc7DNp
	 vCxCNYYtOJCXB1ya/s8vJtNwiF9fnCiQ4sVFLeYiqa5gCjsX2YZAiiJDP0NRFONGcq
	 vyjZ7F37ftrL2DqY8GD/US9fF5g/FjtKnOFZnvEq/82wWaS5+KHiWXWH7xcsTJgIFW
	 eq12Ci6e/DOFw==
Date: Wed, 8 Feb 2023 18:19:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
Message-ID: <Y+PnorGskAAIsODw@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
 <CABgGipW430Cs0OgYO94RqfwrBFJOPV3HeS24Rv3nHgr4yOVaPQ@mail.gmail.com>
 <Y9d8IBqXyep+PJTq@wendy>
MIME-Version: 1.0
In-Reply-To: <Y9d8IBqXyep+PJTq@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_101921_935861_73203C54 
X-CRM114-Status: GOOD (  24.61  )
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
Content-Type: multipart/mixed; boundary="===============6376684334746837138=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6376684334746837138==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gyvV7XIdJDtwPXYD"
Content-Disposition: inline


--gyvV7XIdJDtwPXYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Mon, Jan 30, 2023 at 08:13:20AM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 03:46:32PM +0800, Andy Chiu wrote:
> > On Thu, Jan 26, 2023 at 5:04 AM Conor Dooley <conor@kernel.org> wrote:
> > > Firstly, no-implicit-float is a CFLAG, so why add it to march?
> > I placed it in march because I thought we need the flag in vdso. And,
> > KBUILD_CFLAGS is not enough for vdso. However, I think we don't need
> > this flag in vdso since it is run in user space anyway.
> > > There is an existing patch on the list for enabling this flag, but I
> > > recall Palmer saying that it was not actually needed?
> > The flag is needed for clang builds to prevent auto-vectorization from
> > using V in the kernel code [1].
> >=20
> > > Palmer, do you remember why that was?
> > The discussion[2] suggested that we need this flag, IIUC. But somehow
> > the patch did make it into the tree.
>=20
> I know, in [1] I left an R-b as the patch seemed reasonable to me.
> Palmer mentioned some reason for not thinking it was actually needed but
> not on-list, so I was hoping he'd comment!

Palmer replied there today with his rationale & an expectation that we
do the same thing for vector as we did for float:
https://lore.kernel.org/linux-riscv/mhng-4c71ada6-003c-414f-9a74-efa3ccd285=
6b@palmer-ri-x1c9/T/#m366779709bbcf7672b5277b3bb27a7d6ce6c6115

>=20
> And I suppose, it never got any further attention as it isn't needed by
> any in-tree code?
>=20
> > [1]https://lore.kernel.org/all/CAOnJCULtT-y9vo6YhW7bW9XyKRdod-hvFfr02jH=
VamR_LcsKdA@mail.gmail.com/
> > [2]https://lore.kernel.org/all/20221216185012.2342675-1-abdulras@google=
=2Ecom/

Cheers,
Conor.


--gyvV7XIdJDtwPXYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+PnogAKCRB4tDGHoIJi
0uJ7AQDYZ/e40tjcGorJ/ALeoRnKAUyci3t2IcqRT1xoAD16dgEA7cSgEiEZ6h6l
r1xFWeLAvcre2pZxf/YPY7NXXWrhzAQ=
=9EzO
-----END PGP SIGNATURE-----

--gyvV7XIdJDtwPXYD--


--===============6376684334746837138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6376684334746837138==--

