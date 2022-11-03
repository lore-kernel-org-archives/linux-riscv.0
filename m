Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B7EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOAfwVhbyx1Snv76tGub06TF/3iXVD27+fCMl9H7u7k=; b=NQHUfIZdXr/K03
	SA8SgHjJsnvqeYJbgqT61tM6dV3nIiMPhwa4QraiPNuWTQHzd7QsPab0ALBjEZzpKqm54VlU9aqQ9
	IYMW1yr2HbXnBCCLZ/NUSOC0HkHce1L5KfYmQ7NcxYpWwcWAj15lvHRayrHnDd01u+02CGBqYnUrR
	rDX+IiMZC6niu5PTmpvqA+/y9lJxbuhEq1eAbucumwmxgq/s4iolayhlnwVk2Od3dYYJonPpW20VH
	yDcitxcWsydnGXSEd6EGREkb3bqmzcEJ1OUBD9t7nkZf/tU1kvQb1zzf7fDxOK9vUDjApjRgAbHmm
	yo6mPKVohULRKyCBXP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqf3n-001J0B-E6; Thu, 03 Nov 2022 18:35:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqf3a-001Ivd-Hk
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 18:35:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id v17so2768675plo.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgoOqWPJe20h3F3t+kWJTAR37+M7sNOsPG89iz5Bulk=;
        b=Pm4Lr3kAm7G9yhV3E+texinWexF8/BykknHnX+41QMhdAJg8Q6KGdsZlwDR9KsaQ03
         q0oiA6QGnfMNaCLi6FwippomEY2Gxx8DIbtsls7Wm3K9Y5ntAz6T/fo5rOOGqR0XZexV
         IMpIarVZKtd2r4wbd6pBH2HWWgUKLdmEcjKjz7hr2eZWqilU2ZOjSL0LQYBIbuLk+an3
         F080UdTs/Pl//2c4Y7M3MC5aXIj0L8ze9uKQnOS3RTfUxOdNjPBYkRT7wM2xznbkkPNf
         k6rWzEiCMkA6YZikO6kTaZUjEx2R8QJERpkjNDf1cNtL0uRiWX1pfQEgD4PMO8IN1GPi
         cqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgoOqWPJe20h3F3t+kWJTAR37+M7sNOsPG89iz5Bulk=;
        b=2d9efuOe9yvHkce1QaoLxsHKJ43wV45qIuobqoaWeKfU0uxdlTfB2E5VOQj4mPt0lS
         9pyjqAtjt5nya6H8nOGaOOpl5P/ABRWQjUOWf9u2tCxD63s3ooP2y1xtFG5v2YZkWOlq
         teJbkwUzlG4W4TFmjgUDHic1V0pS38qrnHWNqLRNnh8IPWo4TkLCViTrtbRqMiU4t3HM
         Ex4+YKRM+vciED4y9geDVYQrus/mPrzXJbxBBWX+NXBV4BVRdLWPG3zCTSjtIHClKigH
         oF5vtTxBu9EiY7GJIyhsDAkPjTVFrh3p3vU2CXkWLQYdY+Zm2zsQGWr7mxsdubnsf+tG
         4KHw==
X-Gm-Message-State: ACrzQf3bB/B8wPadxBUhkJ3fhoA94vLjdvT1EB9i+k+XvEsmJtwcHlG+
	O+9a/cBDZ/k5VewqMOChzZyimA==
X-Google-Smtp-Source: AMsMyM7An2PKDpytAFzn8oRI/SQJomdGS1nTfx9CsrnDxhHyyoY4AD/5FsaR2YoYMTMl2oHfbxu0kQ==
X-Received: by 2002:a17:903:1250:b0:185:40c6:3c2c with SMTP id u16-20020a170903125000b0018540c63c2cmr31387342plh.64.1667500509087;
        Thu, 03 Nov 2022 11:35:09 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709027e8400b0017da2798025sm914686pla.295.2022.11.03.11.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 11:35:08 -0700 (PDT)
Date: Thu, 3 Nov 2022 18:35:05 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
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
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y2QJ2TuyZImbFFvi@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_113514_594533_13A2EF2D 
X-CRM114-Status: GOOD (  14.65  )
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

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 00:19, Sean Christopherson wrote:
> > +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > +	    !boot_cpu_has(X86_FEATURE_VMX)) {
> > +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> > +		return false;
> 
> I think the reference to the BIOS should remain in these messages and in
> svm.c (even though these days it's much less common for vendors to default
> to disabled virtualization in the system setup).

Ya, I'll figure out a way to mention BIOS/firmware.

> The check for X86_FEATURE_MSR_IA32_FEAT_CTL is not needed because
> init_ia32_feat_ctl() will clear X86_FEATURE_VMX if the rdmsr fail (and not
> set X86_FEATURE_MSR_IA32_FEAT_CTL).

It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
if the actual CPU type matches one of the aforementioned CPU_SUP_*.

E.g. running a kernel built with

  CONFIG_CPU_SUP_INTEL=y
  CONFIG_CPU_SUP_AMD=y
  # CONFIG_CPU_SUP_HYGON is not set
  # CONFIG_CPU_SUP_CENTAUR is not set
  # CONFIG_CPU_SUP_ZHAOXIN is not set

on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
will get unexpected #UDs when trying to enable VMX.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
