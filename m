Return-Path: <SRS0=puBH=OF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADADC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 07:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3EA60F92
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 07:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B3EA60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0/azd9+66BSNJ7yHC7Y9YeTvbo13BTCYBqIAJ9wVy8=; b=wpQNZff2bjtIiK
	tI8gRDEPgQiCq0Q5ywhuA4wafRYg90gadVCRhVVwiMrboY8Hg77hxLWnZY8FBtESdRb8hB3DJAEDr
	AQweha+jDSbb6NkwWlPpdlX1f7SIQ89fVa3AjdCYlAHmELI9DdX31QIawXeN74PmNheKPOvqbOI/Z
	ahECdO8W2obI/LTNnbn5sjHSB7CPTiB27bIMQG+ry+rXyxSf9QRbhbAs0OfgLqkbYB48bQNRbjZr4
	kuJfXmKDDhUscRx7wrxNICRz9/l026J4zdlj3ZuOhCnCSATIXzQEbdfoK1WJgWcWZArd7S6fylngw
	El1H/VS9LoD2Mbv5UCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQPeh-008L6y-S8; Wed, 15 Sep 2021 07:48:31 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQPef-008L5k-Av
 for linux-riscv@lists.infradead.org; Wed, 15 Sep 2021 07:48:30 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5A2A768B05; Wed, 15 Sep 2021 09:48:27 +0200 (CEST)
Date: Wed, 15 Sep 2021 09:48:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH V4 3/6] RISC-V: Support a new config option for
 non-coherent DMA
Message-ID: <20210915074827.GC20024@lst.de>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911092139.79607-4-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_004829_571074_3B51BE0F 
X-CRM114-Status: UNSURE (   9.04  )
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

On Sat, Sep 11, 2021 at 05:21:36PM +0800, guoren@kernel.org wrote:
> +	select DMA_GLOBAL_POOL
> +	select DMA_DIRECT_REMAP

No need to select DMA_GLOBAL_POOL when DMA_DIRECT_REMAP is select.

Also a patch just to add a option that is not selected and won't build
if selected does not make sense.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
