Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB5C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 21:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OukZb0WMyNIYhNnt1P1zWKTmyvQBWYJAVYMDEXhom90=; b=wiAXtK91h5Z2q+
	0wB0VXFF8htSK5K1JwjLA7DUrarXaV9LCETwQLmLvJ76vDIawVrxatueTByIxJKoWf5Bg3Ssy5vsE
	uPsbtaD4Nve1ygeym0y8MMdezm2pt6XX52y0jkNY9223P+pe03NMWrsiqtT6K+xu4+gl7T1dgsRKD
	EBqLjA5gscpCu3A88QMZUwJmOkw37HmBIhEG+NDaRyfJ8HJYC7I8+U9pgRdBkuqxjMcGw5Hup4oI1
	ZGYQDSQxqSpoWHTV6xtQY8mkxoeUH3njzacf6De1dkGkB+aZ5GUC7OqR0UmVmlosnbSj+iJzFtQeF
	az4pwJ1gx3WvaKIDw05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGSv-00000007QF5-1Qtt;
	Thu, 23 May 2024 21:59:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGSr-00000007QES-2xs5;
	Thu, 23 May 2024 21:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E887CE1788;
	Thu, 23 May 2024 21:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346A9C2BD10;
	Thu, 23 May 2024 21:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716501545;
	bh=QZ7Ne6Y6VxRzARq/sM9xQGLKOxgu4KxELYwAPQWlY/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rlf+g2x0my/tsSc572EXkgu9g5zzNMzCe1Um7GaPWPhja1AdmVcvHfJ5JFWWXo5Kl
	 DyCOt/h5cmh09lihD9eOwLfZtmJX08u9JSM6g8APDYjLueOGZIH7LkztD0Y3K/QX/O
	 otr708MxWtJNd4mrV0gKGNxLgtB8nAEWdACtUFkQ/3Lltvl88JxF0vSAYYCBVDrsk/
	 7bmzPYpBa/kaRVXRoiGWS7wOjysFJQh1z4WOCmjhJ8ymFqfWDb7mN6lYnhRPf4FJYG
	 lnhd4c/KRzpPVGeZscRsYjWLBTRznptGmkCQQQgislE8Vk0xUyGRjZ2LnxSs2acNAm
	 4Fm9PNLsPbUig==
Date: Thu, 23 May 2024 16:59:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 07/17] ACPI: bus: Add RINTC IRQ model for RISC-V
Message-ID: <20240523215903.GA138985@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-8-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_145909_956952_F646552D 
X-CRM114-Status: GOOD (  16.18  )
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

On Wed, May 01, 2024 at 05:47:32PM +0530, Sunil V L wrote:
> Add the IRQ model for RISC-V INTC so that acpi_set_irq_model can use this
> for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/bus.c   | 3 +++
>  include/linux/acpi.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 17ee483c3bf4..6739db258a95 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -1190,6 +1190,9 @@ static int __init acpi_bus_init_irq(void)
>  	case ACPI_IRQ_MODEL_LPIC:
>  		message = "LPIC";
>  		break;
> +	case ACPI_IRQ_MODEL_RINTC:
> +		message = "RINTC";
> +		break;
>  	default:
>  		pr_info("Unknown interrupt routing model\n");
>  		return -ENODEV;
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 846a4001b5e0..c1a01fd02873 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -107,6 +107,7 @@ enum acpi_irq_model_id {
>  	ACPI_IRQ_MODEL_PLATFORM,
>  	ACPI_IRQ_MODEL_GIC,
>  	ACPI_IRQ_MODEL_LPIC,
> +	ACPI_IRQ_MODEL_RINTC,

Is the ACPI_IRQ_MODEL_RINTC value documented somewhere?  Maybe an ECR
for the ACPI spec?

acpi_bus_init_irq() is going to pass ACPI_IRQ_MODEL_RINTC to _PIC, and
ACPI r6.5, sec 5.8.1 only mentions the ACPI_IRQ_MODEL_PIC,
ACPI_IRQ_MODEL_IOAPIC, and ACPI_IRQ_MODEL_IOSAPIC values.

Even the existing ACPI_IRQ_MODEL_PLATFORM, ACPI_IRQ_MODEL_GIC, and
ACPI_IRQ_MODEL_LPIC values aren't mentioned in ACPI r6.5.

>  	ACPI_IRQ_MODEL_COUNT
>  };
>  
> -- 
> 2.40.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
