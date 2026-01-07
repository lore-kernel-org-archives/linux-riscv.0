Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6A5D0D16D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 22:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UP3j5dXawVQJGp1EW64s1xXIIXeGnOZLHRkHDeyMits=; b=k9tg5jNlBW/sMn
	7cLAgf31olA7vqwnB7LacdnlyWajys4nJOIZPdL9IgomLNcGAPMrDeajzC0oBu+cCMIGa5a6Rh2ms
	j20TNdz54VmerhKsm662IJAr7GYmDPlFZ6yZHVBoyMobBebQmreucxSB68sswVeHOoN3zo/KxLL7N
	oEKQ4tlc1+4rq9acfDHiC76v+8HjCz23QvImdekvSf+0TQ1tWgl4hXiqeE8Rxn61DnTshC3hm4Uy3
	BWjfIFfOw0hH3VTURpmKxImfkJ8GArW7s37Z43wpPHodAIQv6AKbfAHfncjjjVXReleh1dFqoYO5Q
	8lNCmzXRYzyeGZDeshKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdc7B-0000000Fhzs-3vX8;
	Wed, 07 Jan 2026 22:34:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdc7A-0000000Fhzk-45KP
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 22:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBD7B60007;
	Wed,  7 Jan 2026 22:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF6BC4CEF1;
	Wed,  7 Jan 2026 22:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767825291;
	bh=u2djh5HTea2QgQAtKE8wrDS39r3GdGnQy6gR3KSDYo8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kpIdvfQrxqcdWmTnAlntF/vZqTBIV/dYi2cpN6FGularoO0Ce+glktt9n3X43t00Y
	 LbANnAjw7W2dRUg4YvSms29eNjfW8EpVkKrNu3jsJQWHmqkpRzcqsj91Ww9gyP55p2
	 WuIzknUf0JP43QyZ/MIzEjAR2xrb6j77mHBAahXUGWj5WTgcOwaBw1QwzP9XeGdYF2
	 AGMtFXAVr4h//JpvQhgYDNBGYAvYmzocfxWJXxBNhDZjmGCbGrWfXkS5sUDyIxi6y8
	 K2np+ZUVoKbW40KNeKgIKR5ZzTNlwtmcmcYe6MSgYJ0WsgpExgC3uQKp+t7t5e8wCi
	 7yFBeHOqhBoaA==
Date: Wed, 7 Jan 2026 15:34:48 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com, 
    apatel@ventanamicro.com, ast@kernel.org, ben.dooks@codethink.co.uk, 
    bjorn@kernel.org, bpf@vger.kernel.org, charlie@rivosinc.com, cl@gentwo.org, 
    conor.dooley@microchip.com, cyrilbur@tenstorrent.com, daniel@iogearbox.net, 
    debug@rivosinc.com, dennis@kernel.org, eddyz87@gmail.com, 
    haoluo@google.com, john.fastabend@gmail.com, jolsa@kernel.org, 
    kpsingh@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    linux-riscv@lists.infradead.org, linux@rasmusvillemoes.dk, 
    martin.lau@linux.dev, palmer@dabbelt.com, pjw@kernel.org, 
    puranjay@kernel.org, pulehui@huawei.com, ruanjinjie@huawei.com, 
    rkrcmar@ventanamicro.com, samuel.holland@sifive.com, sdf@fomichev.me, 
    song@kernel.org, tglx@linutronix.de, tj@kernel.org, thuth@redhat.com, 
    yonghong.song@linux.dev, yury.norov@gmail.com, zong.li@sifive.com
Subject: Re: [PATCH v3 1/3] riscv: remove irqflags.h inclusion in
 asm/bitops.h
In-Reply-To: <20251216014721.42262-2-cuiyunhui@bytedance.com>
Message-ID: <bb259f36-6a5a-1bb8-75de-9bb62ade44a8@kernel.org>
References: <20251216014721.42262-1-cuiyunhui@bytedance.com> <20251216014721.42262-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
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

On Tue, 16 Dec 2025, Yunhui Cui wrote:

> The arch/riscv/include/asm/bitops.h does not functionally require
> including /linux/irqflags.h. Additionally, adding
> arch/riscv/include/asm/percpu.h causes a circular inclusion:
> kernel/bounds.c
> ->include/linux/log2.h
> ->include/linux/bitops.h
> ->arch/riscv/include/asm/bitops.h
> ->include/linux/irqflags.h
> ->include/linux/find.h
> ->return val ? __ffs(val) : size;
> ->arch/riscv/include/asm/bitops.h
> 
> The compilation log is as follows:
> CC      kernel/bounds.s
> In file included from ./include/linux/bitmap.h:11,
>                from ./include/linux/cpumask.h:12,
>                from ./arch/riscv/include/asm/processor.h:55,
>                from ./arch/riscv/include/asm/thread_info.h:42,
>                from ./include/linux/thread_info.h:60,
>                from ./include/asm-generic/preempt.h:5,
>                from ./arch/riscv/include/generated/asm/preempt.h:1,
>                from ./include/linux/preempt.h:79,
>                from ./arch/riscv/include/asm/percpu.h:8,
>                from ./include/linux/irqflags.h:19,
>                from ./arch/riscv/include/asm/bitops.h:14,
>                from ./include/linux/bitops.h:68,
>                from ./include/linux/log2.h:12,
>                from kernel/bounds.c:13:
> ./include/linux/find.h: In function 'find_next_bit':
> ./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
>    66 |                 return val ? __ffs(val) : size;
>       |                              ^~~~~
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thanks, queued this patch for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
