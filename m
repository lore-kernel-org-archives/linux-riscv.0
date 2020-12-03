Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67224C4361A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 17:10:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E354F207A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 17:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E354F207A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bqUimWkuWsbPDqKNCEUum7KttnGShCm7fafFU6+xUHA=; b=1BN8JwobHXPhH0DCEQrNqSLNz
	os+gfuboBuyIrCjYj0h258qCPCu4HFLDpCHvet8ta2AblXlCzxkWkkc6cBZAvijK64UmRUHe8ATE5
	LVrlwgWPyKVHSQ7pOVUO2MSCQxvehnTtrH4BXbJpg6eZfv2soCyQgdL4xYiANol1emQn85erROm+r
	0bimu2k2Ud4L4cwnAR6K9EI3mP+oCJCHor7j3Wu5xgdS0lLLaAegJk0Cie+GFK07S9DnRzdWgjpxs
	pJU18tEH5EVzTvXuxzRnVRkWqGy9lnc5ZiBXVsmz5w4ccYX8mEgOdb79UvzyM6eyqhHzK5Ir1Apfa
	nAbyq9H1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kks7d-0003Y1-RC; Thu, 03 Dec 2020 17:10:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kks7a-0003XN-JW; Thu, 03 Dec 2020 17:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0lhCxHLgf8TSOAvypxgyZdt6AOtyZg3i7+GSOy69WwU=; b=jeeAqf558AfAqY1ZPTR4HfNgwX
 YopjYarSwRSdQuGeGyjCSNFpvTWHEYq7+8CHvDrMVdGazF9BvP9no40RR9phvvpP85cND+YTv5ln8
 KPsTGbcRveY23zSbT4NayaXcOaWGv8eD84pD4++pebfb9TdeUpWsXFyBzsbMD+4DIqsHk8ZIrsRiW
 I7PtW3gWf5TUhQ5JidDUj/TGspfxPwztfLhtU0q/hd+wkoe4vNNFcR8XRjZIn82vi+bkd0ZTVcg/Z
 fo0RR2g2KJYGfC5KQ9XiTR/EvLYuZJdjOjJWpHZAgMtF0E4z09yRlsVs8vjqzUSCTdzo9+Ps9L8Qg
 SgThpYbg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kks7U-0000Aw-Oc; Thu, 03 Dec 2020 17:10:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 71A073059DD;
 Thu,  3 Dec 2020 18:10:15 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5647C2029C718; Thu,  3 Dec 2020 18:10:15 +0100 (CET)
Date: Thu, 3 Dec 2020 18:10:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 5.9 27/39] sched/idle: Fix arch_cpu_idle() vs
 tracing
Message-ID: <20201203171015.GN2414@hirez.programming.kicks-ass.net>
References: <20201203132834.930999-1-sashal@kernel.org>
 <20201203132834.930999-27-sashal@kernel.org>
 <20201203145442.GC9994@osiris>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203145442.GC9994@osiris>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-csky@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 03:54:42PM +0100, Heiko Carstens wrote:
> On Thu, Dec 03, 2020 at 08:28:21AM -0500, Sasha Levin wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > [ Upstream commit 58c644ba512cfbc2e39b758dd979edd1d6d00e27 ]
> > 
> > We call arch_cpu_idle() with RCU disabled, but then use
> > local_irq_{en,dis}able(), which invokes tracing, which relies on RCU.
> > 
> > Switch all arch_cpu_idle() implementations to use
> > raw_local_irq_{en,dis}able() and carefully manage the
> > lockdep,rcu,tracing state like we do in entry.
> > 
> > (XXX: we really should change arch_cpu_idle() to not return with
> > interrupts enabled)
> > 
> > Reported-by: Sven Schnelle <svens@linux.ibm.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> > Tested-by: Mark Rutland <mark.rutland@arm.com>
> > Link: https://lkml.kernel.org/r/20201120114925.594122626@infradead.org
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> This patch broke s390 irq state tracing. A patch to fix this is
> scheduled to be merged upstream today (hopefully).
> Therefore I think this patch should not yet go into 5.9 stable.

Agreed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
