Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438DEC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=p8COOJym2dH82RwBolXrTxGjR54Mcre0gGSgXAK81Tw=; b=HV19zz+7HTYSdbmHhky7YnjX4q
	r2PSim9smdUah5ilomtUmijWNsgWUeE9H4iCdT6xrXP+i1N11bQ5dq54G9waGNGURonfVvK7DPsuB
	Jp+t5w2jMt2rgbPv2FU0DYxXOODZdSWae4n3bpFHxGYOayY8IXpkgYv3PsEA87BFy7WAx7Ngx/uNs
	YtPZF7yGZ9HT/pEA0VAX1m4O/p1kJ1Ngpb9TIK0EznDI/oPoNt1ieZNEK7rVCM2chYfr9ICoJVUI1
	ljkibKLp4LGoHMzXYid+aiHbthQ+C9fUqJD3/dS9u0etyHg54MqsIwxskkIQth523rEKzbHwmKeU0
	ujnwWLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPmy-003v6e-07;
	Fri, 28 Jul 2023 15:54:00 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPmv-003v5Q-1L
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 15:53:59 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d052f49702dso2144020276.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690559634; x=1691164434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSKHeZCMgvA3kWIhrH+n4mSoJzgBzU5J6H2rFYp+lic=;
        b=36hr/ZVZer9RvAya4ZWnFnQbK8YQhtITqVZBkBjBo440v2c0X6eN0dTqrfwuSz7rnr
         k6WaexoqA62nX8FAG4nFQN42YtpTPoI2wh+3jJ8o7wPm1hCgTfuNVbS6EPbcqVQMYEN8
         yX6GAsSlGhmh3OfRqIjW8R05WSUu0K/X4fXpahOmLUZoi6YQFqEw5dv+/YSaOupBw3r1
         1QOJlnLq34i4AF+BnbyIEyZktriEUaH2gPVQf9yg//1ZrZLXvLnuD9WAlIPQNWkv2YPw
         izFsP5t0laJ87+k+PtVShNOsqU9+ABHsrNM8WXC1tgWj4cUC0mfYLX4gBDtMPyqVsRaM
         2pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690559634; x=1691164434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSKHeZCMgvA3kWIhrH+n4mSoJzgBzU5J6H2rFYp+lic=;
        b=UDmhxCfE2zD4Ha7mZDZcrY8UDMQiPjdlTjN0eeDX0RDajn/creApujFtEfkAfKWYli
         x0WD43+ZmSyy2TuTmz82EaunZpuXxrnlY6MugveMhkkZpnR9e5LA+q1T16hHoih6Ofcw
         T3jQ7T0w9vw+X5Xku4FrqYRGNCHxoDi73dVhT3Ra/PUSpoFPNmSnPtk5k13JTqjDgIZR
         RHao5dGVBMt+TEPng01S4x0AmcQmgGAR6U9PfYKuQAwF8t3hQOJWI9jfLoSbpXfNYtmf
         jkzEK+1X7v39vYvvQiQiugtuMaNJb7GZdP2yvQjlb67y6+92stwp3urvluD9kJTNBsT2
         vqcw==
X-Gm-Message-State: ABy/qLYEVEACkHr7uSpEMYrc2TVKA3MP9R8CAoJDKNsGq7SlJmtxBELz
	k9hevfv+xJnGf6salWXNoqrN2ygQ9hg=
X-Google-Smtp-Source: APBJJlHbJprqMW+zMuvG32ayD8bofMBAAKNaDzLOF7DuAIN4jyWdo3wXWE6hvbwHUsAc0SpOW5cSp73k0WI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:db82:0:b0:d0f:15a4:5a53 with SMTP id
 g124-20020a25db82000000b00d0f15a45a53mr10767ybf.2.1690559633993; Fri, 28 Jul
 2023 08:53:53 -0700 (PDT)
Date: Fri, 28 Jul 2023 08:53:52 -0700
In-Reply-To: <20230728-21d0e3ecb0d8916fd9d9bceb@orel>
Mime-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <7e9d2d5518375083f10c92a3d1acd98914f69fd8.1690364259.git.haibo1.xu@intel.com>
 <20230728-21d0e3ecb0d8916fd9d9bceb@orel>
Message-ID: <ZMPR56RVgzI6s6Ik@google.com>
Subject: Re: [PATCH 2/4] KVM: riscv: selftests: Add exception handling support
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, xiaobo55x@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Colton Lewis <coltonlewis@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_085357_450090_5D969C29 
X-CRM114-Status: GOOD (  14.44  )
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

On Fri, Jul 28, 2023, Andrew Jones wrote:
> On Thu, Jul 27, 2023 at 03:20:06PM +0800, Haibo Xu wrote:
> > +void vm_init_trap_vector_tables(struct kvm_vm *vm);
> > +void vcpu_init_trap_vector_tables(struct kvm_vcpu *vcpu);
> 
> I think we should use a common name for these prototypes that the other
> architectures agree to and then put them in a common header. My vote for
> the naming is,

Just allocate the tables in kvm_arch_vm_post_create().  I've been meaning to
convert x86 and ARM, but keep getting distracted/waylaid by other things.

https://lore.kernel.org/all/Y8hCBOndYMD9zsDL@google.com

>   void vm_init_vector_tables(struct kvm_vm *vm);
>   void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
> 
> > +
> > +typedef void(*handler_fn)(struct ex_regs *);
> > +void vm_install_exception_handler(struct kvm_vm *vm, int ec, handler_fn handler);
> 
> I'd also put this typedef

And rename it to (*exception_handler_fn).

> and prototype in a common header (with s/ec/vector/ to what you have here)

Hmm, yeah, I think it makes sense to let vm_install_exception_handler() be used
from common code.  the vector to be installed is inherently arch specific, but
it would be easy enough for a test to use #ifdeffery to define the correct vector.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
