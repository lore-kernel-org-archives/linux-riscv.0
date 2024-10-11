Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B9BCFD316
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+UU6GzEBlkzbezIF/1rwTbWQWevsPO3XX02yMJ1OOg=; b=0VHNo7LlFpYKvQKzNnRHqTe4w9
	m4tpsxDm4UeiFHQ83yELvjP5Kr8gImcx40WnaJG+HYzTgn0I+yIGUiIGXG7QoGwyxw1leMjCNdFmY
	pnZsZwscNML1tXAJSVzDCTUapaHtLWQzvlxJonFid1r6caTv1E7qwNM3BcXMKHJdlq4LXIB53pT6S
	p2Ua2hQcgtZrxQnmq0jTOpuNHRRRWz7lVa0/CFRBHbkXMx9Sx/n966LHbTT4XMtf6cFexnM2CJvDr
	oOnNmrhf7pmtJmGJ7q6BqwPpICbtsbCN6LC6JzTPKPv40g7cFB73AnZHfXOGbFp0+VNJ37V0P9Qge
	21URR99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szCj3-0000000Fx6h-1R1j;
	Fri, 11 Oct 2024 10:18:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCj0-0000000Fx5L-1dwK
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 10:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B76E5C5B4C;
	Fri, 11 Oct 2024 10:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954F2C4CEC3;
	Fri, 11 Oct 2024 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728641901;
	bh=lyKMdlipHmMYKqMilFlbZUHsLyqahWCluuNLI0NJiGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjoopDs5/omBheGfRb9ZQ450SmBtY6HZjHLk4F2wc6F5woXclnTMZFIsICX42AkUS
	 ZyIsYdj91w3FXWFEdw6JaShqxjF+G18Q5Ff6R2GjLaO0qDAxP9R6VpiUU3pmwhN7QW
	 xiyBUuSLUibdBek6wdxoqqZj+MagtJde/r8jEaXDCqt1YsFuQO96bMYBrC3XPuIsM1
	 uWTW6FwjVT6eVldfcoe3NSxxoOTaDSTUD/Su513PPSelESY+nugqM/+rQ9p4p2cB3h
	 zDNAcVH0E7YJsJu7hJk0J4XD95ImgZuz9BE7bsUTnYJ5PgSSQ3LpOvFvhvi7bSk30S
	 C/FSjlpgfro+g==
Date: Fri, 11 Oct 2024 11:18:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v6 33/33] kselftest/riscv: kselftest for user mode cfi
Message-ID: <Zwj7aZj36TBGzpZa@finisterre.sirena.org.uk>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-33-60d9fe073f37@rivosinc.com>
 <CANXhq0pXVS2s-hZNusPLoQ4qPkyi1S2BTQ-FyAvcz=cDctKQng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANXhq0pXVS2s-hZNusPLoQ4qPkyi1S2BTQ-FyAvcz=cDctKQng@mail.gmail.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_031822_539346_2E30B3AC 
X-CRM114-Status: GOOD (  16.20  )
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
Content-Type: multipart/mixed; boundary="===============5706771493874722082=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5706771493874722082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PJjNqwWWqyWbjeHL"
Content-Disposition: inline


--PJjNqwWWqyWbjeHL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 01:44:55PM +0800, Zong Li wrote:
> On Wed, Oct 9, 2024 at 7:46=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> =
wrote:

> > +       if (si->si_code =3D=3D SEGV_CPERR) {

> Hi Deepak,
> I got some errors when building this test, I suppose they should be
> fixed in the next version.

> riscv_cfi_test.c: In function 'sigsegv_handler':
> riscv_cfi_test.c:17:28: error: 'SEGV_CPERR' undeclared (first use in
> this function); did you mean 'SEGV_ACCERR'?
>    17 |         if (si->si_code =3D=3D SEGV_CPERR) {
>       |                            ^~~~~~~~~~
>       |                            SEGV_ACCERR
>=20

Did you run "make headers_install" prior to building kselftest to get
the current kernel's headers available for userspace builds?

--PJjNqwWWqyWbjeHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcI+2gACgkQJNaLcl1U
h9D6tQf8Cbjh+ZCxTHzNMvyIkuab9pqHuHnVUB/sDN7eeBJp3Yem3v9BmF2lUAdA
E2WU54VgKuAaJJ+3nvouHfzMeZ9bT+OaDgwDVtgDkF8agaj9mRM2tKmsMWpAb4aF
eORi9++qQz7h7OvKTPSZCVB8o6jVRhOFEFcyv/gXXg5WvNb8UIf0cPkwhS8hh61e
GIAT7UE2o+e0/BzYHIAVrMB8F8YHSkEYi/fAFy4rcIHrru8aL3dATtRMKpxGDX20
VlJ9IYA/nNuODeLJSt10auIsA2z3GF73b4fWqhQ7h0/ga7SACr050BxNq3SBkfJ2
NaDmcT4DAf+mI549FZMM61qSvllFEg==
=La7c
-----END PGP SIGNATURE-----

--PJjNqwWWqyWbjeHL--


--===============5706771493874722082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5706771493874722082==--

