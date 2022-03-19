Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3732FC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiG6xNI1wT5g5pYarONeANDeNZJSPkE8rHaBKsAeUYk=; b=2724ZzRm28tuiT
	ibVMrjIlMbtVYN2uucaC8PgWMo0IWY1axKx3A6LS6+9P3Yupp720QNEWERuI544/lm+/J2guYCVby
	XOTQNAjSHthhKYk2+NdxcORXvzuAYmz1vBYmPyFmoxjocs5RPzx3yWnytv6x/p7c9OzL46he8EoGd
	IXOM419wyVHvB2g88ii+Wbhlai78MrkpNhqZejmjDCZHpXWgxiGwodCq6UDyJiKhpP6o6+NwcTPsX
	WyBDyy0dnWQhjL/ZiBFGUwRh/x/tASXzFqDuMG1neBptFL/r72IgXLSFUrH18YxPZB2ga3rtojAeX
	nI1REieGxvT30qRC3X6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVXdN-003i16-8D; Sat, 19 Mar 2022 11:52:37 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVXdD-003htH-RT
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 11:52:29 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MC3L9-1nNc4C3LGH-00CPpS for <linux-riscv@lists.infradead.org>; Sat, 19
 Mar 2022 12:52:25 +0100
Received: by mail-wr1-f53.google.com with SMTP id q8so3529322wrc.0
 for <linux-riscv@lists.infradead.org>; Sat, 19 Mar 2022 04:52:25 -0700 (PDT)
X-Gm-Message-State: AOAM532mnxsvigMaoWvzN4btGqCcciQq+Bmq4CRooTY8xxXf0N00/x4k
 alMMaaT18jAoXTtsvk8apf30iTbWXJJtjY+ndTI=
X-Google-Smtp-Source: ABdhPJzOqE/Bj2845oGYA9I/vUafx6lRNFhtD7eJ9j8Ek6fjOIipAB1M/2KUUME6tL7BmWOlQ180nTuXODQbbfNP21U=
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr4299612wrw.12.1647690745320; Sat, 19
 Mar 2022 04:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org>
In-Reply-To: <20220319035457.2214979-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 19 Mar 2022 12:52:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
Message-ID: <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Boqun Feng <boqun.feng@gmail.com>, 
 Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Openrisc <openrisc@lists.librecores.org>, Palmer Dabbelt <palmer@rivosinc.com>
X-Provags-ID: V03:K1:QBM0YlKAiVXNRtq3iV+g3RPcbBzHPXKldBOWDDs/D3h3fUIb4Go
 kHdCFmdF8Sjesw70S7Eb6yWSDWWt6VKdkvCZ+cyAhsJ8nkveaDyWenBhS0szxYwBHt7oO+U
 n5ivgXSvMZyvQjNQp5fS6+xroqZ0yJ0paQugdCLznFuu/u3wXop5oUWSZDspztHt4ab0aGg
 dbs/JdQFGTXAUyVDdgxiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fWNgjA8UAT0=:uFaVhc/WZ9PbRjVq6j8U8J
 vDdUj1ktMqxvho+FVzM6npeEoug9/wWkbI2vc5WnJGanAD5FA9hNceuR75pEIIPkLvMfPJjVV
 qZyoWSxbJqPyPZCEdNV+4jGCkigP2v6DX8fISJOBPSVr+TQvV3ea6h/eLADk7IlKWLid/Qrti
 65njS9SZTJG9MusFNnwE2bOMauMK5T37iVYtvZUMW8nuEYgkfEKDf2TU/i77yFO0rbNcw2sSn
 fE0JMzkbnerz67xudJidPZLhRS/n+MiWjzaknWD7cRxxG2UXWJgc5eXWFq6Jhmj3NRH5xm3BB
 rkvpqLu3Qpslspune15FQTuSLI2WkRJn/OT0PSk4ilDiSi/yl4AoAyGSidX923Z2a8icSIKZ+
 fQyuBr7oQpngrDsHpqaSHWwbdJytDSt1K1lg8ctJ3VV1x6BE22b8CoyfESX5i0KekIUnNu+x8
 lvsYnEdrATmrltbZ+zcPTkajD5TW3JkS1LwPeUvorhbFAmJYcLHJHSix5Ph9Vj8M1cc/G7B2P
 Vk3j+BpHiljXnf9Z7MjV0TdQyxTndpiB8RYU8HjaPNlhPA1ev0uVUQ0UKkfCDXbRcTrExpteL
 Y+HpGGVrean2ycd6OPEnMvQfqHOxQ/XBm1PqJVaBxsBXwGNxf8aka8KEKsoVlQrcZpAj5hx+G
 vueW4SNkNw7rzlvCj11DZ+72wfS5FRWUuFs3tKHktZLZtBlfqIq9ruDU32FMcoX5YsAgrgjnQ
 DNWL/zOf1jVJD83p069prl7v1wreV+1AJKRfR3RjFyBBDyx8dhTZSJlvMkPHAHLndyObqEYhR
 GzbSLPp9VINkdwK1bzZNpJfZIUujZp9nFSuWTLpfaUAn95rHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_045228_232358_E4C0B48E 
X-CRM114-Status: GOOD (  12.61  )
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

On Sat, Mar 19, 2022 at 4:54 AM <guoren@kernel.org> wrote:
>  /*
> - * You need to implement asm/spinlock.h for SMP support. The generic
> - * version does not handle SMP.
> + * Using ticket-spinlock.h as generic for SMP support.
>   */
>  #ifdef CONFIG_SMP
> -#error need an architecture specific asm/spinlock.h
> +#include <asm-generic/ticket-lock.h>
> +#ifdef CONFIG_QUEUED_RWLOCKS
> +#include <asm-generic/qrwlock.h>
> +#else
> +#error Please select ARCH_USE_QUEUED_RWLOCKS in architecture Kconfig
> +#endif
>  #endif

There is no need for the !CONFIG_SMP case, as asm/spinlock.h only ever
gets included for SMP builds in the first place. This was already a mistake
in the existing code, but your change would be the time to fix it.

I would also drop the !CONFIG_QUEUED_RWLOCKS case, just include
it unconditionally. If any architecture wants the ticket spinlock in
combination with a custom rwlock, they can simply include the
asm-generic/ticket-lock.h from their asm/spinlock.h, but more
likely any architecture that can use the ticket spinlock will also
want the qrwlock anyway.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
