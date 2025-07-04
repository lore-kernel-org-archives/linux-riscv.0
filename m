Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB4C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/DvAsx5/Ftp8Rg0aLzdxwj+KdHjm+kbEOmOfrRKP/U=; b=Xdh92WYzdVfb4X
	lLx1PCp3ThLTpfvCtOlfSVaYALlwc0/IDJ7zMyTzkWUPnJAnwuRaZpc7kOGBHkFSqtRbq2XbqZwEf
	9sQj3V+FHPzkmnMLx6+MlfgvzFlc8NmXMby0iayXs+SfYvIZq9k4J3jpGm6N+xNPoO4FjfBkJC3BF
	P/HSkX9eM44NjpJsNqYm7djjXvx8z5ehJI4mZp2DpZgFb4OY9KAbN/Pskh0pyGlzNvhPTIwCVvXIH
	8IDUv7bL8S2/S1BpqfD+WoGQxnlGpCDRcJjBylwZQPSRJKxnYu1fg6DgZ0op0UiPCxsyYwZfMQa9h
	gCO8xLT2roeBTilBpCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXmMl-0000000FNbl-38sY;
	Fri, 04 Jul 2025 19:46:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXmMh-0000000FNa0-24bI
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 19:46:33 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6F0E63F691
	for <linux-riscv@lists.infradead.org>; Fri,  4 Jul 2025 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751658385;
	bh=VLrA3L+1opa6K3kyWseF7FHmwqIbcBLyJ0FYSjgmPjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=gctRnhdVlghbB3tAhaQqyD2Jw04Dqq2Anf0FqhhTL2R0rE1kwIngEUNgE/nKR7Pfm
	 APUGCKEgnEGqVeuu70cHUDb4Zc8decN2mC4aHS1RGsnfcJq2nZJnN4B4Z2iKhsBnbp
	 OTQPaAUzfrC/irRNi3IXcmDqlTmylaEsl8hWlko53wdEUl9QFd8f9gaa/FvZIy9xcv
	 MIThSS7LrzFXQb9TT6qV3INxUx5JilHNq6zVgBEznctoncuUTR4MoMftckjo47IRPj
	 W22Hl75/OKogCHDIouz7w+GdrU7AHkSLsLyeTRKifbKCkX+NNyoupLt2gKz4Owrc9d
	 I78GwovhAlK6Q==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0b629918eso141868966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 12:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751658385; x=1752263185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLrA3L+1opa6K3kyWseF7FHmwqIbcBLyJ0FYSjgmPjU=;
        b=AHF7hXYgid7tm6qDyxeJlE88qkXMTOEnx7rt6LbJaQX/SbovPuriREI5VgKehFGCoQ
         5bZq+xtLGj+68xSZub2rWLdUB11sm+CxpZhG77iQA7wrOMVzoQuD3dXbQQikn6vKwWg3
         8OZiAhVuAaINTUK0ijdv1Ozt0uZEZY3PqxrTM/8sgzUH6s7STNmqFQPZm8ecOOxizBO1
         s7WKf9HtcSROsvNnvGQTDi6i30brkkKTU9y4HdDQFBdtK/nkymFwDo7x9dOjVBlaJb2G
         yELfZbKa7XCYhXLlsVf+4m/eoDZcj0mpDpicHCKd5p/IeQ5nJIo1FJkpbOmICcPyNPOI
         ry1w==
X-Forwarded-Encrypted: i=1; AJvYcCX6WrUXgVoCvQkZz4R5BYmuApwM6E21fF6tKRY1LAZbxJNU6L+gsZVxkqKJ9Rcg10Ay+1YnYLfFfThw3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZjyexdtJRcghXjF6ee5tZ18nvreVg/b+8tuZsJG1iwfcugTgS
	eI+WriwBo2ZQIIAg7KsH6RrG2BY1V3+DKi6FHtiIoC/EExvCfdzsqqjXeDXn00pvSCIK2A7mGCT
	ES8nL6TM+/a2R/pkFgfyz9hj3kTVlCVVeDMxQ6M5M+rNVKUfL1hgNF+1Vhi+EAydRUPj2C+RF54
	K4l5Ao4tvLIw==
X-Gm-Gg: ASbGncvNrMPcFMoJ0U39u99RJzmeE2j56hoNqHwe+VePxWYg6Eav+rFhPhMh7JLnHbY
	MBHtImjY5tmlpgVEWYBF4bp25qJbB5oMCof7E2f9Myx/20IeMfJv1SOsPIMLKPUiBntesQO80BD
	L3raB3tvEnbkcX6xR2YWPC8tWZeIe36Dnx42GVa7Jvw0KkWo6eLalhLfvKElta7ntUSi5mNDVyy
	CIkA01QJ01UOLw/EpO5e5+jNADOdJSEEkfylMwcNgGgjIut9BZENiYfmTioFIGNWQy5y70i2XXY
	mfxU05norJAOjSmdoJ+/Eoc4/CYD6oq4BuUYKmSvYI86GnM5pIOdt4yGPRmEDhQ8UOhp+a+B0qy
	69Iu/irlimDE=
X-Received: by 2002:a17:906:f5a7:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae3fe78fd44mr368752066b.57.1751658384971;
        Fri, 04 Jul 2025 12:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbsxPqPhYYSbtLZBKO2k3ZdPJhfdbdyy0/f6vKPhOggzCylZPnmMjp2Q8zbaJhX5YMtK8lng==
X-Received: by 2002:a17:906:f5a7:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae3fe78fd44mr368750466b.57.1751658384601;
        Fri, 04 Jul 2025 12:46:24 -0700 (PDT)
Received: from ?IPV6:2a02:3035:6e0:a37c:f324:1674:f46a:492? ([2a02:3035:6e0:a37c:f324:1674:f46a:492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5643sm221184466b.74.2025.07.04.12.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 12:46:23 -0700 (PDT)
Message-ID: <42c6f9d7-ac1a-4f74-8b0b-ac8fb02de0b0@canonical.com>
Date: Fri, 4 Jul 2025 21:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RISC-V: KVM: Disable vstimecmp before exiting to
 user-space
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
 <20250704153838.6575-2-apatel@ventanamicro.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250704153838.6575-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_124631_859790_FBA70EF2 
X-CRM114-Status: GOOD (  19.14  )
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

On 04.07.25 17:38, Anup Patel wrote:
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

Anup and Atish, thanks a lot for investigating.

I built upstream kernel 6.14.9 with the patches of this series and that 
resolved the problem reported in Launchpad bug report 2112578.

Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
