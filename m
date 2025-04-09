Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7DDC369A2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 21:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYLoAxvFVrxcvUkHx/t5jBSSgslb9nEG6MAZ731EbBs=; b=LGtwSczP6+NKix
	gusUGF3+E0NY1MDHE48rt2R6HsTqdBw+x36BWxMaB1p4P/G2lnX27DLEmM+Nm8Jnj/igZmxdVyRtM
	kM1VWSDs0x5Yb0TJ5XDuUw9Intf5LbpkTyV0H0TY0H19ZCEfrfO3xJX3o63qbRU9oYLM01RvnBnq8
	b/MUs6gc3Qd0KVJguDTh8Av87MBZgre7/QfsuWKza1vj2hbpCFtAQJXH9RtTBWdEs8WBJs/ZBNnLW
	JgYGvVH62QzPRnyLFpIh/A68BxZVO4F601xeQMCf5lSkGWyEPUchVVi0SOQt45K3VoYnjyC+4qbhf
	IkNsYiJGy7Ou7RnyChuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2d7l-00000008beV-2lKu;
	Wed, 09 Apr 2025 21:38:21 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cIh-00000008UOJ-2cGi
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 20:45:45 +0000
Date: Wed, 9 Apr 2025 13:45:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744231523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ENOcZPIItp2JvszVxj/GE2Qd8ZKfpfM4JflKxCvjNwk=;
	b=xC8aSKQfjMqodNcjkUTLUjs/zqCFYnuOpjbh5P9WpT5NQV26kzbmBYXpCKWYi7kZGBKsxL
	gZW41lEMVPwc0O3ZChQyXo3FcMfH90y50iz05hYThAcZmGJ8iVYi08BYw8+X5iWzs50Hx2
	w3VkprowZiWZQ4RRthwlJQvvZgV2B04=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Alexander Potapenko <glider@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	kvm-riscv@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jing Zhang <jingzhangos@google.com>,
	Waiman Long <longman@redhat.com>, x86@kernel.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Boqun Feng <boqun.feng@gmail.com>, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zenghui Yu <yuzenghui@huawei.com>,
	Borislav Petkov <bp@alien8.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Christopherson <seanjc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 2/4] KVM: x86: move
 sev_lock/unlock_vcpus_for_migration to kvm_main.c
Message-ID: <Z_bcWBfhoUZfRzek@linux.dev>
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
 <20250409014136.2816971-3-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409014136.2816971-3-mlevitsk@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_134539_674208_D3AF73D7 
X-CRM114-Status: GOOD (  24.54  )
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

On Tue, Apr 08, 2025 at 09:41:34PM -0400, Maxim Levitsky wrote:
> Move sev_lock/unlock_vcpus_for_migration to kvm_main and call the
> new functions the kvm_lock_all_vcpus/kvm_unlock_all_vcpus
> and kvm_lock_all_vcpus_nested.
> 
> This code allows to lock all vCPUs without triggering lockdep warning
> about reaching MAX_LOCK_DEPTH depth by coercing the lockdep into
> thinking that we release all the locks other than vcpu'0 lock
> immediately after we take them.
> 
> No functional change intended.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  arch/x86/kvm/svm/sev.c   | 65 +++---------------------------------
>  include/linux/kvm_host.h |  6 ++++
>  virt/kvm/kvm_main.c      | 71 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+), 61 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 0bc708ee2788..7adc54b1f741 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -1889,63 +1889,6 @@ enum sev_migration_role {
>  	SEV_NR_MIGRATION_ROLES,
>  };
>  
> -static int sev_lock_vcpus_for_migration(struct kvm *kvm,
> -					enum sev_migration_role role)
> -{
> -	struct kvm_vcpu *vcpu;
> -	unsigned long i, j;
> -
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		if (mutex_lock_killable_nested(&vcpu->mutex, role))
> -			goto out_unlock;
> -
> -#ifdef CONFIG_PROVE_LOCKING
> -		if (!i)
> -			/*
> -			 * Reset the role to one that avoids colliding with
> -			 * the role used for the first vcpu mutex.
> -			 */
> -			role = SEV_NR_MIGRATION_ROLES;
> -		else
> -			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
> -#endif
> -	}
> -
> -	return 0;
> -
> -out_unlock:
> -
> -	kvm_for_each_vcpu(j, vcpu, kvm) {
> -		if (i == j)
> -			break;
> -
> -#ifdef CONFIG_PROVE_LOCKING
> -		if (j)
> -			mutex_acquire(&vcpu->mutex.dep_map, role, 0, _THIS_IP_);
> -#endif
> -
> -		mutex_unlock(&vcpu->mutex);
> -	}
> -	return -EINTR;
> -}
> -
> -static void sev_unlock_vcpus_for_migration(struct kvm *kvm)
> -{
> -	struct kvm_vcpu *vcpu;
> -	unsigned long i;
> -	bool first = true;
> -
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		if (first)
> -			first = false;
> -		else
> -			mutex_acquire(&vcpu->mutex.dep_map,
> -				      SEV_NR_MIGRATION_ROLES, 0, _THIS_IP_);
> -
> -		mutex_unlock(&vcpu->mutex);
> -	}
> -}
> -
>  static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
>  {
>  	struct kvm_sev_info *dst = to_kvm_sev_info(dst_kvm);
> @@ -2083,10 +2026,10 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
>  		charged = true;
>  	}
>  
> -	ret = sev_lock_vcpus_for_migration(kvm, SEV_MIGRATION_SOURCE);
> +	ret = kvm_lock_all_vcpus_nested(kvm, false, SEV_MIGRATION_SOURCE);
>  	if (ret)
>  		goto out_dst_cgroup;
> -	ret = sev_lock_vcpus_for_migration(source_kvm, SEV_MIGRATION_TARGET);
> +	ret = kvm_lock_all_vcpus_nested(source_kvm, false, SEV_MIGRATION_TARGET);
>  	if (ret)
>  		goto out_dst_vcpu;
>  
> @@ -2100,9 +2043,9 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
>  	ret = 0;
>  
>  out_source_vcpu:
> -	sev_unlock_vcpus_for_migration(source_kvm);
> +	kvm_unlock_all_vcpus(source_kvm);
>  out_dst_vcpu:
> -	sev_unlock_vcpus_for_migration(kvm);
> +	kvm_unlock_all_vcpus(kvm);
>  out_dst_cgroup:
>  	/* Operates on the source on success, on the destination on failure.  */
>  	if (charged)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 1dedc421b3e3..30cf28bf5c80 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1015,6 +1015,12 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
>  
>  void kvm_destroy_vcpus(struct kvm *kvm);
>  
> +int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role);
> +void kvm_unlock_all_vcpus(struct kvm *kvm);
> +
> +#define kvm_lock_all_vcpus(kvm, trylock) \
> +	kvm_lock_all_vcpus_nested(kvm, trylock, 0)
> +

Can you instead add lock / trylock variants of this?

kvm_trylock_all_vcpus(kvm) seems a bit more obvious in the calling code.

Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
