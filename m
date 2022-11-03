Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B457CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 18:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9JpEJeu3MZ85hWe0YfZTTjP6I7KVZEhnn7xqtfYWNs=; b=H9T0nTUe3xDgwJ
	TM/WbH/B6roXszj3FgkO2W+d98GMxFEjZH8A4TeJEmhVkFH1m+nTOJUytsdrM8tecRkkZDAmkNt6G
	giUxSYrn6CpvxqD7C7iW9Zv+OGloed+C6JJ17coj7DLYS8XvBYWh5PZ6uWGaIXmF6hxLOEa3hsvEg
	MPXf5YgrlceNUwzt8fs+XMGAcZ8y8Nuy06dHSejyXi6i7+4MgUHAuOA3tzpu67L/QXTFM+m55FNB1
	5mwBbwheICgFGhpWbRxGhFd5HhOmad6vjQSc/IGRdFEXrMU6ihlgtjuwTGdidn3ZDyjI9vh1t4Cwz
	nAx/Rq2TIgXTjF1j9o+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqfEm-001KfQ-NW; Thu, 03 Nov 2022 18:46:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqfEU-001Kcz-93
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 18:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667501188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUvqpmismHtbPDi1RWOVBVQOlTCkIOX4rr6fY8m3qi8=;
	b=EabJpTwfu8tjjAfHEkBVi7bBq+lrfUWFHawhyEB1UMCeQZXnLUaK5P9HsuBOfU3j6e6noZ
	SJRT20RiiiB+HpCjpj0Hhrm05HM7kb7Wpu9MwqIEstj4N4izzUjgBuNbbsO4PblKrwrYHN
	iuCVN8/aEt7ngeIDwuH4QtswA1pOwKY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-wl6T8C3BM4yWCV1uGxAVPA-1; Thu, 03 Nov 2022 14:46:27 -0400
X-MC-Unique: wl6T8C3BM4yWCV1uGxAVPA-1
Received: by mail-ej1-f70.google.com with SMTP id sc40-20020a1709078a2800b007ae024e5e82so1802073ejc.13
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 11:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUvqpmismHtbPDi1RWOVBVQOlTCkIOX4rr6fY8m3qi8=;
        b=LSPd48ELYHe+WspDwNLyOw9Ps3AO1o0jGmDwOzC8YFNiqwP7gOvSCc8rCZi6t2FQgx
         dMH2ZVmJvZttTUMiHXEHlaBMV/kprrKw8Rq2Tf/WwWMXZ9X3hm0eMtL6J2r+yCnWASxo
         W52X5gdVv5dJKcpzdea1pouY4r/XrpxC+y/PLOmUYl7PzjipJS4AxpcryRR2VKUZ9GF5
         sm/lhIcz+PNt7LHRc483iY3lieebbbQUiLrV98VMG5ckaluVM6uinHUq3CmXHVvwFIzz
         C+u6RUPGNhx7daLMAJbMz3znNjiHaCixSN1UZSB2Jh9SI20SS7XYjIuAee4j36E969v6
         OCVQ==
X-Gm-Message-State: ACrzQf2mapLBTc4BKQI/Tb41dtqwpHN50gNC3uEXKzHtsXZmd2XnveMo
	Gyn1ccZ8dKH/ep9PxwG+m1HFkSGfLcxVSHt/vpClszh3Pq/iVaSdDIcm0lHl7cParSdYJMfWMFT
	uR4vUNkY1Lmv0lxlGj+ZDcYPhTfEa
X-Received: by 2002:a17:907:31c9:b0:740:ef93:2ffd with SMTP id xf9-20020a17090731c900b00740ef932ffdmr30301718ejb.584.1667501186297;
        Thu, 03 Nov 2022 11:46:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jngiF1WMeYDLzQRcIfcwEai0RoBStUb1QJ9IQKOY38atIN4TLSIas8P4CJc6XubwxUck1WA==
X-Received: by 2002:a17:907:31c9:b0:740:ef93:2ffd with SMTP id xf9-20020a17090731c900b00740ef932ffdmr30301665ejb.584.1667501186012;
        Thu, 03 Nov 2022 11:46:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id 2-20020a170906218200b0078246b1360fsm799044eju.131.2022.11.03.11.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 11:46:25 -0700 (PDT)
Message-ID: <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
Date: Thu, 3 Nov 2022 19:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y2QJ2TuyZImbFFvi@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_114633_513734_60298711 
X-CRM114-Status: GOOD (  11.98  )
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

On 11/3/22 19:35, Sean Christopherson wrote:
> It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
> CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
> if the actual CPU type matches one of the aforementioned CPU_SUP_*.
> 
> E.g. running a kernel built with
> 
>    CONFIG_CPU_SUP_INTEL=y
>    CONFIG_CPU_SUP_AMD=y
>    # CONFIG_CPU_SUP_HYGON is not set
>    # CONFIG_CPU_SUP_CENTAUR is not set
>    # CONFIG_CPU_SUP_ZHAOXIN is not set
> 
> on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
> X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
> will get unexpected #UDs when trying to enable VMX.

Oh, I see.  Perhaps X86_FEATURE_VMX and X86_FEATURE_SGX should be moved 
to one of the software words instead of using cpuid.  Nothing that you 
should care about for this series though.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
