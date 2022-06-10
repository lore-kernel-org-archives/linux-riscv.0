Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377D4C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 04:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gElXM/0OGCwkjRwhnGD/kmbRXj+TdWiVE1HFDO1MXt4=; b=DfcHPQeqnUO7nC
	2b85pJsvID1RThZ+uPYnisK8mSp8WPd3SLuX7esJMaYGhEsYDEUtQ+P4/Ay7pztf8hTfHLzVB5Hxl
	VIWHZJeexQ8Sytng6slegzbVtlL9HFXUqsad5pSMJU7LQLG4jc/Xxd78utJWK15hcJ+Tvhol0vM4i
	nIMG5fLDZzFh8nVmwlcU+v+0jKDDZl6kBHIwuuwCncxSS/M9pXR3ToUPV6TJp5lKQrTK7VXIAjx7K
	XE6O1vld33KIlJxdjHU94tPxAaYV99n1VUlPHmsNj+MohaKTmtytErx7YmqZh3U07D2hSs4PwJM/A
	VQ/ck5i1OTgD6E872aCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWe3-005rN2-LQ; Fri, 10 Jun 2022 04:53:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWe0-005rLd-PY
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 04:53:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id r187-20020a1c44c4000000b0039c76434147so549895wma.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 21:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yT2dY1CxLSVJ5jM9XqmB8hnkuELf74CsmsabBpi5suY=;
        b=AWO8jA8jbizmFTZ2iKFOurF6Q+l71eaS9jhDiXhwP1Qvx+Rj98w8QYl3ulywOvgtv6
         t5SQx1gDPX8B4Ijs0PmiEepDNZOLPrpkK5KNnw6CIgQAq7372hQrSJga4evSuejWB1Mq
         huhBQeeEQeakxBKZzpEN7Pg/RFD9OA+a9XMsmmVMT5Wv6bku3CHe/hMlPrs31emgAeyI
         0zSaG8XP8kKpm+bGI2jierEB2C96vJwv/UEMrOJdE7iOfiFySytQSA/R2RCsDMO1JMBF
         4vK7EQ3fJRvz4E3Y8Zgb36zCnnM8ypbwB/RzBCyuAWk1VoPc8bVfuYN5KB1DZ/q/1wLy
         shEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yT2dY1CxLSVJ5jM9XqmB8hnkuELf74CsmsabBpi5suY=;
        b=1U564O9lUQmn/L1iOzlSqvgRIgXF6nTDBgZyPUcgKkqDiPtiIN69CtF7Yus1fdy29W
         sYXn22T0IIr6yzTb9+4ucHJW97gZRneqYMzOq/fwGk/+hs6mvr6zX0RHw/zYA0KMOUaQ
         xJ+ox1FAmzieVGh1WC/YZDwCND/tvcPtGvH7YI3UuJR0OB7Z2HsTEjthkJB9gk1FeD+1
         lRIkVRvwS59HBJ2F+G3Zw8hihamn+A8t6L4y+2Jyv6yr5iwVqxhRthilPuIovfsZo7U4
         Yi4DgjcvHAYo16wETZd9NIpuBMQzHJzuSg6U8BvDIuM2SKVeP4VWeg+FN14gAAs+EOHa
         ehqQ==
X-Gm-Message-State: AOAM5327s/cVHCpQTudoyIdknI1hdn6LEzFglYvuQ/CDX2DlPtRvz3eU
	eOWjzMi31NBQDnEub4dsfZVGIFzqeb4eEOmisRl4jeUC2jkIAg==
X-Google-Smtp-Source: ABdhPJx7L9vYUBmxUCqXUtntwUrlJZQwSghvc/QDikd0/b7LAKguXcB4xG4bOm9Dl/IKGYBBF8t/AOpZDshmumSVaJs=
X-Received: by 2002:a7b:c10d:0:b0:39c:4a17:1e90 with SMTP id
 w13-20020a7bc10d000000b0039c4a171e90mr6532508wmi.108.1654836790199; Thu, 09
 Jun 2022 21:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220527042937.1124009-1-atishp@rivosinc.com>
In-Reply-To: <20220527042937.1124009-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Jun 2022 10:22:58 +0530
Message-ID: <CAAhSdy3jpXO_a+ZWNCW_n28GQd9JGJdCsNruL7spC_aork6iqA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Sstc extension support
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_215312_867579_544174D3 
X-CRM114-Status: GOOD (  23.90  )
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

On Fri, May 27, 2022 at 9:59 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This series implements Sstc extension support which was ratified recently.
> Before the Sstc extension, an SBI call is necessary to generate timer
> interrupts as only M-mode have access to the timecompare registers. Thus,
> there is significant latency to generate timer interrupts at kernel.
> For virtualized enviornments, its even worse as the KVM handles the SBI call
> and uses a software timer to emulate the timecomapre register.
>
> Sstc extension solves both these problems by defining a stimecmp/vstimecmp
> at supervisor (host/guest) level. It allows kernel to program a timer and
> recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
> intervention.
>
> KVM directly updates the vstimecmp as well if the guest kernel invokes the SBI
> call instead of updating stimecmp directly. This is required because KVM will
> enable sstc extension if the hardware supports it unless the VMM explicitly
> disables it for that guest. The hardware is expected to compare the
> vstimecmp at every cycle if sstc is enabled and any stale value in vstimecmp
> will lead to spurious timer interrupts. This also helps maintaining the
> backward compatibility with older kernels.
>
> Similary, the M-mode firmware(OpenSBI) uses stimecmp for older kernel
> without sstc support as STIP bit in mip is read only for hardware with sstc.
>
> The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
> PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
> PATCH 4 implements the Sstc extension in KVM.
>
> This series has been tested on Qemu(RV32 & RV64) with additional patches in
> Qemu[2]. This series can also be found at [3].
>
> Changes from v3->v4:
> 1. Rebased on 5.18-rc6
> 2. Unified vstimemp & next_cycles.
> 3. Addressed comments in PATCH 3 & 4.
>
> Changes from v2->v3:
> 1. Dropped unrelated KVM fixes from this series.
> 2. Rebased on 5.18-rc3.
>
> Changes from v1->v2:
> 1. Separate the static key from kvm usage
> 2. Makde the sstc specific static key local to the driver/clocksource
> 3. Moved the vstimecmp update code to the vcpu_timer
> 4. Used function pointers instead of static key to invoke vstimecmp vs
>    hrtimer at the run time. This will help in future for migration of vms
>    from/to sstc enabled hardware to non-sstc enabled hardware.
> 5. Unified the vstimer & timer to 1 timer as only one of them will be used
>    at runtime.
>
> [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
> [2] https://github.com/atishp04/qemu/tree/sstc_v3
> [3] https://github.com/atishp04/linux/tree/sstc_v4
>
> Atish Patra (4):
> RISC-V: Add SSTC extension CSR details
> RISC-V: Enable sstc extension parsing from DT
> RISC-V: Prefer sstc extension if available
> RISC-V: KVM: Support sstc extension

Please don't forget to CC kvm-riscv mailing list for KVM RISC-V patches.

We have a patchwork setup for KVM RISC-V will also miss a series if
patches are not CCed.

Regards,
Anup

>
> arch/riscv/include/asm/csr.h            |  11 ++
> arch/riscv/include/asm/hwcap.h          |   1 +
> arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
> arch/riscv/include/uapi/asm/kvm.h       |   1 +
> arch/riscv/kernel/cpu.c                 |   1 +
> arch/riscv/kernel/cpufeature.c          |   1 +
> arch/riscv/kvm/main.c                   |  12 +-
> arch/riscv/kvm/vcpu.c                   |   5 +-
> arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
> drivers/clocksource/timer-riscv.c       |  24 +++-
> 10 files changed, 198 insertions(+), 10 deletions(-)
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
