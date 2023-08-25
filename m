Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194F6C83F05
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 23:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbiYPjdXJ24Px7dfJmolmVzlzAqpeygNrscH617bybs=; b=X+U0PJL5miKmkeA7fahJLgDr3W
	QuTa4saicfyR4sKWPYsJH6h9tWgRaGX3h1nSRABiO69gdV7QlMDQhjj0pzx343QMHrx7Jp6V85FMx
	7+xyyn2VkFz0PWchurgKTEO9moM9qblvHdMz4x53oS31krvrgxgbrn1HUIYR3GJxGPHBBW+nfBLia
	a7S9V3A2w7gTarOIAOIg13zdaAZlWto1teBPgfjASbzLjGIXJZzsozYY4FMdMU78PtCNRH9ajPkVP
	YNO1hzln9z9N14LmjUReRyI3DG4/qdkhBnY1oVAgxMvRqqL//Wi9tkC9No0Qk9rx3n/Z6xzha4OUs
	yvZIJVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZgCI-006ApT-1i;
	Fri, 25 Aug 2023 23:26:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZgCF-006AoN-1p
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 23:26:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13EDD611B3;
	Fri, 25 Aug 2023 23:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09C3C433C8;
	Fri, 25 Aug 2023 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693005990;
	bh=7HwZnCsZbl5TQtcjKxpWX5l3vU8EOklS1EaMyIzsa2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADjKcYdgOJJICMbQ38J4gdCEXO7D9fTWLo7Yytu0be/DKHS6zoDIoRcNrlex4mA4n
	 ue773v0DVdcwzCWxxUT86ipjx9PMEgLxh5z18gR2Xs2boFuAhBsozBGE3Dlv7s+8NN
	 fyLZBXc7f5UaiekEGraAjBHtxcHkrnaaDHVfcgTUNaG5bXdr2mnNyaIF4nSHM5gwkL
	 4nTyMtMiSxlGts5JekpBE2cbZLLUe5pUDsFzO+Xw5nBi6RRnLO6n96ewD5CVsq0WDu
	 EqF38PKoRFDGneLMYk/hHsLrv60A1EJWEv73KQokJAFHK68z/sDynqLREn+mQ654uI
	 73C0NKKZVZL2w==
Date: Sat, 26 Aug 2023 00:26:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230826-anguished-tutu-81d63b3081a7@spud>
References: <20230825231139.1145522-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230825231139.1145522-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_162631_709213_507FAD56 
X-CRM114-Status: GOOD (  21.77  )
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
Content-Type: multipart/mixed; boundary="===============3239942417369439657=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3239942417369439657==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qkfI1VY/b577gx60"
Content-Disposition: inline


--qkfI1VY/b577gx60
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 04:11:38PM -0700, Evan Green wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
>=20
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo. We cannot change
> the "isa:" line, as usermode may be relying on that line to show only
> the common set of extensions supported across all harts. Add a new "hart
> isa" line instead, which reports the true set of extensions for that
> hart.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Can you drop this if you repost?

> +"isa" vs "hart isa" lines in /proc/cpuinfo
> +------------------------------------------
> +
> +The "isa" line in /proc/cpuinfo describes the lowest common denominator =
of
> +RISC-V ISA extensions recognized by the kernel and implemented on all ha=
rts. The
> +"hart isa" line, in contrast, describes the set of extensions recognized=
 by the
> +kernel on the particular hart being described, even if those extensions =
may not
> +be present on all harts in the system.

> In both cases, the presence of a feature
> +in these lines guarantees only that the hardware has the described capab=
ility.
> +Additional kernel support or policy control changes may be required befo=
re a
> +feature is fully usable by userspace programs.

I do not think that "in both cases" matches the expectations of
userspace for the existing line. It's too late at night for me to think
properly, but I think our existing implementation does work like you
have documented for FD/V. I think I previously mentioned that it could
misreport things for vector during the review of the vector series but
forgot about it until now.

--qkfI1VY/b577gx60
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOk4oQAKCRB4tDGHoIJi
0qesAQCAv+Id3VI7GGN4a4k9spLlIS45t6btTV9/aCThf+ubXwEA7IsxmZ2HzEN5
1SDmG7YGFdXLHJD/Lo4RNeQfL85/FAc=
=ZbVo
-----END PGP SIGNATURE-----

--qkfI1VY/b577gx60--


--===============3239942417369439657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3239942417369439657==--

