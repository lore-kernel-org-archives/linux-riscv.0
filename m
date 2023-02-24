Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C67C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ns8I5Ln9XyDQ9CGBw1CQwQXNooK+KsUAeViculDfjM=; b=ywmwH9EDetG2F1I7O/DcwQB3pJ
	kVoztRIjkUN6M3r+qytznQ9tn0jbDb/Yd9wTeymz4WuEn4UnKvcWhL1F7SZ1MMahLeScPvS23BvB7
	2ix7aT5t6VBcvkQRgH5xhRnvuOmn79LqgnNpHkcScnCWEmB7DHf367uLBc5rpkvipwFHBgYdMbV99
	8BpCMlWehJjBIQMn3KJUgbU1Av3DCIXt/scFaDUWsIO7PZ94WXhEPdQrHJKStaDykNmgiMVs9GNri
	06mq54YJllMCohSsTwB8cO9h4vk5EbjFxgiRGfM36l3Hsb5JugEWHmmr2wRvHFbpkRosmtEasx6oi
	qeB5ajtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbQl-003Cvm-AR; Fri, 24 Feb 2023 17:00:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbQi-003Cun-7c
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:00:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C2A1CCE23F3;
	Fri, 24 Feb 2023 17:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB098C433D2;
	Fri, 24 Feb 2023 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677258013;
	bh=gW/G9XqMxmjk7RG//AkqL5Zd/Wmt8/O+cgdvVZcoB38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ML47rDkd+91GwS2zABfAuenxg7v8dnYd2N+ZISXlzCTzk3Ho+ZFV3dgGB6ahetVnu
	 Ga69sV746c7KRkDg88IifQYynXSQjkWZp+gIPzUPnIqRD+Yf4D3bf2t/LZaB2AVDQC
	 EEKca/aSHwPwpnJomPQvN3iMhv7POYVJhhjD9tiNZ97LuDVYcJ2U47fHKwqO54h5yG
	 DkiBK0XOaUDhmQUCuUTKAGmT1q3je+3++zpswaYqjw0Ukt744Rd/CVu63FyvLMH4jo
	 AARmUkEjrbTjxyz9bTeJt8qhrZDwfLhbIgB+WdRQxcV2WZQj6MLnQpFA9CclLm/ijL
	 dsWsFpLB2lQDQ==
Date: Fri, 24 Feb 2023 17:00:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to
 Kconfig
Message-ID: <Y/jtGRrBfKxO6s0c@spud>
References: <20230223220546.52879-1-conor@kernel.org>
 <20230223220546.52879-2-conor@kernel.org>
 <Y/jnyJZNZC1X6IO8@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <Y/jnyJZNZC1X6IO8@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090020_467852_1BAFE28F 
X-CRM114-Status: GOOD (  19.44  )
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
Content-Type: multipart/mixed; boundary="===============7263717672436280611=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7263717672436280611==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e6Y/AvbWBMFP9Gx2"
Content-Disposition: inline


--e6Y/AvbWBMFP9Gx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
> On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:

> > ---
> >  arch/riscv/Kconfig  | 10 ++++++++++
> >  arch/riscv/Makefile |  5 +----
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index cebf0c5f8824..4eb0ef8314b3 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -288,6 +288,16 @@ config ARCH_RV64I
> > =20
> >  endchoice
> > =20
> > +config TOOLCHAIN_NEEDS_SPEC_20191213
>=20
> This symbol's name is a little confusing to me, how does the toolchain
> need spec version 20191213. Maybe 'SPEC_20191213' should be something
> like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be something
> like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed but I
> think most Kconfig symbols should be self describing.

Yah I can do that. I actually had this as the DEFAULT_SPEC variant
before and changed it - I'll switch it to the EXPLICIT one.
Thanks for taking a look Nathan :)

Conor.

--e6Y/AvbWBMFP9Gx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/jtFgAKCRB4tDGHoIJi
0q00APwKPs2CYWlCVoaTE6znMU7L2RaGmGaEc0yJ5DnM3NwLygEA60UYgLmVCd/w
FvPGizVLIEObLTuG5YKMddsgylgb1AY=
=xi0j
-----END PGP SIGNATURE-----

--e6Y/AvbWBMFP9Gx2--


--===============7263717672436280611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7263717672436280611==--

