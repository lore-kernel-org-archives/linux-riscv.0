Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22963C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pK9Jvwy7DZuisZ9geE/UY5BrL6SBI0UXdlGEB0KpjW0=; b=k5IgOOjjc63NNh
	I0AJgPwgwa5H7H/lABOPuWRRD8erHLXA0dEKyj1d7gSNqmvskQjLg1teitZBAYnFzaYqawYNAeb6F
	Ig8skD0A+3vS25pyUyv8Y6FGowueCZAEf5OnDAEswTnoIfJJWTd3/tnDe+i8Iy9iqFivwGMR6wjQ8
	+4YMrKHC6+aK6ScR6P1/mcZqbtqT6gW00smi8uFQRWQnUaOeLNGQUINy5LFm0g1vzIDkczYjAZoXU
	CvElcXjWAgDTq6hwZsjtr85s3roKv0nWxI84Iawwbq3VENDJ7NA+3jt5X2JIqH2yeHAUiBhOcEMvf
	IYK8sTcKSgjRNqwkOSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg1EL-00000001NjE-3R0g;
	Mon, 19 Aug 2024 12:11:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg17a-00000001LWu-48oo;
	Mon, 19 Aug 2024 12:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C93E60DCE;
	Mon, 19 Aug 2024 12:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949ABC32782;
	Mon, 19 Aug 2024 12:04:20 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:04:18 +0100
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
Subject: Re: [PATCH v10 20/40] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <ZsM0wkRRguMchecK@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-20-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-20-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_050427_206986_89336BED 
X-CRM114-Status: GOOD (  22.83  )
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

On Thu, Aug 01, 2024 at 01:06:47PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 5f00cb0da9c3..d6d3a96cf2e4 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -285,9 +285,32 @@ static void flush_gcs(void)
>  	write_sysreg_s(0, SYS_GCSPR_EL0);
>  }
>  
> +static int copy_thread_gcs(struct task_struct *p,
> +			   const struct kernel_clone_args *args)
> +{
> +	unsigned long gcs;
> +
> +	gcs = gcs_alloc_thread_stack(p, args);
> +	if (IS_ERR_VALUE(gcs))
> +		return PTR_ERR((void *)gcs);

Is 0 an ok value here? I can see further down that
gcs_alloc_thread_stack() may return 0.

> +
> +	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;
> +	p->thread.gcs_el0_locked = current->thread.gcs_el0_locked;
> +
> +	/* Ensure the current state of the GCS is seen by CoW */
> +	gcsb_dsync();

I don't get this barrier. What does it have to do with CoW, which memory
effects is it trying to order?

> diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
> index b0a67efc522b..b71f6b408513 100644
> --- a/arch/arm64/mm/gcs.c
> +++ b/arch/arm64/mm/gcs.c
> @@ -8,6 +8,138 @@
>  #include <asm/cpufeature.h>
>  #include <asm/page.h>
>  
> +static unsigned long alloc_gcs(unsigned long addr, unsigned long size)
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
> +	/* Allocate RLIMIT_STACK/2 with limits of PAGE_SIZE..2G */
> +	size = PAGE_ALIGN(min_t(unsigned long long,
> +				rlimit(RLIMIT_STACK) / 2, SZ_2G));
> +	return max(PAGE_SIZE, size);
> +}

So we still have RLIMIT_STACK/2. I thought we got rid of that and just
went with RLIMIT_STACK (or I misremember).

> +
> +static bool gcs_consume_token(struct mm_struct *mm, unsigned long user_addr)
> +{
> +	u64 expected = GCS_CAP(user_addr);
> +	u64 val;
> +	int ret;
> +
> +	/* This should really be an atomic cmpxchg.  It is not. */
> +	ret = access_remote_vm(mm, user_addr, &val, sizeof(val),
> +			       FOLL_FORCE);
> +	if (ret != sizeof(val))
> +		return false;
> +
> +	if (val != expected)
> +		return false;
> +
> +	val = 0;
> +	ret = access_remote_vm(mm, user_addr, &val, sizeof(val),
> +			       FOLL_FORCE | FOLL_WRITE);
> +	if (ret != sizeof(val))
> +		return false;
> +
> +	return true;
> +}

As per the clone3() thread, I think we should try to use
get_user_page_vma_remote() and do a cmpxchg() directly.

How does the user write the initial token? Do we need any barriers
before/after consuming the token?

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
