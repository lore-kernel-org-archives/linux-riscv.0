Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C35EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 21:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yG/+Yi8TkFO7b+4GqowT1yFSsqcWu3lfHMS11+aIIE4=; b=1SCUMSfHTMAmjsNp+nf9bOP57y
	Zcvh05YFhiASWDE3S732RjHTqcyuj+F9T68+SwDYWyS/Z3458yhhkL12GhrUyn15vMbCVb4OvYvzy
	+FcwyjU57OQi0WS9qBoT5gAA0pDe5g1r3mpZ/pSAeMPD1LPas1et3N7QjUqbLCIKz8XXWb0TCOWp+
	n/TtK2zD16lzkWyF19WaP8eaAxhMfFBVTvjUs4PMXQlF4LIrdlaahOIvBA2gUkJmVYpYZnXQYLU3o
	q37iR7qd5FzrjFfYRyy6krypb1ThLBAxVblg6piYRwkVkJvFLKt7YGVpAeL1TSPnQKwaaiRB/yjMG
	7BWJerrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uQO-00G87l-24;
	Thu, 15 Jun 2023 21:22:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uQM-00G86a-1I
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 21:22:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B5096269D;
	Thu, 15 Jun 2023 21:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBDDC433C0;
	Thu, 15 Jun 2023 21:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686864152;
	bh=y/syxi6LWP54++e8nMldw1VX9hibKkby5BGKloVYLrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcqAlPJw9XWxkaZLMRGSNqtnoiR4fsrGZv6jcypOhBYarWrXPgTaGPjCpj4jflM3X
	 5T4gygQLv96lTjkshE2eUvclVPeDj4TmB2f2zvvLtzSymKPHaY638HVLSvMlwso+n5
	 A6AcdVxMuRdRjNugoUpvrs4XzgeqBVAr7d2dsTe/yUDwLb20aSwPaWH3fY0aDfylZJ
	 /2ivpZ5exOFBJpUVdoG1ns2AO1VX/QiT3VZ4kQk4GayQi39jGrv5VUoYr+Sl2GOVP/
	 uo+HFe3YZHkhI72hubzV6HlaanbNlM2mOSn0rmQCFWoVP+HmbBqbTyPPcXRWJHdL6+
	 fdXP+CEIVLVSA==
Date: Thu, 15 Jun 2023 22:22:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] selftests/mm: Fix cross compilation with LLVM
Message-ID: <d7e56d51-e492-473f-992e-7f8a00527df4@sirena.org.uk>
References: <20230614-kselftest-mm-llvm-v1-1-180523f277d3@kernel.org>
 <CAKwvOdk0sPi95TSdbyEKXud68nHq_7=ccDwaCkVsyd54ArRC=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdk0sPi95TSdbyEKXud68nHq_7=ccDwaCkVsyd54ArRC=A@mail.gmail.com>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_142234_485345_A6D42444 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Type: multipart/mixed; boundary="===============0839029151279295902=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0839029151279295902==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DQwDQ9qhsp4E6wdO"
Content-Disposition: inline


--DQwDQ9qhsp4E6wdO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 05:01:56PM -0400, Nick Desaulniers wrote:

> Broonie,
> Thanks for the patch! What's the best way to test this?
>=20
> $ ARCH=3Darm64 make LLVM=3D1 -j128 -C tools/testing/selfte
> sts/mm/

> Is what I would have guessed, but I get errors with or without this patch.

make ARCH=3Darm64 LLVM=3D1 -C tools/testing/mm TARGETS=3Dmm

> Also, fwiw, b4 shows that you don't have a pgp key setup for
> broonie@kernel.org; I don't think it matters, but maybe it's a
> surprise to you if you thought you had set that up,
> $ b4 shazam https://lore.kernel.org/llvm/20230614-kselftest-mm-llvm-v1-1-=
180523f277d3@kernel.org/
> ...
>   =E2=9C=97 No key: openpgp/broonie@kernel.org

That's an issue on your/b4's end, my key has had an ID on it for
broonie@kernel.org for years (looks like back to 2011).  You probably
just don't have a copy of the key locally at all, the keyserver networks
are pretty borked.  keyring.debian.org should work.

--DQwDQ9qhsp4E6wdO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSLgREACgkQJNaLcl1U
h9Aegwf+M33q922PSuwTh70lmU3iTvRAvHn/rXFTNDvfMAyQXcGIfvSlRpKCxZYb
/MhPP9mL4ttUXXMDVrZcahPOHDHwUE35QvyZ+4gaVQr7LLR70N1jr3ppLDl9lEMZ
x8umg63XnuV4rozuZFmjshQC5l4Ph3BskGTS2TtHz3wa1Voa87VCRJ8S0v3zaPjW
HGqLONB9ssipYHX2YjDWibRcjpTY1qyLA/lnixYJlre345uXdhX2DVfuaVgJ50La
opPmDecHuMHLFq1Mw+Lp9NOtQeQIyQbi0zUpPbdvFKD2FI5aHp5Pqiy5CUb9iMAL
Jb412IsCWhMhm7YEaGabl+1spBBBeQ==
=cvFy
-----END PGP SIGNATURE-----

--DQwDQ9qhsp4E6wdO--


--===============0839029151279295902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0839029151279295902==--

