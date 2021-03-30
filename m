Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E75C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 03:15:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40DA860C3E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 03:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DA860C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jI4WKnAU07j3vAxcq2eYc7cIiMX0JZdG7LbUv+buP3k=; b=SQN5trwjuHE8IRo22/VGAJXvZ
	4Sw0pptr+SkY3/dd1cmEj8J7c+9MmGw5t7OEiDlKEDTXg8GmZC8IWDvQXugb+CYAAvEXuSPvcZ2RN
	J3SAiLr15DXlzGEU/hrsEiEx9Hm+tD/CzSkJ1SJBvr9TG37m3M/3WVCY2z/0GFH1UxG87GnZ3WeJL
	vMiz8WPQqOl128njTDMz7JBJAwVqizlVOT2oWUdS+YYFLBSDaRNOkf/+BO1cDISGfXk/s+NHnsdJZ
	rqh6IHtN0Vq+zu4SYk0nfA6X5cCEBLPzndHLIBiupaldhcZJRsdDiDMSsgr9ttSor9kGhF2l6A/Lj
	9wW9ofydw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR4pf-002XVZ-1K; Tue, 30 Mar 2021 03:14:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR4pZ-002XUg-Ht
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 03:14:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0057B61996
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 03:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617074049;
 bh=6eSMLRiak11IODOB+CePI7a65DX9N8EkAy9ZzrCIP+E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KdMi5KiMduBWy6xItpcEY9isb6e1nAEdmm9B7NVKTZqjF7+XWdljKvaUejdZRj94U
 qX67Y1c/XOgi9ZKIGLXXCN4VvmqEwFf8du1gXCAXZD3bTU4HmKJ0MLlEWg/JIAwinH
 WXgA5tPnnDNdUb2WG2acEptutFjaiM2ZY08Tl7DYFPvkKg2VJ1N4OCgFtiCsoGXX7k
 WEF9v+hEtplZ766rLquAVZYq5UOENcf9DfrgULGkGDm8uLzhLQkFGtDGkJjmlALSGK
 aMMzRqLK9GmKpYm5j27NOW0PIxO+ssEnNA45LMd+ldPrTaoq7fPTZATXycZfHSAbc6
 UkH9hUYA93fGQ==
Received: by mail-lj1-f175.google.com with SMTP id u20so18175079lja.13
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 20:14:08 -0700 (PDT)
X-Gm-Message-State: AOAM531G6cppp4Bi/l4oMrn8CAfZblX/3PaJnfy9kY/IT2o6PLNHXM3v
 NxzOltKW9H3KmxN4eCjGwVPHRvyFL+smCPLdVWY=
X-Google-Smtp-Source: ABdhPJybBWMS4ER6LoDJh0lOBZ6phOaqhlXDyrhTcDXbHrJqobU5QYkYxbC743xlAK9DNTW0TUKWXN1k7NjP7snB74o=
X-Received: by 2002:a05:651c:211e:: with SMTP id
 a30mr13812844ljq.18.1617074047272; 
 Mon, 29 Mar 2021 20:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
In-Reply-To: <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Mar 2021 11:13:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
Message-ID: <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_041414_039323_7247B462 
X-CRM114-Status: GOOD (  15.58  )
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

On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > u32 a = 0x55aa66bb;
> > u16 *ptr = &a;
> >
> > CPU0                       CPU1
> > =========             =========
> > xchg16(ptr, new)     while(1)
> >                                     WRITE_ONCE(*(ptr + 1), x);
> >
> > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
>
> Then I think your LL/SC is broken.
>
> That also means you really don't want to build super complex locking
> primitives on top, because that live-lock will percolate through.
Do you mean the below implementation has live-lock risk?
+static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
+{
+       u32 old, new, val = atomic_read(&lock->val);
+
+       for (;;) {
+               new = (val & _Q_LOCKED_PENDING_MASK) | tail;
+               old = atomic_cmpxchg(&lock->val, val, new);
+               if (old == val)
+                       break;
+
+               val = old;
+       }
+       return old;
+}


>
> Step 1 would be to get your architecute fixed such that it can provide
> fwd progress guarantees for LL/SC. Otherwise there's absolutely no point
> in building complex systems with it.

Quote Waiman's comment [1] on xchg16 optimization:

"This optimization is needed to make the qspinlock achieve performance
parity with ticket spinlock at light load."

[1] https://lore.kernel.org/kvm/1429901803-29771-6-git-send-email-Waiman.Long@hp.com/

So for a non-xhg16 machine:
 - ticket-lock for small numbers of CPUs
 - qspinlock for large numbers of CPUs

Okay, I'll put all of them into the next patch :P

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
