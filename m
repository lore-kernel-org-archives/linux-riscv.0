Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E209C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObN31XBZE7T/S77/8qCD9xbPeH9up/FiDUJdn7hpOv8=; b=lJjvOvdUzqkLXVFOdHzyvEvQgp
	eyHyKVfsRzirB6WwR/GXcYaGH6qrGAHBSXpSZCR+VtY+Q/3dZvR8kQhCg9tLBIoGQT3iH9xUEv9jb
	zJb2bhn7RD8qAW8fNKRcVxmm6p1dIT/URaaVufASs+Q1MwBxPVhlluBMvRNlVkg0A6iDF52FLM08q
	2cO1qwXZEOBhfLudRcUlGmuE5eN8sPNjaUm1+50CXrIlIroqNwGKm59NdBpM+rzAfrxu75pU3fIOw
	uegI6yeBwTv01KXM4CjTLHn6mDTfSv7+y4RF5a33dYeSlzQ4UokLIBAXuzDBdTHmVQZFXMnafSpV0
	H3NfM+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q576S-007Jap-0g;
	Fri, 02 Jun 2023 15:54:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q576P-007JaG-1L
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 15:54:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C420E6519D;
	Fri,  2 Jun 2023 15:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB36C433D2;
	Fri,  2 Jun 2023 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685721248;
	bh=Es/w85zqCOLTBKKU6u/SunDJIniDYXSgH1w4nPLzpGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ob6M93AWC2OlTZCdsavfDIW2JWpHDT0zq0GaEOLoivGFrnhZbLLaf14R8E0A+g6YK
	 KS2XchQOU/5dK3q2eSG6vke0C7vF+xhe4mBILN6U0TdQWktd19I2o3iuqZromS5wax
	 XduhNQF2M65JsgWaG15gNbmBsuGNxLJ+c2Ehw3QJ1rQokB25Lvp4CP8m5a0yJ5umBS
	 1661iykNwaPr/GRBAciaU610TqajTv0If1D5Tbx8NJx9/5uQJY/nTsVAuhcQQX2ZU2
	 dGQaoPEHLyxMi3D3fwVTsXI5dbtlmuhgOrnfabEQT6bsQSjppJ9vMRWpGggwpNWup0
	 4rG8SptpUyaZA==
Date: Fri, 2 Jun 2023 16:54:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-doc@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev,
	Bjorn Topel <bjorn@rivosinc.com>,
	platform-driver-x86@vger.kernel.org,
	linux-riscv@lists.infradead.org, qianweili@huawei.com,
	herbert@gondor.apana.org.au, corbet@lwn.net,
	Marc Zyngier <maz@kernel.org>, daniel.lezcano@linaro.org,
	linux-acpi@vger.kernel.org, lenb@kernel.org, aou@eecs.berkeley.edu,
	markgross@kernel.org, hdegoede@redhat.com,
	Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
	nathan@kernel.org, ndesaulniers@google.com,
	linux-kernel@vger.kernel.org, wangzhou1@hisilicon.com,
	linux-crypto@vger.kernel.org, rafael@kernel.org,
	luzmaximilian@gmail.com, davem@davemloft.net
Subject: Re: (subset) [PATCH V6 00/21] Add basic ACPI support for RISC-V
Message-ID: <20230602-aerosol-granddad-f091b94e74e1@spud>
References: <168571787727.17224.6663458864222960682.b4-ty@rivosinc.com>
 <mhng-4fad860f-b5ff-4dc1-968e-219be1983acd@palmer-ri-x1c9>
 <20230602-reformist-jet-9fd642b971d2@spud>
MIME-Version: 1.0
In-Reply-To: <20230602-reformist-jet-9fd642b971d2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_085409_493484_88750251 
X-CRM114-Status: GOOD (  18.14  )
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
Content-Type: multipart/mixed; boundary="===============7721139690013899918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7721139690013899918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rvz4WVjJsR4hWDUh"
Content-Disposition: inline


--Rvz4WVjJsR4hWDUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 04:50:49PM +0100, Conor Dooley wrote:
> On Fri, Jun 02, 2023 at 08:11:04AM -0700, Palmer Dabbelt wrote:
> > On Fri, 02 Jun 2023 07:57:57 PDT (-0700), Palmer Dabbelt wrote:
>=20
> > I also don't yet have any testing for the ACPI stuff, but hopefully I'l=
l get
> > around to adding some.  We should probably add it to the patchwwork CI =
as
> > well.
>=20
> Yeah, just like DT testing should be added too! I am planning on doing
> some work on that front next week, hopefully I make good on my word...
>=20
> Cheers,
> Conor.
>=20
> Also, having ACPI support in means we now need
> https://lore.kernel.org/all/tencent_B30EED51C7235CA1988890E5C658BE35C107@=
qq.com/
> to be compliant with the ECR. It doesn't apply as-is, so I will add a
> Fixes tag & rebase.

Nevermind, doesn't need a rebase - it applies with `b4 am -3` ;)

Cheers,
Conor.

--Rvz4WVjJsR4hWDUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHoQmAAKCRB4tDGHoIJi
0t7eAQCPio6yrHjEb84AkptPs4YobcI7FS9rxh1Jaq6uUwcvmAD+NcquJRl67h8E
oLlMgcF9wP0MM93Up+Cjy+GEh6eFkAg=
=GFdg
-----END PGP SIGNATURE-----

--Rvz4WVjJsR4hWDUh--


--===============7721139690013899918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7721139690013899918==--

