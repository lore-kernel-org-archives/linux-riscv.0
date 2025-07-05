Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0879CC8303C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfxP4CanJKV1LAnyk6EokvF8/WfPQ/TBv9UqbH8K8+A=; b=ydEzTrs8oVOqmW
	e8bTfyR2r5qrL+fAe7+69crqPCN3eyPEOUpMeC5LB6IcSkg63gncrO0uT+viHhsICcmr4c2gqolhO
	zncZBa1J2UMzlDmkiImf3glAi6vghX2BLz8cgC1hQC2eTv3TLACQAFxRLOzVqtQy/KP2YkRjyLgGE
	m9uxdTYf0d0ngjqzTxCLV0S1vlhojB/BrKZy//UJr/8OzFq9YgP1yjoUtcaSWnPe6IjEmY9GomeTI
	dKi05zMpNfAhJ6THwZ+auLqD5evzQ96iOQvItSoITYMQTWGdEOvpqYxfV8QTCUuwkrHKMraZuO7EG
	/nUDL3uSjNPHbuIcqRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxPf-0000000GDzH-0L4l;
	Sat, 05 Jul 2025 07:34:19 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxD2-0000000GCf7-2iM9
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:21:18 +0000
Message-ID: <c3e83d38-1192-4c55-a4ea-263639f47ad6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751700072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euhcLfujtIvPVA/VcYVwZJTUlTuFRe4/HxRQq/ltqzY=;
	b=hoRSOZXNSXk4tqkpkGPZ6moJ0oX9X2ATr72QOgTxioSC/wY+0yJmMaHHge1BSXpzYK7gDZ
	h/oGRFZuflNp4k7fSkjYhCG8Io9w359QPR7e4SAQ8z89c0sHjr4gqlOnX6wonNL8gfh5b6
	2DsvSYunqfnkolmq25dJ3cJXyH3P/iM=
Date: Sat, 5 Jul 2025 00:21:06 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] RISC-V: KVM: Disable vstimecmp before exiting to
 user-space
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
 <20250704153838.6575-2-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250704153838.6575-2-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_002117_143215_8B06945A 
X-CRM114-Status: GOOD (  15.81  )
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


On 7/4/25 8:38 AM, Anup Patel wrote:
> If VS-timer expires when no VCPU running on a host CPU then WFI
> executed by such host CPU will be effective NOP resulting in no
> power savings. This is as-per RISC-V Privileged specificaiton
> which says: "WFI is also required to resume execution for locally
> enabled interrupts pending at any privilege level, regardless of
> the global interrupt enable at each privilege level."
>
> To address the above issue, vstimecmp CSR must be set to -1UL over
> here when VCPU is scheduled-out or exits to user space.
>
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Fixes: cea8896bd936 ("RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc")
> Reported-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu_timer.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ff672fa71fcc..85a7262115e1 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -345,8 +345,24 @@ void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
>   	/*
>   	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
>   	 * upon every VM exit so no need to save here.
> +	 *
> +	 * If VS-timer expires when no VCPU running on a host CPU then
> +	 * WFI executed by such host CPU will be effective NOP resulting
> +	 * in no power savings. This is because as-per RISC-V Privileged
> +	 * specificaiton: "WFI is also required to resume execution for
> +	 * locally enabled interrupts pending at any privilege level,
> +	 * regardless of the global interrupt enable at each privilege
> +	 * level."
> +	 *
> +	 * To address the above issue, vstimecmp CSR must be set to -1UL
> +	 * over here when VCPU is scheduled-out or exits to user space.
>   	 */
>   
> +	csr_write(CSR_VSTIMECMP, -1UL);
> +#if defined(CONFIG_32BIT)
> +	csr_write(CSR_VSTIMECMPH, -1UL);
> +#endif
> +
>   	/* timer should be enabled for the remaining operations */
>   	if (unlikely(!t->init_done))
>   		return;
Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
