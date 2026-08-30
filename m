Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA335C61DDE
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRsEI1ZJtmkQ6KUV6qd6F0Wx/DrUM0DyUCuF5+KRbu0=; b=E+XmybwNneDnxc
	D/eKfwO0+Ayi/fwELleouRv+1zbA8Lp/OlPJSKyL8g1dBMCA7OcGkQKMK/L1Vh/QOblZAI8yjg5cJ
	WUhJXChUdB/CSCnbPTe6GicyK10bi415JMvF1yi7Z3fdFywBDrYlsTTPMChmuzKZ4rAgc4lJR7VT9
	c6d9BXafxiGpvYjG/yFg/VfD/knOR6W9HxSeCjWfcnAxtEnIulupLZ/jlCKTJwvX++i7ySu/1yKJO
	2N6zW8gKP6v4rHcj8kKzT8uEb8fZJQr1bV5GSHyYR/T6PPE9Y+Sh7EeWK5rV7jmlWnCheNLNBRHgt
	uKuIEWbh0N9klhvBOZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0UFS-00000007Pdy-3lTR;
	Sun, 30 Aug 2026 01:22:14 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0UFP-00000007PdU-2LC7
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 01:22:13 +0000
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 209E4C01FB;
	Sun, 30 Aug 2026 01:22:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id E36492002D;
	Sun, 30 Aug 2026 01:22:03 +0000 (UTC)
Date: Sat, 29 Aug 2026 21:22:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Trace TLB flush path selection
Message-ID: <20260829212202.57db49ca@robin>
In-Reply-To: <20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com>
References: <20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Stat-Signature: ukqctwoyphodb13xzayqebz7r4f4dmek
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: E36492002D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/sqVK0fFooPR1itamYVWNSbX7CA3T24RY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=4sRIP04b9wK9VjtW1o66xTIPvzY/H2UE5MvlBWnKKPA=; b=aUszwaZcQphe/6RW9aC3DbZu7MgM5/QL73IiMyklaB2N9HFhtstT3ZO7M7kLXfT9PvYJ/xw4Wm96RKVVFNXOazvTMx3QGArSu2Ow8bsLHMPdvwwTMA3xoRD4SDH0QYAhlurMTpAXISJOsiVVK+NdX5z1IP1hgqw+r3HfMLYXUFE=
X-HE-Tag: 1788052923-607629
X-HE-Meta: U2FsdGVkX1/wQ+Oy6cCSBIUf39XP6U3b3Q63hB4YOQx2PzNY3F5HuBYUg3xu8fpdaMceW8EDr1Ht9QoMe7RjrFymxjxRR9SkxVn7s+pAmzieKjq7CDgqI7gRwRWymf2iNNrhkFLK+RaaPOJ7aSMnsIPsMRRrBwZxz8PZ15/oWaWaYJ1XLnjywIbxOrBam8ga6izc20V5RXF2re5X0mD0osJwtbVqIZ9sncZvCYwDZki8dyw7rZJFrcZK92QBfQiinedxY9N2N6tDxBMD3cQy5HNebtqnC2GUCNVpvfXdDT6dXoyq2FaMw5pOay+rscGtIhBXvWscl1Bez+1Er4SdnxBKH9PrYGVT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_182211_669542_2F3CE623 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Sat, 29 Aug 2026 17:44:18 +0200
Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:

> +static __always_inline void
> +riscv_tlb_trace_flush_path(const struct cpumask *cmask, unsigned long start,
> +			   unsigned long size, unsigned long stride,
> +			   unsigned long asid, bool has_mm,
> +			   enum riscv_tlb_flush_path path)
> +{
> +	enum riscv_tlb_flush_scope scope;
> +
> +	if (!trace_riscv_tlb_flush_path_enabled())
> +		return;
> +
> +	scope = riscv_tlb_get_flush_scope(size, stride, has_mm);
> +	trace_riscv_tlb_flush_path(start, size, stride, asid, has_mm, cmask,
> +				   scope, path);

instead of using two static calls you can use the new:

   trace_call__riscv_tlb_flush_path()

That is to be used instead of the trace_<event>() if it's behind a
trace_<event>_enabled() check. That is because the
trace_call__<event>() will always trigger the trace event logic because
it should only be called when the trace event was enabled.

-- Steve


> +}
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
