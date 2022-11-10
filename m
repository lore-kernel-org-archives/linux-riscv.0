Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16A6C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jT3b2PmTlx/cAhYuYN0+Qt6ndw5r291YrtivdU5/wA=; b=2CGLY9ARtaNZzS
	e4C8mzr8/ud4ksGT0eCClW7Bq1I3PGshMVUgEdDwSgCbGQF048PKEBcPaprmOGjQzm6kEYq3jjaq9
	YO24XqqEjelMoYur+0G/WEcuWGgu7mZbM3lcbilAA+FFii1de2Da1hSZdxnkh8g85vDNEBIN1WE2o
	YZXfI4JQ1PPmM1mbk0izlAmbkFG3BT4tqwJXUCBpdE5AzeNAAFGYGB+AVo/SwRLn62tNhO/mmX6A9
	IV8dxWRma3yPnwhp640Ho3AmAm/0mRH4U57blTVuvaYTZFufZn41vcptJHZNlhBxbkVohIduT/zqm
	bdNexOr7UDSWPdrASijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1xe-003mW5-1s; Thu, 10 Nov 2022 07:26:54 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1xT-003mTT-Kr; Thu, 10 Nov 2022 07:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668065203; x=1699601203;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pbTBjPz4IyVuY4zZ6WctFWouTkxuPa2wDTFr4cxuFDk=;
  b=iGLC+7mHIYSFNRhrJpUvtI30Z6FOKUrHFVyVRe36U8vheU9o/vpXMB+E
   a4kS9WgXOZG19AACpBHki0eHlsMGNL1PQLZjgDt83MUJ/uin1o/t3urA4
   wbB3lQXbbusWI4eh90HKt/8rv7r7AhoA38Qu9Zk2A4Su1X31GBfGHQ6aM
   JTnT74LRurMJrRTpPFcY3p0hXEI9sgppyX1fgcsWrtPn4mHo7MU4R6T8K
   QDcllEWFmvDL7qz5X1wZmJsXUKC7RfzQoWa+f+8HBGO3Jj1AGLvs5i+wj
   Cb3eSmcHUsdLCspIXf/hb8DK56WF75hBNjFJWJyBOin4OAqXAvem5ehMm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="309951011"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="309951011"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 23:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="700688553"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="700688553"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org) ([10.239.48.212])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2022 23:26:33 -0800
Message-ID: <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
Subject: Re: [PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
From: Robert Hoo <robert.hu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,  Thomas Gleixner
 <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
Date: Thu, 10 Nov 2022 15:26:32 +0800
In-Reply-To: <20221102231911.3107438-38-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-38-seanjc@google.com>
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_232643_781086_A0F11804 
X-CRM114-Status: GOOD (  28.20  )
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

On Wed, 2022-11-02 at 23:19 +0000, Sean Christopherson wrote:
> From: Chao Gao <chao.gao@intel.com>
> 
> The CPU STARTING section doesn't allow callbacks to fail. Move KVM's
> hotplug callback to ONLINE section so that it can abort onlining a
> CPU in
> certain cases to avoid potentially breaking VMs running on existing
> CPUs.
> For example, when KVM fails to enable hardware virtualization on the
> hotplugged CPU.
> 
> Place KVM's hotplug state before CPUHP_AP_SCHED_WAIT_EMPTY as it
> ensures
> when offlining a CPU, all user tasks and non-pinned kernel tasks have
> left
> the CPU, i.e. there cannot be a vCPU task around. So, it is safe for
> KVM's
> CPU offline callback to disable hardware virtualization at that
> point.
> Likewise, KVM's online callback can enable hardware virtualization
> before
> any vCPU task gets a chance to run on hotplugged CPUs.
> 
> Rename KVM's CPU hotplug callbacks accordingly.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Reviewed-by: Yuan Yao <yuan.yao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/cpuhotplug.h |  2 +-
>  virt/kvm/kvm_main.c        | 30 ++++++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 7337414e4947..de45be38dd27 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -185,7 +185,6 @@ enum cpuhp_state {
>  	CPUHP_AP_CSKY_TIMER_STARTING,
>  	CPUHP_AP_TI_GP_TIMER_STARTING,
>  	CPUHP_AP_HYPERV_TIMER_STARTING,
> -	CPUHP_AP_KVM_STARTING,
>  	/* Must be the last timer callback */
>  	CPUHP_AP_DUMMY_TIMER_STARTING,
>  	CPUHP_AP_ARM_XEN_STARTING,
> @@ -200,6 +199,7 @@ enum cpuhp_state {
>  
>  	/* Online section invoked on the hotplugged CPU from the
> hotplug thread */
>  	CPUHP_AP_ONLINE_IDLE,
> +	CPUHP_AP_KVM_ONLINE,
>  	CPUHP_AP_SCHED_WAIT_EMPTY,
>  	CPUHP_AP_SMPBOOT_THREADS,
>  	CPUHP_AP_X86_VDSO_VMA_ONLINE,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dd13af9f06d5..fd9e39c85549 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5026,13 +5026,27 @@ static void hardware_enable_nolock(void
> *junk)
>  	}
>  }
>  
> -static int kvm_starting_cpu(unsigned int cpu)
> +static int kvm_online_cpu(unsigned int cpu)
>  {
> +	int ret = 0;
> +
>  	raw_spin_lock(&kvm_count_lock);
> -	if (kvm_usage_count)
> +	/*
> +	 * Abort the CPU online process if hardware virtualization
> cannot
> +	 * be enabled. Otherwise running VMs would encounter
> unrecoverable
> +	 * errors when scheduled to this CPU.
> +	 */
> +	if (kvm_usage_count) {
> +		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
> +
>  		hardware_enable_nolock(NULL);
> +		if (atomic_read(&hardware_enable_failed)) {
> +			atomic_set(&hardware_enable_failed, 0);

I see other places using this hardware_enable_failed with atomic_inc(),
should here use atomic_dec() instead of straightly set to 0?
Though here is embraced by spin_lock, hardware_enable_nolock() can be
invoked in other places in parallel?

Fortunately in the end of this patch set, global hardware_enable_failed
is get rid of.

> +			ret = -EIO;
> +		}
> +	}
>  	raw_spin_unlock(&kvm_count_lock);
> -	return 0;
> +	return ret;
>  }
>  
>  static void hardware_disable_nolock(void *junk)
> @@ -5045,7 +5059,7 @@ static void hardware_disable_nolock(void *junk)
>  	kvm_arch_hardware_disable();
>  }
>  
> -static int kvm_dying_cpu(unsigned int cpu)
> +static int kvm_offline_cpu(unsigned int cpu)
>  {
>  	raw_spin_lock(&kvm_count_lock);
>  	if (kvm_usage_count)
> @@ -5822,8 +5836,8 @@ int kvm_init(unsigned vcpu_size, unsigned
> vcpu_align, struct module *module)
>  	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
>  		return -ENOMEM;
>  
> -	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_STARTING,
> "kvm/cpu:starting",
> -				      kvm_starting_cpu, kvm_dying_cpu);
> +	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_ONLINE,
> "kvm/cpu:online",
> +				      kvm_online_cpu, kvm_offline_cpu);
>  	if (r)
>  		goto out_free_2;
>  	register_reboot_notifier(&kvm_reboot_notifier);
> @@ -5897,7 +5911,7 @@ int kvm_init(unsigned vcpu_size, unsigned
> vcpu_align, struct module *module)
>  	kmem_cache_destroy(kvm_vcpu_cache);
>  out_free_3:
>  	unregister_reboot_notifier(&kvm_reboot_notifier);
> -	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
> +	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
>  out_free_2:
>  	free_cpumask_var(cpus_hardware_enabled);
>  	return r;
> @@ -5923,7 +5937,7 @@ void kvm_exit(void)
>  	kvm_async_pf_deinit();
>  	unregister_syscore_ops(&kvm_syscore_ops);
>  	unregister_reboot_notifier(&kvm_reboot_notifier);
> -	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
> +	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
>  	on_each_cpu(hardware_disable_nolock, NULL, 1);
>  	kvm_irqfd_exit();
>  	free_cpumask_var(cpus_hardware_enabled);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
