Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE0BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 21:38:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4309360F26
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 21:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4309360F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHEdE7rYtE2JRkBL+hFhUPbZTbHRPJrhnX65oPIJ5Tw=; b=I4ABjIQzSGczGo
	pezL3ltQKy/ehGYtxLcphyEr+QNP44bYN5kOjfHEA4VArKP4u1ErSWkdYcpupOOBdITftipZ3FPsx
	wTWGrwwKFJKqBrjAb3CQvjdFMNga8uCIdEWZuWIMrmXlkxAej9sCfPIo7PIrm+eoG2xjEJa/WJoFO
	eb5GmKfWsvB4SXWi0cjBPuTunmb4Iw0UfahifBsCgedoXTg8mhxjMYdyUHkmOfFLCOkwm+P+NnI75
	5zI/hT8w5BhK4bYFPBuEUR986ge1Lc5IzmQzR7UFP+l+xvU6oixKnEwJFFr51V1gxP1Di1HzLeyc0
	s3GP05Mm+Mfr2B+dx0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQz4t-00CQVb-Ht; Thu, 16 Sep 2021 21:37:55 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQz4q-00CQUD-JZ
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 21:37:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id bg1so4739522plb.13
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 14:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HRmclIUd+IXQYZmIP/8HeB41v2sSRX/lMU3hqPZHzVc=;
 b=Y5uK5usJpzBqYTtETIZzqzrlpEcCGhV1j72nBokzqPxRHfzfqcv9p8/VHqtByMLMa0
 7qnKk2mXRWZ/QVGLWlLUF5fmAtrANk6SVsEq1yvp8Onbj0l+EW2VdhbQ4ssaqq3XvXG+
 UIKM1VSQcdm2YELLCqHTNz0YRbJwYR+FmuDGCbuEaAumq4dsS2jCwrqpahV4jYDPFBXn
 +EFOprbkB9HNvtLDp/UkAPEYfLhp0RIxcvNz5Sev+mrGTECnwFfzaEXBv/uyDuKWSXl9
 MKEl69zQIthFjeiLPFYtD50iSHjTDfTtVEJ8PfVuNwd6e3VXHqiBdyMOjirUU+xrvFcM
 TwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HRmclIUd+IXQYZmIP/8HeB41v2sSRX/lMU3hqPZHzVc=;
 b=Y0jn8DVFv0ASAIwaFylimHU37SiSGMrUujtv9ombMrqKtBFHvrEjG90Qv2QcszxjIw
 jhdCzYTMHbDRvmTZXd1lR1xNK/si7tPf8nL96ZUxsKgog2JRSGu5OAcCsFEdYM481WaY
 vrWf2kgRp9CCNvNSipgTbVvr6eA73Q6Mjgln6ee9iupgNe6BvovVZyeLnY0z4YJ3tDiG
 gN8hY4TIfwFKINGjQzECCxrxF4lfBZI/AjVKTWZuqjT6t0hsy6NV1mIV6iqVHKKNKfhD
 ECSlsD8+TYiugq7RsYsuTFKHfE8mheFWaqtyopQoRoBRo+YBA+boz4urRa8se5zwmp6q
 t4xQ==
X-Gm-Message-State: AOAM530o1i3U7kYHd+zBoSIRufqEFTI/v0M+oCUneznD5sovy1HuMIj9
 8C81lIjFteKTe8u1S2D65Vvdwg==
X-Google-Smtp-Source: ABdhPJxrNs7jIZy34jmkRTyON4Y+9pNnsbkx7GECTLo7e1rXLwAWohi0Xxo5Jb11PEVRFoL9wO4HSQ==
X-Received: by 2002:a17:90b:1291:: with SMTP id
 fw17mr6609537pjb.135.1631828268138; 
 Thu, 16 Sep 2021 14:37:48 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t15sm4013977pgk.13.2021.09.16.14.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 14:37:47 -0700 (PDT)
Date: Thu, 16 Sep 2021 21:37:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YUO5J/jTMa2KGbsq@google.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828201336.GD4353@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828201336.GD4353@worktop.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_143752_679393_60BF3877 
X-CRM114-Status: GOOD (  19.31  )
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

On Sat, Aug 28, 2021, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 05:35:45PM -0700, Sean Christopherson wrote:
> > Like Xu (2):
> >   perf/core: Rework guest callbacks to prepare for static_call support
> >   perf/core: Use static_call to optimize perf_guest_info_callbacks
> > 
> > Sean Christopherson (11):
> >   perf: Ensure perf_guest_cbs aren't reloaded between !NULL check and
> >     deref
> >   KVM: x86: Register perf callbacks after calling vendor's
> >     hardware_setup()
> >   KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
> >     guest
> >   perf: Stop pretending that perf can handle multiple guest callbacks
> >   perf: Force architectures to opt-in to guest callbacks
> >   KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
> >     variable
> >   KVM: x86: More precisely identify NMI from guest when handling PMI
> >   KVM: Move x86's perf guest info callbacks to generic KVM
> >   KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
> >   KVM: arm64: Convert to the generic perf callbacks
> >   KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c /
> >     pmu.c

Argh, sorry, I somehow managed to miss all of your replies.  I'll get back to
this series next week.  Thanks for the quick response!

> Lets keep the whole intel_pt crud inside x86...

In theory, I like the idea of burying intel_pt inside x86 (and even in Intel+VMX code
for the most part), but the actual implementation is a bit gross.  Because of the
whole "KVM can be a module" thing, either the static call and __static_call_return0
would need to be exported, or a new register/unregister pair would have to be exported.

The unregister path would also need its own synchronize_rcu().  In general, I
don't love duplicating the logic, but it's not the end of the world.

Either way works for me.  Paolo or Peter, do either of you have a preference?

> ---
> Index: linux-2.6/arch/x86/events/core.c
> ===================================================================
> --- linux-2.6.orig/arch/x86/events/core.c
> +++ linux-2.6/arch/x86/events/core.c
> @@ -92,7 +92,7 @@ DEFINE_STATIC_CALL_RET0(x86_pmu_guest_ge
>  
>  DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
>  DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
> -DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
> +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, unsigned int (*)(void));

FWIW, the param needs to be a raw function, not a function pointer. 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
