Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B519C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 03:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imV9FIBV2+jWjfBQBchToXrtmtrOk+nj7TjWWG8WV9s=; b=cNnbXPyfU/twYl
	Hw8u9rXYXRb8de9v/5nUqT3VOrt+h4avZgkyyo8tcfDa40lOws6Sx4NgxhE2lq0IAgFDS7bucBFTC
	yJWtgiNg00hf1hUpALbSz/EJsNIMA38pc05P7LZdJIvJPVYdIGKuMR3KZgI+M7fUpgCotCOLgNRIT
	46ymfDaGqIGZhAEgoT4dyBwM/3/IQyUnmKv9aaciH+z41Ofmf4oiQRr6qVx2zjUEjFAW2QdBR5sBC
	YD0tmYvC64WdpOtHQ5g/jQEJhtgOAtBbUc0Daoj8fQF2ZvE29UFwK2kWDAqzt3FVtF8mnI91xHpV/
	7moF/oucIa7fSffSXCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsS0-00BDwp-Fn; Mon, 07 Nov 2022 03:05:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsRp-00BDto-KW
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 03:05:19 +0000
Received: by mail-ej1-x633.google.com with SMTP id sc25so26619078ejc.12
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 19:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YDkpvmLdCcNS/SK5D2IL8ltTmU7MAjuwj9on9XdxjqM=;
        b=O2GdYT7cMyZAwXXzVaGGer2516sCwb8nVa+3zH1uKyisQxoW9HAvhvHCOOJeufiTbl
         F3Np7E0Q60MoiXXzv7QKKfVpPuct8EOqbYhrz0wkX1SdRI+8oB73JExLBlUhlEORndI0
         oR5Ci6Q9Zji0dGkOeDy61S11yj8qgzFtdaxDEMNt1vXTTwBDofXJXEd/zzO2opd/NDJm
         j1f/gZ4KRV3uPIBqcQXujsk4akPpTe+2a2n4m0j+UpZ//j9kycunMnHpdO3L/Ji7eqnQ
         U523Q+8cijpVSXguZZnGJMRJTHTEr5k6EgUTEZqzTJSespExVQpXPGZ+H7/pFHIEuIGk
         PlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDkpvmLdCcNS/SK5D2IL8ltTmU7MAjuwj9on9XdxjqM=;
        b=6OKNkfVXGqnsqRKzluxTMQ8Wkzon9ique0PdN77tDN5LGIZjdVnfK1825guyr1umQE
         i50E3rgtH+4fdlU7161LL1xrkvYqR4l4J3uoRWfUIcEfSQdsTS4Rw613q6KvYKwxwBo2
         6kF42u8BdO3gRM5CmPmWPE9+ND+AkBfre8Zz9EhViwLEhS5PkCAv+0WSMT+bNPUUeyJs
         YSk1pegodIoLlJLCPdXPeqc40SoH/lMyN+gRLeYOM2cvtQLxHY35NRbS/fmPiJhhpyM2
         ieKLWIvwwiMT7cpkmKnqE4caGLZ5CrvUXuvYY60pSzDj5T8hhrz7IxhqspVxpMWGFn0q
         gOMw==
X-Gm-Message-State: ACrzQf2qb7GfX2OLMb1Rp6CeVYR6U0lVfE3Dzn31J9gJf0C3eYTuH6uu
	UvM+rbzepr4d/6NdK0zzCVAqxlyd71ciRYtHfyNqkQ==
X-Google-Smtp-Source: AMsMyM525hQagKYMIlOIdqQEy/Sx/ht089FGqr8YQw810BAnhG6hulq/sfu3BFpHCBMEkVy5m+xwSwFEwA0SvamrVJs=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr46182007ejb.230.1667790314965; Sun, 06
 Nov 2022 19:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-23-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-23-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:35:03 +0530
Message-ID: <CAAhSdy01NfFuHCsA1mrcxERL+=8F=PQbD_Nu7qvdKQOyQ_p9Tw@mail.gmail.com>
Subject: Re: [PATCH 22/44] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_190517_702305_B91D21C1 
X-CRM114-Status: GOOD (  15.60  )
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

On Thu, Nov 3, 2022 at 4:49 AM Sean Christopherson <seanjc@google.com> wrote:
>
> Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
> bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is a
> glorified nop as invoking kvm_arch_init() is the very first action
> performed by kvm_init().
>
> Moving setup to riscv_kvm_init(), which is tagged __init, will allow
> tagging more functions and data with __init and __ro_after_init.  And
> emptying kvm_arch_init() will allow dropping the hook entirely once all
> architecture implementations are nops.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/main.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index a146fa0ce4d2..cb063b8a9a0f 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -66,6 +66,15 @@ void kvm_arch_hardware_disable(void)
>  }
>
>  int kvm_arch_init(void *opaque)
> +{
> +       return 0;
> +}
> +
> +void kvm_arch_exit(void)
> +{
> +}
> +
> +static int __init riscv_kvm_init(void)
>  {
>         const char *str;
>
> @@ -110,15 +119,6 @@ int kvm_arch_init(void *opaque)
>
>         kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
>
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -}
> -
> -static int __init riscv_kvm_init(void)
> -{
>         return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
>  }
>  module_init(riscv_kvm_init);
> --
> 2.38.1.431.g37b22c650d-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
