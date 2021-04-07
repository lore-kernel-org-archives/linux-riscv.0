Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2474C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 09:43:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973EA6135D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 09:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973EA6135D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2R5Iffzzt9UCEWf8J7Zro0E4ZF4rbbKH4Ue/0l0UMx4=; b=WHEjXVHaZBKJp7FBRIMNg387W
	ooWjFT20DMsEIe0jgmW8gwroyl1hbnBs3WO+PCnQ03qEB1mMiTKyjVo9O/4HriNNINsBAO0j90rzI
	0Y6Lt39zPzM/a11m74S5bJp+rHQqRYNRBfSd7tb1y2eJ5ALgcH8p/rJ1vfLlWX/Fx/xv1n/UAXXSi
	5yZGNZI6smzxfpqJSaelZuaRQArVPhFPySa+FXzjf1+UnnAgR2WaxhaPFqBa3q/xxFU7FVQwLHQJX
	nDPgvj2tobW5ku8Sn7mEyz8spwWkfI34hYr0kO/8xVHkxlV5+R4BIQ7M237tG/NXOJbnp/UyL9b/6
	CPQAWt4qg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU4iO-004doy-5r; Wed, 07 Apr 2021 09:43:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU4iM-004doj-7G
 for linux-riscv@desiato.infradead.org; Wed, 07 Apr 2021 09:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uHRRfQiUBlAZ+WTehIjctPz3UPqgqzr8MZeVhYIZJnY=; b=TiUqf7vIpHbIUyAQ2LLRGADfFO
 sXUzLx7KL6B+iS3V+LlPGebBQ+n2zSzcmzF4HoVj6LSDpw7kj7CZRMClGNuMmNk8EKkoJ5/Whf5Yg
 mpdjOxQxHEaKKIfcVprBXVDi1sxySzND4ACUgaRggQQJ1sBmr5MWj0lUTICjF5eoVV6lGhMEMuR6X
 YzQKXCvyVBM+LiR7KwHDVGI6jrRelZ6TEDdI857fL140/jbgSJ0NoHMjMriLTs8TUbhu7v5zi6ah/
 KswtpdjjZMAwKlCMh55ch/rjKrXTOEb7dO3jl4tjEYq/+X5TGvWzI9a7UDmXTxGlx4lFejMoysRfx
 BGoFPCig==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lU4hc-00EFuS-3a; Wed, 07 Apr 2021 09:42:42 +0000
Date: Wed, 7 Apr 2021 10:42:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210407094224.GA3393992@infradead.org>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Tue, Apr 06, 2021 at 09:15:50AM +0200, Peter Zijlstra wrote:
> Anyway, given you have such a crap architecture (and here I thought
> RISC-V was supposed to be a modern design *sigh*), you had better go
> look at the sparc64 atomic implementation which has a software backoff
> for failed CAS in order to make fwd progress.

It wasn't supposed to be modern.  It was supposed to use boring old
ideas.  Where it actually did that it is a great ISA, in parts where
academics actually tried to come up with cool or state of the art
ideas (interrupt handling, tlb shootdowns, the totally fucked up
memory model) it turned into a trainwreck.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
