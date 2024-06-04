Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357A1C25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqyioJS9cKS3WkiJD5+VivGJ9p4ciz0NKi2nNgRSBf4=; b=5Fa+xQeUHdR1g3SfIYCSsk16Bv
	HIHYmKRXsaThvljePKPxEh+nECSKJ/PZb8X4EqybUjaziDaR0OaUucdDk1RIXhSNRpw4HMnSu097I
	iFwXzIaWhBsqok7/dCxKR+S5XW0zFEc3u8i7+aUKAuim6CUOsg/bSOaqvTYlvHkzuF8NoM0sc5kJq
	8oR+Fc1IpUDHE2r5ylktJkMxG7SJqKSIzSJwIZEdspfluPtclQuDlAqCh1OP8EDmVyQNHKF/AFjWd
	gslYKIoEFTxbLR2DM61Sq6rn5yIud9zX9nMsFDy6kmNSZVeiSSM+7xYckEx9dfuxyxcgFah7bzuDG
	hZVEfvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPtm-00000001jxu-15o4;
	Tue, 04 Jun 2024 08:52:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPti-00000001jx2-3fOV;
	Tue, 04 Jun 2024 08:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 369AD6121A;
	Tue,  4 Jun 2024 08:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02151C2BBFC;
	Tue,  4 Jun 2024 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717491121;
	bh=X5VEKcXjsckL7bzsB4I2+5w7z1/yIThVP4y03Rift7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mh20iy/fPgoKsPFqkHOMkSvPPs3YobSnTzSECvBMzNm1M8s6vO83AlQC6ilY4EOTy
	 8sOXH1quEckXBhwBGWJj3cHU+7AJwHqGK3p8fjuVfk/jjnSzsPPyPutWZjpiLaoAyt
	 gCdMIRxqqGOm0zxE4aSYMab0Wodh06NeE+MsysKpcDwBDbIlcnfS/wkLiVdVzhzICG
	 4UjcQOTTx+aFwRJE1QaD8Cvt4dl3qLXOUDKmxsy7E1fx9TesQtzL9Q+NmezjMQehNS
	 0WMvz7jO6i8duGQNOX4hQOm+ZTVOc7wkWM1vHVgf8whVZyCCBz2ju8SWZpi8Hlqbp4
	 o2gZF74Dfgnvw==
Date: Tue, 4 Jun 2024 09:51:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: yunhui cui <cuiyunhui@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting
 preventive sfence.vma for new vmalloc mappings
Message-ID: <20240604-dazzling-envy-1dcf111eb2c5@spud>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com>
 <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_015203_065523_1DEF43EC 
X-CRM114-Status: GOOD (  19.03  )
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
Content-Type: multipart/mixed; boundary="===============0387549945429398803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0387549945429398803==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v+mLtQDAp6jKleQy"
Content-Disposition: inline


--v+mLtQDAp6jKleQy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 09:17:26AM +0200, Alexandre Ghiti wrote:
> On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosin=
c.com> wrote:
> > On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.=
com> wrote:
> > >
> > > As for the current status of the patch, there are two points that can
> > > be optimized:
> > > 1. Some chip hardware implementations may not cache TLB invalid
> > > entries, so it doesn't matter whether svvptc is available or not. Can
> > > we consider adding a CONFIG_RISCV_SVVPTC to control it?
>=20
> That would produce a non-portable kernel. But I'm not opposed to that
> at all, let me check how we handle other extensions. Maybe @Conor
> Dooley has some feedback here?

To be honest, not really sure what to give feedback on. Could you
elaborate on exactly what the option is going to do? Given the
portability concern, I guess you were proposing that the option would
remove the preventative fences, rather than your current patch that
removes them via an alternative? I don't think we have any extension
related options that work like that at the moment, and making that an
option will just mean that distros that look to cater for multiple
platforms won't be able to turn it on.

Thanks,
Conor.

--v+mLtQDAp6jKleQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl7VpwAKCRB4tDGHoIJi
0htmAP9lKpWaps7KNiXD+LLzGjaogNRPLVfDE+cLSH8OGRjL0gD/b1+iNEj7/u9+
OImeR7875AIcwdnxddUdj3oiiMB/6AA=
=s00j
-----END PGP SIGNATURE-----

--v+mLtQDAp6jKleQy--


--===============0387549945429398803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0387549945429398803==--

