Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE15CD4F49
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 04:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdjCcbVqvXly65abxrzv3/WIBD6Y5ruD3aV1HGUV4eU=; b=KuYGesxZdx08nf
	k/taFarjmYXcE4bNNAbIyL49NwapbOjfCRY+voTCP1BfZ0yzUh6+ttnUWD726z9LRaZzvfEF/y0Oc
	dGWPbujkib5tQ1ZT5V1LfL+fTpeWoabe0hWjyjjT5tCZBe4yWpTn7VeOB7uCwJnhwXzB+x/v2StvI
	L8lxHpN2ePB+zj6nX+0kwop/U5UZo7eqkfeaCIoI1oEkXJuC+dy1wpgNc8Dj+QQ+4yXsAmRYYPu7x
	v1HFvqVCNvdUVc85TiGwmDTt53kRDZ1ycGGtDLJ/aDVcHCBxPp4msN147JTRYKG6h7/tcOgVt8jLP
	jds2VmzeXUJGFdaHDaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlTB-0000000BY4D-14SQ;
	Fri, 14 Nov 2025 04:31:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlT9-0000000BY3t-2qFs
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 04:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F24E640483;
	Fri, 14 Nov 2025 04:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FCCC116B1;
	Fri, 14 Nov 2025 04:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094690;
	bh=uLMghE7ydDQjNwo+3JIijtmU11kVbvrP2zjXCZJb08c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdpqxCxOi3xQvATJP2BCYK6hrOnP9R5cYiNjQHQBPz9oSNHH7ro5W0uD4gZ+648jL
	 tj/JiY+prRTx+D1vt7Nz03pusbf3dGGKQ/6fz8PjKc2IFtrPGR8LiFBHwCQAry7Qxw
	 mUlnsbsazRxcrQsUDznTlpORXe/+nncE/B8pCnioxZdSgbJxELm6QrmNLgwF7zE6JN
	 Pxrux4Sfz0nwhoWSODtDr5mAaxx5p3/gYBHabHsDigfml2sd+mb2qnOTPK1knulMUy
	 ZZsk2NqRLRvBZUvbtbYTeA0D2tZvVb31byZFt1gt6cvBxxiIOcPjfEdc4KCJuIPl/q
	 ZHNAlCJu1LZsg==
Date: Thu, 13 Nov 2025 21:31:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <20251114043122.GC3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_203131_774096_D195C782 
X-CRM114-Status: GOOD (  18.65  )
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

On Tue, Oct 14, 2025 at 03:05:18PM +0200, Thomas Wei=DFschuh wrote:
> The generic test for CC_CAN_LINK assumes that all architectures use -m32
> and -m64 to switch between 32-bit and 64-bit compilation. This is overly
> simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
> also require byte order handling (-mlittle-endian, -EL). Expressing all
> of the different possibilities will be very complicated and brittle.
> Instead allow architectures to supply their own logic which will be
> easy to understand and evolve.
> =

> Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
> to be implemented as kconfig does not allow the reuse of string options.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

Modulo Nicolas's existing comment about CONFIG_ARCH_USERPROGS_CFLAGS:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile     | 13 +++++++++++--
>  init/Kconfig |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> =

> diff --git a/Makefile b/Makefile
> index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bc=
a4c90db435ecdbd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
>  LDFLAGS_vmlinux	+=3D --emit-relocs --discard-none
>  endif
>  =

> -# Align the bit size of userspace programs with the kernel
> -USERFLAGS_FROM_KERNEL :=3D -m32 -m64 --target=3D%
> +# Align the architecture of userspace programs with the kernel
> +USERFLAGS_FROM_KERNEL :=3D --target=3D%
> +
> +ifdef CONFIG_ARCH_USERPROGS_CFLAGS
> +KBUILD_USERCFLAGS +=3D $(CONFIG_ARCH_USERFLAGS)
> +KBUILD_USERLDFLAGS +=3D $(CONFIG_ARCH_USERFLAGS)
> +else
> +# If not overridden also inherit the bit size
> +USERFLAGS_FROM_KERNEL +=3D -m32 -m64
> +endif
> +
>  KBUILD_USERCFLAGS  +=3D $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPF=
LAGS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS +=3D $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPF=
LAGS) $(KBUILD_CFLAGS))
>  =

> diff --git a/init/Kconfig b/init/Kconfig
> index 7b722e714d5c5a0580467914b226dc0700ec0797..4a2ae3cfbf26525a60936d9b2=
9a74ef4319ba3a5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,8 +82,12 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
>  =

> +config ARCH_HAS_CC_CAN_LINK
> +	bool
> +
>  config CC_CAN_LINK
>  	bool
> +	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
>  	default $(cc_can_link_user,$(m64-flag)) if 64BIT
>  	default $(cc_can_link_user,$(m32-flag))
>  =

> =

> -- =

> 2.51.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
