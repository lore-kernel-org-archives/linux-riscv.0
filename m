Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C5CC32771
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Sep 2022 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mFwZrX12XsfeLf5WeLxQ8n2GsacQEAhstdO0lK7YyA=; b=IM+vb5YNA2rDNg
	pMWz53DXF++2eByhJGcV0pEuy2xEwSnYVR+9Lm/kj89JcqBvEJM6diDAClx7v6XG+jtP5AR1t/bM6
	WYxFhlFwzwsxreGZM/+SN2XpAq30ttJc0fF/NtwlQrcavMZzgg2PowKvMP3+6ghzVxTbA/N79+nt8
	I8engXRWfo8XhlndVV/VJEzbpT4aGL640LvIPXqYw0GL9FhlhqLr5waiTXhn6La9QLjg4AYpHN42Z
	PADd7Do+IvUQyhZHwcKlniZYMzDYxl2OckI1O2KU+ERayx6WzJA5cUCmP81kO3QJE1xrz4cHkKrD8
	SDXhKaq9mhnVBZfKZeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc9TC-008PLQ-FC; Sat, 24 Sep 2022 18:01:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc9T9-008PJy-Ly
	for linux-riscv@lists.infradead.org; Sat, 24 Sep 2022 18:01:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3219E60BFF;
	Sat, 24 Sep 2022 18:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E701C433D6;
	Sat, 24 Sep 2022 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664042497;
	bh=g1afKKuq47C8aqaK2xeKV2IGCzYc5n8KN5uzi/pWP9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukHGzjGLbEieplLBOGFLoYMwu/Kma8HXCc0HQEhSP6huqTx86ADD9S8JKWb9gPp7e
	 pFKFzefMQOiZ5b7aF9jj7vLFCHxAwBWstdOJDxrH0oOAbNLLnIItGkcQptA6Hakg7T
	 L1C9L1oJP3XExK9czHPcO+GULB31RHCaxEfMoHNOeDZEaL7UXBxfsYYzL+07dAfU7T
	 YQqm4XT8TCGhMTm7ew/NDcY1U7+2FG2syrn8Btz3TdU4YEX2SkrBsPH3UNkBynHJVY
	 ry3COZ3RhpeaR1BO6AzR2hggWwCx3Q/z+MlBzgicQNf13VRFILO3PPR61LzHIXyL2l
	 4OPGQEpzmM4kw==
Date: Sat, 24 Sep 2022 19:01:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Stillson <stillson@rivosinc.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>, Dao Lu <daolu@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 05/17] riscv: Add has_vector/riscv_vsize to save
 vector features.
Message-ID: <Yy9F+WAbSXDfiVCl@spud>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-5-stillson@rivosinc.com>
 <a91e3e67-d077-050c-48a3-1466c2deb7c4@sholland.org>
 <CAM2SziUBmXcte+GGsXPyKC7ce5EVjaiiWGAU=bWev2LAWrHYrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM2SziUBmXcte+GGsXPyKC7ce5EVjaiiWGAU=bWev2LAWrHYrA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_110139_823310_6143D82D 
X-CRM114-Status: GOOD (  30.84  )
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

On Fri, Sep 23, 2022 at 09:27:01AM -0700, Chris Stillson wrote:
> On Wed, Sep 21, 2022 at 9:23 PM Samuel Holland <samuel@sholland.org> wrote:
> >
> > On 9/21/22 16:43, Chris Stillson wrote:
> > > From: Greentime Hu <greentime.hu@sifive.com>
> > >
> > > This patch is used to detect vector support status of CPU and use
> > > riscv_vsize to save the size of all the vector registers. It assumes
> > > all harts has the same capabilities in SMP system.
> > >
> > > [guoren@linux.alibaba.com: add has_vector checking]
> > > Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > ---
> > >  arch/riscv/include/asm/vector.h | 14 +++++
> > >  arch/riscv/kernel/cpufeature.c  | 19 +++++++
> > >  arch/riscv/kernel/riscv_ksyms.c |  6 +++
> > >  arch/riscv/kernel/vector.S      | 93 +++++++++++++++++++++++++++++++++
> >
> > This file is not added to the Makefile until patch 8.
> (resending, as I forgot to set it to plain mail)

And please don't top post either :)

> This is the way the original set of patches worked. I tried to change
> them as little as possible for the rebase.

What is your goal with the series? Are you going to work on getting the
whole thing merged, or just looking to tack your patch onto the end of
the on-going series?

There were two warnings from LKP & some comments from reviewers on v10,
I assume that you did not make the changes those reviewers requested as
the build warnings didn't get fixed.
https://lore.kernel.org/linux-riscv/cover.1652257230.git.greentime.hu@sifive.com/

I see a couple more caused by another patch in the series too:

../arch/riscv/kvm/vcpu_vector.c:134:6: error: variable 'reg_val' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if ((rtype == KVM_REG_RISCV_VECTOR) &&
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/kvm/vcpu_vector.c:139:7: note: uninitialized use occurs here
        if (!reg_val)
             ^~~~~~~
../arch/riscv/kvm/vcpu_vector.c:134:2: note: remove the 'if' if its condition is always true
        if ((rtype == KVM_REG_RISCV_VECTOR) &&
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/kvm/vcpu_vector.c:134:6: error: variable 'reg_val' is used uninitialized whenever '&&' condition is false [-Werror,-Wsometimes-uninitialized]
        if ((rtype == KVM_REG_RISCV_VECTOR) &&
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/kvm/vcpu_vector.c:139:7: note: uninitialized use occurs here
        if (!reg_val)
             ^~~~~~~
../arch/riscv/kvm/vcpu_vector.c:134:6: note: remove the '&&' if its condition is always true
        if ((rtype == KVM_REG_RISCV_VECTOR) &&
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/kvm/vcpu_vector.c:131:15: note: initialize the variable 'reg_val' to silence this warning
        void *reg_val;
                     ^
                      = NULL
2 errors generated.

Do you intend working on getting the series merged, or should I not
bother actually reviewing the individual patches?

If you do intend on getting it merged, can you please run checkpatch
with the --strict option and clear up the stuff it whines about & sort
out the Signed-off-bys in the series? Almost all the patches are missing
your sign-off, which is required as you are now the submitter. You can
also drop Greentime's signoff on any patch he is not the author of.

Give it a few days before resubmitting though, to give people a chance
at looking at the patchset first.

Thanks,
Conor.

> > >  4 files changed, 132 insertions(+)
> > >  create mode 100644 arch/riscv/include/asm/vector.h
> > >  create mode 100644 arch/riscv/kernel/vector.S
> >
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
