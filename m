Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DCC25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 20:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XqW6MZWMnCkFaamBZR10wCDeFHFvPqFNZoM8t03nyw=; b=C3sb1Em9aaSzNq8+nzZ0e5NkPM
	ZVclUX8CuQVex6dtPsTA1R/DoZlHZCFaxwJQ3dNo6MP59y+Tx0ehFgOHk2axlu6WiBBvfaUxGY1lD
	IivWvRBVc+2SaynCUWByUedhGRCePg9qP1FjQQFF8tWd1pBFyqe90kLWgOxE8LbbQnYB3vEvOV3/W
	8trkKYzNkweBrVC7XpfE1ZPr98H8csGEU3PDtZ7QIEoW6ENxEZXQO4XoT/VpWVsY9koDTbR9aBsMb
	Y1DGbjbxVA5h9+zKXY2/xZ8e/iJg4z1Y1nP4/Qw98lJWj6k68lzLFyUHzUo93NV+csQdBhsG/WQTd
	m35qu85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEabe-00000003hao-1iDG;
	Tue, 04 Jun 2024 20:18:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEaba-00000003hZf-3sOA;
	Tue, 04 Jun 2024 20:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C013614E2;
	Tue,  4 Jun 2024 20:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DD4C2BBFC;
	Tue,  4 Jun 2024 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717532280;
	bh=hzO5VxyNboH0UxSA8oeS3DN/P0lxl1+qVDrF4lH35fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YoZ0l1zC3xE7XjFm6AyGqJGICJLDpBXsff7pMRSlEudgDhIe2FAqUIlZOHMrcDAr3
	 JFMzUTUWby1raWnTIk9qkVwqwtiz6/Z6smnBNReiuYlHT8eUSl0Z+Aqd5Gb2Mvh34S
	 wAKOpf6ZGKyFw6YsjI3fHnZC+rpMWQawCWhKqPCdn6EmlNin9YkQkOohgJvSm0Jfdq
	 EA1DmGUVMobN6eu67mYDQTP4RfwK6SHx4st2n6F8wStZwJn0RmP6KpiZmkZX3cYHhC
	 s3AwyJtNeSyuaNXCJfi8TiyYPNzftuerF7VkPZyKLtWbcx/eMh95QAsbx5XROxuYBO
	 Zsx5ZvhbZVrFA==
Date: Tue, 4 Jun 2024 21:17:54 +0100
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
Message-ID: <20240604-finalist-screen-c9f35b5cfc56@spud>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com>
 <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
 <20240604-dazzling-envy-1dcf111eb2c5@spud>
 <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_131803_067190_5A2D788A 
X-CRM114-Status: GOOD (  23.83  )
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
Content-Type: multipart/mixed; boundary="===============7409852022679168118=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7409852022679168118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwD0Txngxq5MBoPY"
Content-Disposition: inline


--rwD0Txngxq5MBoPY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 01:44:15PM +0200, Alexandre Ghiti wrote:
> On Tue, Jun 4, 2024 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Jun 04, 2024 at 09:17:26AM +0200, Alexandre Ghiti wrote:
> > > On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@riv=
osinc.com> wrote:
> > > > On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@byteda=
nce.com> wrote:
> > > > >
> > > > > As for the current status of the patch, there are two points that=
 can
> > > > > be optimized:
> > > > > 1. Some chip hardware implementations may not cache TLB invalid
> > > > > entries, so it doesn't matter whether svvptc is available or not.=
 Can
> > > > > we consider adding a CONFIG_RISCV_SVVPTC to control it?
> > >
> > > That would produce a non-portable kernel. But I'm not opposed to that
> > > at all, let me check how we handle other extensions. Maybe @Conor
> > > Dooley has some feedback here?
> >
> > To be honest, not really sure what to give feedback on. Could you
> > elaborate on exactly what the option is going to do? Given the
> > portability concern, I guess you were proposing that the option would
> > remove the preventative fences, rather than your current patch that
> > removes them via an alternative?
>=20
> No no, I won't do that, we need a generic kernel for distros so that's
> not even a question. What Yunhui was asking about (to me) is: can we
> introduce a Kconfig option to always remove the preventive fences,
> bypassing the use of alternatives altogether?
>=20
> To me, it won't make a difference in terms of performance. But if we
> already offer such a possibility for other extensions, well I'll do
> it. Otherwise, the question is: should we start doing that?

We don't do that for other extensions yet, because currently all the
extensions we have options for are additive. There's like 3 alternative
patchsites, and they are all just one nop? I don't see the point of
having a Kconfig knob for that.

--rwD0Txngxq5MBoPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl92cgAKCRB4tDGHoIJi
0jejAP4q4iC1BCvHT6xTV9Sna0UEFmTHPbvuyI/Dr8hN0BftCQEA2HLRmlNNqiPJ
abULfaYTpyjXRctzj8H5FL5kCUjY6gs=
=929z
-----END PGP SIGNATURE-----

--rwD0Txngxq5MBoPY--


--===============7409852022679168118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7409852022679168118==--

