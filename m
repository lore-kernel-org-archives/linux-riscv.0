Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021D7C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 09:27:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8562B61394
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 09:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8562B61394
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9LIwYCZWNUZQ5r5fcAAe7Wt7v7iwiNwPY48TDCxE+LM=; b=q3bh/iq9KFGELVj3oP2gDcKD+
	jqoCorH8uLoVo09xmN9tPkw14/Sbb4N5WpbjzSeiSMnF31OXksZtiKsVWen0tbOHshLqmNUuAKWtz
	fyB5B9y+5a4FO4W4qVwDxdgOCXZfDLVB8Brr78i511JszbIvH9ZQ9ocbtbRkgiG5ELo1AZ3ywVIAp
	jXg1hvzf2wPkpQ8uW1sxuwMEFOSEXO3QLX6+rnc+GWpR3GI90nMyCRfLv6t2MxT0KdmXJNGQvWWqE
	eDyO/rehxQBhpBDuXCy9+Sei60VsGrQ6yP9eIrDqcjowdT4kdRq9etjhyC6CSQC9rFUPtX0iWw3BC
	27EKScwAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU4Sg-004bkx-J9; Wed, 07 Apr 2021 09:26:58 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lU4Sc-004bir-Sa; Wed, 07 Apr 2021 09:26:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 472D130005A;
 Wed,  7 Apr 2021 11:26:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3371224403DB7; Wed,  7 Apr 2021 11:26:54 +0200 (CEST)
Date: Wed, 7 Apr 2021 11:26:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YG163mtOkTPgbqL7@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGyZPCxJYGOvqYZQ@boqun-archlinux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGyZPCxJYGOvqYZQ@boqun-archlinux>
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

On Wed, Apr 07, 2021 at 01:24:12AM +0800, Boqun Feng wrote:

> Actually, "old" riscv standard does provide fwd progress ;-) In
> 
> 	https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
> 
> Section "7.2 Load-Reserved/Store-Conditional Instructions":
> 
> """
> One advantage of CAS is that it guarantees that some hart eventually
> makes progress, whereas an LR/SC atomic sequence could livelock
> indefinitely on some systems. To avoid this concern, we added an

This is not inherent to CAS, there's plenty of CAS implementations that
are prone to livelock (unfortunately).

> architectural guarantee of forward progress to LR/SC atomic sequences.
> The restrictions on LR/SC sequence contents allows an implementation to
> **capture a cache line on the LR and complete the LR/SC sequence by
> holding off remote cache interventions for a bounded short time**.
> """
> 
> The guarantee is removed later due to "Earlier versions of this
> specification imposed a stronger starvation-freedom guarantee. However,
> the weaker livelock-freedom guarantee is sufficient to implement the C11
> and C++11 languages, and is substantially easier to provide in some
> microarchitectural styles."

Pff, that's just stupid. I suppose the best you can say of the C11
memory model is that it's nice that the C committee realized they needed
to catch up to the every day reality of SMP systems (which people have
been writing 'C' for ever since the 70s, since SMP is older than C
itself).

There's so much wrong with the C11 memory model and atomics, using it to
define an architecture is just backwards.

C11 cannot do RCU, C11 cannot do seqlocks, C11 cannot do deterministic
locks, C11 cannot do real systems.

C11 is garbage.

Yes, architectures need to support C11, because sadly C11 exists and
people will use it. But architectures also need to be able to do real
systems and thus should not limit themselves to C11.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
