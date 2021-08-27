Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D5DC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 08:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFE560E93
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 08:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCFE560E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGaRnbyD0La8EMyKVwzm/3k2Mcg+tJIefcgeQn85jJA=; b=D6af2EKfcq/kAWekOi0n4AqGto
	XCbP1K3dgmGl0wPB7BXZARYcS4+wiT+4L8J4QQCzyQfLlm6mRbObl1Pjcmw4bN3Z1OLktUPayI2b8
	0UyCssDDAk0MFH7pys40XtOcduwxiTeE1rhyteRg3xdc6QkBwOKh4KnFjTWkHmY9xM/Z1ZvHukCZP
	k5WPK/xWfj2z0PcDVKVwihUDgkPSrWfsiMyIlpL9z35T2rdUctMqlAKm7lRVhSis73Mqfyd0B//gm
	sz8wNWmhBHN54d2cjsR5D3VrlisOGxFjzAxHBvQJFTF95FdxVkLQK5wMrMsJbmd0GcOaOm0aulXad
	P0mAwbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJWoR-00Bune-Hs; Fri, 27 Aug 2021 08:02:07 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWoN-00Bulm-Da; Fri, 27 Aug 2021 08:02:06 +0000
Received: by mail-pg1-x536.google.com with SMTP id y23so5330943pgi.7;
 Fri, 27 Aug 2021 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cswhnu+o8kyBBIxzcLABF5rjUJeD7g9ZDLkYCWGDY3Y=;
 b=OqohcBTPo1bx+g+Uhy5kq56l7yUOxLEugEOLnrrHFGOE9q6fl4GSY8Z1g4cy28v8/H
 /L1w4p4Sg8b+ljDLiH9Gb1+GZJmzWV6ysvxelEZyI9D8Ew3G/bqelIPClmFt9as7aEEu
 nk0NoXFPWc3E70qTNobmYIJyHjN8UsaDJ8PQd9G9IThDwB0Rbm6047rMIfrYiIaoPol8
 83YdQMipI9Ef5oiCjCXNrqRhdPiM1lKbwLomBu4t1pdAiwluLh1kv3kaFwWDZpIPSD+6
 7uC9Sledzc7uwLe6e/cdddOBkwHJ7y8MIBF8ETXjcZo+yjuo33qz1BEAi+Qpk6kRxoes
 Y0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Cswhnu+o8kyBBIxzcLABF5rjUJeD7g9ZDLkYCWGDY3Y=;
 b=sKSe/DUc52ZPyofXaFlP4sAxGh83zJF5tjdkAdNM7GG4HhgKUo4YM4P33vSPc7eC46
 X3C1ocRMLp+w3dnrA++DQuzPgUmxhQWF+WrG+C+I4ycbSnpK/8pmE2L+Tx2IsqTQ/EY7
 UtG0HJ0B0OPehZvh0zhIshjbXUsaYSGLt1hJWzEB7WWUZ3xNLQyVMqwkTDQswh6ak6P2
 3546zDk48qyVrrzUGVLWDCugEaBQ8HmXyBf8qJEJeCNJrmI8D811lhjJ8RxFwzqt39OD
 vtW9F+UhSDQfvI9FlIa/7EZ8HF/+jJl6BBHypG7leJBHbn59GLGvcorZXHicztUn0sxx
 NiEA==
X-Gm-Message-State: AOAM530OkFDir/l7sXe0wkwkDnv5mU395/AL9NYAvz0Tr0GDI1kTuE7U
 0p77xW2fnz/qJHcGf405Fu0=
X-Google-Smtp-Source: ABdhPJz93kkIvT1VtOeM07aufGlsPC5VcsFoOF9FFZYwZ3Du0G+C1ytyrpDJPIrEyio9g37sV046Cg==
X-Received: by 2002:a05:6a00:1748:b0:3e2:ace4:82b7 with SMTP id
 j8-20020a056a00174800b003e2ace482b7mr7814214pfc.56.1630051322226; 
 Fri, 27 Aug 2021 01:02:02 -0700 (PDT)
Received: from Likes-MacBook-Pro.local ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id d15sm5390883pfd.115.2021.08.27.01.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 01:02:01 -0700 (PDT)
Subject: Re: [PATCH 00/15] perf: KVM: Fix, optimize, and clean up callbacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20210827005718.585190-1-seanjc@google.com>
 <fd3dcd6c-b3d5-4453-93fb-b46d0595534e@gmail.com>
 <YSiX9OPcrDsr3P4C@hirez.programming.kicks-ass.net>
From: Like Xu <like.xu.linux@gmail.com>
Organization: Tencent
Message-ID: <3bd4955a-1219-20b0-058b-d23f1e30aa77@gmail.com>
Date: Fri, 27 Aug 2021 16:01:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSiX9OPcrDsr3P4C@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_010203_517973_58E02982 
X-CRM114-Status: GOOD (  22.43  )
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

On 27/8/2021 3:44 pm, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 02:52:25PM +0800, Like Xu wrote:
>> + STATIC BRANCH/CALL friends.
>>
>> On 27/8/2021 8:57 am, Sean Christopherson wrote:
>>> This started out as a small series[1] to fix a KVM bug related to Intel PT
>>> interrupt handling and snowballed horribly.
>>>
>>> The main problem being addressed is that the perf_guest_cbs are shared by
>>> all CPUs, can be nullified by KVM during module unload, and are not
>>> protected against concurrent access from NMI context.
>>
>> Shouldn't this be a generic issue of the static_call() usage ?
>>
>> At the beginning, we set up the static entry assuming perf_guest_cbs != NULL:
>>
>> 	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr) {
>> 		static_call_update(x86_guest_handle_intel_pt_intr,
>> 				   perf_guest_cbs->handle_intel_pt_intr);
>> 	}
>>
>> and then we unset the perf_guest_cbs and do the static function call like this:
>>
>> DECLARE_STATIC_CALL(x86_guest_handle_intel_pt_intr,
>> *(perf_guest_cbs->handle_intel_pt_intr));
>> static int handle_pmi_common(struct pt_regs *regs, u64 status)
>> {
>> 		...
>> 		if (!static_call(x86_guest_handle_intel_pt_intr)())
>> 			intel_pt_interrupt();
>> 		...
>> }
> 
> You just have to make sure all static_call() invocations that started
> before unreg are finished before continuing with the unload.
> synchronize_rcu() can help with that.

Do you mean something like that:

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 64e310ff4f3a..e7d310af7509 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8465,6 +8465,7 @@ void kvm_arch_exit(void)
  #endif
  	kvm_lapic_exit();
  	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	synchronize_rcu();

  	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
  		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
diff --git a/kernel/events/core.c b/kernel/events/core.c
index e466fc8176e1..63ae56c5d133 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6508,6 +6508,7 @@ EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
  int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
  {
  	perf_guest_cbs = NULL;
+	arch_perf_update_guest_cbs();
  	return 0;
  }
  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);

> 
> This is module unload 101. Nothing specific to static_call().
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
