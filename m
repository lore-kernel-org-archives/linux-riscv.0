Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA6EC32771
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 00:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woI2brohDgzS1iiH7q4fR/OxhRYD5NZfIF8m9KN37Ro=; b=kBiGn2JvZXVenL
	3VWSImC1thKf0wFGpI3vk/UUk+vAOJM4WKitRkRv50w8fN5R4MFTvICleN1/rjsFe/DagoHQ0Aj0q
	7G1ajnoylOL3SyMLVy3WCDIded3EyFdxW1Sxww1Jc2Ry4WiKw6nEEk7n9kcBu1G65UBsN83262VYD
	NF73MyFuwyJLWhu2l1yzczdDBAS+oK64uSHSrkvUYN3Hd6vrdVfoT9tctCxHdeZ33p64CqGEduqTp
	1Uzj3CF7FcQ4g0FQ+brNCNbiXK4rbhFzkdfFe/Z4yOzLKLEY7C9PpdHnWL5Cr8C20eRXnqz4wNZnh
	QzhesdiDiHQ5+dqMZIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocySJ-007WV1-M4; Tue, 27 Sep 2022 00:28:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocySG-007WU2-AM
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 00:28:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCE936151F;
	Tue, 27 Sep 2022 00:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3603AC433D6;
	Tue, 27 Sep 2022 00:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664238486;
	bh=196d/MXQhFQtb6lq5NyscBwIT4g5hA6PUW5f6L4dGTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrBcJhnw70G986UbtQOdtITn/sEzt1I6kEhCpGaLMYD+O6fYxwWJWlzq7png6q8qV
	 WvsfliYUlQ5myg7DVRJ0qAh6JuB7nDreSL86qUEc3BGbrX0ccxnvv3YrgNWOdlc5Sg
	 iWn8Bi6RigPzYv2HOKbyZkDVtOoRHQlH+Y3XF+V8PgjeLUcNNC40ZvmMOm8e5DNDCi
	 ZWWZToeFdVQK1M6t/TnYV4rPGcP/VtGNPuW1dlv01Xxmg5e6DDXkOLQJ49PMWI9gfX
	 szMz2zEUWhMe/f4fSlrp8OZ8Kadzj5XgZjz2BUvh6+katb6S/64hK1/RalOnFmhVCx
	 S0ZvJwJhHG6XA==
Date: Tue, 27 Sep 2022 08:18:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/4] riscv: fix race when vmap stack overflow and remove
 shadow_stack
Message-ID: <YzJBXsiWrbmxM6Q2@xhacker>
References: <20220925175356.681-1-jszhang@kernel.org>
 <20220925175356.681-4-jszhang@kernel.org>
 <CAJF2gTRFXwu5QtA8GywGaSVRPA7zeexcDHRzcngcY1zD3MFjog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRFXwu5QtA8GywGaSVRPA7zeexcDHRzcngcY1zD3MFjog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_172808_703057_26667C9E 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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


> >  #ifdef CONFIG_VMAP_STACK
> > -static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
> > -               overflow_stack)__aligned(16);
> > -/*
> > - * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> > - * to get per-cpu overflow stack(get_overflow_stack).
> > - */
> > -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> > -asmlinkage unsigned long get_overflow_stack(void)
> > -{
> > -       return (unsigned long)this_cpu_ptr(overflow_stack) +
> > -               OVERFLOW_STACK_SIZE;
> > -}
> > +unsigned long overflow_stack[NR_CPUS][OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);

If NR_CPUS is large, there's a non-trival memory waste, I have a
solution for this case, will send a new version today.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
