Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB22C433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 07:24:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099F16187E
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 07:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099F16187E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9rq/SkB9NQLXTMHC+ttsh3XD+U3vX5YL+vVMsRIWvbQ=; b=mYoiEaDKYMDZDW2kmPK9XNq8s
	flgLb45hctAWGRxmwooq/0E7196kl12LK15ZIzRXTNHO728NCakzRCF13odZSpst1k7JPeo8JAkhw
	Cm63hoCBrlWwJ8cRTgqt0h7d4zO6E20Ip7b0OWk7zhXcuMMKwJQmQEKdWV4GTg3lXGAVgtdOxMn/E
	12gDFI+CPqC1afyJqVOZwMNRzEI44BGCJSWK3mjMFHAoJrUfGTBj4Zoaye0FLOYKROkHLXkrsVSbS
	AjaTNgJxBWs6pfhdwl/QLwA5GUJfbFYQm9UaZpfU+HOZJR9KTYVPlym1WcQu7dPDsnWxRnKjAEzQN
	bQP4rvv4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRVCf-005lej-7m; Wed, 31 Mar 2021 07:23:49 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRVCb-005ldW-BF
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 07:23:47 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MUXh8-1l18fA2KPI-00QVlF for <linux-riscv@lists.infradead.org>; Wed, 31
 Mar 2021 09:23:44 +0200
Received: by mail-ot1-f41.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so18094516otr.4
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 00:23:42 -0700 (PDT)
X-Gm-Message-State: AOAM532oR20AkqdVPd9ePsQaUl5s6PukJ6fBCWC9dP/e2VFKWmlZYhub
 ogb7nFTZ8smmHk1WbwKkmvupLEUcDC504wQFLnw=
X-Google-Smtp-Source: ABdhPJyFjdlUUk3RES+tTzVVGc5T+46fputAKsVs398NkEoU5yXLryRVHwS3WvNaSwrY7g6zSpkPdUih423pRxS1uwc=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr1671217otq.251.1617175421568; 
 Wed, 31 Mar 2021 00:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
In-Reply-To: <20210330223514.GE1171117@lianli.shorne-pla.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 31 Mar 2021 09:23:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
Message-ID: <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Stafford Horne <shorne@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>
X-Provags-ID: V03:K1:EtvzrCl469XAlGj0XQAZtMx/IvZvYpFUY5RgVzFIP+Cc4MM9VXe
 yWUVXcxHayhmWjdVbqItqPT90B6c/qVYpmFpX35Qeoaga2Gtm6W2lOywP6z/UM/fqcktjhW
 ulqxDVftu3b2yfNz3jaSQAAWCJb3qR+eUJEMHl38xaqTDhnV+UPFO1vJNKIRMr8txQ3xrTx
 LNvs+bNYFGbqvdnYaOSmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bAxh8AWo2n0=:SV1EtAa2nbmt4CPQljjq/e
 VpoUPAOCrk3DA6LmNUf/v1tYAK1834MwVaOeh/yMLSTG0gGKALALCQPpTCKnl9Il1g5khOSH6
 ednJGTg7GztMF0kK8keMTHa2EgzoxRAdev+TEoG0qyoZLAY1qT2krgzhGXGGtfR6dqIM2HShL
 YFSTUOMGqwMESSx7Av9FoEf/5oJezKmR2XZMWCS5dJpUumPoWEp+XxbEBjuVKJlysiqO5TIxg
 4EIRaBQy9CYEiYjpEwcBRg2eN3BEgI5SL+hgUOkPpc4vT/Ltl7hapxmOWUNfUqvwrlBS8SEH4
 DX3eClOeKc/A8E8EnPpLybujjreNVPF0aKPzgDez3aezMmoKKjhy0a7rn1c4+twDX2Jh4ZxEu
 INht/tR6lquyfVTN4ORTiiciJcM5GQ9O9lvBg06J2muR7FAg3gID+jsE8FP4H/plsH3M2QO/m
 gHALxJScGWmQVUZNd04timmD2krkLeNMP+s70tV49E9PxQ/dWU1TRRWBVOIYbZQ9i/YXzuEKn
 j7Qsk1IgZ4erSIzPN7uUYy9Dw6l2sXHKwcT6KLHdAB2l+0lN9Ki8qVKaZZXXtYg0//FiG5/Dq
 yiR3TRqjMGJvRMNw60mHyWDiwxkPVs0F2r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_082345_564491_852E91E2 
X-CRM114-Status: GOOD (  15.06  )
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

On Wed, Mar 31, 2021 at 12:35 AM Stafford Horne <shorne@gmail.com> wrote:
>
> I just want to chime in here, there may be a better spot in the thread to
> mention this but, for OpenRISC I did implement some generic 8/16-bit xchg code
> which I have on my todo list somwhere to replace the other generic
> implementations like that in mips.
>
>   arch/openrisc/include/asm/cmpxchg.h
>
> The idea would be that architectures just implement these methods:
>
>   long cmpxchg_u32(*ptr,old,new)
>   long xchg_u32(*ptr,val)
>
> Then the rest of the generic header would implement cmpxchg.

I like the idea of generalizing it a little further. I'd suggest staying a
little closer to the existing naming here though, as we already have
cmpxchg() for the type-agnostic version, and cmpxchg64() for the
fixed-length 64-bit version.

I think a nice interface between architecture-specific and architecture
independent code would be to have architectures provide
arch_cmpxchg32()/arch_xchg32() as the most basic version, as well
as arch_cmpxchg8()/arch_cmpxchg16()/arch_xchg8()/arch_xchg16()
if they have instructions for those.

The common code can then build cmpxchg16()/xchg16() on top of
either the 16-bit or the 32-bit primitives, and build the cmpxchg()/xchg()
wrapper around those (or alternatively we can decide to have them
only deal with fixed-32-bit and long/pointer sized atomics).

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
