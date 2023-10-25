Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D8C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJPczalgHWBKyj42EzUAoy9nef1R/XdXAfMHRjZBSUE=; b=TtBeevnJdmua7X
	Gc5nBcWNwITkl3qDACs4baHcmcJtoW9dW84dj5pf5irFgP1HC2Q0EjgGjaNYiNG7IH+bjRnxHJtOp
	wDUVTQdSZHAr3zZPq+UGonhS5wZouBWtmSUu8n+zCTR1Y3M6x8aPN2MixcOa9d5J4KTQvBW+w8FBI
	NUpaubJc5vLXSQ5gkWSPPMoghVRtudS8/9/+mvGjCALJZ/KU8n4AhKpjTxFrcCiy5GC7EKZJbnB1L
	FdxqJoglB+/vRObrF0xYJI/kN7H/08tCxWHV431AJd6F1Bmdj4rx36Px0fIPL1295CHDTumQILeSN
	p2mqha8sAMJ6rdRJrBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdMs-00CL64-0Q;
	Wed, 25 Oct 2023 12:52:14 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdMp-00CL2V-1U
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 12:52:13 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-565334377d0so4249936a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698238319; x=1698843119; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvB5kqMmUp8d1e0rOJcbxAUMfkyNt35m6Sgeu0KyMRI=;
        b=SIj2emgXFlU/V/A112j53rbfpgyLu98sTYCBYChntJvjgAHYLOEEh2hzKFZiB2n1WI
         Smogy6ZL1Ud3Q5rik8Vqo3FPAkX7nrRaUvallEItrVc5KMrTc2g3u2oCmPMswABdkez+
         EQmRHqkPvgsKmRhXGvvHag1tgMIZ675JHhVNFxe8glG2GbxCaaFl/51uk6X/55gfZ+bQ
         MEw5nDGyro9s3eRgK041n6ON5tfZsnE59V/OhnghtfmBkFwhw8YtH5YoTB4kkYJBOAQ1
         yII1fW8IHV9JAmlyndYjVJD+ylvmfY8xJbCaxhI/nY8NI1LhUpEnzAyKG6zMJ1MFi+lM
         dnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238319; x=1698843119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvB5kqMmUp8d1e0rOJcbxAUMfkyNt35m6Sgeu0KyMRI=;
        b=w1MqBLJPRUw5tZN35subI/4vbtbVEqTYdOFK3oTfJXJI3VmUea9eS2sEt8+49OR3oc
         5cMIxQYe2oVytnnW83RFq7oXRC7mOnStRP2se1/jtfVkjmKV9xC4WkGTdGpkZQabQc58
         C75kvmOqgethrNOIXeN9K+YnWgzgZAhy+n0fBFvDj2PL67Nh/GdLMKp3RFeiUZZOnol9
         1lcMhU6C9rvRyL7aGoFnCGZMIIdmsEGd+FQW7eBYmaIrugqq2t6ZXOVEc7J8jaDiyVtT
         wNOtYqjeSKlCd+Q8bS/wK3KPJCgE/em5DIYi6yOtsPsbd9H7zctwjeqBfN8X0wZ8Ngg9
         dhbg==
X-Gm-Message-State: AOJu0YwsZcdhwZJ7qoVbLybIqb+NrdTGiQzaCu1r+95RkoQ7RRjRtlBm
	YYzjG2DzMRl9MnuhOoacSxTmDIBMc0ZxYHT5MzjElA==
X-Google-Smtp-Source: AGHT+IHijcqV2IeYBlPNx3nDgeekbmnpc78OqqMTYbjFqpHUU23WlyO9HzPiT25aLo3D0rYXf7TXF9N6YnljdscPOco=
X-Received: by 2002:a17:90a:800b:b0:26d:43f0:7ce4 with SMTP id
 b11-20020a17090a800b00b0026d43f07ce4mr14485024pjn.8.1698238318938; Wed, 25
 Oct 2023 05:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-4-vincent.guittot@linaro.org> <20231025115324.GC31201@noisy.programming.kicks-ass.net>
In-Reply-To: <20231025115324.GC31201@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Oct 2023 14:51:47 +0200
Message-ID: <CAKfTPtDqFy-1dXH51JJ28XdH452K4ACrC3gr-v212s5-hH9RBw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] cpufreq/schedutil: use a fixed reference frequency
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com, 
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_055211_500645_C27E2C18 
X-CRM114-Status: GOOD (  16.29  )
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

On Wed, 25 Oct 2023 at 13:53, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 18, 2023 at 06:25:37PM +0200, Vincent Guittot wrote:
>
> > +static __always_inline
> > +unsigned long get_capacity_ref_freq(struct cpufreq_policy *policy)
> > +{
> > +     unsigned int freq = arch_scale_freq_ref(policy->cpu);
> > +
> > +     if (freq)
> > +             return freq;
> > +
> > +     if (arch_scale_freq_invariant())
> > +             return policy->cpuinfo.max_freq;
> > +
> > +     return policy->cur;
> > +}
>
> Hmm, what should x86 do here? I know it mostly doesn't use these things,
> but would it make sense to stick the base frequency in ?

get_capacity_ref_freq() should return the frequency that is used as
the reference for the max compute capacity.

On Arm64, we have seen some inconsistency especially because we use
the energy model, we compute the CPU's capacity at boot and we can
have different compute capacity in our system whereas x86 always uses
SCHED_CAPACITY_SCALE even on hybrid system if I'm not wrong

So I was not sure that this will make any difference for x86 platform

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
