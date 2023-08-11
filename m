Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A36EC001DB
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiGmo7q8tI5DDzjYveE0IhdJXXKdNLOjRywgSZb7H34=; b=hwfczL9j7rSF5S
	JJFSLaJHd0FhWpc8swQ8FgxPwhfL84YjP9UZAhGMaUf8r64FoalUpaggUNqg3wanrIzjxYPr8PsYc
	gypV7y35zuyftuDPhuS5HSuzCRy9gP6p5oh2MB+HXWlkUfSd2ERtDpzG2amVaawF/0WmNs+ZcyZYy
	5wiHM+o+I/ggVe15bS0mIoFbMIgM1yPTp1UaOKha3ve9glVfLJkVh6ZU5hGcKW4TTndv5WuzrSUgc
	aHQZjl1yXCXG/x/ktqY/p7K0W/aaoCyaPkGOn437Fzupynvca+Pref0UkrhIt7UDjyeswsnv+y8GS
	jNRiqzvGBAAp22w+8ESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUT2x-00Ap2W-1t;
	Fri, 11 Aug 2023 14:23:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUT2u-00Ap1r-16;
	Fri, 11 Aug 2023 14:23:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A4A8673A8;
	Fri, 11 Aug 2023 14:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85887C433C8;
	Fri, 11 Aug 2023 14:23:14 +0000 (UTC)
Date: Fri, 11 Aug 2023 15:23:12 +0100
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 09/36] arm64/mm: Allocate PIE slots for EL0 guarded
 control stack
Message-ID: <ZNZEUEqJuHrdEa/c@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-9-68cfa37f9069@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-arm64-gcs-v4-9-68cfa37f9069@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_072320_462527_D0929024 
X-CRM114-Status: GOOD (  16.78  )
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

On Mon, Aug 07, 2023 at 11:00:14PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index eed814b00a38..b157ae0420ed 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -131,15 +131,23 @@ extern bool arm64_use_ng_mappings;
>  /* 6:                                PTE_PXN | PTE_WRITE            */
>  /* 7: PAGE_SHARED_EXEC               PTE_PXN | PTE_WRITE | PTE_USER */
>  /* 8: PAGE_KERNEL_ROX      PTE_UXN                                  */
> -/* 9:                      PTE_UXN |                       PTE_USER */
> +/* 9: PAGE_GCS_RO          PTE_UXN |                       PTE_USER */
>  /* a: PAGE_KERNEL_EXEC     PTE_UXN |           PTE_WRITE            */
> -/* b:                      PTE_UXN |           PTE_WRITE | PTE_USER */
> +/* b: PAGE_GCS             PTE_UXN |           PTE_WRITE | PTE_USER */
>  /* c: PAGE_KERNEL_RO       PTE_UXN | PTE_PXN                        */
>  /* d: PAGE_READONLY        PTE_UXN | PTE_PXN |             PTE_USER */
>  /* e: PAGE_KERNEL          PTE_UXN | PTE_PXN | PTE_WRITE            */
>  /* f: PAGE_SHARED          PTE_UXN | PTE_PXN | PTE_WRITE | PTE_USER */
>  
> +#define _PAGE_GCS	(_PAGE_DEFAULT | PTE_UXN | PTE_WRITE | PTE_USER)
> +#define _PAGE_GCS_RO	(_PAGE_DEFAULT | PTE_UXN | PTE_USER)
> +
> +#define PAGE_GCS	__pgprot(_PAGE_GCS)
> +#define PAGE_GCS_RO	__pgprot(_PAGE_GCS_RO)
> +
>  #define PIE_E0	( \
> +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
> +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_R)   | \
>  	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_X_O) | \
>  	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX)  | \
>  	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RWX) | \
> @@ -147,6 +155,8 @@ extern bool arm64_use_ng_mappings;
>  	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW))
>  
>  #define PIE_E1	( \
> +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_RW)      | \
> +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_R)      | \

Had some thoughts on this. Why do we need the EL1 GCS attributes to map
to RW? The instructions we'd use to write the shadow stack are the GCS
'T' variants that run as user already.

The only instructions we have in the kernel that would run as EL1 on a
user address are the exclusives (futex code or the old deprecated
emulation but we don't care about them in this context). So I wonder
whether the kernel PIE entry could simply be PIE_NONE_O. Would this be
too restrictive for future uses? Given the coherency between a GCS
access and a standard data access, we may want to restrict it now until
we have a use-case.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
