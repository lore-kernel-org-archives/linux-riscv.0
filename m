Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4BDEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 19:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKbN1jTIEXtJb9b93+lXuqYmuQ3zBZKbuxUcu6FJDj8=; b=SzuWgt0pxwl39tlyV9+/n70XWE
	M/xQm1qtyBl+DmE3Q11nRx1RZWjtREw0j3zb7e1A2uCTluCcTOZ9AMIyK1a5mpTe+zagL2Pbdu5GQ
	RrfcWU0hveNcILfaKu0VkWPN8vDLN1GzbysItty9xLo3boYD6BHihruZUuPM0lVrHrSbbQm1CXHf8
	EgJytBSbPqF5ppaONJsSLvhfHFp+KZCdfislH7eQR6b18oWlffGH2nZqJTZfeCrS4Eq8ZZ0vmEXS6
	B33nefyfjSTQNsCUJir7T/fIpWeivi+BLq8yueIkffxWSvrbOtmXEYIw1d8AUOApKRLwnF4ELWG2z
	by4ZS2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEECq-00Dvaq-18;
	Tue, 27 Jun 2023 19:18:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEECo-00Dva9-0W
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 19:18:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2480611DC;
	Tue, 27 Jun 2023 19:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25C5C433C8;
	Tue, 27 Jun 2023 19:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687893504;
	bh=uwzZUjZSCfj7+frIlsvFzZuiym3U7S7pNMgIXSdtB4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p89b6LX3hLunHjDY3X4M9F1r/ot+U5G1vIelARlufBDGrahv2EeW1K5E8jShoR0AL
	 Eez//ApvuP6lQfl3ln4QNkBjQhNSDVWrwdof9FiWWZvyDQcakaDKVJA+UVcHyjlMXY
	 YMW6xbMP08W82OGPQjLBSh2KQWfQyOIqfSxBig3nipuLY596mkuHKAGwISc2hYjVLA
	 OdnOnfHZa9J1YBGX5z22QUlqdD+zT23S4rAaeaVq+CrmkWCa4r8SXrJfe0Mph63Mqf
	 2E1BB7jDdM9AHEVw4jm8CHIdFxwaMHSbXyR2hHHRG8tv/IuAhKiagovj0DGDn+WIqA
	 DdlKQQ7zq/mew==
Date: Tue, 27 Jun 2023 20:18:18 +0100
From: Conor Dooley <conor@kernel.org>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <20230627-projector-rockband-cac4bd138338@spud>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
 <20230627-debating-twelve-da2c1ed60948@spud>
 <ZJsyntnQ/FDXgNPk@Sun>
MIME-Version: 1.0
In-Reply-To: <ZJsyntnQ/FDXgNPk@Sun>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_121826_239304_6A292D7B 
X-CRM114-Status: GOOD (  16.95  )
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
Content-Type: multipart/mixed; boundary="===============8422015400736673985=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8422015400736673985==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3UzS4ywJFe4Sz/og"
Content-Disposition: inline


--3UzS4ywJFe4Sz/og
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 03:03:58AM +0800, Hongren (Zenithal) Zheng wrote:
> On Tue, Jun 27, 2023 at 07:48:15PM +0100, Conor Dooley wrote:
> > On Tue, Jun 27, 2023 at 11:14:30AM -0700, Evan Green wrote:
> > > On Tue, Jun 27, 2023 at 7:38=E2=80=AFAM Samuel Ortiz <sameo@rivosinc.=
com> wrote:
> > > >
> > > > From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
> > > >
> > > > This patch parses Zb/Zk related string from DT and
> >=20
> > %s/This patch//
> >=20
> > > > output them in cpuinfo
> > > >
> > > > One thing worth noting is that if DT provides zk,
> > > > all zbkb, zbkc, zbkx and zkn, zkr, zkt would be enabled.
> >=20
> > Please explain why this is okay.
>=20
> From riscv scalar crypto spec, zk is a shorthand
> for zkn, zkr and zkt and zkn also includes zbkb, zbkc
> and zbkx.

Hmm, seems you misunderstood, sorry about that.
What I was looking for is an explanation of this in the commit message.

Hope that helps,
Conor.

--3UzS4ywJFe4Sz/og
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJs1+gAKCRB4tDGHoIJi
0sEhAP4gjuEYPLur3H8NK87xQ6PWeP9nG9Wm91xRu6Yk/PC/VAEA42C+FQ5GUpKv
Bf/0pPRGWuoqFLtpo0WEjUWORA7hKAk=
=ZW5q
-----END PGP SIGNATURE-----

--3UzS4ywJFe4Sz/og--


--===============8422015400736673985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8422015400736673985==--

