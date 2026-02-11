Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E26EECD6CA
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkRQeCTzapUSFYnKc2gL4ypYpmiqRGDFzzp543ej4kI=; b=t7io7wFoagSpH4pIirAEmT0kmi
	caWC8E6jiZsQ0+UduJOmf1Ynrvh11VqRIFHPWvQzGHGsd46ufUa9VpHY0mlerXuPpoRuXXLJvpaXg
	pUqpaoLIWyHXLHr5p8Dh74vdXxYUXPJ3GJO2qLbjb7PFyiPifcQ6h3sSNdFCzp3w7TyikMTwm6di2
	wzhu4tDEL0fDss4m4Bt3Srf5pIicDGWKxc3kokaNFMJJ1ZoOat0ef4258ZJbq8gDM/AP8hIbibosn
	TFzYdRG2G7j15005gPL83089180YI3vAQCebQMYiZFOvgN8NB6QBVvYK48CtrkytZTgDGt5JP/cVe
	LM4I2Dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDer-00000000sAN-1yY1;
	Wed, 11 Feb 2026 17:05:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDep-00000000sA2-3MWn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 17:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D09AC40C3F;
	Wed, 11 Feb 2026 17:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD29C4CEF7;
	Wed, 11 Feb 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770829542;
	bh=t7CI+yj3Fr5Xqkb8J8nWZldkzPof4joyVukHWqtE9vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDJ2Q9muRduA6UjMgMHcWcTGrl6hrRRTbQkNLH18mLWWixEjNqzXZCFC08CJH/McZ
	 rxdtZ3OzsogjZXZk1PBvHtO301cf2jwPya8cEQhG43jWNBiB2E/84El3GjQWERGrjl
	 rDPyMEgGa3kAzGlSu1UjSibPM+3W2fEKjmg4lcdnvsIVfYPXaceMGzOcazOyPq8yZQ
	 Ph8RIIW7yQ+UEqXzysr0lO2QQy5D1Vkc+SAHfXuoEVULQpkrBID9Pvgc8X+YTqHQMn
	 03xLjJJ3RJR3zpqNXwxqnkbmiO8Ny6O9i5cU5KT9Suqaeqf845p5dgZwbWrUJtRmmD
	 pf/Z9WqxVuovg==
Date: Wed, 11 Feb 2026 17:05:39 +0000
From: Conor Dooley <conor@kernel.org>
To: seanwascoding <seanwascoding@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] riscv: fix various typos in comments and code
Message-ID: <20260211-trash-eldest-aebdecd512c4@spud>
References: <20260211165827.78574-1-seanwascoding@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260211165827.78574-1-seanwascoding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_090543_901680_E7BC61BC 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Type: multipart/mixed; boundary="===============2055605673031092122=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2055605673031092122==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1psYPQDO/Em2GeW"
Content-Disposition: inline


--C1psYPQDO/Em2GeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 12:58:27AM +0800, seanwascoding wrote:
> Signed-off-by: seanwascoding <seanwascoding@gmail.com>

You need to add a commit message body and use your full name
in the author field.

> ---
>  arch/riscv/errata/thead/errata.c     | 2 +-
>  arch/riscv/include/asm/atomic.h      | 4 ++--
>  arch/riscv/include/asm/elf.h         | 2 +-
>  arch/riscv/include/asm/processor.h   | 2 +-
>  arch/riscv/include/asm/thread_info.h | 2 +-
>  arch/riscv/kernel/acpi.c             | 2 +-
>  arch/riscv/kernel/ftrace.c           | 2 +-
>  arch/riscv/kernel/head.S             | 2 +-
>  arch/riscv/kernel/mcount-dyn.S       | 2 +-
>  arch/riscv/kernel/module-sections.c  | 2 +-
>  arch/riscv/kernel/probes/kprobes.c   | 2 +-
>  arch/riscv/kernel/probes/uprobes.c   | 2 +-
>  arch/riscv/kernel/soc.c              | 2 +-
>  arch/riscv/kernel/suspend.c          | 2 +-
>  arch/riscv/kvm/tlb.c                 | 2 +-
>  arch/riscv/kvm/vcpu_pmu.c            | 2 +-
>  arch/riscv/lib/csum.c                | 2 +-
>  arch/riscv/lib/memmove.S             | 4 ++--
>  arch/riscv/mm/cacheflush.c           | 2 +-
>  arch/riscv/mm/physaddr.c             | 4 ++--
>  20 files changed, 23 insertions(+), 23 deletions(-)

> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index c7aea7886d22..04bc662cabbb 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -59,7 +59,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>  #endif
> =20
>  /*
> - * Provides information on the availiable set of ISA extensions to users=
pace,
> + * Provides information on the available set of ISA extensions to usersp=
ace,
>   * via a bitmap that coorespends to each single-letter ISA extension.  T=
his is

You missed one in this line.

>   * essentially defunct, but will remain for compatibility with userspace.
>   */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index da5426122d28..c571c276b2e9 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -85,7 +85,7 @@ struct pt_regs;
>   *    preempt_v. All preempt_v context should be dropped in such case be=
cause
>   *    V-regs are caller-saved. Only sstatus.VS=3DON is persisted across a
>   *    schedule() call.
> - *  - bit 30: The in-kernel preempt_v context is saved, and requries to =
be
> + *  - bit 30: The in-kernel preempt_v context is saved, and requires to =
be

"requires to be" should be "is required to be", no?



--C1psYPQDO/Em2GeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYy2xwAKCRB4tDGHoIJi
0uWrAP99CzaD/fkJqMJWZtvGcN5LM68bYJWGd6jrNR6YnAmMZAD+NDtSQR34uRqo
OWnQ2gZFKRXZwqtQGGO2L7xvDxjEWQg=
=Uc+8
-----END PGP SIGNATURE-----

--C1psYPQDO/Em2GeW--


--===============2055605673031092122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2055605673031092122==--

