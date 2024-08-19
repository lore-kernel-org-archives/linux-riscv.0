Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B6C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVN6N40XOBnBUqflR+4E8vt1BN1WKVGbgGfcmNDF6KM=; b=eeZpIUkQiA8ZJC
	h0pmloAer43uR5cXLLRPiCSepydf6ICp5keg3meHPM8XvckvTCi84rWx+pHTYcY0ImgU12NgBzOiU
	BTzMb8nX17gP7xTTB/o64LuChTp+enU0o9b86s3j2raLTvfDxx/s2OveTzTPJMFTmJIEwpnHAqDfb
	PdwM/v5K+LieN1l9ZdDZGJ3G289IKhtqusY/54tIRsgqn+OINk3O4CuqoJQgTfJOX7M3nJ0cB575O
	xIa9srNLGYNZ+CP+XmC+opx2yGPdhVKBw8zO63qr2hIu5TEw1ndzJZGx9FWMVklr8cYoxD6LjP+Jl
	UnahXdYsBVDxL24SbIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyQZ-00000000tpo-3q44;
	Mon, 19 Aug 2024 09:11:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyPY-00000000tUP-1BfG;
	Mon, 19 Aug 2024 09:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E472CE0924;
	Mon, 19 Aug 2024 09:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A672CC4AF0C;
	Mon, 19 Aug 2024 09:10:38 +0000 (UTC)
Date: Mon, 19 Aug 2024 10:10:36 +0100
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
Subject: Re: [PATCH v10 13/40] arm64/mm: Map pages for guarded control stack
Message-ID: <ZsMMDNIp6Pkfbg1e@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-13-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-13-699e2bd2190b@kernel.org>
X-TUID: BxqZX8z1MsWO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_021048_695944_BF96C3AC 
X-CRM114-Status: GOOD (  27.80  )
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

On Thu, Aug 01, 2024 at 01:06:40PM +0100, Mark Brown wrote:
> Map pages flagged as being part of a GCS as such rather than using the
> full set of generic VM flags.
> 
> This is done using a conditional rather than extending the size of
> protection_map since that would make for a very sparse array.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/mman.h |  9 +++++++++
>  arch/arm64/mm/mmap.c          | 10 +++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
> index c21849ffdd88..6d3fe6433a62 100644
> --- a/arch/arm64/include/asm/mman.h
> +++ b/arch/arm64/include/asm/mman.h
> @@ -61,6 +61,15 @@ static inline bool arch_validate_flags(unsigned long vm_flags)
>  			return false;
>  	}
>  
> +	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> +		/*
> +		 * An executable GCS isn't a good idea, and the mm
> +		 * core can't cope with a shared GCS.
> +		 */
> +		if (vm_flags & (VM_EXEC | VM_ARM64_BTI | VM_SHARED))
> +			return false;
> +	}

I wonder whether we should clear VM_MAYEXEC early on during the vma
creation. This way the mprotect() case will be handled in the core code.
At a quick look, do_mmap() seems to always set VM_MAYEXEC but discard it
for non-executable file mmap. Last time I looked (when doing MTE) there
wasn't a way for the arch code to clear specific VM_* flags, only to
validate them. But I think we should just clear VM_MAYEXEC and also
return an error for VM_EXEC in the core do_mmap() if VM_SHADOW_STACK. It
would cover the other architectures doing shadow stacks.

Regarding VM_SHARED, how do we even end up with this via the
map_shadow_stack() syscall? I can't see how one can pass MAP_SHARED to
do_mmap() on this path. I'm fine with a VM_WARN_ON() if you want the
check (and there's no way a user can trigger it).

Is there any arch restriction with setting BTI and GCS? It doesn't make
sense but curious if it matters. We block the exec permission anyway
(unless the BTI pages moved to PIE as well, I don't remember).

> +
>  	return true;
>  
>  }
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 642bdf908b22..3ed63fc8cd0a 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -83,9 +83,17 @@ arch_initcall(adjust_protection_map);
>  
>  pgprot_t vm_get_page_prot(unsigned long vm_flags)
>  {
> -	pteval_t prot = pgprot_val(protection_map[vm_flags &
> +	pteval_t prot;
> +
> +	/* Short circuit GCS to avoid bloating the table. */
> +	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> +		prot = _PAGE_GCS_RO;
> +	} else {
> +		prot = pgprot_val(protection_map[vm_flags &
>  				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> +	}

This looks fine to me. Such page will become proper GCS on first access.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
