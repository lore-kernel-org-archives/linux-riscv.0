Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF2DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:27:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4A161178
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A4A161178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht94ctJm4a1zJC9+0Xo/RuuaNUoYsipLx/AjD/Zuamc=; b=RoT94L8XI7lIdXL0n7wmuaq4RN
	IVZobc6dXKFs4PUI2CxYG8sPyDIG34+2jVMo6K54LiUxwqTbwh6WBHP3iNcSPTR+G0HxYwgz5G7BL
	yL8WHdkUm5ygNGKzbPpgVHq39Tu5z9J5GEQKlGRXVA65oixOI75CZhyKMP4QJwsU/f7TrNKd79JLl
	Xrx37w3k7j/Ri8freJ1bTiehbqF9ombuVxlJfWUqTQQ178Pt26Qe5QL42GoNzqg/Wxt4BHcwUhjgz
	rwpgC9JQOJKVWSfhUJJeVmgUo0Bcp+Yt16k4HpPdFAfnhu3AsQgTwSwRVrZ5rU5wVFx72ASJdk2kr
	XCIuTAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSvib-0072TI-5l; Wed, 22 Sep 2021 06:26:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSviM-0072OS-09
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 06:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632292001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBiMg3FiniiEqjDXbzG5q84o5gFLCF2xYeMjdShm8Ns=;
 b=NjZoaQ0my/tx8rzWjW2wP2lIyMTmSO3AuR1zCzqDaPqaF1kSWTqm1ZecTsXlpOdq66tKEW
 qzsDk0FMMhLaGIA52XJd0w/JrRrc9HpxPwvBKsyTmrLwf5t6zpOmdhT1Sl+gC9p8hHX2ur
 o+lVIvwWKSQSRL80tNfonG8T+Lr7S38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-Wb6twQDyNpSmeLeVOkp8lQ-1; Wed, 22 Sep 2021 02:26:36 -0400
X-MC-Unique: Wb6twQDyNpSmeLeVOkp8lQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i4-20020a5d5224000000b0015b14db14deso1095725wra.23
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 23:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MBiMg3FiniiEqjDXbzG5q84o5gFLCF2xYeMjdShm8Ns=;
 b=vrtVVSehNuE9X5+7qN3lZr5oaKlr5dypr4F2nevcOY/qQ0OHKcIGsMCWftl8b+gNGU
 h+65/4fWlHDy1kU5k5HBiwpX+MKUrPbT9ep/sJ8kAbZSsqrAjetS1R+7a8xpsQz8fZed
 ifu9nL9vFrV652g41r8lgWQhMxffRYxX3J723YojELJSqzBzKJQVRFQuwgu4pnQyXh3V
 +S/giIlxDAz+v6e6yU1XbY3uu2X3JiNOnj781LMQYaqPQNLmbRw8LlvNyMJhO429E5qw
 nmVt2Jfwt+AB7Vf+jvDdubcpIcaqONTWLMXQrpXZTDaBBUa8l8alYBaPirampRKj3R3Y
 th0g==
X-Gm-Message-State: AOAM533n1H9g4c+lCkyZLCYfMNAvCOE5sRuU/06CxdzXX0+gpFQNI879
 ZV/zV/jRlj5PbjF3zJ+CYQ9vUPFwO7zhSUwlGKlnABmItdQUTnvusYohR1XoJU0gr99LV6AvdLo
 53MDMlYv+NLBGwwCW0E1SYYqUS5D6
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr39082841wru.243.1632291995509; 
 Tue, 21 Sep 2021 23:26:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl20akxP3NXahRl1WcHnQKmZ1IfpNcPRYFb7QcuxtqBG6hCoEWyeXUt8EoPViJOjXQwzqFiA==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr39082789wru.243.1632291995216; 
 Tue, 21 Sep 2021 23:26:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm1326977wrx.81.2021.09.21.23.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:26:34 -0700 (PDT)
Subject: Re: [PATCH v3 05/16] perf: Drop dead and useless guest "support" from
 arm, csky, nds32 and riscv
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-6-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2462bc44-64a5-8bac-7c3c-d837c4b3f743@redhat.com>
Date: Wed, 22 Sep 2021 08:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-6-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_232642_145237_5D81ACA8 
X-CRM114-Status: GOOD (  24.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 22/09/21 02:05, Sean Christopherson wrote:
> Drop "support" for guest callbacks from architctures that don't implement
> the guest callbacks.  Future patches will convert the callbacks to
> static_call; rather than churn a bunch of arch code (that was presumably
> copy+pasted from x86), remove it wholesale as it's useless and at best
> wasting cycles.
> 
> A future patch will also add a Kconfig to force architcture to opt into
> the callbacks to make it more difficult for uses "support" to sneak in in
> the future.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm/kernel/perf_callchain.c   | 33 ++++-------------------------
>   arch/csky/kernel/perf_callchain.c  | 12 -----------
>   arch/nds32/kernel/perf_event_cpu.c | 34 ++++--------------------------
>   arch/riscv/kernel/perf_callchain.c | 13 ------------
>   4 files changed, 8 insertions(+), 84 deletions(-)
> 
> diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
> index 1626dfc6f6ce..bc6b246ab55e 100644
> --- a/arch/arm/kernel/perf_callchain.c
> +++ b/arch/arm/kernel/perf_callchain.c
> @@ -62,14 +62,8 @@ user_backtrace(struct frame_tail __user *tail,
>   void
>   perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct frame_tail __user *tail;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
> -
>   	perf_callchain_store(entry, regs->ARM_pc);
>   
>   	if (!current->mm)
> @@ -99,44 +93,25 @@ callchain_trace(struct stackframe *fr,
>   void
>   perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct stackframe fr;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
> -
>   	arm_get_current_stackframe(regs, &fr);
>   	walk_stackframe(&fr, callchain_trace, entry);
>   }
>   
>   unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
> -
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return guest_cbs->get_guest_ip();
> -
>   	return instruction_pointer(regs);
>   }
>   
>   unsigned long perf_misc_flags(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	int misc = 0;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		if (guest_cbs->is_user_mode())
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> +	if (user_mode(regs))
> +		misc |= PERF_RECORD_MISC_USER;
> +	else
> +		misc |= PERF_RECORD_MISC_KERNEL;
>   
>   	return misc;
>   }
> diff --git a/arch/csky/kernel/perf_callchain.c b/arch/csky/kernel/perf_callchain.c
> index 35318a635a5f..92057de08f4f 100644
> --- a/arch/csky/kernel/perf_callchain.c
> +++ b/arch/csky/kernel/perf_callchain.c
> @@ -86,13 +86,8 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
>   void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   			 struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	unsigned long fp = 0;
>   
> -	/* C-SKY does not support virtualization. */
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return;
> -
>   	fp = regs->regs[4];
>   	perf_callchain_store(entry, regs->pc);
>   
> @@ -111,15 +106,8 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   			   struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct stackframe fr;
>   
> -	/* C-SKY does not support virtualization. */
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		pr_warn("C-SKY does not support perf in guest mode!");
> -		return;
> -	}
> -
>   	fr.fp = regs->regs[4];
>   	fr.lr = regs->lr;
>   	walk_stackframe(&fr, entry);
> diff --git a/arch/nds32/kernel/perf_event_cpu.c b/arch/nds32/kernel/perf_event_cpu.c
> index f38791960781..a78a879e7ef1 100644
> --- a/arch/nds32/kernel/perf_event_cpu.c
> +++ b/arch/nds32/kernel/perf_event_cpu.c
> @@ -1363,7 +1363,6 @@ void
>   perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   		    struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	unsigned long fp = 0;
>   	unsigned long gp = 0;
>   	unsigned long lp = 0;
> @@ -1372,11 +1371,6 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   
>   	leaf_fp = 0;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
> -
>   	perf_callchain_store(entry, regs->ipc);
>   	fp = regs->fp;
>   	gp = regs->gp;
> @@ -1480,13 +1474,8 @@ void
>   perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   		      struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct stackframe fr;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
>   	fr.fp = regs->fp;
>   	fr.lp = regs->lp;
>   	fr.sp = regs->sp;
> @@ -1495,32 +1484,17 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   
>   unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
> -
> -	/* However, NDS32 does not support virtualization */
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return guest_cbs->get_guest_ip();
> -
>   	return instruction_pointer(regs);
>   }
>   
>   unsigned long perf_misc_flags(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	int misc = 0;
>   
> -	/* However, NDS32 does not support virtualization */
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		if (guest_cbs->is_user_mode())
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> +	if (user_mode(regs))
> +		misc |= PERF_RECORD_MISC_USER;
> +	else
> +		misc |= PERF_RECORD_MISC_KERNEL;
>   
>   	return misc;
>   }
> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
> index 8ecfc4c128bc..1fc075b8f764 100644
> --- a/arch/riscv/kernel/perf_callchain.c
> +++ b/arch/riscv/kernel/perf_callchain.c
> @@ -56,13 +56,8 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
>   void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   			 struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	unsigned long fp = 0;
>   
> -	/* RISC-V does not support perf in guest mode. */
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return;
> -
>   	fp = regs->s0;
>   	perf_callchain_store(entry, regs->epc);
>   
> @@ -79,13 +74,5 @@ static bool fill_callchain(void *entry, unsigned long pc)
>   void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   			   struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
> -
> -	/* RISC-V does not support perf in guest mode. */
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		pr_warn("RISC-V does not support perf in guest mode!");
> -		return;
> -	}
> -
>   	walk_stackframe(NULL, regs, fill_callchain, entry);
>   }
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
