Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80A0C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dX3x/fJDM+9b5u5z2Vu3h9RqXsW96ZETDKrqObokyOQ=; b=TLJVEVxodmjuTu
	yVbZyLfzy0YdL+qhMrqU+8RFLbzI7SROrn/ieodZAjWGVbBYuFD51Y9D4PpekbbuUpHIAOFMpUmb4
	8SjUZJzhNhtgoan0UCvAR+dyAYlJoGnzhTSa2DMPslRVKq994AqJ7UzczfoC7cwJAFpG9LIxCIRfg
	VVWgrkwXA9LoKGL99SjfkUqAJqFNFaxRZrKfJWus8b/WYkkR5aUUI9JJZxH/zIdkJ+jXMhPEznu1O
	qLvnoqPfL643h78nFE7hkihwcyI9MTo7fanWvTPQdPcxh9V3j11plPcfNDsqmb5w5xnB5ncEXWsx3
	gi7Ew78UNVSvxC3W1g0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU9Kv-008HV1-1l;
	Thu, 10 Aug 2023 17:20:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU9Ks-008HTk-1G;
	Thu, 10 Aug 2023 17:20:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BAE960C4E;
	Thu, 10 Aug 2023 17:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F14C433C8;
	Thu, 10 Aug 2023 17:20:28 +0000 (UTC)
Date: Thu, 10 Aug 2023 18:20:25 +0100
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
Subject: Re: [PATCH v4 11/36] arm64/mm: Map pages for guarded control stack
Message-ID: <ZNUcWdTPKDXvpDbR@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-11-68cfa37f9069@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-arm64-gcs-v4-11-68cfa37f9069@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_102034_492342_A58123A3 
X-CRM114-Status: GOOD (  19.21  )
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

On Mon, Aug 07, 2023 at 11:00:16PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 8f5b7ce857ed..8f40198cd44e 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -79,8 +79,18 @@ arch_initcall(adjust_protection_map);
>  
>  pgprot_t vm_get_page_prot(unsigned long vm_flags)
>  {
> -	pteval_t prot = pgprot_val(protection_map[vm_flags &
> +	pteval_t prot;
> +
> +	/* If this is a GCS then only interpret VM_WRITE. */
> +	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> +		if (vm_flags & VM_WRITE)
> +			prot = _PAGE_GCS;
> +		else
> +			prot = _PAGE_GCS_RO;
> +	} else {
> +		prot = pgprot_val(protection_map[vm_flags &
>  				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> +	}
>  
>  	if (vm_flags & VM_ARM64_BTI)
>  		prot |= PTE_GP;

Some combinations here don't make sense like GCS + exec or BTI. I think
the code above (correctly) ignores exec but it still sets PTE_GP if BTI
(the architecture may allow this but you can't execute from the GCS page
anyway).

I haven't checked the x86 patches to see when VM_SHADOW_STACK is set but
if there's no additional check at a higher level, we should add
something to arch_validate_flags(), assuming it's called on those paths.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
