Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE34CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BFFB20645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hkIIBGTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BFFB20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGE192IuoZT28CzQTqK1WjCWaWNqBDRK6wl2OBexsaY=; b=hkIIBGTut2Jjfr
	BCgKcw/J+zbzOiBv3JyB3bw06vTEpwIv8s+7Wu6HVIcyFzrlfRsD4FpoUEow9uD1LBZmthkXcdmNE
	ZDoci2QDsIMBOk/XWXFXCzX9QcWeNbClKoV/XDM5tBkSf6yYvwAu0gtY8845dcEEK7lq4Cr0YysAx
	BeWUQ6mi1JGrYxV2TeSX88fBXYBxaPEGtwfp2baFwN/a+BzqQ8BvkToscdj1amQIJif+/sn1VmfE8
	G8WasAlIvWXlkDUxomg+wKheY8Q//FWDajtryrSCKpeyf2D0mo0F2CX2MCR4W8xB/GG4HvZBj8Nvh
	LEmRyO0pv2U0jtllBiFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjR4L-0005A1-GQ; Tue, 15 Jan 2019 15:56:01 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjR4K-00059h-9C; Tue, 15 Jan 2019 15:56:00 +0000
Date: Tue, 15 Jan 2019 07:56:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 4/5] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
Message-ID: <20190115155600.GC13095@infradead.org>
References: <20181227111821.80908-1-anup@brainfault.org>
 <20181227111821.80908-5-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181227111821.80908-5-anup@brainfault.org>
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 27, 2018 at 04:48:20PM +0530, Anup Patel wrote:
> We explicitly differentiate between PLIC handler and context because
> PLIC context is for given mode of HART whereas PLIC handler is per-CPU
> software construct meant for handling interrupts from a particular
> PLIC context.
> 
> To achieve this differentiation, we rename "nr_handlers" to "nr_contexts"
> and "nr_mapped" to "nr_handlers" in plic_init().

Not sure what this differenciates that we previously didn't.  As far
as I can tell it just is a slight naming cleanup.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
