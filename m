Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0493CD8C90
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 01:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ2gfAhH4UhUbuRx7TEFaazXRMAKD2543pnpUGsR4wY=; b=UIpU7NLsQZGN8k
	TSEhFjEczLIEjnQoXlUKO+ALNP54SCow30vaUzjWJJ99lTlxY4r5rAKLkuXxglzo25X7p/IWZopeU
	Jklt6/KYo+HuvbbdgCJ0LBo/1dlHu3aVJefX2jNQDxevKmc4ZUjVLT9TzxTy7xOsbZy05rKT3N271
	Q7rkvOIIgVHhkdtsLHhn+UOTfddzqZX6j6uRYBWtPX6Xg1rCpZKdtOft3nLZr023E1f/GbjslocwN
	1Fh9/sltQVtjRiOiZAoVMvAQ778GpErWCDC8i24qmbKqt0Htpc55yuIAgIRj3mEroITx26WkSo46p
	t+YeMDMrbyA1CUSyiheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOgM-00000002g8L-3Ibu;
	Mon, 08 Jun 2026 01:21:38 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOgJ-00000002g7O-2roo
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 01:21:38 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780881680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxEvUfH9QoMBWe5UKI9XOfbgGKkqlVzL0+nWkvvLnp0=;
	b=cG082HsAL/LltPk8sH5lS49pkSdIyH/gCKie6DiDgLYw5M+G1NAIviv4LSBHrFS+4WYdBK
	GThT9HEjxG9irElzwkn/MnlxqyDKA2QzyH05mAzPGYmifYY6+2CabcDCj+NvV5ODOCPJL8
	JPbdKe/Z6FcDKpqB3nyb8Ovjxg2CrhU=
Date: Mon, 08 Jun 2026 09:21:01 +0800
Message-Id: <DJ39V0ZUPDG5.3UJO3VMV0J502@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Aurelien Jarno" <aurelien@aurel32.net>
Subject: Re: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
References: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com> <DI5M2DY419FY.7DUCXZDHR22V@linux.dev>
In-Reply-To: <DI5M2DY419FY.7DUCXZDHR22V@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_182136_419573_94428A3C 
X-CRM114-Status: GOOD (  15.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed Apr 29, 2026 at 7:44 PM CST, Troy Mitchell wrote:
> Hi all,
>
> On Mon Mar 30, 2026 at 5:58 PM CST, Troy Mitchell wrote:
>> From: Troy Mitchell <troy.mitchell@linux.dev>
>>
>> Currently, the RISC-V implementation of machine_restart(), machine_halt(),
>> and machine_power_off() invokes the kernel teardown chains (e.g.,
>> do_kernel_restart()) with local interrupts enabled and other CPUs still
>> running.
>>
>> This implementation fails to provide a deterministic execution environment
>> for registered handlers in the restart or power-off notifier chains. These
>> chains are intended to be executed in a strict atomic and single-threaded
>> context.
>>
>> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
>> the preempt_count. If local interrupts remain enabled, the environment
>> is not guaranteed to be atomic. This can lead to a context misidentification
>> within generic kernel teardown code, causing it to incorrectly enter
>> non-atomic paths (such as attempting to acquire sleeping locks), which
>> results in fatal "scheduling while atomic" splats or system hangs.
>>
>> Additionally, stopping other CPUs ensures the primary CPU has exclusive
>> access to the hardware state during the final teardown phase, preventing
>> unpredictable interference from other active cores.
>>
>> Align RISC-V with other major architectures by disabling local interrupts
>> and stopping other CPUs at the beginning of the shutdown sequences. This
>> guarantees the architectural expectations of the kernel's restart and
>> power-off handlers are met.
>>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Gentle ping on this patch. Is there anything I should change or any
> concerns with the approach?
Just a gentle ping on this series. 

Please let me know if anyone has any feedback or if there is anything 
I should update.

                                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
