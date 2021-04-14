Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50262C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 02:27:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE062613C4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 02:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE062613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ChJdrruJ87TrY86I98vWwgU3mDgVVebk39qp3dgez+U=; b=KEVv+hOgemH2tsOutOHWUqihO
	l9aclg+kZWLFAAErxw4OphaqFQMpQ8mjrMV10EdjJcVaDR/5OmT458XiiQje2SqRbc12+PNqi8toR
	Mzr1yfWIldibAQsGfPDwH9K39xlqrprGmXzl6cIbN9w02jFwn02nW/4pW6ke56GaIqcXLfhAPCwkG
	idxj7R60RNwVoJaq/nhdCfW+dTpttHPIA/z+AD20a9jAPCtAwwRbBZo+96WfvUtaqxXtIXfSy5U2g
	todonQK+M4YlYRqcrvRRW0kSUwl06XNi9j2yf2I6QBGJZUU6nNFxZzEUF0jDm0eIu3cd5q3vckXRu
	d52QFz/LA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWVFR-00BAmR-FY; Wed, 14 Apr 2021 02:27:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWVFL-00BAlO-Ba
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 02:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xOchrbki+75UNK0eGQq7LwuVpILXhI2TTr8G83u5JsA=; b=ErC2fUwt3QoD2Dol19Yx3bNxR/
 ZOTD4D5BBg/kcDMfRvZnUbkyRtzVR3gMnwnOgVMHJ4cXO9YjZ8m5w4JXhsa8LTYZlUOx2b4Wp6qA6
 t9c/cWgmA+aMueXWEXRYtVhfahNSUHCVUXxIf54IUNKvnu43/D85upczYr33RVxxi5nnWX/j1Q+sm
 NLcjSdXkihnWax+Vc8209uUVYFMX2EEAmJFUUYgfywwSScCLt8sp2L3aNY06JkPP0VWc3bNvKCrZ3
 PfJEcaOAAKPM8L/MIlc1Eh7Dew+Z48J9Z+oFQlXOnf+wy0GPV1fdh5XUYrLufTESROyPu3hLhgFR1
 s2aaD2Qw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWVFI-007RS3-NH
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 02:27:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 529A1613C4
 for <linux-riscv@lists.infradead.org>; Wed, 14 Apr 2021 02:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618367232;
 bh=vR+xGgJ1ZvdzE9ADVoHb98+6LJMTwciDUAVKDrWvdhI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BHzyfHdblEjat8zBIbZgTT0PLHhMEb8vwhiy0IFBjsvH2dchUibRpAVrZM6KIdVeu
 jfXYuT0yymaRrKXTBjPIrIoZzHIRP3Z5eNGMgrsR97ou4KqGrMyhpNeqwon7s7Mcvg
 tbT8ELBtmzlmpxngU36zG+IkWbm3zZK0wQwzO3r77tq7TPpK90Ojt6cqSKIuo2+XUM
 ynCMaPpYYdsPzWQzFx2OX94Hh/kitZLAx7yR8F/t7UpH/toS8ZvCkbzmBGzDk8PJDK
 WkIo6V8prGyHnUIui/3cj0sNT82zGsyxSiF3BAtwbpOwsBm9WHpx36JRsunJPqrHJw
 4Su1BFaczsHjQ==
Received: by mail-lf1-f41.google.com with SMTP id f41so7196954lfv.8
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 19:27:12 -0700 (PDT)
X-Gm-Message-State: AOAM531dfPU+/qA8PqwUAMszLRYwOqJhM32XfmEYpFtBkEuwIkdI7Pa7
 L3IN3yTxnG8YXoQeL+VoEvsM3hMARH4M6RNq+zc=
X-Google-Smtp-Source: ABdhPJy7VEgmZ+iMoGsQksNaDynISBuYMg7ywSL8k0F1mmkVV8QOLDpxORYNJaXvx2rEWbV2DYsQkOmJebE39XOxVM4=
X-Received: by 2002:ac2:4e84:: with SMTP id o4mr1971646lfr.557.1618367230801; 
 Tue, 13 Apr 2021 19:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
In-Reply-To: <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 14 Apr 2021 10:26:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
Message-ID: <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_192712_817805_AAB883DC 
X-CRM114-Status: GOOD (  17.20  )
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

Thx Peter,

On Tue, Apr 13, 2021 at 4:17 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Apr 13, 2021 at 10:03:01AM +0200, Peter Zijlstra wrote:
>
> > For ticket locks you really only needs atomic_fetch_add() and
> > smp_store_release() and an architectural guarantees that the
> > atomic_fetch_add() has fwd progress under contention and that a sub-word
> > store (through smp_store_release()) will fail the SC.
> >
> > Then you can do something like:
> >
> > void lock(atomic_t *lock)
> > {
> >       u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> >       u16 ticket = val >> 16;
> >
> >       for (;;) {
> >               if (ticket == (u16)val)
> >                       break;
> >               cpu_relax();
> >               val = atomic_read_acquire(lock);
> >       }
Should it be?
       for (;;) {
               if (ticket == (u16)val) {
                       __atomic_acquire_fence();
                       break;
               }

>
> A possibly better might be:
>
>         if (ticket == (u16)val)
>                 return;
Should it be?
         if (ticket == (u16)val) {
                 __atomic_acquire_fence();
                 return;
         }

>
>         atomic_cond_read_acquire(lock, ticket == (u16)VAL);
>
> Since that allows architectures to use WFE like constructs.
>
> > }
> >
> > void unlock(atomic_t *lock)
> > {
> >       u16 *ptr = (u16 *)lock + (!!__BIG_ENDIAN__);
> >       u32 val = atomic_read(lock);
> >
> >       smp_store_release(ptr, (u16)val + 1);
> > }
> >
> > That's _almost_ as simple as a test-and-set :-) It isn't quite optimal
> > on x86 for not being allowed to use a memop on unlock, since its being
> > forced into a load-store because of all the volatile, but whatever.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
