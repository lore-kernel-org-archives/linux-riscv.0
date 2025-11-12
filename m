Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F907CD37B2
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slsM+Fbj+yDXRvnqXsw/TuVNtgy2hphlNCdXc8XG/MU=; b=rlISLm22J0mJps
	Yrhy8goC+ozSTsfbM2JW3wGutkQ+83nciwVpssgqe5Qq46+O9OBhNpYz3jCP7masWA28O2oIsjNaF
	FAw4RfVYMO0V2ZxhfNL7O8NHzjd6v+acTDrDHvl40cQMPpIh8J2fhTe/wL5jiwzvV5gaYr0pR6Wxb
	mPTQYFCu0Dcd/r4bUjrQi4z/4BsmQgKQGTiebbYzD894zolwkMfJLK5diAvaSoeyTdr21rcwO3gNr
	sFNFG7zgUmgsvk3a+jyIsG8wf7TUNpPfIJenNhpwALjtopsRu6ycS/HLOks7SmsvotL9tn4Hj13/2
	qyziRQxWBSAgxBKGiBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGj8-00000009QYy-3cOv;
	Wed, 12 Nov 2025 19:41:58 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGj5-00000009QXv-0Z9I
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 19:41:56 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-43377ee4825so430595ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 11:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762976513; x=1763581313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMA7umxa7M13/2nnsYuaSzmg/6tAsRTTmHWEbgAOFwA=;
        b=TF/aCnE6IZFUHZwX8ne8HLvEIUgtVZJbPGaZyDX36j91cU9M7shFxxb08cEUKD4NMW
         4cOnMuuvq42QHNu8tYc6zlmOLVmwkF+mEmoI1nQLrwdylFNAS/8oFPX24AbXC09iU9xD
         v01QHOxdL6Ji2CoUamcq4P0Zjnx6h7NTDgJh3kPBUwOI7cyfS4ENCxP8g0bGRyYJFB2c
         DRFl2lFUrhUwMHwE5GeBt1poe//lGJ9Vja38OMnuhjEO7YyTZwUlqMcrZTWHEolMud4u
         NbxtVtncFPMq1ZNsXpq3EQu0nKaDElYH24f7PYJqtEZ+/uEls9AqLHYW4QVlPNRPLSl7
         WIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976513; x=1763581313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMA7umxa7M13/2nnsYuaSzmg/6tAsRTTmHWEbgAOFwA=;
        b=j6iRtOEodZbUFyOOk7g0ygIA/fm96s276kqxo/P4EjsO5mLmSJk8PdFp81ZcHXqQzM
         fshi/htFoCCEfCKabVoL5UgcyZc4MWdimJNy1KSMyKmnpMYeAja6VwuStoItJ6TDMbf5
         1TEH9EzdBftVzeuxlm2NSDNhiA2hgS/2NlD0mlRfc5QaGZyTkMxNPhhyOZXrFxWgc1V/
         EH9Pi/bQWsnSzY7uqKG2vc2gYAIoD533perlGbTIMm6Jt5PDz5wZIq29v63v5CVskcIS
         kguSMEtHMvclHIhJ1iNzHaniZ6zBSxasTACXGwy5ia5Os9p3XFyRrRncv4eeW4Mfpm2/
         cS2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDk1GOY39HfonV4QGhL8r/ZGR+WoI80JexLXXgPkQ/VkbK47waO3kjxJJiYiXHWYrHp5aiqXk+F+tfHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLqmlXHilMLcQUpgPaJ/fLrq5hGRMJ+z2ZJYXRmWrTf4oWkHSM
	9eks0rIkHrWntpXN8+wHGssG50chmfhjk+W8ppG58eN943O9d3D7SPPoQq30BkHv2sQ=
X-Gm-Gg: ASbGncug3FtZx36OG5m+o5St7Jri3WZgceMk7AZZbCTbi9n8LOv+yb88BDa4c0AOdQv
	7mVnp6DHhUmkEWzxFBpM+h+96ur/W97upm4vVLjqm/lox28ZRYbaPDwNMXIRhzd2HHoEctAMGYK
	z1tV8pSwCO1RzgRam8vhrula7cYIl5+k67IIMZusJ7xO0b3plqpTBbOUSVKlAV3rtv0aZTOXt/y
	j3uHF4IouH39imjE5gP6CD+CRk12sPzdzC5Jd0mkFX1XwadGdDe8oF8Juo+fg5ZAuR1fc/Pk7bk
	2q4L378gnFY0rVl3Cp1zekkQCaZQR3B15OO9jJVCPvKsdC0JFmp1l2A9TodN5oLitWnm8BVQeYZ
	zFrfbhLyGgmujnM4mYpeo4D2DjtKEcTO0EZuEoBxT4kjdhVdeXF/uEASvKuoc5wDrdNO1SWYJET
	gjNDnGX+qiWqCY
X-Google-Smtp-Source: AGHT+IGh8DCFt1oIqqCbGQ0wsRQiBXjDUEe509PqSzAj7qQEM67Tz6IzQ/QYjRBR31SonG3aigsETg==
X-Received: by 2002:a05:6e02:1561:b0:431:d7da:ee29 with SMTP id e9e14a558f8ab-43473da5e33mr49322955ab.28.1762976513477;
        Wed, 12 Nov 2025 11:41:53 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7aaf78752sm1340522173.15.2025.11.12.11.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:41:52 -0800 (PST)
Date: Wed, 12 Nov 2025 13:41:51 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: Fix guest page fault within HLV*
 instructions
Message-ID: <20251112-ae882e7fd8d1fcbb73d87c6c@orel>
References: <20251111135506.8526-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251111135506.8526-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_114155_209880_A11FB284 
X-CRM114-Status: GOOD (  22.20  )
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

On Tue, Nov 11, 2025 at 09:55:06PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When executing HLV* instructions at the HS mode, a guest page fault
> may occur when a g-stage page table migration between triggering the
> virtual instruction exception and executing the HLV* instruction.
> 
> This may be a corner case, and one simpler way to handle this is to
> re-execute the instruction where the virtual  instruction exception
> occurred, and the guest page fault will be automatically handled.
> 
> Fixes: b91f0e4cb8a3 ("RISC-V: KVM: Factor-out instruction emulation into separate sources")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> ---
> Changes in v2:
> - Remove unnecessary modifications and add comments(suggested by Anup)
> - Update Fixes tag
> - Link to v1: https://lore.kernel.org/linux-riscv/20250912134332.22053-1-fangyu.yu@linux.alibaba.com/
> ---
>  arch/riscv/kvm/vcpu_insn.c | 39 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index de1f96ea6225..a8d796ef2822 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -323,6 +323,19 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  							  ct->sepc,
>  							  &utrap);
>  			if (utrap.scause) {
> +				/**
> +				 * If a g-stage page fault occurs, the direct approach
> +				 * is to let the g-stage page fault handler handle it
> +				 * naturally, however, calling the g-stage page fault
> +				 * handler here seems rather strange.
> +				 * Considering this is an corner case, we can directly
> +				 * return to the guest and re-execute the same PC, this
> +				 * will trigger a g-stage page fault again and then the
> +				 * regular g-stage page fault handler will populate
> +				 * g-stage page table.
> +				 */
> +				if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
> +					return 1;
>  				utrap.sepc = ct->sepc;
>  				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>  				return 1;
> @@ -378,6 +391,19 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>  						  &utrap);
>  		if (utrap.scause) {
> +			/**
> +			 * If a g-stage page fault occurs, the direct approach
> +			 * is to let the g-stage page fault handler handle it
> +			 * naturally, however, calling the g-stage page fault
> +			 * handler here seems rather strange.
> +			 * Considering this is an corner case, we can directly
> +			 * return to the guest and re-execute the same PC, this
> +			 * will trigger a g-stage page fault again and then the
> +			 * regular g-stage page fault handler will populate
> +			 * g-stage page table.
> +			 */
> +			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
> +				return 1;
>  			/* Redirect trap if we failed to read instruction */
>  			utrap.sepc = ct->sepc;
>  			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> @@ -504,6 +530,19 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>  						  &utrap);
>  		if (utrap.scause) {
> +			/**
> +			 * If a g-stage page fault occurs, the direct approach
> +			 * is to let the g-stage page fault handler handle it
> +			 * naturally, however, calling the g-stage page fault
> +			 * handler here seems rather strange.
> +			 * Considering this is an corner case, we can directly
> +			 * return to the guest and re-execute the same PC, this
> +			 * will trigger a g-stage page fault again and then the
> +			 * regular g-stage page fault handler will populate
> +			 * g-stage page table.
> +			 */
> +			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
> +				return 1;
>  			/* Redirect trap if we failed to read instruction */
>  			utrap.sepc = ct->sepc;
>  			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> -- 
> 2.50.1
>

To avoid repeating the same paragraph three times I would create a
helper function, kvm_riscv_check_load_guest_page_fault(), with the
paragraph placed in that function along with the utrap.scause
exception type check.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
