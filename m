Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81460C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ixvrpS9NxDAIP3sfUjSDHvhGUrQXfZrF/D7yK2Dye8=; b=rdszFZcHIG++EB
	yHAdf7+09sT6SfeecCJE4tXFfuzVP8c3kJiBX+o0a6piktSyy6fEbEruSCiKG5YCp9RDZlOvMnPzW
	czhQN2zFuXRHiRgYb65tqkz0Ndt4Xiqym/sobvE3JOVZNVVcevaz8N3Hl3R885SBAHRtOc8bQ8LbI
	RrUrYZUryDx4rfLzXTJNL62HR1HP0xfXTEkrIF4Bjpdixj60roriR4g0eQy+AYJXExWHc2DQ5Znc1
	nA7ln7PU8CQsV6ocxxDhktuHmyQXbT2j/9zJ/2UJBL4y93I8FxeBpXkb/vCd5pMXu7YenmWKThRb5
	v8qvZYwpHPI1uH68URXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sexm0-0000000DBQ2-2pSB;
	Fri, 16 Aug 2024 14:17:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sexlJ-0000000DBDO-3Hlm;
	Fri, 16 Aug 2024 14:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44DE1621F5;
	Fri, 16 Aug 2024 14:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A30C32782;
	Fri, 16 Aug 2024 14:16:59 +0000 (UTC)
Date: Fri, 16 Aug 2024 15:16:57 +0100
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
Subject: Re: [PATCH v10 11/40] arm64/mm: Allocate PIE slots for EL0 guarded
 control stack
Message-ID: <Zr9fWfRObI5TNNXg@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-11-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-11-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_071706_221938_CCFB4429 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, Aug 01, 2024 at 01:06:38PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index b11cfb9fdd37..545d54c88520 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -144,15 +144,23 @@ static inline bool __pure lpa2_is_enabled(void)
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
> +#define _PAGE_GCS	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_WRITE | PTE_USER)
> +#define _PAGE_GCS_RO	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_USER)
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
> @@ -160,6 +168,8 @@ static inline bool __pure lpa2_is_enabled(void)
>  	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW))
>  
>  #define PIE_E1	( \
> +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
> +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \

It's fine to keep PIE_NONE_O here, the kernel wouldn't need to access
this memory with unprivileged instructions (it only matters for the
futex code using LDXR/STXR).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
