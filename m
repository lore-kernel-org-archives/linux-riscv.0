Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24791C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 12:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC732608FB
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 12:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC732608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wulySuO3Vm0mEN4uF4qxubdTH9ngzqW3Rk6v4es0lPU=; b=V67X3cKIPtyWHh
	EkHt8b6N6vC96uoF2MUjS6HOZRA7SU2MYU4q2lm7rKYDqooXSgZAhBTgCd3L7rc1xwOKt4AyyGmhG
	9R13sAxVbxZ6bOUprzLNHvgMDyZNG+pCmYGxkRLR31dNQPcoxUI+qys9FGB/uHIS/mMXv8v1xCSIs
	HZTz6bqMOLZLGmZq6rr0Hf/SUop/g5sK/7uPaw7sterNTu0cPtNmssRCP34jLLLpiEQUeoAk0Q3C/
	2fbQFDpUzLLMEqGWTebofsuvnfzmA77u8uzs6/fSJDKLRLG01v+dQ2bjGiEkMn3TFf0nRZrmOdfmg
	NHpKgj0mLobzWnuqN+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7zzJ-00BE9H-Kn; Mon, 26 Jul 2021 12:45:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7zzF-00BE75-J4
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 12:45:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id r2so10968434wrl.1
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EdSEiQhPPfqlW+mNBlXL/6LkyvS46s9MWaLUDSXboLs=;
 b=cMAiwG60O3mJ/yFl82iRKWkX/2RsxNQFV+GdGrduhGDtDa2s1/iXKKFhmMPpVGXPLK
 fJa7sibt5Qn1sSJM14MEXSKYhHVIGjDRCz9X7aNrg6dOmwXXmwEQFDbWwzXzywuwj+VD
 xwc6C5GLLOEluhgH8wwnqHv/dEwyGGZ0xX8MMn40qeZre05Pcv5x9J8Ez3DbQM6BS2ks
 mGLPEPyxshCEpdnYQ3lZIzNETd8SIBde/3rhDmD0DG54cIbOK2eUcfRrJtwG/myAkFrz
 nQ3d6EkT5soST7X/ajaFq1FVf5YxMeCPk9mlcbPCYTVcru1CUnGpvdLskrzEKpqQ0k3x
 wpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EdSEiQhPPfqlW+mNBlXL/6LkyvS46s9MWaLUDSXboLs=;
 b=kn+87Emx8pM+EPEhAkuqpjF4FFSD5P5YC4lmE9OovPR08uLzlwXNgLscStzlBuk+00
 b7R5LAfONFfjibSwNrpFvE4pI0f4fcEXsG0eAKnCKi0racxPnufo+d1PfCcgJ3JWBIxy
 TLIvEKc4izCM4I2ikkj1+FWHhbF7w8CAmQfvoxQ4nD8kCLtcC+/gc2WUXtTkgdvtPSem
 jtSjr+/bCS3cYXc6EPTatreyaF7LqCSYiRNAQMvVlKS+Avig2hw65/+Cyi+k4hJtGpHL
 ZQShZiq+DTkPBta85tAD1eA+NwB2IBb4QSIbEm45BwP0Yb0v6YwUXNq9EMaAaJZpSTVz
 eWfg==
X-Gm-Message-State: AOAM532+RM53o+dpb5iJEA9ZYv8sEsDjROTO11182BT+hoj0DhfxyMj8
 iO8mHpFRk8N8u3G59uhwyp9zuKETWNeJtlgEQHdCqA==
X-Google-Smtp-Source: ABdhPJwkUJfUzY+D0ZUeN/xa+//W784LaiFLRerJU1kMI4d9SXUSL+tAmGatjZAFWSLpWKG5op/x6x/WbN6LfRBY86I=
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr18569977wry.128.1627303534054; 
 Mon, 26 Jul 2021 05:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123851.1344518-1-anup.patel@wdc.com>
In-Reply-To: <20210618123851.1344518-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jul 2021 18:15:20 +0530
Message-ID: <CAAhSdy3E56j9XBfNr93AdW62mEx40F9F4-SYbNEFdkKA2BWRqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Linux RISC-V ACLINT Support
To: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_054537_760197_DF0A57BC 
X-CRM114-Status: GOOD (  23.07  )
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

Hi Marc,

I have taken the approach of IPI domains (like you suggested) in this series.

What do you think ?

Regards,
Anup

On Fri, Jun 18, 2021 at 6:09 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Most of the existing RISC-V platforms use SiFive CLINT to provide M-level
> timer and IPI support whereas S-level uses SBI calls for timer and IPI
> support. Also, the SiFive CLINT device is a single device providing both
> timer and IPI functionality so RISC-V platforms can't partially implement
> SiFive CLINT device and provide alternate mechanism for timer and IPI.
>
> The RISC-V Advacned Core Local Interruptor (ACLINT) tries to address the
> limitations of SiFive CLINT by:
> 1) Taking modular approach and defining timer and IPI functionality as
>    separate devices so that RISC-V platforms can include only required
>    devices
> 2) Providing dedicated MMIO device for S-level IPIs so that SBI calls
>    can be avoided for IPIs in Linux RISC-V
> 3) Allowing multiple instances of timer and IPI devices for a
>    multi-socket (or multi-die) NUMA systems
> 4) Being backward compatible to SiFive CLINT so that existing RISC-V
>    platforms stay compliant with RISC-V ACLINT specification
>
> Latest RISC-V ACLINT specification (will be frozen in a month) can be
> found at:
> https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
>
> This series adds RISC-V ACLINT support and can be found in riscv_aclint_v2
> branch at:
> https://github.com/avpatel/linux
>
> To test this series, the RISC-V ACLINT support for QEMU and OpenSBI
> can be found in the riscv_aclint_v1 branch at:
> https://github.com/avpatel/qemu
> https://github.com/avpatel/opensbi
>
> Changes since v1:
>  - Added a new PATCH3 to treat IPIs as normal Linux IRQs for RISC-V kernel
>  - New SBI IPI call based irqchip driver in PATCH3 which is only initialized
>    by riscv_ipi_setup() when no Linux IRQ numbers are available for IPIs
>  - Moved DT bindings patches before corresponding driver patches
>  - Implemented ACLINT SWI driver as a irqchip driver in PATCH7
>  - Minor nit fixes pointed by Bin Meng
>
> Anup Patel (11):
>   RISC-V: Clear SIP bit only when using SBI IPI operations
>   RISC-V: Use common print prefix in smp.c
>   RISC-V: Treat IPIs as normal Linux IRQs
>   RISC-V: Allow marking IPIs as suitable for remote FENCEs
>   RISC-V: Use IPIs for remote TLB flush when possible
>   dt-bindings: interrupt-controller: Add ACLINT MSWI and SSWI bindings
>   irqchip: Add ACLINT software interrupt driver
>   RISC-V: Select ACLINT SWI driver for virt machine
>   dt-bindings: timer: Add ACLINT MTIMER bindings
>   clocksource: clint: Add support for ACLINT MTIMER device
>   MAINTAINERS: Add entry for RISC-V ACLINT drivers
>
>  .../riscv,aclint-swi.yaml                     |  82 ++++++
>  .../bindings/timer/riscv,aclint-mtimer.yaml   |  55 ++++
>  MAINTAINERS                                   |   9 +
>  arch/riscv/Kconfig                            |   1 +
>  arch/riscv/Kconfig.socs                       |   1 +
>  arch/riscv/include/asm/sbi.h                  |   2 +
>  arch/riscv/include/asm/smp.h                  |  48 +++-
>  arch/riscv/kernel/Makefile                    |   1 +
>  arch/riscv/kernel/cpu-hotplug.c               |   2 +
>  arch/riscv/kernel/irq.c                       |   1 +
>  arch/riscv/kernel/sbi-ipi.c                   | 223 ++++++++++++++
>  arch/riscv/kernel/sbi.c                       |  15 -
>  arch/riscv/kernel/smp.c                       | 171 +++++------
>  arch/riscv/kernel/smpboot.c                   |   4 +-
>  arch/riscv/mm/tlbflush.c                      |  62 +++-
>  drivers/clocksource/timer-clint.c             |  58 ++--
>  drivers/irqchip/Kconfig                       |  11 +
>  drivers/irqchip/Makefile                      |   1 +
>  drivers/irqchip/irq-aclint-swi.c              | 271 ++++++++++++++++++
>  drivers/irqchip/irq-riscv-intc.c              |  55 ++--
>  20 files changed, 879 insertions(+), 194 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
>  create mode 100644 arch/riscv/kernel/sbi-ipi.c
>  create mode 100644 drivers/irqchip/irq-aclint-swi.c
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
