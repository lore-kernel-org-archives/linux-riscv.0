Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A12C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ve5tKrCIfaCVmQbLnAx5hTDoELvj4XwrTFCSj6PsELk=; b=TitTmI82TTjjNq
	xuU1wt/57P5dw8FmvDFnMFqrBwt6qL8bOxJn53Q7tSqm4+LYrUHsMoyS3oxynW8oksHe4GehIR3M5
	p95FAq1SfnhOGdGdchpCxoaGTUmI9YyjiWJnli/p8Qyo2/jpCHmai4P6bXcLIEPOx2ETJnmP8VYXt
	mMheWmewWOOdcrAgXaAWZsM72AwWu2sUnSgO99ZGZd8TTB3O3JmG73UyedUQ07tr8E5R6HQy9jkjf
	xA97lzwE4WR/koxoQbK7tsowH/FIWv0vd2UkiIJhusUtJiE6HgUtrg3MDNjxoA/bHVYQBmI3rRiBG
	sWe9e0UJ4NwiJiPFUpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1non5L-0077lF-9R; Wed, 11 May 2022 14:13:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1non5A-0077fQ-28
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 14:12:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so1322836wmn.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RSGHn1F0BncOfTcKYhrKyIk0Nc9jRJLzLB3ecNcIZy4=;
 b=jW12ZwQnnCztcNwkigLKzLeyKxuLaypSdNh5RLphYPfrxCmn7JNKcAFQyhsDExQ715
 wJwjtZki4XfUaxqAYliizclV7JqcbjMJZH3O294nmneM4g9jdOzsk+Y7dwWTdMhJNmFr
 luTgFG70VKGd5rBsQuYZFTUjRfEcJ0/y7nPhAyW1ERcls1P51FqhBYBEYo8vF1V2mXNd
 8SRsu7Z8MrurgPTYpBt1TQjav+1DEREjLXAbJ0D6pm6Q+pDArYfJ2vpNCWaWnM02wpn/
 0SNSQoIcK+vj+GrpRIllI9L4jtsan3nrlQwi8mHwvPTLx1sPHdv/4t0fc5sKaLD/XZ2s
 9LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSGHn1F0BncOfTcKYhrKyIk0Nc9jRJLzLB3ecNcIZy4=;
 b=Il8JgrEijihDTlve8GR2Vet0MBy9JAudS6ZE+D66AdFjzR5ABLlxBVSu8DjYq/XK4q
 rlr//O1tCL1W8utSFBET8lo8TteWW5PrrrBEDj9znNUtgQpSfLopUHxp6Msb237ubJT2
 WjZO3cKGhNUmcvoCf4ZwyO/HwLctUUPUz+cfxPTRN4R7kw/T47fKrH3N+5h3Jg1LKU4L
 u/LWiq/Kw8kmfH7lZwUbEX8HZ+nC4YW8MelvrbuNEMbJs3IeAZ+LinymNWwAsKVBB8XY
 rjjul8c3EUGW6mAJYIAJoA1rDONTvyJuovQI8f/Wn/OCoutD63eQhtwPMWNYaOTI7cuW
 sxhQ==
X-Gm-Message-State: AOAM531Xhw5wDx4p/7/h9TkN2of1YOlUkjwljXNwUJlW3s5ZFwsUC0tW
 klaK9ja4mB19QmlyP20uSeqFu7OVxSGjGB3ZWUdqqQ==
X-Google-Smtp-Source: ABdhPJx0EgilpXqO9xhDBZma49ZiZYBQW1CYQalIbu7JvciYQUGx6pSOeqXv1MQtlngcxiEp7hb87+4QPXM1UtmgtzY=
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr5072481wms.137.1652278359083; Wed, 11
 May 2022 07:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220511120621.36956-1-guozhengkui@vivo.com>
In-Reply-To: <20220511120621.36956-1-guozhengkui@vivo.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 11 May 2022 19:42:27 +0530
Message-ID: <CAAhSdy3Ynx-8DgDEE6huye2nA_21CV6cN=keopaCJOK2b00k5g@mail.gmail.com>
Subject: Re: [PATCH] selftests: kvm: replace ternary operator with min()
To: Guo Zhengkui <guozhengkui@vivo.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 David Hildenbrand <david@redhat.com>, 
 "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)"
 <kvmarm@lists.cs.columbia.edu>, 
 "open list:KERNEL VIRTUAL MACHINE (KVM)" <kvm@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 zhengkui_guo@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_071252_129033_C5491D4E 
X-CRM114-Status: GOOD (  15.28  )
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

On Wed, May 11, 2022 at 5:38 PM Guo Zhengkui <guozhengkui@vivo.com> wrote:
>
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

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/lib/aarch64/ucall.c | 4 ++--
>  tools/testing/selftests/kvm/lib/riscv/ucall.c   | 2 +-
>  tools/testing/selftests/kvm/lib/s390x/ucall.c   | 2 +-
>  tools/testing/selftests/kvm/lib/x86_64/ucall.c  | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> index e0b0164e9af8..00be3ef195ca 100644
> --- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
> @@ -52,7 +52,7 @@ void ucall_init(struct kvm_vm *vm, void *arg)
>          * lower and won't match physical addresses.
>          */
>         bits = vm->va_bits - 1;
> -       bits = vm->pa_bits < bits ? vm->pa_bits : bits;
> +       bits = min(vm->pa_bits, bits);
>         end = 1ul << bits;
>         start = end * 5 / 8;
>         step = end / 16;
> @@ -79,7 +79,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>         va_list va;
>         int i;
>
> -       nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +       nargs = min(nargs, UCALL_MAX_ARGS);
>
>         va_start(va, nargs);
>         for (i = 0; i < nargs; ++i)
> diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
> index 9e42d8248fa6..34f16fe70ce8 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
> @@ -53,7 +53,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>         va_list va;
>         int i;
>
> -       nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +       nargs = min(nargs, UCALL_MAX_ARGS);
>
>         va_start(va, nargs);
>         for (i = 0; i < nargs; ++i)
> diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
> index 9d3b0f15249a..665267c1135d 100644
> --- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
> @@ -22,7 +22,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>         va_list va;
>         int i;
>
> -       nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +       nargs = min(nargs, UCALL_MAX_ARGS);
>
>         va_start(va, nargs);
>         for (i = 0; i < nargs; ++i)
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> index a3489973e290..2ea31a0ebe30 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
> @@ -24,7 +24,7 @@ void ucall(uint64_t cmd, int nargs, ...)
>         va_list va;
>         int i;
>
> -       nargs = nargs <= UCALL_MAX_ARGS ? nargs : UCALL_MAX_ARGS;
> +       nargs = min(nargs, UCALL_MAX_ARGS);
>
>         va_start(va, nargs);
>         for (i = 0; i < nargs; ++i)
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
