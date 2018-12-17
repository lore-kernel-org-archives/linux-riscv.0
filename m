Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7111BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4593420675
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ltXPQwuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4593420675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TW5eNlBELlrN6C1aGxVZPZlc+uIp6AyinQBHCpQxtKg=; b=ltXPQwuoGLRt7m
	SZ4jPycuSjQ1h895pOueA7dl8NmL9CYzkZ0ZlbTreFEC3Bg6d8DlAzjVEGAANTNm/aNg/dTbjXaUG
	Q7Aj33BXD28r4LU33IQ9Aj0cJ+OY4rkwX7D+mur6n9sVU9PaTr0/zhjx2b1g9fquMseV0yb3byWXw
	oaRDetdbRs3nnsdwnNxwoc2Lr5+dg5/tSWpkk7jFACtoLR1IjvwRfWvEqRTxdJ5q5DLx9sWkZGJ8f
	PF5IlnsH5rmRPNEyosDcBLqwtN9cRFa2CH+HFGIRoEN9O/mQ1fnlFz7uu0QqyzZYm+Iu8VrT0g1wH
	hCFyDGNwvvSfZ8vUEEQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYxka-0007xS-FA; Mon, 17 Dec 2018 18:36:20 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gYxkZ-0007xF-8s; Mon, 17 Dec 2018 18:36:19 +0000
Date: Mon, 17 Dec 2018 10:36:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH v3] riscv: don't stop itself in smp_send_stop
Message-ID: <20181217183619.GA23353@infradead.org>
References: <mvm7eg85vsj.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvm7eg85vsj.fsf@suse.de>
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

>  void smp_send_stop(void)
>  {
> -	on_each_cpu(ipi_stop, NULL, 1);
> +	unsigned long timeout;
> +
> +	if (num_online_cpus() > 1) {
> +		cpumask_t mask;
> +
> +		cpumask_copy(&mask, cpu_online_mask);
> +		cpumask_clear_cpu(smp_processor_id(), &mask);
> +
> +		if (system_state <= SYSTEM_RUNNING)
> +			pr_crit("SMP: stopping secondary CPUs\n");
> +		send_ipi_message(&mask, IPI_CPU_STOP);
> +	}
> +
> +	/* Wait up to one second for other CPUs to stop */
> +	timeout = USEC_PER_SEC;
> +	while (num_online_cpus() > 1 && timeout--)
> +		udelay(1);
> +
> +	if (num_online_cpus() > 1)
> +		pr_warn("SMP: failed to stop secondary CPUs %*pbl\n",
> +			cpumask_pr_args(cpu_online_mask));

Given that this function doesn't mark the current CPU as not offline
it seems we could just exit early for num_online_cpus() == 1?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
