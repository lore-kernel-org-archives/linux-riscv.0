Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAFDC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=409aqnrmRszUBjUSEIrd1/ieUoEWmfook5MyYd7YzhU=; b=bsT6HxTo0X8LuY
	K7Fi+S0l/npsY1Kx7YF4KhQTi8/moSWpH+LWItWvAqBqHBA02aYPr3V+k+YNuIt5QHgM8dLg2AIbM
	aUZkkcqkh0EK0ZYnYgC6ZETf2azj+8yCNBRyq1vQfRWPHfO4C4TXscXTP+XPPwvTtFMy/ajjkh8HL
	JF+70BWdW3joOXqJRn2l/ArhOjbWsEosGxwZQnpW+B6QtHEPrmOD5s3d6aSWaDTm1cbk91U+HhkGV
	/MOW6/4Hl7zf4OWkVQhAJ4lqPHob4lBzqNIyQ5tt3n5dNfHOzrkPvbAGg6b8gWvu8+slLcY6TGaLF
	c15E13Hdr8qPdA8+cTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYOn6-0000000GoWR-0wjQ;
	Fri, 09 Feb 2024 11:11:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYOn3-0000000GoUb-2IO9
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 11:11:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F22DFEC;
	Fri,  9 Feb 2024 03:12:04 -0800 (PST)
Received: from [10.57.47.170] (unknown [10.57.47.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCA853F8A4;
	Fri,  9 Feb 2024 03:11:18 -0800 (PST)
Message-ID: <72ef475f-513b-4e33-ae85-f7e693a0cd38@arm.com>
Date: Fri, 9 Feb 2024 12:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>,
 Len Brown <lenb@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20240208034414.22579-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_031129_684675_FDEC62FA 
X-CRM114-Status: UNSURE (   9.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The code looks good to me, so FWIW:
Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>

+Sudeep as this touches cppc/arm in case he didn't see the patches

On 2/8/24 04:44, Sunil V L wrote:
> This series enables the support for "Collaborative Processor Performance
> Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> encoding of CPPC registers as defined in RISC-V FFH spec [2].
> 
> CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> enable this, is available at [2].
> 
> [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> 
> The series is based on the LPI support series.
> Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)
> 
> Sunil V L (3):
>    ACPI: RISC-V: Add CPPC driver
>    cpufreq: Move CPPC configs to common Kconfig and add RISC-V
>    RISC-V: defconfig: Enable CONFIG_ACPI_CPPC_CPUFREQ
> 
>   arch/riscv/configs/defconfig |   1 +
>   drivers/acpi/riscv/Makefile  |   1 +
>   drivers/acpi/riscv/cppc.c    | 157 +++++++++++++++++++++++++++++++++++
>   drivers/cpufreq/Kconfig      |  29 +++++++
>   drivers/cpufreq/Kconfig.arm  |  26 ------
>   5 files changed, 188 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/acpi/riscv/cppc.c
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
