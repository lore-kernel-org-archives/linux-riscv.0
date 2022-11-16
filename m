Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320EDC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF6PFoQNHxPbt47yWsnx3TLc46bIm4z85q0M8awihPU=; b=Vp2Jub5OY86OSr
	O+fBXfbJG5vbWYZ9/QsYVz7TCKjhLjX0t2eQV1cSMphQ0bfEg6+/0DwsRECMbo1D4KBKWZ/5Ggt2j
	TIViPgEvaZDuEpIkx7m4F0pnDqlH2NPNLTX5S0rfn5GBzvGs/0WFCNCUy5c1sGXytK09ZrWc25qHQ
	aEVPEVmQOCqee+ckAlsUATMsoQgUefLyxSZc21vu7mH3bVVcX4Le6zmpcqGsNU2zCamC9jTx+wttm
	v9G3620Sks9W87m9yt6/5HDW1NuJJx6xbWMtLd6kqiMzvHR7O+7locAg3CzpxERNDiGRWC1uWPvpE
	nXo6Nm4aiAqn3CHmyDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLxE-006Jbt-Fg; Wed, 16 Nov 2022 17:12:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLwa-006JIN-QV
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 17:11:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id p21so17008222plr.7
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qU5KpuuvMvabmlf4l/Mi3tQhh2fL8Dh2/iugoH77F0k=;
        b=TdgWtef6UhHbqKe4QS/3Ayu3VNZZ3i9eoJmtCy7dLqrysJ7wB0UBIiB1NHl2XD8yEJ
         9A9e40vVPz0LeaGnBm+xWkbLjcxsdpGQjMtsawyPcUDXFiJtlqbZJWuF4NPJNhW8gWhc
         yklS7sdK1V06+Vo7Vtm2MrCNKTPLN0kZs4hpWbYlAx+pUoMaBEUe2EJ/R8vPCcvbrDoh
         3WsWgepDpESG+KKK928nilFdVglC19Gmb2mv5/mmmkx20fEfIehPjExF++q08zwUw6nJ
         A1VBgI5fVGcYhdLGJAFBS9e+51HNi1lhj80m/YmoiHsls5U6I/EdT06kMnKY5Lu6o+oq
         Zk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU5KpuuvMvabmlf4l/Mi3tQhh2fL8Dh2/iugoH77F0k=;
        b=ZIYx10/mxGNS8dkvFBSKoS4m85KUkjaAYjjWEBz/S/IPcU20Q/t1fi1PFP83QdByKO
         RxwMeP265YuIekc9VSBgEG0aEqDf7ckRvoul8BsFlws+5rjqNYqI5Z9XX0rmzawvMIjI
         axYMt388tVnd/NogxCt+JrrP4lUcrVh7nvexlFjqYJ8P/Pb/k0n3SRs8jcwINKZK6rLx
         EejA6gOXUH5E0sK385h3mvIdv+ZS+UkCWfYbVSvxxNV/Ta44utQyicYStGr3+17aQ6nu
         PF+ZG2Vhj3Oze/FqWQDpEm7XCiBHoUGaiP5z6BoI972hHbufPVnXwxx209T4TMafefj7
         7/7A==
X-Gm-Message-State: ANoB5pkwSvI7CP2YBs6/al53HTSCJFJ+ImrlrBXI4+CIBDnWiIkaDquR
	x3zrYySQVLTtiQsaFDrHEJApzA==
X-Google-Smtp-Source: AA0mqf6YIHZPZijJW3drWLmCC0J1i77v6BfIk1GaXTBydT1hr0zvtFJFuTOMD/RjlZsQvYbm7cfMpQ==
X-Received: by 2002:a17:902:ed41:b0:175:105a:3087 with SMTP id y1-20020a170902ed4100b00175105a3087mr10067985plb.65.1668618681834;
        Wed, 16 Nov 2022 09:11:21 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b001788ccecbf5sm12424413plt.31.2022.11.16.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 09:11:21 -0800 (PST)
Date: Wed, 16 Nov 2022 17:11:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"Yao, Yuan" <yuan.yao@intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"david@redhat.com" <david@redhat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"Gao, Chao" <chao.gao@intel.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Message-ID: <Y3UZtoIidMyE8qVz@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-39-seanjc@google.com>
 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
 <Y3PzhANShVlTXVg1@google.com>
 <95ca433349eca601bdd2b16d70f59ba8e56d8e3f.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95ca433349eca601bdd2b16d70f59ba8e56d8e3f.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_091124_897946_42AE376C 
X-CRM114-Status: GOOD (  22.34  )
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

On Wed, Nov 16, 2022, Huang, Kai wrote:
> On Tue, 2022-11-15 at 20:16 +0000, Sean Christopherson wrote:
> > On Thu, Nov 10, 2022, Huang, Kai wrote:
> > > On Thu, 2022-11-10 at 01:33 +0000, Huang, Kai wrote:
> > > Hmm.. I wasn't thinking thoroughly.  I forgot CPU compatibility check also
> > > happens on all online cpus when loading KVM.  For this case, IRQ is disabled and
> > > cpu_active() is true.  For the hotplug case, IRQ is enabled but  cpu_active() is
> > > false.
> > 
> > Actually, you're right (and wrong).  You're right in that the WARN is flawed.  And
> > the reason for that is because you're wrong about the hotplug case.  In this version
> > of things, the compatibility checks are routed through hardware enabling, i.e. this
> > flow is used only when loading KVM.  This helper should only be called via SMP function
> > call, which means that IRQs should always be disabled.
> 
> Did you mean below code change in later patch "[PATCH 39/44] KVM: Drop
> kvm_count_lock and instead protect kvm_usage_count with kvm_lock"?
> 
>  	/*
>  	 * Abort the CPU online process if hardware virtualization cannot
>  	 * be enabled. Otherwise running VMs would encounter unrecoverable
> @@ -5039,13 +5039,16 @@ static int kvm_online_cpu(unsigned int cpu)
>  	if (kvm_usage_count) {
>  		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
>  
> +		local_irq_save(flags);
>  		hardware_enable_nolock(NULL);
> +		local_irq_restore(flags);

Sort of.  What I was saying is that in this v1, the compatibility checks that are
done during harware enabling are initiated from vendor code, i.e. VMX and SVM call
{svm,vmx}_check_processor_compat() directly.  As a result, the compat checks that
are handled in common code:

	if (__cr4_reserved_bits(cpu_has, c) !=
	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
		return -EIO;

are skipped.  And if that's fixed, then the above hardware_enable_nolock() call
will bounce through kvm_x86_check_processor_compatibility() with IRQs enabled
once the KVM hotplug hook is moved to the ONLINE section.

As above, the simple "fix" would be to disable IRQs, but that's not actually
necessary.  The only requirement is that preemption is disabled so that the checks
are done on the current CPU.  The "IRQs disabled" check was a deliberately
agressive WARN that was added to guard against doing compatibility checks from
the "wrong" location.

E.g. this is what I ended up with for a changelog to drop the irqs_disabled()
check and for the end code (though it's not tested yet...)

    Drop kvm_x86_check_processor_compatibility()'s WARN that IRQs are
    disabled, as the ONLINE section runs with IRQs disabled.  The WARN wasn't
    intended to be a requirement, e.g. disabling preemption is sufficient,
    the IRQ thing was purely an aggressive sanity check since the helper was
    only ever invoked via SMP function call.


static int kvm_x86_check_processor_compatibility(void)
{
        int cpu = smp_processor_id();
        struct cpuinfo_x86 *c = &cpu_data(cpu);

        /*
         * Compatibility checks are done when loading KVM and when enabling
         * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
         * compatible, i.e. KVM should never perform a compatibility check on
         * an offline CPU.
         */
        WARN_ON(!cpu_online(cpu));

        if (__cr4_reserved_bits(cpu_has, c) !=
            __cr4_reserved_bits(cpu_has, &boot_cpu_data))
                return -EIO;

        return static_call(kvm_x86_check_processor_compatibility)();
}


int kvm_arch_hardware_enable(void)
{
        struct kvm *kvm;
        struct kvm_vcpu *vcpu;
        unsigned long i;
        int ret;
        u64 local_tsc;
        u64 max_tsc = 0;
        bool stable, backwards_tsc = false;

        kvm_user_return_msr_cpu_online();

        ret = kvm_x86_check_processor_compatibility();
        if (ret)
                return ret;

        ret = static_call(kvm_x86_hardware_enable)();
        if (ret != 0)
                return ret;


	....
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
