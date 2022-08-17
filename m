Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842E5C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71q+qZDFGyKlWPIrnPvZ3zbyH6iTwqJkO0VmqZnPAEg=; b=R/2FiVLNaje3lX
	Aqhr8niJmAuoAV3YH38k0ttBfwO3U7/dW6VjvrYPurHbkRFfN7D9GKK5J+IelzwPiLdWStO6hF0Wf
	4vq1zx5VbFqy6IkC3CxJkfha8G2+6E9WwkKkMIcCiznzMHNq8so6ZlNxwvET1Dd4Y+vnhJLLzQdcm
	4vEE0TrISpYloBvMno0UBYDXKeIMBviQ/3NrIoNOtnuUlU1BtuGBWTzW0mxvn0nmeshTBmIzCckrl
	x7Vv0fRQ8VDlosG5Tzja4R/jtVy/QVF9CfxnbkZfUF0FJ/xMcwoZka7kpZSAcIKySPGfHPs6IWBWk
	T04nLuSOdqqGG8tzEYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOKCg-002ujK-UG; Wed, 17 Aug 2022 14:39:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOKCd-002ugj-EC; Wed, 17 Aug 2022 14:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48642614D6;
	Wed, 17 Aug 2022 14:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA31C433C1;
	Wed, 17 Aug 2022 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660747166;
	bh=D2F5rhQcvdQNsiT8HtBPBvUKoSwn9XOVx+QjpXWS2Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0tg25bb4yMVbc2/THbcZW6YZykHnEAvJ25bUxovHiM35NM3GrgF6VWqxAa5cbn6h
	 iPxzqoNhqR/D23BBn3UaIWPe/+MrNiaUMcFTzrAWvJqjJzH/qwITp0K3feYHru+Kcd
	 SMp90lCO0If5gfJjS3fEpfLW+PdpcBthUGRK0fOtEF8HbpFvAyqT9Z/WjYYPb7vI9o
	 ig/SmCQU0s9LYO22TstjwWjAOov1nCMFmHuonI5SDpIpoJZGMPYMad53jjfaxE93S+
	 OXP9UyTBOmeuYzGImmAc0LG0hgUkB9COA39grfwiTb+rtqXEEeN2PghkTZ6TjjKblG
	 7gq06Qurh5nSQ==
Date: Wed, 17 Aug 2022 22:30:07 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: atishp@atishpatra.org, ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, daolu@rivosinc.com,
	Conor.Dooley@microchip.com, re@w6rz.net, apatel@ventanamicro.com
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
Message-ID: <Yvz7byY9F0ow1bgf@xhacker>
References: <CAOnJCU+Gx44ESHWyku7Kb6u5QnzjXiZcat5XmVWjksdFpcQ6nA@mail.gmail.com>
 <mhng-dd00cb27-4162-48aa-834d-30fb90e194cf@palmer-mbp2014>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-dd00cb27-4162-48aa-834d-30fb90e194cf@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_073927_593939_25D3E28C 
X-CRM114-Status: GOOD (  27.97  )
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

On Tue, Aug 16, 2022 at 09:29:36PM -0700, Palmer Dabbelt wrote:
> On Tue, 16 Aug 2022 16:41:46 PDT (-0700), atishp@atishpatra.org wrote:
> > On Tue, Aug 16, 2022 at 9:31 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > 
> > > riscv_isa_ext_keys[] is an array of static keys used in the unified
> > > ISA extension framework. The keys added to this array may be used
> > > anywhere, including in modules. Ensure the keys remain writable by
> > > placing them in the data section.
> > > 
> > > The need to change riscv_isa_ext_keys[]'s section was found when the
> > > kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
> > > add Zihintpause support") adds a static branch check for a newly
> > > added isa-ext key to cpu_relax(), which kvm uses.
> >> > > 
> > > Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > ---
> > >  arch/riscv/kernel/cpufeature.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 553d755483ed..3b5583db9d80 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
> > >  /* Host ISA bitmap */
> > >  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > > 
> > > -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> > > +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> > >  EXPORT_SYMBOL(riscv_isa_ext_keys);
> > > 
> > >  /**
> > > --
> > > 2.37.1
> > > 
> > > 
> > > --
> > > kvm-riscv mailing list
> > > kvm-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/kvm-riscv
> > 
> > Thanks for the quick fix. Tested with kvm guests booting in Qemu.
> > 
> > Tested-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

Thanks for catching the bug in my code.

> 
> Thanks, I hadn't realized how static keys work but looks like having them as
> __ro_after_init was always bogus.  Sorry to break stuff, looks like I should be

Sorry for breaking the static isa extension key usage in modules.
It's a good idea to make them readonly, but need to cope with the usage
in module properly. This may be a good improvement item.

> loading some module (probably KVM, as it's in the defconfig) during testing.
> 
> This is on fixes, I'm planning on sending it up later this week.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
