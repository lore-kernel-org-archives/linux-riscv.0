Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6673CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9Rrmw7zE6JBNH4+u6Dic09etWkwmiaaLw3d0DZvAt0=; b=kp2gKd6DMHciBV
	Tl+ABz8CiezS2zBCgdgX/6xbXB9aYg+HxkkxdbYzFjv1FztSWTrv9UW+KceRcnqbC5fauDdWZfuQv
	fhEf7civ22wjqFGQ9qMCTrYT3ToW8pNm6ZyYatCKC7nt4xSIqHNtYrmSTd5rtqCv5EGmR3WBrlxPI
	aFR1uLFF2s8sMKFOlb+JkXQVwFAFz7UeJSmtr906CIwhOPrhmbJKqDRuICE1NRDhnTIHi5h2MZTAk
	EHCZ5FjkXeRQVj6TjNiG3AVtDBJB2ar6vlO4M3zBj5bjONQqR8tFnMsOTGfXiT3Qt2l8cFNkpF6yI
	A3PsSRlnmZSaVFuziVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbde2-00HXlS-Qt; Tue, 05 Apr 2022 07:30:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdSH-00HRrT-89
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 07:18:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso945623wme.5
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j5tZD+8M1iPFQIpWPsYamWZAVUcin+PVrYzA4YmgT9M=;
 b=fwxyiskvlIWhb4yoz+2d8DfK/fDF9kpIsj1v16e5zIvUjuTsRqhCJOFl05KNjnR1dw
 oonmm9pVay2hFWOiOFAbJ7dn7AHRarZUB51K/rDMrO52UGnRsj0lSzd2lgRxtb+OxIRl
 IgpXfxAnPI2wpb+5qJeC0MuWD3RZGoIQEZ+ogFkEYpSYTVQw4ABKMBca0ZXnLKFMvEQz
 QdhofkXfbLPxcHl4i2KJqdCwUeO5sC1D7G1h/tn68KmMvPa0ZOVhXIkAy7QphAYkTazb
 USrRPCFfrjAaMOaC2mAVwXLODZM++PjK43MI+M9Q3aTBfmuFw1YJzwLkykwbNCFn9o1+
 X6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5tZD+8M1iPFQIpWPsYamWZAVUcin+PVrYzA4YmgT9M=;
 b=j/iRpdsv1j4PHZqdQp50gx9zG7a64/PL8X2js6ee046kgelSOCHM/9oU1kWdZz0FW0
 zdYLU6ceb03tiDcFyhPZkTBz3MM9DNoDX1T9QSGBhQD8Ll/ctC7BMLizfMMDAf6KmJ+B
 qXsrZhxNvcxv7nwXiEKAFNlP2A+CHRs9lvRUsKr/IhuZHe+O5jFKQp/mi9Zpx6UxJkBU
 V8zZNSlNUZge0XcqhhtGONiO8VoGOCrF8fRqfBSKJ4mKhf0M3buq5rDHM4R4C2sAa/sO
 Czgu1QUBHSEcddzOp5mHJ9VOTISBjXkAqKV7uhixPmY9paGfLT3o3ZW9b+1xrF1NC6SV
 UR+w==
X-Gm-Message-State: AOAM5325U1QPjPOPTGA7aW9guO5T7dQXFKVu9Vr8nbc5fUy0HonAdJMq
 rd/8EsPLyvQWwl8q1u7Ai2W3RcwnDdMtq5S7jU19og==
X-Google-Smtp-Source: ABdhPJwdmM8TCHa4eoVn8sKC+Sod0b/E/a9HSoTDWMUxnS9+yZz84ZdrIE85cb44FScPTht6hP0nLp3dojxP605Lpt4=
X-Received: by 2002:a05:600c:3c9b:b0:38e:4c59:68b9 with SMTP id
 bg27-20020a05600c3c9b00b0038e4c5968b9mr1754749wmb.105.1649143096491; Tue, 05
 Apr 2022 00:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
 <20220329072911.1692766-2-apatel@ventanamicro.com>
In-Reply-To: <20220329072911.1692766-2-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Apr 2022 12:48:03 +0530
Message-ID: <CAAhSdy2=q4u9UR7zYks5A-3k1q4srOqk14O3+a14sUS5Qa+Ppg@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: selftests: riscv: Set PTE A and D bits in
 VS-stage page table
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_001821_322244_495E977C 
X-CRM114-Status: GOOD (  19.01  )
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

On Tue, Mar 29, 2022 at 12:59 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Supporting hardware updates of PTE A and D bits is optional for any
> RISC-V implementation so current software strategy is to always set
> these bits in both G-stage (hypervisor) and VS-stage (guest kernel).
>
> If PTE A and D bits are not set by software (hypervisor or guest)
> then RISC-V implementations not supporting hardware updates of these
> bits will cause traps even for perfectly valid PTEs.
>
> Based on above explanation, the VS-stage page table created by various
> KVM selftest applications is not correct because PTE A and D bits are
> not set. This patch fixes VS-stage page table programming of PTE A and
> D bits for KVM selftests.
>
> Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V
> 64-bit")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

I have queued this patch for RC fixes.

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index dc284c6bdbc3..eca5c622efd2 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -101,7 +101,9 @@ static inline void set_reg(struct kvm_vm *vm, uint32_t vcpuid, uint64_t id,
>  #define PGTBL_PTE_WRITE_SHIFT                  2
>  #define PGTBL_PTE_READ_MASK                    0x0000000000000002ULL
>  #define PGTBL_PTE_READ_SHIFT                   1
> -#define PGTBL_PTE_PERM_MASK                    (PGTBL_PTE_EXECUTE_MASK | \
> +#define PGTBL_PTE_PERM_MASK                    (PGTBL_PTE_ACCESSED_MASK | \
> +                                                PGTBL_PTE_DIRTY_MASK | \
> +                                                PGTBL_PTE_EXECUTE_MASK | \
>                                                  PGTBL_PTE_WRITE_MASK | \
>                                                  PGTBL_PTE_READ_MASK)
>  #define PGTBL_PTE_VALID_MASK                   0x0000000000000001ULL
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
