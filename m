Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4979FC71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1n2SPcSMbvaFXg7F1C+Ow6UdHJD8MDuz5vFj03GBHMc=; b=eC1dXgKCYu7XMM
	l8pPm3FuQNcvyaE4q6oRD0aJmVjZvMaSR6Syt4sADPrI+H2mgvxto8fCB60e8AWVNwTmnNNn0i4od
	2RVx31HEeMNs33AOn3nLgAOW2+32+UxnWBsZ0+LTSfl+GCNTo+QcrS2SrZq+endZ9rp+BsRKYgqhY
	gaCO/9AMeKZoSgZwDwqsNnmelDaZvaXB8+uCFVtFa6tGbhCWgGc2dZPXWZBdxPX1ma623MbjWk0R8
	SJ202v1LOjnIh+3Yc8tOcN3BWPUsoFjeocvSOcTDL1QGKINAEW+k74hq8ZktKsiyO6zBBYkdAS3Ga
	4lCAyU+3kuSV0rxh1SBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSsS-0000000BIcL-3x3f;
	Wed, 11 Jun 2025 21:20:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQN6-0000000AtGX-1kwI
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 18:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 230C043D1F;
	Wed, 11 Jun 2025 18:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7B2C4CEE3;
	Wed, 11 Jun 2025 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667224;
	bh=OYZ3IBW7iSebcv5mN2/PuO3N2mNLKbX+gEmihh5UK9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5R/mwt7cCu9NIPBBfHKXspsm/RHqc/ioVM2fEuYVCisCrJl4qsvvwKzLZakh4n2+
	 O0XxiO5XuqIIY+DbV84jcyHxy/H+bxjZOpj+0179fnLE+n6eiseg253l9D/uL1wHrx
	 XmF3VcnVt2lsyGlvDWABuieNM/+2CWwpTuIXSFORwKdD6jmyjcV1qoAT0xnElz4iV5
	 p66q9+Ua0kcaLHs6kfsNwGtzTPOKY2IW6zEtTVytTzoFBq/NAo4DK2DYmIUx/VnEGl
	 /M4ggdU+bfhYGhWFxSh94jDaJUTpIHxHGnKQPalXRN+MrlfKzl9Pf4ImJBt/Lz9qPN
	 DwgcFzwLkw1gA==
Date: Wed, 11 Jun 2025 11:40:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/3] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
Message-ID: <20250611184018.GA2192624@ax162>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-1-47897d73784b@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-vdso-absolute-reloc-v3-1-47897d73784b@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_114024_474346_F6D9AC42 
X-CRM114-Status: GOOD (  13.64  )
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

On Wed, Jun 11, 2025 at 11:22:12AM +0200, Thomas Wei=DFschuh wrote:
> All vDSO objects need the same treatment.
> To make changes to both the list of objects and the list of removed flags
> easier, introduce a helper variable.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/kernel/vdso/Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Mak=
efile
> index 9ebb5e590f93a3228c451dca58e6d5cfbbc03ff7..c19c3c76f7c9f6b2f7523a592=
69de3b683656323 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,9 +49,10 @@ CPPFLAGS_vdso.lds +=3D -DHAS_VGETTIMEOFDAY
>  endif
>  =

>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_getrandom.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_hwprobe.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_vgettimeofday.o =3D $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_getrandom.o =3D $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_hwprobe.o =3D $(CFLAGS_REMOVE_VDSO)
>  =

>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so
> =

> -- =

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
