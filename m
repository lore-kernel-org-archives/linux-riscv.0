Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0C9FF60F4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ac3oI0yiR2M+pvm65BULFGU3+TFUahP4K2WFVXXjElI=; b=4AVi2ctMWYMkXW
	3pnac0pNV7zGtjYp7yZdm43b+0zpN/eplJ5gcUYhjYX10IA+N7l8NFUVSjI4f5EL2Y9HTAXbz8hds
	6u1f3J0vw7zVDANiGOimd92JIm4xp9kTnvBT9uO8z9dOyhREinv9q5wZHc2pkHqcwpxgp7yrFm/BR
	QLUAIMZ9xjnv/UL2YVqpPYowPiokKDQjjs8dio2EvX7r/ihaM4zkdcqB8gPSy/ZbwNoqI0i4GezNG
	FyYeKpCFuEKnNK8Dut9K0xgvSvb58MP/85Cw5tPOoxYaM1LEIv8THQzPgTL01aCrrp0U8zq963DCy
	wCpxKYpQzCoulZLu4ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cwO-0000000DLbR-0MPX;
	Tue, 31 Mar 2026 17:31:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cwL-0000000DLaG-29EB;
	Tue, 31 Mar 2026 17:31:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA1C1E5E;
	Tue, 31 Mar 2026 10:31:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDE373F915;
	Tue, 31 Mar 2026 10:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774978302; bh=3i1Gq4JAIizBknxjSLlecxNj8YdouZQOldf/Gi8SPcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDzivK/ay0BT4/Mfila47ssOCUKcoC8mcE1OJ3YzJDm9s79Zs686E4kzJf4HRuKB6
	 lpHJ/DyPCzQqdZR0SBq1PcmDDq9UF0avGeThJW47JsQ4fAL+D9oqkCMCvB+7zuGSCf
	 u5jO9aDk1QLnYCQi+3kmjhvfmGJUmFBpQyUk3kzE=
Date: Tue, 31 Mar 2026 18:31:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v10 0/8] ACPI: Unify CPU UID interface and fix ARM64 TPH
 steer-tag issue
Message-ID: <acwE9V-r63-W2wby@arm.com>
References: <20260320031737.35048-1-fengchengwen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320031737.35048-1-fengchengwen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_103145_754714_053A660F 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J . Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org, guohanjun@huawei.com, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Yanteng Si <si.yanteng@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 11:17:29AM +0800, Chengwen Feng wrote:
> This patchset unifies ACPI Processor UID retrieval across
> arm64/loongarch/riscv/x86 via acpi_get_cpu_uid() (with input validation)
> and fixes ARM64 CPU steer-tag retrieval failure in PCI/TPH:
> 
> 1-4: Add acpi_get_cpu_uid() for arm64/loongarch/riscv/x86 (update
>      respective users)
> 5: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
> 6: Clean up perf/arm_cspmu
> 7: Clean up ACPI/PPTT and remove unused get_acpi_id_for_cpu()
> 8: Pass ACPI Processor UID to Cache Locality _DSM
> 
> The interface refactor ensures consistent CPU UID retrieval across
> architectures (no functional changes for valid inputs) and provides the
> unified interface required for the ARM64 TPH fix.
> 
> ---
> Changes in v10:
> - Refine commit header&log according to Punit's and Bjorn's review
> - Split perf/arm_cspmu as a separate commit which address Punit's
>   review
> 
> Changes in v9:
> - Address Bjorn's review: split commits to each platform so that make
>   them easy to review
> 
> Changes in v8:
> - Moving arm64's get_cpu_for_acpi_id() to kernel/acpi.c which address
>   Jeremy's review
> 
> Chengwen Feng (8):
>   arm64: acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>   LoongArch: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>   RISC-V: ACPI: Add acpi_get_cpu_uid() for unified ACPI CPU UID
>     retrieval
>   x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>   ACPI: Centralize acpi_get_cpu_uid() declaration in
>     include/linux/acpi.h
>   perf: arm_cspmu: Switch to acpi_get_cpu_uid() from
>     get_acpi_id_for_cpu()
>   ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
>   PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM
> 
>  Documentation/PCI/tph.rst          |  4 +--
>  arch/arm64/include/asm/acpi.h      | 17 +---------
>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++

For the arm64 bits:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
