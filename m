Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEAAC5B543
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 00:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1fYMsSGUm82J1Pmv/rBa9tkeIOWgqXVrt6G9n/eW+U=; b=wF0hGgrPKLRO0C
	BrGvOc5eW/pUC58klLd4RnHOiYrp4G08KVfU6yFlzTaooRzPAeYUYujyISBIqo0Wk9+BSTm0HLzw6
	9eF0RSYMcCYGALerjTj6Ah6Z3jEoGB8caaWjqtHreqU5KK1TivSs0ybv+wW5ggQdorV7U//xPiX9a
	g+VbEvHo+aebh7+y3ht3ZZNRncIKdGyOE9mzX4cF1wjlKhLKMSSqCOu+o0H4OzE1L5i2+3eLTcuq+
	rtOotes5nOQRFRpKMGMludlqSXeaMl+etCKBHUCiUnneRRnc/WkMhZoGvJ/ACSb7fKJsL/z/Gi3cC
	iOl9TGIZcV6Ec1ZtZr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKl7-0000000Gpxf-1g5P;
	Fri, 06 Jun 2025 00:16:33 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKl4-0000000Gpx5-41Kd
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 00:16:32 +0000
Message-ID: <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749168988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+xPywf03yDNkYEegcXCgoSVQ8qSRx8kshKocy4LVVsM=;
	b=jOhpVxn4e1YZ6YRTUuacO44l3FJVVuTv6wv1IJDDzKnIXkBhX4W29RIyrnrXhS7TchjIa4
	gVVLMZ/Xjc1siqRtZxtV1k4yYPl5YHtL+DRDh0PkDHHJNiZNKEc1IiTlyNYL+OepkPTaOK
	g/0I8UWEEhM6ek3EHxaksSLp6Vo375I=
Date: Thu, 5 Jun 2025 17:16:22 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] RISC-V: KVM: Check
 kvm_riscv_vcpu_alloc_vector_context() return value
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-4-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250605061458.196003-4-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_171631_150985_5B6C4CF2 
X-CRM114-Status: GOOD (  13.31  )
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


On 6/4/25 11:14 PM, Anup Patel wrote:
> The kvm_riscv_vcpu_alloc_vector_context() does return an error code
> upon failure so don't ignore this in kvm_arch_vcpu_create().

currently, kvm_riscv_vcpu_alloc_vector_context returns -ENOMEM only.

Do you have some plans to return different errors in the future ?

Otherwise, the code remains same before and after.

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e0a01af426ff..6a1914b21ec3 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -148,8 +148,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   
>   	spin_lock_init(&vcpu->arch.reset_state.lock);
>   
> -	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
> -		return -ENOMEM;
> +	/* Setup VCPU vector context */
The function name is pretty self explanatory. So no need of this comment ?
> +	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
> +	if (rc)
> +		return rc;
>   
>   	/* Setup VCPU timer */
>   	kvm_riscv_vcpu_timer_init(vcpu);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
