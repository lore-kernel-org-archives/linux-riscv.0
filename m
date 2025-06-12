Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E570CC61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 05:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+FnK7ElX7CFiyRFnk12c3pPp9Uk8INeuDqUffdMA2Y=; b=zbvJEvrxeP1iIk
	cmZF1crZ/gZTB8x7+7RWzOKPfntalmLPsapzmTHepRYVA00uZxV/6+07VbcJanKzZdtzuYcigWbo5
	PKTOQPO3jq/su2heYCr0GOoRVERHW2pt6fiLKzsDAn9MnsvHdONg0bNRYM6CItChNMSB/ATV7I88H
	GYJAcst0KClzAdDzX8sL11Wj0LNP1feArdEA2M+GTnKQ34WRc+WC0N04Yh9aVdOEOyfMa7YG4eGAI
	15IqOTKCgaxT0LINPYaf9cw9nbv6zfclP7MLG4YoBmyfAI728sRrL/iiAbO+DL4iuX9l93WV9MKcj
	ScHV8ngtNgmOmdRIAxWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPanv-0000000CGOi-3ytD;
	Thu, 12 Jun 2025 05:48:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPans-0000000CGO9-0M8u
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 05:48:46 +0000
Date: Thu, 12 Jun 2025 07:48:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749707322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=295phvnTuFSsjCeDnZlmZK8h66QjeJ1T36LZwhmRjSs=;
	b=olTyEhgwS/t3rNkPXTYpL2F3CiUjR0QAWA0eK4PoRBErCgNIecxmzOAEZ4a42wnt8+oYDP
	IRc4QT9MPm7b1YSVBlF7F3yP0C+mgKerU7s1ZaqYymWGYT5njMiKcyHp6FQS/sGQdgb6jF
	1rdwFd+NHAZRBNInJKmgLcY64NSLI7TLwrycUyUS+HuPpAUWmO+WQW2Yc7bspbTUb4f1iP
	7ZGzgqJij+F53jCOAH43yKvPmjtSswjW1T6Sf085xdpcmKIYjTYfiRMwE3IGoy2ZLLaYp9
	u4y3+z7isw0DylgZiUKfiYIwOSGnyMhab6E/SHcAZjFdxCsXhdhPtJKDBcj3Zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749707322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=295phvnTuFSsjCeDnZlmZK8h66QjeJ1T36LZwhmRjSs=;
	b=y7bqoEplIrvlHxVMSD4+8ltJzhGmrMmGEI4hc1n9mNmGQvFx8lwhdJSR1MClRSs4xltoFs
	ZYsB7jM7xPy45PBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250612074301-ef094934-158c-4fa1-a2ee-92d2f749fe39@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
 <20250611185727.GC2192624@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611185727.GC2192624@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_224844_409212_5D1DEC3F 
X-CRM114-Status: GOOD (  28.93  )
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

On Wed, Jun 11, 2025 at 11:57:27AM -0700, Nathan Chancellor wrote:
> On Wed, Jun 11, 2025 at 11:22:14AM +0200, Thomas Wei=DFschuh wrote:
> > All vDSO code needs to be completely position independent.
> > Symbol references are marked as hidden so the compiler emits
> > PC-relative relocations. However there are cases where the compiler may
> > still emit absolute relocations, as they are valid in regular PIC DSO c=
ode.
> > These would be resolved by the linker and will break at runtime.
> > This has been observed on arm64 under some circumstances, see
> > commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocat=
ions from GCC")
> > =

> > Introduce a build-time check for absolute relocations.
> > The check is done on the object files as the relocations will not exist
> > anymore in the final DSO. As there is no extension point for the
> > compilation of each object file, perform the validation in vdso_check.
> > =

> > Debug information can contain legal absolute relocations and readelf can
> > not print relocations from the .text section only. Make use of the fact
> > that all global vDSO symbols follow the naming pattern "vdso_u_".
> > =

> > Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120002
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> =

> I ran this through a few different architectures with LLVM=3D1 and did not
> see anything interesting.
> =

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> > ---
> >  lib/vdso/Makefile.include | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > =

> > diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> > index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adb=
b68497181085752f8 100644
> > --- a/lib/vdso/Makefile.include
> > +++ b/lib/vdso/Makefile.include
> > @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) :=3D $(addprefi=
x $(GENERIC_VDSO_DIR), getrand
> >  #
> >  # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
> >  # dynamic relocations, ignore R_*_NONE.
> > +#
> > +# Also validate that no absolute relocations against global symbols ar=
e present
> > +# in the object files.
> >  quiet_cmd_vdso_check =3D VDSOCHK $@
> =

> I do not see VDSOCHK in the normal build log but I do see the check
> being executed with V=3D1. That's obviously an outstanding issue but
> figured it was worth mentioning.

This is because nobody actually directly uses the command "vdso_check".
Instead all users use the variable "cmd_vdso_check" to build their own comm=
and:

quiet_cmd_vdso_and_check =3D VDSO    $@
      cmd_vdso_and_check =3D $(cmd_vdso); $(cmd_vdso_check)

$(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
	$(call if_changed,vdso_and_check)

So you will only see "VDSO" in the logs.
Which makes sense as VDSOCHK does not produce any output, so integrating it=
 as
its own command would be iffy.

> >        cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -=
q " R_\w*_"; \
> >  		       then (echo >&2 "$@: dynamic relocations are not supported"; \
> > +			     rm -f $@; /bin/false); fi && \
> > +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " =
R_\w*_ABS.*vdso_u_"; \
> > +		       then (echo >&2 "$@: absolute relocations are not supported"; \
> >  			     rm -f $@; /bin/false); fi
> > =

> > -- =

> > 2.49.0
> > =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
