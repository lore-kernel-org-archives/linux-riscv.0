Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C04CF8863
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgmzqm3eYTtJxVVMjwCRGz4kS90yZ75mGkCXJRg2ESQ=; b=x6POHfA3lOrEfJ
	eupVW3HT5mL8Idt/vw4YRGcGfWO6E8LwoC9EHJHjOV3HZ93pKbYtJZGkt08BWAlpGQ2gDZTSIQl1Q
	Xb+K0n9dXYHTT3GwU/bjYNg82+y5QfDjAMdK6t4nRG/6xrHyOF3MTPKtjhfL5bdZ8wI7YFQ+ajsSV
	LvSR4ziWrMmDr7zu9iwN5+b6pNpEikQsgwbLTOQCrK2ksn7xfYOO8kDpcEmvsD0vPCEcECdOkhJaA
	+c2b5sPyWCnGgJTJ647LFG2vbnBoc9HbFDo6UpqQ9C5k8cqLDVUCztOcvBQBFzx3FbzIvR6hjGP3p
	IElaMFu51N9jlaShbQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5vH-00000006sBK-1nLz;
	Thu, 20 Nov 2025 14:46:11 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5vC-00000006s9m-2VWT;
	Thu, 20 Nov 2025 14:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ck
	2LXnallF0o14E7324Drq0pinMWebr/hckuV1kG/zs=; b=MqFEMG7/RTC91gTVjA
	Dl4seBQ5Ws9MA7NAK4hlamY5Giq8jh+/TF3J8WmSKhuZ8tk1a+IlK1RDurJ+uZPM
	kgvFUqGx0w7zxS5ndkD+1FMYtRC4hN/C5VB+agW7/Pb6BGuKee8NpGGOiaMprA+D
	EAG1GHJM+2YnUR8kFh6nfq+vw=
Received: from nilq-virtual-machine.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3t8f_KB9pu1X7AA--.141S2;
	Thu, 20 Nov 2025 22:43:12 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: apatel@ventanamicro.com
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for direct-mode
Date: Thu, 20 Nov 2025 22:43:11 +0800
Message-Id: <20251120144311.5083-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307140307.646078-7-apatel@ventanamicro.com>
References: <20240307140307.646078-7-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3t8f_KB9pu1X7AA--.141S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47XFyrJw47tw1Dtw4DCFg_yoW8ZF1DpF
	4Dt34Iya9rGF1ag3ZrGa1kAFy7C395Cayayr1DJ34a9wn8uFyqva1Iy3909ry5Jr4rAr1a
	qrWjyF9rCan8ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjbyZUUUUU=
X-Originating-IP: [111.162.114.251]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbiTwgM5WkfG4PySQAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_064607_054630_EF5F649F 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, maz@kernel.org, saravanak@google.com, anup@brainfault.org, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, ni.liqiang@zte.com.cn, bjorn@kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, hu.yuye@zte.com.cn, krzysztof.kozlowski+dt@linaro.org, atishp@atishpatra.org, deng.weixian@zte.com.cn, linux-riscv@lists.infradead.org, frowand.list@gmail.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
> +static const struct of_device_id aplic_match[] = {
> + { .compatible = "riscv,aplic" },
> + {}
> +};
> +
> +static struct platform_driver aplic_driver = {
> + .driver = {
> +  .name  = "riscv-aplic",
> +  .of_match_table = aplic_match,
> + },
> + .probe = aplic_probe,
> +};
> +builtin_platform_driver(aplic_driver);

Dear Anup Patel and all concerned,

I am writing to inquire about the historical rationale behind defining the APLIC driver's
initialization priority using builtin_platform_driver in the current implementation.

In our environment, we are encountering an issue where this priority level causes ACPI-based PCIe
enumeration to be executed in the system_unbound_wq work queue. This parallel execution model
results in PCIe devices being enumerated in an arbitrary order rather than strictly following the
sequence defined in the ACPI DSDT table.

The random enumeration order is adversely affecting customer experience, particularly in scenarios
where device ordering is critical for proper system operation or application compatibility.

We are considering modifying the APLIC driver's initialization priority to ensure PCIe enumeration
occurs sequentially according to the DSDT specification. However, before proceeding with such
changes, we wanted to consult with you regarding:

1. Were there specific technical considerations that led to the current priority selection?
2. Are there any potential side effects or broader impacts that we might have overlooked?
3. Would you support such a priority adjustment, or do you have alternative suggestions to 
address the enumeration order issue?

We greatly appreciate your insights and expertise on this matter, as it will help us make an
informed decision while maintaining system stability and compatibility.

Thank you for your time and consideration.

Best regards,
Liqiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
