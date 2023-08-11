Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BC9EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waXsqma7Oe5ZgorGWNqvh1b8n9bCgpGXXp9+2x6fLHo=; b=qaUumn4tWKZ6ON
	wDIUj15YY3jUU0D6SZxzW4Zi6O6pdRQ7iCFSun5aGWphWJPr9DK7yjYP6F6xkiJW+j7G7DgYbh/xE
	/yqeOGO2svRL5I6VrW3DKzmwo7nOGcucKzex6MV7N8vEo+rFOdfUt2C5Ry8EZrde0vqzSPIq72ILN
	qu0dDA6dOaHxRFIJf9RxyAAw7Brr3MdPcb99vm+5xUOaE7CBz4xB835bUf7GPkVhK/4Orgnq21kc9
	KiIrbIzEbUGWKReWmWnYv82e5BBTUso/BCpwDrujJhvks4HnvKXZsUirk2/xu6/cPZDVnLlaZi4FT
	sBH7qk2IncJ29Ebyylug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUUxr-00B6Nx-2w;
	Fri, 11 Aug 2023 16:26:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUUxo-00B6MI-0i;
	Fri, 11 Aug 2023 16:26:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8541864B18;
	Fri, 11 Aug 2023 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFF3C433C7;
	Fri, 11 Aug 2023 16:26:05 +0000 (UTC)
Date: Fri, 11 Aug 2023 17:26:03 +0100
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
Subject: Re: [PATCH v4 19/36] arm64/gcs: Allocate a new GCS for threads with
 GCS enabled
Message-ID: <ZNZhG/4rBpTenYVH@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-19-68cfa37f9069@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-arm64-gcs-v4-19-68cfa37f9069@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_092612_342292_6E7B2832 
X-CRM114-Status: GOOD (  23.51  )
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

On Mon, Aug 07, 2023 at 11:00:24PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
> index b0a67efc522b..1e059c37088d 100644
> --- a/arch/arm64/mm/gcs.c
> +++ b/arch/arm64/mm/gcs.c
> @@ -8,6 +8,62 @@
>  #include <asm/cpufeature.h>
>  #include <asm/page.h>
>  
> +static unsigned long alloc_gcs(unsigned long addr, unsigned long size,
> +			       unsigned long token_offset, bool set_res_tok)
> +{
> +	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
> +	struct mm_struct *mm = current->mm;
> +	unsigned long mapped_addr, unused;
> +
> +	if (addr)
> +		flags |= MAP_FIXED_NOREPLACE;
> +
> +	mmap_write_lock(mm);
> +	mapped_addr = do_mmap(NULL, addr, size, PROT_READ, flags,
> +			      VM_SHADOW_STACK | VM_WRITE, 0, &unused, NULL);

Why not PROT_WRITE as well? I guess I need to check the x86 patches
since the do_mmap() called here has a different prototype than what's in
mainline.

This gets confusing since currently the VM_* flags are derived from the
PROT_* flags passed to mmap(). But you skip the PROT_WRITE in favour of
adding VM_WRITE directly.

I haven't followed the x86 discussion but did we run out of PROT_* bits
for a PROT_SHADOW_STACK?

> +	mmap_write_unlock(mm);
> +
> +	return mapped_addr;
> +}
> +
> +static unsigned long gcs_size(unsigned long size)
> +{
> +	if (size)
> +		return PAGE_ALIGN(size);
> +
> +	/* Allocate RLIMIT_STACK with limits of PAGE_SIZE..4G */
> +	size = PAGE_ALIGN(min_t(unsigned long long,
> +				rlimit(RLIMIT_STACK), SZ_4G));
> +	return max(PAGE_SIZE, size);
> +}

I saw Szabolcs commenting on the default size as well. Maybe we should
go for RLIMIT_STACK/2 but let's see how the other sub-thread is going.

> +
> +unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
> +				     unsigned long clone_flags, size_t size)
> +{
> +	unsigned long addr;
> +
> +	if (!system_supports_gcs())
> +		return 0;
> +
> +	if (!task_gcs_el0_enabled(tsk))
> +		return 0;
> +
> +	if ((clone_flags & (CLONE_VFORK | CLONE_VM)) != CLONE_VM)
> +		return 0;

Is it safe for CLONE_VFORK not to get a new shadow stack? A syscall for
exec could push something to the stack. I guess the GCS pointer in the
parent stays the same, so it wouldn't matter.

That said, I think this check should be somewhere higher up in the
caller of gcs_alloc_thread_stack(). The copy_thread_gcs() function
already does most of the above checks. Is the GCS allocation called from
elsewhere as well?

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
