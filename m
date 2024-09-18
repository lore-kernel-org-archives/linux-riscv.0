Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F3ECCD1A3
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcAaeor7hfdt2MY6KNYbAo3d1QYFSKzDjpfwoGe8RN4=; b=TzJZYiI7T1S1Sw
	RoJPriq48w0KFkJlOKKPn508Svi2XNfNwbI/5WDxhzuB/CucrY3N0gD0cp7kmqWEepDk1kPxUHoyw
	lvhfqTmda2uaUP4s4yHVTqraWIiBxiaEC719bdfszdJJopZTcAVqYmLsE/WifH0fp77CXywi61GUv
	0/ALcTxz0AmeHfpQwh6aVDZfKnkLlpWWVGO655wyn2/uUOouJDDcGK2vTNQcJRdUZ4OQOGZVlSWRL
	fQeSbHRCbtFLkeLaL3Uh9LsGxPlVKwLSMAFRP0Ywsy5ugoPleFVq8BdtFGCGJCukTwq6CR7qV2CVh
	F3zN2OGL8WaX82EwT3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1squVE-00000008JRb-3vRT;
	Wed, 18 Sep 2024 13:13:52 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1squUQ-00000008JH2-40vq
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 13:13:04 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2f75c6ed428so56430881fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726665180; x=1727269980; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1UIao/Jz5H8HMYQFxpoEYcHdlz/BHFAG+1NToY/M7y4=;
        b=fR/yFmZ1k4IdFLUykJz4IHsHIqf/+TyZ1+8wgkDnKi3rRaN/dW8UK0esJyQQWjZqDt
         g/ssufohmAaDg9szM5iAXaN3IZcsBqF8H+fOFoH2myNsPXafP/GV40TZfsDW8RgSSMkF
         snsDtOVoTyROCL6S46Rgz+4J+ars/1+5QVk4GqcdDKg7Pxhi81IMdZt0D7vGlRAv3+iy
         0pIUpQyhV/XvE8Pe8M7nW9DJxiyUfUDIsm+3oCrjAtxreR+4bPXJB8UXKusif/o2pKAr
         RGBFa884B/18kBuB+PhoL1oFjlh3a8gTCWnStWesYdMZC+3s0kgVUKLWxQOGuvu7vXC/
         iWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726665180; x=1727269980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UIao/Jz5H8HMYQFxpoEYcHdlz/BHFAG+1NToY/M7y4=;
        b=ahFAcvW6PJe+5PEGQsc/ERDbD9HOT2TAK/HiTmKaRD7U4OlDFVqAX0la1MqDvxLfJp
         gpIRJZ/jLCE1Zmj4ex58srPiIjaA8izUQ/h0fjsIGKdwppJtvoHrakxuQ1smRCMan6KA
         C5dF1Qk1FkH7I1/T9qt0n0lUpkUBeLJ2m9kEBpH7WG9D/68OGKIkOw6nyqkmN0i8szQT
         BFFYfifudK4763aUgOyuMPxj6VGcJQYbB749umsPLSBxjdh6m6VqV/pRXC2hBa9YDQVJ
         ZrdbjRHFCQpkzu6gyJkTrvmth8kLAGLERRHiClonvRJbbHKJn+4vcvjcv3CoJu2YzkQv
         U4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWq/RNHM7wLC2lhH/a3+ylzEsF8LZHL0jjmc5nob4sCw61DLu4oig5Mu5RH+7Tjp5bKJ+sNN94tKorl8g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw4Jbnc+cwD2xG1sbinIN8P+u2oyTAU1bl88qKG9n4cQcceYQc
	vQQ9YBM0yr8RXKluYZ9DGQPGoRdhZZTgceJxGPRo6Whg+a5Q0q5DAAVhZQ3Eeuol+wA8esVtRo+
	xFvzBFiNd0E96WFz7B3+PEdkQcnrRdi9e5pM0RQ==
X-Google-Smtp-Source: AGHT+IF5izfJa+xhgK0mjYVqlKJIK89IcU1cb1NpZfcXm0pryp2o/BMT6N8z0wfXVAWqfUbW+2JjG7UdxmVTGR7xheE=
X-Received: by 2002:a05:651c:509:b0:2f3:fd4a:eac6 with SMTP id
 38308e7fff4ca-2f7919fe8d6mr81760011fa.18.1726665180209; Wed, 18 Sep 2024
 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel> <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel> <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel> <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
In-Reply-To: <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Sep 2024 14:12:48 +0100
Message-ID: <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_061303_009375_6C4B78A8 
X-CRM114-Status: GOOD (  16.15  )
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

On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
> Thanks Peter for looking into this.
>
> QEMU's cpu_synchronize_all_post_init() and
> do_kvm_cpu_synchronize_post_reset() both end up in
> kvm_arch_put_registers() and that is long after Linux
> kvm_arch_vcpu_create() has been setting some FPU state. See the output
> below.
>
> kvm_arch_put_registers() copies the CSRs by calling
> kvm_riscv_put_regs_csr(). Here we can find:
>
>      KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
>
> This call enables or disables the FPU according to the value of
> env->mstatus.
>
> So we need to set the desired state of the floating point unit in QEMU.
> And this is what the current patch does both for TCG and KVM.

If it does this for both TCG and KVM then I don't understand
this bit from the commit message:

# Without this patch EDK II with TLS enabled crashes when hitting the first
# floating point instruction while running QEMU with --accel kvm and runs
# fine with --accel tcg.

Shouldn't this guest crash the same way with both KVM and TCG without
this patch, because the FPU state is the same for both?

-- PMM

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
