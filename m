Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8235BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3yQa3y+jLFm52NEfMVoERNp0/vu9uWDGnI5MPm1dDg=; b=bGzqM9RtQfQlK1
	KTOrA9qB8fiUmPnsOf+py+Sc3xtpS5eR0TlTDaH/nNy+gjuuo2UgXCI5nOOJpb6g5ZUNVLm9hlaat
	LuArd3ri0cdp37T41Wxslu6rEoJ1Z6n76kUMVgfvAXyIqm+aTpAubZhA92j22OBPMR0iAq0C4Fz9t
	2tYsIGSMTgi6Pn7HrqPiB+v0z3Nv1QUiyOMF+hy8EFgS6KlEL52taEc1VKBxjDtllvC6ihI3aW7zd
	LWx0DAFKayCCXyabcftfrTKQkpPJULTVvj/a0b7kyJEqTwQ7zPhqtqrZNQH0L/0FBk3X9ZKz6qopP
	gCOCpHmlyDR4L3EEevvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWq0-00GNlA-GL; Thu, 20 Oct 2022 14:48:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWpy-00GNhB-2c
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 14:47:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DB8A61BA6;
	Thu, 20 Oct 2022 14:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBB3C433C1;
	Thu, 20 Oct 2022 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666277276;
	bh=KeuClFyItXAr2NxGDYmWyD1/MqyrreJJLWFewSUCVBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7IA0Bae6xgvWe0tFPlANFfmuUqMfq70YY1OhhrGfDk7kqVNbgcwGBdssix3Vb6at
	 ugqrmDaDBDud8t3pzxZK6YaHhgE2HAmnLOb0LaeRIxopt+OoD4ZpmwUeUOdXzM28BO
	 cFQJnLgWeuC8S1EwCpXQkuark4KrknEG5G4NVuTyeQLYI/ramnuMWX7ael1N2YBzkd
	 CuumOldsvDn0pBUfyelEhjQWFnXbOE+xCKN9zl2GhRzHMLCfc3GcWtvVOzjZJPht2D
	 0ybQvZR795KyoqrjWR6+5j8zlu3q32BjpuOqwiEYtdvlLvTvDNe8YXqllNQHd9njtD
	 69Fei41GfYOQQ==
Date: Thu, 20 Oct 2022 22:38:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
Message-ID: <Y1FdW8P9pw466hjV@xhacker>
References: <20221019154727.2395-1-jszhang@kernel.org>
 <CAJF2gTSHH69B+KAOJdpLvQdGuhS1nJ+GnW2hVCb+e+8nrnaJ7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSHH69B+KAOJdpLvQdGuhS1nJ+GnW2hVCb+e+8nrnaJ7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_074758_187836_1B734260 
X-CRM114-Status: GOOD (  19.98  )
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

On Thu, Oct 20, 2022 at 10:16:47AM +0800, Guo Ren wrote:
> On Wed, Oct 19, 2022 at 11:57 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Currently, when detecting vmap stack overflow, riscv firstly switches
> > to the so called shadow stack, then use this shadow stack to call the
> > get_overflow_stack() to get the overflow stack. However, there's
> > a race here if two or more harts use the same shadow stack at the same
> > time.
> >
> > To solve this race, we introduce spin_shadow_stack atomic var, which
> > will make the shadow stack usage serialized.
> >
> > Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Suggested-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/kernel/entry.S | 4 ++++
> >  arch/riscv/kernel/traps.c | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index b9eda3fcbd6d..7b924b16792b 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
> >
> >  #ifdef CONFIG_VMAP_STACK
> >  handle_kernel_stack_overflow:
> > +1:     la sp, spin_shadow_stack
> > +       amoswap.w sp, sp, (sp)
> If CONFIG_64BIT=y, it would be broken. Because we only hold 32bit of
> the sp, and the next loop would get the wrong sp value of
> &spin_shadow_stack.

Hi Guo,

Don't worry about it. the spin_shadow_stack is just a flag used for
"spin", if hart is allowed to used the shadow_stack, we load its
address in next instruction by "la sp, shadow_stack".
But I agree with use unsigned int instead of atomic_t, and use
smp_store_release directly. V2 has been sent out, could you please
review it?

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
