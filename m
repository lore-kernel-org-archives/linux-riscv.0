Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4931DCA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 17:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+LoCGs5P9Hsll4m4vTTm/Thq6DM4wy3Aj5H/m5RjEhk=; b=LOBdVzJ4lFhS5SGm56zwBm7NZ/
	1COeTH7zjjJ21EKRnEeV6ka7o4/gLrDyVyUItRC8u9VZ7DtmAiOtZa1AdvT634fzmmsZp8BSXg0Hk
	yDsqpiqtjTgAIVn9KAAiTgWiYWOYNoM+s+g0mGViH6JhCpI7yYmgxJmGcg3euDIFnux2SP+ckF847
	jdC1mvAyDx+wTFuXV1Gu2Fq/9lDTnuMWB9OR/ZIFqjejW2vUgnypoI4PXNduGwC+NtdSDrSAbpAvp
	Fo6b0gONsplk/CvT+jv8dup3+/HlFeefVqxvHz1XSFv0G6Ovd3YDJx1r24EMbDK3B28zHalLoRQ44
	m2Mh53Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxyF-000000035Yx-3cnk;
	Fri, 15 Aug 2025 17:12:03 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwZ0-00000002rms-2fky
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 15:41:55 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32326e6b1deso2016246a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755272514; x=1755877314; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZHHNj6EVbfkylJhuGEQxcUJR48ZbvWbqL/aI2BJPfo=;
        b=yBsOT/6rETcPmA7eCF8m0xi/ZoXvuBU+VaBDpsVyD8qUDVPDWq+UWRq/L9P+KdM4bH
         cTj7A9dRoroDrz+qYqwuZMSpGFBxKtQDefC3q9whmJce+0b6j0DpydIxktcYCYTbXcHE
         BoM1Yqwy3gDd5ttu8cQ2Rked2ZRf4Kt3wnF1n03Dh7SgI0gUlzp/1rksKlQdICpK8Cvo
         tMp8SauLYca4yhCzgddivqKGQ5ESqw1v3/vDxTG0KYtb+yqmoOL9179PmFcO6MyuehY4
         +yzkirhCX1yPIapV67SCLpb/gqGxbu/BB5uks+dikI7VNsPXNDY37PJVF1234wShT5Z3
         Utsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755272514; x=1755877314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZHHNj6EVbfkylJhuGEQxcUJR48ZbvWbqL/aI2BJPfo=;
        b=aYl93gBQPBUIDjec3rxiFM/UtsSLTwGPc9wZZ/PZcvI1MzVRXTFQ7ybiA5TCqnUti5
         FiX/juJjHw5Te7sIA7mzXfL/AEDyhZ1LEISzUoIRiNScH4HCGgyuNGLN2DC+Z0fx1XZA
         PgJ6mX3SOyeXvLqPR4H9uBJ6mDibH0jgtK08VbpUS8RyYgPYxS1VZz1aKLinu3L2SYav
         AZ0hQskCh0todXl4zZF8AYA4EW2gJFNMxVDBS6NC6S1v10MhNKbqvJm8LpQwXyDTQ0Zq
         XmnFRi6gbjYmi6n83sSIkbWfH5uJHifg7RA178ZQ4JvatWTlpWNLDINfZFieMF6C9die
         O5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT1rFxxVljubU9jDRePDDkMjZHw8e7C2oX9G5Nq+Ip6xrt2v2hJ3SGBR8XCeFNEmkQJ6TqYJY0rPXhWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2IqogJacowznQBShIXcsndCU6LtNXSxMfz6ByG5YWjUxcqbFg
	hUhFBh9EYMKrVEdli8Hw6NdEj32jGzsz3MfETyxn2QzRmyZbaIpd6VqEOIfA6JjblJXWH8PbKkq
	bWz/q3w==
X-Google-Smtp-Source: AGHT+IF1xhNBmkTpZib3NykIL4xlxFbGkhXK+/yjF5LGvtuWFmTYgkxBDJw0+uZkCmQyO/RrRqfOrKLRso0=
X-Received: from pjbsd7.prod.google.com ([2002:a17:90b:5147:b0:31e:a094:a39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5104:b0:31e:4492:af48
 with SMTP id 98e67ed59e1d1-32342238d44mr3660367a91.28.1755272513579; Fri, 15
 Aug 2025 08:41:53 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:41:52 -0700
In-Reply-To: <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
Message-ID: <aJ9VQH87ytkWf1dH@google.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_084154_679551_6B6B2DE6 
X-CRM114-Status: GOOD (  14.35  )
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

On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index e1df3c3bfc0d..ad22b182762e 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
> >  		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
> >  	}
> >  
> > +	arch_perf_load_guest_context(data);
> 
> So I still don't understand why this ever needs to reach the generic
> code. x86 pmu driver and x86 kvm can surely sort this out inside of x86,
> no?

It's definitely possible to handle this entirely within x86, I just don't love
switching the LVTPC without the protection of perf_ctx_lock and perf_ctx_disable().
It's not a sticking point for me if you strongly prefer something like this: 

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0e5048ae86fa..86b81c217b97 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1319,7 +1319,9 @@ void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
 
        lockdep_assert_irqs_disabled();
 
-       perf_load_guest_context(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
+       perf_load_guest_context();
+
+       perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
 
        /*
         * Disable all counters before loading event selectors and PMCs so that
@@ -1380,5 +1382,7 @@ void kvm_mediated_pmu_put(struct kvm_vcpu *vcpu)
 
        kvm_pmu_put_guest_pmcs(vcpu);
 
+       perf_put_guest_lvtpc();
+
        perf_put_guest_context();
 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
