Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B38C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEIhk2h+UJ9TVTzng+TCSiHN0KoGQRMd4RMLHPcOG8U=; b=NjgPjize4ROodg3hydEPvyYvaj
	FmLnvuTYSZpAeeS0xZxxMx1k3CLMsGF7OOsEVoTgVMIYuL2KfMfG9xtB0xV9Fswp0ZiCbgrxY0EiO
	08DpGjRVcQ6kh9mo3KlJkzeUQnlAhTpdv5336jE5pcdPbmJLVqZmHsDM8kV+CuvFdvXC9p1bf687M
	93N0lb4+bgWju6oxlgmjlL5zTPXMrEtte+8kXvgAJpOKU3RfwS2bUCtcfdiuLSHOlbEapM9MJ/E6h
	Yoa1WmiDpWOUHSeV+ZtWLGqR1+MCTBpTnBTlcAI8sZyw7jIh9I/xAbPcdQRQLe55kGzDW+6h/klKl
	RAfkResw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h2a-006oEE-Bt; Thu, 01 Dec 2022 10:43:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h2K-006o5d-3Z; Thu, 01 Dec 2022 10:43:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so1203229wms.0;
        Thu, 01 Dec 2022 02:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=34xRbeJm4Ksf3agn72vdHuQrCy+xFaOAkMI20jSUs8E=;
        b=AzHg60UfqWIuniRDwSV0kUn58L84AxRbLj1KxaWUpkExnaz9Jf0mpMJsRIxs0KObgd
         soQ1W7t6DClFqZL5Sz4pVLJxPODSdcfWH2JFiVW2zEBMerlLvjkR1+DJoc4+WpNBKL+I
         PW6xkLEEUmN/Se6yT0vIWJph39WzqIA+SJPH1Jsv7h7dKXsKvjwPoKUClZhTIgXjAbFD
         m9zWUx0GIE8Dv1vkZzsH73Fq4mPpvgYZnpRmT8AL17xzVUC4+XcR3wej4y3vY5DfOIdr
         5pF7L9v5/ffa3NIJyyFg3JxW0kRC69giw2m5lejSbkJhsGZxR9w1oE4BDHpBORKVLYtO
         3/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34xRbeJm4Ksf3agn72vdHuQrCy+xFaOAkMI20jSUs8E=;
        b=fcXhiOKxlSsJQwRcZRUXno4NQy05KqBBvX823S4vKYbDv7o0TWJ+UTEJIm1da3nnx7
         CG6uplTNLveJWW+0Luz5QQeARYUxhRafmq1tyQJ/eSVNR6FKHlL4xQErKfw74smoLu3w
         MHTqEgcT8cqecwoMUSz3njzTypm5edsoasdjJxy9cWO/Sy7EIkOpmptEbWwKk5UQkLSl
         yElIUow5hrfikhjC6XLwMWILRxxvUSmpxAnKpaPvy9gKzTj0Xhb3RObvkYNly62G6eHV
         hGzqz99lhCnLDmoxBOMJmRNkGaPqe72Ed+RqX+ggWTeuEecOJiu0zqrE0g8pih1fKsA+
         SmIQ==
X-Gm-Message-State: ANoB5pmvvvRABhR/7Z7yrmJbeR42EsEn3erlaVfkzKxBvBN4e2nZmgJ6
	goL3tGzeQYYtTyrJODGu+1M=
X-Google-Smtp-Source: AA0mqf6f8L9W/LFpuxiieU1hwL0SgbBmWKJep4VDP/7W75bGJuJSe0KFg6OoADvN7w7dpRP5siL0uQ==
X-Received: by 2002:a05:600c:1f16:b0:3cf:66a2:d440 with SMTP id bd22-20020a05600c1f1600b003cf66a2d440mr47429561wmb.108.1669891402569;
        Thu, 01 Dec 2022 02:43:22 -0800 (PST)
Received: from [192.168.0.248] (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id i10-20020a1c540a000000b003cfc02ab8basm8303094wmb.33.2022.12.01.02.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:43:22 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <aa3be096-4f05-b653-b801-e102abe01903@xen.org>
Date: Thu, 1 Dec 2022 10:43:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 34/50] KVM: x86: Unify pr_fmt to use module name for
 all KVM modules
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata
 <isaku.yamahata@intel.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>,
 Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-35-seanjc@google.com>
Organization: Xen Project
In-Reply-To: <20221130230934.1014142-35-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_024324_194566_396D92F4 
X-CRM114-Status: GOOD (  15.15  )
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

On 30/11/2022 23:09, Sean Christopherson wrote:
> Define pr_fmt using KBUILD_MODNAME for all KVM x86 code so that printks
> use consistent formatting across common x86, Intel, and AMD code.  In
> addition to providing consistent print formatting, using KBUILD_MODNAME,
> e.g. kvm_amd and kvm_intel, allows referencing SVM and VMX (and SEV and
> SGX and ...) as technologies without generating weird messages, and
> without causing naming conflicts with other kernel code, e.g. "SEV: ",
> "tdx: ", "sgx: " etc.. are all used by the kernel for non-KVM subsystems.
> 
> Opportunistically move away from printk() for prints that need to be
> modified anyways, e.g. to drop a manual "kvm: " prefix.
> 
> Opportunistically convert a few SGX WARNs that are similarly modified to
> WARN_ONCE; in the very unlikely event that the WARNs fire, odds are good
> that they would fire repeatedly and spam the kernel log without providing
> unique information in each print.
> 
> Note, defining pr_fmt yields undesirable results for code that uses KVM's
> printk wrappers, e.g. vcpu_unimpl().  But, that's a pre-existing problem
> as SVM/kvm_amd already defines a pr_fmt, and thankfully use of KVM's
> wrappers is relatively limited in KVM x86 code.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
[snip]
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index b246decb53a9..3bf7d69373cf 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -5,6 +5,7 @@
>    *
>    * KVM Xen emulation
>    */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include "x86.h"
>   #include "xen.h"

Reviewed-by: Paul Durrant <paul@xen.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
