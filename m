Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34469D1D489
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FRZUaE5JRvjChMmUoIe3IxdWQ7BkNiEqARjVwv41qf0=; b=kh12UclQc876ryYEd+F53i7fEk
	iZXzahrOsz1nDh9pXNjoBNhJOLJh2iPahgQ6+KQGMFBDlWP+g+m0TqMtC7ysTOTjvfAF/7yJoZjR5
	n8wXoWbM1uWFLi7HdQYA8R96wbwFv7tPpJgVWVXgXDX2O6ALMGhQ2TIeooBPe3/WdEF2vH+9Hf0Wn
	++TTAaOmviI2EPzBCtPhN8BjRcvzB6FG1pWgYYm85PpVlbs9/8XyVk/zoSHxZn2o/vniDZrGA+a6H
	qPeyqwixolTSoeb4IgC4tZlrPHL2npu4PhPbHMkkDAASNet7vtGjd21fwjkZ399rKXztOWyEKUPai
	x8UvDReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwF8-00000000nNq-30SW;
	Thu, 08 Jan 2026 20:04:26 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwF0-00000000nL3-10EK
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 20:04:21 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c337cde7e40so2269456a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767902653; x=1768507453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHDeNFz490Nrky17RXCNoP5KLrJVy9PVF3wfzv9VqJU=;
        b=iBDG/uYQC+MQeYboQZ3khGlDV+gPY2K1d36BnvNoSX1aM5jQayG2+i3TVC6A89jMgA
         g6xlzz6s/PE62wgby+pQhTz+xo02EvMybydibP9KRIi5ZpwH9ZlIR5fsPDiFe9N4228z
         6Y8Xbhr+IaxRrf82xb/kk9EiGZIg76Qo9x9Q5+OtaYIdjg2HV0WwSExIgoAkOno96BgF
         Gk8N/1AGcLgFC1rp6jWGSdhZZOvYiKFomGeRWjTLk94z2lOnDvRNdry0YpzDzHddVj/+
         D3VRW6+ltO+OopkmNN58Sb1Z9eoVa7Dgm0SQ+lP2uzR4CftL6ggCCz+91xO8txpP5CJc
         xFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902653; x=1768507453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHDeNFz490Nrky17RXCNoP5KLrJVy9PVF3wfzv9VqJU=;
        b=XMqtcyem9n7syk9rPRtk37Q/E0zusFLQ+uXXLI26xcO3QDn+963imrnOcIdmGE+0+o
         p5CF79CeZ0aZ8qUUyvRkoURYk0cx92ed0EEA4SgEHx3nBqNxVtRlqTOj8vC06w7egDSA
         rq9L/PmGoCBm+89CnQDkgqh2Qs7rzkZcYt+ueVKZ/1J7V3omXO7X4t5Yau+1w6w941Ob
         oDcjD1kVBKhH8AYx/wA+OP0GJcDaNBk/+KnCSrNbMjIxuHxkm65NWcO1JRmh+UPHeddC
         L/FgZrbLfJNGu0bbTEiVFWtn+OBSztN4cd8o7hMaV1/XtxJyfh8HZFzNFtCltqXhpINt
         K/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHsm2bZNRnMpT1NKakP1DnRpB4k0dso5g7JPR58c2ImHSgwNs72vvrQSA04fc+GR8Ni60SDOxKa3PPsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5GuHaUcBsNY5RAmWKrCb0DRabnQc2O7H+lrnUOTfILznI3KJH
	4ssV3UW9snKL6ic+bXx5HIYuvNZNofVW0ewLj7E3eYKb2uDiyocvAlpVbSh4wsUFIkXQSW5gfM3
	AiPvdIQ==
X-Google-Smtp-Source: AGHT+IFhKs48GN0WkSDiAO4qPNHLVPhcEoNB+pDwryoeKjyNGQcxURXgfxIrWzkPwVlbxpHNfeozbbrhcz8=
X-Received: from plhi7.prod.google.com ([2002:a17:903:2ec7:b0:29f:68b:3548])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3947:b0:344:97a7:8c6a
 with SMTP id adf61e73a8af0-3898f9cc49cmr7749765637.51.1767902652739; Thu, 08
 Jan 2026 12:04:12 -0800 (PST)
Date: Thu, 8 Jan 2026 12:04:11 -0800
In-Reply-To: <04c70698-e523-43ae-9092-f360c848d797@linux.intel.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-40-seanjc@google.com>
 <04c70698-e523-43ae-9092-f360c848d797@linux.intel.com>
Message-ID: <aWANuxukqWmo36N0@google.com>
Subject: Re: [PATCH v6 39/44] KVM: VMX: Bug the VM if either MSR auto-load
 list is full
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_120418_781525_EE7E558C 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, Dec 08, 2025, Dapeng Mi wrote:
> On 12/6/2025 8:17 AM, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 38491962b2c1..2c50ebf4ff1b 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -1098,6 +1098,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> >  {
> >  	int i, j = 0;
> >  	struct msr_autoload *m = &vmx->msr_autoload;
> > +	struct kvm *kvm = vmx->vcpu.kvm;
> >  
> >  	switch (msr) {
> >  	case MSR_EFER:
> > @@ -1134,12 +1135,10 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> >  	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
> >  	j = vmx_find_loadstore_msr_slot(&m->host, msr);
> >  
> > -	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
> > -	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
> > -		printk_once(KERN_WARNING "Not enough msr switch entries. "
> > -				"Can't add msr %x\n", msr);
> > +	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
> > +	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> 
> nit: Remove one extra space before "m->host.nr".

Oh, that's intentional, so that the rest of the line is aligned with the "guest"
line above.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
