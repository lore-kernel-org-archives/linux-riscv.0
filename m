Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3C0CEDD89
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2dZpFP0dJeUU5UEZDgaO18KB15e4Mlxqlw1gH8fCuk=; b=UoY5shvJ3TY/I155TwthSVtwuw
	XU7ljfEU4FP9vWkmQC6apEyPfwd7Q2kkTiOP0s5peq9+mZ46CYDxZl0xic87QtRKgMc60+GadwBt0
	MeUXzen/2jWVZRe1fnv3CBoQ/Hsgz8ZUIZOmc6Bh2AJ6kWu1GEjJNXLkmmwJ641gxZtMRueOurtFC
	0GbE7xMAqv0ATVYG4uYegNORNCJMcSiFXOZUGvCQLrXj15Yd0xOPg8N8KVWtMBKyQMpPkWWAYR/6b
	nQMd8nkBETDQ0TpUBKHgm5ODolmoo4WnI+2D1x19F37y3szzfvSfW0g3HZsvBiVrzrLjIa2OjYBxz
	pagumqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW3m-00000009GAP-4Am6;
	Wed, 09 Oct 2024 12:44:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW3j-00000009G8h-21N9
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 12:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E8885C5E0F;
	Wed,  9 Oct 2024 12:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9FAC4CECD;
	Wed,  9 Oct 2024 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728477894;
	bh=H8kdm68yh4PjNaTTQSqiK9xUlJdE5SEZL8vV5HEB7bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOg7lJQKEW40/bEO415zN2BipiNrVKXBJ2+6AJ0LyDe1eEgZUcOfEVv8Br6oOMYsX
	 3B/6JS62G0rWlabeOtrYgBLyQbAdzzeEOBiuK92mZAiorw66/nD+XcXkfn9qtL4FT+
	 KN0EnsQrEhwTOt9UoPhpqWnbGNLYj1QMABF3CPXuSJy4xY/xYkCx1aoW2MlmTqMaKC
	 hVufeF9v+RTk+47TEFUKqwVFGedBDVag41dYHoysZp6OUcLYY/N10Lq2B53dlDEIVI
	 nuqkKlzn+w4X44DP8K+IiEw/iYAhfJKl18vtVF42xEUqCB6nuBqh4+H2S/YV8MRfv0
	 vn0qtNlJb8Vsg==
Date: Wed, 9 Oct 2024 13:44:51 +0100
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
Subject: Re: [PATCH v6 19/33] riscv: Implements arch agnostic shadow stack
 prctls
Message-ID: <ZwZ6w1Fu5zt2beRZ@finisterre.sirena.org.uk>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-19-60d9fe073f37@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241008-v5_user_cfi_series-v6-19-60d9fe073f37@rivosinc.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_054455_622380_975BF3C5 
X-CRM114-Status: GOOD (  17.21  )
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
Content-Type: multipart/mixed; boundary="===============4567094331100838536=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4567094331100838536==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5KnydFV4ujRpm3UO"
Content-Disposition: inline


--5KnydFV4ujRpm3UO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2024 at 03:37:01PM -0700, Deepak Gupta wrote:

> +int arch_lock_shadow_stack_status(struct task_struct *task,
> +				unsigned long arg)
> +{
> +	/* If shtstk not supported or not enabled on task, nothing to lock here */
> +	if (!cpu_supports_shadow_stack() ||
> +		!is_shstk_enabled(task))
> +		return -EINVAL;
> +
> +	set_shstk_lock(task);
> +
> +	return 0;
> +}

This will lock the shadow stack settings regardless of the value of arg.
On arm64 the argument is a mask of bits to block changes to.  While for
RISC-V you only support enables so there's only one bit that'll actually
do anything portable code could in theory try to do something like
masking writes or pushes only and get surprised that disabling shadow
stack gets blocked.  For arm64 the implementaion accepts any possible
mask value, allowing for userspace to block enabling of any future
options that get added.  In theory someone might end up calling with a
value of 0 (eg, if there's a config option for the bitmask to lock and
they don't bother optimising out the syscall if the value is 0) which
would definitely break.

--5KnydFV4ujRpm3UO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGesIACgkQJNaLcl1U
h9CoSgf/QkpoT9Wv9XJugV4VDvwAhLMHLTE4q1599RvHVraBUMB4Sk2kckdamajU
gf1rLq5KWESxQNXgMiArCIXUaWaZ95G3TfZYo+2tmZcnyNoQVOc8BqiwgRevA58E
goARRqmt+Dt97Ifxm175SDCvb+va0e6s6t1mM0dwrxEjOB2o8Mk98qp70JhLz5qG
CYOO5V9/8s0xc3D6MHLW+SIg/4x1RdRfvmxZ+xborNttlnZolTTlWkHhuYpYeHFz
GRgGDVYycuo6Nw6IjmBsA1CU68ICHNna9PgvngHCmSJ2oK3NrzZodyEtOmc0wQ0y
gCYvJSj/oECnl39N1bJTiArvCF/HAg==
=Ri8u
-----END PGP SIGNATURE-----

--5KnydFV4ujRpm3UO--


--===============4567094331100838536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4567094331100838536==--

