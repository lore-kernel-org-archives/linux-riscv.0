Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095A7C433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:25:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACAB61A06
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AACAB61A06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tTB2ydNzyMbgCQAhLE6BSFyNybwEgcwuMF2sFleUQGo=; b=MN9BpYKd8wkShHHIlFnYTq2ze
	yxFCDNe24CLuKY2tgM+DnwQ7PC0MxJ4VYNeFAaeTtKfP/ZTNKIeE66tcIvnOxGpdk5prFsvL30Xh1
	iBumRXJlx17mwVG46RdEJDGPHCrJanFvHK00vFQguI3ffam9TXsnF6cg4mSWPAmczOr0QiDpQIOp2
	K5kfkq4IfS1wNkD3LC/2Zo3ULhdJrhLEbKczc3AzkomAoaYgx1rJAEMTT50gSmO/I5hhXCadDmfmX
	tXjXRXfIy7l7+qe7+cH+Gp5eDfyX+8R9YHAvJB+gmUKpPAcI2dbRE17qmi51MyU8tG//QmN0xTDbZ
	tOcmoKUuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP2Zc-00H4Na-NU; Wed, 24 Mar 2021 12:25:21 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lP2Y2-00H3X7-VM; Wed, 24 Mar 2021 12:23:43 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1343F3007CD;
 Wed, 24 Mar 2021 13:23:42 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id EBBF92BF5B73E; Wed, 24 Mar 2021 13:23:41 +0100 (CET)
Date: Wed, 24 Mar 2021 13:23:41 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: guoren@kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YFsvTXg07U+Adsto@hirez.programming.kicks-ass.net>
References: <1616580892-80815-1-git-send-email-guoren@kernel.org>
 <CAM4kBBK7_s9U2vJbq68yC8WdDEfPQTaCOvn1xds3Si5B-Wpw+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM4kBBK7_s9U2vJbq68yC8WdDEfPQTaCOvn1xds3Si5B-Wpw+A@mail.gmail.com>
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

On Wed, Mar 24, 2021 at 12:15:47PM +0100, Vitaly Wool wrote:
> On Wed, Mar 24, 2021, 11:16 AM <guoren@kernel.org> wrote:
> 
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This patch introduces a ticket lock implementation for riscv, along the
> > same lines as the implementation for arch/arm & arch/csky.
> >
> 
> Could you please provide a rationale for this? Like, what is wrong with the
> current implementation.

test-and-set spinlocks have terrible worst case behaviour.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
