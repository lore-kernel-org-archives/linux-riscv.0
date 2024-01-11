Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EDBC4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihM5ok4Dxaco0TpAkt46YFcnDV7lh4F/Dbu3ixn/6jw=; b=OPEsI4gDCXJ9N0
	fvXfCq5oh+BTls365ViwMWnVE7U1usSfXfLE99bcz+kWZ/ghaz3Y/40p6SbOZzKVrYlX/zdmgkOA7
	/+vC/PWX+KlZHPJhL0dG0ZHI0mz79z+R5y17clSxbrRJkkQ+B4BGv9WCze50qcT90h1+oK4nyEH3X
	dM9EWHEEjCPlXUz+pMebsga+3ovSUBcRAQAuucouhJBvKM8dOFND8hOsDBA1Uzw3qvw4+3NXfUZJZ
	7WL3wtvvCVGZ+Dwrlzx7PzZhSPfsLdB30sP3w0YNF4Nc0SSAo8ClkXwp0OG3E6qWBLpdBtpWa97lz
	eISilXz1raKNkw3qD9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtys-0000BR-2j;
	Thu, 11 Jan 2024 12:16:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtyp-0000AQ-0a
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 12:16:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B642F4;
	Thu, 11 Jan 2024 04:16:56 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02E653F64C;
	Thu, 11 Jan 2024 04:16:08 -0800 (PST)
Date: Thu, 11 Jan 2024 12:16:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH -next 1/2] ACPI: Enable ACPI_PROCESSOR for RISC-V
Message-ID: <ZZ_cBlOSW9VCjkOv@bogus>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
 <20240111093058.121838-2-sunilvl@ventanamicro.com>
 <20240111-bb411d2dd39eb859dd049fa0@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111-bb411d2dd39eb859dd049fa0@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_041615_290310_ED55851D 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 11, 2024 at 11:00:12AM +0100, Andrew Jones wrote:

[...]

> Also, interestingly, it looks like this ancient line
>
>  obj-$(CONFIG_ACPI_PROCESSOR)    += processor.o
>
> in drivers/acpi/Makefile should be removed,

No

> since there's no drivers/acpi/processor.c file.

Correct, but ..

> I guess the make process silently filters object files which don't have
> corresponding source files?

May be, but I doubt if that is the case here.

processor.o is just aggregation of all processor_*.o and this will be
the processor.ko when built as a module.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
