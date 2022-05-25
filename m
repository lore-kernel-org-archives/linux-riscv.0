Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D603BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/hfVEpu19DARFcG/SsJ2uu8UKcEyaARKfUjZNeGvX4=; b=wX9PxyiZiWXpU5
	8YL5Nu1neR4Px96HMQu7Py6EXGMs1z2r45bNguWIr5EYgnjdnDVEfHd5ZMtT6+Vwot2s0M5JEp+7G
	0/hXhEkWbFw0/i5LJDUJa7K5xPvLbN3cVkF+nDHuH8uhbBR3uATXkUM4jPcFEg1ssT/8Dug3zGRM1
	75FpY9ZKJx2gaegVQzdQOWzWBsmMMCbdtY3hNFMbVjKJi9lzmJByTLpqFGgIRChqFAKmLFLiXOHUq
	0U5silPpaD4AO7xYZqQARjUuKX7iJ2lQq/eHfyEi4Gq3h4wVRn3xn23bqTpTUc0GB6PMAI/itdahs
	8KFGyOvyaPflWoSmueHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntrHK-00BHSw-DI; Wed, 25 May 2022 13:42:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntrHH-00BHRB-4q
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 13:42:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD80561876;
	Wed, 25 May 2022 13:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7707C385B8;
	Wed, 25 May 2022 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653486138;
	bh=2qPbWRcSRsl4LlFjbtIBkM7PQ9cUCKoA7Q1w7x4JsG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g32X/wmOcFhk3gydR4eQIpEK9yC6yh6BhsAwB+Bei9id1+rTaE0pBnl4YQ5zG9HAk
	 uixuL892t//cAiE1g+7rsa8PXGaLIl9HJhNNQ8YJ7wJEFPF5/I/5x4MskCP//+h4/j
	 +kCPBr20/Hcnvcbo/aUaWk7bZiKAJnHuBkEDt9QEXqZojmuaX92nJoQ37z0ua2T+el
	 ZXDSEXU41qi/ofBq0EK5g4ct9JAYxs5NulkPjiB7D43V6DX/VDJP/w6ADMtTiX4Qw4
	 rXTBUN59EJEjQOphiuAgDBm12opD3Qd5kyKpWfbWf+/P6oLNcSsC29YTMiOOI/t5R5
	 2GdYKGZeq5i0w==
Date: Wed, 25 May 2022 21:33:39 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Liao Chang <liaochang1@huawei.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Naveen Rao <naveen.n.rao@linux.vnet.ibm.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv/kprobe: reclaim insn_slot on kprobe
 unregistration
Message-ID: <Yo4wM8qvD/xTfRK1@xhacker>
References: <20220525014424.20717-1-liaochang1@huawei.com>
 <CAJF2gTS9_1D+K-ok2vxQpbq6B7zxv1K-t8cfcu1hFjF=7a5yxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTS9_1D+K-ok2vxQpbq6B7zxv1K-t8cfcu1hFjF=7a5yxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_064219_275399_DBE9632B 
X-CRM114-Status: GOOD (  21.27  )
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

On Wed, May 25, 2022 at 02:23:50PM +0800, Guo Ren wrote:
> On Wed, May 25, 2022 at 9:46 AM Liao Chang <liaochang1@huawei.com> wrote:
> >
> > On kprobe registration kernel allocate one insn_slot for new kprobe,
> > but it forget to reclaim the insn_slot on unregistration, leading to a
> > potential leakage.
> >
> > Reported-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> > Signed-off-by: Liao Chang <liaochang1@huawei.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> > v2:
> >   Add Reported-by tag
> >
> >  arch/riscv/kernel/probes/kprobes.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> > index e6e950b7cf32..f12eb1fbb52c 100644
> > --- a/arch/riscv/kernel/probes/kprobes.c
> > +++ b/arch/riscv/kernel/probes/kprobes.c
> > @@ -110,6 +110,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
> >
> >  void __kprobes arch_remove_kprobe(struct kprobe *p)
> >  {
> > +       if (p->ainsn.api.insn) {
> > +               free_insn_slot(p->ainsn.api.insn, 0);
> > +               p->ainsn.api.insn = NULL;
> > +       }
> Thx reviewed-by: Guo Ren <guoren@kernel.org>
> 
> You also could give a fixup patch to csky, thx:
> 
> diff --git a/arch/csky/kernel/probes/kprobes.c
> b/arch/csky/kernel/probes/kprobes.c
> index 42920f25e73c..661da54b418f 100644
> --- a/arch/csky/kernel/probes/kprobes.c
> +++ b/arch/csky/kernel/probes/kprobes.c
> @@ -124,6 +124,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
> 
>  void __kprobes arch_remove_kprobe(struct kprobe *p)
>  {
> +       if (p->ainsn.api.insn) {
> +               free_insn_slot(p->ainsn.api.insn, 0);
> +               p->ainsn.api.insn = NULL;
> +       }
>  }
> 
>  static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
> 
> >  }
> >
> >  static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
> > --
> > 2.17.1
> >
> 
> 
> -- 
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
