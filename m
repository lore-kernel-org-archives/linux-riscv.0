Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828DFCFD36C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 01:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5G8VbT3bzIQcr0QXv+QS2stmxCTCFOlBUD33nmaHEpA=; b=XqFt8CyEcDx5vI
	3sF1kSE2GiAdwdStB5PWJhIg46nkoMyi7nlsgVDqZ76CGeoMTzAuH9H7PkvH/vH9H+IndeCAtxSwB
	e3yj3Qz/t0ZpNVzkQqRKmBOCcMer8O0Q1LgQqoArPzDOc1Ubw5fJeSSKfLrFlR+Yfm3MuxcCs60rS
	Fkg4Ja2MC0v1cVp/FvqTa6ixeE6HRACraGydGD2XM9Arz3zKROsrsED+apoa/K4NNXMqSY9vsxCr1
	vUjybyuOX/yBk++/JMGBh9lxBToypvwNgNG7gxduCrQ632cc2qY7RaD6DvwhFkDP/PV4zt0QjmbYo
	ArdbCfx3w+VBTv+LgtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiAa-0000000CZmu-0tGP;
	Tue, 25 Nov 2025 01:48:40 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiAV-0000000CZlI-485S
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 01:48:38 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so10392867a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Nov 2025 17:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764035314; x=1764640114; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxECKAH71uYUFlk1OLSRLVGsdtXKfBuiVH3qX5Bq1JE=;
        b=iMgLQy4paVkPFTs7ZB/F0ydYuym+iwIlatj70f5uyh0w3xcnH92oC4id9Rr/Zg7Vt1
         zeMaRO/IPaVewsh67UCKSN5wIndOfC9dyTMjTMycptDjGhiEKQ1JVehfEflR3DbySzYo
         xA0IRAzMNaRfUd7FxD1LjADdJFAcXYjXXg9qqjRMq8UzsurLU6ILLB/Roq2iwp3q1MWw
         rDcH4shSS+9PF1+95fQ6MDWql9eaFuVmD/TaTVq/QF4imirsh72Z/ck5py2dFcmV4I9T
         /MUIKeuF033NZYOUbP3PFmJmsxo5NDXLVO+DIxgumuUglyP+/yrEzGNDoyOvxdiJsC1a
         RanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764035314; x=1764640114;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxECKAH71uYUFlk1OLSRLVGsdtXKfBuiVH3qX5Bq1JE=;
        b=FYLbxYtpGKMTBwgQoJkh7EeysbiaWEYjcYaxvSsAjJ8mMjRv0hUZccIzmDmhAfdPf8
         WNfwKCie+0xGEWtzy0W/d8cu/DehZTSl0WjTxTzN9Zs2dPYA/VKFMNTE+LR9mYyM7HIf
         zc8b3UXMel97OS2YqhXq5PoE6IIbJrmAH03WdVC790Ms/L7jxpxvoSHbZrbN0Cyk+L+h
         Jp2A60J0qCHKP50tCHrH9y6JRIRjay2h3MJV1oLGsnydAUTwwiuVB28Rj0szcJBTzZSC
         vE8GRFuVrhra0YZiefOWhIMYtV5NJ69OecU3YpKhKQLF+CVyMvK5qDLtbwiNNmgtzc0f
         nP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCULMvrHZAB+7Nizq20gYBkbuQTlnDD4K+IM6rJMD1XvcIVe/40eDYTrDLA+R7va+Z50xxjq1ZrhgeBFvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmLP/EGYlqT8Day2kGC/7UHaQgnomMPIEPthn7/5L+yY2cqSco
	6rm0WVtRw0n45ikcCw/s1QJ7r3N6F8rqY4SqWDFrTaLB0I52ZrAvv52So+CYWjpQTXZYo6ftkEf
	OYSItAw==
X-Google-Smtp-Source: AGHT+IGw7n/WkVQTGzwbQxQ9VV1HAFWO+WUionAVci6QFcq9BhvaMpdHuGTmwsKZi9fkk+aykjevdAFNlrA=
X-Received: from pjvb14.prod.google.com ([2002:a17:90a:d88e:b0:341:8ac7:27a9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164a:b0:340:c261:f9db
 with SMTP id 98e67ed59e1d1-34733e60944mr13320658a91.10.1764035314194; Mon, 24
 Nov 2025 17:48:34 -0800 (PST)
Date: Mon, 24 Nov 2025 17:48:32 -0800
In-Reply-To: <20250806195706.1650976-29-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-29-seanjc@google.com>
Message-ID: <aSUK8FuWT4lpMP3F@google.com>
Subject: Re: [PATCH v5 28/44] KVM: x86/pmu: Load/save GLOBAL_CTRL via
 entry/exit fields for mediated PMU
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_174836_020612_BA805EC2 
X-CRM114-Status: GOOD (  25.88  )
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

On Wed, Aug 06, 2025, Sean Christopherson wrote:
> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
> 
> When running a guest with a mediated PMU, context switch PERF_GLOBAL_CTRL
> via the dedicated VMCS fields for both host and guest.  For the host,
> always zero GLOBAL_CTRL on exit as the guest's state will still be loaded
> in hardware (KVM will context switch the bulk of PMU state outside of the
> inner run loop).  For the guest, use the dedicated fields to atomically
> load and save PERF_GLOBAL_CTRL on all entry/exits.
> 
> Note, VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL was introduced by Sapphire
> Rapids, and is expected to be supported on all CPUs with PMU v4+.  WARN if
> that expectation is not met.  Alternatively, KVM could manually save
> PERF_GLOBAL_CTRL via the MSR save list, but the associated complexity and
> runtime overhead is unjustified given that the feature should always be
> available on relevant CPUs.

This is wrong, PMU v4 has been supported since Skylake.

> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
> index 7ab35ef4a3b1..98f7b45ea391 100644
> --- a/arch/x86/kvm/vmx/pmu_intel.c
> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> @@ -787,7 +787,23 @@ static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_
>  	 * Require v4+ for MSR_CORE_PERF_GLOBAL_STATUS_SET, and full-width
>  	 * writes so that KVM can precisely load guest counter values.
>  	 */
> -	return host_pmu->version >= 4 && host_perf_cap & PERF_CAP_FW_WRITES;
> +	if (host_pmu->version < 4 || !(host_perf_cap & PERF_CAP_FW_WRITES))
> +		return false;
> +
> +	/*
> +	 * All CPUs that support a mediated PMU are expected to support loading
> +	 * and saving PERF_GLOBAL_CTRL via dedicated VMCS fields.
> +	 */
> +	if (WARN_ON_ONCE(!cpu_has_load_perf_global_ctrl() ||
> +			 !cpu_has_save_perf_global_ctrl()))
> +		return false;

And so this WARN fires due to cpu_has_save_perf_global_ctrl() being false.  The
bad changelog is mine, but the code isn't entirely my fault.  I did suggest the
WARN in v3[1], probably because I forgot when PMU v4 was introduced and no one
corrected me.

v4 of the series[2] then made cpu_has_save_perf_global_ctrl() a hard requirement,
based on my miguided feedback.

   * Only support GLOBAL_CTRL save/restore with VMCS exec_ctrl, drop the MSR
     save/retore list support for GLOBAL_CTRL, thus the support of mediated
     vPMU is constrained to SapphireRapids and later CPUs on Intel side.

Doubly frustrating is that this was discussed in the original RFC, where Jim
pointed out[3] that requiring VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL would prevent
enabling the mediated PMU on Skylake+, and I completely forgot that conversation
by the time v3 of the series rolled around :-(

As mentioned in the discussion with Jim, _if_ PMU v4 was introduced with ICX (or
later), then I'd be in favor of making VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL a hard
requirement.  But losing supporting Skylake+ is a bit much.

There are a few warts with nVMX's use of the auto-store list that need to be
cleaned up, but on the plus side it's also a good excuse to clean up
{add,clear}_atomic_switch_msr(), which have accumulated some cruft and quite a
bit of duplicate code.  And while I still dislike using the auto-store list, the
code isn't as ugly as it was back in v3 because we _can_ make the "load" VMCS
controls mandatory without losing support for any CPUs (they predate PMU v4).

[1] https://lore.kernel.org/all/ZzyWKTMdNi5YjvEM@google.com
[2] https://lore.kernel.org/all/20250324173121.1275209-1-mizhang@google.com
[3] https://lore.kernel.org/all/CALMp9eQ+-wcj8QMmFR07zvxFF22-bWwQgV-PZvD04ruQ=0NBBA@mail.gmail.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
