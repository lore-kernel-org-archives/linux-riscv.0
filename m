Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2882FC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 12:26:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E583220738
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 12:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xNoj6laK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E583220738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dn3kCLv8w31SYQfFV0CC18WMG2uskyWZG3ytp2giVnQ=; b=xNoj6laKhwS5j2tW6xI6Y8jr2
	qwTktBzbW9VPaaQY3Bzy3XNKSrNf9ILGAeD72Hk9uPaEcE/jQdGwYn1EfvQJxwrWHvU43ZsTkirzk
	MPhNZ72IT6j1BgtKHEfKCTpSYFv22CXm0W5Zv2m1n57Qt6cyPgULXnG0mfyWdtRAbpnUGOiS3JTL5
	fSNLAQkSVZDl9Cke+0ds2X8By0Ob1eOhJOWDZp2RsSQNuz7e5GKhrF89gXxTSLifI9/zFyxhUUNp/
	q8qYKJ9fnNjfaT0uJkugv7kBF66vV0BXz7MAE0/BpWBVr6X7c7oKwb6+k1BExvnxQA4TDVuHR3PY5
	oPaAnwc/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juxXh-0007n5-QJ; Mon, 13 Jul 2020 12:26:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juxXe-0007kw-5I
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 12:26:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78D3930E;
 Mon, 13 Jul 2020 05:26:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F05E3F887;
 Mon, 13 Jul 2020 05:26:38 -0700 (PDT)
Date: Mon, 13 Jul 2020 13:26:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers
Message-ID: <20200713122636.GB51007@lakrids.cambridge.arm.com>
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710135706.537715-6-hch@lst.de>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_082642_812578_5751D3C7 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 03:57:05PM +0200, Christoph Hellwig wrote:
> Add helpers to wraper the get_fs/set_fs magic for undoing any damange
> done by set_fs(KERNEL_DS).  There is no real functional benefit, but this
> documents the intent of these calls better, and will allow stubbing the
> functions out easily for kernels builds that do not allow address space
> overrides in the future.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm64/kernel/sdei.c         |  2 +-
>  arch/m68k/include/asm/tlbflush.h | 12 ++++++------
>  arch/mips/kernel/unaligned.c     | 27 +++++++++++++--------------
>  arch/nds32/mm/alignment.c        |  7 +++----
>  arch/sh/kernel/traps_32.c        | 18 ++++++++----------
>  drivers/firmware/arm_sdei.c      |  5 ++---
>  include/linux/uaccess.h          | 18 ++++++++++++++++++
>  kernel/events/callchain.c        |  5 ++---
>  kernel/events/core.c             |  5 ++---
>  kernel/kthread.c                 |  5 ++---
>  kernel/stacktrace.c              |  5 ++---
>  mm/maccess.c                     | 22 ++++++++++------------
>  12 files changed, 69 insertions(+), 62 deletions(-)

The perf core and arm64/sdei bits look sound. FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
