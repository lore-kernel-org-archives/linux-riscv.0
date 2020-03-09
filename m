Return-Path: <SRS0=yxlK=42=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687A9C10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 11:57:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AEB32051A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 11:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qweHFlCr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="vEiimkKW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AEB32051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vrTgttkZVf+7dJzhX83Z2t1NpSWLXcGu9YGJAFx5Xqc=; b=qweHFlCr+thQorS8ApalNQJEU
	0lW+bFyyjqdtYj6qT0IgiXZk1ZoSo3kpNsYOMj5O9szjgG1OaikvN/SbKJxN+3Scvv0GYx5iO6Cxd
	3dbvqIucIzAxtFy701x7i0tYmmsotld69HAXlOvrqPlhsPVTAf+NbxXM/Nci5aqot9Qii+MXT1Rlw
	rJEEJiJhoQDhu5xA58mY2yKvWYdpQvdY96ReovSydNwwCJYF4PA12eaE8PZVeUinoDBOqJ1Riejgx
	8FxzO7hbVC1QAf+Mp0LL2LWPsPvtBnQsC4tL+4uwNZNmbxSeCtJlFwCEdI7y/ZWLhHipXf6/n33qJ
	FAqbjmKFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBH2Q-0000xT-3t; Mon, 09 Mar 2020 11:57:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBH2L-0000sv-5O
 for linux-riscv@lists.infradead.org; Mon, 09 Mar 2020 11:57:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id z15so10737861wrl.1
 for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2020 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vrTgttkZVf+7dJzhX83Z2t1NpSWLXcGu9YGJAFx5Xqc=;
 b=vEiimkKWq0NHiQqLCBl/zNnWis5BV9Ta7t765xUFvMq/OTzlWKuMsmpB7rJQK5tVnP
 XxmPE2weoncXR1//WGh4VqsygjvoJbzPtR4XDqnux9UP+SowXvyjwB6QBm/jeWuEvRY1
 Ds6ZBqwfv/OZgSZeth6F2I9MsS1sf2gxDE1t1WkBdGxwEnhdattHNj+u8Rk8dTD8OFZN
 JR/EyECJ8xUszKKLMT/VDreswvC476fn+ORNfS2Drj7KvJuZJv7jUaaLZtwgtyHclf5N
 ZPH9j2EMxWPlEgCco/6AIDGoDdbNu3LMao3nN1OAUORt8GDZyR78AvuIFvIfIkaC8Pdv
 Bbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrTgttkZVf+7dJzhX83Z2t1NpSWLXcGu9YGJAFx5Xqc=;
 b=onZAUj2A8u4tYKwCCIQoY/MWDAdYl4eOLu32GQz9LsWsa34Xw95OrMWBrxOyyLt3CH
 3rfjXfqspzlbxwHQXDmhaKPh9ly2onnNlaDX0ig02T6ldhjPNnYzGANl8sSFHsZcf+4I
 Nd+hEOlozLijndoIlTsIdv3N/WlGe5tQSQJrekSlNgBDPj6Jmg+QJA8+clWejySI0Dwq
 nReKGDIv5MzYRzH2Dg7JvV/8Qa8fSPITU8sZolnoTnT/HcMCUA0lh/Dke1kcbD59440M
 Whu3eSWOqVK5CW/G4f4pQ+4fvVpJVvdjOQn/SRsqBOLxRsmiE/DAzjKoBdnzw04airLv
 PlOQ==
X-Gm-Message-State: ANhLgQ3yYeoHKtpaidTRnLttuDLAU62qoLIV77fe8fuE5XKnNd2e3I6j
 KpCp2PLU+nm8Pbf7inZqNXyncYE5GXFKCF894F0v2I6M
X-Google-Smtp-Source: ADFU+vvMew+BCMC+wgpvAFNXyqhdGpFhtepZ8kbje7sd7mHHkOXIz3YohMYApyzE+QBfXAmwpEf0KlzE67eJaauIl0k=
X-Received: by 2002:adf:a512:: with SMTP id i18mr20926329wrb.61.1583755051402; 
 Mon, 09 Mar 2020 04:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200309110211.91130-1-anup.patel@wdc.com>
In-Reply-To: <20200309110211.91130-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Mar 2020 17:27:17 +0530
Message-ID: <CAAhSdy0fJHAhmW202DT+2XfY5bADBUqoiyk9bY86dupuO9zhzA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] New RISC-V Local Interrupt Controller Driver
To: Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_045733_273089_A101F1F2 
X-CRM114-Status: GOOD (  16.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Fixed Marc's email address.

On Mon, Mar 9, 2020 at 4:32 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> This patchset provides a new RISC-V Local Interrupt Controller Driver
> for managing per-CPU local interrupts. The overall approach is inspired
> from the way per-CPU local interrupts are handled by Linux ARM64 and
> ARM GICv3 driver.
>
> Few advantages of this new driver over previous one are:
> 1. It registers all local interrupts as per-CPU interrupts
> 2. The KVM RISC-V can use this driver to implement interrupt
>    handler for per-HART guest external interrupt defined by
>    the RISC-V H-Extension
> 3. In future, we can develop drivers for devices with per-HART
>    interrupts without changing arch code or this driver
>
> With this patchset, output of "cat /proc/interrupts" looks as follows:
>            CPU0       CPU1       CPU2       CPU3
>   2:        379          0          0          0  SiFive PLIC  10  ttyS0
>   3:        591          0          0          0  SiFive PLIC   8  virtio0
>   5:       5079      10821       8435      12984  RISC-V INTC   5  riscv-timer
> IPI0:      2045       2537        891        870  Rescheduling interrupts
> IPI1:         9        269         91        168  Function call interrupts
> IPI2:         0          0          0          0  CPU stop interrupts
>
> The patchset is based up Linux-5.6-rc5 and can be found at riscv_intc_v4
> branch of: https://github.com/avpatel/linux.git
>
> Changes since v3:
>  - Rebased to Linux-5.6-rc5 and Atish's PLIC patches
>  - Added separate patch to rename and move plic_find_hart_id()
>    to arch directory
>  - Use riscv_of_parent_hartid() in riscv_intc_init() instead of
>    atomic counter
>
> Changes since v2:
>  - Dropped PATCH2 since it was merged long-time back
>  - Rebased series from Linux-4.19-rc2 to Linux-5.6-rc2
>
> Changes since v1:
>  - Removed changes related to puggable IPI triggering
>  - Separate patch for self-contained IPI handling routine
>  - Removed patch for GENERIC_IRQ kconfig options
>  - Added patch to remove do_IRQ() function
>  - Rebased upon Atish's SMP patches
>
> Anup Patel (5):
>   RISC-V: self-contained IPI handling routine
>   RISC-V: Rename and move plic_find_hart_id() to arch directory
>   irqchip: RISC-V Per-HART Local Interrupt Controller Driver
>   clocksource: timer-riscv: Make timer interrupt as a per-CPU interrupt
>   RISC-V: Remove do_IRQ() function
>
>  arch/riscv/Kconfig                 |   1 +
>  arch/riscv/include/asm/irq.h       |   5 --
>  arch/riscv/include/asm/processor.h |   1 +
>  arch/riscv/include/asm/smp.h       |   3 +
>  arch/riscv/kernel/cpu.c            |  16 ++++
>  arch/riscv/kernel/entry.S          |   4 +-
>  arch/riscv/kernel/irq.c            |  33 +------
>  arch/riscv/kernel/smp.c            |  11 ++-
>  arch/riscv/kernel/traps.c          |   2 -
>  drivers/clocksource/timer-riscv.c  |  79 +++++++++++------
>  drivers/irqchip/Kconfig            |  13 +++
>  drivers/irqchip/Makefile           |   1 +
>  drivers/irqchip/irq-riscv-intc.c   | 134 +++++++++++++++++++++++++++++
>  drivers/irqchip/irq-sifive-plic.c  |  40 ++++-----
>  include/linux/cpuhotplug.h         |   1 +
>  15 files changed, 256 insertions(+), 88 deletions(-)
>  create mode 100644 drivers/irqchip/irq-riscv-intc.c
>
> --
> 2.17.1
>

