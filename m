Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982221091904
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9r+jSlpuo9irk2bOx9ZgG/OftpdpCCqQAvdSeiceriE=; b=r+1Va/aA/1Gvr4
	L210phbSNi89zoOv2F0akdogB0Y22F4z9aFnI2yhaunGUiquBvSSNB3i+qr/ZYSfUcW+digVsqRPa
	ozyngj+ffoObY6yQgNnkd7OXPC+JKzWEaMB1T7fsp9Oo80/Ry/9lxBKX7/SWm4SHiiSt33ilauehe
	O4uhLK3qW1TAkRi1JfxneaqUIkgTtY8hJF3iZn9aQ0novkvhRHt8y9cPIRYE+CX1UYKiHjxmJ341/
	BKR5zJVmaei0FquWvS0bPFUy+vP3BNiKn4spJdZmaz4p7ByxWCxKBIN5HG90DI2IzDBKTTmcWxKY9
	CoAszNwaJZAwwk1fCJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IAv-0000000BMPC-33d3;
	Thu, 19 Mar 2026 18:32:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IAu-0000000BMOz-19jg;
	Thu, 19 Mar 2026 18:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72EAF60053;
	Thu, 19 Mar 2026 18:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2336C19424;
	Thu, 19 Mar 2026 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773945141;
	bh=q/AIFKBlYrlqgaIU+R+X2Kbm55lVUhw1nLQSCLmd6ew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SLfxJBQH3ZBwLVeaWFuXtr69z+ue66UBDBXapfmCGZU/5sePR0jM8ttItsExbkxXd
	 fat6HASgQmW8lTt+q9Fv/u0XJTf3d3wZAiJLqrgzYHG5GWO4lK+JttBOqJXt5pwhQF
	 w+6FlJPTdi3oKlG3m7NbTFgXf1aiA6jp7uCbZskZpkhz+sWDidVqJYVEsczF3/Cr0q
	 5HIA6+fCuzX4SwGeOuI+h7S9iLuLC57oeWrh6xVKPtDKceG2qv5E5rx2twVSmjZBNQ
	 hX57e6N1IjMEwU/bgDkP0m8XkKB2jG/ioYVncpqZsFKATtztVHzIe50BPghhEOmL2B
	 /aAbuSjpDjtvg==
Date: Thu, 19 Mar 2026 13:32:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v9 7/7] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
Message-ID: <20260319183219.GA519221@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319065735.45954-8-fengchengwen@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, heinrich.schuchardt@canonical.com, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J . Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, chenl311@chinatelecom.cn, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Let's make the subject a little more specific, e.g.,

  PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM

On Thu, Mar 19, 2026 at 02:57:35PM +0800, Chengwen Feng wrote:
> pcie_tph_get_cpu_st() is broken on ARM64:
> 1. pcie_tph_get_cpu_st() passes cpu_uid to the PCI ACPI DSM method.
>    cpu_uid should be the ACPI Processor UID [1].
> 2. In BNXT, pcie_tph_get_cpu_st() is passed a cpu_uid obtained via
>    cpumask_first(irq->cpu_mask) - the logical CPU ID of a CPU core,
>    generated and managed by kernel (e.g., [0,255] for a system  with 256
>    logical CPU cores).
> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
>    MADT table, and this UID may not match the kernel's logical CPU ID.
>    When this occurs, the mismatch results in the wrong CPU steer-tag.
> 4. On AMD x86 the logical CPU ID is identical to the ACPI Processor UID
>    so the mismatch is not seen.
> 
> Resolution:
> 1. Use acpi_get_cpu_uid() in pcie_tph_get_cpu_st() to translate from
>    logical CPU ID to ACPI Processor UID needed for the DSM call.
> 2. Rename pcie_tpu_get_cpu_st() parameter from cpu_uid to cpu to
>    reflect that it is a logical CPU_ID.

And simplify this, e.g.,

  pcie_tph_get_cpu_st() uses the Query Cache Locality Features _DSM
  [1] to retrieve the TPH Steering Tag for memory associated with the
  CPU identified by its "cpu_uid" parameter, a Linux logical CPU ID.

  The _DSM requires a ACPI Processor UID, which pcie_tph_get_cpu_st()
  previously assumed was the same as the Linux logical CPU ID.  This
  is true on x86 but not on arm64, so pcie_tph_get_cpu_st() failed on
  arm64.

  Convert the Linux logical CPU ID to the ACPI Processor UID with
  acpi_get_cpu_uid() before passing it to the _DSM.

If there's a specific error message from BNXT or similar that is a
symptom of this problem, it'd be nice to include that.  Or if the
problem was just poor performance because the _DSM returned the wrong
Steering Tag, you could say something like:

  ... so pcie_tph_get_cpu_st() returned the wrong Steering Tag,
  resulting in poor network performance.

> [1] According to ECN_TPH-ST_Revision_20200924
>     (https://members.pcisig.com/wg/PCI-SIG/document/15470), the input
>     is defined as: "If the target is a processor, then this field
>     represents the ACPI Processor UID of the processor as specified in
>     the MADT. If the target is a processor container, then this field
>     represents the ACPI Processor UID of the processor container as
>     specified in the PPTT."
> 
> Fixes: d2e8a34876ce ("PCI/TPH: Add Steering Tag support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

The patch looks good to me.  Thanks for all your work on this!

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  Documentation/PCI/tph.rst |  4 ++--
>  drivers/pci/tph.c         | 16 +++++++++++-----
>  include/linux/pci-tph.h   |  4 ++--
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/PCI/tph.rst b/Documentation/PCI/tph.rst
> index e8993be64fd6..b6cf22b9bd90 100644
> --- a/Documentation/PCI/tph.rst
> +++ b/Documentation/PCI/tph.rst
> @@ -79,10 +79,10 @@ To retrieve a Steering Tag for a target memory associated with a specific
>  CPU, use the following function::
>  
>    int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type type,
> -                          unsigned int cpu_uid, u16 *tag);
> +                          unsigned int cpu, u16 *tag);
>  
>  The `type` argument is used to specify the memory type, either volatile
> -or persistent, of the target memory. The `cpu_uid` argument specifies the
> +or persistent, of the target memory. The `cpu` argument specifies the
>  CPU where the memory is associated to.
>  
>  After the ST value is retrieved, the device driver can use the following
> diff --git a/drivers/pci/tph.c b/drivers/pci/tph.c
> index ca4f97be7538..b67c9ad14bda 100644
> --- a/drivers/pci/tph.c
> +++ b/drivers/pci/tph.c
> @@ -236,21 +236,27 @@ static int write_tag_to_st_table(struct pci_dev *pdev, int index, u16 tag)
>   * with a specific CPU
>   * @pdev: PCI device
>   * @mem_type: target memory type (volatile or persistent RAM)
> - * @cpu_uid: associated CPU id
> + * @cpu: associated CPU id
>   * @tag: Steering Tag to be returned
>   *
>   * Return the Steering Tag for a target memory that is associated with a
> - * specific CPU as indicated by cpu_uid.
> + * specific CPU as indicated by cpu.
>   *
>   * Return: 0 if success, otherwise negative value (-errno)
>   */
>  int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
> -			unsigned int cpu_uid, u16 *tag)
> +			unsigned int cpu, u16 *tag)
>  {
>  #ifdef CONFIG_ACPI
>  	struct pci_dev *rp;
>  	acpi_handle rp_acpi_handle;
>  	union st_info info;
> +	u32 cpu_uid;
> +	int ret;
> +
> +	ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +	if (ret != 0)
> +		return ret;
>  
>  	rp = pcie_find_root_port(pdev);
>  	if (!rp || !rp->bus || !rp->bus->bridge)
> @@ -265,9 +271,9 @@ int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
>  
>  	*tag = tph_extract_tag(mem_type, pdev->tph_req_type, &info);
>  
> -	pci_dbg(pdev, "get steering tag: mem_type=%s, cpu_uid=%d, tag=%#04x\n",
> +	pci_dbg(pdev, "get steering tag: mem_type=%s, cpu=%d, tag=%#04x\n",
>  		(mem_type == TPH_MEM_TYPE_VM) ? "volatile" : "persistent",
> -		cpu_uid, *tag);
> +		cpu, *tag);
>  
>  	return 0;
>  #else
> diff --git a/include/linux/pci-tph.h b/include/linux/pci-tph.h
> index ba28140ce670..be68cd17f2f8 100644
> --- a/include/linux/pci-tph.h
> +++ b/include/linux/pci-tph.h
> @@ -25,7 +25,7 @@ int pcie_tph_set_st_entry(struct pci_dev *pdev,
>  			  unsigned int index, u16 tag);
>  int pcie_tph_get_cpu_st(struct pci_dev *dev,
>  			enum tph_mem_type mem_type,
> -			unsigned int cpu_uid, u16 *tag);
> +			unsigned int cpu, u16 *tag);
>  void pcie_disable_tph(struct pci_dev *pdev);
>  int pcie_enable_tph(struct pci_dev *pdev, int mode);
>  u16 pcie_tph_get_st_table_size(struct pci_dev *pdev);
> @@ -36,7 +36,7 @@ static inline int pcie_tph_set_st_entry(struct pci_dev *pdev,
>  { return -EINVAL; }
>  static inline int pcie_tph_get_cpu_st(struct pci_dev *dev,
>  				      enum tph_mem_type mem_type,
> -				      unsigned int cpu_uid, u16 *tag)
> +				      unsigned int cpu, u16 *tag)
>  { return -EINVAL; }
>  static inline void pcie_disable_tph(struct pci_dev *pdev) { }
>  static inline int pcie_enable_tph(struct pci_dev *pdev, int mode)
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
