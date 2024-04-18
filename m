Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB211C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFK/7qlMWx9/4Xz8UB16lRxEqQ17/PVPudiSAZ59Pfc=; b=PsNzOaEatIw6qulmZDo0N+snFN
	wnXT4KaFq4EpOpY7cvvqL+9HOiSxv441+53YNB+DPo5NX2craCmf8POoxv7TdEx1kWjbueY/yqag2
	0gC7WbmWzY9T697CzjCJ+f2aK7aUiR/y3E4MGSBHZXHyMhIXpjy6YjqOwSoKPrq3iYXzWnLcVcYUW
	fLYSR894f3eAhQraRU0GzqP8mJkhKrUR7UoV+yC6b2sgQs1rxWiPcML3ge38h5ndwAISLtth2+iPE
	56pRg4OhBJmJ5UpJM6DaWdslD0L+P4aS2NcfoE8stP7pezXh0EvL6c6+IEjqabFvIR2vnBbtYyE+A
	MlxZd8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxZxG-00000003oJ1-0RlY;
	Thu, 18 Apr 2024 22:10:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxZxD-00000003oIe-2mE7
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 22:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D59EF615FA;
	Thu, 18 Apr 2024 22:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41EFC113CE;
	Thu, 18 Apr 2024 22:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713478202;
	bh=YSbQDzB7oVXA+6U+Fn5mPYeVPvR2ma9l+pzDAVPKnH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPjc9z4YNOQeIrinhriBSIfB9agDKGdqBf+Mo65aoKZs20wTvEGuAzfXAMzT4qbOw
	 PpFj7+FOOPeV8O075FI+6u2cFhnvRlp/idzIma2CRSPbBNQgwz4Zj6XyYUJQTY/ApF
	 WL7bfhXgnjnGGTE/zcxtIcpmu4l6dS1N9EZFWonf8keq8h+H7OO/ZXa6ZD4LLvfvr9
	 7WsE1+ksJ0GSU7y9YBggF4qHJwS+9hNov6LVFYlDyS2xIYNhLoHvAxFQnyngVHxnRC
	 h1j+xChfAZaO0hu12ITi8TXS1VvdnT4WR9W1SCUV2GFCaY+6PYBDgg4LI9/YBM+AuR
	 l3gfmUXux9rMQ==
Date: Thu, 18 Apr 2024 23:09:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
	guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, lihangjing@bytedance.com,
	dengliang.1214@bytedance.com, xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com
Subject: Re: [RFC 1/2] riscv: process: Introduce idle thread using Zawrs
 extension
Message-ID: <20240418-smilingly-overplant-c5f3a698fdc2@spud>
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <20240418114942.52770-2-luxu.kernel@bytedance.com>
 <20240418-dove-deferral-2b01100e13ca@spud>
 <20240418-d9f305770dc71c2687a6e84b@orel>
 <33de5d8f-5ccb-4dd0-9915-720e6f800560@sifive.com>
MIME-Version: 1.0
In-Reply-To: <33de5d8f-5ccb-4dd0-9915-720e6f800560@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151003_841550_23C8C4E1 
X-CRM114-Status: GOOD (  32.22  )
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
Content-Type: multipart/mixed; boundary="===============5783912939621718085=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5783912939621718085==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ugf9QOJEd3IvGO73"
Content-Disposition: inline


--Ugf9QOJEd3IvGO73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 05:00:42PM -0500, Samuel Holland wrote:
> Hi Drew,
>=20
> On 2024-04-18 2:10 PM, Andrew Jones wrote:
> > On Thu, Apr 18, 2024 at 04:05:55PM +0100, Conor Dooley wrote:
> >> + Drew,
> >>
> >> On Thu, Apr 18, 2024 at 07:49:41PM +0800, Xu Lu wrote:
> >>> The Zawrs extension introduces a new instruction WRS.NTO, which will
> >>> register a reservation set and causes the hart to temporarily stall
> >>> execution in a low-power state until a store occurs to the reservation
> >>> set or an interrupt is observed.
> >>>
> >>> This commit implements new version of idle thread for RISC-V via Zawrs
> >>> extension.
> >>>
> >>> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> >>> Reviewed-by: Hangjing Li <lihangjing@bytedance.com>
> >>> Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
> >>> Reviewed-by: Wen Chai <chaiwen.cc@bytedance.com>
> >>> ---
> >>>  arch/riscv/Kconfig                 | 24 +++++++++++++++++
> >>>  arch/riscv/include/asm/cpuidle.h   | 11 +-------
> >>>  arch/riscv/include/asm/hwcap.h     |  1 +
> >>>  arch/riscv/include/asm/processor.h | 17 +++++++++++++
> >>>  arch/riscv/kernel/cpu.c            |  5 ++++
> >>>  arch/riscv/kernel/cpufeature.c     |  1 +
> >>>  arch/riscv/kernel/process.c        | 41 ++++++++++++++++++++++++++++=
+-
> >>>  7 files changed, 89 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>> index be09c8836d56..a0d344e9803f 100644
> >>> --- a/arch/riscv/Kconfig
> >>> +++ b/arch/riscv/Kconfig
> >>> @@ -19,6 +19,7 @@ config RISCV
> >>>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >>>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> >>>  	select ARCH_HAS_BINFMT_FLAT
> >>> +	select ARCH_HAS_CPU_FINALIZE_INIT
> >>>  	select ARCH_HAS_CURRENT_STACK_POINTER
> >>>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> >>>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> >>> @@ -525,6 +526,20 @@ config RISCV_ISA_SVPBMT
> >>> =20
> >>>  	   If you don't know what to do here, say Y.
> >>> =20
> >>> +config RISCV_ISA_ZAWRS
> >>> +	bool "Zawrs extension support for wait-on-reservation-set instructi=
ons"
> >>> +	depends on RISCV_ALTERNATIVE
> >>> +	default y
> >>> +	help
> >>> +	   Adds support to dynamically detect the presence of the Zawrs
> >>> +	   extension and enable its usage.
> >>
> >> Drew, could you, in your update, use the wording:
> >> 	   Add support for enabling optimisations in the kernel when the
> >> 	   Zawrs extension is detected at boot.
> >=20
> > How about

Probably should have said, this was just a replacement for the first
paragraph, not the entire text.

> >=20
> >   The Zawrs extension defines a pair of instructions to be used in
> >   polling loops which allow a hart to enter a low-power state or to
> >   trap to the hypervisor while waiting on a store to a memory location.
> >   Enable the use of these instructions when the Zawrs extension is
>=20
>                                         ^ in the kernel
>=20
> I believe "in the kernel" was an important part of the clarification that=
 these
> Kconfig options do not affect whether userspace can use these instruction=
s.

Meant to reply earlier but forgot. Samuel's correct, it is indeed the
key bit I wanted, I just suggest what's above to match what was in the
patch I had sent earlier today. Don't really care all that much if it
is a match nor not, but I do care about the help text actually
describing /who/ gets to use the extension when the option is enabled.

Thanks,
Conor.

--Ugf9QOJEd3IvGO73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiGaNQAKCRB4tDGHoIJi
0rGbAQCve/ypa8G6DlerInRYzzxFD0tAVZln/I9+DBoPxO+1RQEAwyQ7fhUf0HZd
QigfiK03EdAOxRAxiAkuHOuIO6r5fws=
=SkO0
-----END PGP SIGNATURE-----

--Ugf9QOJEd3IvGO73--


--===============5783912939621718085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5783912939621718085==--

