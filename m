Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD99C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 05:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmSRVdbYJluesdFoQS1nh2Pm81M5p9EK243rdNBTo84=; b=N2UipOhA53ehc5
	XpF7OM8B8gQ4LLyPAnfMJrS470D0SXn1pGWvACVv24XhZXXXIZB873No+HKNInd3+xLG37pKP/Jd5
	zro44pFaZOVoH6l99az07WecTzS1UHTEVtMVjYhEvAEYqXS/Hga03VHjy13DgZi3TL759H/HTgPJ0
	iV815vpApu0/Qp2t+GzbItpNPsuqR2SHA6zJ9GQKXVR/j+uW9hgB4qN23L8TsQUu/zeTesvg9GWRx
	8eGfKEMYe24ENwsRwAxTG1Z/yVx9EnjdjIp6CIp8ISQzjxrfBz5Hb0Cd8rdvsZ/LddLFNIcw5CvBQ
	OH6t6kRpSuTMsph1opxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqpP9-002RK0-Rj; Fri, 04 Nov 2022 05:38:11 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqpOy-002RHd-L8; Fri, 04 Nov 2022 05:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667540280; x=1699076280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EgmtsBqJVK3JbLONjG56zRgFCzcOwywt2/xTnCkOP1Y=;
  b=lDdXUvkL15LrpQwW1d2etOxF4Z+1SpQyXGfTntts16q445LTkEgW39OP
   ApJT4IQXbB7LtaeLkiSI5aPSVKIAq4i+beH4VjX2+JxnVFvjI0f/7qKq2
   sUEy4YgziydPvebwpDMyJIUxIscGggos2QHfuBx7/Ag3loqfW868gAQHM
   /CrOAa67KhPID43RV5FnDKUDbmrDPGcrNYfzhST4uzBTIWnjffD05jLik
   lpFGIZ5obhKAXFJOKXSf/wBBfTeNy4zafbhuu4JWbR0bUqmnswunIMpJJ
   nghi2FX2dfFySTBiGoi74bwJfQdh8DXmYBcorCric7kmK9tj85andChDC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="308598833"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="308598833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 22:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666249074"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="666249074"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 22:37:46 -0700
Date: Fri, 4 Nov 2022 13:37:45 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
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
Subject: Re: [PATCH 03/44] KVM: Allocate cpus_hardware_enabled after arch
 hardware setup
Message-ID: <20221104053745.qvi35kflf2i2ifgs@yy-desk-7060>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-4-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102231911.3107438-4-seanjc@google.com>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_223800_749099_239F99C4 
X-CRM114-Status: GOOD (  18.42  )
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

On Wed, Nov 02, 2022 at 11:18:30PM +0000, Sean Christopherson wrote:
> Allocate cpus_hardware_enabled after arch hardware setup so that arch
> "init" and "hardware setup" are called back-to-back and thus can be
> combined in a future patch.  cpus_hardware_enabled is never used before
> kvm_create_vm(), i.e. doesn't have a dependency with hardware setup and
> only needs to be allocated before /dev/kvm is exposed to userspace.
>
> Free the object before the arch hooks are invoked to maintain symmetry,
> and so that arch code can move away from the hooks without having to
> worry about ordering changes.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index e0424af52acc..8b7534cc953b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5843,15 +5843,15 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  	if (r)
>  		return r;
>
> +	r = kvm_arch_hardware_setup(opaque);
> +	if (r < 0)
> +		goto err_hw_setup;
> +
>  	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
>  		r = -ENOMEM;
>  		goto err_hw_enabled;
>  	}
>
> -	r = kvm_arch_hardware_setup(opaque);
> -	if (r < 0)
> -		goto out_free_1;
> -
>  	c.ret = &r;
>  	c.opaque = opaque;
>  	for_each_online_cpu(cpu) {
> @@ -5937,10 +5937,10 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  	unregister_reboot_notifier(&kvm_reboot_notifier);
>  	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
>  out_free_2:
> -	kvm_arch_hardware_unsetup();
> -out_free_1:
>  	free_cpumask_var(cpus_hardware_enabled);
>  err_hw_enabled:
> +	kvm_arch_hardware_unsetup();
> +err_hw_setup:
>  	kvm_arch_exit();
>  	return r;
>  }
> @@ -5967,9 +5967,9 @@ void kvm_exit(void)
>  	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
>  	on_each_cpu(hardware_disable_nolock, NULL, 1);
>  	kvm_irqfd_exit();
> +	free_cpumask_var(cpus_hardware_enabled);
>  	kvm_arch_hardware_unsetup();
>  	kvm_arch_exit();
> -	free_cpumask_var(cpus_hardware_enabled);
>  	kvm_vfio_ops_exit();

Looks good to me.

Reviewed-by: Yuan Yao <yuan.yao@intel.com>

>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
> --
> 2.38.1.431.g37b22c650d-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
