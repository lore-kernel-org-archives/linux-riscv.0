Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E6EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFwgVSNB06877ftxnb6TL9kPPufcBZbqZkpntkq6vOQ=; b=a6UdUX4JCTOofgfk/PHwUNIYQW
	cTQnwDHnoVcUfnESxIb7pKAjAHhuO0aDhgCGHPh7J9qdHp3ucRkR29W4PHuogG5OCoueBwqQOYtka
	JBar0nVcAFL9TbOvTS7Zre31SFxAEy1tu0kHdPc0DaetvooHwzRVnPvt5NpCkSOdqKLvNKTUymMmc
	+x8TRcaZMTyC6Sa6sae7VIM5S51rmFhdPi/N7E+X6qqv4FWo5JFPL9kUwxsickVwSuysskyEwrrQm
	dXXOJVMx+3cCoRtygQFvYMimCAkZS3zx8IzYwAkYahVQcqXFZE5ZGtzpjnmZUOP8PONIHiNlFYGnJ
	8OFPb8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEq0m-000yrX-1d;
	Thu, 29 Jun 2023 11:40:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEq0j-000yp3-2u
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 11:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688038830; x=1719574830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sAr1yW8ms9qKdVY87lLEN9RPbOLSC7vvBYXs60c7FDI=;
  b=lcwhRqb7mRQuKn3YZKYNA2NXSSq0yb2EWKRTiHRFSQWoI45o7lbCmlwy
   shc6pZLbWmuDp3UkwLiwhSA948LJBxcadQ73Z2iROy3bpv9Ko2DSSHXf0
   pBUq92jyNpnBxGODdqtrAh5v79O8HUHWiBaE1SJT0QOxmC7QBZHS6obzO
   xS7A6/AeLWXdPqI8cgt18FVohWS0c1Q1RrB074yZnKGTTK+sOWiJuOILW
   vjg+ucO++injXRJmJ7OhhN0DOg9QAU8K8yw/ZjtqNzi+kdEA/ke5xs+Z5
   y3MC1V+/jH1dnkNojxopnLm1OuxBOnDcWdH0e5RR3QsL36MyFbrYyqBx8
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="asc'?scan'208";a="218175038"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 04:40:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 04:40:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 04:40:20 -0700
Date: Thu, 29 Jun 2023 12:39:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable
 parsing "riscv,isa"
Message-ID: <20230629-deceit-macarena-2a744ac70148@wendy>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
 <20230629-resilient-grievance-d782163b09d6@wendy>
 <20230629-a80f112e6ed4158080867694@orel>
MIME-Version: 1.0
In-Reply-To: <20230629-a80f112e6ed4158080867694@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_044029_998630_7C0B3CDF 
X-CRM114-Status: GOOD (  31.15  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: multipart/mixed; boundary="===============8605531420383178494=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8605531420383178494==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sze7hK0PNyYVfnYw"
Content-Disposition: inline

--Sze7hK0PNyYVfnYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 11:31:33AM +0200, Andrew Jones wrote:
> On Thu, Jun 29, 2023 at 09:28:56AM +0100, Conor Dooley wrote:
> > As it says on the tin, provide a Kconfig option to disabling parsing the
> > "riscv,isa" devicetree property. Hide the option behind NONPORTABLE so
> > that only those willing to keep the pieces enable it, and make sure the
> > default kernel contains the fallback code.
> >=20
> > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/Kconfig             | 16 ++++++++++++++++
> >  arch/riscv/kernel/cpu.c        |  3 +++
> >  arch/riscv/kernel/cpufeature.c |  2 +-
> >  3 files changed, 20 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 1d39efe2b940..0e1909ac5947 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -291,6 +291,22 @@ config NONPORTABLE
> > =20
> >  	  If unsure, say N.
> > =20
> > +config NO_RISCV_ISA_FALLBACK
> > +	bool "Permit falling back to parsing riscv,isa for extension support"
> > +	depends on NONPORTABLE
> > +	help
> > +	  Parsing the "riscv,isa" devicetree property has been deprecated and
> > +	  replaced by a list of explicitly defined strings. For compatibility
> > +	  with existing platforms, the kernel will fall back to parsing the
> > +	  "riscv,isa" property if the replacements are not found.
> > +
> > +	  Selecting Y here will result in a kernel without this fallback, and
> > +	  will not work on platforms where the devicetree does not contain the
> > +	  replacement 	  properties of "riscv,isa-base" and
>                      ^ spacing issue

Huh, weird. Given the tab followed by spaces, it must have snuck in
during reflow of the text after some rewording.
Wonder how I missed it, given that...

> Should we also have a kernel command line option, 'isa_fallback', where
> without this config the command line option is not necessary to fallback,
> but, with this config, no fallback will be done unless 'isa_fallback' is
> provided?

I don't know, maybe I have the wrong end of the stick but it feels a bit
premature for something that may never not be hidden behind NONPORTABLE?
Perhaps that could be left for a point in time where the default value
of the symbol changes, or the dependency on NONPORTABLE is removed?

Cheers,
Conor.

--Sze7hK0PNyYVfnYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ1thwAKCRB4tDGHoIJi
0vzDAQDP9JlWlUGwMAoSKSxFjb6GGIDX8Mbn07UsWcWTcqMgAgD+JkZNTy1Vf7gU
LgyClwNQJHHQVT0Xj7BVnlyqzAn93Aw=
=bH7a
-----END PGP SIGNATURE-----

--Sze7hK0PNyYVfnYw--


--===============8605531420383178494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8605531420383178494==--

