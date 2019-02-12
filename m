Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F155FC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B986021773
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VlLbsNWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B986021773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qX/rlOvhXbuJsmD8kICG1g291qPFEQdHhPM+oBFcDU=; b=VlLbsNWLqgAQx2
	IEIL2kBGl71CqPviAnlqgy5C6dH42Cw7XOpuWFiREz1ZPMLbRLP1PPk6qmly8kKkGnjmSALQVo4mo
	NXmcTJaQ2/CoviqheJ11A2az92f3+lfTs65GLZf3qHOE9a8QSY2OKmJ+IjFn+LjuLVhcD/9fY064T
	UKJLHNJauqSIRoG97c5lL9JppP5UwisQAnxl8gCtBacdPr6HjdY/60lb9pZP7rYQpV8YzUgPYehUb
	t5OcKHCuFX29opSRQn2kxRezCXng/v1zSpIYJClwfUGbq1BNpCu74/B3LP1yp1A71mCZQ22X7H/qu
	r6daIHiAjOAXzsUSV/Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtSE6-0002bU-2q; Tue, 12 Feb 2019 07:11:30 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtSE4-0002bA-Rw; Tue, 12 Feb 2019 07:11:28 +0000
Date: Mon, 11 Feb 2019 23:11:28 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v5 1/5] irqchip: sifive-plic: Pre-compute context hart
 base and enable base
Message-ID: <20190212071128.GG26747@infradead.org>
References: <20190119055625.100054-1-anup@brainfault.org>
 <20190119055625.100054-2-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190119055625.100054-2-anup@brainfault.org>
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

On Sat, Jan 19, 2019 at 11:26:21AM +0530, Anup Patel wrote:
> This patch does following optimizations:
> 1. Pre-compute hart base for each context handler
> 2. Pre-compute enable base for each context handler
> 3. Have enable lock for each context handler instead
> of global plic_toggle_lock
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 47 ++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 26 deletions(-)

I don't really see the point, but the code looks clean enough and
removes a few lines, so:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
