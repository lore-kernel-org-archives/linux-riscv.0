Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A37C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 08:23:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF7A20857
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 08:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CF7A20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oZSofLphR9TsMqV72nQJz3HjKgYzFowB/lHIx6U5K1c=; b=WGuVavEfR+B9oExjX9GVLLkf2
	dviigAsNbbPQcNBTj4oqLZmPiUOXT2QD7c+Qt6E3V6OXqqeunagnanXnO1YiybYAxEyrglJZA6DPu
	ldl/wrxNTMvzav68FQEBUZdnSleq62/CyitH3Ufx+W/NgVsZIxjAw49fiGss5mmPoMaRoOcIPN9Y9
	iwdZTFuNCmnH3uZ4Lj9E8m4DFtNlye7PxfKWfnTFqr1HiPd0C52NmyltMsBjJEW8G+otnUFxt7FMd
	53F162Z8t/DswtxCQOwF306W5w9lUvRhx5IvdFazMxmrYC+me4UaySktra1KirNSi9sKZxPW9PEJ0
	DGtZtNtjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzQk-0002LX-VZ; Wed, 23 Dec 2020 08:23:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzQj-0002Ku-Jn
 for linux-riscv@merlin.infradead.org; Wed, 23 Dec 2020 08:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FLukLelJh4KqDKIST5NV0UwhmlnpmjKTGDxZ6k/Xzps=; b=LIMyxtT+VE0w+deWxXyycWQBMa
 Xj3+oH9kJHWAD+odl/SNpIJ6pAM8SqPpTq4tzOXsVGZJ8dyhZR2b8Yn3BaIqG1U9dpSOrd1OAuLoV
 ThQ/1wqY66Z5GuUi5zuCXzb6lUkoBwOtqmsIaWB8xdcOg7IZu3GIGTWHuVK4WT7jF31OaPWiBTBk2
 QXp2aCn0uMEGjYy+77qrIhdeAKoNgNOLxAzPrzdWAp5RqVfoEk/DFfYVXUdOm2cyjbRcLFCBe36zX
 iEWBdiB8q0HAWfMyvPxR5DPAl5KqQAMGRmu5dFhBcNkEih336pytbkfqGFCEQ+0yM3Ruw6UyW/kjh
 QJXB3pkw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1krzQg-0006YI-Df; Wed, 23 Dec 2020 08:23:30 +0000
Date: Wed, 23 Dec 2020 08:23:30 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] clocksource: clint: Avoid remove __iomem in
 get_cycles_hi()
Message-ID: <20201223082330.GA24581@infradead.org>
References: <20201222053230.3229427-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222053230.3229427-1-palmer@dabbelt.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: daniel.lezcano@linaro.org, kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel-team@android.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 21, 2020 at 09:32:30PM -0800, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> This cast loses the __iomem qualifier from clint_timer_val, which
> triggers an sparse warning.

I'm not a native speaker, but the subject line sounds strange to me.
Shouldn't this be:

	"don't cast away the __iommu annotation"

or something similar?

Also this adds an overly long line.  Otherwise it looks fine.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
