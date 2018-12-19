Return-Path: <SRS0=IUit=O4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4B1C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Dec 2018 16:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC9DA218A6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Dec 2018 16:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fUHssyj5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC9DA218A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQMNiHvfj+rIWazjJwHCpRB31CsS0zN2OQYi1EMmF/k=; b=fUHssyj5fCz1d/
	zCqgL0XN5oPZE99jTLdUCTmhJtZoxOMMvj2V4QS7gQQOkRAZmNe1kHIc6AjPaKhax9UT+GGV0Qbo2
	cXyiuNcIIuDzB3WsCJXicI7paZZNBzvvfPdZY3Pye+00HOCo/uv3/FsnyPqFQLZnVRUbGfw3S2eqi
	xwh81xlRIJIiSW4qnxT7CHDaYnDW+DK0vl1HzRWNMWEvf29ATJyy5gf0heZEbPIkZlkP6mDzqWcVy
	zuS1ufpZ14NKxe/Hx4ShDsgCnzwI2JpUmnCfDr5zOo4bbpvXGlHMtQP0Z1jAgHcJlClJ79smjKSE1
	Uf0IaOGRXK8aS1yN3wew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZei6-0002k4-Rh; Wed, 19 Dec 2018 16:28:38 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gZei4-0002ji-Mr; Wed, 19 Dec 2018 16:28:36 +0000
Date: Wed, 19 Dec 2018 08:28:36 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 3/6] irqchip: sifive-plic: More flexible
 plic_irq_toggle()
Message-ID: <20181219162836.GA9224@infradead.org>
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-4-anup@brainfault.org>
 <20181217182719.GC7086@infradead.org>
 <CAAhSdy3i+ap2J0By3nRqK6yvb8oD4-+2QwUO9PH9GM+0odKqSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3i+ap2J0By3nRqK6yvb8oD4-+2QwUO9PH9GM+0odKqSA@mail.gmail.com>
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
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 18, 2018 at 02:20:10PM +0530, Anup Patel wrote:
> Actually these functions should not be inline because plic_toggle() uses
> raw_spin_lock() and plic_irq_toggle() uses for-loop.

So?  It still inlines the all of two instances into each caller
for slightly different but related work.  Not sure it is 100% worth
it, but probably more than the one to move the calculations to init
time..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
