Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA281125854
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yc9Oc4OdCetZPXfxit20wkMQqlOFTTH8dokokBAez6s=; b=abE/HGzoLTCHoA
	72HsfO6sGzasjYRsBk7KhFozzLgUv1NmavpxKeCyeDqsInsvZ/gUvgxNtQtwWod00JiH2fIahoVJd
	l8KPNNxKD7FFxZHzOklgKEnX7Cx2G8SHf8vPilhFhKI0JuxactdS+LBvT4ITmN7oJAPeb3WTPceDy
	UjuQB7N44FcCaiU9s/zpQljV/SIOrnvQRyDWTXdHZSotwKzpZwFuOdREYNyTVt0e3waZtx3FwaH/G
	ue5znHhXdfCNYzHPxzAAUhzcpXvQ1kQm2qh9OC1zlbPoVdQptLKn0hMwnUSFH0udkWPeV4XFDj00N
	gQP/OmmpkSzBB2CtBYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mx6-0000000BxhN-3D9W;
	Wed, 11 Mar 2026 17:02:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mx3-0000000Bxgz-23W1;
	Wed, 11 Mar 2026 17:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 343704433C;
	Wed, 11 Mar 2026 17:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD869C4CEF7;
	Wed, 11 Mar 2026 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773248548;
	bh=qbQHUZHFrMSl9GZ0M449xWT2lv88BuJUsOUnExNCyK4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=auYcSsapz8p65gnvMN/VpGSca+m0V47rs2fNjRxHOGbcOF7khTzKCshNZHWFukUEa
	 bnXC+yfrXbKqbLhu68q0yQfhAyMWSCXNXNIBAKRaLjxFgWqWGJAvlEHVE71SrnEki3
	 dKD9hbUZKlFZq0UVuNyj0aL4WApKHEHlTf0M8Ea7qH5r5ypeguDSCVP7fDO8XFkDzz
	 KqLzUOMWPsO+YrDPq38kiCFHjNbZq9K/tQnyESpkcZj3YnLHqDfmRejiAWwWhB2AUQ
	 D64NsEu8EfPzJunss4O8z5+fy5ezEJbruvUviqIng0ygosw3JnId/51TdCe9FKqRYj
	 4x+0E9RndXZcA==
Date: Wed, 11 Mar 2026 12:02:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: fengchengwen <fengchengwen@huawei.com>
Subject: Re: [PATCH v5 2/2] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
Message-ID: <20260311170226.GA930029@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ef9b529-839b-4cf0-a294-5b68fe8aa768@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100229_566645_15CEB054 
X-CRM114-Status: GOOD (  37.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J . Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, stable@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, "Ahmed S . Darwish" <darwi@linutronix.de>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ma Ke <make24@iscas.ac.cn>, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, Wathsala Vithanage <wathsala.vithanage@arm.com>, Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11, 2026 at 11:00:02AM +0800, fengchengwen wrote:
> On 3/11/2026 6:09 AM, Bjorn Helgaas wrote:
> > On Tue, Mar 10, 2026 at 10:58:49AM -0500, Jeremy Linton wrote:
> >> On 3/9/26 10:20 PM, Chengwen Feng wrote:
> >>> pcie_tph_get_cpu_st() is broken on ARM64:
> >>> 1. pcie_tph_get_cpu_st() passes cpu_uid to the PCI ACPI DSM method.
> >>>     cpu_uid should be the ACPI Processor UID [1].
> >>> 2. In BNXT, pcie_tph_get_cpu_st() is passed a cpu_uid obtained via
> >>>     cpumask_first(irq->cpu_mask) - the logical CPU ID of a CPU core,
> >>>     generated and managed by kernel (e.g., [0,255] for a system  with 256
> >>>     logical CPU cores).
> >>> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
> >>>     MADT table, and this UID may not match the kernel's logical CPU ID.
> >>>     When this occurs, the mismatch results in the wrong CPU steer-tag.
> >>> 4. On AMD x86 the logical CPU ID is identical to the ACPI Processor UID
> >>>     so the mismatch is not seen.
> > 
> >>>   int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
> >>> -			unsigned int cpu_uid, u16 *tag)
> >>> +			unsigned int cpu, u16 *tag)
> >>>   {
> >>>   #ifdef CONFIG_ACPI
> >>> +	u32 cpu_uid = acpi_get_cpu_acpi_id(cpu);
> > 
> > From AI review (gemini/gemini-3.1-pro-preview):
> > 
> >   Does this code need to validate that `cpu` is within bounds before
> >   using it?  Before this change, the `cpu_uid` parameter was passed
> >   opaquely to the ACPI firmware via `tph_invoke_dsm()`, which would
> >   gracefully handle invalid values.
> > 
> >   Now, `cpu` is treated as a logical CPU index and passed to
> >   `acpi_get_cpu_acpi_id(cpu)`. On architectures like arm64 and riscv,
> >   `acpi_get_cpu_acpi_id()` uses `cpu` directly as an array index
> >   (`&cpu_madt_gicc[cpu]` and `&cpu_madt_rintc[cpu]`). On x86, it uses
> >   `per_cpu(x86_cpu_to_acpiid, cpu)`.
> > 
> >   If a caller passes an out-of-bounds `cpu` index (for example, if an
> >   IRQ affinity mask is empty and `cpumask_first()` returns
> >   `nr_cpu_ids`, or if userspace passes an arbitrary ID via
> >   `mlx5_st_alloc_index()`), this will result in an out-of-bounds
> >   memory read.
> > 
> >   Consider adding a bounds check:
> > 
> >     if (cpu >= nr_cpu_ids)
> >       return -EINVAL;
> > 
> > I agree that this is an issue, and I think implementations of
> > acpi_get_cpu_acpi_id() should validate their inputs.
> > 
> > I don't know if there's a value that can never be a valid ACPI CPU UID
> > and could be used as an error value from acpi_get_cpu_acpi_id().  I do
> > see a few mentions of a ~0 value meaning "all processors" (ACPI r6.6,
> > sec 5.2.12.13).  
> 
> I only have the ACPI Specification Version 6.5, so I will use v6.5
> as an example.

https://uefi.org/sites/default/files/resources/ACPI_Spec_6.6.pdf

> 	int acpi_get_cpu_uid(unsigned int cpu, u32 *uid) {
> 		if (cpu >= nr_cpu_ids)
> 			return -EINVAL;
> 		*uid = xxx;
> 		return 0;
> 	}

This looks good to me.

> Another issue: This commit also provides an implementation for the
> x86 platform.  However, further code analysis revealed a potential
> problem in the implementation:
> 
> The acpi_get_cpu_acpi_id() retrieves uid from x86_cpu_to_acpiid in
> SMP, and x86_cpu_to_acpiid is set through the call chain:
> acpi_parse_lapic() -> topology_register_apic() ->
> topo_register_apic() -> topo_set_cpuids() -> x86_cpu_to_acpiid. It
> appears to retrieve the "ACPI Processor UID" from ACPI Section
> 5.2.12.2, but the problem is that this field is only one byte in
> length, which may cause issues in huge-core systems.
> 
> Therefore, I suggest re-implementing the acpi_get_cpu_uid function
> for the x86 platform. Either I provide a default implementation
> (shown below), or x86 guys contribute to the implementation:
> 
> 	s64 acpi_get_cpu_uid(unsigned int cpu) {
> 		if (cpu >= nr_cpu_ids)
> 			return -EINVAL;
> 		return cpu;
> 	}

I don't think this is your problem to solve, so don't worry about it.
If you implement acpi_get_cpu_uid() to return the same values as
cpu_acpi_id(), it's up to the x86 folks to deal with any one-byte ID
issues.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
