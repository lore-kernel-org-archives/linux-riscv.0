Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41683C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 07:12:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E83E61999
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 07:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E83E61999
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZOGqrUNPWm0/FGTKZytkfsLP/RMMPxg+RKtRHVcovmM=; b=T9wth8FNa9ENMiQRCwwAUTvuA
	tQ8nPZEg+S3DFybeBC1brcQixnILCzHbgJdamOC2IBUan75PxBW6XbcUlmkOcoAjLgVOirlKQSw6W
	nQNs0n+R22AwiivJccGmZfzMWZeQ8VEpshOyS8GCMoRSGC3AJZajXFYJDgJ+0eOK6KdL6uVQ+zBaz
	ITJ283hO4CqnmS2N7xQv57/fJVr1u58Wd0FPdadvzQImgFFhVufPlDxKsSK9TdiIgPDX12Bjg+uhI
	JBGDlfVpjD5ojdthqafvchtyirqlKHuV1KlkquyL4TY/eEYnxrHISo8dULH6qnIypECWFnbUPEYwa
	bwYqhyMpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8Xy-002tsg-1a; Tue, 30 Mar 2021 07:12:18 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8Xr-002trg-CG
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 07:12:15 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MhToz-1m4Kur0Egl-00ebLD for <linux-riscv@lists.infradead.org>; Tue, 30
 Mar 2021 09:12:06 +0200
Received: by mail-ot1-f53.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so14724364otr.4
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 00:12:05 -0700 (PDT)
X-Gm-Message-State: AOAM531nyOdzWxZn1nt07qabj1EF3VJtxV8+g4sipwVvgkbwyrNvUklF
 /359u5J7KpRjVV8JIXIH+vQt0IM2qZNfVS/iqyI=
X-Google-Smtp-Source: ABdhPJxrmSwVSZDP48DP+ikIRCBts1IlD1OfpYYF4tYk3/WxR/8UdJvAQaT3CYFMV6J7JYaeLxkX8qHf4eLpRGNv27Q=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr26882538otq.251.1617088324803; 
 Tue, 30 Mar 2021 00:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
 <YGG3JIBVO0w6W3fg@hirez.programming.kicks-ass.net>
 <YGG6Ms5Rl0AOJL2i@hirez.programming.kicks-ass.net>
 <CAJF2gTRwd0QpUZumDFUN1J=effv67ucUdsQ96PJwjBhPgJ1npw@mail.gmail.com>
 <CAK8P3a3jpQ7dDiVG0s_DQiL6n_MdnhYHMjqFfJ92JJBJFPQZPQ@mail.gmail.com>
 <CAJF2gTSpnHndT9NkrzvNP6xvqV51_DENwh2BHaduUnGyUE=Jaw@mail.gmail.com>
In-Reply-To: <CAJF2gTSpnHndT9NkrzvNP6xvqV51_DENwh2BHaduUnGyUE=Jaw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Mar 2021 09:11:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0DkbM=4oBBhA2DWvzMV7DwN1sqOU8Wa1qFtpd_w7iWmQ@mail.gmail.com>
Message-ID: <CAK8P3a0DkbM=4oBBhA2DWvzMV7DwN1sqOU8Wa1qFtpd_w7iWmQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
X-Provags-ID: V03:K1:M0Qza6Hu10nYSMg7NJ5R07h0CdOPq8tmmlRcADes2rlRp1Cdyo0
 fSgSiHYmG9plYKNwCKqVQY+wUPKs2GeObFCsKxJODH/K/QwxldfsViPS4WaQKO7X15cn7tH
 gtJ2XG9G8hd0t3h+WTNj6nuvOC3JAbX2djWrMZOuQVxJC+z8jXDvOQuhiPnFQA7Fmn953DW
 xWe/xRnG1grceBGHVzkTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f7Zcx/lWwPk=:kO82ZxeLaDvD+z8I8PAwTU
 mJoh+vNdab6pDsoslurErBE+8HVPgEhsMzoIKIylSfsYalYNcUi5xr3wyi2tKWY1GYDVSPGnV
 2WtMZ8EAnAQW/SF98sxxaAQcwith0rqpse4VqjQrN5nPrMLDeDpr0cRgcw7OZHmIabTy50xuM
 SpSKL4TZKCKGAGRNY+SSMN7coCHS9ta14wFpx/ir9fM37YnO7j9FXiWOY2FDKcUk4X85B+cKz
 ZqOXWMdsQbhgqi0xH8Ws0M7KNqo/+oFkDjpmdKkHhrtMzvYZgYAJTDVQJjRiis1T8QkP967EM
 rXRURfjyV0lcKH0Yklbx3EKI3nOBgMwJ7IdYqc/Q703hCC3JSyMdBSYWqw08yp5nzt58Qc09H
 PuUf/pSfyewQrXEAeTuUG3ZaSSnHtiU6VrUMP+WooHZfq5Zxo6tQUOOadNolDk8ZZCrfyVlmr
 5zwkWHU0W1YuEfd8NPKkIcCz2SzA8OQJ/2q4emjLqmvK43SiEBE2RwviEY6LTdZN3/kgC8luk
 sLDEtjecuGo/gQxkjM/dIJS6VIBGhnGmAhtgFAmTPbLtiOxc81HsF76qAIedVR1lEwAdmBr90
 dMXZ2+Tu+M8F0ie+pijjL6iWKJ0Jkkt0V1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_081211_765348_690CA2B1 
X-CRM114-Status: GOOD (  27.33  )
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

On Tue, Mar 30, 2021 at 4:26 AM Guo Ren <guoren@kernel.org> wrote:
> On Mon, Mar 29, 2021 at 9:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Mar 29, 2021 at 2:52 PM Guo Ren <guoren@kernel.org> wrote:
> > > On Mon, Mar 29, 2021 at 7:31 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > What's the architectural guarantee on LL/SC progress for RISC-V ?
> >
> >    "When LR/SC is used for memory locations marked RsrvNonEventual,
> >      software should provide alternative fall-back mechanisms used when
> >      lack of progress is detected."
> >
> > My reading of this is that if the example you tried stalls, then either
> > the PMA is not RsrvEventual, and it is wrong to rely on ll/sc on this,
> > or that the PMA is marked RsrvEventual but the implementation is
> > buggy.
>
> Yes, PMA just defines physical memory region attributes, But in our
> processor, when MMU is enabled (satp's value register > 2) in s-mode,
> it will look at our custom PTE's attributes BIT(63) ref [1]:
>
>    PTE format:
>    | 63 | 62 | 61 | 60 | 59 | 58-8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
>      SO   C    B    SH   SE    RSW   D   A   G   U   X   W   R   V
>      ^    ^    ^    ^    ^
>    BIT(63): SO - Strong Order
>    BIT(62): C  - Cacheable
>    BIT(61): B  - Bufferable
>    BIT(60): SH - Shareable
>    BIT(59): SE - Security
>
> So the memory also could be RsrvNone/RsrvEventual.

I was not talking about RsrvNone, which would clearly mean that
you cannot use lr/sc at all (trap would trap, right?), but "RsrvNonEventual",
which would explain the behavior you described in an earlier reply:

| u32 a = 0x55aa66bb;
| u16 *ptr = &a;
|
| CPU0                       CPU1
| =========             =========
| xchg16(ptr, new)     while(1)
|                                     WRITE_ONCE(*(ptr + 1), x);
|
| When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.

As I understand, this example must not cause a deadlock on
a compliant hardware implementation when the underlying memory
has RsrvEventual behavior, but could deadlock in case of
RsrvNonEventual

> [1] https://github.com/c-sky/csky-linux/commit/e837aad23148542771794d8a2fcc52afd0fcbf88
>
> >
> > It also seems that the current "amoswap" based implementation
> > would be reliable independent of RsrvEventual/RsrvNonEventual.
>
> Yes, the hardware implementation of AMO could be different from LR/SC.
> AMO could use ACE snoop holding to lock the bus in hw coherency
> design, but LR/SC uses an exclusive monitor without locking the bus.
>
> RISC-V hasn't CAS instructions, and it uses LR/SC for cmpxchg. I don't
> think LR/SC would be slower than CAS, and CAS is just good for code
> size.

What I meant here is that the current spinlock uses a simple amoswap,
which presumably does not suffer from the lack of forward process you
described.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
