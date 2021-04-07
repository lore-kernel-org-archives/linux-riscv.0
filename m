Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B59C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 14:29:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3337D611C1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 14:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3337D611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b9cRAhjwyTl1VPNLJD7AkmhDraEjqyaLfIy1ZRce9Us=; b=N8s5zf/AzbmALzGt0IZ4EpEFy
	DFpybJbsRlNlMXMwzF+Eyrk5APZkYwccXjGnkWhe6ECscte/XsB7BLj06k6w1z8iZI2c/OFK6mEhL
	uh/1/XeT9/o5GMVOKqlDElf2zDM5E3mUHDLo8ypeeJt2OTDOeTHQbs1RZ6eN8ZWuuCfcEQ7cii3vO
	BW9gZWzwJzgyb7KJWeubMxCuzTqWK0ZFGSZYrZrXbR1ybBl7Sz9Rtq1Gro0MjeMzc+0i9Fyt8/H3+
	NVJfIxI+C833CpkdQOTbNGFJRYQXtxMRmrPpaQVhBB1P6nZAlIWx0aDR/ZMNYE8ZnYJEsW56jfKcD
	RLv4RbKAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9BT-0059AL-SB; Wed, 07 Apr 2021 14:29:32 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9BO-00598b-5G
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 14:29:28 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id d82so4005260vkd.3
 for <linux-riscv@lists.infradead.org>; Wed, 07 Apr 2021 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RrhplHEW9q4d4F2AHFjRpj1n00z5X3YyF8zpTfRSZEQ=;
 b=DW9Y5KjGvU2yBGp9bPuo/LtmusFtpNJ53EdSdllv8/hBrdn8yjuCk4TX21DjDIzCqs
 8Epv8EhP7pkUSbtM2AGCrAi3H5cnasOs7yLUsdNqWnW+mYicauNf0x4oBHn6m0+3PWk8
 0Sl94xjjsqigSqsj+NxQ55ZKShHmtqcJSM9UcpEsVTWbCzsGPZcJCA1YcR5WRVA4SJNa
 L3Qbqg06CRduvti69UL1RiCjT3Pg5MEpmKjSVqWMb4WU1QuaqUS05rdXYgySLsoe8fYE
 td96MHExqIAxSKRURHJ8YBjHSkCKtvCqI1vvkX8efLklahklx6jTvIp1JvS0wdGT4uQl
 Hr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RrhplHEW9q4d4F2AHFjRpj1n00z5X3YyF8zpTfRSZEQ=;
 b=IFFgrLPF3FYt9ogZLdL+sD7ugnrEcKYIw861JAgtJSwsFZDEXU6VUyEJxHNcipCkb/
 27sI6fTtK8id9k29ROBmFAaWIlDnae5+w03PoOIAgSs8K3AZjEBSBuHCff14J9+ryXeX
 isBuDJhw74vnA0MInjYJo2CyGoZOiL3DEvtp7ykmuA1XBAexmMOgh+Y5uSJDPYcE169o
 w4rEc9GzyNWUYDihJzs+xPcUPRpnAkaJunQHusa7eOeNmORe8z4QKzQlDDeb3ObCV5xd
 FHj2w90Lppq6GYt3sqjM79fW6LVDuZ0HROyEUxRG0rnpa6ORzWF+fnYmiKpYIE7ZD/f/
 fuVA==
X-Gm-Message-State: AOAM532kCl28qZRJEOY2EzFM2w0Jfv9s/5SuxCt8q1rxhEvkXsqqveAs
 d5W7QcD2coyntznU+jQPppK0QOUi9RlKeCiKmO8=
X-Google-Smtp-Source: ABdhPJy6Hg+rsTi1P6bo6wi7EKEqiwOO7Rb2mBxRJDCxdvZywLSUQAaS33Vao9Z7pxmRUnNi1vgVo8GSBPCu+3i9Gyg=
X-Received: by 2002:a1f:5682:: with SMTP id k124mr1995507vkb.20.1617805764137; 
 Wed, 07 Apr 2021 07:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
 <20210407094224.GA3393992@infradead.org>
In-Reply-To: <20210407094224.GA3393992@infradead.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Wed, 7 Apr 2021 16:29:12 +0200
Message-ID: <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Christoph Hellwig <hch@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_152926_314031_F2F3DBC3 
X-CRM114-Status: GOOD (  21.01  )
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

On Wed, Apr 7, 2021 at 11:43 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Apr 06, 2021 at 09:15:50AM +0200, Peter Zijlstra wrote:
> > Anyway, given you have such a crap architecture (and here I thought
> > RISC-V was supposed to be a modern design *sigh*), you had better go
> > look at the sparc64 atomic implementation which has a software backoff
> > for failed CAS in order to make fwd progress.
>
> It wasn't supposed to be modern.  It was supposed to use boring old
> ideas.  Where it actually did that it is a great ISA, in parts where
> academics actually tried to come up with cool or state of the art
> ideas (interrupt handling, tlb shootdowns, the totally fucked up
> memory model) it turned into a trainwreck.

Gentlemen, please rethink your wording.
RISC-V is neither "crap" nor a "trainwreck", regardless if you like it or not.

The comparison with sparc64 is not applicable, as sparc64 does not
have LL/SC instructions.

Further, it is not the case that RISC-V has no guarantees at all.
It just does not provide a forward progress guarantee for a
synchronization implementation,
that writes in an endless loop to a memory location while trying to
complete an LL/SC
loop on the same memory location at the same time.
If there's a reasonable algorithm, that relies on forward progress in this case,
then we should indeed think about that, but I haven't seen one so far.
The whole MCF lock idea is to actually spin on different memory
locations per CPU
to improve scalability (reduce cacheline bouncing). That's a clear indicator,
that well-scaling synchronization algorithms need to avoid contended cache lines
anyways.

RISC-V defines LR/SC loops consisting of up to 16 instructions as
constrained LR/SC loops.
Such constrained LR/SC loops provide the required forward guarantees,
that are expected
(similar to what other architectures, like AArch64, have).

What RISC-V does not have is sub-word atomics and if required, we
would have to implement
them as LL/SC sequences. And yes, using atomic instructions is
preferred over using LL/SC,
because atomics will tend to perform better (less instructions and
less spilled registers).
But that actually depends on the actual ISA implementation.

Respectfully,
Christoph

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
