Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BB4CCA46C
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4h6PiIOWs6Kcn2tsN6c/2y+/KG+9e8dQR3wqZOeEn9M=; b=1Y0V9Czv43GJAo
	ITI1vEQsGrYN+GLElfU5F7vlH3PPNOv62d07cCyERSp+MTvywTReE+yQd2eUDZsWw7JQCRUwss/CP
	2wKLWJZ/cFQdc6owpNGEQRufOn6LKqfcbHFECJkFpPsNWxxSuzEpakw2csy2s1mdR4cIJoYn/Qktq
	E49xg+eEzFGgRLhoJBJNR/T8u76HPk4aj1slKKEasCSQVxKbkN6NZ1PAFDq+HAZs5nwAxfmsYhPnz
	FH3yAK2cz82JZkCa71JTU/O9rvo6htTmDMZxCL5dg/4HM/S+Yxri+3UTOnopb9M1r8ARe1EdrhYbT
	vIr3WcDhdUloHcy7lhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj5E-00000003ABv-3Hfl;
	Fri, 16 Oct 2026 14:38:56 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj5B-00000003ABW-2Zg3
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 14:38:55 +0000
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id CC06F1C397F;
	Fri, 16 Oct 2026 14:38:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 37C7035;
	Fri, 16 Oct 2026 14:38:47 +0000 (UTC)
Date: Fri, 16 Oct 2026 10:38:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jisheng Zhang <jszhang@kernel.org>, Radim
 =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: mm: Trace TLB flush requests
Message-ID: <20261016103846.73ff2980@gandalf.local.home>
In-Reply-To: <20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com>
References: <20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Stat-Signature: 388ttyz9j18eu81uansk1ay3xiofhhfo
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 37C7035
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+wYhXqGOF54CpdWPBi823eLacg6whUIdM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=qC/TeNUXTBfnuw2B/KG7fIdMtKSx1rKA9Cvtcg6sjII=; b=hlv+CWMcyj3OB8DEYWzmB/LiN+sSRkkzbZ6hpI9XBmWNB4m2RYIAK9NvNoM09L/zohVfnios5SWLrc56tnb3guo/iQWKh2tgGAvXZ1p0ft//GNFvOWJ0+rKPGYsfsUW73HNUlHDU93/m5uT4SVlWYQLImar5RlopPN2K/O122Pg=
X-HE-Tag: 1792161527-868062
X-HE-Meta: U2FsdGVkX19/FZ1mNatLjECUo1AHFo5/rBna+klv4FkoAJnZCQ3gVIakjDYSSuF2hKoWvgSzJIeD4L8/iqxXinNAxX5bhYAnLc9baMwt186RBZq1Dgvnl291AabGUTyqrBhBz1pUnSfBFS2gA/KKay0MtdW4vhAH/bb4lg/bsP4FGVoOXStCsySo/ACHXdYUhtPFTy+MfhMvNtXzFkMiKl62qjMOCKU8t16YwaDOEueLxuj6V61Fp3n+wD9Z8dZnNUrTZDXvFxdwz3hh37Pex2Ub2uTNy/JaqHeqLPF+Vfs/It6EVxYBe+h1Gee8FkvX2zeC0h6HLjIlppqCSUa8du2xxempQn4QBBfA/vsAJ9/tPojf+jkaMuArT9kicMHT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_073853_724953_BD1CBA81 
X-CRM114-Status: GOOD (  18.64  )
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


[
  I realized I replied to v2 and not v4 as the thread of v2 pushed that to
  the top. I'll repeat my statement here too.
]

On Thu, 15 Oct 2026 19:32:34 +0200
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
> index 000000000000..f289480a2c0e
> --- /dev/null
> +++ b/include/trace/events/riscv_tlb.h
> @@ -0,0 +1,90 @@
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
> +		__field(u8, scope)
> +	),
> +
> +	TP_fast_assign(__entry->start = start;
> +		__entry->size = size;
> +		__entry->stride = stride;
> +		__entry->asid = asid;
> +		__entry->has_mm = has_mm;
> +		__entry->target_mask_weight = cpumask_weight(cmask);
> +		__assign_cpumask(target_cpus, cpumask_bits(cmask));
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
> +#endif /* _TRACE_RISCV_TLB_H */
> +
> +/* This part must be outside protection. */
> +#include <trace/define_trace.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
