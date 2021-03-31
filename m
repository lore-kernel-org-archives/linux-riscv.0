Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0625C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 15:23:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CEB660725
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 15:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CEB660725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=frbdRV9UQ2dgXz5qk0Sdpu+K8NIm8bvgUhCMgr20+Lo=; b=j8QTVhvIHGMuKaPuNCZUMN5q6
	4sz1qo+Eu99aK+i4ylccxpAyvJqWpFlT7Iq4UZg3JyEIJfXd7e9jrslVkr6aBye4PAwff4hxlOQBJ
	jCO76Rg2f4JpJWJ2SCOa0ccdyQ3NcmR0Q6ANpAzhEaWFFPgo7Rgs8Nv0lEEbJQQYmrOrzY/KSs9VD
	J73RCc2Ik5GDyjdnjpJ2y5ylihmWdFp2XenryT28Ok91HE0Vd9LBcqOCul3w16A148+ViroFCd2us
	8VqKpUi+PKv9bSS6o6Iuunl2wQ2D7Rb6froJLjU3X+/VVRGNn4KxMHjc4E0XJHSUauuyq7Vt0xqNj
	ncs3Bamsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRcgJ-006spF-AI; Wed, 31 Mar 2021 15:22:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRcgF-006sol-5X
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 15:22:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 296BE61026
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617204169;
 bh=PZdA6OkQUCLD5T11j2SNQAmYxalWfS4mcTSD9MYFgH8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YljbhkIq0F8lakNXom3/CkHs2H6x8QHGkFFZqK23JScFpSHb6ph/e3/HwgzbsPE31
 7QFsjXaAAT+a3BFbnwWMv2uOild3eZHsl5iPndsKmT7QkoVrdMwlibUjiK9VXljBFG
 6OIQ8lK0mAnujwVIabpBd8/0oUg8CBUZqmWHcDaP+TeYP1emj+mok6tCR74t6jerMd
 W5U2/Ppuh9xb7XDSZ5WTQTKiwqI5XD+YP6e5zC0ABMb6q3bZKI6+9EVfGAk+/IW3Ps
 Jn/RlcjuGMPL3ABiCCFI7LY/YDOOGddfU5zxolPsOqm11X9kfL2vGKxAq8+xzzhUYT
 MKzeNJTYHGlzw==
Received: by mail-lj1-f180.google.com with SMTP id s17so24320685ljc.5
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 08:22:49 -0700 (PDT)
X-Gm-Message-State: AOAM531euVnof2IZVCbS2rGUcm4RWE3tGkhbxrm34Dtax7UAQ2bHEVQS
 R3pIkRX4W9Kgj5tJQu4NKrB4gbTZdt922JgCUas=
X-Google-Smtp-Source: ABdhPJxH7HojAHVGxjaEG7h6yZ0vTSAW4NtjIt7Xau7864vwv4W45Y5iltVUKESj/hE0oy9GG5oWhEubNFctDEY0GLY=
X-Received: by 2002:a2e:919a:: with SMTP id f26mr2446120ljg.508.1617204167433; 
 Wed, 31 Mar 2021 08:22:47 -0700 (PDT)
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
Date: Wed, 31 Mar 2021 23:22:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
Message-ID: <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210331_162251_647133_B0D569A2 
X-CRM114-Status: GOOD (  16.03  )
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
No, it's not broken LR.W/SC.W. Quote <8.3 Eventual Success of
Store-Conditional Instructions>:

"As a consequence of the eventuality guarantee, if some harts in an
execution environment are
executing constrained LR/SC loops, and no other harts or devices in
the execution environment
execute an unconditional store or AMO to that reservation set, then at
least one hart will
eventually exit its constrained LR/SC loop. By contrast, if other
harts or devices continue to
write to that reservation set, it is not guaranteed that any hart will
exit its LR/SC loop."

So I think it's a feature of LR/SC. How does the above code (also use
ll.w/sc.w to implement xchg16) running on arm64?

1: ldxr
    eor
    cbnz ... 2f
    stxr
    cbnz ... 1b   // I think it would deadlock for arm64.

"LL/SC fwd progress" which you have mentioned could guarantee stxr
success? How hardware could do that?

>
> That also means you really don't want to build super complex locking
> primitives on top, because that live-lock will percolate through.
>
> Step 1 would be to get your architecute fixed such that it can provide
> fwd progress guarantees for LL/SC. Otherwise there's absolutely no point
> in building complex systems with it.
--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
