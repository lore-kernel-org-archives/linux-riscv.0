Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EB8C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 14:36:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AE2610F8
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 14:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AE2610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l6/iiMCazj+CVCID0Vd7C4QrUFjk0Br+GkR1SbePrNA=; b=iNKzH57G0wptlcHGm5dK+P0KG
	S6OpSrrsxKF4piqY7Pa5sPo18UM1YXrr4Y9pz7xY5BsDlOg1DVJHyKLJJnE6i5u0nlG8XccsdYb3g
	9rhG+9GQ2UvkTpACj8WDZnxafCbxvXWcs1lJh7fxqBtx6BQBY21o64DFhbmTN8+ecKdE1GUPiYV/5
	FRN6LM2e9RVw44Hd/8PKl0MiSDczn96JG6AhJqNyMiw4HX9pE70yc/Em4JU3cYeZaq8wAhPnuWokO
	BZlUpeJwqbBuisgcrImky1BBdcme+R5kTk6Oy4KZU/frqKCXT+ibT9WD95fyXjE0w+mZGu3iW01di
	bfZ5FFq8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9Ho-005AYT-4h; Wed, 07 Apr 2021 14:36:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9Hi-005AXv-R5
 for linux-riscv@desiato.infradead.org; Wed, 07 Apr 2021 14:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=umJ6Er88RJ+kjsFdQDsASA99MroOE5xNDgI/QiCH4QM=; b=fhTqx06EzmDXnqGUU8Hs6T2OIO
 GJheMtfFNne1USTF67q0QdoIrXWnu7eBYLi2ZHmbcI7sUCTZXQKqe0UZW90UqjzGJA8YSkDp80XuM
 mZ9QxwKvvOiZeBewK5EjK/1DSyld9HuVW6qFKyL30Og1aOCFrgMxdz5AbLkzDwzLSQsUKoyaMmtJr
 ESsC8Z7fUNoef76ssY+daUwApH2StlHtsqwlZcA+xos4mpyDJ7Cg8FqKR4qMFg3Wc1g1hZYbVtvhU
 sT5qdbMuxxq+vFQcHComPMpEQMaJtiSsIuc1AZUOvOiHFwfVj+fcBq8djBeDRVzQDTcfz5jQtScev
 lIpiXB+A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lU9GF-00EbQv-KT; Wed, 07 Apr 2021 14:34:58 +0000
Date: Wed, 7 Apr 2021 15:34:27 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christoph M??llner <christophm30@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210407143427.GA3479728@infradead.org>
References: <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
 <20210407094224.GA3393992@infradead.org>
 <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
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

On Wed, Apr 07, 2021 at 04:29:12PM +0200, Christoph M??llner wrote:
> Gentlemen, please rethink your wording.
> RISC-V is neither "crap" nor a "trainwreck", regardless if you like it or not.

No, by all objective standards the RISC-V memory model and privileged
architecture is a trainwreck.  Anyone who disagrees is way out there in
the sky.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
