Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B76C71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 23:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6/hRIIaJ7ZJaTIY09ghGZZn2WeHixb95UA8C+ILZB4=; b=GnJEtWXg8t8HxRHOv64knnmFG0
	MGBJjE8cdVPoKijek6H+Dxl5zmUe+ESeDLEdE2HCVzV9IV4lgu5+GjhBOpN7EFiCq20ixLvrlaCji
	U5nJCcBYNTQBDzuimwr1ySUU/kipMduakZUqAML0P3GkA1/MYSyDjeRFYFlT/d4ixUO1B/7Qpcgzy
	1k6xC25qUiC9tQritJ6KoSoz0EPwGHiytW+O2GBkSApQk8rwhekX6YbDhM56ko7+xmFf7DhZWE6FO
	mSq/I8IfncPPE/id0/p3IjFJRXkNw0+OyIFbZTFShzpndcdFu5B1rc5W/yylga2JQrMXDQnAPQjdn
	kJFCzPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQDW6-00000000HnO-1KLK;
	Fri, 13 Jun 2025 23:08:58 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQDW3-00000000Hmq-2zeL
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 23:08:57 +0000
Message-ID: <d81310a9-13e8-47b4-8ad7-0f831b5aa9e8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749856132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJbziJaWkSfc7eJvEsy2hlaI0p2HI21DTada3PKoxUM=;
	b=aQ1pcHAcIgb+M7oyofZrcUYV81nmfElqYYBX1DAhtW9V54Yr88+Yhs7YcUiry1UklyWuqQ
	+taC5FOziFa5Nx4TfwAw/I3w2tfc4PTs/ZSHAv1Z99DqUH/W1Pr+uCbTjuMl9okwVnfz8V
	AP9OFxZRVrSK850RcsZtk0peexbIXTE=
Date: Fri, 13 Jun 2025 16:08:32 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v5 15/23] ACPI: scan: Update honor list for RPMI System
 MSI
To: Anup Patel <apatel@ventanamicro.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-16-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250611062238.636753-16-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_160855_893831_804EEB16 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 6/10/25 11:22 PM, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
>
> The RPMI System MSI interrupt controller (just like PLIC and APLIC)
> needs to probed prior to devices like GED which use interrupts provided
> by it. Also, it has dependency on the SBI MPXY mailbox device.
>
> Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
> list so that those dependencies are handled.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   drivers/acpi/scan.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index fb1fe9f3b1a3..54181b03b345 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
>   	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
>   	"RSCV0001", /* RISC-V PLIC */
>   	"RSCV0002", /* RISC-V APLIC */
> +	"RSCV0005", /* RISC-V SBI MPXY MBOX */
> +	"RSCV0006", /* RISC-V RPMI SYSMSI */
>   	"PNP0C0F",  /* PCI Link Device */
>   	NULL
>   };
Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
