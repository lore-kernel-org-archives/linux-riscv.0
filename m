Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0027EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ5qXt4WTzyknxbJ+pnOmZkE41+zfXaZbTzaBFJHvw4=; b=0ABT+6S5zBj+twVfvGCGJld3ko
	u/I/yhQTYvLM8ViPK6Qgo4+LdoKUfrjz49ocqSRfOmnnU37nDC2HAm02c51/T+xYK0a01axWEENT5
	lgvCyILWUxk27SZnpW2TPZjpk4nuhoAl/BpPvdxCL1jtX6spzlhUypYdOxz376AMghVtq7YbZ0LnK
	lPsqIBaMXb4bteqH4itwvvzBpIVe2W0jwdFuDTbMc9uBZndx3knnxnl5vfgoznpDKFsLYbM5CDUN/
	vdqQkFUV/Eu3tU7r9PscHSTx4lgGx18imGOAi0ZJCmAsymHT1Rhng0dLluW0wwRrOYITy6eaPL42g
	5SEO8zMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdPN-000iKr-2B;
	Wed, 12 Jul 2023 17:13:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdPK-000iJp-29
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:13:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E2526182C;
	Wed, 12 Jul 2023 17:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D86C433C9;
	Wed, 12 Jul 2023 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689182021;
	bh=jdP2IW8lJtw9pFwYHyPzszyKj7YicGSFexthA8eVI8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCq+gW6Rf3HdNJxWgfdMtsN3rxUI9M9Vk8AuUjKM+UM75LMo9wpSk6dQ3sCYsSxTi
	 rLybzzo05eWfSQyzKpOhYoda7zL6Kp81MeAzCjTEfvaN8kHK3ekr/F2bw2t4FsQm5h
	 ZVkIv7x/4WJ+KdemhUwtzspamNZkSojiYxOb+zSm8p8OaLzAXOk4B6PkWqLpVRovrg
	 bGGwpz0oLi/EUoCTvwrhcrGu1HRhVo5u0DNdP+ilomkPVZVpY/QxLPgDi774QAQNtX
	 dR+eaENmtJxKC5f5ZvtTYvDgEzFllZYugtOBYzsGgcE5Vh6nJieDVdgE7l7alMJEtk
	 wSl79/g/puY3Q==
Date: Wed, 12 Jul 2023 18:13:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Don't include Zicsr or Zifencei in I from ACPI
Message-ID: <20230712-quickness-viscosity-ca1a15ccdfcb@spud>
References: <20230711-slideshow-plaza-4ceaa37f6c00@spud>
 <mhng-c30cb4e2-0574-4051-b220-01601d9579de@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-c30cb4e2-0574-4051-b220-01601d9579de@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_101342_768375_614BB3AF 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3411650942406846102=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3411650942406846102==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w8fytWipbkP9+/r7"
Content-Disposition: inline


--w8fytWipbkP9+/r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 10:05:39AM -0700, Palmer Dabbelt wrote:
> On Tue, 11 Jul 2023 15:52:56 PDT (-0700), Conor Dooley wrote:

> > Although my rationale was that if we get as far as here, then Zicsr and
> > Zifencei are going to be enabled anyway so there is no harm in setting
> > it for both. I probably should have been less of a cute hoor though.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I think there's no way to get here without the extensions, not 100% sure
> though.  I'm mainly trying to avoid going down the same rabbit hole of ISA
> string compatibility hacks in ACPI that we have for DT, though -- I'm sure
> we'll end up with a mess as soon as we release, but might as well catch as
> much as we can.

Seems reasonable to me chief :+1:

--w8fytWipbkP9+/r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7fQgAKCRB4tDGHoIJi
0s0ZAP4xI2LN1e5OQkEZILOkLMwdHq9XT+3WOm+81MvzQvJ3ggEAzjr1AF8+HLQ+
h3R+mbaDOxbl3KYOdnNuUx5B6rG+tAU=
=2zmV
-----END PGP SIGNATURE-----

--w8fytWipbkP9+/r7--


--===============3411650942406846102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3411650942406846102==--

