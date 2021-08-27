Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A73AC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 16:01:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3DE60E97
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 16:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE3DE60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFYOAK9h5ccVrbT95MhIzhnaeqHOkfhFA+mAMTEpobc=; b=ilZuK0aLFKiNTU
	degXcgSPo3M+D3KUxy/TYJTNRgfpDUFJfVxsLzsiuX+ZQiV2FYAElAX9yA9qYFjB7d7NITLuOVF85
	FcoAJ819xD0N6Ka9mwQLi+Qh5hpT5iftXdAl96MvJ+L/ZVSuQ9mXIz0k3lk/KVMqMGvi0wp+2lMFo
	QhO2lhSkouCr4BD2felB3JRVvR2pRWVaU4fTCshr+FuUXopH70FIJlCQDiYrxH47sWfX95kDChJuH
	vzVV/7kq5uNqZHbUAfZFmsOrDLGP0UkxIxmKimx7xsrgiHFoNEzYI+xeaKDt/W+LAzOhbyMHSt4yn
	RsyKiQdFll+quKZD6Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJeHh-00CiRj-Cq; Fri, 27 Aug 2021 16:00:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJdJf-00Cbco-1B
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 14:58:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id n12so4085109plk.10
 for <linux-riscv@lists.infradead.org>; Fri, 27 Aug 2021 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uRFFUbAhELNbaSp6/gZa0c8lVubPxa9shGc4LpwPEKA=;
 b=LaTxPm5alTPx3ec48IA6+ZkyOejP1tGYjt5wY+p50UOfksJNBKAzDXOzoDDiJpQJ7C
 7ZlQ2CaQrXUZrhEVe/+L/sf91LGMM0vWjp8eP3YRAXU34kmcSmT/loEOx2KY28gVVCsl
 oNwRHnusQG6CUmxymYZ58t9NT8p9wB0iZAAe71TUcHWHnrhk4i1QLthTClskPP73rEx7
 8W5oVGVmckueDqbKs0mB5YdxIHBLQgh+JwU0k3CO0TH8YixDpwG1SB6F/loD+NPrNZ2l
 0CosQb5gLTnLJ9MX51KpbZFvZYLNN8TvF8Ol0HP7oCHqmHClmMDvOIzUAi7IGzMuFHXf
 oANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uRFFUbAhELNbaSp6/gZa0c8lVubPxa9shGc4LpwPEKA=;
 b=SrdtB0+lBgQmYypR/gLCpFUxZGxLviA4JA6+IHRd+uyUSUGZdDtftJNbYhzlS2GYkK
 +8AwnGD0BRqlFYrxF/4+XhhUW6JsK3P/cm2HayZeFKfwmBWDiNJYkg/7srvb9ZKFRpg6
 zIcOH9rh/39Cxo1T25CRKueAl1a69G/kSNwQGPMf6mBcovZlc9N/aHy6NYsxvSr5lFbF
 8g63dqEZoKXEoEIcMEhRK6sSHtI5Loa5Cucg4TJGpxbAfcHhDAe/eQwUvtLQH35XXEV0
 a1yY8ue2V8Vt8fWsMdRdzR5+9ra3/A6WSqWibqjBr3DSZLIvju4j1WZ82ClN4NLaNp8b
 /1ww==
X-Gm-Message-State: AOAM530cvSGGhfFZsTz5og+q6l2ksVqlaezqFLUKA7DWz0Oa5pBAd/Rj
 yQCOIjuenUQleL4RUA/9yGvklQ==
X-Google-Smtp-Source: ABdhPJzgh09WISpUzNhO7TIEv2MEhpi/JDC49fmE6awwyfv/L0ffcVcqSZUNcnR7TJ7/0hyFRiQ/2g==
X-Received: by 2002:a17:902:e20a:b0:134:221f:657d with SMTP id
 u10-20020a170902e20a00b00134221f657dmr9134631plb.78.1630076319283; 
 Fri, 27 Aug 2021 07:58:39 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id e11sm6590628pfn.49.2021.08.27.07.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 07:58:38 -0700 (PDT)
Date: Fri, 27 Aug 2021 14:58:35 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
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
Subject: Re: [PATCH 07/15] KVM: Use dedicated flag to track if KVM is
 handling an NMI from guest
Message-ID: <YSj9mz4F2NDSKaas@google.com>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-8-seanjc@google.com>
 <YSiUnDbi/aZ3nunT@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSiUnDbi/aZ3nunT@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_075847_132238_1E8164F7 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, Aug 27, 2021, Peter Zijlstra wrote:
> On Thu, Aug 26, 2021 at 05:57:10PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> > index 5cedc0e8a5d5..4c5ba4128b38 100644
> > --- a/arch/x86/kvm/x86.h
> > +++ b/arch/x86/kvm/x86.h
> > @@ -395,9 +395,10 @@ static inline void kvm_unregister_perf_callbacks(void)
> >  
> >  DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
> >  
> > -static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
> > +static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
> >  {
> >  	__this_cpu_write(current_vcpu, vcpu);
> > +	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
> >  
> >  	kvm_register_perf_callbacks();
> >  }
> > @@ -406,6 +407,7 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
> >  {
> >  	kvm_unregister_perf_callbacks();
> >  
> > +	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, false);
> >  	__this_cpu_write(current_vcpu, NULL);
> >  }
> 
> Does this rely on kvm_{,un}register_perf_callback() being a function
> call and thus implying a sequence point to order the stores? 

No, I'm just terrible at remembering which macros provide what ordering guarantees,
i.e. I was thinking WRITE_ONCE provided guarantees against compiler reordering.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
