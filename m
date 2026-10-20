Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F28606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 01:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c8bo8vWg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTCnJvuC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gu4rWNF1HzW5xY7wRdL07YKzVvfPzhRjHBilHaFJqZY=; b=c8bo8vWgMIDtL0
	YH6E0MFPrAU1lMGfzjuBG3GEhVE/2s2r4ZK0kX3JZVv6dNefz1X5hSZIesij48CZWs6Ghr1/0xOGW
	POcg5ICRl6beM/NFRrXBDIuaZ3slF3XAKUerDf8PwYxstiuxvP5BKNtB9YiW8j8hou0G3SxBGCsrH
	4cyzth18RnHl0zdp0eYq/lXzG60ghP4nXuLr7rubyEZgtcm9IZ3CY+EVZmk8ES2zsS5HsXM/yOTbP
	6oqS4tzdeUpAiwK34fiUJLr2hbcra5NzeF00aPQzPrDy41Do0qUTAc6iuLEIOpuvKE9rsY/FsOFDy
	grFeVe48swIKVpyIDoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyn5-00000008ctr-0Ffs;
	Tue, 20 Oct 2026 01:37:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyn4-00000008cti-0WZz
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 01:37:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FEB94396E;
	Tue, 20 Oct 2026 01:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAF31F000C4;
	Tue, 20 Oct 2026 01:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792460241;
	bh=epK2JA5w173/BTKXquhKMhbuetgioEU5qvJPe9N4r/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTCnJvuCqku910C9XSMM8aRvoHkqE3IjdzcQpWim5gnYuqCOIslQa99Aw6ZiK0ZQ+
	 PXdCBxjcBaLZpODtvHmkRUscMSLlI21w5G2dIirUvtXd7a2XyGiwTCaS2Lu8xRGDrm
	 IvVTqYRQyMSYcE7HXF7yUBH5v0VbbaY8n1XhBUyXaNpxr6yXtwrZITVy9sG0HM2R/Z
	 PKgJcRvjMHvC0qyMVzZ7saZADmOy2mket1wtl0uNM2x+KVPhpaJ9inVeLjdkN+DWpO
	 drecpKdaBWMnTqTptx29gQfWzyESM6nSltEiG8G/SIaAJvE2KxAZuZNcSzhA0Jc74a
	 YojLZpuWhRjAg==
Date: Tue, 20 Oct 2026 09:17:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v7] riscv: mm: Trace TLB flush requests
Message-ID: <atbBHT6vY5we4YpE@xhacker>
References: <20261019-tlb_tracepoint-v7-1-4cc3e99d387a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019-tlb_tracepoint-v7-1-4cc3e99d387a@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 07:20:51PM +0200, Roman 'Hedin' Storozhenko wrote:
> Make RISC-V TLB flush requests observable together with the
> architecture-specific context available when the request reaches
> the RISC-V implementation.
> 
> The generic tlb:tlb_flush event provides reason and page-count
> information. At the RISC-V implementation level, additional
> context is available, including the invalidation range and stride,
> ASID, target CPU mask, and invalidation scope.
> 
> This context is useful for debugging and workload analysis. The
> target CPU mask shows the address-space CPU footprint involved in
> an invalidation, while range and stride distinguish requests at
> different mapping granularities. The ASID and scope help correlate
> requests with MM, scheduler, IPI, and firmware activity.

Hi Roman,

no doubt the info is useful. But as commented in v2, the problem
is whether the information can only be gotten with tracepoints,
if no(I believe no, because the info exported by this patch are
all function parameters now), what't the benefit of it over kprobe
or function trace given the non-trivial tracepoint overhead on riscv
platforms until gcc14, and we still dunno whether newer gcc has
improved the situation or not.

So I prefer not adding this tracepoint. But let's wait for riscv
maintainers decision.

Thanks
> 
> Add riscv_tlb:riscv_tlb_flush_request in flush_tlb_all() and
> __flush_tlb_range(). Record start, size, stride, ASID (or the
> no-ASID sentinel), whether an mm is associated with the request,
> the target CPU mask and its weight, and the derived scope.
> 
> Record the complete target mask because CPU identity cannot be
> reconstructed from a count. Calculate its weight from the recorded
> bitmap so both fields agree even if mm_cpumask() changes during
> recording.
> 
> The event describes an invalidation request before dispatch. It
> does not report whether a remote flush uses SBI RFENCE or Linux
> cross-CPU coordination, since that choice is effectively established
> during initialization rather than made for each request.
> 
> The address field (start) may contain kernel virtual addresses
> for flushes involving kernel mappings. Require perf tracepoint
> permissions even for counting-only events, since perf filters
> could otherwise reveal address information through event counts.
> 
> Tested on QEMU virt with OpenSBI using local and shared-mm
> mprotect()/munmap() workloads, exercising single, range, and
> address-space invalidations. A MADV_PAGEOUT reclaim workload
> exercised global flushes. All four scope values were observed.
> 
> Confirmed that trace-cmd records the event and that perf can count
> it with sufficient privileges. With perf_event_paranoid=0,
> unprivileged attempts to count the event using perf were denied,
> as intended.
> 
> Tested local and shared-mm invalidations with
> CONFIG_UBSAN_ALIGNMENT=y on QEMU virt without tracepoint-related
> alignment warnings.
> 
> Built with and without CONFIG_PERF_EVENTS.
> 
> Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
> ---
> Add a RISC-V tracepoint for observing TLB invalidation requests
> before they are dispatched by the architecture-specific
> implementation.
> 
> The generic tlb:tlb_flush event describes TLB flush activity using
> reason and page-count information. The RISC-V event records
> additional context, including the invalidation range and stride,
> ASID, target CPU mask and its weight, and derived request scope.
> 
> This context helps correlate TLB invalidation activity with MM,
> scheduler, IPI, and firmware activity. The event describes the
> request rather than the execution backend. SBI RFENCE versus Linux
> cross-CPU coordination is effectively determined at initialization
> rather than selected independently for each request.
> 
> The target CPU mask weight is derived from the recorded bitmap to
> keep both fields consistent under concurrent mm_cpumask() updates.
> Since the address field (start) may contain kernel virtual
> addresses, the event requires perf tracepoint permissions even
> for counting-only access.
> 
> Tested on QEMU virt with OpenSBI using local and shared-mm
> mprotect()/munmap() workloads. A MADV_PAGEOUT reclaim workload
> on QEMU virt with APLIC+IMSIC exercised global flushes. All four
> scope values -- single, range, address-space, and all -- were
> observed.
> 
> Confirmed trace-cmd recording and privileged perf counting.
> With perf_event_paranoid=0, unprivileged attempts to count the
> event using perf were denied, as intended. The kernel was built
> with and without CONFIG_PERF_EVENTS.
> 
> Tested local and shared-mm invalidations with
> CONFIG_UBSAN_ALIGNMENT=y on QEMU virt without tracepoint-related
> alignment warnings.
> ---
> Changes in v7:
> - Rename the tracepoint header to asm/tlb_trace.h to make its
>   purpose explicit, as suggested by Steven Rostedt.
> - Link to v6: https://lore.kernel.org/r/20261018-tlb_tracepoint-v6-1-14476427870f@gmail.com
> 
> Changes in v6:
> - Change the scope field from u8 to u32 to ensure the dynamic
>   CPU mask is properly aligned for bitmap operations.
> - Verify local and shared-mm TLB flush tracing with
>   CONFIG_UBSAN_ALIGNMENT=y on QEMU virt.
> - Link to v5: https://lore.kernel.org/r/20261017-tlb_tracepoint-v5-1-256fb5393a7f@gmail.com
> 
> Changes in v5:
> - Move the architecture-specific trace event definition under
>   arch/riscv/, as requested by Steven Rostedt.
> - Calculate target_mask_weight from the recorded CPU mask to
>   keep both fields consistent under concurrent updates.
> - Require perf tracepoint permissions for counting-only access,
>   since the event may expose kernel virtual addresses.
> - Link to v4: https://lore.kernel.org/r/20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com
> 
> Changes in v4:
> - Drop unrelated whitespace-only changes in arch/riscv/mm/tlbflush.c.
> - Link to v3: https://lore.kernel.org/all/20261015-tlb_tracepoint-v3-1-eef305a3bb63@gmail.com/
> 
> Changes in v3:
> - Rebase on current RISC-V for-next.
> - Thanks to Jisheng Zhang for pointing out that SBI RFENCE versus Linux
>   cross-CPU coordination is effectively a system-wide choice established
>   during initialization rather than a per-request decision.
> - Drop the local/SBI RFENCE/cross-CPU path field.
> - Rename the event from riscv_tlb_flush_path to
>   riscv_tlb_flush_request and refocus it on the semantic TLB
>   invalidation request.
> - Emit one request event independently of the mechanism subsequently
>   used to perform the invalidation.
> - Address checkpatch.pl --strict alignment issues.
> - Link to v2: https://lore.kernel.org/r/20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com
> 
> Changes in v2:
> - Use trace_call__riscv_tlb_flush_path() after the explicit
>   trace_riscv_tlb_flush_path_enabled() check to avoid a second
>   tracepoint static-key test, as suggested by Steven Rostedt.
> - Link to v1: https://lore.kernel.org/r/20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com
> ---
>  arch/riscv/include/asm/tlb_trace.h | 103 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/mm/tlbflush.c           |  45 ++++++++++++++--
>  2 files changed, 144 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/tlb_trace.h b/arch/riscv/include/asm/tlb_trace.h
> new file mode 100644
> index 000000000000..60b48eb0d355
> --- /dev/null
> +++ b/arch/riscv/include/asm/tlb_trace.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM riscv_tlb
> +
> +#if !defined(_TRACE_RISCV_TLB_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_RISCV_TLB_TRACE_H
> +
> +#include <linux/cpumask.h>
> +#include <linux/tracepoint.h>
> +#include <linux/perf_event.h>
> +
> +#ifndef _TRACE_RISCV_TLB_ENUMS
> +#define _TRACE_RISCV_TLB_ENUMS
> +
> +enum riscv_tlb_flush_scope {
> +	RISCV_TLB_FLUSH_SCOPE_SINGLE,
> +	RISCV_TLB_FLUSH_SCOPE_RANGE,
> +	RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE,
> +	RISCV_TLB_FLUSH_SCOPE_ALL,
> +};
> +
> +#endif /* _TRACE_RISCV_TLB_ENUMS */
> +
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
> +
> +#define show_riscv_tlb_flush_scope(scope) \
> +	__print_symbolic(scope, \
> +		{ RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
> +		{ RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
> +		{ RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" }, \
> +		{ RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
> +
> +/*
> + * Record the invalidation request received by the RISC-V architecture code
> + *
> + * The target CPU mask represents the CPUs Linux intends to cover for the
> + * request. It can be correlated with per-CPU activity, but does not describe
> + * which harts ultimately performed an invalidation.
> + *
> + * The ASID is hardware-visible and may be reused. It must not be treated as a
> + * persistent identifier for an mm.
> + *
> + * The stride describes the invalidation granularity supplied to the RISC-V
> + * implementation.
> + *
> + * The event records the invalidation request before it is dispatched. It does
> + * not describe the mechanism used to execute the request.
> + *
> + */
> +TRACE_EVENT(riscv_tlb_flush_request,
> +	    TP_PROTO(unsigned long start, unsigned long size,
> +		     unsigned long stride, unsigned long asid, bool has_mm,
> +		     const struct cpumask *cmask,
> +		     enum riscv_tlb_flush_scope scope),
> +
> +	TP_ARGS(start, size, stride, asid, has_mm, cmask, scope),
> +
> +	TP_STRUCT__entry(__field(unsigned long, start)
> +		__field(unsigned long, size)
> +		__field(unsigned long, stride)
> +		__field(unsigned long, asid)
> +		__field(bool, has_mm)
> +		__field(unsigned int, target_mask_weight)
> +		__cpumask(target_cpus)
> +		__field(u32, scope)
> +	),
> +
> +	TP_fast_assign(__entry->start = start;
> +		__entry->size = size;
> +		__entry->stride = stride;
> +		__entry->asid = asid;
> +		__entry->has_mm = has_mm;
> +		__assign_cpumask(target_cpus, cpumask_bits(cmask));
> +		__entry->target_mask_weight = cpumask_weight((const struct cpumask *)
> +						     __get_cpumask(target_cpus));
> +		__entry->scope = scope;
> +	),
> +
> +	TP_printk("start=%#lx size=%#lx stride=%#lx asid=%#lx has_mm=%d target_mask_weight=%u target_cpus=%s scope=%s",
> +		  __entry->start, __entry->size, __entry->stride,
> +		  __entry->asid, __entry->has_mm,
> +		  __entry->target_mask_weight, __get_cpumask(target_cpus),
> +		  show_riscv_tlb_flush_scope(__entry->scope))
> +);
> +
> +#ifdef CONFIG_PERF_EVENTS
> +TRACE_EVENT_PERF_PERM(riscv_tlb_flush_request,
> +		      perf_allow_tracepoint());
> +#endif
> +
> +#endif /* _TRACE_RISCV_TLB_TRACE_H */
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +
> +#define TRACE_INCLUDE_PATH asm
> +#define TRACE_INCLUDE_FILE tlb_trace
> +
> +/* This part must be outside protection. */
> +#include <trace/define_trace.h>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 962db300a166..9dcb07fb3ac0 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -9,6 +9,9 @@
>  #include <asm/mmu_context.h>
>  #include <asm/cpufeature.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <asm/tlb_trace.h>
> +
>  #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>  
>  /*
> @@ -63,6 +66,32 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
>  }
>  
> +static enum riscv_tlb_flush_scope
> +riscv_tlb_get_flush_scope(unsigned long size, unsigned long stride, bool has_mm)
> +{
> +	if (size == FLUSH_TLB_MAX_SIZE)
> +		return has_mm ? RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE :
> +			RISCV_TLB_FLUSH_SCOPE_ALL;
> +
> +	return size <= stride ? RISCV_TLB_FLUSH_SCOPE_SINGLE :
> +		RISCV_TLB_FLUSH_SCOPE_RANGE;
> +}
> +
> +static __always_inline void
> +riscv_tlb_trace_flush_request(const struct cpumask *cmask, unsigned long start,
> +			      unsigned long size, unsigned long stride,
> +			      unsigned long asid, bool has_mm)
> +{
> +	enum riscv_tlb_flush_scope scope;
> +
> +	if (!trace_riscv_tlb_flush_request_enabled())
> +		return;
> +
> +	scope = riscv_tlb_get_flush_scope(size, stride, has_mm);
> +	trace_call__riscv_tlb_flush_request(start, size, stride, asid, has_mm,
> +					    cmask, scope);
> +}
> +
>  static void __ipi_flush_tlb_all(void *info)
>  {
>  	local_flush_tlb_all();
> @@ -70,12 +99,18 @@ static void __ipi_flush_tlb_all(void *info)
>  
>  void flush_tlb_all(void)
>  {
> -	if (num_online_cpus() < 2)
> +	riscv_tlb_trace_flush_request(cpu_online_mask, 0,
> +				      FLUSH_TLB_MAX_SIZE, 0,
> +				      FLUSH_TLB_NO_ASID, false);
> +
> +	if (num_online_cpus() < 2) {
>  		local_flush_tlb_all();
> -	else if (riscv_use_sbi_for_rfence())
> -		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
> -	else
> +	} else if (riscv_use_sbi_for_rfence()) {
> +		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
> +					   FLUSH_TLB_NO_ASID);
> +	} else {
>  		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
> +	}
>  }
>  
>  struct flush_tlb_range_data {
> @@ -105,6 +140,8 @@ static void __flush_tlb_range(struct mm_struct *mm,
>  
>  	cpu = get_cpu();
>  
> +	riscv_tlb_trace_flush_request(cmask, start, size, stride, asid, !!mm);
> +
>  	/* Check if the TLB flush needs to be sent to other CPUs. */
>  	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
>  		local_flush_tlb_range_asid(start, size, stride, asid);
> 
> ---
> base-commit: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
> change-id: 20260829-tlb_tracepoint-844105ab5092
> 
> Best regards,
> -- 
> Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
