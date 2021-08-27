Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABA5C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C5A60FD8
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94C5A60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+s/q0pTM1505zQUYpROAbTYFsl1IvsSYM/zFOqwY8Dc=; b=gHbB5sRHY9eWO1
	WTxrJ+A1ggsZQ5Zd/EPfXASbCneklx+sA1NaAHrHZ1nJhqvtS1l4elHzh44cigeI5nTivirtmbP83
	dV5NZ2gRguxJx3/PABwBHFLaNzPICQeMESFZZs677hTiBHRmtYekxv5yykKEhc3FAVnuVPNsYhRxF
	Y4upPvYIzOkZaz94uWgZx1tw1QIYbqcc4lJ5ZbWqRNq2dp1DCFF+6vVnQ207ID2SWA+cI7K6j0Aog
	txaI8If+pms2UIEXGZdPE+4WJ2REZVTFb/Liz9nYXvdGrxP5tD3et/mkGb3r6JWPFMa0mO95WbJy+
	KXJXWS5Y9HJpl5LoXrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJWCn-00Bq1e-4k; Fri, 27 Aug 2021 07:23:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWCa-00Bpzm-Lj; Fri, 27 Aug 2021 07:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=neG8mg28UHUzHJK70IF++gxfO1zx12p3aLda6nUX0F8=; b=AukJ9GkzIV3P3F+0ekocwQawBL
 tFlCkXpct0NjVzxDAYN3qp6dW8DFOR5++b6oO+2oFghCLwWlQldR9xUKOxe6O9xGeZ3SF85D2ScKC
 RFt1tMii/X4MA5Hvk4XKVnCAHMtwMT7KO94Zi39lswz81eHv7+EWswbpXCxLYyjwAhehjD4Pj9zhD
 /QGUZAd7iD4iU9YTu64FgKEGL0luhMV0hc4vrnvpZFSqjXRBBxUSDax4g0UrRpI2dleksB66sSbSW
 I8F5HQkpMUSSv+Lz7wFRfoB+E5euI/bbEB/SVUaXfnNNAHO9evgCgJrPXZXun2y+vLo5dnB1ozeVf
 G62jQfjw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWBM-00EFSX-VT; Fri, 27 Aug 2021 07:22:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A41C630035D;
 Fri, 27 Aug 2021 09:21:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 80EAF2C6670E9; Fri, 27 Aug 2021 09:21:43 +0200 (CEST)
Date: Fri, 27 Aug 2021 09:21:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH 06/15] KVM: x86: Register perf callbacks only when
 actively handling interrupt
Message-ID: <YSiShwJeBvAVPVKe@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-7-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827005718.585190-7-seanjc@google.com>
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

On Thu, Aug 26, 2021 at 05:57:09PM -0700, Sean Christopherson wrote:
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 9bc1375d6ed9..2f28d9d8dc94 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6485,6 +6485,18 @@ static void perf_pending_event(struct irq_work *entry)
>  #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
>  DEFINE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
>  
> +void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> +{
> +	__this_cpu_write(perf_guest_cbs, cbs);
> +}
> +EXPORT_SYMBOL_GPL(__perf_register_guest_info_callbacks);
> +
> +void __perf_unregister_guest_info_callbacks(void)
> +{
> +	__this_cpu_write(perf_guest_cbs, NULL);
> +}
> +EXPORT_SYMBOL_GPL(__perf_unregister_guest_info_callbacks);

This is 100% broken, and a prime example of why I hate modules.

It provides an interface for all modules, and completely fails to
validate even the most basic usage.

By using __this_cpu*() it omits the preemption checks, so you can call
this with preemption enabled, no problem.

By not checking the previous state, multiple modules can call this
interleaved without issue.

Basically assume any EXPORTed function is hostile, binary modules and
out-of-tree modules *are* just that. It's a cesspit out there.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
