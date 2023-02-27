Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B33C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWQ7mA+CGfL5yGQkx7q9aEU2rOys/o3V7W4WzXGg4VY=; b=Xysj9BBdPwRCRyW4ViN75+bIoU
	fqsgPUwBOdLCTpNfF00i5N/fQCYo/mMbH0RAAGIqgpd2Am93tbT/JCmUNXphq/0W60MmLhewDNr2l
	UiK32Bs3vN2hZGzZNQVp9G8Oll6+HqOwXNRVIZT17g2rGESPLfEgTff6H9l9aix1BFnuo1l6893Uq
	Oqz//2rOSpwb0yRB0c2XcIBQeExRHTDof5SwMYpe9a/HMXG9VtxxdV8PlGD1oqr4OWjB3kQDz/DhN
	6PBwr03e3gF2Z/25wVVqARBBsGQauy4hnFlY9jmL+CbTsmBg3OQKPg5FrtXrpbwtwYLBVe7QNcTuM
	LcAgfZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlqr-00BQ3j-Op; Mon, 27 Feb 2023 22:20:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlqo-00BQ2Y-P3
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 22:20:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6C88BB80DBB;
	Mon, 27 Feb 2023 22:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37953C433D2;
	Mon, 27 Feb 2023 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677536402;
	bh=BRZW2CPrqrzUKqLHGgsYAAf75xiDMUePxhcVBDQ50pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtEEb0u0cDuEahRcqb9OMSBqgaL5tpKzJq5Wbx2VCEvo1ldHuwxfzrGk1A0hmhPil
	 e9DFyF3oF1hwfyFzk28JSCP/JsQ3IYbB2MeC9YdekJRUxLfaB0RViWYaD76tmv/+yP
	 1SO4wXd8qDkeZQ7UORowt/LCfZEzpuJnWi0hbQi3c7XtQ6OHi29ocAydB4o/Y7lR2n
	 0bCPnDYtpdNfYPhZi/XvaglhCpHr+nDtS8aCfGZHbFAaNd+SO96Wl/XjxOm3e6cp0I
	 PrKHh2iK38pYfRwiNcqLPqKwNM2y8+XsAK0RZVE+bpKeiABf9YG8wPJfDufu1I1VPn
	 w3uRE9gK5NYMw==
Date: Mon, 27 Feb 2023 22:19:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v3 2/7] RISC-V: Add a syscall for HW probing
Message-ID: <Y/0sikPIVR3j7cKI@spud>
References: <20230221190858.3159617-1-evan@rivosinc.com>
 <20230221190858.3159617-3-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230221190858.3159617-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_142007_128048_5ACB7EBD 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: multipart/mixed; boundary="===============1582590246957843204=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1582590246957843204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WERgPH8NLamXNLLe"
Content-Disposition: inline


--WERgPH8NLamXNLLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 11:08:53AM -0800, Evan Green wrote:
> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> system call that quite does this, so let's just provide an arch-specific
> one to probe for hardware capabilities.  This currently just provides
> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> the future.
>=20
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>

> +static
> +int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
> +		      long cpu_count, unsigned long __user *cpus_user,
> +		      unsigned long flags)

I almost feel bad commenting this, but this is now the only function
split like this w/ the static on its own line.

With the same caveat about ignorance about glibc's desires & lingering
doubt as to whether this interface is the right way to go, this looks
good to me now.
I'm reluctant to give an R-b for the latter reason, but assuming the
Higher Power deem this approach acceptable:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--WERgPH8NLamXNLLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/0sigAKCRB4tDGHoIJi
0sB+APwPbrJoN2ZTjbu9wQhfhdvGJ5YTQBDL1iNUak2khoxEtwD/d1Mt0NmZaWq9
vtXIm6otTg5BOlzMVEZ1+eEce/1G8QI=
=cgIn
-----END PGP SIGNATURE-----

--WERgPH8NLamXNLLe--


--===============1582590246957843204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1582590246957843204==--

