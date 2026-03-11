Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077CFD0621
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJm+rDychzEb5O86/oHNr8iNckC24EoBxb9Ye7TxsKc=; b=C55RCeAxxQrgx2
	+VXyxdDulUr1Zvz8bv36xmgaiMFGBVZ8wc17poPPjnqrqAW/Ymzk2GRfPwT4PNiaOcKHa2Fqt4NEu
	UAmHw9xR/hjTNbCmFzcih3yIxI5ruEMghKmlW32QB65DcwFHSVgtcKRs/GtGqQzfvXn2bZIU+TZun
	V2rvTIcgDb6l7y5j3y/I2XEaLg1KNEp3PsrED22fAIWobaLzoPWL7ge1veZmkANlwSZYegfNYeNdO
	ajdG9gXYEvGbA24Z0t8+zuPTM6/v5O2HRVAwotITVxlRhMOiFKoeSFRrb27oK5eB0nFYx+R38b2cK
	yr54iKYAJifR7mKhh5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DLl-0000000Ax07-0lDI;
	Wed, 11 Mar 2026 06:47:21 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DLi-0000000Awzd-3UDM
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 06:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mztUlcYsUX1SUhrIWnhDg4vSM7m0nS0R9ybKsM7yhNY=; b=R82/ksyqGntVvfC04lFZNYXKM4
	0S9DHgqPTFRk9b/WsdLTqXtZMIqDNHD5pMCJBHyk+jf5tj5e4EfKTqgsrA344Ml3domQz7myBi2n5
	EnxP2k0UeWIqdqf3D7mjQKvNP0ctmKdSiqlIbiIGZxe06l8ex2necvO23A9ihOCbH7k1jAD9bHQZw
	jz8MryCs8CzX+yrAz9hSooLRTdt18tsu7IqFC0uZLAcc/CQ0CS7BdVqt5mh1uPhJd4wRtFREYnpOa
	qDBTztbIovXGDNLkbUEJiOWD4SMaZ/634sCtM2Fa6Uzbqrj9Mj3GkaxYQ0hAvSsOdu6MT5da7NpS9
	1hRQn87Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w0DLf-000000070BW-49YH;
	Wed, 11 Mar 2026 07:47:16 +0100
Date: Wed, 11 Mar 2026 07:47:15 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
Message-ID: <abEP80FoCn4S4-WG@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_234718_870877_32CF728C 
X-CRM114-Status: GOOD (  21.56  )
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

Hi Troy,

On 2026-03-11 10:51, Troy Mitchell wrote:
> Currently, the RISC-V implementation of machine_restart() directly calls
> do_kernel_restart() without disabling local interrupts or stopping other
> CPUs. This missing architectural setup causes fatal issues for systems
> that rely on external peripherals (e.g., I2C PMICs) to execute the system
> restart when CONFIG_PREEMPT_RCU is enabled.
> 
> When a restart handler relies on the I2C subsystem, the I2C core checks
> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
> or the polling atomic_xfer. This check evaluates to true if
> (!preemptible() || irqs_disabled()).
> 
> During do_kernel_restart(), the restart handlers are invoked via
> atomic_notifier_call_chain(), which holds an RCU read lock.
> The behavior diverges based on the preemption model:
> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_lock()
>    implicitly disables preemption. preemptible() evaluates to false, and
>    the I2C core correctly routes to the atomic, polling transfer path.
> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemption.
>    Since machine_restart() left local interrupts enabled, irqs_disabled()
>    is false, and preempt_count is 0. Consequently, preemptible() evaluates
>    to true.
> 
> As a result, the I2C core falsely assumes a sleepable context and routes
> the transfer to the standard master_xfer path. This inevitably triggers a
> schedule() call while holding the RCU read lock, resulting in a fatal splat:
> "Voluntary context switch within RCU read-side critical section!" and
> a system hang.
> 
> Align RISC-V with other major architectures (e.g., ARM64) by adding
> local_irq_disable() and smp_send_stop() to machine_restart().
> - local_irq_disable() guarantees a strict atomic context, forcing sub-
>   systems like I2C to always fall back to polling mode.
> - smp_send_stop() ensures exclusive hardware access by quiescing other
>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>   during the final restart phase.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/kernel/reset.c | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks. I have been debugging that and it matches my analysis.

> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 912288572226..7a5dcfdc3674 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
>  
>  static void default_power_off(void)
>  {
> @@ -17,6 +18,10 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	/* Disable interrupts first */
> +	local_irq_disable();
> +	smp_send_stop();
> +
>  	do_kernel_restart(cmd);
>  	while (1);
>  }
> 

I have started to change the power reset driver to call the I2C code 
from a workqueue instead of directly from the notifier call back, but 
that's just papering over the issue. Your approach is much better and 
aligns riscv64 with other architectures, which is important as we might 
have shared PMIC drivers.

Therefore:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
