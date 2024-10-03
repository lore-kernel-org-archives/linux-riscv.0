Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4789ACF857A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HHFDVqnedcb4K8cUZYeuxyKTYX6lct5gVI+Bp51nVI=; b=YJWIK87du38CoHm0Ky3J+C8Ppw
	yf60ANKepYvcnVfcBNGIGZ5FsOapWI7Kz1hqlIXqdjB8wpJ/UAvZ7PFr4i3fw93t3TsNhe2DFBP94
	JhAHECTOE5iP/1P9ybBZlrz6mATiOyMm10di4u854YgCpD21+RlQ6qHyD6U+FFH2L2b6hNAJs/b/1
	D7qIPwOXoF53nRrMXMuJP7oD8y87Jg76LCz1g7v5oqRrKLoe7OUrYydigXEDvQd6WkhnGEVuch1KS
	M5wk8D2XX0y+gSPwF02QDl9SN9PU2EzScxp0cnNc3X9XzI60ZL/39/qKIsxjE9OErCSyrTX3zzGtn
	FVGS49pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swJcJ-00000008r0R-0sHR;
	Thu, 03 Oct 2024 11:03:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swJcD-00000008qy2-3cgx
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 11:03:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF8215C5BE1;
	Thu,  3 Oct 2024 11:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EA9C4CEC5;
	Thu,  3 Oct 2024 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727953404;
	bh=df2Nbj/hqQVIrGa+4waYwuDbuQZWuWu1AE+VTeU/f70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qi1kM4A+RaAdIARpZ5o6qFW04lMQITGmFeI+Agv1TzuVt+oC5bw6dyO9QGVzZc+yA
	 vHwVYzgRyMie6OKvDhY9mlziKIX0IQdHhu5SPfMBOAU5iC0/prGGR44vzImFHiTspW
	 WygKX3YTf8TbnIRWhBnwzrHjnLX6yypHAYSaKPKODk0PVnasgSrvF0npsCFfObBbtB
	 ZnkfcD738tVwS9ipJwD4mmvpU8YYs2+E7F1Z451dZR5iCIsvTp4dJLn7sGH752lEq8
	 o5GOthWHPR7petJ9P1Kpbm1rovHNYXteZoZqcJpoKP4G2M6hKGZpmklHWwozfbuCOL
	 8bGZhf0oO4skQ==
Date: Thu, 3 Oct 2024 12:03:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
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
Subject: Re: [PATCH 33/33] kselftest/riscv: kselftest for user mode cfi
Message-ID: <b4347055-46f7-4e06-b484-bbf147b80fe4@sirena.org.uk>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-33-3ba65b6e550f@rivosinc.com>
 <fdf602e9-a8b1-4f62-9e26-bb62a7202d22@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <fdf602e9-a8b1-4f62-9e26-bb62a7202d22@linuxfoundation.org>
X-Cookie: I'm into SOFTWARE!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_040326_001750_6A620D2F 
X-CRM114-Status: GOOD (  13.71  )
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
Content-Type: multipart/mixed; boundary="===============3327628303911288882=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3327628303911288882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kAfVHLmbYIIytvqg"
Content-Disposition: inline


--kAfVHLmbYIIytvqg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 02, 2024 at 05:18:36PM -0600, Shuah Khan wrote:
> On 10/1/24 10:06, Deepak Gupta wrote:

> > +#ifndef __NR_prctl
> > +#define __NR_prctl 167
> > +#endif

> > +#ifndef __NR_map_shadow_stack
> > +#define __NR_map_shadow_stack 453

> Why do we need to define these? Shouldn't including
> asm-generic/unistd.h sufficient?

We have this issue on arm64 as well, there's some issue with directly
pulling in the asm header interfering with libc in some situation (I
can't immediately figure out which situation or which libc to remind
myself what it is though...) so we've got local defines like we do for
the NT_ defines for ptrace.  I see x86 is doing the same.

--kAfVHLmbYIIytvqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb+ee4ACgkQJNaLcl1U
h9CFRQf/ZisHmPhxTo4GA9gvOyCclGJtTt5XbyRTnPd3KzS/hDF/0q+VpUbmWm+Y
SmcaycdcESUg9VOXQZorDB8+tK3kaP7Sg2JmpaLB8yoKfuO3t/rVL6pt/vCKLlgX
qwzZD6zQUDZlBt0SteGmZnXzHDKpjNrYf1MQdFSHYVkJSQCCnvPV0u2FXZVYj9Bb
Jz/PNuyt9uexrRqPrBsbIKJcJUHREFq6SR1NYDMReO+lyYD8xLkKmXPH0K55C870
FHSWZIUGQB5Lt80AJmT/FQrXn62k7+91Nalz/CyYtaqH/RdFHTD+mBkJtSs+c1gC
i/L5TsJAiSLGEZl9I4rSRniStmUSlg==
=2Xkh
-----END PGP SIGNATURE-----

--kAfVHLmbYIIytvqg--


--===============3327628303911288882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3327628303911288882==--

