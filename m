Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C1EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:51:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830E82133F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5ykDq5i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830E82133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rx8WiJ13XIIYDPz3AvcnrUvBjjkgvp6jk/syrYBkReI=; b=d5ykDq5i/t73iu
	RELfmgGtLRdlcEUgtLVhewHhazJTWGkzv4xKvgtZiPuEayZFH7yB8P8bfV3x9jfmiuOxpvQRCks42
	+FDkyemcLZoAR/4WnEkSkd3RwYxRCgfI0totQNGrg2Z/gOnjahiIOV6d/2i8zr2pAiGWnB5lGGTF2
	KHdeSlF17ehI5nIePcPnLTZcawVXbNEHXwxn403toJ4sBspORhxLj9iBIhYUax/K7jQanOVcoZ/88
	1BeU2pMrOogm0TuJ+Jfvr5FZAlPsbSwH6bj4k1MBjaW+ZrohoSmKseG+nz2XJt2RA9Qe0YY5YwM7A
	QZGjXELIk8Ywnwm4oDwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZB5k-0006Ki-H4; Tue, 18 Dec 2018 08:51:04 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZB5h-0006JQ-9z
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 08:51:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B28C5AFD3;
 Tue, 18 Dec 2018 08:50:49 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3] riscv: don't stop itself in smp_send_stop
References: <mvm7eg85vsj.fsf@suse.de> <20181217183619.GA23353@infradead.org>
X-Yow: Mmmmmm-MMMMMM!!  A plate of STEAMING PIECES of a PIG mixed
 with the shreds of SEVERAL CHICKENS!!...  Oh BOY!!  I'm
 about to swallow a TORN-OFF section of a COW'S LEFT LEG
 soaked in COTTONSEED OIL and SUGAR!!  ..  Let's see..
 Next, I'll have the GROUND-UP flesh of CUTE, BABY LAMBS
 fried in the MELTED, FATTY TISSUES from a warm-blooded
 animal someone once PETTED!!  ...  YUM!!  That was GOOD!!
 For DESSERT, I'll have a TOFU BURGER with BEAN SPROUTS
 on a stone-ground, WHOLE WHEAT BUN!!
Date: Tue, 18 Dec 2018 09:50:49 +0100
In-Reply-To: <20181217183619.GA23353@infradead.org> (Christoph Hellwig's
 message of "Mon, 17 Dec 2018 10:36:19 -0800")
Message-ID: <mvmimzr43rq.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_005101_493421_9DFD58F8 
X-CRM114-Status: GOOD (  12.33  )
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

On Dez 17 2018, Christoph Hellwig <hch@infradead.org> wrote:

>>  void smp_send_stop(void)
>>  {
>> -	on_each_cpu(ipi_stop, NULL, 1);
>> +	unsigned long timeout;
>> +
>> +	if (num_online_cpus() > 1) {
>> +		cpumask_t mask;
>> +
>> +		cpumask_copy(&mask, cpu_online_mask);
>> +		cpumask_clear_cpu(smp_processor_id(), &mask);
>> +
>> +		if (system_state <= SYSTEM_RUNNING)
>> +			pr_crit("SMP: stopping secondary CPUs\n");
>> +		send_ipi_message(&mask, IPI_CPU_STOP);
>> +	}
>> +
>> +	/* Wait up to one second for other CPUs to stop */
>> +	timeout = USEC_PER_SEC;
>> +	while (num_online_cpus() > 1 && timeout--)
>> +		udelay(1);
>> +
>> +	if (num_online_cpus() > 1)
>> +		pr_warn("SMP: failed to stop secondary CPUs %*pbl\n",
>> +			cpumask_pr_args(cpu_online_mask));
>
> Given that this function doesn't mark the current CPU as not offline
> it seems we could just exit early for num_online_cpus() == 1?

So much for copying existing implementations.

The only difference it would make is two less calls to num_online_cpus
on a single cpu system.  Hardly worth it, IMHO.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
