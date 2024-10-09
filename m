Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1705CF0453
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u08FeBzgvyMiphlPsEbmRW4sBTCTZ8puw5I2l6cx68g=; b=WsILQQcX8UEIkxQDqNwjmvDPMx
	dwJtz9yLjTfiyQTOXJE8lvn5N3NBStiaqJXc4fhQDVuw8+VqQNOMMlhjz+ogORdo8ORsDbHEB1T1h
	LBv/Nr0FvmgHKYKnhQL6SpsUu7LcOZ//jkui3OKaslk0ucGhcbQiF7rTgbq4jyrk2iqBxUA6ZSPem
	yQuv/uQt/t8wdsKye+1vPYZS8Sg849NQ/FTL/3WK2KfgxA7rWDn+X3TcEgx2sVwTG0M5MPVVWAe1L
	6YQhSe/BBXGnaG2mO+j0GrC27ZBemGwyUxIehwcIMDXw9iFLYbPpyyfyRxkq6HYAT7EK1TSvwKl9Y
	833MDiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUXq-00000008zyA-10Y2;
	Wed, 09 Oct 2024 11:07:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUW2-00000008zan-0dxh
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 11:06:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAFCF5C54C9;
	Wed,  9 Oct 2024 11:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB2BC4CEC5;
	Wed,  9 Oct 2024 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728471960;
	bh=q/ht5rusQH29reCgQKkQ7cxAxVD7sSLy4Jo1uGfHo0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQ/b9j93K6RqAqgOUVMgfWoJsX5As1kolPBoc1Y73PNguggklUUrUm2Ap+8EzcnQL
	 q1m6g5FdIty689UhD2b5AzShUkate3A6XOljtsoMwAwmAWIgjx4jayaN+AWF8F4T9S
	 z26oFKbiOTGuQS86JgZwc2gC9p4KnFCD7dLoSUKSS5Nf2TtSABKSG1CslKD55avTD6
	 nudWnFJtEZ2i5CHu60HDNsExl6LyE2587gf6cMM3mS/fC9mra+T0Wa4nFpqjpsXVQ4
	 aagGb/fIscXPvjhoTdQGNYv8iQLBq4HwXneOlsq96NIQAJtqmEm24eqebhSI6o2bfj
	 1JnC7rG+hfcLg==
Date: Wed, 9 Oct 2024 12:05:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
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
	samitolvanen@google.com, rick.p.edgecombe@intel.com,
	David Hildenbrand <david@redhat.com>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v6 00/33] riscv control-flow integrity for usermode
Message-ID: <ZwZjlSZKoJ9np3td@finisterre.sirena.org.uk>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_040602_308413_EBB381C6 
X-CRM114-Status: GOOD (  12.76  )
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
Content-Type: multipart/mixed; boundary="===============0300484462677156627=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0300484462677156627==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7oPJV4nwhqMkz2xI"
Content-Disposition: inline


--7oPJV4nwhqMkz2xI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2024 at 03:36:42PM -0700, Deepak Gupta wrote:

> Equivalent to landing pad (zicfilp) on x86 is `ENDBRANCH` instruction in Intel
> CET [3] and branch target identification (BTI) [4] on arm.
> Similarly x86's Intel CET has shadow stack [5] and arm64 has guarded control
> stack (GCS) [6] which are very similar to risc-v's zicfiss shadow stack.

> x86 already supports shadow stack for user mode and arm64 support for GCS in
> usermode [7] is ongoing.

FWIW the arm64 support is now in -next, including these:

> Mark Brown (2):
>       mm: Introduce ARCH_HAS_USER_SHADOW_STACK
>       prctl: arch-agnostic prctl for shadow stack

shared changes to generic code.

--7oPJV4nwhqMkz2xI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGY5QACgkQJNaLcl1U
h9DuYgf/Yx/hYhzwGnR6YPAWZpgt5JjVuDPJa1JE1Ei8ieKYodc7o6QkOA5hSrTm
WYjjS9qnSLJMACL3DYu4mSJA8xQotPF5iqQaMppk1O/o2e3oTwawz7s0nV/YrWro
AqVenIjySprRKZMNLMT7px8D0NFUlqICKS05NO3+KlS3J/tdxEnW5ugscd0abE6V
UuEUA6JnHqtwrdff5T2I3hZqDw1W+3uMDoCYjB5hsmRbZQsdR31IbaAqJIiV30Xn
e2tXbl+/62YIiebxZzUJGexuc7CbwdMnNC6aRjMTFEZ1R4YF1DJZMu9TcIBP/W2b
q6AR4EUd7yJlirhYQIzbhTVozmqMlA==
=L1c6
-----END PGP SIGNATURE-----

--7oPJV4nwhqMkz2xI--


--===============0300484462677156627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0300484462677156627==--

