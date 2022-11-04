Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D2FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fnTzcpyALYWsHsLx2GTAlz49i5iZovmpq3xug6P/0U=; b=B2hmai0x+vQWvJ
	+X8WDR97GeRAyRQTkc1pDigKbP1HYmJZ8DDO/46tlY2tVF1DDlwy0GSaE2YrrIdiaHtEeVS6aMwzM
	EN5MQn2lpSmhLC+/WZgVGjZpoUza+ChMNV/qWDDqsaZDuANxqFUFqQ12LIKMhxUqlwvSGF8OSoyhx
	wVN2ia0InBC9sWTrUu+oXPaTBTNGrqqUCUOYv8xu1P4JyEHxd8YLXA0kT0+ldS4kYHtcNfebwd9/R
	I/Iknod+gao7mi7NXVYMLuw9LfS0YUCES+mbB0Q6qnlXeKskIfx3ZcayXrtu0gLhd1bbJP5d4tiPN
	C+Fg4TZ5u47fju+yZ9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzbS-004RDL-TC; Fri, 04 Nov 2022 16:31:35 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzbQ-004RCF-GS
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 16:31:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id q1so4786457pgl.11
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tykh0C7NQoqMsiv0FEJ8nDBTc1ar6j/4SljcpXaw+gg=;
        b=ZvfqWRbmiygXbQlvUXzlFPIy6pWgi3NnbKZ9axUfvTwSG1jmeczFdzfmEBk6JPul9u
         KtfoNDPD7+7L7ckLKxE85H3i30VZE1cLcwZqr+9Pmyt/Uvr0gsenysKMrttjRd1DNmYa
         taHLNc4BlGL4LuS+a5zOzje7JmI5lr7pLr83tPoJKPDxZ+8mRqo1TUsZIcKB3+pLirGc
         61VotfoTC994tXlc+pHq0IWsR3SGM7VfiO/hK89Ek0CoqTLSvnWOMLSW6BMMx8STYHyn
         tAWojTUjFC5IOfCMzJ25ZkS53CsxfaYW+If16SDvap+gn/hFvgnPNsAIXJ/ZXr/CVgup
         nXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tykh0C7NQoqMsiv0FEJ8nDBTc1ar6j/4SljcpXaw+gg=;
        b=2GpcszoS5wxvZ/ABmwbETWVeopU/9zbOwtn3jZoICmvyDlASKIM8aUIUhQxBgFI9x/
         C0WA5iMGF5WslVbgFJ285ChgKUlAwkJWh2Xsfxb9ba/HLdjF+UGnq0MLpkA3QmvuTAl0
         s7TQrsV3fu/549wRBF3FA18+rde8pX6KDUZDEnKr93VemmK5LJxcdilZ/6QYiyFpYuKV
         voGE6hJPtz4Z7bT3g1YbIq/gIhEl9eh0N+V+X2l8seAL91vxiHK9P4UWtq7rm4sU3WUp
         iI6i5EWdeXdLKB/xgCkcjwmR+GwYJUZ6V+ACXXIROyLGVWbs0kXPBws8uNPLeN0anKeM
         I5yA==
X-Gm-Message-State: ACrzQf2rxLvqfNtB26QN02mTbF2llQ386H/JHLt6qqrnoRa2i5ntaLQg
	hL05feqxcjqmOKu5bglL+bGsqA==
X-Google-Smtp-Source: AMsMyM4q4CNgN2lQ4PyaYyADoR+QimlVBokrxw9X6LS0+cBweFifUR+XVuuTHXr8UlnLM2zvHk12kA==
X-Received: by 2002:a05:6a00:248e:b0:56e:ad31:b976 with SMTP id c14-20020a056a00248e00b0056ead31b976mr1059125pfv.51.1667579490004;
        Fri, 04 Nov 2022 09:31:30 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id y133-20020a62ce8b000000b00565cbad9616sm2954667pfg.6.2022.11.04.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 09:31:29 -0700 (PDT)
Date: Fri, 4 Nov 2022 16:31:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yuan Yao <yuan.yao@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 08/44] KVM: x86: Move hardware setup/unsetup to init/exit
Message-ID: <Y2U+XT0Sm+a69CaH@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-9-seanjc@google.com>
 <20221104062223.7kcrbt66mlmqxk7f@yy-desk-7060>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104062223.7kcrbt66mlmqxk7f@yy-desk-7060>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_093132_557388_EC47FC35 
X-CRM114-Status: GOOD (  21.38  )
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

On Fri, Nov 04, 2022, Yuan Yao wrote:
> On Wed, Nov 02, 2022 at 11:18:35PM +0000, Sean Christopherson wrote:
> > To avoid having to unwind various setup, e.g registration of several
> > notifiers, slot in the vendor hardware setup before the registration of
> > said notifiers and callbacks.  Introducing a functional change while
> > moving code is less than ideal, but the alternative is adding a pile of
> > unwinding code, which is much more error prone, e.g. several attempts to
> > move the setup code verbatim all introduced bugs.

...

> > @@ -9325,6 +9343,24 @@ int kvm_arch_init(void *opaque)
> >  		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
> >  	}
> >
> > +	rdmsrl_safe(MSR_EFER, &host_efer);
> > +
> > +	if (boot_cpu_has(X86_FEATURE_XSAVES))
> > +		rdmsrl(MSR_IA32_XSS, host_xss);
> > +
> > +	kvm_init_pmu_capability();
> > +
> > +	r = ops->hardware_setup();
> > +	if (r != 0)
> > +		goto out_mmu_exit;
> 
> The failure case of ops->hardware_setup() is unwound
> by kvm_arch_exit() before this patch, do we need to
> keep that old behavior ?

As called out in the changelog, the call to ops->hardware_setup() was deliberately
slotted in before the call to kvm_timer_init() so that kvm_arch_init() wouldn't
need to unwind more stuff if harware_setup() fails.

> > +	/*
> > +	 * Point of no return!  DO NOT add error paths below this point unless
> > +	 * absolutely necessary, as most operations from this point forward
> > +	 * require unwinding.
> > +	 */
> > +	kvm_ops_update(ops);
> > +
> >  	kvm_timer_init();
> >
> >  	if (pi_inject_timer == -1)
> > @@ -9336,8 +9372,32 @@ int kvm_arch_init(void *opaque)
> >  		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
> >  #endif
> >
> > +	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
> > +
> > +	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
> > +		kvm_caps.supported_xss = 0;
> > +
> > +#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
> > +	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
> > +#undef __kvm_cpu_cap_has
> > +
> > +	if (kvm_caps.has_tsc_control) {
> > +		/*
> > +		 * Make sure the user can only configure tsc_khz values that
> > +		 * fit into a signed integer.
> > +		 * A min value is not calculated because it will always
> > +		 * be 1 on all machines.
> > +		 */
> > +		u64 max = min(0x7fffffffULL,
> > +			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
> > +		kvm_caps.max_guest_tsc_khz = max;
> > +	}
> > +	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
> > +	kvm_init_msr_list();
> >  	return 0;
> >
> > +out_mmu_exit:
> > +	kvm_mmu_vendor_module_exit();
> >  out_free_percpu:
> >  	free_percpu(user_return_msrs);
> >  out_free_x86_emulator_cache:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
