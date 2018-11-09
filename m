Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE9EC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 08:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8FE20892
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 08:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q8eqFAVl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8FE20892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHDGNL0OszBKDwsxUW5LmqcVYq/+7reiKswxOAsrxdY=; b=q8eqFAVlqkzO2X
	E5do7rAZupJnbk0EbxNUsy+QFYOzr5nVlE7crTiVvUAw198AdEsRlyx3TmASgmePTnhueKnSvIFEE
	0NtPaNAXkJRoztoWHvlt0SKgG60osrQK3y5Ufyc46ILRsK3rmKEJV9SAZjl6E9hbiDHqQoEzsm1B4
	bC/qqn005ZQLU7uEjJ3IjYeO3H7bGNWpSTFEgKYcopQhYD5c09z7U0xUGP9FnCWUmJKNLvfTPhOz0
	f0Q92Y/aaeLV6aZ1w9WEGaO4TtabCK8iyWkeThkPvv4J38N+6IMg/vXfq/RwB9/UQ5wtkg6U3gVHM
	ISgL/rBVns1XGWxGqWdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gL2NW-0004lQ-NQ; Fri, 09 Nov 2018 08:42:58 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gL2NV-0004l7-2v; Fri, 09 Nov 2018 08:42:57 +0000
Date: Fri, 9 Nov 2018 00:42:56 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 1/4] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
Message-ID: <20181109084256.GA6508@infradead.org>
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-2-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181022114517.22748-2-anup@brainfault.org>
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
Message-ID: <20181109084256.NqIB8k5qsi8k1k0ubOBZZE7jf4C3NeASSjlJMiUtzZU@z>

On Mon, Oct 22, 2018 at 05:15:14PM +0530, Anup Patel wrote:
> This patch does following optimizations:
> 1. Pre-compute hart base for each context handler
> 2. Pre-compute enable base for each context handler

Why?

> 3. Have enable lock for each context handler instead
> of global plic_toggle_lock

Why?  Also even if you want this it should be a separate patch.

>  #define PRIORITY_BASE			0
> -#define     PRIORITY_PER_ID		4
> +#define PRIORITY_PER_ID			4

Also please drop the random whitespace changes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
