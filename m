Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4833C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKKxcb/E2LHw01nkNxxAAsya2wjkAMsPMTaOeHweu+U=; b=p7eSLyx4EkA7pI
	RFFIvvsfX8GLg3bNvIiVEPs2J88euZFuDEK+5NIMKeSWGID9Lw/1im9Af6MYOXsJG7hpnOM1ON1j1
	jMLfEMP/bTVXm+Kaokkuawbq2xlzTJQlOc7GmJnR1PPc+a78ZrzSxAzGtsEbCQZL5IpWLUgXVIifr
	0w+J/CJYOh7DYvoSeFNic/lgNNnZXVbkQOy13UmdV4oVZK9gVp2BH2LuPHygnSRed9SKRwe7FefKP
	RBmoiQowfLT/hGYYrt6icB6nzlL8yltaQDTo4tKkRND0VOOyu10Op9XuO+VogUzxV/hPgNtfOxXpf
	z26ZVdMRPBj3thbIbE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shATY-0000000DXuw-33Sf;
	Thu, 22 Aug 2024 16:15:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAQU-0000000DX3F-0DW9;
	Thu, 22 Aug 2024 16:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 05D0ACE1020;
	Thu, 22 Aug 2024 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A751C4AF0C;
	Thu, 22 Aug 2024 16:12:33 +0000 (UTC)
Date: Thu, 22 Aug 2024 17:12:30 +0100
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
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 19/39] arm64/mm: Handle GCS data aborts
Message-ID: <ZsdjbsDrMWgBU9Hj@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-19-41b81947ecb5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-arm64-gcs-v11-19-41b81947ecb5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_091242_473547_6906DF39 
X-CRM114-Status: GOOD (  23.28  )
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

On Thu, Aug 22, 2024 at 02:15:22AM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 451ba7cbd5ad..3ada31c2ac12 100644
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
> @@ -500,6 +508,23 @@ static bool is_write_abort(unsigned long esr)
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

This first check covers the GCSPOPM/RET etc. permission faults on
non-GCS vmas. It looks correct.

> +	} else if (unlikely(vma->vm_flags & VM_SHADOW_STACK)) {
> +		/* Only GCS operations can write to a GCS page */
> +		return is_write_abort(esr);
> +	}

I don't think that's right. The ESR on this path may not even indicate a
data abort and ESR.WnR bit check wouldn't make sense.

I presume we want to avoid an infinite loop on a (writeable) GCS page
when the user does a normal STR but the CPU raises a permission fault. I
think this function needs to just return false if !esr_is_data_abort().

> +
> +	return false;
> +}
> +
>  static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  				   struct pt_regs *regs)
>  {
> @@ -535,6 +560,14 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
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
> @@ -568,6 +601,13 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	if (!vma)
>  		goto lock_mmap;
>  
> +	if (is_invalid_gcs_access(vma, esr)) {
> +		vma_end_read(vma);
> +		fault = 0;
> +		si_code = SEGV_ACCERR;
> +		goto bad_area;
> +	}

Here there's a risk that the above function returns true for some
unrelated fault that happens to have bit 6 in ESR set.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
