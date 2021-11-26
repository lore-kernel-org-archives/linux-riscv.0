Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16847C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lG/E1RjiZBwY3nrSSRClCluvI4/9ulM7aIhkW61L5Q=; b=eq9piu5jFPxWCf
	NuHxSNTW6RO1TVt82qp3lE5y4RoG++VzEp/RkQ4zDOiIoZKKdyeB8lzbvv+SEXU9CAy3ZWmHGVh2C
	jBuvscAcTLn00VjYhKqp7T/i4e7rKMtbe92Lunm+KyvLkSRp09ZHGScRCSJdDrjUxpRXjUpqjzkVX
	x2cPD3HUhFPXlw8Ot61/DjoDy87bOo0QDpABpLkOG4VWqsv76dlBSdszEXerCNRR7x+CClq55V3go
	ezAZo9+gTHsCSGo1OLDIwFJYjFha38D77RbVI7otkhh5dRTJ+cYaf6KH9A/SIa0b9Q4/puhaODj+k
	vprqEVfoMuHjhZX+KkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqdrD-00B5wi-90; Fri, 26 Nov 2021 16:13:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqdrA-00B5vD-Qn
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 16:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637943227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TivTs0wWKeTxFbwRk84lL1Qj0tiDczM43dDBlfnrKZ0=;
 b=SD+FQtl17li5QPmcLhLq8oum8F3TWlbpyYyaT2QQUjgBC2Yfnx4X6Z0n9PEXOgNgwSZOYC
 QRfFCTKP40ZfqtFpDLtO3sarSF+qIi/55SVOyQcQzTwWmnXbvo48OG050xif7xyZkIxDWD
 Er/mZ+EejxJLX4MvcLgS2Nhj7r4umCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-c8l_yIgkMAufgYBwubM3zQ-1; Fri, 26 Nov 2021 11:13:42 -0500
X-MC-Unique: c8l_yIgkMAufgYBwubM3zQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9ED1023F4D;
 Fri, 26 Nov 2021 16:13:40 +0000 (UTC)
Received: from [10.39.195.16] (unknown [10.39.195.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E7EE76606;
 Fri, 26 Nov 2021 16:13:37 +0000 (UTC)
Message-ID: <4fcb162a-738b-64e7-6326-9f9967d1b8a8@redhat.com>
Date: Fri, 26 Nov 2021 17:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/4] RISC-V: KVM: Add VM capability to allow userspace get
 GPA size
Content-Language: en-US
To: Anup Patel <anup.patel@wdc.com>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-3-anup.patel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211126154020.342924-3-anup.patel@wdc.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_081348_954894_1D824CF8 
X-CRM114-Status: GOOD (  22.79  )
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

On 11/26/21 16:40, Anup Patel wrote:
> The GPA size supported for a RISC-V Guest/VM is based on the MMU mode
> used by G-stage translation. The KVM RISC-V will detect and use the
> best possible MMU mode for the G-stage in kvm_arch_init().
> 
> We add a RISC-V specific VM capability KVM_CAP_RISCV_VM_GPA_SIZE which

You can make it just KVM_CAP_VM_GPA_BITS instead - it's useful on other 
architectures as well.

Paolo

> can be used by KVM userspace to get guest physical address (GPA) size
> (i.e. number of GPA bits) supported for a Guest/VM.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>   arch/riscv/include/asm/kvm_host.h | 1 +
>   arch/riscv/kvm/mmu.c              | 5 +++++
>   arch/riscv/kvm/vm.c               | 3 +++
>   include/uapi/linux/kvm.h          | 1 +
>   4 files changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 37589b953bcb..ae5d238607fe 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -221,6 +221,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
>   void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu);
>   void kvm_riscv_stage2_mode_detect(void);
>   unsigned long kvm_riscv_stage2_mode(void);
> +int kvm_riscv_stage2_gpa_size(void);
>   
>   void kvm_riscv_stage2_vmid_detect(void);
>   unsigned long kvm_riscv_stage2_vmid_bits(void);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 9ffd0255af43..9b6d6465094f 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -760,3 +760,8 @@ unsigned long kvm_riscv_stage2_mode(void)
>   {
>   	return stage2_mode >> HGATP_MODE_SHIFT;
>   }
> +
> +int kvm_riscv_stage2_gpa_size(void)
> +{
> +	return stage2_gpa_bits;
> +}
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index fb18af34a4b5..ae97f6929897 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -82,6 +82,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_NR_MEMSLOTS:
>   		r = KVM_USER_MEM_SLOTS;
>   		break;
> +	case KVM_CAP_RISCV_VM_GPA_SIZE:
> +		r = kvm_riscv_stage2_gpa_size();
> +		break;
>   	default:
>   		r = 0;
>   		break;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 1daa45268de2..dac98df3101d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1131,6 +1131,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>   #define KVM_CAP_ARM_MTE 205
>   #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
> +#define KVM_CAP_RISCV_VM_GPA_SIZE 207
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
