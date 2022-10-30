Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CE4ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwVensjvbCn9RyA8RIrheChiqQqV02/zLoo+O2SlU9k=; b=lf7GVZVWKsdXZb
	B2HEC9bBJbX68V17ZNv3izHj0ZD2hhYP5leTyPsZcfHvmSFdWYBd79ZlAUmLlCHC5h7NDRIq0EIUl
	xzJSvUkoR0T5452Z2vVQXwCz7wRBfesgddMTZfr4i/UDn+jXguYAPwirx5rLvuGfRPoBJI+vUqtW2
	yip9aVYE6KTfb2VJ4Ka8dciQNr6O3+QXv+7R5et24EHbzysTq7zRzUH3MJUE5Ep9UhBhTsKxYI0gs
	PC2QElwPnLkdAwdngCGz07zoyRlwiohWsK4Ti4CIAwzYibuvATG9dwkS9bvoBCcM8aAH8U9Wrwaqn
	XLIrL2jILj48uG33s9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opAw3-000Oet-0R; Sun, 30 Oct 2022 16:13:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opAvz-000ObE-O0
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 16:13:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 001C9CE0FAB;
	Sun, 30 Oct 2022 16:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CABC433C1;
	Sun, 30 Oct 2022 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667146387;
	bh=/T3JSPF6RKm+uD0J6i/rJY8j22suaEB2nqLWyc8WVfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obSU/JkGAzLXB2CTMQPpINuXYLeHg6YL1DjxNB2QF7uMKz1r/E7SidAZAcS1fpMpx
	 Yw4PyaS2BTlkZXWZh+cZULssGS8MF+Ih3xf1QgmjQm0/fusis7NSu/If3paWkdmn5Z
	 Lece3ClpVkyI3+sO6OHjYr7XANVbCpYCaJFtPJNf7ugSIDVX/mzmQnNd0BOqtEG8V+
	 RaxjnyR/Q44cJS+D92wTN7fXCb+/KiTnETa3m2SIrALQmnDEqJ3qLY8C7S6sIXeLCN
	 mODLW7ndGAZLTJbb6yPA+rJ7V9awtGeVDa3Z7AI7OY2bhSikKU7mfV9WAXwaYYfbVo
	 aAMcc9GXrupKQ==
Date: Mon, 31 Oct 2022 00:03:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: improve boot time isa extensions handling
Message-ID: <Y16gSDwCWmp3vxaw@xhacker>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221029095609.e4ymkbnk2hl3kxzc@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029095609.e4ymkbnk2hl3kxzc@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_091316_159598_966847A0 
X-CRM114-Status: GOOD (  30.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Oct 29, 2022 at 11:56:09AM +0200, Andrew Jones wrote:
> On Thu, Oct 06, 2022 at 03:08:10PM +0800, Jisheng Zhang wrote:
> > Generally, riscv ISA extensions are fixed for any specific hardware
> > platform, that's to say, the hart features won't change any more
> > after booting, this chacteristic make it straightforward to use
> > static branch to check one specific ISA extension is supported or not
> > to optimize performance.
> > 
> > However, some ISA extensions such as SVPBMT and ZICBOM are handled
> > via. the alternative sequences.
> > 
> > Basically, for ease of maintenance, we prefer to use static branches
> > in C code, but recently, Samuel found that the static branch usage in
> > cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
> > Samuel pointed out, "Having a static branch in cpu_relax() is
> > problematic because that function is widely inlined, including in some
> > quite complex functions like in the VDSO. A quick measurement shows
> > this static branch is responsible by itself for around 40% of the jump
> > table."
> > 
> > Samuel's findings pointed out one of a few downsides of static branches
> > usage in C code to handle ISA extensions detected at boot time:
> > static branch's metadata in the __jump_table section, which is not
> > discarded after ISA extensions are finalized, wastes some space.
> > 
> > I want to try to solve the issue for all possible dynamic handling of
> > ISA extensions at boot time. Inspired by Mark[2], this patch introduces
> > riscv_has_extension_*() helpers, which work like static branches but
> > are patched using alternatives, thus the metadata can be freed after
> > patching.
> > 
> > [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> > [2]https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland@arm.com/
> > 
> > 
> > Jisheng Zhang (8):
> >   riscv: move riscv_noncoherent_supported() out of ZICBOM probe
> >   riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
> >   riscv: hwcap: make ISA extension ids can be used in asm
> >   riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA
> >     extensions
> >   riscv: introduce riscv_has_extension_[un]likely()
> >   riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
> >   riscv: cpu_relax: switch to riscv_has_extension_likely()
> >   riscv: remove riscv_isa_ext_keys[] array and related usage
> > 
> >  arch/riscv/include/asm/errata_list.h    |  9 +--
> >  arch/riscv/include/asm/hwcap.h          | 94 ++++++++++++++-----------
> >  arch/riscv/include/asm/switch_to.h      |  3 +-
> >  arch/riscv/include/asm/vdso/processor.h |  2 +-
> >  arch/riscv/kernel/cpufeature.c          | 78 +++-----------------
> >  arch/riscv/kernel/setup.c               |  4 ++
> >  6 files changed, 71 insertions(+), 119 deletions(-)
> > 
> > -- 
> > 2.37.2
> >
> 
> Hi Jisheng,
> 
> I just tried building this with LLVM=1 and fails to compile with messages
> like
> 
>  ld.lld: error: relocation R_RISCV_64 cannot be used against symbol '.Ltmp1'; recompile with -fPIC
>  >>> defined in arch/riscv/kernel/vdso/vgettimeofday.o
>  >>> referenced by vgettimeofday.c
>  >>>               arch/riscv/kernel/vdso/vgettimeofday.o:(.alternative+0x0)
> 
> It does compile and boot with CC=clang and binutils 2.39, where my clang
> version is 14.0.5 (Fedora 14.0.5-1.fc36).

Hi Andrew, 

Below is a quick fix.

PS: I think I need add two or more patches to apply alternatives in the
vDSO. But currently only Zihintpause is affected.

Will send out a new version.

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f2e065671e4d..522b78477bab 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -44,7 +44,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
        $(call if_changed,vdsold)
-LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
+LDFLAGS_vdso.so.dbg = -shared -z notext -S -soname=linux-vdso.so.1 \

> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
