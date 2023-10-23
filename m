Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885BBCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ex+r7HziAfOq3dFTbk1/JJ1mbDLVS3YgjiBd/+Hlcu4=; b=AmegBEzCvOhHEi
	SXMEmF1pmUZman+vobrO7XOV2D0Z9AwRZe4xlST5EsX7OmiMO6I62QYJqckv+WlEuqo5rIH6B4IbZ
	vzaIiOFmsBSLZQGJ84GplPNmRRjeymhCPYzXD+Awl/atDx/VdisUz4oS5Qi7bv5wcpwthoHIBs6gP
	tyGbpCcxpOvdatGvwBPPd04pLo8awP4wPXLk/9Qvl4Ohi/2b+XvPsMl6GBxdGJeIwitQcxRYV6Gq3
	rziV/zRzA9kOwkkmbL40d68IW6JqBhVdDBHBm3gPAkheZUYeeWjl6vvvMLRjdohLGzriGRQQVymoV
	kcAx20WbnApe69HGDqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJX-006kuL-32;
	Mon, 23 Oct 2023 08:29:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJV-006ksR-1D
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:29:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c9d3a21f7aso24639575ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049761; x=1698654561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2Go0p6zVY7hIr9Nax8xzpGmWWVF8MFp+pn8gehqpE8=;
        b=f2VnLYOEAaVCeVU0iRCyweGNbxd9ZtAiPMjMQpgI/dpK0QKN5OaydJ26ViU9wfIzi8
         uFVlhOJQP/C3QfJV1wnRNXERf8LY+PtVHVP4ZTNgWlY73b9WCzSCDxsWNIQiN+j5hGe+
         DzPdJrQyNQys0wAK48z+U3X7ixw65OaABH+NHkUlZG87EhcjEvotmFdUMc5QvBjrJnab
         DK5OMmGZCda3fFUQgDZDuIOp1U05ZX9Xe7jpbFHQnm0bjjcLsMGv8RM45FrrZU6ZXaIV
         3M6Nl21Vfuv14CGh7poOP5366R6bQOSicLTp/cXVrQoMDmDOjmJq3bgfxNEuuVB0zs3H
         +4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049761; x=1698654561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2Go0p6zVY7hIr9Nax8xzpGmWWVF8MFp+pn8gehqpE8=;
        b=t6VacArGYGiA892HlEAOtgeP4rx2bYVPHlGJebTh/NxtCc3hz5CV+dStUU9DpKAoa9
         v+nq7Ty6lu4NDUqwAurkQKTj00gml4CmRRPtbK17y/W0iC+fXNvJLP0pSwQ1x6GYs6AQ
         a01ss6oXwGmXL7Xq+WTYgw7D/sn7NNdMcUBMn6kU8xJiJMwoz+Azq1g/thK2UD/CZLnD
         SH/UxDb7WiJBYUy4+sPLwHo1QDaoc565G268el7sz38234HOYB9tLUkvcq2BPsgD32JW
         y3zRRcDOFSRmfKGDDcZ0GQui4Qt7BHfFvQr/dkUvXMM9A3MqGK2/Q8Wn1aKzKZx3Tkii
         XiEA==
X-Gm-Message-State: AOJu0YzQTHd+MftsN0FloZQXLpc6lDyK8VS7U4UfWnU37vRDthhLmikJ
	ow31R+vpULcZi3KEoassGrH0sg==
X-Google-Smtp-Source: AGHT+IGi2isItH5oJEzGONJXBXMRlFVQKtBwLtQlBx496PMYqU6jickbKx4YTcMVHuLvS4rb4D/zZw==
X-Received: by 2002:a17:903:4111:b0:1c4:3cd5:4298 with SMTP id r17-20020a170903411100b001c43cd54298mr7877870pld.18.1698049761112;
        Mon, 23 Oct 2023 01:29:21 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:29:20 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 00/12] riscv: Introduce Pseudo NMI
Date: Mon, 23 Oct 2023 16:28:59 +0800
Message-Id: <20231023082911.23242-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012929_424406_27C9F0DF 
X-CRM114-Status: GOOD (  16.82  )
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

Sorry to resend this patch series as I forgot to Cc the open list before.
Below is formal content.

The existing RISC-V kernel lacks an NMI mechanism as there is still no
ratified resumable NMI extension in RISC-V community, which can not
satisfy some scenarios like high precision perf sampling. There is an  
incoming hardware extension called Smrnmi which supports resumable NMI
by providing new control registers to save status when NMI happens.
However, it is still a draft and requires privilege level switches for
kernel to utilize it as NMIs are automatically trapped into machine mode.

This patch series introduces a software pseudo NMI mechanism in RISC-V.
The existing RISC-V kernel disables interrupts via per cpu control
register CSR_STATUS, the SIE bit of which controls the enablement of all
interrupts of whole cpu. When SIE bit is clear, no interrupt is enabled.
This patch series implements NMI by switching interrupt disable way to
another per cpu control register CSR_IE. This register controls the
enablement of each separate interrupt. Each bit of CSR_IE corresponds
to a single major interrupt and a clear bit means disablement of
corresponding interrupt.

To implement pseudo NMI, we switch to CSR_IE masking when disabling
irqs. When interrupts are disabled, all bits of CSR_IE corresponding to
normal interrupts are cleared while bits corresponding to NMIs are still
kept as ones. The SIE bit of CSR_STATUS is now untouched and always kept
as one.

We measured performacne of Pseudo NMI patches based on v6.6-rc4 on SiFive
FU740 Soc with hackbench as our benchmark. The result shows 1.90%
performance degradation.

  "hackbench 200 process 1000" (average over 10 runs)
  +-----------+----------+------------+
  |           | v6.6-rc4 | Pseudo NMI |
  +-----------+----------+------------+
  |   time    | 251.646s |  256.416s  |
  +-----------+----------+------------+

The overhead mainly comes from two parts:

  1. Saving and restoring CSR_IE register during kernel entry/return.
  This part introduces about 0.57% performance overhead.

  2. The extra instructions introduced by 'irqs_enabled_ie'. It is a
  special value representing normal CSR_IE when irqs are enabled. It is
  implemented via ALTERNATIVE to adapt to platforms without PMU. This
  part introduces about 1.32% performance overhead.

Limits:

  CSR_IE is now used for disabling irqs and any other code should
  not touch this register to avoid corrupting irq status, which means
  we do not support masking a single interrupt now.                                                                    

  We have tried to fix this by introducing a per cpu variable to save
  CSR_IE value when disabling irqs. Then all operatations on CSR_IE
  will be redirected to this variable and CSR_IE's value will be
  restored from this variable when enabling irqs. Obviously this method
  introduces extra memory accesses in hot code path.

TODO:

  1. The adaption to hypervisor extension is ongoing.

  2. The adaption to advanced interrupt architecture is ongoing.

This version of Pseudo NMI is rebased on v6.6-rc7.

Thanks in advance for comments.

Xu Lu (12):
  riscv: Introduce CONFIG_RISCV_PSEUDO_NMI
  riscv: Make CSR_IE register part of context
  riscv: Switch to CSR_IE masking when disabling irqs
  riscv: Switch back to CSR_STATUS masking when going idle
  riscv: kvm: Switch back to CSR_STATUS masking when entering guest
  riscv: Allow requesting irq as pseudo NMI
  riscv: Handle pseudo NMI in arch irq handler
  riscv: Enable NMIs during irqs disabled context
  riscv: Enable NMIs during exceptions
  riscv: Enable NMIs during interrupt handling
  riscv: Request pmu overflow interrupt as NMI
  riscv: Enable CONFIG_RISCV_PSEUDO_NMI in default

 arch/riscv/Kconfig                 | 10 ++++
 arch/riscv/include/asm/csr.h       | 17 ++++++
 arch/riscv/include/asm/irqflags.h  | 91 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/processor.h |  4 ++
 arch/riscv/include/asm/ptrace.h    |  7 +++
 arch/riscv/include/asm/switch_to.h |  7 +++
 arch/riscv/kernel/asm-offsets.c    |  3 +
 arch/riscv/kernel/entry.S          | 18 ++++++
 arch/riscv/kernel/head.S           | 10 ++++
 arch/riscv/kernel/irq.c            | 17 ++++++
 arch/riscv/kernel/process.c        |  6 ++
 arch/riscv/kernel/suspend_entry.S  |  1 +
 arch/riscv/kernel/traps.c          | 54 ++++++++++++++----
 arch/riscv/kvm/vcpu.c              | 18 ++++--
 drivers/clocksource/timer-clint.c  |  4 ++
 drivers/clocksource/timer-riscv.c  |  4 ++
 drivers/irqchip/irq-riscv-intc.c   | 66 ++++++++++++++++++++++
 drivers/perf/riscv_pmu_sbi.c       | 21 ++++++-
 18 files changed, 340 insertions(+), 18 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
