Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF0BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 07:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/loZ6FHy2dWrrOnyZrIxozLsOBhLEx5QHS57StuHbQ=; b=Z1fYf0b+ZosGMN
	YP9wB0xW4Qxvf1yX7saASCNkKVgfZwbfe13Rg0lXCT6rum/VqEEJ4xBN5Sb7JIUZnJl5gnxUxJtJb
	zNmzNKOfBu0m2NYIrpeO/gBZoom6GACOwe2dXAhxOVMS2I34d5KiTBOI78imnDbAwXKdHgcrwFMMx
	lZj3mA12VNY+nO/vkYXjdnlxhZzETEI8Uou1qgyACB8NXWo/9Ru0S+7d1l+12Z1M7Smm49mMJq39L
	Kv2oFHhphKTVUhtE39f01kGmvM92qj2wktG1wCQnIZnrGChTo3sf048ciZJTF9JiiARL4/VFWhpHw
	vFBuucc+9NZlP+/BRcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpmc4-0044cP-Qm; Wed, 24 Nov 2021 07:22:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpmc2-0044bH-1R
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 07:22:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3A1E60174
 for <linux-riscv@lists.infradead.org>; Wed, 24 Nov 2021 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637738557;
 bh=m+3a1qX76TOmy0A/GhuywzFOTTKk1nZ3PH5KhZasyeo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SNnims8xeSABSjkfJg++ZfHXR7acdlnBfNWTSQpEpU9VcK4e7qrVU4jqPY6B0dU1M
 yVAym3I29Dy+Cv09oFBjN9mWcC+eNrXAA78PgiV7lxjFIWjs//g1z7KiAqopa/GwCD
 LgHMJ0MeCKu3CqXj7yYEsEEfdSc/Hoon8ahxzGDBPsH4RbW17hLHWogPcU0Kf1w2o8
 tsnyuJHF/+y0Bl9CWCzONk6LM1PpTwJAUn3QBjzmmIzQ4pBK8BPYYd/r5itpVBtuJM
 syhWAWdlwwAxOOvWWt2LGRsGBC6Vvxitq6Bgbtr8PSXRTzeRwWZ2QzF0+BQDznbq4a
 63U/Sy1iV5ezw==
Received: by mail-ua1-f53.google.com with SMTP id a14so3259095uak.0
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 23:22:37 -0800 (PST)
X-Gm-Message-State: AOAM531qytp+zcxzJqC+T3mCdQPbp5t3lG0t3fLivWzKuZRb7ogpHGMT
 YD6lrZ5Ot9advgDrky5Zii22AtE49Ttjaz7nmpk=
X-Google-Smtp-Source: ABdhPJx0YOtKVw+POvXrhVmjRsH6kZEPFr+RFNGWIpADmf6yHbBf8CHOPdlm5hTz+qL/nQoaLC4UAC+sw6lqLbGPtEI=
X-Received: by 2002:ab0:5b59:: with SMTP id v25mr6588500uae.57.1637738556783; 
 Tue, 23 Nov 2021 23:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20211124060521.614015-1-guoren@kernel.org>
 <CAAhSdy1CZbdAPEYxFOhrn=wUcmc9Yea0ziMUmHjaudKdH2Yw1w@mail.gmail.com>
In-Reply-To: <CAAhSdy1CZbdAPEYxFOhrn=wUcmc9Yea0ziMUmHjaudKdH2Yw1w@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 24 Nov 2021 15:22:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRAXAmo4cVSfArf=eMU9CxXZr3kjaKcQ1u8764cnL+N_Q@mail.gmail.com>
Message-ID: <CAJF2gTRAXAmo4cVSfArf=eMU9CxXZr3kjaKcQ1u8764cnL+N_Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup one-page wasting
To: Anup Patel <anup@brainfault.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <Atish.Patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_232238_129880_71B6E58D 
X-CRM114-Status: GOOD (  17.32  )
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

On Wed, Nov 24, 2021 at 2:55 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Nov 24, 2021 at 11:35 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > For small memory systems(Allwinner D1s/F133), one page size memory
> > cannot be ignored.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Alexandre Ghiti <alex@ghiti.fr>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <Atish.Patra@wdc.com>
>
> This PATCH breaks the CPU hotplug functionality.
>
> When a CPU/HART is turned off and turned on at runtime, the
> low-level relocate() will be called to enable MMU on the CPU
> being brought-up which in-turn uses trampoline_pg_dir.
Yeah, I forgot that.

How about removing trampoline_pg_dir totally and using
early_pg_dir/swapper_pg_dir for relocate directly?

>
> Regards,
> Anup
>
> > ---
> >  arch/riscv/mm/init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 24b2b8044602..097bb3bc4020 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -241,9 +241,9 @@ unsigned long riscv_pfn_base __ro_after_init;
> >  EXPORT_SYMBOL(riscv_pfn_base);
> >
> >  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > -pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> >
> > +pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> >  pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> >  static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> >
> > --
> > 2.25.1
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
