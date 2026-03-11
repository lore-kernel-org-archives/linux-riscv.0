Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CABD1049523
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99DhpA3b406KHVz2EwRJV1InLjEKLdqhO8XxPDouqUs=; b=XXZv68rAB4Tn+/
	VsrconTuKLRTv4NYkTTb14mcTGkP2KAuzJiJRM1HRjtvcwPZGmJ36Ki8OHxrOn0wEnZBhMA10qvyp
	UCNVFPbzW0DeWIhiPlfPuH3UiUmd9olntjEomnSC6GUqtYgc1Cir8Y1hJW+F8MZ3+WTdE2eFZbRWS
	NVvFemR0h8fWWFvKMlt84n3+3hrSYFuucLwUg+LvBltwkWX9Ox1m2+tRAZNKo44UVKMrNnUSCBCj9
	y860K5KD/rRERAiCzLnY2ibnEL62L6xZCon2euTtBIEsvARAP7d0Gf5V1ncL1/MrdEurfHWsxy7VN
	xDlVIwgOaxf0Ha8lSd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GDL-0000000BK9z-26NW;
	Wed, 11 Mar 2026 09:50:51 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GDI-0000000BK0d-1v3L
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 09:50:50 +0000
X-QQ-mid: zesmtpsz7t1773222552t96c6394d
X-QQ-Originating-IP: tLsdr5O1OVgnv6pRMxCTwQmUYnvtTVooyzNm1cn2Huc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Mar 2026 17:49:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15209476583786432799
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Wed, 11 Mar 2026 17:49:10 +0800
Message-Id: <DGZUXM2Y3VE5.1Z9ZY97DT5XBA@linux.dev>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Troy Mitchell"
 <troy.mitchell@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev> <abEP80FoCn4S4-WG@aurel32.net>
In-Reply-To: <abEP80FoCn4S4-WG@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYpbVsTx4C81bWtly/iq7uKUBmmiZmV+rjCsSHht1V4IG6u/RvI0uEyj
	SzJ8IuX51AO9sSV8fsB7Yn78iD8zOxYp2xxcy1Y4yDmxw/CbFkjcJEmCtdbBnyPHK5AWu1b
	XIbFeuLrB9Pmks/8ZzHrI8neaoOCAJ7d/4hoTsqqMoaYO7ZLURWQlgP9vECkStLJ1/3peFS
	rDMIHAVzIpAZlH02+hzwAH0QtuVnRCIUNlcMMpL1x9gMJ8nyVqk/oKV7Y/dMngmkP0Wcup+
	WkoUHZFiyktl/xidz+/R7v/udm+gChjPR0NuK+XfWvtTlnA4GwYzyxsFXwrML1u/E8gM09a
	4PQpahpIDZ37oNHclYSXc897FfNJWcniOjT9G3P8M5q5J9e1Zn/XFPHpBSX/opxIGVt6HwG
	ye6wbx5BtkLY+HhKu71Z+2Up6/ICmjVBDoalf6mAdaBSn7FXbzfCm00mU0aX2DwvZUNEmCJ
	5cGj40/4tPtg3XV0feeXLe7cc/3yFD3arEvghDIS7EL9bJDzaGZGiEcD3GVTyspGj+MudHJ
	lLPJxIrp48BicJNQ93I30TPPJhdDTRTPJ6U/mOS4oiz3psYO7rcwygwwndR0KAjpIdIib40
	f1AiBdONcTfiQzkao02hSbRXe3En1Jl54Y7abmkL16LMFIbeYWKftu/xEiZvHDYk5B9nwTW
	kTDVN2ldlTy9ciwP4arxU4dKQjB2CSPmN/zPdYSfV5I8w2fgCE+0Mvwx9tW3nwTu+RBo0ed
	UXPWAJBPvdW7htjimAwE//v/hG51VpSCn0NTExLLzZHUVz15Wvyu5zDEEgx8C4saYnDVVcv
	8s5QbKhvI5EC0eatJe8GMBU2sWi4HB0dfKTGX/Ep0QgeGS0hd/zq9gb2UCzJ5aLtxZp1SCC
	wTvHDZ3Ae2P9BMema7BjmJcH7QqEX0HCcPIJ79rnzbkzNxeX/xkEVNTz5JDwosJqGN/9Dum
	XsutoK3Ufgvm7dmSTL8uCzG/ZcIzOG8Dffb69ueAQPgcEVqApN9QGdlM/ZaVXxBmN3shVj6
	49TOP3MqkdkcGcyF4UtC+SEBmMUpvvWKY4rzm9EjzuVpTdpDOm
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025048_950887_BF5FF4A0 
X-CRM114-Status: GOOD (  18.86  )
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

On Wed Mar 11, 2026 at 2:47 PM CST, Aurelien Jarno wrote:
> Hi Troy,
>
> On 2026-03-11 10:51, Troy Mitchell wrote:
>> Currently, the RISC-V implementation of machine_restart() directly calls
>> do_kernel_restart() without disabling local interrupts or stopping other
>> CPUs. This missing architectural setup causes fatal issues for systems
>> that rely on external peripherals (e.g., I2C PMICs) to execute the system
>> restart when CONFIG_PREEMPT_RCU is enabled.
>> 
>> When a restart handler relies on the I2C subsystem, the I2C core checks
>> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
>> or the polling atomic_xfer. This check evaluates to true if
>> (!preemptible() || irqs_disabled()).
>> 
>> During do_kernel_restart(), the restart handlers are invoked via
>> atomic_notifier_call_chain(), which holds an RCU read lock.
>> The behavior diverges based on the preemption model:
>> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_lock()
>>    implicitly disables preemption. preemptible() evaluates to false, and
>>    the I2C core correctly routes to the atomic, polling transfer path.
>> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemption.
>>    Since machine_restart() left local interrupts enabled, irqs_disabled()
>>    is false, and preempt_count is 0. Consequently, preemptible() evaluates
>>    to true.
>> 
>> As a result, the I2C core falsely assumes a sleepable context and routes
>> the transfer to the standard master_xfer path. This inevitably triggers a
>> schedule() call while holding the RCU read lock, resulting in a fatal splat:
>> "Voluntary context switch within RCU read-side critical section!" and
>> a system hang.
>> 
>> Align RISC-V with other major architectures (e.g., ARM64) by adding
>> local_irq_disable() and smp_send_stop() to machine_restart().
>> - local_irq_disable() guarantees a strict atomic context, forcing sub-
>>   systems like I2C to always fall back to polling mode.
>> - smp_send_stop() ensures exclusive hardware access by quiescing other
>>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>>   during the final restart phase.
>> 
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> ---
>>  arch/riscv/kernel/reset.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>
> Thanks. I have been debugging that and it matches my analysis.
>
>> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
>> index 912288572226..7a5dcfdc3674 100644
>> --- a/arch/riscv/kernel/reset.c
>> +++ b/arch/riscv/kernel/reset.c
>> @@ -5,6 +5,7 @@
>>  
>>  #include <linux/reboot.h>
>>  #include <linux/pm.h>
>> +#include <linux/smp.h>
>>  
>>  static void default_power_off(void)
>>  {
>> @@ -17,6 +18,10 @@ EXPORT_SYMBOL(pm_power_off);
>>  
>>  void machine_restart(char *cmd)
>>  {
>> +	/* Disable interrupts first */
>> +	local_irq_disable();
>> +	smp_send_stop();
>> +
>>  	do_kernel_restart(cmd);
>>  	while (1);
>>  }
>> 
>
> I have started to change the power reset driver to call the I2C code 
> from a workqueue instead of directly from the notifier call back, but 
> that's just papering over the issue.
Since the requirements for i2c_in_atomic() weren't being met, I initially
considered disabling interrupts before the p1 restart code.

However, I didn't feel that was a generic enough solution, so I looked into
the architecture-level implementation. That's when I realized how bare-bones
the current RISC-V machine_restart() actually is..
>
> Your approach is much better and 
> aligns riscv64 with other architectures, which is important as we might 
> have shared PMIC drivers.
>
> Therefore:
>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks. :)

                                    - Troy
>
> Regards
> Aurelien


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
