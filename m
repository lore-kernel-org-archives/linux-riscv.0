Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A51C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 16:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSF8J3b8DODFRUz8kItD1pliYXcDeXGbr8o5zMYFnfI=; b=vl5Qu3lmprpbHpcc5iGk2gC4BV
	d8cA56krEfYg1E97rYlxx9HtZ00/Q2jDdInFiOeHfWDLq085T1bN67wh821gVHaDWARUDrxy4yJ8E
	bpjt24ZxgJ8Whl/KZYRkLgLLJCV7wSqLzxSle7mOzZouYOCfFKj8NBs1NebAhGmfrR5fHofHP2DZ+
	IbnJiAmFL38KOpeyj9GP3RpPxtnnvF6nE3wkHA6k9xO9H9TKDiDbm0LPjhInkhtppM7L1DMW5X0zK
	YCJK6QbWq93yL4Gmvg172S+qxa9dEJAwy5j1hHFeoiOxlPlVipZGQsacqhufUsnPCnNmJz0kfBJlc
	RjRUTHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXQ8-00000003CtD-08WC;
	Tue, 04 Jun 2024 16:54:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXQ3-00000003Crt-3NRL
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 16:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3ACC7CE0FD1;
	Tue,  4 Jun 2024 16:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D85BC2BBFC;
	Tue,  4 Jun 2024 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717520029;
	bh=3y3SJEQnabNC/ZTOS/h9D5v1FyvFsvGwCvIleX2IRlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0gZLT/SrbxinE5aaiPs1SfqHUfMda+zbnhDDYSVPrNZ4M0MZlKrV/z3k+CxJimpL
	 0KfQFAd9R3KNNw6P/82BDLEju2yrNKiH/kjFZBDr8TzJKrOfnFo8IxzwF6qWDzGzAa
	 gTZOnG3n6vezz58qmsQsBjHDpKOBA3HBfV5V+0E1C0HZ4dP8gtziI9YK+hqfSoTitm
	 3Pe9NWYCHmflyJqtMODczgp6rb6Q+nKX5N+RnsbucFMgR9IjOsDm7vXXZM/zWG6A1N
	 kBEKmxXQRuEQukrZ7KJTTs95LdPfj6MMpq/mZTaFFrhtffVjtlssquhEOp6g4+BOIK
	 RDF+NZEh4yMUg==
Date: Tue, 4 Jun 2024 17:53:44 +0100
From: Conor Dooley <conor@kernel.org>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
Message-ID: <20240604-defame-common-b0e056562303@spud>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
 <20240510-unfounded-syrup-d1263d57d05a@spud>
 <NTZPR01MB0956D48361098E8AA4B3930A9FE02@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240511-unbiased-dainty-ccb5ece9b1b9@spud>
 <NTZPR01MB0956A7393097129D3CD048EB9FE32@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240514-congenial-smother-1e4b0fc6a5df@spud>
 <NTZPR01MB0956CF1AA9EA5A20A174FD8A9FEC2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240515-reorder-even-8b9eebd91b45@spud>
 <CAEn-LTrKn079kbs2Wx5AuTs5+_sB4zaJsTf=MKn_nZZL04E5gA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEn-LTrKn079kbs2Wx5AuTs5+_sB4zaJsTf=MKn_nZZL04E5gA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_095356_228777_E908BE58 
X-CRM114-Status: GOOD (  28.93  )
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
Content-Type: multipart/mixed; boundary="===============6997048962119380056=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6997048962119380056==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R3Sbf+JjNJ+j7/EU"
Content-Disposition: inline


--R3Sbf+JjNJ+j7/EU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 12:45:48PM +0300, David Abdurachmanov wrote:
> On Wed, May 15, 2024 at 7:31=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, May 15, 2024 at 02:23:47AM +0000, Xingyu Wu wrote:
> > > On 15/05/2024 02:08, Conor Dooley wrote:
> >
> > > > There's a push in U-Boot to move devicestrees to use "OF_UPSTREAM",=
 which
> > > > means importing devicetrees directly from Linux and using them in U=
-Boot. I
> > > > don't really want to merge a patch that would present U-Boot with a=
 problem if
> > > > the VisionFive 2 moved to that model there.
> >
> > > Would it be better  if I  change the rates of PLL0 and CPU core in th=
e driver not dts,
> > > and avoid the dts of Linux and U-Boot being different?
> >
> > I'd definitely prefer if we don't include stuff in the kernel tree that
> > would cause problems for U-Boot if imported there, yeah.
> >
>=20
> What is the current state of this patchset?

v6: https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivete=
ch.com/

Guess it didn't go to the riscv ml because the dts patch was dropped.

> I noticed this patchset on the U-Boot side from Hal Feng:
> [PATCH v1 0/4] Sync StarFive JH7110 clock and reset dt-bindings with Linux
>=20
> It seems to indicate that there is WIP for OF_UPSTREAM support.

And as a commenter on that patchset you reference said, they should
actually use OF_UPSTREAM directly rather than manual syncs like that
series. I'm not sure how the U-Boot folks want to address that w.r.t.
bisection though, in cases like this where the defines do not have
identical names.

Thanks,
Conor.


--R3Sbf+JjNJ+j7/EU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl9GmAAKCRB4tDGHoIJi
0k+GAP96lINbMq1W/A4BwbQPVG0viC6vHyo3x/Ar2htPOhhfswD/SrQ1lr3v7H6N
VcjSz+tSQvfbcga97HxKDA4tgz3kQg0=
=58JS
-----END PGP SIGNATURE-----

--R3Sbf+JjNJ+j7/EU--


--===============6997048962119380056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6997048962119380056==--

