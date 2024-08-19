Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13D6C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRr2vlg/h1S3ojheKuxn1da5yQhwbpAFW1oEkUY7ZO0=; b=N61BSSckjWyvsY
	Dv3RcSZMlJqx9zSJIRLKxuDAOv8BLGKuCxM2pBVfUm3+Lhi4aV0094QlW982B/Ip2Vaqw+NnoptBg
	sapyK3D1ELw6AUqt+o8DYk+c0bv1rynXl1AEXytnb+ZlZ5qIq9Dj8sizDdRA1q4OaGnoK9xEaybCB
	SgNy6j4AsyDNEjIQzklUsn578vkgoArszp0qHQblD8gntEH2k+57T9D2UW3GlWXsf2f/oIDQJGNgU
	tyvTkDNpSmJLzuuWmlLSPuajEsaO+x3p89M4takQTmwmIOIpVYJQJ/vt+/4T1GHIiLTwep9G8mMOi
	Rr617REWfIL7nPss6jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyXP-00000000vgq-1d9o;
	Mon, 19 Aug 2024 09:18:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyWX-00000000vWe-1TSI;
	Mon, 19 Aug 2024 09:18:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E84860B9E;
	Mon, 19 Aug 2024 09:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8FCC32782;
	Mon, 19 Aug 2024 09:17:54 +0000 (UTC)
Date: Mon, 19 Aug 2024 10:17:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 18/40] arm64/mm: Handle GCS data aborts
Message-ID: <ZsMNwAsAWr2IxFns@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-18-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-18-699e2bd2190b@kernel.org>
X-TUID: ycLXmrxDHVW6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_021801_540704_4808DC8B 
X-CRM114-Status: GOOD (  22.26  )
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

On Thu, Aug 01, 2024 at 01:06:45PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 451ba7cbd5ad..0973dd09f11a 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -486,6 +486,14 @@ static void do_bad_area(unsigned long far, unsigned long esr,
>  	}
>  }
>  
> +static bool is_gcs_fault(unsigned long esr)
> +{
> +	if (!esr_is_data_abort(esr))
> +		return false;
> +
> +	return ESR_ELx_ISS2(esr) & ESR_ELx_GCS;
> +}
> +
>  static bool is_el0_instruction_abort(unsigned long esr)
>  {
>  	return ESR_ELx_EC(esr) == ESR_ELx_EC_IABT_LOW;
> @@ -500,6 +508,25 @@ static bool is_write_abort(unsigned long esr)
>  	return (esr & ESR_ELx_WNR) && !(esr & ESR_ELx_CM);
>  }
>  
> +static bool is_invalid_gcs_access(struct vm_area_struct *vma, u64 esr)
> +{
> +	if (!system_supports_gcs())
> +		return false;
> +
> +	if (unlikely(is_gcs_fault(esr))) {
> +		/* GCS accesses must be performed on a GCS page */
> +		if (!(vma->vm_flags & VM_SHADOW_STACK))
> +			return true;
> +		if (!(vma->vm_flags & VM_WRITE))
> +			return true;

Do we need the VM_WRITE check here? Further down in do_page_fault(), we
already do the check as we set vm_flags = VM_WRITE.

> +	} else if (unlikely(vma->vm_flags & VM_SHADOW_STACK)) {
> +		/* Only GCS operations can write to a GCS page */
> +		return is_write_abort(esr);
> +	}
> +
> +	return false;
> +}
> +
>  static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  				   struct pt_regs *regs)
>  {
> @@ -535,6 +562,14 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  		/* It was exec fault */
>  		vm_flags = VM_EXEC;
>  		mm_flags |= FAULT_FLAG_INSTRUCTION;
> +	} else if (is_gcs_fault(esr)) {
> +		/*
> +		 * The GCS permission on a page implies both read and
> +		 * write so always handle any GCS fault as a write fault,
> +		 * we need to trigger CoW even for GCS reads.
> +		 */
> +		vm_flags = VM_WRITE;
> +		mm_flags |= FAULT_FLAG_WRITE;
>  	} else if (is_write_abort(esr)) {
>  		/* It was write fault */
>  		vm_flags = VM_WRITE;
> @@ -568,6 +603,13 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	if (!vma)
>  		goto lock_mmap;
>  
> +	if (is_invalid_gcs_access(vma, esr)) {
> +		vma_end_read(vma);
> +		fault = 0;
> +		si_code = SEGV_ACCERR;
> +		goto bad_area;
> +	}
> +
>  	if (!(vma->vm_flags & vm_flags)) {
>  		vma_end_read(vma);
>  		fault = 0;

This check I mentioned above.

I was wondering whether we should prevent mprotect(PROT_READ) on the GCS
page. But I guess that's fine, we'll SIGSEGV later if we get an invalid
GCS access.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
