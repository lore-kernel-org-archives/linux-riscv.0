Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05CFC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjXQoH6ojP9bP6VuRELCCvO9K+5C2yX9CsK/tzxC6y8=; b=YuPKdGvwrO3WCA
	QQ+6qVYCPMmg0ZfWN8So1cxZkiRYgWQi2Er+oIWfZRjKBRPdc2sEWGxeOHr28+UrSr0IFexiso1E0
	4+i2JQ9uzVEGWncNmtrQ5V4u9Bzp4pCxN9ZElT0plLslqxe1opCdFSIz0jT4j2h5Qcw1dGWedPFce
	ghxOWlLpirNpLD5aCJguI6XnM0/kgz++HuvPwGr17GHaFljNrHumoIpemNfg3ttPB1xLsJYU/wZhb
	aQH7+6PEo0UbJYeDoAgR2R8In3Kshpg8yRLpgnBeMa8BeSwSnDwH5Jzi8751D38aAj9k2hm+8dc5G
	v1BtVlnCT8DI6JrPdpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVZ6a-003q1k-3j; Sat, 19 Mar 2022 13:26:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVZ6X-003q0S-En
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 13:26:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 24415CE0B08
 for <linux-riscv@lists.infradead.org>; Sat, 19 Mar 2022 13:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89122C340F3
 for <linux-riscv@lists.infradead.org>; Sat, 19 Mar 2022 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647696403;
 bh=/cegirEsmDFTjrf/jcxsGyePYHoVLLLJoW1NFjz4T5Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UmxrhwNaCnUWbJzDElDW7iWolt4CGGYJhefwhRmFTmzo2j87XTi4xTuJVs36kD5JG
 69RQ0mQCebSeuQ4AhaJApoX6VwElGf7V4BC8rfUkwWuvgpiaaPa3jGb3o+snOuTb2k
 NOW79cQNRqST7BAGRYUWAORXaDzvmSAg2B6w248PC3R6nvaui/SHW8FJ2hedBRDgYo
 coYR2xN+VaEyBa5EG9Wai4ohwlKADQhwfahLv5/R367rf9RlJFSK9pU+2Fz8mcgQcd
 RVyhLuTavC+pBjRe+rn71qGpXmglQXXvufsvxt9fTW+IlNYvFfJGdI4qYf+k3jbdu9
 86UD75gQwZlKg==
Received: by mail-vk1-f170.google.com with SMTP id 188so2272438vku.5
 for <linux-riscv@lists.infradead.org>; Sat, 19 Mar 2022 06:26:43 -0700 (PDT)
X-Gm-Message-State: AOAM530Gt2nAAxITlDziNM0K2x0HXkDnAAHQB5ZOChrZrFt23sILJc0R
 sSIxcrcK0fIQd5MnIRWWyJKhDMXzICuw79gLHik=
X-Google-Smtp-Source: ABdhPJxG6qrxPivDMuPuCDhlEL9zUSIkjTquHlcXEinKt2wIvI4so3PHrSQEnmjVSdhEdSsEmEbGCrUxLkOxGgBZ5z8=
X-Received: by 2002:a1f:7f17:0:b0:336:cede:7f97 with SMTP id
 o23-20020a1f7f17000000b00336cede7f97mr5353580vki.8.1647696402468; Sat, 19 Mar
 2022 06:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org>
 <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
In-Reply-To: <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 19 Mar 2022 21:26:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRvOLZPP_PYOEPMkr0S3vTSiPZOCFOmiVRXxi2QRu-vMA@mail.gmail.com>
Message-ID: <CAJF2gTRvOLZPP_PYOEPMkr0S3vTSiPZOCFOmiVRXxi2QRu-vMA@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
To: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Openrisc <openrisc@lists.librecores.org>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_062649_883531_03CAE2B2 
X-CRM114-Status: GOOD (  18.69  )
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

On Sat, Mar 19, 2022 at 7:52 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Mar 19, 2022 at 4:54 AM <guoren@kernel.org> wrote:
> >  /*
> > - * You need to implement asm/spinlock.h for SMP support. The generic
> > - * version does not handle SMP.
> > + * Using ticket-spinlock.h as generic for SMP support.
> >   */
> >  #ifdef CONFIG_SMP
> > -#error need an architecture specific asm/spinlock.h
> > +#include <asm-generic/ticket-lock.h>
> > +#ifdef CONFIG_QUEUED_RWLOCKS
> > +#include <asm-generic/qrwlock.h>
> > +#else
> > +#error Please select ARCH_USE_QUEUED_RWLOCKS in architecture Kconfig
> > +#endif
> >  #endif
>
> There is no need for the !CONFIG_SMP case, as asm/spinlock.h only ever
> gets included for SMP builds in the first place. This was already a mistake
> in the existing code, but your change would be the time to fix it.
>
> I would also drop the !CONFIG_QUEUED_RWLOCKS case, just include
> it unconditionally. If any architecture wants the ticket spinlock in
> combination with a custom rwlock, they can simply include the
> asm-generic/ticket-lock.h from their asm/spinlock.h, but more
> likely any architecture that can use the ticket spinlock will also
> want the qrwlock anyway.
I agree, !CONFIG_SMP & !CONFIG_QUEUED_RWLOCKS are unnecessary.

@Palmer, you could pick back the series, thx.

>
>      Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
