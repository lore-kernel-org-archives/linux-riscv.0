Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213D3CDD543
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIxTC3PSYEmZfZ3DTgGvms1VtVH/fJaEa+it9nCNpzs=; b=CiBHtgThHawy+f
	o1SMVpGrza/Co06UNckogMI9spGtk9L/51ALUEzBlkAgZ7ih/M+jfUlkmcefqYIkZmv3Fhh3Kxn/m
	aLRInM89KsUuur1tzQBYdeNwfnwTQAMrGXpK4dP3n3zWK87uo4/OzdiqREGk8LE3oV2f6+wTltNC/
	l9WheocMWjLJjPmKKXgOtfV04MWdurpV8lwgGmajl3ATyPS79rSSFzXdxbWxHo7j672s53+ziX2ru
	anhD9GCxFFmo2e6+Ai7Om0KkX1/dLt/bQeE/kEilUfa4vdSOzm5gAr/pxo6bsHmmS0VBSqv6z65Zc
	Qy76BteOIQr37niJpZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwfh-00000008XXU-19Vj;
	Wed, 18 Sep 2024 15:32:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwfd-00000008XWe-2ca3
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 15:32:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so4746567a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726673563; x=1727278363; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DCpTEL/dYMB7Uol2NlYZ7DCyhiPYwgEy6rc2BA5KywU=;
        b=ZIIg++9MMXc+D19V3Q+MwkpFiZKf5pE8R3Bk8ehtPG5TlxHoYfjknC8ZMjZfwJYH/C
         27abNxSQoiubFHhkqeIu1K8kQ9kFDZDnGtCUIma9E9pML3fWsxS7eMtvV/IA719ve3Ep
         3Vhks0ggxgi38jh0qL0ELu0BZmkPSes5Var519hxyHGFepFMkSrknulm7051Ivqyeayg
         MiaYYYwYQUZ/uQiZo1iUiGvXTgHqwS8nIedafJn4HLdnOelc+rqAlu7BgA0ZdESCXHyN
         4VUc58MZMSQ6cVRu8X/YJeeQaFzb7Byjx76r2WPjUSJuvVZb5dMS9id8rHpbnOiLQDvG
         LMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726673563; x=1727278363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCpTEL/dYMB7Uol2NlYZ7DCyhiPYwgEy6rc2BA5KywU=;
        b=LLnZgLvW6FaCDqAb4Gk5iJaQmym6wZ7E2y4gib4s7M3wTDtWKJbqkI1YuWrtmyN1ms
         ieKFw6PtrEi/QAUhKjKZKYqk4E+Xx9bjl/qx2eTAtTysDUGGwEm9S/poJ12cPKGVJj+V
         qQr8egGFTCvZV0X7lMEzKfNVdY6GXCQ/DGYfhbhoOuLnSpSJhSNDCUW7DdQKZgNCu6ts
         WIA3L6K+K2I+6Gwgql77qyDJGqpZhFKZDYI9yzszkYsZjICXzcBeetU+y/FX4fggGhq4
         INHJ1KZKYWsBo7p3Wu6UbWIWaxAd+giQPn1TSD6zwZjZFPttsByLAhqgCbGkxCWZpPqI
         8qDg==
X-Forwarded-Encrypted: i=1; AJvYcCU2WUL/kOpisGvBOgsqmONL4/1mpM1qetcfBrjXfswUz+ecXwbmg3QhZNlxbLqmkb+meL7WGLgcaCYDqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFfz643uQfyjxaSEMvnknYuy8ut2GzjiNx4yPuW60oqaJdlTdx
	rbR0rdvhtreW1S8nNtPYe9pgXmmaoocKyqJca0pbn2JsUiqsWPjiiVJFiXyR1oVm7opKdSKvkJ4
	geo6p8xsbNROT0yJGCpgCZilGxIgbZ9/V9FkMBw==
X-Google-Smtp-Source: AGHT+IHUXyXfmA5Am44lE06hFsf1unXiUfxYsmWUCGV8LXPzN024Cxhz2eXy8PcJcIICTPqY5rE5RE0MwfG5g8Mtkro=
X-Received: by 2002:a05:6402:280a:b0:5c2:8249:b2d3 with SMTP id
 4fb4d7f45d1cf-5c413e4c51fmr18852185a12.26.1726673562914; Wed, 18 Sep 2024
 08:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel> <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel> <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel> <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com> <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
 <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
In-Reply-To: <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Sep 2024 16:32:31 +0100
Message-ID: <CAFEAcA_ePVwnpVVWJSx8=-8v2h_z2imfSdyAZd62RhXaZUTojA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240918_083245_719913_C15C4530 
X-CRM114-Status: GOOD (  26.51  )
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

On Wed, 18 Sept 2024 at 14:49, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 18.09.24 15:12, Peter Maydell wrote:
> > On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >> Thanks Peter for looking into this.
> >>
> >> QEMU's cpu_synchronize_all_post_init() and
> >> do_kvm_cpu_synchronize_post_reset() both end up in
> >> kvm_arch_put_registers() and that is long after Linux
> >> kvm_arch_vcpu_create() has been setting some FPU state. See the output
> >> below.
> >>
> >> kvm_arch_put_registers() copies the CSRs by calling
> >> kvm_riscv_put_regs_csr(). Here we can find:
> >>
> >>       KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
> >>
> >> This call enables or disables the FPU according to the value of
> >> env->mstatus.
> >>
> >> So we need to set the desired state of the floating point unit in QEMU.
> >> And this is what the current patch does both for TCG and KVM.
> >
> > If it does this for both TCG and KVM then I don't understand
> > this bit from the commit message:
> >
> > # Without this patch EDK II with TLS enabled crashes when hitting the first
> > # floating point instruction while running QEMU with --accel kvm and runs
> > # fine with --accel tcg.
> >
> > Shouldn't this guest crash the same way with both KVM and TCG without
> > this patch, because the FPU state is the same for both?

> By default `qemu-system-riscv64 --accel tcg` runs OpenSBI as firmware
> which enables the FPU.
>
> If you would choose a different SBI implementation which does not enable
> the FPU you could experience the same crash.

Ah, so KVM vs TCG is a red herring and it's actually "some guest
firmware doesn't enable the FPU itself, and if you run that then it will
fall over, whether you do it in KVM or TCG" ? That makes more sense.

I don't have an opinion on whether you want to do that or not,
not knowing what the riscv architecture mandates. (On Arm this
would be fairly clearly "the guest software is broken and
should be fixed", but that's because the Arm architecture
says you can't assume the FPU is enabled from reset.)

I do think the commit message could use clarification to
explain this.

thanks
-- PMM

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
