Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE16EE6421
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1ClaZui4Vr4QYG/l2zegOUYdMfyvc4UB+1vBUUMoiA=; b=enL+csAYqQRMCf
	nX7n4thf6jz2tGOudI+R5gjsFuayQBVTSw4Qrht5DTLkxuly1B7gCGnhnRy/sTmSX0vuSF6MgrR4D
	4TPKlu7q9oOa8wnA21iAv34kEBAG/A3W2eP/px9f4KKyBihB83JFX/Cq2H4LJMg0Colc1EEUfEaaY
	ytrgLOPIr1KRQFf5aCn1++96jAsdARHc5ix2yJs65Uh1nnoYQSMl44a5jOtzgPXGol28bh70das2O
	mwFISlT8/sgciuAoXZcBsWX95nYu7O1aigZf99OxCCkOQxKqC5IfyKas9ohyC8K52KRn6VKkBfYRo
	zR/3G+A3TRabWP/kXDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2gb-009wka-3C;
	Fri, 15 Sep 2023 06:52:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2gY-009wjd-2P
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 06:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694760734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mil5Lpt/AWqT9ucliicGrw0zms2aJ9EQRoMaWTOR9i0=;
	b=SV2hrhHvksiGOiy9I7WRaF35D2wblp2MAGwvZXJy8/e62OLxYDhjfnv34Domv7DnICanJx
	JxHeLzM/tk3Jxrc0h8nQe5qUt3KmW6pTiaV1CCbkAWpApE7vN36lUdoJ4n/7jkX550DDdo
	OBrRpKaJ5YLeV7R17TKY+W6v5vvJPbI=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-NWfQMmgUNaqttgNl0aGO4g-1; Fri, 15 Sep 2023 02:52:11 -0400
X-MC-Unique: NWfQMmgUNaqttgNl0aGO4g-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6bf0c48641cso2246124a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 23:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694760730; x=1695365530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mil5Lpt/AWqT9ucliicGrw0zms2aJ9EQRoMaWTOR9i0=;
        b=pTTHNHyQovvZZikFrTzLUBrSQFyooi0wMOPlO1pfBts19DEBiSY3TSym9nGJ9Y6GmL
         kPoTI9Akk1MVE42nmh6dXwpKUpt9DJZu7oCQDDe9o+7U+LxoaATvOFLuvopof76A5bRB
         Razg8jJfV/Zbk4Je7G72gMHvtTDn8iK+qarlDBaMNfWQTQTz4h304NYBQOj1sWoVF4JX
         vnCDi9g5XFN9jFBbM/Zq10K+JzNR9s81P2nOL5DcnBoyP9ExFOvuwx+dUk8bKaSaO0mF
         W31BP9cMMmhWTbcZP8gC313VFz7lv7mVnkvGmj0IlWxJ19ruOl30TFcDBmgR+VGQ4+Qn
         RVCg==
X-Gm-Message-State: AOJu0Yyk2tgy/6e/EFaNX8zXiRVMc+JZmWFAWaf5cq1NrICMD9L54OvX
	fRfsI0Eet/L2z6CujJh2M9eYX17j80G6fol3n9WCxmUku2r5qDCcrXzSOrwKUNykF0a1dnN/8lB
	2KTcyuCF5AeJg6SVHXwSwclySmLWq
X-Received: by 2002:a9d:61d2:0:b0:6b8:691e:ec53 with SMTP id h18-20020a9d61d2000000b006b8691eec53mr692076otk.11.1694760730711;
        Thu, 14 Sep 2023 23:52:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5XKtDZPdccOWeAcP3oR13oWpgp0h0NQCTbBcXsI+ozwyS91W+C45E6K0TtmaCpK+EoMojSA==
X-Received: by 2002:a9d:61d2:0:b0:6b8:691e:ec53 with SMTP id h18-20020a9d61d2000000b006b8691eec53mr692067otk.11.1694760730535;
        Thu, 14 Sep 2023 23:52:10 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id a9-20020a056830008900b006b9b6aea237sm1367919oto.80.2023.09.14.23.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:52:10 -0700 (PDT)
Date: Fri, 15 Sep 2023 03:52:00 -0300
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 17/17] RISC-V: paravirt: pvqspinlock: KVM: Implement
 kvm_sbi_ext_pvlock_kick_cpu()
Message-ID: <ZQP_ELqR7y5recdD@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-18-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-18-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_235214_854428_E748D4D9 
X-CRM114-Status: GOOD (  16.58  )
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

On Sun, Sep 10, 2023 at 04:29:11AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> We only need to call the kvm_vcpu_kick() and bring target_vcpu
> from the halt state. No irq raised, no other request, just a pure
> vcpu_kick.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kvm/vcpu_sbi_pvlock.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_pvlock.c b/arch/riscv/kvm/vcpu_sbi_pvlock.c
> index 544a456c5041..914fc58aedfe 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pvlock.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pvlock.c
> @@ -12,6 +12,24 @@
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  
> +static int kvm_sbi_ext_pvlock_kick_cpu(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_vcpu *target;
> +
> +	target = kvm_get_vcpu_by_id(kvm, cp->a0);
> +	if (!target)
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	kvm_vcpu_kick(target);
> +
> +	if (READ_ONCE(target->ready))
> +		kvm_vcpu_yield_to(target);
> +
> +	return SBI_SUCCESS;
> +}
> +
>  static int kvm_sbi_ext_pvlock_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  				      struct kvm_vcpu_sbi_return *retdata)
>  {
> @@ -21,6 +39,7 @@ static int kvm_sbi_ext_pvlock_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
>  
>  	switch (funcid) {
>  	case SBI_EXT_PVLOCK_KICK_CPU:
> +		ret = kvm_sbi_ext_pvlock_kick_cpu(vcpu);
>  		break;
>  	default:
>  		ret = SBI_ERR_NOT_SUPPORTED;
> -- 
> 2.36.1
> 


LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Thanks!
Leo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
