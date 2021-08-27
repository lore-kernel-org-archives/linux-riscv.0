Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7922EC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 373FF60F92
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 373FF60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDFR/5VKGNOqtDJK4+thi6+tzXgKZCFWSjUFb+X/Plg=; b=dFROSVPVxF+nIA
	/tRQGvF8Wcb/Y4Em5H6bjEJaSV3Mu2zhZ95i1WtZSj2/LspkjqHcQAIliM5EkjCNN8LarGt76vNhy
	dWNvmPzcxLV1hnbvS00m9hUd1IdTN8Mh+x6oStQXBVNp2IAcT0yXMGAemTzcMGewV2S/QBGf6cdJg
	UYabr7d8rHIwQEAj1rGKXAke8uUl1BnBbG4A9jkE2bdYDbpnFogCBwsUT052QBgAXdDpS5kxywzj9
	pfY6TILgeHBj6f3PkN2mIPzOcCmBaFcOPL1IXWF1WQUSCZGivK+YIzTcEb69xCK71WyTNCr5YunXv
	Lv7NoA4Gq7r8kJy5S+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJWL3-00BqsI-Pu; Fri, 27 Aug 2021 07:31:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWKr-00Bqrl-MX; Fri, 27 Aug 2021 07:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pX/U+rVEPbfrs2KxIK3fTT5zek69Vi8l41Blp4tBLok=; b=Yc/w61MYBYU/2XovOdaG/1LI+3
 ofvXZY72T/bqQpEDQIopTT41ymuCj9LCYB3YpGsaZsw8I7lr88Q2nTCRx2MpWUAJi2+3qnashJI4R
 pq0hm4wrqjtQzjgnu14Y0Hv71MTmXVlwUtR00yaCrR+u7hNfiDC4NQgkVvvO74M9TS46PVdKtznHr
 cI35oR72a6g4a2mZG68PMOuldBKtE8eyE5BYPjhe0gvPrNhQPT9HfquqIFtVn1+9kmnU1uaROxDf6
 T9v8X9G4zCE0HsYiDhrr3Coe9vaArCNE5m8ZWnIbYQ2Ri33yjkJEKLCpR695YXtWTkmMXBqMBOcvc
 uj1qfSCA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWJz-00EFo3-0q; Fri, 27 Aug 2021 07:30:56 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0C6F23005AD;
 Fri, 27 Aug 2021 09:30:37 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E07822C6670E9; Fri, 27 Aug 2021 09:30:36 +0200 (CEST)
Date: Fri, 27 Aug 2021 09:30:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH 07/15] KVM: Use dedicated flag to track if KVM is
 handling an NMI from guest
Message-ID: <YSiUnDbi/aZ3nunT@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-8-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827005718.585190-8-seanjc@google.com>
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

On Thu, Aug 26, 2021 at 05:57:10PM -0700, Sean Christopherson wrote:
> diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> index 5cedc0e8a5d5..4c5ba4128b38 100644
> --- a/arch/x86/kvm/x86.h
> +++ b/arch/x86/kvm/x86.h
> @@ -395,9 +395,10 @@ static inline void kvm_unregister_perf_callbacks(void)
>  
>  DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
>  
> -static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
> +static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
>  {
>  	__this_cpu_write(current_vcpu, vcpu);
> +	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
>  
>  	kvm_register_perf_callbacks();
>  }
> @@ -406,6 +407,7 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
>  {
>  	kvm_unregister_perf_callbacks();
>  
> +	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, false);
>  	__this_cpu_write(current_vcpu, NULL);
>  }

Does this rely on kvm_{,un}register_perf_callback() being a function
call and thus implying a sequence point to order the stores? 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
