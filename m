Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A36EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=flYnFrspeX64iNshSDPHppAtwhUcmdQSfU2aZJ9OEko=; b=YfxXvST2r9Q14o
	btSSPF9NeuVd15sz125j/Z3GSYmI36xbfHBgiJVvuNbnVdwzWe8/UWh/2x6Q0HIlBDydE0/lPtLZ4
	Pn4q2angl8UdHnI5fZ7U/PVvJCR8SJLCEajZJw1Is58YcA+nvoWWtXn3Wju3fl6n7bMUIZmAZWijz
	Rb5M41XvQ/jigXCIghVNP79UdmwO3Pvq+CxZlwOUWTyYhlk5IKnar8UCUtIw2KYhue/qQsutKn4EE
	CjdKB79IrLPd0Ft/VfOKZun3qcW/2EtklBGar6dDq+bx5WZqhxESvgbbLop4q+3J+TMb+qMBKzvGr
	+KUUwKZ+8aK4Y2GleMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10ID-005bAy-2h;
	Thu, 09 Nov 2023 08:21:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10IA-005b97-0B
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 08:21:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32d849cc152so364653f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 00:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699518090; x=1700122890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zx8fHoMz9t2Gib58EAFChiWLDxqT6xmc1EVOXsB54GM=;
        b=io32C9xqPm1AfX4x/tqNPFWiLfcqXsRyDy5wSv3lE9x+HnbLllrsSWHKarcxP0Q88y
         hCj1CRQ+Hzu7Q4fOs19joGnKrV1yn0oHOMe27FuywwakJezfKBFymRCWu6MCXcH/tpza
         I0mHuyS21Me0wAUi5ark0iJooTbbLDbgl8az7Qpc1CNnk58BumC5uTFCKvANTR0Vtt71
         oojMxZd/xSraSkc7Z6+CSDAs1KWiCASo0liFnL2ryIhGtZ+UvneClG6FQQmXCTlZGcZt
         4NYzS0KuYj5BiBGoxKWCPhiNY1pnTdcfHqpWegO3Jvc3HWqIZmZf8lBLInIqYK+v5IGZ
         Xn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699518090; x=1700122890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zx8fHoMz9t2Gib58EAFChiWLDxqT6xmc1EVOXsB54GM=;
        b=eRzUZLS+GbgWrm9PxRh3b9o6l2atVXVpd6qJYdUBBdlgaalPyd+fYrUvhQ5o8cyaz4
         xKvbYdcQTy2DBpKuwkTMfUQuXDOsNmmUncuNlwVgNgJjaKS+cUAhNpLhmNbnZm4RKYEY
         rwQITJQfgq3LyEnTvWWp/GwPwVDYU67rHBzwMZBjzThbpxOt9EEf/VH85pmkAknIJt06
         +kWBT7PeWalJ+8T8wgA23eSv0stgZCa8habC1gta7OS/zlR7NKacjWkUUreMOrvurtxa
         /ljxFCiJHkynFuiPds5UubdEZebT1sXNjqpcEZK4mMYmEkNTS188QsuGk35W9FCv+wlG
         0yiA==
X-Gm-Message-State: AOJu0YyhlQ8pnQGlQw4WLR5Ur2inroIrxxV+7lwwfowENPxAMW0ojTTN
	mT9FE3iF7sps+lPcw5cY77AIxgUfNUxNTv2u7K4=
X-Google-Smtp-Source: AGHT+IGniq9nlBb4PH71R4r1mS9EUVv34YGMqQ4t648eQ9pLjugNiZlIlsamHM2xFhcJMWzKwDzDCQ==
X-Received: by 2002:a5d:4352:0:b0:32d:bc6e:7f0d with SMTP id u18-20020a5d4352000000b0032dbc6e7f0dmr2702303wrr.18.1699518090397;
        Thu, 09 Nov 2023 00:21:30 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m17-20020a056000181100b0032da6f17ffdsm6821506wrh.38.2023.11.09.00.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 00:21:30 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] drivers: perf: Check find_first_bit() return value
Date: Thu,  9 Nov 2023 09:21:28 +0100
Message-Id: <20231109082128.40777-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_002134_094640_25D773C8 
X-CRM114-Status: GOOD (  11.11  )
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

We must check the return value of find_first_bit() before using the
return value as an index array since it happens to overflow the array
and then panic:

[  107.318430] Kernel BUG [#1]
[  107.319434] CPU: 3 PID: 1238 Comm: kill Tainted: G            E      6.6.0-rc6ubuntu-defconfig #2
[  107.319465] Hardware name: riscv-virtio,qemu (DT)
[  107.319551] epc : pmu_sbi_ovf_handler+0x3a4/0x3ae
[  107.319840]  ra : pmu_sbi_ovf_handler+0x52/0x3ae
[  107.319868] epc : ffffffff80a0a77c ra : ffffffff80a0a42a sp : ffffaf83fecda350
[  107.319884]  gp : ffffffff823961a8 tp : ffffaf8083db1dc0 t0 : ffffaf83fecda480
[  107.319899]  t1 : ffffffff80cafe62 t2 : 000000000000ff00 s0 : ffffaf83fecda520
[  107.319921]  s1 : ffffaf83fecda380 a0 : 00000018fca29df0 a1 : ffffffffffffffff
[  107.319936]  a2 : 0000000001073734 a3 : 0000000000000004 a4 : 0000000000000000
[  107.319951]  a5 : 0000000000000040 a6 : 000000001d1c8774 a7 : 0000000000504d55
[  107.319965]  s2 : ffffffff82451f10 s3 : ffffffff82724e70 s4 : 000000000000003f
[  107.319980]  s5 : 0000000000000011 s6 : ffffaf8083db27c0 s7 : 0000000000000000
[  107.319995]  s8 : 0000000000000001 s9 : 00007fffb45d6558 s10: 00007fffb45d81a0
[  107.320009]  s11: ffffaf7ffff60000 t3 : 0000000000000004 t4 : 0000000000000000
[  107.320023]  t5 : ffffaf7f80000000 t6 : ffffaf8000000000
[  107.320037] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[  107.320081] [<ffffffff80a0a77c>] pmu_sbi_ovf_handler+0x3a4/0x3ae
[  107.320112] [<ffffffff800b42d0>] handle_percpu_devid_irq+0x9e/0x1a0
[  107.320131] [<ffffffff800ad92c>] generic_handle_domain_irq+0x28/0x36
[  107.320148] [<ffffffff8065f9f8>] riscv_intc_irq+0x36/0x4e
[  107.320166] [<ffffffff80caf4a0>] handle_riscv_irq+0x54/0x86
[  107.320189] [<ffffffff80cb0036>] do_irq+0x64/0x96
[  107.320271] Code: 85a6 855e b097 ff7f 80e7 9220 b709 9002 4501 bbd9 (9002) 6097
[  107.320585] ---[ end trace 0000000000000000 ]---
[  107.320704] Kernel panic - not syncing: Fatal exception in interrupt
[  107.320775] SMP: stopping secondary CPUs
[  107.321219] Kernel Offset: 0x0 from 0xffffffff80000000
[  107.333051] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 439da49dd0a9..93d729213140 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -687,6 +687,11 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
 	/* Firmware counter don't support overflow yet */
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
+	if (fidx == RISCV_MAX_COUNTERS) {
+		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
+		return IRQ_NONE;
+	}
+
 	event = cpu_hw_evt->events[fidx];
 	if (!event) {
 		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
