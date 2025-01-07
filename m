Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577BBE77199
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 00:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yA7+mxNUJGKrMEXB0HCK9XMx/JI1bkxmjzxjNZnejlA=; b=3hwVIx/mlNFcoH
	v/jnOTDYCZsFsysAhL4A4zIwzghguC67uUUKfbVLLfA3b6GE/OqOWpGK0nIm3JVhRPnyYwrsS1ANt
	oOOvgRYsesgs4PqCqPlLPHEPhobfzdblmnQPIg09m1GuHBjdblPAco5gvIMc8m/9f6cXbfSV4N7dt
	gE1z1JN3cZBO2EupL/+7tidLRtRQZl/z/kPNSaLjPAsBhSN9kD2S9J/BnOptfAcjItGwy8dqDw4j0
	m00kAXpg+Zf8rHI+GROGbrh0UT7KncJjEdQTKlwn21ggWUFnmhwPcTg3aXzIm7yJXIQ3XlRe2PJkU
	b41ml03VzKldTT02TszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxsA-000000034mS-15yg;
	Tue, 07 Jan 2025 00:55:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxs7-000000034lE-18AL
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 00:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736211301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Vh0pBL5XxbRXfdAMJHXvrZrZ2HC9oCwCXuoOG8KyG8=;
	b=iF6jb7YuB/J8CLbIyZrbF/RXK83rymGkl2F41j+dHZO8yye/uBmFPNJNaosi4QJUguRnlw
	q2RJOvOtUOgizM3UQNdemrfqgMxhaywhZa1b0FlmCzCOUAui8Xb8ngbN22fau0d+MS6M3N
	jLztOls79hkL/mITb5oumhX3O+MEUcI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-MZunJI95MGWIcTylTm5ycg-1; Mon, 06 Jan 2025 19:53:14 -0500
X-MC-Unique: MZunJI95MGWIcTylTm5ycg-1
X-Mimecast-MFC-AGG-ID: MZunJI95MGWIcTylTm5ycg
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6ecd22efbso2965641885a.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 16:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736211193; x=1736815993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtbBZcEWixSx8WxKTGxxVe9YGJddjHivheFuJ/OEl4U=;
        b=r3usMN7137DIQtyZBlSGzArxCeSjwrnduciBkrL1us8Zi4b7OukVvmCUjQhK0IPjO1
         or8Q69H5XBCJ4Pk5X7r8CHhVa1JL+UAXoVJcc21qNaRhYReKC+ayqGECiYe1HITh2Crw
         soebhTMwDHZKke1kcT/OagwaXo/v1uA6ubXeOJmhNlyRqLjQ8LVtJu/OAqiQFbPU/Cst
         v0dTem2aJJvzvQf7C1LFgnLIo8ikM0xnmFjRkwP7RBM7hpfI2J9CSXb0ti2GsYBb+5vY
         4bMY8wnPI10JHeQDXuKWeXrtrhIXk/C3QQN7P5Zk8a9199SEqi+5pRNWBPg3D+ezOZfd
         rfdw==
X-Forwarded-Encrypted: i=1; AJvYcCUbd/VeBczNuvTqpoYgBCVDxWWOECyud+ySpaqfmQRQQM9NmcpARt77TK1yPQog3FlRItuOxDSJK0S8yg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7v3bMnHDcUIP1tlECloE8P/7GdBFXOcLO+tVwV+zTwDXEApcU
	7LKopfvpELtmPMu53xMxf8tKI1Y5vx/q2L3PH+EOVMgvT2G0hx5PRsuFtup2KaO9Xvlfz3WMqFH
	hSVtwhU3wx85RZQWfDMSEPSZAtnGRb92K2qn25TB8O3Y+GJ15LCSMYTJBlpW7XAf4Mw==
X-Gm-Gg: ASbGncv77ElL+ITSHCoT0me1EKtKgtfnlpWqSLLE/l1aW8bM+OGN9I8GGqeE8tbmUXi
	bxVi0y45DM0aoKiaYOxUEXUn9QrfNUaFQz+MCqYt4uBsLtUOkOSlJFCWZCzpksRzBGBEvIuJEWm
	/HZZdyLKfw6Ozp165/NgoX9ON4Qr4MArZgraUoJUiMwsXmqbTb3hqDJDJCESJ683S4S5xboSll+
	fuL8b1DS46KpNZnkTdZ8KrOfEp4zgRhuGE0Xg91PoGYcxfr/NPs5uFGePeeNFy8xM4ZaaNHXtF6
	JL0qHAzkhNnPfqyJkxKWnf9ompfrNut0cX0gexcNXJ0Z3Q==
X-Received: by 2002:a05:620a:4391:b0:7b1:5545:7104 with SMTP id af79cd13be357-7bb90248f5emr233293785a.2.1736211193450;
        Mon, 06 Jan 2025 16:53:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH3zXukWoOxxE9GTC98eC7YuZVzhkxHUhqQrhYMYf+Tp1nGh3nJP16xZ6Vg5mME8zl35azTw==
X-Received: by 2002:a05:620a:4391:b0:7b1:5545:7104 with SMTP id af79cd13be357-7bb90248f5emr233291885a.2.1736211193119;
        Mon, 06 Jan 2025 16:53:13 -0800 (PST)
Received: from crwood-thinkpadp16vgen1.minnmso.csb (syn-050-074-019-099.biz.spectrum.com. [50.74.19.99])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4cd95fsm1549579385a.103.2025.01.06.16.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:53:12 -0800 (PST)
Message-ID: <e7972ba881ed8c0ed8c82379c4e9a2e88cd94ceb.camel@redhat.com>
Subject: Re: [PATCH v2 3/5] powerpc: kvm: drop 32-bit booke
From: Crystal Wood <crwood@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Alexander Graf <graf@amazon.com>, Anup
 Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Marc Zyngier
 <maz@kernel.org>,  "A. Wilcox" <AWilcox@Wilcox-Tech.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org
Date: Mon, 06 Jan 2025 19:53:11 -0500
In-Reply-To: <20241221214223.3046298-4-arnd@kernel.org>
References: <20241221214223.3046298-1-arnd@kernel.org>
	 <20241221214223.3046298-4-arnd@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lptg6mMkx0yOCOVU4_-jli4ASpdf1t2zUycOx9d5x-c_1736211193
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_165503_384133_B8AD8B1B 
X-CRM114-Status: GOOD (  18.33  )
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

On Sat, 2024-12-21 at 22:42 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> KVM on PowerPC BookE was introduced in 2008 and supported IBM 44x,
> Freescale e500v2 (32-bit mpc85xx, QuorIQ P1/P2), e500mc (32bit QorIQ
> P2/P3/P4), e5500 (64-bit QorIQ P5/T1) and e6500 (64-bit QorIQ T2/T4).
> 
> Support for 44x was dropped in 2014 as it was seeing very little use,
> but e500v2 and e500mc are still supported as most of the code is shared
> with the 64-bit e5500/e6500 implementation.
> 
> The last of those 32-bit chips were introduced in 2010 but not widely
> adopted when the following 64-bit PowerPC and Arm variants ended up
> being more successful.
> 
> The 64-bit e5500/e6500 are still known to be used with KVM, but I could
> not find any evidence of continued use of the 32-bit ones, so drop
> discontinue those in order to simplify the implementation.
> The changes are purely mechanical, dropping all #ifdef checks for
> CONFIG_64BIT, CONFIG_KVM_E500V2, CONFIG_KVM_E500MC, CONFIG_KVM_BOOKE_HV,
> CONFIG_PPC_85xx, CONFIG_PPC_FPU, CONFIG_SPE and CONFIG_SPE_POSSIBLE,
> which are all known on e5500/e6500.
> 
> Support for 64-bit hosts remains unchanged, for both 32-bit and
> 64-bit guests.
> 
> Link: https://lore.kernel.org/lkml/Z1B1phcpbiYWLgCD@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
>  arch/powerpc/include/asm/kvm_booke.h        |   4 -
>  arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
>  arch/powerpc/kernel/head_85xx.S             |  14 -
>  arch/powerpc/kernel/head_booke.h            |  39 --
>  arch/powerpc/kvm/Kconfig                    |  22 +-
>  arch/powerpc/kvm/Makefile                   |  15 -
>  arch/powerpc/kvm/book3s_32_mmu_host.c       | 396 --------------

Why are book3s files removed by this patch?

> @@ -228,23 +176,16 @@ static inline void kvmppc_save_guest_altivec(struct kvm_vcpu *vcpu)
>  static void kvmppc_vcpu_sync_debug(struct kvm_vcpu *vcpu)
>  {
>  	/* Synchronize guest's desire to get debug interrupts into shadow MSR */
> -#ifndef CONFIG_KVM_BOOKE_HV
>  	vcpu->arch.shadow_msr &= ~MSR_DE;
>  	vcpu->arch.shadow_msr |= vcpu->arch.shared->msr & MSR_DE;
> -#endif

This is an ifndef... the contents should be removed.

-Crystal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
