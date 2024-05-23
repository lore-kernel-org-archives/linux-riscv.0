Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE1EC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJyVLmKayuuiZSJ7N2VGVaNG3n1skqA+SRkP/czyQMk=; b=mDKoQEhlSj18LyJR0QgpcF96CV
	89Pv06n+ZymlwXF+O7n9f1KTlgPv4zHhGX3mk3Usey8o6kKptZ19ZTIZ/eK+dFpwSSHKo/wYIclDb
	sYfGTH0bqem+JqtnTRbSM+4BeDJMzjFEUB7WmzU6vq4RA4Whx2kFmuuHRe/+erc57fAc2Zfs29Ewg
	PWymYmc+OJffouhfMUiX4xeELALZVuokNn2v1BTKU3E8WsDB69brYgiVoztNUSIVvor2HGA2+yDi1
	P1cJ+30ilX8kSp3uEucEOAfciCJfWHBSpQ/afVdZuZrPyDIeZvTdeHAEV3ykDGsx5jY13rxlORti4
	wWTZlXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9Cz-00000006SRa-02s8;
	Thu, 23 May 2024 14:14:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9Cv-00000006SQs-3wJF
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 14:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 548ACCE1762;
	Thu, 23 May 2024 14:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADDFC32786;
	Thu, 23 May 2024 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716473634;
	bh=wHmf0+7f1PdiR6STtU5I6IdOk8lZ3B3cslxc5ZQ4saA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pG3FZUZcHCWWmWQj87cDsg9x+aCOqkZg0AY/fdChUJM8p14lzvEzizpRKuHjSb8v1
	 mr+V8Ar+hMyMvXJziq18S8UPfLVnpcIvZsWW5T2uP27KPi1k4NhK+fm21bFRgmpwvD
	 iKz3+ZbnSCTKVeisPwev02H1OBWy6vHmdlNXoxLIl+J1DkliIbkDmsFJZc8/ZFIBTr
	 AnnjzBUEoeE7dGoU2XYLpqbf35+nxElqLJKaNgpqgJcOJNivCrs03H5PQG0dpt3qJq
	 C7SS8H0HmRti2jEqD+pEBRyNA77lNi3BCtjTnSsHnD1HiI3y9UAyLNSt8J6chiHXne
	 cETsF6OVa7ZmQ==
Date: Thu, 23 May 2024 15:13:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix early ftrace nop patching
Message-ID: <20240523-showcase-helpful-4cc84fe2f1d5@spud>
References: <20240523115134.70380-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240523115134.70380-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_071414_410295_E8242A73 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: multipart/mixed; boundary="===============4690008186624925307=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4690008186624925307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2HITYodwdCyzzdtT"
Content-Disposition: inline


--2HITYodwdCyzzdtT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 01:51:34PM +0200, Alexandre Ghiti wrote:
> Commit c97bf629963e ("riscv: Fix text patching when IPI are used")
> converted ftrace_make_nop() to use patch_insn_write() which does not
> emit any icache flush relying entirely on __ftrace_modify_code() to do
> that.
>=20
> But we missed that ftrace_make_nop() was called very early directly when
> converting mcount calls into nops (actually on riscv it converts 2B nops
> emitted by the compiler into 4B nops).
>=20
> This caused crashes on multiple HW as reported by Conor and Bj=F6rn since
> the booting core could have half-patched instructions in its icache
> which would trigger an illegal instruction trap: fix this by emitting a
> local flush icache when early patching nops.
>=20
> Fixes: c97bf629963e ("riscv: Fix text patching when IPI are used")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the quick fix Alex :)

--2HITYodwdCyzzdtT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk9PHQAKCRB4tDGHoIJi
0qjYAQCZbnkVecKQA29bgEC+XPR/AW8H6mGRAzkYf8O1XZA2AQEAoILUgAjaGIaK
gWxhQLnUJzhG8w4SK9oCaJ0aLEtWgAI=
=2ZE4
-----END PGP SIGNATURE-----

--2HITYodwdCyzzdtT--


--===============4690008186624925307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4690008186624925307==--

