Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC44E7719E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDrA4lsyEMCOYUD0x0ud8NrUy9wHMQ0G6oAg/NTK69A=; b=uK0vp1tV5aAMjG
	eN7U8KRHndpBKD70nVaa03cIUYY4KEKfaFKgMLzOibRskQprFEwsQnxoRr/szu6/NresBVwetUo++
	f4PSVqDHAZeXQwd/hqRO/hMBXC7m1GbXg+SxRe/YKkRuY/o/fA4NJz01MD4nYsSILhkkQ/loqTA4B
	2T88SLdnv999Y0hmN8tpgkFOTrdN3Kl42tX/YgZpc9MOt7n5QJAc+Q6DUdjDbOhSoydr9ykA0H7G2
	BpJ1aMc1e7H91a+HagsYjlkx5yepgyFqynOEsQPuz79AnutY2qrsuj31t1XdwomhBRFiv7BtcmRBw
	bsumqk22CIOswNsbHm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXI7m-00000004pbT-1LMH;
	Mon, 13 Jan 2025 10:56:50 +0000
Received: from mta-03.yadro.com ([89.207.88.253])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXI7j-00000004paS-0Fe0
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 10:56:49 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 600D7E0026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1736765799; bh=GPkBzbEa74bl5EdCDEBHXIO3MAGG7toGPMqv8S0lHMU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=ohO9M+eIH81Gs8wmoM4Jstlex4u75e2ERR0QflVzbku6EA53OwBBN1Xr0PBjRjeOz
	 326bsSpSNqa8tzzB/mj/LRHcEQ2uhMnKgu4Nu7MEGwODqSR+JJjG+oTbETZV2MDmmo
	 HmkpA6m5329PtifGfw2F8RFesb3R/uaHTq8JZs+MpzsZJCbKDNybG/aHemmGQxluyg
	 s7DGm3MauS2a7L0TLcP6c6Uy1UbvdaDaM+/BgfGulRMvYdwDGy7z26r3i373krE3zM
	 mHamuYEHcXg3gmF4C0g2J37k589ZMQaIgAW2u1M4KEVjR/lkn/kdbQfPvTSGx56Ybp
	 ORE/dWNka0DOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1736765799; bh=GPkBzbEa74bl5EdCDEBHXIO3MAGG7toGPMqv8S0lHMU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Z2wGCD812wkIH7w+lGI1I9nfaNHd9NgN6W1d2Q3LC4vUSD/WcmcuBn3m4/ykaUC5b
	 w7+n60x2N7GfEJbZfwCjmpAixa7ma9x4SMp9oBNea30N1iSkKcGXsWNeUt4Bo9fOlR
	 iuKIeUXsEcPn7OQsQivZllYYQ4QZD13HWoindrAAaZM9C+CLhYAae6YHQGM8msS1YR
	 /rZv+XnC8BuJBSANPkc+TluAgFusJZ9uqY32IH37/ugdIyh94ahdL54VofIqGd3cDZ
	 +qI5shAqyFxiHzAkMtOlmYYBnFm5z9V4DVP0Aoj6ALa4Srtu7t/6N6Ghe3lhM5LcnK
	 juHpbqFh9/Jmg==
Date: Mon, 13 Jan 2025 13:56:27 +0300
From: Nikita Proshkin <n.proshkin@yadro.com>
To: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux@yadro.com>, Nikita Proshkin <n.proshkin@yadro.com>
Subject: Re: [PATCH 0/2] dmaengine: sf-pdma: Fix dma transfers errors
 handling
Message-ID: <20250113135627.7b245f92.n.proshkin@yadro.com>
In-Reply-To: <20241111152600.146912-1-n.proshkin@yadro.com>
References: <20241111152600.146912-1-n.proshkin@yadro.com>
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 S-Exch-02.corp.yadro.com (10.78.5.239)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_025647_802794_9C244767 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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

On Mon, 11 Nov 2024 18:25:58 +0300
Nikita Proshkin <n.proshkin@yadro.com> wrote:

> Fix several problems in the sf-pdma driver related to handling situations
> when the dma transfer fails (for example, due to IOMMU activities).
> 
> Nikita Proshkin (2):
>   dmaengine: sf-pdma: Fix dma descriptor status reporting
>   dmaengine: sf-pdma: Fix possible double-free for descriptors
> 
>  drivers/dma/sf-pdma/sf-pdma.c | 106 ++++++++++------------------------
>  drivers/dma/sf-pdma/sf-pdma.h |   3 -
>  2 files changed, 32 insertions(+), 77 deletions(-)
> 

Gently pinging. Any requests/comments for me?

Thanks,
Nikita Proshkin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
