Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C82DC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 10:49:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F8160FDA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 10:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59F8160FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOJzljzsKnSEGeBVHma6loY7BcdCNYdVY+cIxRmX3/c=; b=TFQmaUj0xFEMi/
	lEx2eUo7ApaZ0uTvwPlLmI8sf+VpSunxvoePE3NcTpl0PsTAGwr32Ek9KudXhwiu6ymN5fFC+z8Gl
	EJW2xZgj/EHTHWF19tUggw3Jqyuiil/aUB7128u1sx8yP9icJuXlTk+huuUsttoWENYhh2u1RIPwS
	xa2IVfnrvI1MQyaPZ7beUgKm7J2OFhOVSNhN1/g/BpmBK1J4fz1xDCd3sh9E8vsEef9DtxQEnRR7/
	hR4vmxQ+xj8OP+V+3kGllSOw8F1mh23cG+6cmXHAnSUwr5e8bWShLhNW0OJDrZRYPzdnh+EUQ6cPz
	EazxmPkUZOXApdJyGuZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJZPL-00CIM3-Ot; Fri, 27 Aug 2021 10:48:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJZPA-00CILd-H6; Fri, 27 Aug 2021 10:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OvP4Yc4jC04J0qjspa8OOFxuL+jnhRGg3XpJSSUjD4o=; b=dSa6gg/k/uLkIao8HV8YKHe55R
 QJNUW1DSGmJFIQkoPB+Yq9DSt+RE29HdMkm2cJByn2hw71NQjxJsEPWO+21wDTQDfhVhvu8BkQjf+
 L2krqmyZ3aAWLWTmA2aYMCQduTwu64ujYtSfjBEUhfAlVzmTqYLy4o2Ws9e1IwuEUwmRG03uA93za
 1BcwsEtY0TALxF7lF4k1iZju+DOeaUy6K5KSj20dObZE8KmsuxkJigtb+xm3AzeIgXlZyxOHnS/+B
 4KvrvAwWmfWEjBAXOKEuxfukFtVoVnSRlyFVxwDa8h8JGPBd0g9VYSiib1uZ+XvyETPfQlMGdpOrv
 2P9m3iwg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJZOS-00ESWc-Uh; Fri, 27 Aug 2021 10:47:37 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 69DD6300024;
 Fri, 27 Aug 2021 12:47:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4ECD229A12A47; Fri, 27 Aug 2021 12:47:25 +0200 (CEST)
Date: Fri, 27 Aug 2021 12:47:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Like Xu <like.xu.linux@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>,
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
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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
 Juergen Gross <jgross@suse.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 00/15] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YSjCvbWE6sZ29dPr@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <fd3dcd6c-b3d5-4453-93fb-b46d0595534e@gmail.com>
 <YSiX9OPcrDsr3P4C@hirez.programming.kicks-ass.net>
 <3bd4955a-1219-20b0-058b-d23f1e30aa77@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bd4955a-1219-20b0-058b-d23f1e30aa77@gmail.com>
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

On Fri, Aug 27, 2021 at 04:01:45PM +0800, Like Xu wrote:
> On 27/8/2021 3:44 pm, Peter Zijlstra wrote:

> > You just have to make sure all static_call() invocations that started
> > before unreg are finished before continuing with the unload.
> > synchronize_rcu() can help with that.
> 
> Do you mean something like that:
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 64e310ff4f3a..e7d310af7509 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8465,6 +8465,7 @@ void kvm_arch_exit(void)
>  #endif
>  	kvm_lapic_exit();
>  	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
> +	synchronize_rcu();
> 
>  	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
>  		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index e466fc8176e1..63ae56c5d133 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6508,6 +6508,7 @@ EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
>  int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  {
>  	perf_guest_cbs = NULL;
> +	arch_perf_update_guest_cbs();

I'm thinking the synchronize_rcu() should go here, and access to
perf_guest_cbs should be wrapped to yell when called with preemption
enabled.

But yes..

>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
> 
> > 
> > This is module unload 101. Nothing specific to static_call().
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
