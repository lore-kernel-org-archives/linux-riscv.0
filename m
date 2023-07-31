Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C1FC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vb96Un+GACXnnt6c6smKgrx+iwmPihf82XeW4udj0MI=; b=WIzKqn59ohIgGs
	+OiFuPN1uBnT8+vFg8DL6tAT3bSDOSYYMdYy05OVOb49BOXPDbPI77lRgDmb+WhzpmhmV7SwSt49R
	1ldbYaauLS+D+KXFrt8uumMc296pFNC4RroaGXjPYLMozCawXlGKwRxRUUPh268QTJe3aDJQusPlx
	VsaBnd5pXZ0aBdrFW8W1EbhHjmA3QtNZyOgKBhS6oo8TU68UwdlVKdWKdevjQE+HX91WVTnVd44cD
	2KATe3oyfe2TVGn+phEmDhpUqKsc67B++feCPH4XnB2GlU/585M53cVzrKAi08OlooeLB1G9dEt7T
	/Gyn6KzSHqtblu5EKUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWq6-00Gs3B-1R;
	Mon, 31 Jul 2023 17:37:50 +0000
Received: from out-106.mta0.migadu.com ([2001:41d0:1004:224b::6a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWq2-00Gs17-1z
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 17:37:48 +0000
Date: Mon, 31 Jul 2023 17:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690825062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8YdaDmAxh2tQ04c65R6HIInMSDgiFElU1rQyABOujGA=;
	b=EX5P5RrbAyGLiUihHg1zPC7oGWSKDM/ElBWxcBqxOnEfqsICZbH2/AKd3VVoNKwHnOFruh
	7NElv6WY+11J1OOCKqt98Yd2d6vWX/LMv7f7kzf3/02EtNU3neXRdqSxXfp5KfexlS5rP8
	7iRednQbNTf1lNnkOTSMwB1k8yGXoT8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
Message-ID: <ZMfxYR41K71UV/84@linux.dev>
References: <20230729004144.1054885-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230729004144.1054885-1-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_103747_055339_57A512F2 
X-CRM114-Status: GOOD (  18.87  )
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

On Fri, Jul 28, 2023 at 05:41:44PM -0700, Sean Christopherson wrote:
> Wrap kvm_{gfn,hva}_range.pte in a union so that future notifier events can
> pass event specific information up and down the stack without needing to
> constantly expand and churn the APIs.  Lockless aging of SPTEs will pass
> around a bitmap, and support for memory attributes will pass around the
> new attributes for the range.
> 
> Add a "KVM_NO_ARG" placeholder to simplify handling events without an
> argument (creating a dummy union variable is midly annoying).
> 
> Opportunstically drop explicit zero-initialization of the "pte" field, as
> omitting the field (now a union) has the same effect.
> 
> Cc: Yu Zhao <yuzhao@google.com>
> Link: https://lore.kernel.org/all/CAOUHufagkd2Jk3_HrVoFFptRXM=hX2CV8f+M-dka-hJU4bP8kw@mail.gmail.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Looks good, and I don't think it'll conflict with anything on the arm64
side.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

> ---
> 
> If this looks good, my thought is to squeeze it into 6.6 so that the MGLRU
> and guest_memfd() series can build on it.  Or those series could just
> include it?

Eh, I'm not a huge fan of having two series independently reposting a
common base. It can be a bit annoying when the two authors have slightly
different interpretations on how to improve it...

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dfbaafbe3a00..f84ef9399aee 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
>  struct kvm_hva_range {
>  	unsigned long start;
>  	unsigned long end;
> -	pte_t pte;
> +	union kvm_mmu_notifier_arg arg;
>  	hva_handler_t handler;
>  	on_lock_fn_t on_lock;
>  	on_unlock_fn_t on_unlock;
> @@ -547,6 +547,8 @@ static void kvm_null_fn(void)
>  }
>  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
>  
> +static const union kvm_mmu_notifier_arg KVM_NO_ARG;
> +

I'm guessing you were trying to keep this short, but it might be nice to
use MMU_NOTIFIER_ (or similar) as the prefix to make the scope
immediately obvious.

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
