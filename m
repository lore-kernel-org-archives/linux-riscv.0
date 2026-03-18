Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA6F10775E1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6eHAPCD4+gmAKtX3zojD6R8n+7tco2pMoAo/EGhuWA=; b=U96+VATeEmFK6+
	0RfO0+lr+ES64zccjkcMljhkCqVa0V8PFVsvDPmwtIzE+tliy0KjKUbNlDKkTUvWXkKtydYcduPiU
	Kd0n0JP2iDzXT2EC6kuOWXhgE1upfrdx7FRzO5AYPPlDwvJJqt7pY7f6GXktsxfg1mgfmwVbczg5Q
	LcJ9/IYEVzJK7v27XxKDE2Qy1jWhIBsH6QoEmv+gpS9lKb1re3XgvN+psThtzXdK+eJ849UHGFiTs
	gvlO1mK6V33/+XaJ3YBZlRKaoXVdzYaq79Jr2fGpTW9Lk2W3oc9Qk05lpApn9E2WzAo4JxO4w0AQD
	uiVfZGDWavJBCaNm0p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tfC-00000008ueT-3OYD;
	Wed, 18 Mar 2026 16:22:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tfA-00000008udm-0kCT;
	Wed, 18 Mar 2026 16:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A99260097;
	Wed, 18 Mar 2026 16:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC48C19421;
	Wed, 18 Mar 2026 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850947;
	bh=FGNSu4DlIfiUMZa5ZkmaJp/QIn2lggE4u2Ndygv6FBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpeluXyxDsZzF3NAmckdqJwpVkaAqttUopjBMOigcEjrW9PG4hOk9bFNjIu2+1hu1
	 IcsDTmGhCVATBRixcmNQQhBpayz2AxBxUoh+MbYsjRcLuorNTLiwBf6/k0JgHJn6Wz
	 raA3nLiznqIL8OBq0mPUTLKCPd5eb3Bv2V64KLPcxM+MrRFRw5yx4UwmNfiJttbMZO
	 J7HUEZM+SLsx9D5/aRBj0upZmqFXxEgFHzFGt2zHtfm6J4HCe4vfApVE0dgUg61GmQ
	 0lp53wfP1tgknNDPDCf1MumSabgXnKYpdnqZftaDNWH4frl/QojAulg09IVXxCoww0
	 l5WkFd3jbD+kg==
Date: Wed, 18 Mar 2026 09:22:26 -0700
From: Kees Cook <kees@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org
Subject: Re: [PATCH 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Message-ID: <202603180921.1B52D626@keescook>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 02, 2026 at 01:25:24PM +0100, Thomas Wei=DFschuh wrote:
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
> =

> Move the symbol to kernel-internal headers.
> =

> Meant to be applied through the asm-generic tree.
> The default recipient list was huge. I trimmed it to only the
> architecture lists.

I don't see anything in Debian Code Search that actually uses this
symbol, so that seems fine. Userspace already parses auxvec looking for
AT_NULL, so length isn't useful.

Reviewed-by: Kees Cook <kees@kernel.org>

> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Wei=DFschuh (15):
>       MAINTAINERS: exec: Add more auxvec.h variants
>       auxvec.h: Move AT_VECTOR_SIZE definitions to linux/auxvec.h
>       asm-generic: add an in-kernel auxvec.h header
>       ARM: drop custom asm/auxvec.h
>       x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
>       auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH
> =

>  MAINTAINERS                              |  5 +++++
>  arch/alpha/include/asm/auxvec.h          |  7 +++++++
>  arch/alpha/include/uapi/asm/auxvec.h     |  8 +++-----
>  arch/arm/include/asm/auxvec.h            |  1 -
>  arch/arm64/include/asm/auxvec.h          |  7 +++++++
>  arch/arm64/include/uapi/asm/auxvec.h     |  6 ++----
>  arch/loongarch/include/asm/auxvec.h      | 14 ++++++++++++++
>  arch/loongarch/include/uapi/asm/auxvec.h |  8 +++-----
>  arch/mips/include/asm/auxvec.h           | 17 +++++++++++++++++
>  arch/mips/include/uapi/asm/auxvec.h      |  8 +++-----
>  arch/powerpc/include/asm/auxvec.h        |  7 +++++++
>  arch/powerpc/include/uapi/asm/auxvec.h   |  6 ++----
>  arch/riscv/include/asm/auxvec.h          | 13 +++++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h     |  2 --
>  arch/s390/include/asm/auxvec.h           |  7 +++++++
>  arch/s390/include/uapi/asm/auxvec.h      |  6 ++----
>  arch/sh/include/asm/auxvec.h             |  7 +++++++
>  arch/sh/include/uapi/asm/auxvec.h        |  8 +++-----
>  arch/sparc/include/asm/auxvec.h          |  6 ++++++
>  arch/sparc/include/uapi/asm/auxvec.h     |  8 +++-----
>  arch/x86/include/asm/auxvec.h            | 12 ++++++++++++
>  arch/x86/include/uapi/asm/auxvec.h       | 13 +++----------
>  include/asm-generic/Kbuild               |  1 +
>  include/asm-generic/auxvec.h             |  7 +++++++
>  include/linux/auxvec.h                   |  5 +++++
>  include/linux/mm_types.h                 |  6 ------
>  26 files changed, 139 insertions(+), 56 deletions(-)
> ---
> base-commit: f6b3b0a4c85882ad75bce3b093173203e3f39f28
> change-id: 20260109-at-vector-size-arch-6e0f2e9ff8b6
> =

> Best regards,
> -- =

> Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> =


-- =

Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
