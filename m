Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA1EC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 04:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMEjUmIyVH8tIPn++KuNLuVEnw5hqZfghrYpIQ+4fHc=; b=MYdpXD7NgDdzia
	GadiQ83l2P55sNVqDQFJ5NJkHEbGo3jL2BgtwqK9NGMy5Y6KEUguFEnfFf0xv8CVjefnrsBnRnVcF
	eDiOiwrVUKPEs1Jl8yFc+/xELKlQCM+fm1Qw3/WS5GaR3nCiQRGMkZQ3Nkqif3I8MFEVLcNl09JHJ
	kvNGV29fQR1VhuuKOHKdrdI7u8HJZbVE5INtEN2u57FPx+9lmYoz249sJ0SSly6Pv8c7WqlqUviB+
	UDw0mFby4A4sdKItJ2py+R5GBmtvq1PxVpyzX02cQu4wtGGBsg4kOK+FwpTq/mvXa0WAqb98qIlRP
	bFceWlOS/siDtXlVPEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nztB0-00BSOL-NR; Sat, 11 Jun 2022 04:56:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nztAy-00BSMb-BY
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 04:56:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EB4960BBD
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 04:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEE8C385A5
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 04:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654923394;
	bh=4k6vNzhX6ub0gdf5kgjJ0KYeErBFgTgo9HAWmbzPeIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NBfgeIC6K09xnDWsiB4PToBRmf4z1YbjhKzJWLePFfhtIGmpl0ghWseTv57avaZDn
	 idOuZetQhN6jk+rxi4lulstmc2tR+ohJTwNy8Q7TW1uNhBKGduiVlh4bUgJtlGlaTy
	 IZtkdQ3nbL9tRdXSCLmlTPosbVdL1pWHKDvBZgZWsGtGeJVRuwrnn7s9d/t0NTkKml
	 u1+y6HCflg4FCVy6XA4K763KDaqFxhVcqC8GHn5Ne56JcSaT/NYFeHYG5TukapDHGF
	 fKcA7jmjCIRWfumtajY18uhvqBbNrkBkC0hJ9oQ6UYqYzqURR37dqOqb/t5qpuh7yV
	 VETICaxhGkDMw==
Received: by mail-vs1-f47.google.com with SMTP id r12so1071504vsg.8
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jun 2022 21:56:34 -0700 (PDT)
X-Gm-Message-State: AOAM533pJXU1L0SIn50glL2AHFFPDZEWBhaMv9/Om/njzPGUfIIYTKIm
	7g7nyYJLT1uxvO3dSPR0At6gz9cGmVSPv0EXRq4=
X-Google-Smtp-Source: ABdhPJwrVCPIs2USR/kHUvluFIYzbGFIoy+zLN3lIZqIicH7QZldaDzrWUZNiE3y5d0KM6mi4V+ffA8GiCUy1/pMvUc=
X-Received: by 2002:a05:6102:22c2:b0:34b:9163:c6ab with SMTP id
 a2-20020a05610222c200b0034b9163c6abmr19135846vsh.8.1654923393395; Fri, 10 Jun
 2022 21:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220611023122.211621-1-falcon@tinylab.org>
In-Reply-To: <20220611023122.211621-1-falcon@tinylab.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Jun 2022 12:56:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQqESOHUBkqLz5W72-2BGXLS35F4ufutKi4J25wNnxRvw@mail.gmail.com>
Message-ID: <CAJF2gTQqESOHUBkqLz5W72-2BGXLS35F4ufutKi4J25wNnxRvw@mail.gmail.com>
Subject: Re: [RFC] riscv: restore the irq save/restore logic for nosync code patching
To: Wu Zhangjin <falcon@tinylab.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Zijlstra <peterz@infradead.org>, Zong Li <zong.li@sifive.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_215644_516661_6F677FF3 
X-CRM114-Status: GOOD (  27.01  )
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

On Sat, Jun 11, 2022 at 10:31 AM Wu Zhangjin <falcon@tinylab.org> wrote:
>
> The commit '0ff7c3b331276f584bde3ae9a16bacd8fa3d01e6' removed the
> old patch_lock together with the irq save/restore logic.
>
> But the patching interface: patch_text_nosync() has new users like
> Jump Label, which doesn't use stop_machine(), here restores the irq
> save/restore logic for such users, just as the other architectures do.
>
> Move lockdep assert to the required path too, the current stop_machine()
> based ftrace implementation should use the new added patch_text_noirq()
> without this lockdep assert, it has its own mutex, but not named as
> text_mutex.
>
> As the latest maillist shows, a new ftrace support without
> stop_machine() is in review, which requires the nosync version with this
> irq save/restore logic or the new added noirq version (as we can see it
> also calls patch_insn_write) with explicit text_mutex and irq
> save/restore logic.
>
> Signed-off-by: Wu Zhangjin <falcon@tinylab.org>
> ---
>  arch/riscv/kernel/patch.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 765004b60513..03f03832e077 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>         bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
>         int ret;
>
> -       /*
> -        * Before reaching here, it was expected to lock the text_mutex
> -        * already, so we don't need to give another lock here and could
> -        * ensure that it was safe between each cores.
> -        */
> -       lockdep_assert_held(&text_mutex);
> -
>         if (across_pages)
>                 patch_map(addr + len, FIX_TEXT_POKE1);
>
> @@ -85,7 +78,8 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>  NOKPROBE_SYMBOL(patch_insn_write);
>  #endif /* CONFIG_MMU */
>
> -int patch_text_nosync(void *addr, const void *insns, size_t len)
> +/* For stop_machine() or the other cases which have already disabled irq and have locked among cpu cores */
> +int patch_text_noirq(void *addr, const void *insns, size_t len)
>  {
>         u32 *tp = addr;
>         int ret;
> @@ -97,6 +91,26 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>
>         return ret;
>  }
> +NOKPROBE_SYMBOL(patch_text_noirq);
> +
> +int patch_text_nosync(void *addr, const void *insns, size_t len)
> +{
> +       int ret;
> +       unsigned long flags;
> +
> +       /*
> +        * Before reaching here, it was expected to lock the text_mutex
> +        * already, so we don't need to give another lock here and could
> +        * ensure that it was safe between each cores.
> +        */
> +       lockdep_assert_held(&text_mutex);
> +
> +       local_irq_save(flags);
> +       ret = patch_text_noirq(addr, insns, len);
> +       local_irq_restore(flags);
> +
> +       return ret;
> +}
>  NOKPROBE_SYMBOL(patch_text_nosync);
>
>  static int patch_text_cb(void *data)
> @@ -106,7 +120,7 @@ static int patch_text_cb(void *data)
>
>         if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
>                 ret =
> -                   patch_text_nosync(patch->addr, &patch->insn,
> +                   patch_text_noirq(patch->addr, &patch->insn,
>                                             GET_INSN_LENGTH(patch->insn));
patch_text_cb is only called in stop_machine_cpuslocked, no need
disable irq for its callback

>                 atomic_inc(&patch->cpu_count);
>         } else {
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
