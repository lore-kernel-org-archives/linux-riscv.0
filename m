Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98A6C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA28521848
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p6kWazek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA28521848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJdWQFa5Q6blAAQXw4Oj6zKlJua5QYKLNTnTi/RHQFY=; b=p6kWazekrIy3bF
	zRI8RWQvpzvC3GOHGMHrS3ktwasd/SekIqSK4KP4SWgb/Rr6RHgqUVC3gOgFVk9l+lMmeRJxbIYUV
	ScgJE71Fr5UkH5gGyevBjpat/ZEhBK07FCaCWz0BXGL05lw/0rgMd0Lm25yOwf+chU9ux08MOgPLQ
	EbaMEVemVwq+0Nkun6+sShz6UOqU9iyA8HoVJnGk4QRXXuLN90AishGLThMVXniXdiJIVKW+QCbV1
	dvvoNV3QboG6t6WDt7yir+UwDykUUbL+23uNUwAooZJd7zdgmctQD6Dk9Yp2TcYGelZWM4iUfCQzg
	S6UDw/fhRZ2rfB3kuLHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYxck-00047o-ES; Mon, 17 Dec 2018 18:28:14 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gYxci-00045d-RS; Mon, 17 Dec 2018 18:28:12 +0000
Date: Mon, 17 Dec 2018 10:28:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 4/6] irqchip: sifive-plic: Add warning in plic_init()
 if handler already present
Message-ID: <20181217182812.GD7086@infradead.org>
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-5-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181130080207.20505-5-anup@brainfault.org>
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

On Fri, Nov 30, 2018 at 01:32:05PM +0530, Anup Patel wrote:
> We have two enteries (one for M-mode and another for S-mode) in the
> interrupts-extended DT property of PLIC DT node for each HART. It is
> expected that firmware/bootloader will set M-mode HWIRQ line of each
> HART to 0xffffffff (i.e. -1) in interrupts-extended DT property
> because Linux runs in S-mode only.
> 
> If firmware/bootloader is buggy then it will not correctly update
> interrupts-extended DT property which might result in a plic_handler
> configured twice. This patch adds a warning in plic_init() if a
> plic_handler is already marked present. This warning provides us
> a hint about incorrectly updated interrupts-extended DT property.
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index d4433399eb89..3d4f205f8abe 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -234,6 +234,11 @@ static int __init plic_init(struct device_node *node,
>  
>  		cpu = riscv_hartid_to_cpuid(hartid);
>  		handler = per_cpu_ptr(&plic_handlers, cpu);
> +		if (handler->present) {
> +			pr_warn("handler not available for context %d.\n", i);
> +			continue;
> +		}

Shouldn't this be something like "handler already present.."

Otherwise this looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
