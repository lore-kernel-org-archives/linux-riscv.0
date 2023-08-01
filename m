Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9465C04FE1
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuBRvkHWMUfuDfYy3gMH5nHp5kgvhoSeV3OfMcWtVU4=; b=iuIN15OhV4KiPh
	hgI/9yRelVMcQXS299zCHvzc3DjqweYVsi0litN7Igg8DwbS7vlfSk8ncIZ97hKMSQ+fj/xyW4Wkq
	whFijCp9el3lfm4t1rpjhA/W5A8K1NC0oZx6PkW1CzcXhvq6aGQMT+AX+chJOwFfqXT8EpkNXsJeF
	p3Bii+E4Q3cgRLAYBCy4N2Oei3KKwZja/8r12TbtmjELbN1pKHEeJGqh/RdnB9pYqIjlIV27JaLzU
	foqVK14Q1/2nVgG2f6buGdz3GqY5p+Q+oJMG2C9EzGF4ZkD8pOg/2ClOH5ebNZueIQANGNteb+rIS
	EGauc9m4v+LzyFcCcLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQsmK-002s65-1h;
	Tue, 01 Aug 2023 17:03:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQsmH-002s4H-36;
	Tue, 01 Aug 2023 17:03:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7EDDC61633;
	Tue,  1 Aug 2023 17:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14158C433C8;
	Tue,  1 Aug 2023 17:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690909400;
	bh=n2/9ktpmINrFVuBWg1KAR2bAcG2NpG4kfEtaUDByDfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AA0UkNhQxwECDyCEaDtc6JhBhvuvyCYYCaSh4HblOm5/sFOqJy8oy4lzt1PHsqe/d
	 TNp/HD+vd9HlKtv5qMTIS+koyMnH6IxwcAdwNwXp4F5+zwZgvrnFbpNoU+QmQ8b5J3
	 ddlGURjkJRGzvvXYAv/2/xdGEsvIazcCS7ipemT/wemv7xW5NPdaO+scLqNwkzr3kd
	 QYfygusILQtsW8OYGbFyAk8m/i1xYFxg47ufEb41rqQx5La8ZysCvnd1hWLGpVELSo
	 6atnVwdyqVnvxRrlqLIxYCR2TAHb6qdezWZ2QfOYTjqX/DgeT6WtV9UpJOx4DAmJz+
	 ldxqcY8ezOQig==
Date: Tue, 1 Aug 2023 20:02:31 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v3 11/36] arm64/mm: Map pages for guarded control stack
Message-ID: <20230801170231.GC2607694@kernel.org>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230731-arm64-gcs-v3-11-cddf9f980d98@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731-arm64-gcs-v3-11-cddf9f980d98@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_100322_083966_4BA88C59 
X-CRM114-Status: GOOD (  23.30  )
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

On Mon, Jul 31, 2023 at 02:43:20PM +0100, Mark Brown wrote:
> Map pages flagged as being part of a GCS as such rather than using the
> full set of generic VM flags.
> 
> This is done using a conditional rather than extending the size of
> protection_map since that would make for a very sparse array.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/mm/mmap.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 8f5b7ce857ed..e2ca770920ed 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -79,8 +79,23 @@ arch_initcall(adjust_protection_map);
>  
>  pgprot_t vm_get_page_prot(unsigned long vm_flags)
>  {
> -	pteval_t prot = pgprot_val(protection_map[vm_flags &
> +	pteval_t prot;
> +
> +	/*
> +	 * If this is a GCS then only interpret VM_WRITE.
> +	 *
> +	 * TODO: Just make protection_map[] bigger?  Nothing seems
> +	 * ideal here.
> +	 */

I think extending protection_map and updating adjust_protection_map() is
cleaner and probably faster.

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
> 
> -- 
> 2.30.2
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
