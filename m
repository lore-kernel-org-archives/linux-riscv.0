Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3017C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=we+4HDx46fO6zJBpmoF1XYZ5BiA2F2eSCgZ61OjtQ1I=; b=yD/bywbmz2rERj
	cu0TXiiowINiVGhX3Ra6ceKm1A4btFP4OVGqBQ/oWVS5XLh41YFELWs7FH5fb6t+Q+WVOFfUeI7b3
	UMDBNHcP2AjOyBlzx28vvF5eC2c8O6O02f51oJdQmCdb4CPE9DNA0uHyJtUlgyXu/g5mtwPtD20wD
	+B2XGb+po0aeHL85VnHZk7GaNTfHthAo0xl9e3RhZjx0eEhFnmplq109fu7AB8YHHhWgiu8kTUgid
	gsLo11OGl1LHWQRLvQvLaPyVUZ+LTywcmD48O7mV7jxwnnU3vkTxF92TjMELsSjPZb2RNbvAK3wCx
	4MCrkZIV9G+hmqobxg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSAB-00000002nxU-1pnv;
	Mon, 27 Jan 2025 16:40:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcS8o-00000002nqw-3RE7;
	Mon, 27 Jan 2025 16:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 059E35C1178;
	Mon, 27 Jan 2025 16:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40C3C4CED2;
	Mon, 27 Jan 2025 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737995953;
	bh=fmZlVwU6uR12bQbSxMQf1gRYU1EYKK1u0Z90fzYu2zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjbXtwYylY77rIpZgK3aGfJ56B1/5Xw37p2eUDiAEdIfdrEuMSNA4Cm5qPP4ZRW0v
	 NPofe0Y4Rjf9IIo9dFFq4V/yQY8fpvCThe7/ZMffHtIvOIwRUFgf09d7RS5v4mKh8k
	 vonNl59vSBwaT8RKyBTUXlEOL0Jjo2wwyyjaE2pJrKji8YizjYv69Le9B0XMksAjl5
	 O+jbchyBHlqeiCTTnqxadWhPuV0eI63+E53B3F8rRzs+vg7nCyQvA/Hn9SzDgbAyx2
	 HcfPYVwKfTpHiwfJAN8b7bE1E31SKSXV9eEcsPxzf+sdAph0HPbgBYkWigadPBVumj
	 e/W2scjh0n5wA==
Date: Mon, 27 Jan 2025 16:39:06 +0000
From: Will Deacon <will@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, tglx@linutronix.de,
	akpm@linux-foundation.org, bhe@redhat.com, hbathini@linux.ibm.com,
	sourabhjain@linux.ibm.com, adityag@linux.ibm.com,
	songshuaishuai@tinylab.org, takakura@valinux.co.jp,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	jonnyc@amazon.com
Subject: Re: [PATCH v6 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Message-ID: <20250127163905.GC25757@willie-the-truck>
References: <20241204142003.32859-1-farbere@amazon.com>
 <20241204142003.32859-2-farbere@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241204142003.32859-2-farbere@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_083914_946604_F237D203 
X-CRM114-Status: GOOD (  22.22  )
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

On Wed, Dec 04, 2024 at 02:20:02PM +0000, Eliav Farber wrote:
> Consolidate the machine_kexec_mask_interrupts implementation into a common
> function located in a new file: kernel/irq/kexec.c. This removes duplicate
> implementations from architecture-specific files in arch/arm, arch/arm64,
> arch/powerpc, and arch/riscv, reducing code duplication and improving
> maintainability.
> 
> The new implementation retains architecture-specific behavior for
> CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD, which was previously implemented
> for ARM64. When enabled (currently for ARM64), it clears the active state
> of interrupts forwarded to virtual machines (VMs) before handling other
> interrupt masking operations.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> V5 -> V6:
>  - Change GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD to not be user selectable.
> 
>  arch/arm/kernel/machine_kexec.c   | 23 ------------------
>  arch/arm64/Kconfig                |  1 +
>  arch/arm64/kernel/machine_kexec.c | 31 ------------------------
>  arch/powerpc/include/asm/kexec.h  |  1 -
>  arch/powerpc/kexec/core.c         | 22 -----------------
>  arch/powerpc/kexec/core_32.c      |  1 +
>  arch/riscv/kernel/machine_kexec.c | 23 ------------------
>  include/linux/irq.h               |  3 +++
>  kernel/irq/Kconfig                |  6 +++++
>  kernel/irq/Makefile               |  2 +-
>  kernel/irq/kexec.c                | 40 +++++++++++++++++++++++++++++++
>  11 files changed, 52 insertions(+), 101 deletions(-)
>  create mode 100644 kernel/irq/kexec.c
> 
> diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
> index 80ceb5bd2680..dd430477e7c1 100644
> --- a/arch/arm/kernel/machine_kexec.c
> +++ b/arch/arm/kernel/machine_kexec.c
> @@ -127,29 +127,6 @@ void crash_smp_send_stop(void)
>  	cpus_stopped = 1;
>  }
>  
> -static void machine_kexec_mask_interrupts(void)
> -{
> -	unsigned int i;
> -	struct irq_desc *desc;
> -
> -	for_each_irq_desc(i, desc) {
> -		struct irq_chip *chip;
> -
> -		chip = irq_desc_get_chip(desc);
> -		if (!chip)
> -			continue;
> -
> -		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
> -			chip->irq_eoi(&desc->irq_data);
> -
> -		if (chip->irq_mask)
> -			chip->irq_mask(&desc->irq_data);
> -
> -		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
> -			chip->irq_disable(&desc->irq_data);
> -	}
> -}
> -
>  void machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 100570a048c5..dcc3551cf6c2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -149,6 +149,7 @@ config ARM64
>  	select GENERIC_IDLE_POLL_SETUP
>  	select GENERIC_IOREMAP
>  	select GENERIC_IRQ_IPI
> +	select GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD

Is this really specific to VMs? In the new code, it's just controlling
this part of the old code:

> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 82e2203d86a3..6f121a0164a4 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -207,37 +207,6 @@ void machine_kexec(struct kimage *kimage)
>  	BUG(); /* Should never get here. */
>  }
>  
> -static void machine_kexec_mask_interrupts(void)
> -{
> -	unsigned int i;
> -	struct irq_desc *desc;
> -
> -	for_each_irq_desc(i, desc) {
> -		struct irq_chip *chip;
> -		int ret;
> -
> -		chip = irq_desc_get_chip(desc);
> -		if (!chip)
> -			continue;
> -
> -		/*
> -		 * First try to remove the active state. If this
> -		 * fails, try to EOI the interrupt.
> -		 */
> -		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);

which is about active interrupts. Why can't that happen for the host?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
