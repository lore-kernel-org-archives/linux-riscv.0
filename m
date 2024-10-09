Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40088CEDD87
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eF8zPP8Jk91hpNcPUG/fG5Iw9Sye9ISKeEfR/QQXPXE=; b=y4R9iKQP3UxAQFqsKDK/raqd6a
	CBBIC3swl/9hNAKYNrZiUILI2BP6PiPVc2c3WN+ZVP8MI+sHUohyoWCpyAgvnjxj+/AhdQGjUtBNx
	/c6STtiD+LJ3duDsYOtE7hj8r+IM1yOeQbF7qvEGy0UQZtD4oMHmUdUCL1V3oRbKv/M4EMnMsoPda
	/NVop3rAVcVT13P3onxQ+Bqbo8bgrELj+tU1nYeU/FrkN8ZKepzjSALL05O061YzbTUkdYV+fGPku
	kuvA3YWYbjZR8Np+8hKSP+qd7Y3v867IqFyqzdN834eMc14KUzBwLUAgyMX6n2AMGqvh+A3a3gC4s
	uhSbPLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syVKI-000000097bt-0u6d;
	Wed, 09 Oct 2024 11:57:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUrQ-0000000941h-2D3Q
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 11:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A24C5C5A48;
	Wed,  9 Oct 2024 11:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B6FC4CECE;
	Wed,  9 Oct 2024 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728473286;
	bh=dWTLORjqnX0opGzmksVLTfrOi3GuFaEPiMCBg13ML94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESNF0aTxqPGkFJ5uOkrMRuhf0nlBFaTeES0hVQIDeqopdDRPJVAzKH0+3aSdmILae
	 vtwodVcPPDS7pgfpH1bBd3bVJLwIgc+/7SdrGpDphN7VxRcaGiAok6K0I7+QlU8n6J
	 +sNtUViL66G8sWAvpOYUcNcMVlS1wPbgmFu4exaCJwNH4If+V8t55jrp7xC5O7KEGU
	 puQWxirrHiL8pa8xl5cqNc09b0XVmRU882HBh9wZOTRb1Ity4/rNiN2fH27v5lE7xc
	 BMLj2LN1Zcyy1BgDa51Cq6vQsXvhkpiTCMyuTqkxbgmKXqmG5/aAhu8Mk4DYFedsfF
	 vJ19Vz3FHtsXQ==
Date: Wed, 9 Oct 2024 12:28:03 +0100
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
Subject: Re: [PATCH v6 06/33] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Message-ID: <ZwZow-L3d_ZeONvq@finisterre.sirena.org.uk>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-6-60d9fe073f37@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241008-v5_user_cfi_series-v6-6-60d9fe073f37@rivosinc.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_042808_693745_4BF36546 
X-CRM114-Status: GOOD (  12.07  )
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
Content-Type: multipart/mixed; boundary="===============5403850901988746442=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5403850901988746442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/9TOr5Y7hc2IlgPC"
Content-Disposition: inline


--/9TOr5Y7hc2IlgPC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2024 at 03:36:48PM -0700, Deepak Gupta wrote:

> riscv will need an implementation for exit_thread to clean up shadow stack
> when thread exits. If current thread had shadow stack enabled, shadow
> stack is allocated by default for any new thread.

FWIW both arm64 and x86 do this via deactivate_mm().  ISTR there's some
case where exit_thread() doesn't quite do the right thing but I can't
remember the specifics right now, possibly the vfork() case but ICBW?
In any case like Rick said factoring out the common patterns would be
good, keeping things aligned would support that.

--/9TOr5Y7hc2IlgPC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGaMIACgkQJNaLcl1U
h9Bs/gf9HkwcB6ukqOUKkOcYZY6n2S7Ff9T2G7eFz/ljV9gwDrw11zKI1p4fKARy
gsDFv12wYltPNps64PSegFC4tGyb/8zKIBD59rx/dGB3YWqWj1pf8NRcuaz/e9d1
9CEu2M/MTcoJi7Qvy6QV8rnWvyzcjsSIsDVfLUnKuFlsXdDQsEO4wqpVGTl7rQbY
2SKHvMozADQAumDuaffjOMn+fZhriCKhVgUBRXgknSBRdCVDm4uhx1QVWWQ9hqS/
tCieIUs0gB3WbL3znar2cMjWT1QQJODw58V0/j7+VJVZFMhxBItdY9UVvgjyDOe9
q+3j1W1soyWnVa895qI78ooiYZcR0A==
=7QkF
-----END PGP SIGNATURE-----

--/9TOr5Y7hc2IlgPC--


--===============5403850901988746442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5403850901988746442==--

