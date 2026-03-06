Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05ACF0181D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpJ0W+Pl8xl+8TtUPJJzmTZ/47NiLVsR6zHeVf1QeFU=; b=bMp/p8akan06+n
	D2tyxke0gZH3y6GEUuvOhVllgW2XB50MekWq3KnbpQHPwngb26N5JRRIs3D3GHXekMmjUsVTZXHZH
	SJWTEO2npSWv66L2zu5NGX9dWU6bn9FOSMBsASC5jKrP62reI7Df+r/LN6sW89Ju9lWvZ5zsOXh8m
	zrwys+7t5n9ju6zA0WDOxWlKvLfyNQhKYR4T9iMlDpqaQgfNcuRyjEgNdyk9G7nEDHbO6njXHN/1s
	6+hfIH5tkMoz9HCBAHmagwPOp9bBb+ccNx76OLlEnTIAItXyzFZGnfytsXaQg3//kRMs0O5D9y5SL
	ty5pgxWEg+ykxbpJVxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS0x-00000003P9D-3mjZ;
	Fri, 06 Mar 2026 10:02:36 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS0u-00000003P8c-1cgK;
	Fri, 06 Mar 2026 10:02:34 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fS2454tK9zHnH5p;
	Fri,  6 Mar 2026 18:01:25 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 214B440086;
	Fri,  6 Mar 2026 18:02:25 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Mar
 2026 10:02:23 +0000
Date: Fri, 6 Mar 2026 10:01:50 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v3] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
Message-ID: <20260306100150.00003f38@huawei.com>
In-Reply-To: <20260306021920.23233-1-fengchengwen@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
	<20260306021920.23233-1-fengchengwen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_020232_759509_EEEEAAF7 
X-CRM114-Status: GOOD (  22.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric Van Tassell <Eric.VanTassell@amd.com>, Somnath Kotur <somnath.kotur@broadcom.com>, jeremy.linton@arm.com, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, wangliupu@loongson.cn, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Wei Huang <wei.huang2@amd.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, bhelgaas@google.com, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, sunilvl@oss.qualcomm.com, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, chenhuacai@loongson.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 6 Mar 2026 10:19:17 +0800
Chengwen Feng <fengchengwen@huawei.com> wrote:

> Currently the pcie_tph_get_cpu_st() has an issue on ARM64 platform:
> 1. The pcie_tph_get_cpu_st() function directly uses cpu_uid as the input
>    parameter to call the PCI ACPI DSM method. According to the DSM
>    definition, the input value should be the ACPI Processor UID (see [1]
>    for details).
> 2. In the Broadcom driver implementation [2] (which invokes
>    pcie_tph_get_cpu_st()), cpu_uid is obtained via
>    cpumask_first(irq->cpu_mask) - this is the logical CPU ID of a CPU
>    core, generated and managed by kernel (e.g., [0,255] for a system
>    with 256 logical CPU cores).
> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
>    MADT table, and this UID may not match the kernel's logical CPU ID.
>    As a result, the current implementation fails to retrieve the correct
>    CPU steer-tag in such cases.
> 4. The function works on AMD x86 platforms only because the logical CPU
>    ID is identical to the ACPI Processor UID on those systems.
> 
> This commit fixes it by:
> 1. For ACPI-enabled platforms, unify the CPU ACPI ID retrieval
>    interface:
>    - On arm64/riscv/loongarch: Rename existing get_acpi_id_for_cpu() to
>      acpi_get_cpu_acpi_id().
>    - On x86: Add new acpi_get_cpu_acpi_id() implementation that wraps
>      cpu_acpi_id().
> 2. Update pcie_tph_get_cpu_st() to use acpi_get_cpu_acpi_id(cpu) to get
>    valid ACPI Processor UID for DSM calls.
> 3. Renaming pcie_tph_get_cpu_st()'s input parameter cpu_uid to cpu for
>    clarity, as the parameter now represents a logical CPU ID (not a
>    UID).
> 
> [1] According to ECN_TPH-ST_Revision_20200924
>     (https://members.pcisig.com/wg/PCI-SIG/document/15470), the input
>     is defined as: "If the target is a processor, then this field
>     represents the ACPI Processor UID of the processor as specified in
>     the MADT. If the target is a processor container, then this field
>     represents the ACPI Processor UID of the processor container as
>     specified in the PPTT."
> [2] commit c214410c47d6e ("bnxt_en: Add TPH support in BNXT driver")
> 
> Fixes: d2e8a34876ce ("PCI/TPH: Add Steering Tag support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> 
> ---
> Changes in v3:
> - Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() other
>   than add one new API.
Ah. I wasn't clear around that rename suggestion.  Split this into two patches.
1) Rename
2) The new stuff plus x86 implementation.

> 
> Changes in v2:
> - Add ECN _DSM reference doc name and its URL.
> - Separate implement acpi_get_cpu_acpi_id() in each arch which supports
>   ACPI.
> - Refine commit-log.
> 
> ---
>  Documentation/PCI/tph.rst          |  4 ++--
>  arch/arm64/include/asm/acpi.h      |  4 ++--
>  arch/loongarch/include/asm/acpi.h  |  2 +-
>  arch/riscv/include/asm/acpi.h      |  2 +-
>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>  arch/x86/include/asm/acpi.h        |  2 ++
>  arch/x86/kernel/cpu/common.c       |  8 ++++++++
>  drivers/acpi/pptt.c                | 16 ++++++++--------
>  drivers/acpi/riscv/rhct.c          |  2 +-
>  drivers/pci/tph.c                  | 11 ++++++-----
>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>  include/linux/pci-tph.h            |  4 ++--
>  12 files changed, 35 insertions(+), 24 deletions(-)




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
