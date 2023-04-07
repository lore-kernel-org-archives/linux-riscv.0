Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE248C76196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=76f3cJyHPeRdvy0OAKPt1/2y8+dLQw6PEl/Ao9HWWu8=; b=UCTSB1npIb/nGJZgMqlndkYlY8
	iT/4IAi9zmU8Awvqo4BU8jBQsIpWsmD01WnsVErWlDR5T33jNacuwDreBZkuJJpN4aj57tLOftQPW
	kp4qPeZHyvq3kkDIC+zcCHH1Wz4omXhrRdjsdwyGrwqqVkDGZryPsizN6d7Sjji0747JjFydgQSvD
	8kAi9taMKkOcrGpqdIgt6Ba7zl/RI8IhSkXEqs3aBIs5cQs079yRAW/2FYzMf7FSenTOKxOR+7xRt
	uheAc1b9DrUU41z2XPvvQhHPRsteSuv+3rn09yf6krNxVcVuQ4XDRlE+aALZZVLerPc4Rz3GphgjV
	xsmZ3fVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvXf-00BP2O-2X;
	Fri, 07 Apr 2023 23:30:51 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvXb-00BP15-2e
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 23:30:50 +0000
Received: by mail-pl1-x649.google.com with SMTP id y3-20020a17090322c300b001a06f9b5e31so52001plg.21
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 16:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680910246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFUj6O6CB3iiBV1uvi/t8sklxmHPNBdsFm6z4ma14Yo=;
        b=g5wwO/E/km9HV/J4Uo40AnPSisucwkmavL4S1Pf4Fx0jHCk1WbKxYKFrTEZxFx6XHp
         2exvb76Kc6SS9Ds8LXjXF0I1WFqClQxCNCC6sf4daSWTnp+YpnSO2121ov5N7kOpcqib
         YCLGPirwnvPcpp/S3fo5s+vT7QnEVjcGGwmgFHFlmScqbAaLkGHrQ6ia2vS3XVAARuDd
         sMCqZDZFuZewtQIjpJWpW7S/bUTL7IiTKNWpDkyOWB4W2AE70oenj4IH+Pui3ZI77/9t
         egivxNBn8aOes50PuEtPh0HjwIwXrfmgH5cXyJJ/cO29tWSweCMf9GcheLm+s0IsbY3F
         CJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680910246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFUj6O6CB3iiBV1uvi/t8sklxmHPNBdsFm6z4ma14Yo=;
        b=3CQq4oyeoHPgnFREpRr+YglSqg/OEQ9QXRtRygmBdmv9O+ggUchIQzpdf6ougFxNaK
         IdJN/3Q+gLc/jZQAgIzb84FrzdLa+JJUmBBdn5C7OiQDbbr2LaiX9cuC+2P/AU6q1efo
         DpUUIfkCRjVVaO4ydtWzyyIpRdi/r3ayWYfYIF8ACl5RV49S2ZuhcH2gZ0xHPI4ZCYzT
         ckTlIiHk+Zr/XgAPu6jn4mx36YGtKFmBk5qsNC6yIDRoz+cI974Zv9p/GMpE1WhRGg2C
         6NuPgQ5BpqIM1+KwJ+pMpTKwBs7QoUjfu8lOUr8+ZbMo2l2k44opZW9dQAMmlT5Wwk99
         g4fQ==
X-Gm-Message-State: AAQBX9cftBMY1ojA7qdCBB4ZAjG9toyhaCwl2k5DTVqLs5wktAKE1CJy
	ozVieCGxx7SZElqvsubqw/1CYdY4w7E=
X-Google-Smtp-Source: AKy350YxihhHFMNV20FoO+AQH03z9Y8GXCy5PhVvBVZ1Rdqa7VXUgXNseSxSRo6RlhR0sxbeKagnCEmAUJY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:cc01:b0:244:9909:6e60 with SMTP id
 b1-20020a17090acc0100b0024499096e60mr959943pju.3.1680910245959; Fri, 07 Apr
 2023 16:30:45 -0700 (PDT)
Date: Fri, 7 Apr 2023 16:30:44 -0700
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
Message-ID: <ZDCnpAd0fh2cKcpS@google.com>
Subject: Re: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom
 stat names
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Eric Farman <farman@linux.ibm.com>, 
	"Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=" <philmd@linaro.org>, Sathvika Vasireddy <sv@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_163047_884869_FE03FC7D 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 06, 2023, David Matlack wrote:
> David Matlack (4):
>   KVM: Refactor stats descriptor generation macros
>   KVM: Refactor designated initializer macros for struct _kvm_stats_desc
>   KVM: Allow custom names for KVM_STAT()
>   KVM: x86: Drop union for pages_{4k,2m,1g} stats
> 
>  arch/arm64/kvm/guest.c          |  14 +--
>  arch/mips/kvm/mips.c            |  54 ++++-----
>  arch/powerpc/kvm/book3s.c       |  62 +++++-----
>  arch/powerpc/kvm/booke.c        |  48 ++++----
>  arch/riscv/kvm/vcpu.c           |  16 +--
>  arch/s390/kvm/kvm-s390.c        | 198 ++++++++++++++++----------------
>  arch/x86/include/asm/kvm_host.h |   9 +-
>  arch/x86/kvm/x86.c              |  94 +++++++--------
>  include/linux/kvm_host.h        | 179 +++++++++++------------------
>  9 files changed, 314 insertions(+), 360 deletions(-)

For the series,

Reviewed-by: Sean Christopherson <seanjc@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
