Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A642C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2p7s2J/hv4VfOwKINnBhmz1GX5zsi22vIh/pR4P9dp4=; b=MhBACVoL/QrkHFJxTRuabqHXvc
	y9Mg+arOMV+trpht8LiqxWtCIUEAlCWnwPo6PI7gAA37siA1EP8TCuinn+qTscwNgpTSXUq4MAgvV
	y9Pqsuvo6YyM0xKFIy8bSi/MVZJqoxlHLpVV3ROzupKFwY4lqkxsmxdFYCLhDVvC9VBR2Vdm5qjSV
	TS/K/UbVVxEZP7qeo4X+aAagsgU8oOgdXtcxVwuHnnRxUM+82aAOqU1SY2I6fFKRhEVxpgNvk5Vwy
	KhiGxSqEFWdUPTeOTGWiKsSgvRVeQvL7fXcLrxLJwzo7JzvQlAH1kuCjrK5Ovy1a3JsIEtF1YOPgx
	Znk+04BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNoQ-0000000AAF2-3IfA;
	Thu, 30 Jul 2026 10:16:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNoP-0000000AAEt-2VUW
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 10:16:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 369504070A;
	Thu, 30 Jul 2026 10:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E641F000E9;
	Thu, 30 Jul 2026 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785406585;
	bh=hwQXtI5NkzEH7Kjv8pvtqVVW6iAaKpBh3/KqqndjeGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g/xYDbwi9nH+4w3ZdzklsgnymASpCq/zmRuiTDKBJuD3OlmsZBzlS8kYCMb73kRi4
	 mdllQn7gnYyUt9CfcNPkRmhza7mbyb1BoEQKu1NlVsW3xAlcA42VKTJnrJ8zY5fiBu
	 ezCgLcHi7cR3v43PK1Pwu4WoDzYDf7z4wORRw+52E3HzwkIL9B1byalpZpVQuMf6sc
	 UQVPyev2jgAg1NbOdu7dqMfTf8jrLouKz+nXKleo9mvscvtZc7iRQ9SZU8UU+4mLja
	 Y1jh+2Sn1dadWfH52WlPQ4I+ZF5fh0npB7Q+dh/TbEjd9VUrOppMvNnPo8t72R/DL5
	 K8Lo8gU8IDUCg==
Date: Thu, 30 Jul 2026 11:16:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Paul Sherman <shermanpauldylan@gmail.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: smp: fix non-SPINWAIT secondary hart rendezvous
 for fw_dynamic platforms
Message-ID: <20260730-crusader-disfigure-0ab121347aa1@spud>
References: <20260729083414.39339-1-shermanpauldylan@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260729083414.39339-1-shermanpauldylan@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2306529769068620017=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2306529769068620017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IQgEodWEVcoUETSD"
Content-Disposition: inline

--IQgEodWEVcoUETSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 01:34:14AM -0700, Paul Sherman wrote:
> On platforms where firmware (e.g. fw_dynamic) releases all harts to the
> same Linux entry point simultaneously, the hart selected by OpenSBI as
> Domain0 Boot HART is already in SBI_HSM_STATE_STARTED when Linux later
> attempts to bring it online as a secondary CPU via SBI HART_START.
> OpenSBI correctly returns SBI_ERR_ALREADY_STARTED, but Linux has no
> recovery path: with CONFIG_RISCV_BOOT_SPINWAIT=3Dn, there is no secondary
> wait path in _start_kernel for harts that entered Linux directly from
> firmware, and sbi_cpu_start() has no handler for SBI_ERR_ALREADY_STARTED.
>=20
> This causes one CPU to be permanently dropped per boot. The missing CPU
> is always the OpenSBI Domain0 Boot HART, which varies between boots on
> Sophgo SG2042 (hart 1, 2, or 3), explaining the apparent 'moving victim'.
>=20
> Fix with three cooperating changes:
>=20
> 1. Initialize boot_cpu_hartid to INVALID_HARTID instead of relying on
>    BSS zero-initialization. Without this, boot_cpu_hartid aliases with
>    hart 0, causing hart 0 to always appear to win the boot CPU race
>    regardless of which hart actually stored its hartid first.
>=20
> 2. Add a non-SPINWAIT secondary wait path in _start_kernel. When
>    firmware releases multiple harts to the same entry point, non-primary
>    harts divert into the existing spinwait rendezvous arrays (previously
>    used only by CONFIG_RISCV_BOOT_SPINWAIT) and wait for cpu_start() to
>    provide boot data before proceeding to secondary startup.
>=20
> 3. Handle SBI_ERR_ALREADY_STARTED (-EALREADY) in sbi_cpu_start(). When
>    HART_START returns -EALREADY, the hart is already executing in Linux
>    and spinning in .Lwait_for_cpu_up_sbi. Write the spinwait rendezvous
>    arrays to release it into secondary startup, matching the approach
>    used by cpu_ops_spinwait.c.
>=20
> The arrays __cpu_spinwait_stack_pointer and __cpu_spinwait_task_pointer
> are defined unconditionally in cpu_ops_spinwait.c but their extern
> declarations in head.h were guarded by CONFIG_RISCV_BOOT_SPINWAIT.
> Move the declarations outside the guard since the arrays are always
> present and now used by both boot paths.
>=20
> Note: The NR_CPUS bound check mirrors the identical pattern in
> cpu_ops_spinwait.c:32 which guards the same arrays against out-of-range
> hartids on platforms with discontiguous hart numbering.
>=20
> Link: https://lore.kernel.org/linux-riscv/20260727221508.5179-1-shermanpa=
uldylan@gmail.com/

> Tested-on: Milk-V Pioneer (Sophgo SG2042, 64-hart RISC-V, 4-NUMA nodes,
>            128GB DDR4, OpenSBI v1.5, Linux v7.2-rc5)
> Result: boot_cpu_hartid correctly reflects Domain0 Boot HART, all 64
>         CPUs online in 2.7 seconds (was 63 CPUs, boot always on hart 0)

FWIW, neither of these are valid tags, just put this information in the
commit message proper.

> Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>

--IQgEodWEVcoUETSD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamskcgAKCRB4tDGHoIJi
0rPWAQCRC236qWEk7INUdaQxu3SiRxaoOw7opvQ+G34KDAUMTgEAlaIIWgqX9dsj
KyVz/JEbRQUpYalqqFUOLzjkzUnZBQo=
=95V8
-----END PGP SIGNATURE-----

--IQgEodWEVcoUETSD--


--===============2306529769068620017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2306529769068620017==--

