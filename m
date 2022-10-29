Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B2C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8uW1zZa6LD0bj6racnKg79AXH3WqokecsXe+hSeA9c=; b=Uc2jdKPjkDAPdj
	IN145F2oamfz85/4yZqv+1XTq+cbaaho7jmyxkrr2dJLjjzBcZQjrJ2HFle50X1BE3O5dfGhihQEU
	FY+zXeLNgj54zQUDPhpE22awhtyi+sWBfMG7vsUXTyF/8c/82jPv7yiIKHFP7eRw9/18MvjgwFW8w
	IoO86QbPC38Pxg7cgju6KQV9Er+R39gLCIUOtlBykJQN0f2xihKkgaGCmdG6sOA0DC9HWDsDHqC80
	pTBRcSpKjClhS1fu5/ibwQEEpzfhmeOf1BC5y1copZtipMEaFuzlQ9pMGABhtgSISwYFKdUW8xkZr
	IVCzybdGjv35Ugf7R/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ookJe-00603w-Bv; Sat, 29 Oct 2022 11:47:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ookJa-00602C-J2
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 11:47:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DAA74CE0927;
	Sat, 29 Oct 2022 11:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF75C433D6;
	Sat, 29 Oct 2022 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667044065;
	bh=DDABJBxBd02Yvl4NnPzTGgyMl+Qml292/ZUv9g4aIaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAdo3yli8qm/+7Y3K27KySDeGaULShqjafrK81A92GDP5G18UY/U0VezHTYgOuJS9
	 baZslo9arxC4T1dDGA6vqmgv5jxECMq2V4j+z8J2FGyA5M4GW1vEUU/yIkPGewikCL
	 nXsdduacieOb3dL+2qEoKzm2y9EPjZAvkHgkFvLDpwlZ7Q62Y+n/O8J1xl7wNyN472
	 oz17BufaCRkrUPhzg6jX5Diwf6RxS5/58NsgQ/MvpQ2/aP4ZYXnJN7RqmKy1Kb6rpp
	 nLigLHEM/fQmiPWwa38ZoJOJ8byDXFWaS6ZLP9U4I/z7cDSF1j1nPxiUkx7tCqNhfU
	 L5zdc2cJGoNtw==
Date: Sat, 29 Oct 2022 19:38:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: improve boot time isa extensions handling
Message-ID: <Y10Qm7QHT1s6If5K@xhacker>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221029095609.e4ymkbnk2hl3kxzc@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029095609.e4ymkbnk2hl3kxzc@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_044751_214726_0C2AB45D 
X-CRM114-Status: GOOD (  28.79  )
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

Hi Andrew,

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

Thanks for the information, I also noticed that lkp reported similar
error. I'm investigating the issue.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
