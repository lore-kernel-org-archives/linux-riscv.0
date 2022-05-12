Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678DBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoPMc5VWQVN4QQsD0NIZ5xrNBnGtSxrA6IZwIIKZn9k=; b=a2Tv9ZNbsXZB6i
	UpdJpLIjgo3yl1rMhhcPdlbYINQAOlMMWLYaDeP8lXJUHD2zHbCAEjXj0a3zO/z4l75es9iMHDsrE
	nTpvTWVLRFRNWC9LN5bno7bDDGfC/1FJyyz0Y8wUISp69/CHO/8XmV99pKo1rli4Ps8fkhuiq6W9k
	LbmezbKtAmmgWkot8KZpIxMdYJfKxRDpGTo1xKcWNFaac+J/xIg0/XCSY40rvOo11XiJlK3AkxExI
	OYC97chHPahl5htmruXelLrr98X9NRipA/87qm8JGteKneOXj83yERVtX6ciYnzVYrzwmSs316Rwa
	n+B2fQmKsluGE305Evrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9R5-00CEQs-QH; Thu, 12 May 2022 14:04:59 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9Qb-00CEDC-3b; Thu, 12 May 2022 14:04:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ks9so10496510ejb.2;
 Thu, 12 May 2022 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fs8s4x4j/+asSW1i8f2Pukqgr0Ir/tJgvdWyY3yoq3U=;
 b=SUG5R4mvQVZygGuRddCDO8dZQacyk07/cAZawwDbBHFiIcz+Eh01oOdFt+8NMsiteQ
 s8AlWxu2/skdBIc9am1jSyRtORyb1BuvlFo2plpzUHEsxv9da1HNExENjJ/0t+nOi9bO
 k6oU2HkXL/cV0mXaW/mfigdUplLND8VcIPAZZRcd10cHVVgLxpSC20yq2GqMhOEn4o3v
 BX8j64LjIRumUuIVBipI3tL8S6DVa+sbn4U3DSEKiGesq+9Htf13sK9idkEcXbPWJtoW
 pmum4BbxGst/QvpAJs+YLlKzd9hKoO2n+ygfnHiEf87Cm4zp15vme9Bvbc6JHtHUcLB8
 yScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fs8s4x4j/+asSW1i8f2Pukqgr0Ir/tJgvdWyY3yoq3U=;
 b=HM/xmmNf3/vDg+ln3VY8jJ5tvsM91Xu+G1JXoe1oOVvbN1TcWX/gc4+ZfaXASLaR4t
 Y+zUmaYowN8TaiV4ZyupFT/EXlPP8+alqku72Uu64qLq3GKdPesnKIs9awqUj07otlFu
 P7lrC9cGbGBNhqHffxbRk5xZRNSbw5813X/85dvW8PRAI3e53f2p25BEvSrTK84SuN41
 Pjrw3a2hfVemldYqSASWrkWbKRisgN5Y66l5GnXaksCYOLRHs0+ocj2iG4Vy0PtYDWWo
 h89wsvxO874TVxggwgXzQwfjoir0w9amtNsZNBOkWQDcRSPkbwCj3JrxNBUDOpEj+7bt
 JNzQ==
X-Gm-Message-State: AOAM533luStjyFFljtdiA0+oVeHdG15ilr2HHanaTvrj6yxgtYp9sQjS
 x3G8OcMusl5glEjpqppfFpw=
X-Google-Smtp-Source: ABdhPJyt50qyYPCyD03r3/AJ3OUGuB2lb9Kyp65SglIgNSyfP293qaN/xBFVKFZfLgIbEagAjedBOw==
X-Received: by 2002:a17:907:3e86:b0:6f5:917:10cc with SMTP id
 hs6-20020a1709073e8600b006f5091710ccmr63430ejc.53.1652364264897; 
 Thu, 12 May 2022 07:04:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 r10-20020a508d8a000000b00428bb4c952bsm2609603edh.31.2022.05.12.07.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:04:24 -0700 (PDT)
Message-ID: <0d4e0b40-a2b3-789f-3adb-9da30c61403f@redhat.com>
Date: Thu, 12 May 2022 16:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] selftests: kvm: replace ternary operator with min()
Content-Language: en-US
To: Guo Zhengkui <guozhengkui@vivo.com>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>,
 "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)"
 <kvmarm@lists.cs.columbia.edu>,
 "open list:KERNEL VIRTUAL MACHINE (KVM)" <kvm@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Cc: zhengkui_guo@outlook.com
References: <20220511120621.36956-1-guozhengkui@vivo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220511120621.36956-1-guozhengkui@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_070429_224884_B55492A2 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/11/22 14:05, Guo Zhengkui wrote:
> Fix the following coccicheck warnings:
> 
> tools/testing/selftests/kvm/lib/s390x/ucall.c:25:15-17: WARNING
> opportunity for min()
> tools/testing/selftests/kvm/lib/x86_64/ucall.c:27:15-17: WARNING
> opportunity for min()
> tools/testing/selftests/kvm/lib/riscv/ucall.c:56:15-17: WARNING
> opportunity for min()
> tools/testing/selftests/kvm/lib/aarch64/ucall.c:82:15-17: WARNING
> opportunity for min()
> tools/testing/selftests/kvm/lib/aarch64/ucall.c:55:20-21: WARNING
> opportunity for min()
> 
> min() is defined in tools/include/linux/kernel.h.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>   tools/testing/selftests/kvm/lib/aarch64/ucall.c | 4 ++--
>   tools/testing/selftests/kvm/lib/riscv/ucall.c   | 2 +-
>   tools/testing/selftests/kvm/lib/s390x/ucall.c   | 2 +-
>   tools/testing/selftests/kvm/lib/x86_64/ucall.c  | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> index e0b0164e9af8..00be3ef195ca 100644
> --- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> @@ -52,7 +52,7 @@ void ucall_init(struct kvm_vm *vm, void *arg)
>   	 * lower and won't match physical addresses.
>   	 */
>   	bits = vm->va_bits - 1;
> -	bits = vm->pa_bits < bits ? vm->pa_bits : bits;
> +	bits = min(vm->pa_bits, bits);
>   	end = 1ul << bits;
>   	start = end * 5 / 8;
>   	step = end / 16;
> @@ -79,7 +79,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>   	va_list va;
>   	int i;
>   
> -	nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +	nargs = min(nargs, UCALL_MAX_ARGS);
>   
>   	va_start(va, nargs);
>   	for (i = 0; i < nargs; ++i)
> diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
> index 9e42d8248fa6..34f16fe70ce8 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
> @@ -53,7 +53,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>   	va_list va;
>   	int i;
>   
> -	nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +	nargs = min(nargs, UCALL_MAX_ARGS);
>   
>   	va_start(va, nargs);
>   	for (i = 0; i < nargs; ++i)
> diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
> index 9d3b0f15249a..665267c1135d 100644
> --- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
> @@ -22,7 +22,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>   	va_list va;
>   	int i;
>   
> -	nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +	nargs = min(nargs, UCALL_MAX_ARGS);
>   
>   	va_start(va, nargs);
>   	for (i = 0; i < nargs; ++i)
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> index a3489973e290..2ea31a0ebe30 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> @@ -24,7 +24,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>   	va_list va;
>   	int i;
>   
> -	nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +	nargs = min(nargs, UCALL_MAX_ARGS);
>   
>   	va_start(va, nargs);
>   	for (i = 0; i < nargs; ++i)

Queued, thanks.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
