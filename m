Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EFFCF0453
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5VxZ8fviPQucsOeTt8QN8VCELwijB3FCpJ9yKMxgQg=; b=49sgNkiJ7tAfnEsIvTLVzoPkaJ
	tApKz++sOQWunrBKpMUgM5MWYEaS+GmgyJpkwKMhJN22Z7PbIm2MJCkAUVaMLZfodzOzCtZq6HQPz
	ZY9nA/qK0Kf2NUo0loyJBQdKYqz+oMiUeqkArcGnmRyld2hpKCfFeaggr3Ylt7N6tUzNmaQyfF3iW
	dNxr+G8j9zUuoQrM1wLvxNRV5Mhia7kiYGnVJNZVZ3rLpT3eYYMJ1umpw3o9xkBWP2iukBzxAwPwF
	fIpz7rgMPPVfbHC+ov9OyTf97cmv5Nz7dVA9FKd9/ee90eewUSJ4sNASlCglblDTzAI/sou9WEiIs
	DY40FIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUbU-000000090X5-3pg4;
	Wed, 09 Oct 2024 11:11:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUbR-000000090Vk-2bSU
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 11:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AA9AA43DC2;
	Wed,  9 Oct 2024 11:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AD7C4CEC5;
	Wed,  9 Oct 2024 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728472295;
	bh=e3rviv3TJdVjm4yn7ziTk9KSuLclDXQUchWzo7AyiA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mz7RtfQhCZ0uNCUFMWKtrHAFeascQPu/ebICZ3tR6PzNzrHFcc/TnETf+OJkJge90
	 ZR7BDjTr/iiEplJZ/McnERDIbJoo4Ruuko8yzXydymmHZercGjMUXR86WYDdDQJwhN
	 TIfk2Qog/C8fAdxxpVjiYALqqIduKNgy3iaiEe9KNN0SWuIast05sUg34l4uHjyfCn
	 xXgrJNWDslnX8A3zp1HtNtRwrw3gHZjBDPwqOjvfkIBTkKfvKyla22qr1n5qra8it0
	 9Vmmpa2HsBpKn4+LhSFP4gryYnJ0bcZMuKDcHnX9tTYsHSPZplMSMCHVO1DIZeMxqN
	 C2HFPzUeHbo7w==
Date: Wed, 9 Oct 2024 12:11:32 +0100
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
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v6 02/33] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <ZwZk5LufEv-7GLlf@finisterre.sirena.org.uk>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-2-60d9fe073f37@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241008-v5_user_cfi_series-v6-2-60d9fe073f37@rivosinc.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_041137_971077_2AE04BAB 
X-CRM114-Status: GOOD (  16.54  )
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
Content-Type: multipart/mixed; boundary="===============4963358860043329025=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4963358860043329025==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RiYacTSmJWPXVleE"
Content-Disposition: inline


--RiYacTSmJWPXVleE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 03:36:44PM -0700, Deepak Gupta wrote:
> VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
> VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
> stack). In case architecture doesn't implement shadow stack, it's VM_NONE
> Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
> or not.

Not that it makes any difference but the arm64 eneded up defining
VM_SHADOW_STACK to VM_HIGH_ARCH_6.

> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  mm/gup.c |  2 +-
>  mm/vma.h | 10 +++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)

There's another test of VM_SHADOW_STACK in mainline now, added by my
change df7e1286b1dc3d6c ("mm: care about shadow stack guard gap when
getting an unmapped area") - sorry, I should've remembered this change
=66rom your series and pulled it into mine.

> @@ -387,7 +392,6 @@ static inline bool is_data_mapping(vm_flags_t flags)
>         return (flags & (VM_WRITE | VM_SHARED | VM_STACK)) =3D=3D VM_WRIT=
E;
>  }
>=20
> -
>  static inline void vma_iter_config(struct vma_iterator *vmi,
>                 unsigned long index, unsigned long last)

Unrelated whitespace change.

--RiYacTSmJWPXVleE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGZOMACgkQJNaLcl1U
h9Dh9Qf/V2pf5NwELa5AFo32pS+UvPU+55Sn73YaN7CJwHb51fe8tNSKG9c3Gq8e
E/N5zPxVN7izgYi2vXXf1GVM/Hm9oZUxNyU4BrkNeRLh7ofy0CsGwspy7Xp+k4LH
mUZX01pPjiQ71euc4oxfaUpZT85PVe/Tj1pYyNSulKwk2My4BSuW+eHt+kD4v9uC
TSSp4NrtEi8xN29WICLiOfJQ/GZnusdljjbOEDauW3H02lVyqsi9vr5nCUlViEqu
A60ZAzYJ9XrQQEJXK6n0FL2ebd7wJH0RvYRKMCNrFBpLRUs7kiFCcczFV8QfnPTN
B9GbsQB+3EaHLl6oGV2gv6QyQgmoCw==
=uBsi
-----END PGP SIGNATURE-----

--RiYacTSmJWPXVleE--


--===============4963358860043329025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4963358860043329025==--

