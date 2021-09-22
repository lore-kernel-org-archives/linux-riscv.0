Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E5DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7238A61178
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7238A61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCF+vPZJTAl85OSLg+5LVoK3SaVWjZpAyQbVv8zn1Mw=; b=IriKNxl8/JXSNk5Y4l1jQcrMuQ
	2cLcX1JNTz6Xen/OKNZoodqSAsnuGQ9DTyO2kkY/kRuuj7UL3KYqXcqyBQLA32dg84SamHLjuj+04
	+SbYB0hKyC1lNA77TdbUz20bd+QB0cwbfsUaQnS389ox4ZCjSWDBZ0WTCrw3P1VU/k3+PKN8d0vEK
	qjPdeS0TGHocX4SFY7hX/UGhzpePH3b7XrrOLp+jzseHNGJjWjcW4fz9syZRXjN847CA82LaKxHOl
	pA1G5nU0vatgD936VyMfQHLfCOxBKauq2cYVdH0blViYVT6DJEsHUqtFOwgNiM7SziFKE+nyDt+Bv
	e5lBD5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSvoy-0074nj-21; Wed, 22 Sep 2021 06:33:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSvo1-0074Ss-Gh
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 06:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632292352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQ8YzZrVP1svLk3AMq6cxZLez6XFnWefi9KQVDYCfgo=;
 b=fmYLC59k7++KkSe/bCnLfoBH49jP1rYDAvQErwIUR3kdMMo7ClBrp2ITSGlDSsj8cL9ujD
 wAJxkcHO/VBC5PRsFmoo9VhnDixWkPVKS04GZqhm0BBcIbCogWRxVHnijpt2iCyxcby+R4
 D8E9PTytjRgi56qA4zXVHspE23UjzIA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-ZW8kXTFrP_CbvgTse6WajA-1; Wed, 22 Sep 2021 02:32:30 -0400
X-MC-Unique: ZW8kXTFrP_CbvgTse6WajA-1
Received: by mail-ed1-f71.google.com with SMTP id
 e7-20020aa7d7c7000000b003d3e6df477cso1758716eds.20
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 23:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQ8YzZrVP1svLk3AMq6cxZLez6XFnWefi9KQVDYCfgo=;
 b=XkQuBQsQBdt5tbi2extq/Odva9+oa2+j16czIZ+xafg7IuHHx/fRBIzVyrr+IWmI95
 //7yMfdONscr8Wk9bhN18qihdrDgxGX0HafwdlBdaCn8fBIPS5ZtHdZfHVhjRUUpSMT+
 HtojQ1EHpn7OiPeYE8qGSdu5Sfmv52N4tD6eTuOHCu50zbiIMnVApx2VEGZht5AyMvBG
 rTIXWvV/0Hug3pWkmHxwQoF8MXHpvQmK0GIxgaEooViQhJmir2xXQtZqmodkc3x8rIK9
 zOjWTpBhEpx9Cn9Mix7RwY0mEJKwouoSutDRNhUKzNzHQR7pgAoDH/zw0PpDw6uBue1O
 +QGA==
X-Gm-Message-State: AOAM530VJUflOyrywSN2E0RgjfiiRAzn+DXG4oWLRVjxMckqjUf//2UV
 P3vN120G7FnZG5TgP7eYpDxD26QY5jssOn/pxl1oAcL4CtSoJBnKAOyoZOaUb/FxI8DqMt+I3wq
 AH+Uu6/Gs5eu5mNfcnukOqUHfOgJY
X-Received: by 2002:a17:907:11c5:: with SMTP id
 va5mr38316041ejb.215.1632292349259; 
 Tue, 21 Sep 2021 23:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYtbJQ8octsTI+p+irGuyf7bBUrwOfK9ScnlhWiK83zRobYLAMfdGjMGdI45oS8miuwF0xKA==
X-Received: by 2002:a17:907:11c5:: with SMTP id
 va5mr38315988ejb.215.1632292348952; 
 Tue, 21 Sep 2021 23:32:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id yd3sm552542ejb.6.2021.09.21.23.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:32:28 -0700 (PDT)
Subject: Re: [PATCH v3 08/16] perf: Force architectures to opt-in to guest
 callbacks
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
 <20210922000533.713300-9-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f2ad98e2-ddfb-c688-65af-7ecbd8bc3b3d@redhat.com>
Date: Wed, 22 Sep 2021 08:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-9-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_233233_685112_9CD8EB5C 
X-CRM114-Status: GOOD (  21.25  )
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
> Introduce GUEST_PERF_EVENTS and require architectures to select it to
> allow registering and using guest callbacks in perf.  This will hopefully
> make it more difficult for new architectures to add useless "support" for
> guest callbacks, e.g. via copy+paste.
> 
> Stubbing out the helpers has the happy bonus of avoiding a load of
> perf_guest_cbs when GUEST_PERF_EVENTS=n on arm64/x86.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/Kconfig     | 1 +
>   arch/x86/kvm/Kconfig       | 1 +
>   arch/x86/xen/Kconfig       | 1 +
>   include/linux/perf_event.h | 6 ++++++
>   init/Kconfig               | 4 ++++
>   kernel/events/core.c       | 2 ++
>   6 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index a4eba0908bfa..f2121404c7c6 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -37,6 +37,7 @@ menuconfig KVM
>   	select HAVE_KVM_IRQ_BYPASS
>   	select HAVE_KVM_VCPU_RUN_PID_CHANGE
>   	select SCHED_INFO
> +	select GUEST_PERF_EVENTS if PERF_EVENTS
>   	help
>   	  Support hosting virtualized guest machines.
>   
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index ac69894eab88..699bf786fbce 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -36,6 +36,7 @@ config KVM
>   	select KVM_MMIO
>   	select SCHED_INFO
>   	select PERF_EVENTS
> +	select GUEST_PERF_EVENTS
>   	select HAVE_KVM_MSI
>   	select HAVE_KVM_CPU_RELAX_INTERCEPT
>   	select HAVE_KVM_NO_POLL
> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> index afc1da68b06d..d07595a9552d 100644
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -23,6 +23,7 @@ config XEN_PV
>   	select PARAVIRT_XXL
>   	select XEN_HAVE_PVMMU
>   	select XEN_HAVE_VPMU
> +	select GUEST_PERF_EVENTS
>   	help
>   	  Support running as a Xen PV guest.
>   
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index c0a6eaf55fb1..eefa197d5354 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1238,6 +1238,7 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
>   				 enum perf_bpf_event_type type,
>   				 u16 flags);
>   
> +#ifdef CONFIG_GUEST_PERF_EVENTS
>   extern struct perf_guest_info_callbacks *perf_guest_cbs;
>   static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
>   {
> @@ -1273,6 +1274,11 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
>   }
>   extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
>   extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> +#else
> +static inline unsigned int perf_guest_state(void)		 { return 0; }
> +static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
> +static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
> +#endif /* CONFIG_GUEST_PERF_EVENTS */

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Having perf_guest_handle_intel_pt_intr in generic code is a bit off.  Of 
course it has to be in the struct, but the wrapper might be placed in 
arch/x86/include/asm/perf_event.h as well (applies to patch 7 as well).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
