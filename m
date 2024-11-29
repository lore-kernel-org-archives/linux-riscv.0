Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C6BD729E9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb80xpxQ5L59552riBSO9+2maFc6k88rw+fUFEiKdrI=; b=FaGMsSidy30ncMuxY7CAcZPB3+
	6CQeoMXqptbqFCaL0wSC8cBlaE3fpZVq3MdWk9a1iL1bRmMmjHKGC2WwZtMyPO17cQQUOfho49zmg
	JpJZmHbVodiPmbCyRW4X5ols5zw4Hta694nB2hAAJfE6Mg89AQsizeTTigNCgSMZPUUrLWoNXnwSK
	jGXHdKSBdC+VsgoUmcw3wkmmz9fnRScKhaehWWcDWlGGXKpL9FdO62S/vunOh5YQqp9vITDsHg4Dn
	K1aCNoKEcgYuIKonxnvqY9goAg59v7bobjlpsY+eqxxTLhcfHlP68yTVLMtcfdo2tE+B7EzUWbnkn
	zHhgtpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3rw-00000000bTl-42Pl;
	Fri, 29 Nov 2024 16:29:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3rt-00000000bSL-3ted
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 16:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8202C5C5B55;
	Fri, 29 Nov 2024 16:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319F3C4CECF;
	Fri, 29 Nov 2024 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732897760;
	bh=a+JXksBolTe4J4hQL4bPo5qxtspU7rydl4gWOzG4f1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mF/4ioTrQsHHDuHLfI+AbccmnbJPHxnpOgSbt/2TW6RDhC1Z4nlssBu+qc+zRhNuf
	 azpb9VplKB5TKLxwhjrQjVOpxsfwi5JGCEdbXjOWeeetItaqhRmP0hm8TYP63EC/HU
	 B9qjeMvij5IqZNUc0xoOccuZ8DlsQ0gXArvgwl0O+NhgyyCAWzJsK772O2GkH7/6uC
	 SaGtY9AdB+eRNIgnZMBY93KnfDPJfRYv9swo9a7GhHV1WT9E1ePZaPlCymS3ierTKF
	 KETz7i+QSiwgyD8lwhGAUa34J3QM5JGuF+/7S9pF9QTqCqy80/HqYAs4gs2ljcxov8
	 4XPcNebPs9M6g==
Date: Fri, 29 Nov 2024 16:29:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrea Parri <parri.andrea@gmail.com>,
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Eric Chan <ericchancf@google.com>, linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH] riscv: Rewrite AMO instructions via lr and sc.
Message-ID: <20241129-antivirus-blunderer-efcbd49cfeb6@spud>
References: <20241129144319.74257-1-arikalo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241129144319.74257-1-arikalo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_082922_054970_C0B7E158 
X-CRM114-Status: GOOD (  23.44  )
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
Content-Type: multipart/mixed; boundary="===============2584845513453022369=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2584845513453022369==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vVGz3+wDfGrf1ixl"
Content-Disposition: inline


--vVGz3+wDfGrf1ixl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Nov 29, 2024 at 03:43:19PM +0100, Aleksandar Rikalo wrote:
> From: Chao-ying Fu <cfu@mips.com>
>=20
> Use lr and sc to implement all atomic functions. Some CPUs have
> native support for lr and sc, but emulate AMO instructions through
> trap handlers that are slow.
>=20
> Add config RISCV_ISA_ZALRSC_ONLY.
>=20
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> ---
>  arch/riscv/Kconfig               | 10 ++++++
>  arch/riscv/include/asm/atomic.h  | 52 +++++++++++++++++++++++++++++++-
>  arch/riscv/include/asm/bitops.h  | 45 +++++++++++++++++++++++++++
>  arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++
>  arch/riscv/include/asm/futex.h   | 46 ++++++++++++++++++++++++++++
>  5 files changed, 168 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index cc63aef41e94..767538c27875 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -715,6 +715,16 @@ config RISCV_ISA_ZACAS
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_ZALRSC_ONLY
> +	bool "Zalrsc extension support only"

I don't agree with the naming of and description for this option.
=46rom the description below I'd imagine that you only care about a
platform where use of AMO instructions is only undesirable, but overall
the option implies that it can be used to build a kernel that can be
used on systems that only implement Zalrsc, which, even with your patch
applied, it cannot. I think, if we are going to merge something like this,
we should go the whole way and permit platforms that don't even emulate
the a extension. If not, the Kconfig option should be explicitly clear
that the a extension is still mandatory.

> +	default n

"default n" is the default, you shouldn't need this line.

> +	help
> +	   Use lr and sc to build all atomic functions. Some CPUs have
> +	   native support for lr and sc, but emulate amo instructions through
> +	   trap handlers that are slow.

Since you mention trap handlers here, it sounds like it may not be the
CPU itself that emulates it, but rather firmware?

Cheers,
Conor.

--vVGz3+wDfGrf1ixl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0nr2gAKCRB4tDGHoIJi
0oDIAQC22X6HOobFscDmH2YDTVKivr2V+8UnvrWq6oOIysNcywD+KCxJG6vXWGFX
6Raj5sGgp+Rrb5dVs50w6j0woXcWwgk=
=Yjqj
-----END PGP SIGNATURE-----

--vVGz3+wDfGrf1ixl--


--===============2584845513453022369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2584845513453022369==--

