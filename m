Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957E4C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifEtDVnabwQeA/rJzu5nc/1L17ZnIVI1vjA6Tn2tOlE=; b=EUaaZL8eqKSuwgji0TuDdhqIiz
	gBBvFqFDQg8FN2TDD70T1UOtpTQUFTblo5dtpkMRS8ViEl3xwOygl4RWpoDoORSjEQxOwTzidFD+j
	r+4zI1yyReHOqXUFbCDUWYbYFdr+RQMctTRn8BO+oh/kiT+ccuF1jgEZkedQSmUbemOimRf10BmY8
	eJ691nIpz9SJrOcvUsS2Pkx4ilDZvRnPsLqS6tl38IJV/TNDQNO5biwtQNltuYC6L/Y9jif0S7Tzv
	GFAhqBqob8JjVxJ7zBjYuaTJeIr+jHw/TZ64dt+dxrmHv8iUxCzhyiMRGYfFy+j4tZ77amwRBsHLw
	vYPAJvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT45l-00000001Fsu-0FTV;
	Thu, 25 Jan 2024 18:04:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT45i-00000001Frh-2hOs
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 18:04:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D24A261503;
	Thu, 25 Jan 2024 18:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A08C433F1;
	Thu, 25 Jan 2024 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205881;
	bh=WDKiWZF/CO1jOYkvrWCm5fjBFh98x/VbgkhxOL64aJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8+ilI+rArrGEQzPOKxpm2KS3wnWPXl81DIQIIVlFks4XkUWeCCYLnv2W1QOtXMH7
	 vxZxdNzGTgI5Ck6OrV+3PtZNm8Cr5WmRLPPVQcrGnWkkUSAu1d3v3XE2hVMJZ0m9He
	 iD1f44ZRSJJgs0xN+T5HI7H5rxVDgR/KYt90fxsf1ZKe9ZQZMRjMC418rbZF1Jcup/
	 jSkG8NJUt5s3pNBKI69IhDV3sAr3XfzL+Cq4zJGEx4bc4nPpBECZySU7/hCjLo8m9L
	 32n4SQxsAE7RgeGLlnFvEweH44zMFp5oX7ZMLwG65JW0diChuZZSzVja0gYDOCJ15k
	 mVK8beInkEYYw==
Date: Thu, 25 Jan 2024 18:04:26 +0000
From: Conor Dooley <conor@kernel.org>
To: debug@rivosinc.com
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 24/28] riscv: select config for shadow stack and
 landing pad instr support
Message-ID: <20240125-snitch-boogieman-5b4a0b142e61@spud>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-25-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240125062739.1339782-25-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_100442_820101_D6D07038 
X-CRM114-Status: GOOD (  21.85  )
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
Content-Type: multipart/mixed; boundary="===============1095542182147618763=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1095542182147618763==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NUnGWzqhiv75TmQp"
Content-Disposition: inline


--NUnGWzqhiv75TmQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 10:21:49PM -0800, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
>=20
> This patch selects config shadow stack support and landing pad instr
> support. Shadow stack support and landing instr support is hidden behind
> `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires up path
> to enumerate CPU support and if cpu support exists, kernel will support
> cpu assisted user mode cfi.
>=20
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/Kconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 9d386e9edc45..437b2f9abf3e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -163,6 +163,7 @@ config RISCV
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
> +	select RISCV_USER_CFI

This select makes no sense to me, it will unconditionally enable
RISCV_USER_CFI. I don't think that that is your intent, since you have a
detailed option below that allows the user to turn it on or off.

If you remove it, the commit message will need to change too FYI.

Thanks,
Conor.

>  	select UACCESS_MEMCPY if !MMU
>  	select ZONE_DMA32 if 64BIT
> =20
> @@ -182,6 +183,20 @@ config HAVE_SHADOW_CALL_STACK
>  	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e=
6eeb51f0cb7b8819e50da6d2444d769
>  	depends on $(ld-option,--no-relax-gp)
> =20
> +config RISCV_USER_CFI
> +	bool "riscv userspace control flow integrity"
> +	help
> +	  Provides CPU assisted control flow integrity to userspace tasks.
> +	  Control flow integrity is provided by implementing shadow stack for
> +	  backward edge and indirect branch tracking for forward edge in progra=
m.
> +	  Shadow stack protection is a hardware feature that detects function
> +	  return address corruption. This helps mitigate ROP attacks.
> +	  Indirect branch tracking enforces that all indirect branches must land
> +	  on a landing pad instruction else CPU will fault. This mitigates agai=
nst
> +	  JOP / COP attacks. Applications must be enabled to use it, and old us=
er-
> +	  space does not get protection "for free".
> +	  default y
> +
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT
>  	default 8
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--NUnGWzqhiv75TmQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKiqgAKCRB4tDGHoIJi
0vKGAQDVTVByG7JLLR+gPjsKjLHdPRWsvjnTta2HP7StCen6fgD9Eq3Uv1oej4Qh
QiRGb9e3PxfM9z73zB+grxPynuwKxg4=
=TScR
-----END PGP SIGNATURE-----

--NUnGWzqhiv75TmQp--


--===============1095542182147618763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1095542182147618763==--

