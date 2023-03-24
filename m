Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D15C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIL/cJ6ru6OqY7deCRcTeD+StZQ6lC4f5kS0x+xQw9M=; b=QypwdXpK3WUWoP
	rPTR4RwVhT38lKV00745NPGTXiFYzmN+IGwQnpntCiIOx9L54ZnsZ80mWy38nTVEG5UCsD0dBbSPP
	Hk478t0Sng3rXxUPDaNJtVTy1mQdOiGCXl9KAhf8ibm+Kl7YPA2CkgR2mQeLnWsiJbqnaAF7CsHax
	XfwVWB+7W/rrGc5ayyarOUJXusnIJ3BrfRb4c7dVGs9t/mm/rlE6rp4AyKBP2ZvMP0o0SiK0MwWjn
	QtgkXjhH6ocLJBmqR3HTSBKdVOQRTidUfEk3M6LBjotQuX4sj6hK51br78RAMQPWKHgLmFwT1EkQf
	vasaAFl7WdhEj2iqkeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgrT-004PkU-2c;
	Fri, 24 Mar 2023 12:49:39 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgrQ-004PjX-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 12:49:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j24so1730484wrd.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679662170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kOxe7EBPXmceOaVUQDFqzV8NWrK5YbiyHazBA1WrHg=;
        b=NYKcQwoezBYHeqcMKTaDC+q47PTXWcxwfnpiC5/cPBg4PXWGQkaM4HZ1XFfLXx5Qnc
         afbsEXMTz0DC/QvoIDqQf9a5CPOdMOPb3aG3bddsItKKfkzgB3lyJcyjBp+CSBPSdQde
         bFpT0suxKiEGi09N9qfcqWe9rpoVvfe7ZFAakZsqyPjxDUwleEYibq73c8IxmEMrl8xC
         UjZDmltA9Ss3nsIiVoS8q4XqCrMs7dxMxYiHUwqnOnYJgKQJMAoEwqJHlhF83BRnDFqD
         H35i7PXCE5J69cCeTN6PnpTUsYgZPH8y6dUIlKVPhAfKFvLn9AGKGUFGOCwMB5G3kKL7
         Kqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679662170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kOxe7EBPXmceOaVUQDFqzV8NWrK5YbiyHazBA1WrHg=;
        b=EFS31vWzWxicVgpzgekSjxd6ydd04mUY3HTMI2+qgYcmy7U9XsG1JA8PD81Fu0CK4E
         g1qem3n8WJytteCyqmctHAmSwWgVqrSg62dEK59PWdWzHtqE0JbzmhXDBikpPimWaZcH
         pt5CMsUG7vBMTVdlHVLOM1EKZFqR/t4kkLqK3BTz3JvHnWAm/mZfFyeMZegPeoSopxy1
         iuHn8lsCSUVDbhFQPbTaLIwpDxccWrAXvBGKs8elKcuySf9n3IN4dLnp6BO029zZDhV7
         st8uHLY8rfVMP0ZLvS2rCBMMRQZADrDc+uhIMP5t0IK7R8CL95y4bI0N/wu0gCYfoI1c
         gxAg==
X-Gm-Message-State: AAQBX9dwpiyYM14gEnoxBYp47TrnQJY3do9A1OOaOBu8aTnCrjso0+Fy
	nF8w8uExMGGlI5Z19Gv3/5AFPQ==
X-Google-Smtp-Source: AKy350ZAg1S8d+rI81fXey9mavkDFjsIZWH/m9UGelVes0TnmB9/9u5yuEtw6ODPnr3ODVH/9g5Q4A==
X-Received: by 2002:a5d:46d2:0:b0:2d8:97c7:713d with SMTP id g18-20020a5d46d2000000b002d897c7713dmr1636987wrs.38.1679662170440;
        Fri, 24 Mar 2023 05:49:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h10-20020adffa8a000000b002ce3d3d17e5sm18526410wrr.79.2023.03.24.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 05:49:30 -0700 (PDT)
Date: Fri, 24 Mar 2023 13:49:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: David Matlack <dmatlack@google.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: RISC-V: Retry fault if vma_lookup() results become
 invalid
Message-ID: <20230324124929.6epv73escdcwq44e@orel>
References: <20230317211106.1234484-1-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230317211106.1234484-1-dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_054936_543661_351F10A9 
X-CRM114-Status: GOOD (  24.64  )
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

On Fri, Mar 17, 2023 at 02:11:06PM -0700, David Matlack wrote:
> Read mmu_invalidate_seq before dropping the mmap_lock so that KVM can
> detect if the results of vma_lookup() (e.g. vma_shift) become stale
> before it acquires kvm->mmu_lock. This fixes a theoretical bug where a
> VMA could be changed by userspace after vma_lookup() and before KVM
> reads the mmu_invalidate_seq, causing KVM to install page table entries
> based on a (possibly) no-longer-valid vma_shift.
> 
> Re-order the MMU cache top-up to earlier in user_mem_abort() so that it

s/user_mem_abort/kvm_riscv_gstage_map/

> is not done after KVM has read mmu_invalidate_seq (i.e. so as to avoid
> inducing spurious fault retries).
> 
> It's unlikely that any sane userspace currently modifies VMAs in such a
> way as to trigger this race. And even with directed testing I was unable
> to reproduce it. But a sufficiently motivated host userspace might be
> able to exploit this race.
> 
> Note KVM/ARM had the same bug and was fixed in a separate, near
> identical patch (see Link).
> 
> Link: https://lore.kernel.org/kvm/20230313235454.2964067-1-dmatlack@google.com/
> Fixes: 9955371cc014 ("RISC-V: KVM: Implement MMU notifiers")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
> Note: Compile-tested only.
> 
>  arch/riscv/kvm/mmu.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 78211aed36fa..46d692995830 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -628,6 +628,13 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
>  	unsigned long vma_pagesize, mmu_seq;
>  
> +	/* We need minimum second+third level pages */
> +	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> +	if (ret) {
> +		kvm_err("Failed to topup G-stage cache\n");
> +		return ret;
> +	}
> +
>  	mmap_read_lock(current->mm);
>  
>  	vma = vma_lookup(current->mm, hva);
> @@ -648,6 +655,15 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
>  		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
>  
> +	/*
> +	 * Read mmu_invalidate_seq so that KVM can detect if the results of
> +	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring

s/priort/prior/

> +	 * kvm->mmu_lock.
> +	 *
> +	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
> +	 * with the smp_wmb() in kvm_mmu_invalidate_end().
> +	 */
> +	mmu_seq = kvm->mmu_invalidate_seq;
>  	mmap_read_unlock(current->mm);
>  
>  	if (vma_pagesize != PUD_SIZE &&
> @@ -657,15 +673,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	/* We need minimum second+third level pages */
> -	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> -	if (ret) {
> -		kvm_err("Failed to topup G-stage cache\n");
> -		return ret;
> -	}
> -
> -	mmu_seq = kvm->mmu_invalidate_seq;
> -
>  	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
> 
> base-commit: eeac8ede17557680855031c6f305ece2378af326
> -- 
> 2.40.0.rc2.332.ga46443480c-goog
> 
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
