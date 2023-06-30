Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DEEEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 06:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38XujyEVksIV3r7K3O45PskLWmtxj+p/DSJqfkAy5oA=; b=I3qO8B9sxqTQXMf3brSqRzR9OF
	fmBQBTW1XgxZ38/ruIP/Cr7pqSrFnHjPT1u2tAj9xzDkp/4MasZ+eAit42RKYrcXOztYPyyP3C13G
	qhBnt9OmHG8FwdNIsd4D0E/lLWX/g34cGuNtt+q6FSENPlbAMxbjJWJmwZS9v5NtWyLj3Lqac/Vy/
	Y1MgRKielzDAuBDpfC7HI0vrqnAPE0h75OrDLqNsUszNsx5GNyySzbO0SFCyIwvXZW7f3sWN2JAB8
	tySrIji1jgJp2iTIyPuuRxBbMT2jRlmrukW0QlKM3D3LpwMiTBUh7uIuRiXbIK5VfULncu6qOvvS0
	CnzOjrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF7iD-0030mb-0W;
	Fri, 30 Jun 2023 06:34:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF7iA-0030lb-0P
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 06:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688106869; x=1719642869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1WSIQqLvb2+/sUh6WEvq/CXC6xJpvh4r2DJzZW3eU28=;
  b=W28RyI9Rr3ghO9LIYJUrirmSKlpL6pZsBfKFAFNa8p1Ig7eeDKGdX45r
   ZQPUxPjTtC0NykI2/GH2v/Gq861liZ8nTXc5I3MQiozNLfnZFMbCkVQ9G
   G4i8TOgQP8raochXaYFh9nmMokGO5RTn7mhGj7nI6R0LyySqzYLRol9tX
   Ci6wy4ZKyJ3Ox9aRKEewUmSrYuwEywuXj0ugksMAO6P4BrMDQB+fkstAN
   m1w90ZJrNIFexEKwQyHrtEVOZcxEa5tQWG1FkNKE75EGGs49Ao8/xbp5V
   /N6fkRcbZqO9maRfdNkVMPhHMoOj3k0KAE/BnO3bs2zFn0BTNpKB8denY
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="asc'?scan'208";a="233041245"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 23:34:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 23:34:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 23:34:24 -0700
Date: Fri, 30 Jun 2023 07:33:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
Subject: Re: [PATCH] riscv: BUG_ON() for no cpu nodes in setup_smp
Message-ID: <20230630-tightrope-clatter-6eed9875a76f@wendy>
References: <20230629105839.1160895-1-suagrfillet@gmail.com>
 <20230629-maverick-kelp-17327f04482a@wendy>
 <0787532c-4520-6d01-c50c-63df207f570c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0787532c-4520-6d01-c50c-63df207f570c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_233430_284748_B26A864C 
X-CRM114-Status: GOOD (  26.36  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, evan@rivosinc.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Type: multipart/mixed; boundary="===============6530476980739558828=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6530476980739558828==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b/dkXq258KlMHHb5"
Content-Disposition: inline

--b/dkXq258KlMHHb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Jun 30, 2023 at 11:02:18AM +0800, Song Shuai wrote:
> =E5=9C=A8 2023/6/29 20:33, Conor Dooley =E5=86=99=E9=81=93:
> > On Thu, Jun 29, 2023 at 06:58:39PM +0800, Song Shuai wrote:
> > > When booting with ACPI tables, the tiny devictree created by
> > > EFI Stub doesn't provide cpu nodes.
> >=20
>=20
> "When only the ACPI tables are passed to kernel, the tiny..."
> That seems more accurate. We can use "acpi=3D" kernel
> parameter to manually enable/disable ACPI.
>=20
> > What are the conditions that are required to reproduce this issue?
> > When booting with ACPI, why is acpi_disabled true?
> > In my naivety, that seems like a bigger problem to address. >
>=20
> Actually, I appended the "acpi=3Doff" to kernel cmdline for testing the "=
off"
> option. That would set acpi_disabled as true.

Yeah, I figured it was intentionally misconfiguration of your kernel,
given that you've tested other niche conditions and reported bugs, just
was not clear from your commit message whether this was a real bugTM
that should be fixed, or some sort of "you booted a kernel that can't be
used on this system".

> > > That's unclear, so bug for no cpu nodes before
> > > of_parse_and_init_cpus().
> >=20
> > What is unclear? That the reason for the BUG() was that there were no
> > cpu nodes, since it could also be that there were CPU nodes but they
> > were disabled etc?
>=20
> The BUG() in of_parse_and_init_cpus() indicates there was no boot cpu fou=
nd
> in the devicetree , not there were no cpu nodes in the devices.
> That's the "unclear" I mean.

Yup, please put that in the commit message so that people don't have to
figure out your intent ;)

> > Or, better yet, move the whole thing into of_parse_and_init_cpus() in
> > the first place? You could drop most of the comment in the process,
> > since I think the details of how you hit this problem would likely not
> > be helpful to anyone that hit it under different conditions.

> ok, I'll apply these comments if you're ok with my replies.

Yup, thanks!

--b/dkXq258KlMHHb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ53TwAKCRB4tDGHoIJi
0iT0AQDEE78wXiDe+YaX++QhWnHTqv8BlF6Rj4+iQGYrk70/fQD/R3SVLgqmER+C
5ugD+ASSeOvI1+0WWT5ZjkQppaybagQ=
=LWeE
-----END PGP SIGNATURE-----

--b/dkXq258KlMHHb5--


--===============6530476980739558828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6530476980739558828==--

