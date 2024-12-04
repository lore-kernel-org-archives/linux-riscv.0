Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA4EE7716D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBYjiP3KumSgg8sLmM2AkJ7bA8audbHQ3+MtJ6PO7Uk=; b=VdwEysSLEvQEdi
	CnOT1I7pflsVDVZWhaW0ds0/1gtOewXD+S13hj6w2XMRvM9fNGR7fUrqr5Hzrf2qfmApMewNBwQAU
	NGzOeunu18s1L6T1jin6U6g9JZ1IY6fdYVYtFxZl5whiq0xKKeCs/pcPHfwngZKFN7aGbyLkYTttp
	onTPUOzq27VmDYcM+KKhsvrRaHHYszNrLh6zhPnHVRR3e6vik05esGU/QOWTI4LSCt7YmfdUSQutE
	zopWLswpdgABS94MzIB0x2fsi2Xz7J1a4bsbTbbXiUPyU28/Sl3Otjru0MntXXNsZTRofDdNn/0kU
	UpS24Jy0ehTveD2Mikug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkj2-0000000Bscq-2b34;
	Wed, 04 Dec 2024 08:27:12 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkiz-0000000Bsbu-1toz
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 08:27:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A3DC60007;
	Wed,  4 Dec 2024 08:27:01 +0000 (UTC)
Message-ID: <7e93d7a9-caa8-40c4-997a-d96ad94dbe94@ghiti.fr>
Date: Wed, 4 Dec 2024 09:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] riscv: Fixup boot failure when
 CONFIG_DEBUG_RT_MUTEXES=y
Content-Language: en-US
To: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com,
 peterz@infradead.org, parri.andrea@gmail.com, will@kernel.org,
 longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de,
 alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20241130153310.3349484-1-guoren@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241130153310.3349484-1-guoren@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_002709_757108_385D2C06 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

On 30/11/2024 16:33, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When CONFIG_DEBUG_RT_MUTEXES=y, mutex_lock->rt_mutex_try_acquire
> would change from rt_mutex_cmpxchg_acquire to
> rt_mutex_slowtrylock():
> 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
> 	ret = __rt_mutex_slowtrylock(lock);
> 	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
>
> Because queued_spin_#ops to ticket_#ops is changed one by one by
> jump_label, raw_spin_lock/unlock would cause a deadlock during the
> changing.
>
> That means in arch/riscv/kernel/jump_label.c:
> 1.
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock  -> queued_spin_lock
> 			 |-> raw_spin_unlock -> queued_spin_unlock
> patch_insn_write -> change the raw_spin_lock to ticket_lock
> mutex_unlock(&text_mutex);
> ...
>
> 2. /* Dirty the lock value */
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock -> *ticket_lock*
>                           |-> raw_spin_unlock -> *queued_spin_unlock*
> 			  /* BUG: ticket_lock with queued_spin_unlock */
> patch_insn_write  ->  change the raw_spin_unlock to ticket_unlock
> mutex_unlock(&text_mutex);
> ...
>
> 3. /* Dead lock */
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock -> ticket_lock /* deadlock! */
>                           |-> raw_spin_unlock -> ticket_unlock
> patch_insn_write -> change other raw_spin_#op -> ticket_#op
> mutex_unlock(&text_mutex);
>
> So, the solution is to disable mutex usage of
> arch_jump_label_transform_queue() during early_boot_irqs_disabled, just
> like we have done for stop_machine.
>
> Reported-by: Conor Dooley <conor@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Fixes: ab83647fadae ("riscv: Add qspinlock support")
> Link: https://lore.kernel.org/linux-riscv/CAJF2gTQwYTGinBmCSgVUoPv0_q4EPt_+WiyfUA1HViAKgUzxAg@mail.gmail.com/T/#mf488e6347817fca03bb93a7d34df33d8615b3775
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   arch/riscv/kernel/jump_label.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index 6eee6f736f68..654ed159c830 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -36,9 +36,15 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
>   		insn = RISCV_INSN_NOP;
>   	}
>   
> -	mutex_lock(&text_mutex);
> -	patch_insn_write(addr, &insn, sizeof(insn));
> -	mutex_unlock(&text_mutex);
> +	if (early_boot_irqs_disabled) {
> +		riscv_patch_in_stop_machine = 1;
> +		patch_insn_write(addr, &insn, sizeof(insn));
> +		riscv_patch_in_stop_machine = 0;
> +	} else {
> +		mutex_lock(&text_mutex);
> +		patch_insn_write(addr, &insn, sizeof(insn));
> +		mutex_unlock(&text_mutex);
> +	}
>   
>   	return true;
>   }


Sorry for the late answer, I've been sick lately!

Thank you very much for looking into this and finding this not-so-bad 
solution! I remind everyone that this is a temporary solution until we 
can use an alternative instead of a static key.

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

The revert is still on the table IMO, let's Palmer decide.

Thank you again Guo, really appreciate you took the time to find this 
solution!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
