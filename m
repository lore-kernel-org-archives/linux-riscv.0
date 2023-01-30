Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D02C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 23:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88poSDcNhY90ZtXq40EsNnTh0iRedA1vthNISJZHN4o=; b=TeSflKrtz2hm6Q
	wbo/xVmrkjRni6hxFj0VNPShsRptVdRQcqS4g4on2qMmMKLbC8ymoeenWv7at/uF2iNJ0dtazsYzV
	3TBbqMPckXmAlkWhY9K29R0J+fZICqGsebddVHkYRAJ1mqg8QNoKzIHV5RMbvblPXpnv2fKI/Ft3C
	hKi6NOgmGsetNaX+e5bCckjGzQUZZVIR8+famVpN7QtOsls3sr23jxGzLWA/IS7HMB06C6gCrV/lY
	XhFI06/qL3uRm0GLp9tEMC5UqpScqlKtnI7nzlfkdU/HwBljpNo90wPwg/DqCqkDd28sgm4npu6Mu
	PYK8ehzdZ7UQPUOqakdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdjj-005nb8-E0; Mon, 30 Jan 2023 23:38:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdjg-005nac-59
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 23:38:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m7so12714541wru.8
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 15:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0D2OAkoPSuqGKjYfRL/XBDXMIK40xEQA3Iqq9uVH7g=;
        b=WNM+LzlDInSIM5aAM0uVfSzBnlnhI/kYDKYv5CNfmyIolHk9byTBwn8hNONJ458Cay
         bZ9Jh/qgcbj8wXhylJWvOFPtm06jFcgcdKZktxHVThzvXSr6mMLV3vk5Xt3p9C20khjb
         KUS/jzF3LNa/VAZMBQWpJBNOPWQYqdXyzPmzEivpTUaKthQkq4Zv6vN3gKjC30bAId0e
         q+YN1i3wGluxuqNaCbYHi2JLfL0Oju/PdPt0vbeRiJYdkTgB1qvRK+BwBee/O2HcAFTr
         u3wqgWnn6DVfyIuCib0tK2Cs56yqZYtBKsBSODr4CKIDAb6TxrLnWo6+oxDGlKIl1Rcm
         DaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0D2OAkoPSuqGKjYfRL/XBDXMIK40xEQA3Iqq9uVH7g=;
        b=Z5KzWXFzpeLyVXmKJpLT31+DGXZ1LUYbMTmRO/+eNSirn4VK1mS7Xhd8R2/wF32/Ch
         EGEZRLGAmiGRXPn8GNHJOQn74NOavgCya++8jGShiO+5PDcSToxMH14dG+Jzr4MhsUGb
         rd5OglccbPViSIY64aeygG5qrh0HYDP20CETEbU8QMYRSqW9cwiY+0PHdLKCJ2mdl0fS
         0rSVLAz1wFSz/YZ4u0XX4odg6EcGDfvVtm8g+LAJmMXVtq5Ce4QcCsERFTOt/TRk/THZ
         ZRQ1ClXZ4ALPP8+t602eISAZcEvP7SKRNv8vnMOY5mxLeFVREdqRK4PLM9GIdtarqneX
         ewlg==
X-Gm-Message-State: AO0yUKWPbTLgsnFO820RRAtOhj45zrqKdUF6HNXWjEyzZWDHIjSdd32k
	FWZAH80S6n+/mhB5b0OQcSUH3MmNV3k3uWzLV0lRiA==
X-Google-Smtp-Source: AK7set+th+iU4+VT+YyfX3TofjLEq/2pqNCe2nCL1a5FI7ePffNwYAI1KUnTm18azN07is2Is689Tg==
X-Received: by 2002:adf:e702:0:b0:2bf:b765:7a13 with SMTP id c2-20020adfe702000000b002bfb7657a13mr1001880wrm.5.1675121930175;
        Mon, 30 Jan 2023 15:38:50 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id o6-20020adfe806000000b002bdf8dd6a8bsm12909713wrm.80.2023.01.30.15.38.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jan 2023 15:38:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 11/24] RISC-V: ACPI: irqchip/riscv-intc: Add ACPI support
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230130182225.2471414-12-sunilvl@ventanamicro.com>
Date: Mon, 30 Jan 2023 23:38:49 +0000
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Anup Patel <apatel@ventanamicro.com>,
 linux-doc@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-acpi@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
Message-Id: <AFDD5897-27A3-4418-B08B-9650B543692D@jrtc27.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-12-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_153852_277676_908B562D 
X-CRM114-Status: GOOD (  26.09  )
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

On 30 Jan 2023, at 18:22, Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> Add support for initializing the RISC-V INTC driver on ACPI based
> platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
> drivers/irqchip/irq-riscv-intc.c | 79 +++++++++++++++++++++++++++-----
> 1 file changed, 67 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index f229e3e66387..044ec92fcba7 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -6,6 +6,7 @@
>  */
> 
> #define pr_fmt(fmt) "riscv-intc: " fmt
> +#include <linux/acpi.h>
> #include <linux/atomic.h>
> #include <linux/bits.h>
> #include <linux/cpu.h>
> @@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
> 	return intc_domain->fwnode;
> }
> 
> +static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> +{
> +	int rc;
> +
> +	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> +					       &riscv_intc_domain_ops, NULL);
> +	if (!intc_domain) {
> +		pr_err("unable to add IRQ domain\n");
> +		return -ENXIO;
> +	}
> +
> +	rc = set_handle_irq(&riscv_intc_irq);
> +	if (rc) {
> +		pr_err("failed to set irq handler\n");
> +		return rc;
> +	}
> +
> +	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> +
> +	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> +
> +	return 0;
> +}
> +
> static int __init riscv_intc_init(struct device_node *node,
> 				  struct device_node *parent)
> {
> @@ -133,24 +158,54 @@ static int __init riscv_intc_init(struct device_node *node,
> 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
> 		return 0;
> 
> -	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> -					    &riscv_intc_domain_ops, NULL);
> -	if (!intc_domain) {
> -		pr_err("unable to add IRQ domain\n");
> -		return -ENXIO;
> -	}
> -
> -	rc = set_handle_irq(&riscv_intc_irq);
> +	rc = riscv_intc_init_common(of_node_to_fwnode(node));
> 	if (rc) {
> -		pr_err("failed to set irq handler\n");
> +		pr_err("failed to initialize INTC\n");
> 		return rc;
> 	}
> 
> -	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> +	return 0;
> +}
> 
> -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> +IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> +
> +#ifdef CONFIG_ACPI
> +
> +static int __init
> +riscv_intc_acpi_init(union acpi_subtable_headers *header,
> +		     const unsigned long end)
> +{
> +	int rc;
> +	struct fwnode_handle *fn;
> +	struct acpi_madt_rintc *rintc;
> +
> +	rintc = (struct acpi_madt_rintc *)header;
> +
> +	/*
> +	 * The ACPI MADT will have one INTC for each CPU (or HART)
> +	 * so riscv_intc_acpi_init() function will be called once
> +	 * for each INTC. We only need to do INTC initialization
> +	 * for the INTC belonging to the boot CPU (or boot HART).
> +	 */
> +	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
> +		return 0;

Why are we carrying forward this mess to ACPI? The DT bindings are
awful and a complete pain to deal with, as evidenced by how both Linux
and FreeBSD have to go out of their way to do special things to only
look at one of the many copies of the same thing.

Jess

> +
> +	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
> +	WARN_ON(fn == NULL);
> +	if (!fn) {
> +		pr_err("unable to allocate INTC FW node\n");
> +		return -1;
> +	}
> +
> +	rc = riscv_intc_init_common(fn);
> +	if (rc) {
> +		pr_err("failed to initialize INTC\n");
> +		return rc;
> +	}
> 
> 	return 0;
> }
> 
> -IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> +IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC,
> +		     NULL, 1, riscv_intc_acpi_init);
> +#endif
> -- 
> 2.38.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
