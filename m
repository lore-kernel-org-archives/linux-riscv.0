Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4645BC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FCCA20661
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MIjhTGiz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FCCA20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2Ci+9lD+BEf/fgBsIWhesGQeqxVvnIhG49Ol62m+tM=; b=MIjhTGizgxSh+3
	ouDwgHb+pTkRU8GbLg+HN2tgVI2lEcBEqL6yiPcV02QP6YFKoDzun1+EMVsC2lRrv+a9gMYA6wWiZ
	n1VIeJvR8Uk7zz8qHFLtXiQcpxFTaDD8IxHHT2goUMPo3+TeBC2jbF6nEqi8gumTXpETZ8ML2kLOF
	6bFxEFY4+c8ZcaUptHdUgB9oY+UTkgDILyEjObLvMQkQN/MBMoZO2YVZoRGznQmO2jpaJcLsvN9pE
	sFVlRSC0fWeyafAE4eB8UXISrn1Apt8X7MhY0glqcZXqXMu+bohtPXAZvQ971NUotry6Lehqu7sv7
	kV23ukiTVQ++Sitvehsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2GTK-0003X3-Lo; Fri, 08 Mar 2019 14:27:38 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h2GTJ-0003Wt-H3; Fri, 08 Mar 2019 14:27:37 +0000
Date: Fri, 8 Mar 2019 06:27:37 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH 1/3] riscv: move switch_mm to its own file
Message-ID: <20190308142737.GB32707@infradead.org>
References: <LO2P265MB084754D0E01F58EFD16DD0F9D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LO2P265MB084754D0E01F58EFD16DD0F9D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +extern void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> +		struct task_struct *task);

No need for the extern here.

> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> new file mode 100644
> index 000000000000..4b9a20135008
> --- /dev/null
> +++ b/arch/riscv/mm/context.c
> @@ -0,0 +1,83 @@
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */

Please use an SPDX tag instead of the copyright boilerplate for new
files.

> +static inline void flush_icache_deferred(struct mm_struct *mm)
> +{
> +#ifdef CONFIG_SMP
> +	unsigned int cpu = smp_processor_id();
> +	cpumask_t *mask = &mm->context.icache_stale_mask;
> +
> +	if (cpumask_test_cpu(cpu, mask)) {
> +		cpumask_clear_cpu(cpu, mask);
> +		/*
> +		 * Ensure the remote hart's writes are visible to this hart.
> +		 * This pairs with a barrier in flush_icache_mm.
> +		 */
> +		smp_mb();
> +		local_flush_icache_all();
> +	}
> +
> +#endif
> +}
> +
> +void switch_mm(struct mm_struct *prev,
> +	struct mm_struct *next, struct task_struct *task)

The second argument easily fits on the previous line.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
