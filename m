Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DFDC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uR+MfNraBBe1vS8HXFneAneIE0O0/k6gmiuf5lFxQsM=; b=J415PjQQ2zxY5GthmPyvnGAsQ2
	gia437UNMYszpLjiJVOF38H5sMTUZdNgBuNp0tDYNVkwAhg/A01TMUF20YGprntgU5vTkn4MHMNyR
	TTsLwHYlNd1P3bozP1FTOQfMLcB73amEXqDovQiJeY/OJro++urBok7HGEUE9ZtItF3CRFwTdIH5F
	O17P3Xq8TR6r1ncsOkejNQ9Q1TF6tbOwPm6fUm+Ral85IRyNLSoAKJtg6r0kN5x4clP5uKJIA6PTu
	cGi6RT1OsHbXPCCZB9bhPckLHhJ7SkWfZsWU/lUp47wxcM9l91nLivLe2+MSTC8eXjz7JsQMGG9rf
	ZnnzGBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfPBj-002fyL-1v;
	Thu, 23 Mar 2023 17:57:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfPBg-002fxZ-0S;
	Thu, 23 Mar 2023 17:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7F72362806;
	Thu, 23 Mar 2023 17:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C29DC433D2;
	Thu, 23 Mar 2023 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679594238;
	bh=0P9lvLfzOgg9nEPx2xz1to1s95lPFF4mkHqkfNB0lHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIs9mkE57P5FBnwPI1SdwpnmJiGHky0J3EZBduDg6k7vBHnOxIlffWlPDbKT0AIZj
	 d0uYwnejiJHjwtlKBuhOgT6g+X2gOsxvAEJHVK8p97ZaxgK/ZDS6VC3RUUrIx9Nr9G
	 7wwnabnBAa9Km8QGMeYD3BMXvd/07DX1b/JzES7f8EdRUTMaZd/CdyRLxeHRQZkngu
	 L8HVFdMKjXU/K22LO3m/x65jNEY3rX0/NPzuyNU7h0AlhjR4P/tv1V6sWBg4dk1Tl3
	 P186kSMYHa3uDQJiZHmU4b/iexav4Zyao0JaNiyJiW2Wlj5FvVp/qPp1lld92YM3ca
	 KUyrJYE5JPPHA==
Date: Thu, 23 Mar 2023 17:57:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Require alternatives
Message-ID: <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
MIME-Version: 1.0
In-Reply-To: <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_105720_237980_DC8C7326 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Type: multipart/mixed; boundary="===============2924154372003281677=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2924154372003281677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w3WkNcAkErpEV+UK"
Content-Disposition: inline


--w3WkNcAkErpEV+UK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 07:40:14PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> > KVM makes use of riscv_has_extension_unlikely() to check for the
> > svinval extension. riscv_has_extension_unlikely() is built on
> > alternatives, which means KVM should ensure alternatives support
> > is available.
> >=20
> > The first patch takes the opportunity to cleanup KVM's select
> > list. The second patch selects RISCV_ALTERNATIVE.
>=20
> Reminds me, I need to re-submit my patch doing that for the top-level
> RISC-V Kconfig...
> For the pair:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Actually, I would like to take this back for patch 2.
Per the discussion on the other thread about XIP [1], I don't think
that KVM should be selecting alternatives like this.
Would you mind if I picked up these patches & submitted them as a v2,
alongside a patch trying to make sure that we do not clip the wings of
of XIP kernels by selecting RISCV_ALTERNATIVE?

Cheers,
Conor.

1 - https://lore.kernel.org/all/20230322120907.2968494-1-Jason@zx2c4.com/

--w3WkNcAkErpEV+UK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZByS9wAKCRB4tDGHoIJi
0u4lAQCLce8Tp/BNliLmC6X9fJ73+nTw94W73z6QfkW2sjyeIAD7BrHd/rbYXI7n
0OypFsU02G6GHp5jYNdq3VYJpNeUZQ8=
=LRUk
-----END PGP SIGNATURE-----

--w3WkNcAkErpEV+UK--


--===============2924154372003281677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2924154372003281677==--

