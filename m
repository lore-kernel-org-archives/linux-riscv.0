Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCEEC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5941520645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4tq8Qqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5941520645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIWHVJOsRCGDQOyN75H3pur4+2B5HdDlI0L7+fE6G9g=; b=a4tq8QqryPWsjC
	26LL6jP+G8CWqP0vgYw+fQQ03T7cNzkZqGS6Tu1h4Ls3jO3OGB25dJDEOuZXQEV8YxmND7HJhoFNz
	1fGJuHRyPmLUpbvwFVtby9xbx1LxYSaI9yMD3kChl5YPly9tDpju77APc+puW5zxe29N/zXliwWbP
	frk3nrjGKlzoEFhnZk8eqcBPHKsC8YeVTNqQhDJ3XYuT3lD2JrYD3rOQ68hVtKr2AZz/MWOWnK6Sq
	hf3ksPL0Tyo+T2JGioBI+eskoMVS4Dm5dwWNC2j7UUFUgenbehcKwXGOWDvb7PQBpPFJhT6nrsMAC
	IibulLbPSpjMwYpT2WFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjR31-0003Yl-BI; Tue, 15 Jan 2019 15:54:39 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjR2z-0003YP-O4; Tue, 15 Jan 2019 15:54:37 +0000
Date: Tue, 15 Jan 2019 07:54:37 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 2/5] irqchip: sifive-plic: Don't inline plic_toggle()
 and plic_irq_toggle()
Message-ID: <20190115155437.GA13095@infradead.org>
References: <20181227111821.80908-1-anup@brainfault.org>
 <20181227111821.80908-3-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181227111821.80908-3-anup@brainfault.org>
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

On Thu, Dec 27, 2018 at 04:48:18PM +0530, Anup Patel wrote:
> The plic_toggle() uses raw_spin_lock() and plic_irq_toggle has a
> for loop so both these functions are not suitable for being inline
> hence this patch removes the inline keyword.

That is a weird argument for a function which has by design exactly
two callers and is in the hot path.  The alternative to the inline
here would be to duplicate the code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
