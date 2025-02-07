Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EF5C0219D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXd92oPWxK2ym338qGACh1ju/mib2QgJBRuKN0rw7Hs=; b=oDeEv50DjYofFPM1YNZvuvRGyA
	FhLUo0abhTPOQAF9a0IY4FN689PWZVKJHCEAEY8IDxMTScXya8N/WDkm20va8fg30HQOb9pCSDh3t
	fMfx0kUFzQmoalyf2PI3cKMZ7YyImFn0OPCVomxmBcM2uS6iSuAz44IEnac7aT7cknxiKc+fBzw5L
	e/up5yYXveJ5XEDFwVfUI9ssgNGcZC4v98QBsKPNTOA6lZndPsehrWdc3yoyQuSm0T4vGpFAF7rru
	AXws5UBzIYxN5Vp6eEDEwr/aQD4e4y3MtZY+uqiRy/tqENkVQHP+5ptgrsfbBeQkP8RbVUvUXfE1E
	/hlkyApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzR-0000000B59K-1L3x;
	Fri, 07 Feb 2025 20:30:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUd6-0000000B16M-0isE
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 20:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28F8A5C64AB;
	Fri,  7 Feb 2025 20:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035DDC4CED1;
	Fri,  7 Feb 2025 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738958830;
	bh=hilhNBJhm7gyU2xWT0l3rVwkEdmqyKYqu1PEl6FCbO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYE9jc1EsEHG8d3Is5YHp0nx/UhYWYRFgkfUk39bIcEpCx5ZBQ9+xWQ4BirLtIuAv
	 8yZudPKcjgjJqOY0q3DgF68NLWd2vr84/vtOziN+Rr6/qcE9RFRqft8e3K/Kt5ETDv
	 ZQs3gVpLsq4xZICVk7Pa6tFH79Mk/f/eLo6B8Du2YyxXN2hkbOD2womNlBKm5fqyz+
	 DecDnRHIa4bOkiWCZxXnLzD24hXO3BUXY40Ev04J0n6Pg38N3kGnRa0Z369RIW/uux
	 L7v83uJabvw4b4S5BG2sxMdQLeT7UdvoXlEGml0u0lseOPAYLna4mKfHcsTp4tdN/T
	 muTG0T0MffppQ==
Date: Fri, 7 Feb 2025 20:06:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <5708c19d-240a-466a-b17a-d51b26ab95e6@sirena.org.uk>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
 <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
MIME-Version: 1.0
In-Reply-To: <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120712_300997_26963DFC 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: multipart/mixed; boundary="===============6531572175969936930=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6531572175969936930==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dNozXZgwSNh15IF2"
Content-Disposition: inline


--dNozXZgwSNh15IF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2025 at 10:27:10AM +0100, Vlastimil Babka wrote:
> On 2/5/25 02:21, Deepak Gupta wrote:
> > VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack

> I see that arm GCS uses VM_HIGH_ARCH_6.

That'll be bitrot in the changelog, it was originally VM_HIGH_ARCH_5 on
arm64 as well but we had to renumber due to the addition of
VM_MTE_ALLOWED while the GCS series was on the list.  The changelog just
shouldn't mention VM_HIGH_ARCH_x, it's not particularly relevant here.

--dNozXZgwSNh15IF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemZ+IACgkQJNaLcl1U
h9DVuAf/dyasNesjmRVNnX4CSTWgbPesYoxwpqTQgKso+9joOZPYPyLvIggnLsC1
o+R1+QnbfVTDXvm+EDZnKplHkrzc7OMlSyqoO0Jhcvho9xR9wHpNaqRTQEMg4vCm
Zg5azVK9vR2hn74CXPkTi/0R39CY3f02oIwZqD8xp7OZ4hjW7cis7E1aXqnos5Xf
ojdS0hRnNNwrxRfdgK6u2APvcBJajWPE2C2I1ogm4eZO6n3ZI2RTSez88i8bShDg
9WGWK5ghGkwKB5tkeXRra2Vvbfs3Wu8RyAY8/X1LKU/8wE2Mrbbk5Cu8E9jbuqD6
Wx+CXrnjrV+x09CkTFzkFq+DBsO2Gg==
=DOc/
-----END PGP SIGNATURE-----

--dNozXZgwSNh15IF2--


--===============6531572175969936930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6531572175969936930==--

