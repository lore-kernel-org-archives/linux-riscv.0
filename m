Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FA4C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HSl4tD07xmNlGwx3gvtqwmHsax0mO0w6GloLJqGtuM=; b=b0Rn4eayqO/2FT
	cxzMGbQkFJaNRx3a8sRw9AYXODIngbDdY4dXXQwoJaszAvjyciA9GQBWRQqE48qTwr1sG/HmSab4D
	gwou3XwBtb9wTpJFFAw+ogxaj3OeDSpA1YXspqK1mra8p68sc8FK8AJMVuujU3TwmXeLPFQU+0vsT
	JeJUwzygxwPBpVvS+X1HAkXuSVnTm61w2IROBlkQkYPDwjALK90IoB7HG0rLzGLfRV8WwVjVqM51s
	Sj1GEJjXItNcPps3UtziJaHRIuNlIMeiFM1t650cSGZA9GmgR0uYeQBudlSvaUzevhyalAlN/swLK
	Ma3PRIN8Yx+hkn/fwooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpK-0000000EHC0-10QI;
	Thu, 12 Jun 2025 19:43:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPioG-0000000DbpT-1zXG
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 14:21:42 +0000
Date: Thu, 12 Jun 2025 16:21:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749738096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pl4iD19u/tvG4+VMp89MNYtzMFEcmgmm0KnazjaFycE=;
	b=K9H6d31+9MSDUfhsh3uETF2aV+bxvrRnkXITk06U2irnbchGUxFYd6p6cmayprMF+ssuCc
	yjD0GboPXRQA5Ik6Xa7Mfd38YWkeq8gqD6z1Sln6e7zfUFCiAv0afA0XZsWx1DmfL1NITy
	GMw8ao7/9aFcNz8ywe8MURwC6z1rkHhIQg+vvn7fd/+kaCrjfndvn/IE+oismSkuVC579a
	k3nej/cHlRW8VGt/mgWZn/Vc9IUdoVVgYlHKw/riBvRWuJCVVwMtYBe9sHJc7sbULfn0OK
	XmY4OuSWxdJahtgarFLrjV0VlYZBSZgPYL9dG4icV4rHUV27JzJRfTWtp33Xhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749738096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pl4iD19u/tvG4+VMp89MNYtzMFEcmgmm0KnazjaFycE=;
	b=w5C638nukRzf0+OZcZmeo4QyuuSXTL2DL3gcUcZqmjrdwp0B4QgyFM4FxVoyn5cjvZrHuh
	Aguhg4aLMAgexLCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250612155635-ecade4e1-0235-464a-bcb3-293f7452510a@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
 <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_072140_799290_51142FE0 
X-CRM114-Status: GOOD (  26.08  )
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

Hi Alexandre,

On Thu, Jun 12, 2025 at 10:31:20AM +0200, Alexandre Ghiti wrote:
> On 6/11/25 11:22, Thomas Wei=DFschuh wrote:
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
> > ---
> >   lib/vdso/Makefile.include | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > =

> > diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> > index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adb=
b68497181085752f8 100644
> > --- a/lib/vdso/Makefile.include
> > +++ b/lib/vdso/Makefile.include
> > @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) :=3D $(addprefi=
x $(GENERIC_VDSO_DIR), getrand
> >   #
> >   # As a workaround for some GNU ld ports which produce unneeded R_*_NO=
NE
> >   # dynamic relocations, ignore R_*_NONE.
> > +#
> > +# Also validate that no absolute relocations against global symbols ar=
e present
> > +# in the object files.
> >   quiet_cmd_vdso_check =3D VDSOCHK $@
> >         cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep =
-q " R_\w*_"; \
> >   		       then (echo >&2 "$@: dynamic relocations are not supported"; \
> > +			     rm -f $@; /bin/false); fi && \
> > +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " =
R_\w*_ABS.*vdso_u_"; \
> =

> =

> This only works for arm64 relocations right? I can't find any *ABS*
> relocations in riscv elf abi
> (https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0).

Indeed you are right.

We could introduce per-architecture configuration. Essentially reverting pa=
rts
of commit aff69273af61 ("vdso: Improve cmd_vdso_check to check all dynamic =
relocations").
The final logic for the intermediary objects still needs to be more complic=
ated
than for the final .so as those contain relocations in the debug informatio=
n.

Or we could add a C hostprog for validation.
That would be much more flexible than the inline shell command.
It would then also be easier to use an allow-list than the brittle deny-lis=
t.

Or we don't do anything, relying on the selftests to detect miscompilations.

I'll run this by tglx. If somebody else has any opinions, I'm all ears.

> > +		       then (echo >&2 "$@: absolute relocations are not supported"; \
> >   			     rm -f $@; /bin/false); fi
> > =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
