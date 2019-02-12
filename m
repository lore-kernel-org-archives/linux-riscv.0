Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC75DC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD282184A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cCY+578A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD282184A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=culRlpweIOSYmsn8HwClCvAW0ojqCvTgvL0Q2hLT54Q=; b=cCY+578AJe9QFO
	8ej02LPWCwL1cBJU3kIy0HPg2MQvNCy9ogro/SM2uK/fqR/ubPaOKU1KOLSwuFc11DnJnSOjn9EmO
	3Or66ZAjkBiQE/SxIb3ugvlvqZHdEWwIexRN0c5tUaV6fMDyRfYWbrv5nM7voy6RySvnOCoUTd35l
	Sst0Asp70gQLSFnAH6iWiiXxGhY6sMmtjcKZT55rqGio+KMJeMtJ7CQ8VulZsor5KUUyj1obtywnx
	Zfdvl+Frizuks2KEanwi/WP08ZLu3yYvfL9foDqAvhKf1p08XzGcNwRtCBN/VuwdRXlOk3zhQ5VVK
	kStHe1zFokwZKE3dfvAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtSC6-00016U-Jn; Tue, 12 Feb 2019 07:09:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtSC5-000168-8M; Tue, 12 Feb 2019 07:09:25 +0000
Date: Mon, 11 Feb 2019 23:09:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v5 2/5] irqchip: sifive-plic: Don't inline plic_toggle()
 and plic_irq_toggle()
Message-ID: <20190212070925.GE26747@infradead.org>
References: <20190119055625.100054-1-anup@brainfault.org>
 <20190119055625.100054-3-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190119055625.100054-3-anup@brainfault.org>
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

On Sat, Jan 19, 2019 at 11:26:22AM +0530, Anup Patel wrote:
> The plic_toggle() uses raw_spin_lock() and plic_irq_toggle has a
> for loop so both these functions are not suitable for being inline
> hence this patch removes the inline keyword.

I still very much disagree.  Very strongly with the above rationale,
but also (less strongly) with the decision not to inline here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
