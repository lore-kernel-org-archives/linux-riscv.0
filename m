Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01181049526
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JC1OT2HZtlaxYwCS7sDc3hgmfa8yEQIZY2uxe7WXzSo=; b=Ohc/PQpvJITBBL
	RmYeul83GbPsYOjY/e2NhZk2j9BCd8UsVKbBF4CIPHpa493RR1zkfJwVP3X/59sTrI0XnXDFK3p9H
	aqd8UBFQRQYLwVu00Ish5AKSY+liv0WoWYmAZ/NQZfxszhgn76PH7BtAGhIuxMgYtwzhb2BuZY8nQ
	6Mr1fgvjksSxhWRKZZSOQcIyWbHJtmY5tDVIsmXmBhgp07EEhQsC3J6B7HMxmTdBKc8turqYQMXbO
	xvQdJxtk5+je/OndYUwQqIN9ztIyGRme545dnhLa6drWBImWzCI4+utLX0BVYdJc7gI07F5c+GaU4
	380P7LPguyYM0xOMEjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GID-0000000BLxD-0Ghk;
	Wed, 11 Mar 2026 09:55:53 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GI9-0000000BLt8-2QCj
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 09:55:51 +0000
X-QQ-mid: esmtpgz11t1773222844tefda0680
X-QQ-Originating-IP: hVyVvPnZSY/8aV0kXoqb8tsoujiFj3f1URUDvKKAy50=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Mar 2026 17:54:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17423703683891778313
EX-QQ-RecipientCnt: 9
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Wed, 11 Mar 2026 17:54:02 +0800
Message-Id: <DGZV1C1YZJB8.1KOS6S0ICO4AE@linux.dev>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Aurelien Jarno"
 <aurelien@aurel32.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev> <abEP80FoCn4S4-WG@aurel32.net> <DGZUXM2Y3VE5.1Z9ZY97DT5XBA@linux.dev>
In-Reply-To: <DGZUXM2Y3VE5.1Z9ZY97DT5XBA@linux.dev>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MSRkgO0tQyp+NozTthkUWuT+MXftymvpedaejj7Wm29SyznRlQsJ0U8/
	7RVxRgkDEOCiVHqgVNDn/PQgZqSeGAEgvUYcMqkiWjIODJ5y/zJQuDHHCH+sXXlaWIT/uke
	uzWoeAMZPQcR9f2BN9Kw2RNzDx+/BE5B47DA5iS648gQcw0dzDa1eO40eJl8K2Uyp8BNQcn
	nfvanldbAFIeOg1B0xvse3reCUONs0SM8nb4fL7FJqhrcWMOMAPISrdP5d7mVX3xrBBhGbd
	FbAHyOeHOzsa7ggLrOG9WuwCAsl1FH5sxVHWvYlgN8NylZLRopNtA8uTfUxRrcnq4zkfqZM
	GQqNjWlfWBuq1n908DCfB3O3twKytP6cGOLlqieFSEEBF7lhmgjZezQg/8ZkqvQlgFz5KSq
	ArUACN2DNiXu2Fm3BNnMwP+q4t+u0EQuk6s1Fvd7O5rWeKY3kyPNf4Oao5CRnHF10bPBydP
	dSh+7P6TFavWJSpCa435KW69r96MosZ9ek7Ogzv1ET3u4qS5+11P5wmlSox8hN/6MWqiFqH
	Cw39EMlAFhNf7G6fJJdUA4y4BxUN3R+UA95dK18p5hf58tdsyLG/OpKOrDyBBMKudM6RaMV
	8WxvwdSj1sKL81OEauGM4agL/K1T8eogGqVUeEZR9cn/YnjhJZmQjUU4dvsom5bCBTaSSHx
	8oeYCk0ZDSJsgeNwybBrH3iTjQ6adFbFdZ1ep+mclk+xgAG7OkMEKqgF8of54o0VdHZhoFf
	BevloFAb5IDTh0c8iyHfpfdL5NnYv6A9IbLc9PTJav3ZzgYQIl2USR6Yi567sPYB75TuHr5
	4iQs45Ox0yBdlIqypb/gIGsk9/wA9k+Gz9a14e/eW6NoCGTZCuKansALB06zawZ9qsQDcES
	biRzODLBMylV8OXVM1I4bzlSnqOB/wQLW9H3+nBmqSLYTUCYjuRvBcHiCj95kNAsRXjaQpF
	YzVqmeSQzAI6caF4Nfoo0muGqaE9tOuJBaeSFhlXW0r9NdRJ2Gnj9oRNH4e53JnVJ4drK0h
	3aR9znMKQuO5VgwKQNDF6yI0zJJ29hCXStoNyxyJI3j0YXRUH5NzvBHobqx50ZVVfDN/e7L
	SsamT6QoW2NFR2Xly/KsGC8wqBGko+ctGs14tG2kFIZ
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025550_130468_4E0A0519 
X-CRM114-Status: GOOD (  13.63  )
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

On Wed Mar 11, 2026 at 5:49 PM CST, Troy Mitchell wrote:
> On Wed Mar 11, 2026 at 2:47 PM CST, Aurelien Jarno wrote:
>> Hi Troy,
>>
>> On 2026-03-11 10:51, Troy Mitchell wrote:
>>> Currently, the RISC-V implementation of machine_restart() directly calls
>>> do_kernel_restart() without disabling local interrupts or stopping other
>>> CPUs. This missing architectural setup causes fatal issues for systems
>>> that rely on external peripherals (e.g., I2C PMICs) to execute the system
>>> restart when CONFIG_PREEMPT_RCU is enabled.
>>> 
>>> When a restart handler relies on the I2C subsystem, the I2C core checks
>>> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
>>> or the polling atomic_xfer. This check evaluates to true if
>>> (!preemptible() || irqs_disabled()).
>>> 
>>> During do_kernel_restart(), the restart handlers are invoked via
>>> atomic_notifier_call_chain(), which holds an RCU read lock.
>>> The behavior diverges based on the preemption model:
>>> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_lock()
>>>    implicitly disables preemption. preemptible() evaluates to false, and
>>>    the I2C core correctly routes to the atomic, polling transfer path.
>>> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemption.
>>>    Since machine_restart() left local interrupts enabled, irqs_disabled()
>>>    is false, and preempt_count is 0. Consequently, preemptible() evaluates
>>>    to true.
>>> 
>>> As a result, the I2C core falsely assumes a sleepable context and routes
>>> the transfer to the standard master_xfer path. This inevitably triggers a
>>> schedule() call while holding the RCU read lock, resulting in a fatal splat:
>>> "Voluntary context switch within RCU read-side critical section!" and
>>> a system hang.
>>> 
>>> Align RISC-V with other major architectures (e.g., ARM64) by adding
>>> local_irq_disable() and smp_send_stop() to machine_restart().
>>> - local_irq_disable() guarantees a strict atomic context, forcing sub-
>>>   systems like I2C to always fall back to polling mode.
>>> - smp_send_stop() ensures exclusive hardware access by quiescing other
>>>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>>>   during the final restart phase.
>>> 
>>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>>> ---
>>>  arch/riscv/kernel/reset.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>
>> Thanks. I have been debugging that and it matches my analysis.
>>
>>> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
>>> index 912288572226..7a5dcfdc3674 100644
>>> --- a/arch/riscv/kernel/reset.c
>>> +++ b/arch/riscv/kernel/reset.c
>>> @@ -5,6 +5,7 @@
>>>  
>>>  #include <linux/reboot.h>
>>>  #include <linux/pm.h>
>>> +#include <linux/smp.h>
>>>  
>>>  static void default_power_off(void)
>>>  {
>>> @@ -17,6 +18,10 @@ EXPORT_SYMBOL(pm_power_off);
>>>  
>>>  void machine_restart(char *cmd)
>>>  {
>>> +	/* Disable interrupts first */
>>> +	local_irq_disable();
>>> +	smp_send_stop();
>>> +
>>>  	do_kernel_restart(cmd);
>>>  	while (1);
>>>  }
>>> 
>>
>> I have started to change the power reset driver to call the I2C code 
>> from a workqueue instead of directly from the notifier call back, but 
>> that's just papering over the issue.
> Since the requirements for i2c_in_atomic() weren't being met, I initially
> considered disabling interrupts before the p1 restart code.
>
> However, I didn't feel that was a generic enough solution, so I looked into
> the architecture-level implementation. That's when I realized how bare-bones
> the current RISC-V machine_restart() actually is..
>
FYI, the discussion with Aurelien started here [1].

Link: https://lore.kernel.org/all/DGZM6WUAVPPS.20Y0NIZYI4572@linux.spacemit.com/ [1]


                          - Troy
>>
>> Your approach is much better and 
>> aligns riscv64 with other architectures, which is important as we might 
>> have shared PMIC drivers.
>>
>> Therefore:
>>
>> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
>> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Thanks. :)
>
>                                     - Troy
>>
>> Regards
>> Aurelien


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
