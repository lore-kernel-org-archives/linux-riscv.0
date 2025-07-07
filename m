Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D0DC8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 04:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Mime-Version:Message-Id:From:Cc:To
	:In-Reply-To:References:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cllkGDyrvkpSnagau5LVNYr6Shypo0alDccgxp8LlMw=; b=F7oF35tNk5praW
	K8fznYPukbUaA7LhHtTZpcURh1hPJC96Pc317634MFGuw1Ms77T8RB2F0SKvtCUMkUZmEgT0ZURRX
	AuRUTQniqTYv2HJe6ejRhyXXO0mYp1BewtnnPkVU99miWFUPV1fiKcCqhn8DfDD/7gMJtM5LxKSuJ
	7KbGzctj00sZKHxw5pknDwTxL40Ymd+d6JmXVk9+biKctopvNkhgsi8yxrA/1cFaqTX+l+9TW3Waa
	7pZoZfqo4kHTwiTSjjHzqadkGbR67Yl4q7/7piwmJnR0gOlMg5K+TRvTO/j8jPFoLEvwxNi3LqJtp
	tt6vrd453qYB9983Tlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYd86-00000001M3i-19E4;
	Mon, 07 Jul 2025 04:06:58 +0000
Received: from sg-3-19.ptr.tlmpb.com ([101.45.255.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYd83-00000001M2k-2NpT
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 04:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1751861207;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=iWMiLtGM2M9N3Qy5qdoVvMFI8rSYaoOq+MdfZfHPcnI=;
 b=KEyFCThkMV6lpQ0WPgt6TLuoWowshPzUU+KBPLF1rqHqOgntfMqgd1U4AemCDB7cJqC8re
 c3sq4Aekc1Vs9HVjLkPBxkOKwYpegjhjngZzopsA9n018Fb8oj9foA9ZwhixrY2Q+lXWc5
 vBgKV7491bE/4ND6MQwGcYjY7Y+a71hsE/HFPFlaRLprYdb0CPUSRhcvHKiIlN77/jqaMm
 LMe8QGcLMKPwXlsi7XFzcGT4Utg4OiQKOJv3wHCLzjObrd6unGT/kkzpS5JplQSdZaVusj
 TTiXITfKlOJtybgXFdEGjbPUSe9j0xnv6HAjUNSbotzSK9X14WrZVp0VuYjbtQ==
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Disable vstimecmp before exiting to user-space
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+2686b47d5+13a932+lists.infradead.org+liujingqi@lanxincomputing.com>
References: <20250707035345.17494-1-apatel@ventanamicro.com> <20250707035345.17494-2-apatel@ventanamicro.com>
In-Reply-To: <20250707035345.17494-2-apatel@ventanamicro.com>
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Message-Id: <87e96caa-9df6-482c-a0f4-74a97e7ccb5c@lanxincomputing.com>
Content-Language: en-US
Mime-Version: 1.0
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Date: Mon, 7 Jul 2025 12:06:41 +0800
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Mon, 07 Jul 2025 12:06:43 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_210655_945787_1589F83A 
X-CRM114-Status: GOOD (  15.75  )
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

On 7/7/2025 11:53 AM, Anup Patel wrote:
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
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Tested-by: Atish Patra <atishp@rivosinc.com>
> Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
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

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
