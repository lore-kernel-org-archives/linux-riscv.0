Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8733CE7A89
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dhW330Cc2wVNX/MgMWJAiT/wbWFClSkNO86pokwvPo=; b=kZ+piToPitIFxr
	YvF0k9DKSpj3EEqrMMeEaf4fCtNZ+SG2/HE9jyZ0H2w1BCnaSKRuVWQpn4eXuFfToTLaGNBH9gjJZ
	Nqyw5M6nN8aXE26PchHKfrRL3LcuYZyx5s8322WeUcyI9SqU9PmlCpQ8XY03k/zfTltp2RvQ00KHg
	kuFkLqMZ9LY4K5HRfyGdfF4IhLT3VSKeb2w0f1GCvWpPo9N19EVCEXPfSoonWsw0frSqHr3wnk4rS
	HpmOrZJ+u2QwKhbaknpnPTTtlJSIWeurFQzB+cVIkGIXiCfrCW2UPNsYA7kV4wqTg5IKnjspS6fn0
	8rUxavq0wFbKZQSVz1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkgBG-00DdPu-0L;
	Mon, 25 Sep 2023 07:38:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkgBE-00DdPP-0M
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 07:38:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c465d59719so37261825ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695627533; x=1696232333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yzBL5mZPrug4GhJrNNKgL7YDgX4E0xGifdCmz+2VKp8=;
        b=jQbQtdk8JID1gqyw8OfJ8dcTpaAuELMiHAofo5FAmr5Ec8HR8e37MIFyA44rx9in4O
         igrKs8dCjqge9E5z0N7zdCLfyDkwKw/8CKGRL2eFRiko9hKkpJhRRmx5ei3y/5ijhB/f
         n7TBr3n/Tid7zwb/hGclB4nvhKfH8kyFgrJD4f/j4q2ftyAH+n1n5E6PG9aHSIzZKCia
         j/bQeDX/8007OOii+Hme1BrKm7ikjyFSSFZ0zpMX3A83tcymtpnaanzkz/N2YRhZRS72
         /d6e1bjuW5vtMXZ6Xklgs9JIhfox8QzleZpAddQkEcCJT7cchZOBW0GAiXzwpVTpsPBA
         OHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627533; x=1696232333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzBL5mZPrug4GhJrNNKgL7YDgX4E0xGifdCmz+2VKp8=;
        b=SStV2StxCORZERKtMDkRsM4YeiujA/W5oZdecisxfvX2mBrxUskMbZla3cCer6a5bp
         EW4MlfpNvxfyZxYow/Aya+29n/TprN32IAcyWxqFC0DowHaNOiXZGv6hf7dYtq8m3t3p
         1MxhcHgL7efoHmU7V8ieGEDEmgL9ODsIIsXbmmeE0+UyxVL65cul3NjVYgbr7a0z9R2n
         ap2M742qdzhpJNr6wubmyNSZCF1mdfmaQ3PKxvX28efOhohQP7P614eXP5kT7+77KkBr
         72K8+SjM7TPyZQrjXR/GrX9I5VMll7RwPXqmIR+WPJrIWpA9FQ6OUOQmhJVqXwaVfZFf
         3VoQ==
X-Gm-Message-State: AOJu0YzKBu0aTnMyvQzr7Bwh9zD6C1l3Q+swYijpxaWUjB/uYjD2N66L
	XZasXjJTKPxnVuKDbQE3LAdx1MsfYJgvsT0nfaY=
X-Google-Smtp-Source: AGHT+IHJ7dbhK17CN5P+md1/ZCDciKvs4jN5yIcS41PAcRp+Dau+ypfkJZZlHYzyA7civShES5H6iQ==
X-Received: by 2002:a17:902:7443:b0:1bb:b86e:8d60 with SMTP id e3-20020a170902744300b001bbb86e8d60mr3963012plt.46.1695627533576;
        Mon, 25 Sep 2023 00:38:53 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.42])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902d18100b001b8b1f6619asm8169366plb.75.2023.09.25.00.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 00:38:53 -0700 (PDT)
Date: Mon, 25 Sep 2023 13:08:43 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 02/16] RISC-V: Add riscv_get_intc_hartid() function
Message-ID: <ZRE5A5GxF7wU68vt@sunil-laptop>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
 <20230912174928.528414-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912174928.528414-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_003856_151773_E411BD40 
X-CRM114-Status: GOOD (  25.95  )
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

Hi Anup,

On Tue, Sep 12, 2023 at 11:19:14PM +0530, Anup Patel wrote:
> We add a common riscv_get_intc_hartid() which help device drivers to
> get hartid of the HART associated with a INTC (i.e. local interrupt
> controller) fwnode. This new function is more generic compared to
> the existing riscv_of_parent_hartid() function hence we also replace
> use of riscv_of_parent_hartid() with riscv_get_intc_hartid().
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/processor.h |  4 +++-
>  arch/riscv/kernel/cpu.c            | 13 ++++++++++++-
>  drivers/irqchip/irq-riscv-intc.c   |  2 +-
>  drivers/irqchip/irq-sifive-plic.c  |  3 ++-
>  4 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 3e23e1786d05..3ce64b3bea4e 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -119,7 +119,9 @@ static inline void wait_for_interrupt(void)
>  struct device_node;
>  int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
>  int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
> -int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
> +
> +struct fwnode_handle;
> +int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid);
>  
>  extern void riscv_fill_hwcap(void);
>  extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 157ace8b262c..ee583eac3c5b 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -123,7 +123,8 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
>   * To achieve this, we walk up the DT tree until we find an active
>   * RISC-V core (HART) node and extract the cpuid from it.
>   */
> -int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
> +static int riscv_of_parent_hartid(struct device_node *node,
> +				  unsigned long *hartid)
>  {
>  	for (; node; node = node->parent) {
>  		if (of_device_is_compatible(node, "riscv")) {
> @@ -139,6 +140,16 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
>  	return -1;
>  }
>  
> +/* Find hart ID of the INTC fwnode. */
> +int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid)
> +{
> +	/* Extend this function ACPI in the future. */

As per Marc's feedback, we can't use swnode for ACPI irchips. So, there
is no need to create this wrapper function and this patch can be
dropped.

Thanks,
Sunil

> +	if (!is_of_node(node))
> +		return -ENODEV;
> +
> +	return riscv_of_parent_hartid(to_of_node(node), hartid);
> +}
> +
>  DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  
>  unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 4adeee1bc391..65f4a2afb381 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -143,7 +143,7 @@ static int __init riscv_intc_init(struct device_node *node,
>  	int rc;
>  	unsigned long hartid;
>  
> -	rc = riscv_of_parent_hartid(node, &hartid);
> +	rc = riscv_get_intc_hartid(of_fwnode_handle(node), &hartid);
>  	if (rc < 0) {
>  		pr_warn("unable to find hart id for %pOF\n", node);
>  		return 0;
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index e1484905b7bd..56b0544b1f27 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -477,7 +477,8 @@ static int __init __plic_init(struct device_node *node,
>  			continue;
>  		}
>  
> -		error = riscv_of_parent_hartid(parent.np, &hartid);
> +		error = riscv_get_intc_hartid(of_fwnode_handle(parent.np),
> +					      &hartid);
>  		if (error < 0) {
>  			pr_warn("failed to parse hart ID for context %d.\n", i);
>  			continue;
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
