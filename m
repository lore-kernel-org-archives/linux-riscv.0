Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C5DC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YN0K+TJN/3smjCbrXJEMaqMhPTuygoD8LlK3i+mRx7o=; b=YB0he6snlSyzJZ
	LzJqFXgh4DR22bEZugivocdGfgZXuAFq+rejqu/6Hjeg3cXLp5hrAm5g8RuXn9dlfsjFLaLeEDkan
	CrJ6HkHKRMllKFJ0Mbu0eVXBMc9JuzAXFooBnm+FBQSm6gKa2atRXytL6qvOm2I5YQZabT/E4WOyQ
	9tAYydPTkmytWrMPft6AoKKVMmhil6fnBv+JivPCC+t6HVqV51aroVVfu+hQyn4/94cfUzCrkr72Z
	WQ92p9SgysT0lJrkuXOhY03dB0j5NG+CzzMkDBUD5gz0pzJAce8gq5l1GyeQ/VB5tevMg3xQaehAE
	+mz3KULlglIxHqREYrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqS6-0000000Dalv-06wy;
	Mon, 06 Jul 2026 21:02:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqS4-0000000Dall-2WE8
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 21:02:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D22E402D7;
	Mon,  6 Jul 2026 21:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FDC1F000E9;
	Mon,  6 Jul 2026 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783371723;
	bh=YH94RBJ5oQWvPJxqF2lGknMcip56J1cYwGtMmIQc6zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlhEw/ctTtp3dv24zUaovOm+XpVqLihb5HsRRIpxaYCPrPgxi/MeJcHlUOLnQe3CP
	 kH36SRATV/zWbKeZn/q0YDpQHTeMsmxbBAFnwNXhiI3ijOydR/4tttbtasf+P+zM+B
	 re6lokUPzapg9CeGQ064v2EU9YCLMPu3XEb5MQserHK6avQki7PRuLY3qsT1/zK+O6
	 ZMvi6i1HNLPIPmkMdQjTQPhSZBrvSdreOGuukGqHGwrmDtxvetav8Il5D7BZ1buXbg
	 3Zfr5LyjXsLDC7GLcB5XnH7s9JSarGEuErPA11b4FEWcy51V1fyCfmYDOANVmd7ZhQ
	 24gdMzeeMFU1w==
Date: Mon, 6 Jul 2026 14:01:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Wende Tan <twd2.me@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: vdso: Do not use LTO for the vDSO
Message-ID: <20260706210158.GA73349@ax162>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
 <20260701-riscv-vdso-lto-v1-1-89db0cd82077@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701-riscv-vdso-lto-v1-1-89db0cd82077@linutronix.de>
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

On Wed, Jul 01, 2026 at 11:21:22AM +0200, Thomas Wei=DFschuh wrote:
> With LTO enabled the compiler assumes that the vDSO functions are not
> used and optimizes them away completely. Currently this happens to
> __vdso_clock_getres(), __vdso_clock_gettime(), __vdso_getrandom(),
> __vdso_gettimeofday() and __vdso_riscv_hwprobe().
> =

> Disable LTO for the vDSO, as these functions are hand-optimized anyways.
> =

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606301855.WvkSC4kD-lkp@i=
ntel.com/

While this change seems correct, is this really the fix for that report?
It seems like that error happens in clang but I would expect this sort
of issue to only appear once LTO has run through ld.lld?

> Fixes: 021d23428bdb ("RISC-V: build: Allow LTO to be selected")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/kernel/vdso/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Mak=
efile
> index a842dc034571..43ee881f6c6f 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -69,9 +69,9 @@ CPPFLAGS_$(vdso_lds) +=3D -DHAS_VGETTIMEOFDAY
>  endif
>  =

>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_getrandom.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_hwprobe.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(C=
C_FLAGS_LTO)
> +CFLAGS_REMOVE_getrandom.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FL=
AGS_LTO)
> +CFLAGS_REMOVE_hwprobe.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAG=
S_LTO)
>  =

>  # Force dependency
>  $(obj)/$(vdso_o): $(obj)/$(vdso_so)
> =

> -- =

> 2.55.0
> =


-- =

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
