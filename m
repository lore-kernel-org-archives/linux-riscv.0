Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01426C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 17:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LA+Hv6AWzzqVfirLvpEnfRmsMsOQ972sEjdd2cRkcQw=; b=cjPWNwbB99UejPGhQpJ2rlMe7l
	8U6doIqo6+c9ORNhVDUzJa5Xo14tlL/OKd3vQ3XO8cByKN0BcQq3+T3IalS9ye6tVy+0s9HNJx2jl
	Ody2q6KFrBbJHWjEKDlqwqyKyH0zNIllHtlORJqY2jB3oNbcQ7BJijQKqEKrBS2eVAT80yX7WDkFA
	7Pfd2VCkMN0KEIXBfF0K19DJFLr+outYj8AvkAdudFzm15Xm+MsjyRa4nPRcFcpxWPTSnqZg8nFiO
	Mew7EHqUBcS6eyWdU+g5gXmxXZ8gs9mh7n/SIWmBtRRb54NWup0YTr5xfiIK/XpqZkDYXna0UdvU8
	126yL5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGhi-000000037tx-18mr;
	Tue, 22 Jul 2025 17:23:02 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGfD-000000037g3-0hEG
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 17:20:28 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2356ce66d7cso90671945ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753204825; x=1753809625; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxAdZVy5bnkl4KqmKmn73hf8YAbhvCFGtW8F9Kd55hQ=;
        b=JvpO2IXpxEJwkPtwujauH7AZmLJVP9zvfrXTFESKBE3Sf35FApwbdhVSIiso3m9psC
         uQMZrAT9dx9700uO9gZ07RJpYRCaFlphVUYUrl/DJr2X7o0ESvYvGXsluXmcggSYiVhC
         u/CDiTiTiZu9XarbrYKn1/Gae1r0/gUM+UQQoZCA/DSO5GgYRMOuYptGZGYrgX//ixmh
         ghHvA5LzewpEZKfgOqwU0ed3/j2IluWKlPksTR5wNeENpVHVUoIvR3H4BKeG2SiQqtGx
         oxEY6bfPbgcrQh4A7piOXQibHZSSjm0mShb3yTg0B57nkZZlxtD5rTG5YeSM4zkA9NcE
         OB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753204825; x=1753809625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxAdZVy5bnkl4KqmKmn73hf8YAbhvCFGtW8F9Kd55hQ=;
        b=oWdJh6zrW/xUTZXlhWo1xCaBK4kTTRiqqB3afyMFyIuMJmJOSEXQgS0UDAaMgeEbPp
         JaHSFR9JhOEQdlD4ZNKVynL1jGqPuOi21SPL9OqpaGR+TSy5B8JcD5VTnBzipg3Ks0ZR
         o7+dRtsiGXYkbd7ECSJ1rOHED4/GiQPmba1m1doptZiu96W2dE1jiGiZBfvNXV0TIru9
         HV9XUrJ7s0Ynm2Mi14Yzg1za4smxvZ7FcsfFxIL3FIMcNTCKDWlRkXGsGOznacn6rDja
         YWtYq4W+yRNpW/Lc/iwFbRdrzaxYdKBJAnxjGp0C7t/kfDAEWyG8M8L5h1m1kr35W7wD
         rA7A==
X-Forwarded-Encrypted: i=1; AJvYcCWSZ3nQYs4yw6R2opSDSntVNLsvy48nJWpNPsvHJAr6YlOBJ/jdioUHmDrOaNNIZzmy4UtxrIW/n0Op0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzyMvvpGOUBbQX0cwzUWx5LwVvE6zjY9L7EYX66r6wkOPbZxXO
	GIDnsdRXuvJNkZXTHOv98/BIZ2gnHqsU7f0tfeH5usw76MIM6GvtrwEDYoyBiGNNGHvbqc+vdXt
	n3CSfWQ==
X-Google-Smtp-Source: AGHT+IFPwqe8zheAvHey8s0KE1DDyf7guFt8iRaY4PC5Rd3QBhN41iFPFY93hbtWc17LP1SCCWCPuinQiL0=
X-Received: from pjbnt20.prod.google.com ([2002:a17:90b:2494:b0:31e:40d4:1d0e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2342:b0:235:ea29:28e9
 with SMTP id d9443c01a7336-23e25764c41mr424140005ad.38.1753204825492; Tue, 22
 Jul 2025 10:20:25 -0700 (PDT)
Date: Tue, 22 Jul 2025 10:20:24 -0700
In-Reply-To: <20250721-pmu_event_info-v4-6-ac76758a4269@rivosinc.com>
Mime-Version: 1.0
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com> <20250721-pmu_event_info-v4-6-ac76758a4269@rivosinc.com>
Message-ID: <aH_IWJUFVODUGuva@google.com>
Subject: Re: [PATCH v4 6/9] KVM: Add a helper function to validate vcpu gpa range
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_102027_197313_5F352E89 
X-CRM114-Status: GOOD (  13.89  )
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

On Mon, Jul 21, 2025, Atish Patra wrote:
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3bde4fb5c6aa..9532da14b451 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1387,6 +1387,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
>  
>  unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
>  unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
> +int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
> +				bool write_access);
>  int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
>  			     int len);
>  int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 222f0e894a0c..11bb5c24ed0d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3361,6 +3361,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
>  }
>  EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
>  
> +int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
> +				bool write_access)

Please no.  "validate" is way too ambiguous, the result is inherently unstable,
I don't want to add vCPU-scoped APIs (too much x86-centric baggage), taking an
arbitrary range without a user adds complexity for no benefit, and this is basically
the same as kvm_is_gpa_in_memslot(), but with write requirements.

I would much prefer to add a simpler helper to complement kvm_is_gpa_in_memslot(),
that makes it as obvious as possible exactly what is being "validated", e.g.

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..29be907d28b0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1915,6 +1915,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
        return !kvm_is_error_hva(hva);
 }
 
+static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
+{
+       bool writable;
+       unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
+
+       return !kvm_is_error_hva(hva) && writable;
+}
+
 static inline void kvm_gpc_mark_dirty_in_slot(struct gfn_to_pfn_cache *gpc)
 {
        lockdep_assert_held(&gpc->lock);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
