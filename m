Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E908C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:41:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095E920868
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o7wBGfSP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095E920868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pj0BzgdE72wVOzlnshqVmwZm2bIG5sL6GYOIOi2fjw=; b=o7wBGfSPF/9+Ih
	xd5Bf49lAVG3UUQaRF3kRqqpeDKRuSGZfXsh6ntDdyl+dLgHIsmj3+wgvtQC8DWZQs+mP/XLHN3ob
	9kXV8VYUn6PS3/N3IZfnyV19RwONQzqtFEWLKFgNQsiadjxlTkXrsjk5BVYP1WOeM++3FrPxWP0cj
	Q81c0TsG6ksUfa4ARhIGfR5gKCzTjl7EFRPqAvHzepHc5i58TYLxiXAZq5VM/5L1jg01D/WXIeSdu
	EYXKUbthNl3EHeJRXcSPBltQYwshP3frjZvXX/+2USeT3DKViDlTgHGocX6egX6ie1RPV47P701yU
	tZWUhbNfunfjYxd+eZdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjOxq-0005IQ-E1; Tue, 15 Jan 2019 13:41:10 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjOxo-0005IA-Lk; Tue, 15 Jan 2019 13:41:08 +0000
Date: Tue, 15 Jan 2019 05:41:08 -0800
From: Christoph Hellwig <hch@infradead.org>
To: G SatishKumar <gsatish.ldd@gmail.com>
Subject: Re: [PATCH] RISCV:IRQ: Support IRQ_WORK interrupts with self IPI
Message-ID: <20190115134108.GA13216@infradead.org>
References: <1546781578-8126-1-git-send-email-gsatish.ldd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1546781578-8126-1-git-send-email-gsatish.ldd@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jan 06, 2019 at 07:02:58PM +0530, G SatishKumar wrote:
> 	This patch adds, IRQ Work interrupts support to RISCV arch.
> 
> 	This patch is based on the arm32 patch ARM 7872/1
> 	which ports cleanly.
> 
> 	Done set of changes based on RISCV SMP process.
> 
> 	commit bf18525fd793 ("ARM: 7872/1: Support arch_irq_work_raise()
> 		via self IPIs")
> 	Author: Stephen Boyd <sboyd at codeaurora.org>
> 	Date:   Tue Oct 29 20:32:56 2013 +0100
> 
> 	By default, IRQ work is run from the tick interrupt (see
> 	irq_work_run() in update_process_times()). When we're in full
> 	NOHZ mode, restarting the tick requires the use of IRQ work and
> 	if the only place we run IRQ work is in the tick interrupt we
> 	have an unbreakable cycle. Implement arch_irq_work_raise() via
> 	self IPIs to break this cycle and get the tick started again.
> 	Note that we implement this via IPIs which are only available on
> 	SMP builds. This shouldn't be a problem because full NOHZ is only
> 	supported on SMP builds anyway.

The commit logs here looks oddly indented.  Also what workload did you
test this with?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
