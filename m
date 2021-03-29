Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704FEC433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:48:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 114B561976
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 114B561976
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Ee3zELBBSE+ucS+CINbYy+obM+4HpTHc/Hs40hvzkA=; b=SmW01GJBAw3GQL3PPxiUVKcxL
	1xqBD8VZd9xiZ9FqEBpUgqAJ1BA50e8Xmrilezdl5VdadeEqtvSZlZmmOtPGJSLBDKFqtSKU0KsoF
	aGaD6baSs5lvLIeXelqYPtTA0XeGRul7mRUhu37EQcq0mLJF7eHbBWaNCJZA8tqdMiI1390dN0Jlx
	NkRvpn5cuGyJ6pfFs/Bv+m4xKAaOK2tIkVs4tXAWnJH35uX0SyDL64UDifUTs5kPHSOFUD1Jh7ffT
	uBQdYxZrBgWxO4Tb/+fb695/XAWCYG00wO8cnGSHYnhA5HgNlopM5jhWxuPf9glkZmswjZC3YAZmU
	BGIqnSFsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxrJ-001IxR-Vl; Mon, 29 Mar 2021 19:47:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQrPw-000f9b-NH
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 12:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ryQUmQX9VCrgI40LMrpbOpblpt+Cjb8URzPqoIp8UFw=; b=aKCY2I+A4CoLQS4X2EJS0qhT9V
 9ldUP14p2myn0I2H7vFFLqGO2ViFxVgtMp4r7AISXPeratKP1oX1td2NT3SjHs3UHQEDIYBu/dI40
 TeEn+vntWxrKhtc6Uj4OVxkrwgL4cXU9DA/DjM2CHa03mwkVuXqeNx5fGnhKvIxXVv4zEFVpmNBkB
 fRgtFq4Ne+2TGvb2X+UXQVVUm7y5jArJzdG591z5/1eWOtycdRF+C/x8xP/UYoEpIg0DLcrhR2znb
 0YCbxNQBx7fmjOZMi8dAlDthdfL4GOwnOSYkL82gDAajM/DMqAriiVoM5XQby9P+0S1YQuKvq2mta
 vp6FxWOA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lQrPU-001aoq-Jy; Mon, 29 Mar 2021 12:54:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E0707305CC3;
 Mon, 29 Mar 2021 14:54:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CBCD02BB1A680; Mon, 29 Mar 2021 14:54:23 +0200 (CEST)
Date: Mon, 29 Mar 2021 14:54:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGHN/4B8f9kTbcso@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <DM6PR04MB6201B2774866802C268F7B628D7E9@DM6PR04MB6201.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR04MB6201B2774866802C268F7B628D7E9@DM6PR04MB6201.namprd04.prod.outlook.com>
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

On Mon, Mar 29, 2021 at 12:13:10PM +0000, Anup Patel wrote:

> We had discussions in the RISC-V platforms group about this. Over there,
> We had evaluated all spin lock approaches (ticket, qspinlock, etc) tried
> in Linux till now. It was concluded in those discussions that eventually we
> have to move to qspinlock (even if we moved to ticket spinlock temporarily)
> because qspinlock avoids cache line bouncing. Also, moving to qspinlock
> will be aligned with other major architectures supported in Linux (such as
> x86, ARM64)
> 
> Some of the organizations working on high-end RISC-V systems (> 32
> CPUs) are interested in having an optimized spinlock implementation
> (just like other major architectures x86 and ARM64).
> 
> Based on above, Linux RISC-V should move to qspinlock.

That's all well and good, but first you need architectural forward
progress guarantees. Otherwise there's absolutely no point in building
complex locking primitives.

And unless you already have such big systems in silicon, where you
can benchmark against simpler locks (like ticket) there really is no
point in the complexity.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
