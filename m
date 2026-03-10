Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77253FD4F0F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hQslbeDGfHYZsrQgY8EijmEXW5/TOvSUt1jlIC64pyU=; b=y10bwha2t9SXQr
	LTdti1z3OAXi4iUfE4uvwpPvOXm1O6kSybWVmMj04Tk4muGxpgybbQBpicHRfql+zUKFDi8DCYhB7
	zMruqU7tAyMsgbqB8b8jDnudvCfRVUds0+/mZ1sJKZxRAjTqP0KJ+iljkjh8+S5dm0yWUHa4PRl02
	DwxnHVmeZU4qaw1IYGSoF233wBGfqt1JdtXdB4IKBiH6ZA+38KcDjukNcFnV4iRrhQVk20ga6RKyR
	IZJkD7eMxq1qDGjBsJ71qrYD76Al+4xvGX2ClSOAM8slhYQ+wA6up944b+r54WjNo4FOsM4ww+kdV
	Rr6Uott4sBf9TSsR4dzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01GX-0000000A19H-1X5f;
	Tue, 10 Mar 2026 17:53:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01GV-0000000A18Y-3hop;
	Tue, 10 Mar 2026 17:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDE8460054;
	Tue, 10 Mar 2026 17:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72949C19423;
	Tue, 10 Mar 2026 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773165186;
	bh=WO2FOycvuuimWf2BBulOdnsAjAo+YazNHVVwxkp7CTQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eBcXb+X80rgKqCBvLspNlTOV1vd/pku+H6vrMwjnIUc1EPld/SwvI87VOk2v9spAk
	 mQwzcYlSAluwZ68uAzim6BOLYhwuR8hvCczaCcrGemVxRjRgvMRz7of7bwaxtz6kRd
	 8qySGXq8grwSK5TKxbSjaXWiTsWNvgZx6eHB/8xZY8WWUeaScw3fMAM7MDLDfNxl7z
	 tuQvq86WkhT8OZAzrXBsWUK0J89R9XxcjJg1hqWabtJJwZex+dDwXjeMi63lPBbZNv
	 qOKy8IvjIYCvJ2lP43twwYPykiMiWqj4+PjF4xTACYlgH5VX2O6O8QN3kfkzkExPxm
	 ckaiF6BuuSr7Q==
Date: Tue, 10 Mar 2026 12:53:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v5 1/2] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_acpi_id() on non-x86
Message-ID: <20260310175305.GA730372@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310032049.25387-2-fengchengwen@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J . Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 11:20:48AM +0800, Chengwen Feng wrote:
> To unify the CPU ACPI ID retrieval interface across architectures,
> rename the existing get_acpi_id_for_cpu() function to
> acpi_get_cpu_acpi_id() on arm64/riscv/loongarch platforms.
> 
> This is a pure rename with no functional change, preparing for a
> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
> platforms.

Really a question for the ACPI folks, but my preferences would be:

  - Simpler name for the interface, e.g., "acpi_get_cpu_id()"

  - Single prototype in generic header, e.g., include/linux/acpi.h

  - Split the x86 part to a separate patch and maybe (a tangent, but
    looks dubious to me) figure out whether/why xen needs xen_vcpu_id
    to be ACPI CPU IDs

> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  arch/arm64/include/asm/acpi.h      |  4 ++--
>  arch/loongarch/include/asm/acpi.h  |  2 +-
>  arch/riscv/include/asm/acpi.h      |  2 +-
>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>  drivers/acpi/pptt.c                | 16 ++++++++--------
>  drivers/acpi/riscv/rhct.c          |  2 +-
>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>  7 files changed, 15 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
