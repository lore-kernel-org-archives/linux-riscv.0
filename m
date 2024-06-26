Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B436C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 12:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwfQ7wiyXTKgiOcWen/6FKraERvyUyNJquslWkZ6mes=; b=gXcy5UGQxDtYfviWBQfcwsTTP3
	+tJvTl2OCWjQeuS4bJCENehdzqjkQp7WFGxHrY+i634SxR3v4EVcIVig/ajSAMG5COFVNuBPumBvB
	7mt18huE1F/Sx891yeWbbZ1us8pwbOap0tyC7dZyR9KRJBivriZzpfpLRFvfiBGrc5W8JMaZxjGNu
	0GrylbT/w9UuJd84gI0R0J9ulc/UrhHbwmtxWFPMuXTuCt5Eo1neCCZSR4JmDPuACnCekEmZ2YITv
	RiU16DDuFSS21j230ADh5rvmkwbUm4QIera/zHcMCN12b09gu/71QX5B3oSwDFykat+7bjZUQntyH
	vSAroZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSFG-00000006pcz-357y;
	Wed, 26 Jun 2024 12:59:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSFD-00000006pc1-3I0D
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 12:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B894619F7;
	Wed, 26 Jun 2024 12:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB7DC2BD10;
	Wed, 26 Jun 2024 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719406765;
	bh=9TrlOyltmZ/QX4Ys9Bg7ZXIQUZ0PLaKMhQFyJgcNcTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vcn3/n4HyNJrzHq67QHZQ57mfSDQ9/5xlPXsLqLL/JbJEkVTOMWM6FMCE/9swgyaw
	 t26oBubZBy2xvQ2x49nwiOJXd3h4B/aSu929r8w2ryOz5ptVk7k1yq7SxOr3TGktuA
	 c1GKOQpcPZ69tq4muyjIa0PqKLxqxVZf9S0hfsTVBaqgyNiU3AR9O1FCY7vPrtqiBx
	 LzlyLe5KGFZWRsYoZOY4lxbt3q3VvneIx20mM3nK026K/S53QSQoX0X7CStbs3LjvO
	 OFoMPyFmgEuwsM3NHJXw2wi0I0Nv19+1kQnazttixLmJEaCTiJiGXTDQO+zp1sQjSr
	 QoxA0GHHNdz9w==
Date: Wed, 26 Jun 2024 13:59:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH -fixes] riscv: patch: Flush the icache right after
 patching to avoid illegal insns
Message-ID: <20240626-astrology-fructose-275fb799ebce@spud>
References: <20240624082141.153871-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240624082141.153871-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_055927_894449_16EE95F1 
X-CRM114-Status: GOOD (  10.91  )
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
Content-Type: multipart/mixed; boundary="===============5307077492989084635=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5307077492989084635==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n6A0djetNF9SaJ8G"
Content-Disposition: inline


--n6A0djetNF9SaJ8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 10:21:41AM +0200, Alexandre Ghiti wrote:
> We cannot delay the icache flush after patching some functions as we may
> have patched a function that will get called before the icache flush.
>=20
> The only way to completely avoid such scenario is by flushing the icache
> as soon as we patch a function. This will probably be costly as we don't
> batch the icache maintenance anymore.
>=20
> Fixes: 6ca445d8af0e ("riscv: Fix early ftrace nop patching")
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Closes: https://lore.kernel.org/linux-riscv/20240613-lubricant-breath-061=
192a9489a@wendy/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

So, I can't even test this right now :/ The issue is annoying enough to
reproduce that same config + compiler + commit isn't enough.

--n6A0djetNF9SaJ8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwQqAAKCRB4tDGHoIJi
0iSqAP486M4V8TRvY4pTcu95fzUWRuzRV0oH+MPkmoNcTZXfzAD/XOaCqK/Aynb0
LKzQVLCv7/qhMQgD7WB2oSCZZV1YFgA=
=z8Xv
-----END PGP SIGNATURE-----

--n6A0djetNF9SaJ8G--


--===============5307077492989084635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5307077492989084635==--

