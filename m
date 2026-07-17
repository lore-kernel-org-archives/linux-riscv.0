Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D15C44520
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xttyhr17t7bzfi6TCcvJqUuKaGnE5KmsynQJ/OnAlus=; b=nJ9hWBYxCnbyAG
	Kh67MtyIBFTyUUmm6VgbLnya+P2zyoemfxMuxTCiwejlXGd6HtRcC1JctMziR/znqYjmzbs9aoh56
	ImEMANOTdL5zBvpn779qxDCeI68bqPhkND+xy0zuAIb+HW8U5iEAJOfAiHDviHdrgA9MrUhPpQ/KO
	Ag+jS3Ea3O2AcclWwRkyLz1WVARNbygOTZf4k2T4rIlWXU24LcCl6ZDELHHYGrJXpnv72QljHVDzE
	fM3FsYJ2eI1gxRSJyTu+O2lcOTttLf3MZOCvr+7NOmAzHLjvvnrh59zoO+tcoedDyM1pSzTrU0Yup
	4dyqu7Y93wVKpbPLWUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhVk-00000002GNP-3hm9;
	Fri, 17 Jul 2026 12:17:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhVi-00000002GLv-2Nyv
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:17:47 +0000
Date: Fri, 17 Jul 2026 14:17:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784290661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibVhgsWjkXoyH1Syk0ZlT548tj/XmYrev47NfVpzb84=;
	b=GzYkDD08LoI/xNO1ROFLcdZ0A/nuyhNTY21P12rKW+WamlI4YxWb2ECTidKuRd9bhRfxqg
	fwPAP/GjNoThWqRigf/UsLvDbRaUDWJ/8VYSuDIwLCqAEsIYudr6ANy0SnMA4Xfnp0YOUN
	PksPE5Vd+F5JI2PSCrWWDl2gm3pCxmgQZrhDXGLwJZKZ7NAgi6PNIfuHsCsf2lm2lRIJTD
	raGisL4Xy/QP4NgOpM/Xoms83k/M5kT3w40Lp39rwJrI7tShK/IlvTQUDJTSiPeK2Meybz
	AIa6+5abkgvnwgWTQ+HEL86wHfeLFqZBb/ciFRZgz8Q9yIKiy/BCi318WRn2RQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784290661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibVhgsWjkXoyH1Syk0ZlT548tj/XmYrev47NfVpzb84=;
	b=LhP4br99Hh+CSYJU635kAzTTfjny9kczfAImoUu5lQJsdkcl14KFabTGhPjlVO3HVNlDXy
	XdEJb2T+Nf3nIqCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 1/5] riscv: compat_vdso: switch to standard kbuild rule
Message-ID: <20260717141554-40e39be5-49c5-4e1d-943e-0fa61d159863@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <0bf254c6a3a6070938d78bebddd67b3093ac811b.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0bf254c6a3a6070938d78bebddd67b3093ac811b.1784274927.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_051746_746097_A2F9B75D 
X-CRM114-Status: GOOD (  14.20  )
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

On Fri, Jul 17, 2026 at 10:06:34AM +0200, Nam Cao wrote:
> The compat_vdso Makefile has a custom build rule for *.S files. This
> is unnecessary, and makes it hard to extend this Makefile to support
> building *.c files.
> =

> Switch to standard kbuild rule instead.
> =

> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

> ---
>  arch/riscv/kernel/compat_vdso/Makefile | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> =

> diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/c=
ompat_vdso/Makefile
> index 24e37d1ef7ec..8a395b5dd037 100644
> --- a/arch/riscv/kernel/compat_vdso/Makefile
> +++ b/arch/riscv/kernel/compat_vdso/Makefile
> @@ -8,7 +8,6 @@ compat_vdso-syms  =3D rt_sigreturn
>  compat_vdso-syms +=3D getcpu
>  compat_vdso-syms +=3D flush_icache
>  =

> -COMPAT_CC :=3D $(CC)
>  COMPAT_LD :=3D $(LD)
>  =

>  # binutils 2.35 does not support the zifencei extension, but in the ISA
> @@ -43,8 +42,7 @@ $(obj)/compat_vdso.so.dbg: $(obj)/compat_vdso.lds $(obj=
-compat_vdso) FORCE
>  LDFLAGS_compat_vdso.so.dbg =3D -shared -S -soname=3Dlinux-compat_vdso.so=
.1 \
>  	--build-id=3Dsha1 --hash-style=3Dboth --eh-frame-hdr
>  =

> -$(obj-compat_vdso): %.o: %.S FORCE
> -	$(call if_changed_dep,compat_vdsoas)
> +$(obj-compat_vdso) : KBUILD_AFLAGS +=3D $(COMPAT_CC_FLAGS)

Spurious space before ":".

>  # strip rule for the .so file
>  $(obj)/%.so: OBJCOPYFLAGS :=3D -S
> @@ -66,7 +64,3 @@ quiet_cmd_compat_vdsold =3D VDSOLD  $@
>        cmd_compat_vdsold =3D $(COMPAT_LD) $(ld_flags) $(COMPAT_LD_FLAGS) =
-T $(filter-out FORCE,$^) -o $@.tmp && \
>                     $(OBJCOPY) $(patsubst %, -G __compat_vdso_%, $(compat=
_vdso-syms)) $@.tmp $@ && \
>                     rm $@.tmp
> -
> -# actual build commands
> -quiet_cmd_compat_vdsoas =3D VDSOAS  $@
> -      cmd_compat_vdsoas =3D $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -=
c -o $@ $<

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
