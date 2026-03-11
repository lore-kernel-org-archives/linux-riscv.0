Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4A5FD88E2
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 03:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPZ9mcnPgCCWi5z5fu6V4VAZcpXM49Mif//Ygfyyb1c=; b=ISocozrNTFNaU7
	bn9izQ8/Z04GruzsHK21l22IKDDTtF2wXoTYGowTZugVjAAsBaTEwKFTe2DdrtqO9ELnsgmsN1FjG
	SlWoNuaif1IIpaLxFUuybufeu8Ho005CKawYL4ks/DYAJ8+gMXmbLdpvWP7mLYe3pi+KeJbLXukz0
	ENdxoZ19TCGzpZlHDHtgnr1Zrag2WUW+yEHSBwW5fJwmP5bnrGlBlK5jisxTo4PQYabkMS0g+o0hR
	JkuLZeqI7gtz3z/APEjX4Vp82yrELKo/sdHF0gwkvspA3DR+KKpga4/U0J/Lp1TJbDHzZmh9Xo9r7
	hqbBUzEt383BZ6Cwllpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09o2-0000000Aa4o-11Pa;
	Wed, 11 Mar 2026 03:00:18 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09ny-0000000Aa41-376m;
	Wed, 11 Mar 2026 03:00:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DUKycpPzpFIpG0env8jwSvfK5sQZJJ1YY0eqvDa9Ls4=;
	b=UIuMwL2ZnQBHKt0OSz5st4Og2VYIGREkqW4SE+XsyKkbHXGhNjJEsAWrxVSqy6OOZJ3NLbK9Z
	kP8s3Xd0pnLT2F4QMacoWnfn19/NxFuvNNLMkzdoJPW46wBbTVsZOQsEtjgpquwRCBs94A0/o7e
	g1HUZD+aWdwNP2wFTTnfWEY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fVwMy3T5lzLlSf;
	Wed, 11 Mar 2026 10:55:10 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 7FEF34056C;
	Wed, 11 Mar 2026 11:00:05 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Mar 2026 11:00:03 +0800
Message-ID: <9ef9b529-839b-4cf0-a294-5b68fe8aa768@huawei.com>
Date: Wed, 11 Mar 2026 11:00:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
To: Bjorn Helgaas <helgaas@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>
References: <20260310220920.GA826995@bhelgaas>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260310220920.GA826995@bhelgaas>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_200015_175776_47D41FF7 
X-CRM114-Status: GOOD (  27.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J .
 Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, Wathsala Vithanage <wathsala.vithanage@arm.com>, Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/11/2026 6:09 AM, Bjorn Helgaas wrote:
> On Tue, Mar 10, 2026 at 10:58:49AM -0500, Jeremy Linton wrote:
>> On 3/9/26 10:20 PM, Chengwen Feng wrote:
>>> pcie_tph_get_cpu_st() is broken on ARM64:
>>> 1. pcie_tph_get_cpu_st() passes cpu_uid to the PCI ACPI DSM method.
>>>     cpu_uid should be the ACPI Processor UID [1].
>>> 2. In BNXT, pcie_tph_get_cpu_st() is passed a cpu_uid obtained via
>>>     cpumask_first(irq->cpu_mask) - the logical CPU ID of a CPU core,
>>>     generated and managed by kernel (e.g., [0,255] for a system  with 256
>>>     logical CPU cores).
>>> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
>>>     MADT table, and this UID may not match the kernel's logical CPU ID.
>>>     When this occurs, the mismatch results in the wrong CPU steer-tag.
>>> 4. On AMD x86 the logical CPU ID is identical to the ACPI Processor UID
>>>     so the mismatch is not seen.
> 
>>>   int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
>>> -			unsigned int cpu_uid, u16 *tag)
>>> +			unsigned int cpu, u16 *tag)
>>>   {
>>>   #ifdef CONFIG_ACPI
>>> +	u32 cpu_uid = acpi_get_cpu_acpi_id(cpu);
> 
> From AI review (gemini/gemini-3.1-pro-preview):
> 
>   Does this code need to validate that `cpu` is within bounds before
>   using it?  Before this change, the `cpu_uid` parameter was passed
>   opaquely to the ACPI firmware via `tph_invoke_dsm()`, which would
>   gracefully handle invalid values.
> 
>   Now, `cpu` is treated as a logical CPU index and passed to
>   `acpi_get_cpu_acpi_id(cpu)`. On architectures like arm64 and riscv,
>   `acpi_get_cpu_acpi_id()` uses `cpu` directly as an array index
>   (`&cpu_madt_gicc[cpu]` and `&cpu_madt_rintc[cpu]`). On x86, it uses
>   `per_cpu(x86_cpu_to_acpiid, cpu)`.
> 
>   If a caller passes an out-of-bounds `cpu` index (for example, if an
>   IRQ affinity mask is empty and `cpumask_first()` returns
>   `nr_cpu_ids`, or if userspace passes an arbitrary ID via
>   `mlx5_st_alloc_index()`), this will result in an out-of-bounds
>   memory read.
> 
>   Consider adding a bounds check:
> 
>     if (cpu >= nr_cpu_ids)
>       return -EINVAL;
> 
> I agree that this is an issue, and I think implementations of
> acpi_get_cpu_acpi_id() should validate their inputs.
> 
> I don't know if there's a value that can never be a valid ACPI CPU UID
> and could be used as an error value from acpi_get_cpu_acpi_id().  I do
> see a few mentions of a ~0 value meaning "all processors" (ACPI r6.6,
> sec 5.2.12.13).  

I only have the ACPI Specification Version 6.5, so I will use v6.5 as an example.

The ACPI specification does not define invalid value ranges for the ACPI UID.
For the arm64 platform (Section 5.2.12.14):
  ACPI Processor UID: The OS associates this GICC Structure with a processor device
                      object in the namespace when the _UID child object of the
                      processor device evaluates to a numeric value that matches
                      the numeric value in this field.

I am concerned that we cannot implement it like this:
	int acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		...
	}
or:
	u32 acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return U32_MAX;
		...
	}

How about implementing it as follows:
	s64 acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		...
	}
or
	int acpi_get_cpu_uid(unsigned int cpu, u32 *uid) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		*uid = xxx;
		return 0;
	}



Another issue: This commit also provides an implementation for the x86 platform.
However, further code analysis revealed a potential problem in the implementation:

The acpi_get_cpu_acpi_id() retrieves uid from x86_cpu_to_acpiid in SMP, and
x86_cpu_to_acpiid is set through the call chain: acpi_parse_lapic() ->
topology_register_apic() -> topo_register_apic() -> topo_set_cpuids() ->
x86_cpu_to_acpiid. It appears to retrieve the "ACPI Processor UID" from
ACPI Section 5.2.12.2, but the problem is that this field is only one byte in length,
which may cause issues in huge-core systems.

Therefore, I suggest re-implementing the acpi_get_cpu_uid function for the x86
platform. Either I provide a default implementation (shown below), or x86 guys
contribute to the implementation:

	s64 acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		return cpu;
	}

Thanks

> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
