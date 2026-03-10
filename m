Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B50FD88C3
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 22:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ECfHeTzqewZnInpmA8la+k7DWaPdqN3fRuU5RxZfUZA=; b=32kIzUVxKrsEVS
	dxRTuZ9huZtUKYJ32JWvShI7scJScVw2paG1dzORKTu5q7E0ZHTh4D15Jt8KordGNAZusk5c3u0Bh
	5jyS9uwLVkDtIGUljVNTct/1q2m6mpnM9Of6cfc3SCFrbESXj491bSqAWd5pQaj90+UFYkPNbphg6
	O4XwiP44Z+G1P1XbjmhhS1Ux80UfrEWyUgptKKVsr0VsAq1NPJY39946ZGX32IsDVUt6Z81SZQ+PC
	m/mGovhonrXHjmQdNGrkQGYZNONpCMFkutk4NylBaOXyvRE+B8y/WaSqfqXd24mkMuvIKWZV0oPNx
	eaw+Vtk/TJ396P5G0Fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w05GX-0000000AKOO-3IPI;
	Tue, 10 Mar 2026 22:09:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w05GV-0000000AKOC-1F5p;
	Tue, 10 Mar 2026 22:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CBF6600B0;
	Tue, 10 Mar 2026 22:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F86C19423;
	Tue, 10 Mar 2026 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773180561;
	bh=W80lkFXkPyxzZPzLe6vTEN0SYi+yr5xZNTGscVmS0ko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=L00YXZHPMVeEfxwGWu/AsurKr2xWM9c1K5M3MtDaIn5nfcen4jicy1Q3i8rLIm5yf
	 WfvG20wIi1QYyAKqVzaODlOcIZAjN1oBjLxF9C/amXt1SGV5lxTwZfkpQvXdvW9gAg
	 U5fgwzShrDb/Z15j0gztxNaymw4OC6qlveBz2cGZnyhROtlLohCqWPm8uXMsbT9F27
	 CbZuzIyVxmIfJ98YaFyJMcT3cZFIirNKa3bxELZvJJRpc3CFl/8aYvCTYeWpkA6BN0
	 oBTJJOco6wPHguHYPtf3q7EkbWZ3hux+WxUaIr/01eGtMcm8Pr8xqHRXg8MC7nxSZp
	 RRiGt6sycGkpg==
Date: Tue, 10 Mar 2026 17:09:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: [PATCH v5 2/2] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
Message-ID: <20260310220920.GA826995@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <657142d1-1632-4a3e-8800-ee1dd5763d78@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J . Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Chengwen Feng <fengchengwen@huawei.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, "Ahmed S . Darwish" <darwi@linutronix.de>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ma Ke <make24@iscas.ac.cn>, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, Wathsala Vithanage <wathsala.vithanage@arm.com>, Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 10:58:49AM -0500, Jeremy Linton wrote:
> On 3/9/26 10:20 PM, Chengwen Feng wrote:
> > pcie_tph_get_cpu_st() is broken on ARM64:
> > 1. pcie_tph_get_cpu_st() passes cpu_uid to the PCI ACPI DSM method.
> >     cpu_uid should be the ACPI Processor UID [1].
> > 2. In BNXT, pcie_tph_get_cpu_st() is passed a cpu_uid obtained via
> >     cpumask_first(irq->cpu_mask) - the logical CPU ID of a CPU core,
> >     generated and managed by kernel (e.g., [0,255] for a system  with 256
> >     logical CPU cores).
> > 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
> >     MADT table, and this UID may not match the kernel's logical CPU ID.
> >     When this occurs, the mismatch results in the wrong CPU steer-tag.
> > 4. On AMD x86 the logical CPU ID is identical to the ACPI Processor UID
> >     so the mismatch is not seen.

> >   int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
> > -			unsigned int cpu_uid, u16 *tag)
> > +			unsigned int cpu, u16 *tag)
> >   {
> >   #ifdef CONFIG_ACPI
> > +	u32 cpu_uid = acpi_get_cpu_acpi_id(cpu);

From AI review (gemini/gemini-3.1-pro-preview):

  Does this code need to validate that `cpu` is within bounds before
  using it?  Before this change, the `cpu_uid` parameter was passed
  opaquely to the ACPI firmware via `tph_invoke_dsm()`, which would
  gracefully handle invalid values.

  Now, `cpu` is treated as a logical CPU index and passed to
  `acpi_get_cpu_acpi_id(cpu)`. On architectures like arm64 and riscv,
  `acpi_get_cpu_acpi_id()` uses `cpu` directly as an array index
  (`&cpu_madt_gicc[cpu]` and `&cpu_madt_rintc[cpu]`). On x86, it uses
  `per_cpu(x86_cpu_to_acpiid, cpu)`.

  If a caller passes an out-of-bounds `cpu` index (for example, if an
  IRQ affinity mask is empty and `cpumask_first()` returns
  `nr_cpu_ids`, or if userspace passes an arbitrary ID via
  `mlx5_st_alloc_index()`), this will result in an out-of-bounds
  memory read.

  Consider adding a bounds check:

    if (cpu >= nr_cpu_ids)
      return -EINVAL;

I agree that this is an issue, and I think implementations of
acpi_get_cpu_acpi_id() should validate their inputs.

I don't know if there's a value that can never be a valid ACPI CPU UID
and could be used as an error value from acpi_get_cpu_acpi_id().  I do
see a few mentions of a ~0 value meaning "all processors" (ACPI r6.6,
sec 5.2.12.13).  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
