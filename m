Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608C0C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzUClyBfMgisn/cvFeK6sDvemv64q84sv06s7jVhi+E=; b=kpE9ujAC+BS5JpKOWF4x4gL4sW
	WQgesSxYRogapXcHjqxcZZdJSsZ/d2Bko8EbV/QWjGJH+qk4ba/nNYAVDFi7zzHMFbuCMXXSFgZAs
	eiciBmzAGwpOcpC4i5hu05PIwDJiS7hVnrTYegb+1HZhO98NdxRbRJcxVxAGHrFXeTLllMRFzBbhz
	kUrlnRelI7Una7hwsAyWSWda+0ePcgoQBYfx2JcVO4jX/ODmhv3T/lJcszK1lEvqhR6Gf/NHEt5mH
	feSDCyIcojhilVNHThPU9iuphZ4/RjeDYAErAvkxRTge1oGmwwanH/3CYbBFGX3KGdKbpcKQfGqWp
	hn0RnzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thskh-00000004Ppw-1Tmw;
	Tue, 11 Feb 2025 16:04:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsjP-00000004Pab-09dW
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 16:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5F9F5C2DAE;
	Tue, 11 Feb 2025 16:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2475CC4CEDD;
	Tue, 11 Feb 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289805;
	bh=kxsQpoTjlLuo+6/EAnaIsucfdhVApFWZkHMOYayispo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsboMWEKxcBqWSFSXuyBDASztly9n6g9HZFzVedkONqJ/LTS7KtxduERL6VZCsaU8
	 xWYLjH2gjbSfZSCjAG44Ew9qAbrO8br6kLkRDuqylqTDju/RC2hpVfgtMdhrIYaoZr
	 14HTmal0YOxMazPUM9bCN+GJkg9Qpfdp6sqS69Ln2TRY6VeQA8pXpbWmK6XQOJqGud
	 YZiXqN/r2VhYgE6qtnXCoKXTjG3RbTL5xlBOcfKD7p2ztXOabrtcYtM+eLU45iemQI
	 ZBQh/VV8q+aw8IcIEl68Xhz/cVEgpprOS2DdhIzfrOMvhGU7UJTuDe6ajVIG5EFT/v
	 JyzYELfDmLllw==
Date: Tue, 11 Feb 2025 16:03:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
Message-ID: <20250211-nature-kilt-9882e53e5a3f@spud>
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
 <20250207-promenade-hazily-d7900cbc127e@spud>
 <20250207223705-GYA7567@gentoo>
MIME-Version: 1.0
In-Reply-To: <20250207223705-GYA7567@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080327_115383_3455EA08 
X-CRM114-Status: GOOD (  14.08  )
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
Content-Type: multipart/mixed; boundary="===============1631115296723940691=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1631115296723940691==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h4BMHotDS+6K3/CI"
Content-Disposition: inline


--h4BMHotDS+6K3/CI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 10:37:05PM +0000, Yixun Lan wrote:
> On 16:49 Fri 07 Feb     , Conor Dooley wrote:
> > On Fri, Feb 07, 2025 at 08:11:42PM +0800, Yixun Lan wrote:
> > > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/space=
mit/Kconfig
> > > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86=
bc555b2b90643adbdea 100644
> > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> > >  	tristate "SpacemiT K1 SoC Pinctrl driver"
> > >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >  	depends on OF
> > > +	default ARCH_SPACEMIT
> >=20
> > This is effectively just "default y", since ARCH_SPACEMIT is a
> > dependency.
> >=20
> right, this is the plan, it make sense to bundle this config to ARCH_SPAC=
EMIT

I don't think I was clear, I was trying to say that you should do
s/ARCH_SPACEMIT/y/ on this line.

--h4BMHotDS+6K3/CI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t0yQAKCRB4tDGHoIJi
0ttiAQDhOzm3TQQpYRWDC95izVfWpwHd1wIcfyQIYKv5Il1fiwD/aVhzIBicKSq1
x84qPJr6FO+I8bqpCddzB7pysdOBHAc=
=8t5s
-----END PGP SIGNATURE-----

--h4BMHotDS+6K3/CI--


--===============1631115296723940691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1631115296723940691==--

