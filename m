Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0578F103E302
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 03:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHe6LGxHX3G3JVFvStwUGIRMluMXHz2pQHLnAi1lpP8=; b=0RN6yXuBbtji/a
	kk7kemHU4pF0fw2rl7fgldai1Dhhravqpomru1ylt9F/eH4YFTCj7a0RlCgGByp5irwM3bXYQ/FSQ
	6Jgk9K3Cd2IktKQ8veIw9UvriEQkqBwyhtISBqgz2e4QjHGnJd0u4EbPPsU3JK5U43G0wQ0zEAVOH
	cMCk+c7y6BP/SEMtMwqA4O9BDWbOotFL3u5KrVMDLo86eho/6A/HgvucAH12d24VXE6Ds0q0bYmhp
	oe4qDvU8mrBM9F8s6voyKyq2Tg+7wcSnYX8b23xxnJE6FbpxTe4ziE8kuG51MVizZl8TZWiuTLbO4
	XUj/8zZtn8/3CgdDPLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0WNE-0000000D4tw-0swL;
	Thu, 12 Mar 2026 03:06:08 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0WNB-0000000D4sW-16wh
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 03:06:07 +0000
Received: from [10.213.19.38] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowACHLGiRLbJpY4nQCQ--.250S2;
	Thu, 12 Mar 2026 11:05:53 +0800 (CST)
Message-ID: <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
Date: Thu, 12 Mar 2026 11:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
To: Troy Mitchell <troy.mitchell@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
X-CM-TRANSID: qwCowACHLGiRLbJpY4nQCQ--.250S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1xGF1xAryUZFWxtw48Xrb_yoW5KFWfpF
	43Cr10vrs5Z3W0v3ZFva10vFyrZws5G3y5Cr9YkrW7Aws8Kr9xKw1Sgw10qF4UGrWDW3Wf
	Z3Wvyr4093ZrZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkI
	ecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	b7hLnUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_200605_709272_92EAF4E2 
X-CRM114-Status: GOOD (  23.43  )
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

On 3/11/26 10:51, Troy Mitchell wrote:
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

Maybe while we're at it, we can fix the other functions in this file as
well?

I think the reason we ended up with the "unsafe" implementations of the
reboot/shutdown functions is that on the backend it is usually SBI SRST
calls, which can protect itself from other CPUs and interrupts. Since on
K1 we're going to be poking I2C directly, we run into the problem
described above. So all of these should disable interrupts and stop
other CPUs before calling the handlers, and can't assume the handlers
are all SBI SRST.

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/kernel/reset.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
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

So... one thing I'm not certain is that arm64 also has some EFI handling
here. But I think the safe choice is to ignore EFI for now until it's
needed, instead of preemptively doing it. Who knows what shenanigans
firmwares can get up to.

Thanks for the patch!

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
