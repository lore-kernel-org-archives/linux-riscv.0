Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BBBC369A4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0p8uS8a1uB7luqachM3vhothRS558VVKg+dLcNywaY=; b=mN67rddWGaqZ5K
	/2coQl4ioGnNSm9mCA1nX4mnSBLoWN9qTLUQNIVwI9hVwig0nXbW9VbD9BhXVNJ3+GoRIAUaTZtwu
	WBGid99gPg77mqZ9a39FzuO93mGUuVvunFT9KEDvk4MYQDpeTWVzt7l0ytCZwMO1AdePX7hrf/ZJG
	JThlflcVNrvyLKhay6+NHFd/x7ZgLYT9LHG6RVvD2rvYJY9tfp6ADVarwJyUoqsZf1wYeHwz2Y9fe
	soqQWdbxX6G2NnGzxrs/t4Fm/hreUnzQCVQMHIz62Xor/AekhRIsX0LJ/HXyhDgirHIrSZtKNduaM
	5thboCNE0EVlbXqbq2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2naG-00000009o2O-1nf8;
	Thu, 10 Apr 2025 08:48:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2n5Z-00000009hq5-2Uq4;
	Thu, 10 Apr 2025 08:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uB+Z6x+VWnGWGieZgYK9ruFVlK20QbBkiLXO+vDsz2w=; b=Wjg+PVCtrtNOWu7AUd4A4kKRMN
	X7AvVDzvlWDxtYHCg+MYT4kRUd6r2iTn2US6oojoVMcGh033UfN5FIGcAqYYUqP+NBDE3tDrnS7TF
	GV7+w43k6VmvfmY1+6cyqopPdH79oktWgRSTQJ4DlWPHTvguEb/+HIMC1S+uKwsyYOXfar3VoqMvw
	/XMzNCdlye6wHEotel1CYkCZqH7xq/UZcXylgBuU52T2nKLvLUZmnlUb5gqOnHRsatb5ENs37fUYE
	Mg2RdH/RUY2KrIjBO0Epbebx1Nw6eTo1iSv1bvWXCpfrONOKn5leUL4JR+WJaWfpiQ+YtZqzJznDa
	XzdpvzRg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2n5V-00000008mN2-1kUp;
	Thu, 10 Apr 2025 08:16:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 00A143003C4; Thu, 10 Apr 2025 10:16:40 +0200 (CEST)
Date: Thu, 10 Apr 2025 10:16:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Alexander Potapenko <glider@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	kvm-riscv@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>,
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
	Joey Gouly <joey.gouly@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Christopherson <seanjc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 2/4] KVM: x86: move
 sev_lock/unlock_vcpus_for_migration to kvm_main.c
Message-ID: <20250410081640.GX9833@noisy.programming.kicks-ass.net>
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
 <20250409014136.2816971-3-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409014136.2816971-3-mlevitsk@redhat.com>
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
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 69782df3617f..71c0d8c35b4b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1368,6 +1368,77 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +
> +/*
> + * Lock all VM vCPUs.
> + * Can be used nested (to lock vCPUS of two VMs for example)
> + */
> +int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role)
> +{
> +	struct kvm_vcpu *vcpu;
> +	unsigned long i, j;
> +
> +	lockdep_assert_held(&kvm->lock);
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +
> +		if (trylock && !mutex_trylock_nested(&vcpu->mutex, role))
> +			goto out_unlock;
> +		else if (!trylock && mutex_lock_killable_nested(&vcpu->mutex, role))
> +			goto out_unlock;
> +
> +#ifdef CONFIG_PROVE_LOCKING
> +		if (!i)
> +			/*
> +			 * Reset the role to one that avoids colliding with
> +			 * the role used for the first vcpu mutex.
> +			 */
> +			role = MAX_LOCK_DEPTH - 1;
> +		else
> +			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
> +#endif
> +	}

This code is all sorts of terrible.

Per the lockdep_assert_held() above, you serialize all these locks by
holding that lock, this means you can be using the _nest_lock()
annotation.

Also, the original code didn't have this trylock nonsense, and the
Changelog doesn't mention this -- in fact the Changelog claims no
change, which is patently false.

Anyway, please write like:

	kvm_for_each_vcpu(i, vcpu, kvm) {
		if (mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock))
			goto unlock;
	}

	return 0;

unlock:

	kvm_for_each_vcpu(j, vcpu, kvm) {
		if (j == i)
			break;

		mutex_unlock(&vcpu->mutex);
	}
	return -EINTR;

And yes, you'll have to add mutex_lock_killable_nest_lock(), but that
should be trivial.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
