Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894A6CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPpHZLBjRak3rwudDNWHGf1qcA7ixbjvWTNVfRb4TBA=; b=IUCEnHW0vxGZ1f
	wcbIz7T4k30+zvToMirSXl9a3wLoERCGEDsgu+84oGOai0p9ODCqmDm/fLD/UXpGO3QgpyN2T/4eb
	Ti5hSGbc8OsokNoOJtOhpDHKSAqkSqSlU6YsIBj/cadxzd47pPATNntTvHWhY0zySZ5CEwC78Q/xj
	cQurDpYK5KE8SMGzWgyPO/DfjiLQfX+H5M9YSizN3at4ey9D1Y6O+EatxaqCcf9K0BPCqCzvokPMw
	W7VVVBTdycR11E7T0l3EZVv2UWxN3S0rECF66woms4hVoTkzvXynYymRuS9OfZ8AhLi+4J9jcRftd
	XY6kNJvZY7hhi84khN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj34-000000039o2-1QEo;
	Fri, 16 Oct 2026 14:36:42 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj32-000000039nV-0tfz
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 14:36:41 +0000
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 07FE3A804F;
	Fri, 16 Oct 2026 14:36:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 81ACC20025;
	Fri, 16 Oct 2026 14:36:31 +0000 (UTC)
Date: Fri, 16 Oct 2026 10:36:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
Message-ID: <20261016103630.6e8fbaa5@gandalf.local.home>
In-Reply-To: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 81ACC20025
X-Stat-Signature: 5kd7xpmj94wom6f13a3nzhpwer9ppc4n
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18DQ2Sg28rgCm3NMcM3cSj9JxZ4shAURIU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=XayFsB0UYYNiwlWPoYy9LvsYKkpCk01XOKeKnrFSCsM=; b=CP9AL7U7qQNiWCIKUFoEI2HdBsLLItr3LxKsiyw+u6pPPsmUZjL0T2QK0yHC46relvDFFOVAjxnRJxu9B1qZHCKUhSkTyyR1aHWDtEvWjeczBgPZDxAYaK0FczWnEbIZlDPsnuupqs6IqvYK+WdvlPVGPhMZ0ee3cALRSbWS2Oo=
X-HE-Tag: 1792161391-659312
X-HE-Meta: U2FsdGVkX19RkqBnA8Qs0BgcO6/2vYluHNQ46qK5m5KbevaiMSVLZ2UOeBHO/zjU6+pF8Bm7OVYUXAcwW7jQ9lv1TKaNRWV82rWAIFKevurwPGTNbz+75GjslXU4d/MY3zm5bVHnrLe/m7q0Kr8oVdlxSgSoJGzvH7/Aq7/wrpjz/40UX/t385X6QsgPrJK5/OVyACPqLqdCl/ejDMyIDsV8hjAkRh7a2GhbKshAIUMUsZ9ZiL9+iD6DOM+FaWVAb9etsFd7lnP77gS9Hu5IVPn5Ggvjm0kd6WRYvnU9QX41H0dOzo62ArdL6P3Bk0LGnx2E0dS2RkKVek+CLqaJ9D9+NcMTu7EN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_073640_333594_9FC6BD77 
X-CRM114-Status: GOOD (  18.49  )
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

On Sun, 30 Aug 2026 16:36:37 +0200
Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:

> diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/riscv_tlb.h

Please do not put architecture specific events in include/trace.

They belong in the architecture.

See the example code in samples/trace_events/trace-events-sample.[ch]
as well as the Makefile there on how to put trace events in directories
outside of include/trace/

Thanks,

-- Steve

> new file mode 100644
> index 000000000000..3eff171ec54f
> --- /dev/null
> +++ b/include/trace/events/riscv_tlb.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM riscv_tlb
> +
> +#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_RISCV_TLB_H
> +
> +#include <linux/cpumask.h>
> +#include <linux/tracepoint.h>
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
> +enum riscv_tlb_flush_path {
> +	RISCV_TLB_FLUSH_PATH_LOCAL,
> +	RISCV_TLB_FLUSH_PATH_SBI_RFENCE,
> +	RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL,
> +};
> +
> +#endif /* _TRACE_RISCV_TLB_ENUMS */
> +
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
> +
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_LOCAL);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
> +
> +#define show_riscv_tlb_flush_scope(scope) \
> +	__print_symbolic(scope, \
> +		{ RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
> +		{ RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
> +		{ RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" }, \
> +		{ RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
> +
> +#define show_riscv_tlb_flush_path(path) \
> +	__print_symbolic(path, \
> +		{ RISCV_TLB_FLUSH_PATH_LOCAL,          "local" }, \
> +		{ RISCV_TLB_FLUSH_PATH_SBI_RFENCE,     "sbi-rfence" }, \
> +		{ RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL, "cross-cpu-call" })
> +
> +/*
> + * Record the invalidation request received by the RISC-V architecture code
> + * and the path selected by Linux.
> + *
> + * The target CPU mask represents the CPUs Linux intends to cover for the
> + * request. It can be correlated with per-CPU activity, but does not describe
> + * which harts ultimately performed an invalidation.
> + *
> + * The ASID is hardware-visible and may be reused. It must not be treated as a
> + * persistent identifier for an mm.
> + *
> + * The stride describes the invalidation granularity supplied to the RISC-V
> + * implementation. SBI RFENCE receives start, size and ASID, but not stride.
> + *
> + * The event is emitted at path selection time. For SBI RFENCE, it records
> + * delegation of the request to firmware; firmware processing after that
> + * point is outside the event's scope.
> + */
> +TRACE_EVENT(riscv_tlb_flush_path,
> +	TP_PROTO(unsigned long start, unsigned long size,
> +		 unsigned long stride, unsigned long asid, bool has_mm,
> +		 const struct cpumask *cmask,
> +		 enum riscv_tlb_flush_scope scope,
> +		 enum riscv_tlb_flush_path path),
> +
> +	TP_ARGS(start, size, stride, asid, has_mm, cmask, scope, path),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned long, start)
> +		__field(unsigned long, size)
> +		__field(unsigned long, stride)
> +		__field(unsigned long, asid)
> +		__field(bool, has_mm)
> +		__field(unsigned int, target_mask_weight)
> +		__cpumask(target_cpus)
> +		__field(u8, scope)
> +		__field(u8, path)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->start = start;
> +		__entry->size = size;
> +		__entry->stride = stride;
> +		__entry->asid = asid;
> +		__entry->has_mm = has_mm;
> +		__entry->target_mask_weight = cpumask_weight(cmask);
> +		__assign_cpumask(target_cpus, cpumask_bits(cmask));
> +		__entry->scope = scope;
> +		__entry->path = path;
> +	),
> +
> +	TP_printk("start=%#lx size=%#lx stride=%#lx asid=%#lx has_mm=%d target_mask_weight=%u target_cpus=%s scope=%s path=%s",
> +		  __entry->start, __entry->size, __entry->stride,
> +		  __entry->asid, __entry->has_mm,
> +		  __entry->target_mask_weight, __get_cpumask(target_cpus),
> +		  show_riscv_tlb_flush_scope(__entry->scope),
> +		  show_riscv_tlb_flush_path(__entry->path))
> +);
> +
> +#endif /* _TRACE_RISCV_TLB_H */
> +
> +/* This part must be outside protection. */
> +#include <trace/define_trace.h>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
