Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D680EFCBD4
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlMzTEew6RCB4JQW6jP92SMzMAEzN8HGjPV28eqi1H0=; b=1+F6B1x7u4eXDn
	pPoqc7SzneGlny5LV9Yzr/p/kfS30OPjCtgtVIUcGXDksyFmJqnINqOcwFD2NvgGbE0aIda+GbhjM
	q7JWWSKgseF27NSGRdnNc05lHT8J7o6bBLciEZSSpnJUsH9XNOS1BFTgW1Zeql7nJf3XgK0XfWxnD
	WynbUycYGVF9X8ECjscJR8SDNC+Ig2Tyb60DXOUr6LbI5DbvB7lPJOcKBTueHtliAo9wWnrC+atHO
	2X4Nr0R1pLyPWjQ7rv2U5KudHiLHtoMIaUsThstVPzHjW+D8GPEH++RiMU3A2AZmE6w9TOlPrQX4U
	im7GDjKDR4qG9LfA3+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22KB-00000003TuY-3mdp;
	Mon, 16 Mar 2026 07:25:15 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22K8-00000003Tov-1fuE
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 07:25:14 +0000
X-QQ-mid: esmtpgz14t1773645830ta5941143
X-QQ-Originating-IP: SrL6XDd9C9WWbnTt9K+XIFHXRHCb4ctcY6I/cN5tLYw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Mar 2026 15:23:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6793528252257835848
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Mon, 16 Mar 2026 15:23:48 +0800
Message-Id: <DH40Z14EHV40.1I443BTRU720F@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Vivian Wang" <wangruikang@iscas.ac.cn>, "Troy Mitchell"
 <troy.mitchell@linux.dev>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev> <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
In-Reply-To: <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MmPNY57tR1XnLOdOHIIlsM5mNaY9Y4fy8WC+3ZqEBr0LMGEZ6N1Bie8s
	E5Tfs71HgNGDEJ4DpzlwEW6X1qP3+zVIrlP1JWIBmmIjLJWZ5yDgRDJE9RMkDoppHV2/DY5
	gB6QqFqeZmO8xnhzNeOUxYdP7+If9iUNTClsSDGgo5yqLhmU7j4WmBmr9Emam/ittVTRBwp
	Wkqv8aYLww3l5B9qFbxResDevVLmP6SI7s69V4Ldvi2GTIyerTqn7UFQ77s+na41255UlwW
	9osLdubx+jbLACAItElDQ9VcLI0m5zKHZEf9bU6Qs+uN9uXVveeWNQJmxNiG1luWuxG/Hdg
	pqOvaKUy3lydDlNY/ZwleJ0FkFDe1o3Dpm+RyPT8DQ11S/Eo6qeAyMKe18oUn0Hm3DJglEF
	2ETnxixTwQ/htbcA/mmylRCqN7szMbx0a7AhYCEfWmvr2bCWAotBUF/F+9rmzwQtbSYi+na
	Ai7PlraHqZNUyNdySeKxF7yh76j+pBjzbiCOLfSO40USA7jFRmAv8Ib80xviCRy62o8uFqt
	AxHhpz8PjN0VNYY8J5FvbaXG/dktPxAI9bMTjLCoTYevfP1x2nd6VG2lGr2x+emEKxpkCiB
	zaWe5I41GhDm90g5Jtd0LWLvpTiLJU+JeZdDBfmSYQtMuWrU8yoKmMOszltt9M1YpibRrtH
	v6IGrLiXgFIQwh3PUTEptb8TvVgFZyOQV3sXh68eGbe5h23pVduSaduoszC+mYyaMk7zIrB
	CQemB3/kxsCoiCLd8oJniQYu/JDpv791RRJ6YnUJ09B/rdmeZEyL7JoxPYJ3nh0myWPlKc5
	uWjwBRmtZH43yBH2Ukw7ntdE1NG6QvJx/sWY1VK+K/4KFrR2yLxySEaitS/emm9EwsLmHhQ
	0CoAw0SMPwN7TVm64DGGJfq2ES7b/cwhcEhxSAylZxZrlMOTtu27YvQuBKev2I48PmBPITX
	ta3DaK8/6w6Pri45DRIMwM4NU2PM67UZXfka8IXr0o9vDDBqZfMn1e+JJGjdB6cFqoh7M+x
	a/3YH2aPjgsqMGnd/+dOoxs+4nJzYBnn6p+D+xvw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_002513_002650_FE4EF0BE 
X-CRM114-Status: GOOD (  22.98  )
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

Hi Vivian,

Thanks for the review and the insights!

On Thu Mar 12, 2026 at 11:05 AM CST, Vivian Wang wrote:
> On 3/11/26 10:51, Troy Mitchell wrote:
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
>
> Maybe while we're at it, we can fix the other functions in this file as
> well?
Nice catch. I'll fix other functions in the next version.
>
> I think the reason we ended up with the "unsafe" implementations of the
> reboot/shutdown functions is that on the backend it is usually SBI SRST
> calls, which can protect itself from other CPUs and interrupts. Since on
> K1 we're going to be poking I2C directly, we run into the problem
> described above. So all of these should disable interrupts and stop
> other CPUs before calling the handlers, and can't assume the handlers
> are all SBI SRST.
Yes, we cannot assume that all platforms rely on this.
>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> ---
>>  arch/riscv/kernel/reset.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
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
>
> So... one thing I'm not certain is that arm64 also has some EFI handling
> here. But I think the safe choice is to ignore EFI for now until it's
> needed, instead of preemptively doing it. Who knows what shenanigans
> firmwares can get up to.
I agree at all.

>
> Thanks for the patch!
I'll prepare v2 with those functions fixed. Looking forward to your further review
on the updated version

                                                - Troy
>
> Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
