Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456F5CCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=31qVF/Dt3bVT06OwWhM0XDLm5WeZuFFyy86PAQ7Mxj0=; b=eIWXq414zSHd8W
	7WnQgWtnc69rPBO7utiqFPSE7Ceb1ZKJY2UIeDlJzgqGY4a4Pvps1cLODiTYEVlbEDvIaD06lUIao
	yfH5e/tehfTDrqu5qNYQ2T4J6pHXC2OZVkWJf58A+luR4G4WzL/JGopBALxXEHp5eoK6VUh6Rnrtk
	2HG+/ZWBhDG3PwXVfCPvt0wI5y8XpjYXEItUHopFIvWt4YYbLqYbhPW0BTaI+ienTvojpYL1flG/q
	/JxnoSQuF81hZSZx7W4W87PQntf0I5yx5LTA0oT3NmjHqKKVehQq5RxmZu8tXNS8E1Vh/6JwAdzJz
	VF0xKCbAMc24h9M9dspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvsO-00000006VaS-1M6P;
	Thu, 23 Oct 2025 14:01:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvsM-00000006VZL-18BZ
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 14:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761228068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6IP4CrvhUC+N+aJ86duEZEGJ5HwVmI6olhQdQ4mkTgo=;
	b=Fmq+bjpPd2AOxQpA7ud6u93w6YCu2AehPSxhV0Vh8qzIS9oJGx+SOVWl/9uHAQcXbkMv6J
	Zs8Rqwh2hU5GgpAwTVJkweJrQGfeKogeBzlNaBwJhq+v0dZ85dKHL4r3aTQuFk4UAZdGaJ
	nTa2Z8a5SFQ9uv7kEKQuAqVnxmF+KqA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-_MppreRLNYqFSdT43TfzMA-1; Thu, 23 Oct 2025 10:01:06 -0400
X-MC-Unique: _MppreRLNYqFSdT43TfzMA-1
X-Mimecast-MFC-AGG-ID: _MppreRLNYqFSdT43TfzMA_1761228065
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso4001435e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 07:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228065; x=1761832865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IP4CrvhUC+N+aJ86duEZEGJ5HwVmI6olhQdQ4mkTgo=;
        b=oo6b9xIERXuBcKuegr6/1AQh6EK7yVkeUA3QqemGNquoBLV1LGd8rvIiJDwLRv/hfO
         zUT80Vp5S0B2ivESsyq+AYpBkCJV8W/ySeyB6ws9Q7Oei3Jt/1+kwjnaSkqtY7waOUPW
         SN4P1DDyRyRK159RC6dEC/8r+6ts/RAoJMaCdOX6ULmjI4t01Te9K/FrLQ11DAInS1Lu
         VLmRH9yxed/5ju+z8iRzdVpPjk/GlfdIXJznNzVactugBr5QK1Oi2YzObqQOQQRDQbGZ
         bYBIiApjOfZvlzfFULS6hkgdd2hH02KxPGFJHwoYoW9xEfLDESKp2mo4hiZwItIARWQC
         Q2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzoJ54a9rQSDR9vgSiDQo9Uy4VqWKWIuUdBxYMK/Dmv2fZ473CR/tcm5uS5RnG1INQ0Z9yN9Hsn2dZRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM724Rbfble+7QFyi4UIoIqmRaEJIpKeHMryT0tt2gmKf5BcYm
	dJfBh7x7/0fzPtEutZUun+BEe1q307QSlfiLVggH26ByN/3Qqi6E80wQEqyedUyU7YOzB+x+Hse
	9Q5bN28AJd880WVEBlOhMVZJHG5io7b3WrBQHDFlVj9pkbnlcaEbqAHp6Wya5TqxSbtmRUA==
X-Gm-Gg: ASbGncstBP73llFzg248mXkZFPGaBJKi/lQyPCkyPqRZq/uHkbNlBSdwZG6Xg80HS1p
	sRCrO7FoQ4KPAXhT0oFNdyJZo67pmoxIclcPRQi/i+3CargfuIGIa+lbG12DwI/1ARpSzGVcSfg
	j6Cqs2ABKDz9lmpZYe8F8lpdcrmDPjLAw7vlUafJ61GPzBmnti67IDiVRR2zzXMP3WlAqDd7XF6
	YuYruck9boYYGJXigi4wo6I2diTxLm+EBldrRJ3S2o7gAI0QBuQxL5+yX1tz2noX8o/mrMCFFmK
	XV8oJAgEcjy1cca8RdEUyGaqTzOeLAyS+W+1sQ4tlzbd8XLCW80UUfzwci9h7u8pWZb4scoftEF
	/OvE=
X-Received: by 2002:a05:600c:5493:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-475cafcaee8mr17242225e9.17.1761228064858;
        Thu, 23 Oct 2025 07:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU9Vc6znRHA5p61MvlM1lauESPJdCT96hHFW7bW4s6ZjQp41JGsdZDFlOF51ydY6xFUR63lw==
X-Received: by 2002:a05:600c:5493:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-475cafcaee8mr17241025e9.17.1761228062893;
        Thu, 23 Oct 2025 07:01:02 -0700 (PDT)
Received: from holism.Home ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898add96sm4116154f8f.30.2025.10.23.07.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:01:02 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 0/4] Add UltraRISC DP1000 PLIC support
Date: Thu, 23 Oct 2025 15:00:49 +0100
Message-ID: <20251023140057.204439-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oO8Sb5ekmf94-UsxVVwWoFYryZtTq44e1EjhwCR-NYE_1761228065
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_070110_381238_5C4F39BB 
X-CRM114-Status: GOOD (  14.15  )
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

This series adds support for the PLIC implementation in the UltraRISC
DP1000 SoC. The UR-CP100 cores used in the DP1000 have a hardware bug in
their PLIC claim register where reading it while multiple interrupts are
pending can return the wrong interrupt ID. The workaround temporarily
disables all interrupts except the first pending one before reading the
claim register, then restores the previous state.

The driver matches on "ultrarisc,cp100-plic" (CPU core compatible), allowing
the quirk to apply to all SoCs using UR-CP100 cores (currently DP1000,
potentially future SoCs).

Charles Mirabile (3):
  dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
  irqchip/plic: enable optimization of interrupt enable state
  irqchip/plic: add support for UltraRISC DP1000 PLIC

Lucas Zampieri (1):
  dt-bindings: vendor-prefixes: add UltraRISC

Changes in v6:
- Split enable_save optimization into separate patch 0003
- 0003: New patch - Optimize interrupt enable state tracking by maintaining enable_save
  during normal operation instead of only during suspend/resume
- 0004: Use existing enable_save[] instead of reading enable registers before workaround
- 0004: Return iso_mask from cp100_isolate_pending_irq to use in restore logic
- 0004: Skip writing enable masks that haven't changed during isolation
- 0004: Skip restoring enable masks that haven't changed after claim
- 0004: Skip checking groups with no enabled interrupts in cp100_isolate_pending_irq
- 0004: Updated commit message to clarify dependency on enable_save optimization

Changes in v5:
- 0004: Added brackets around conditional in cp100_isolate_pending_irq (feedback from Thomas Gleixner)
- 0004: Reordered variables in reverse fir tree order in cp100_get_hwirq (feedback from Thomas Gleixner)
- 0004: Replaced raw_spin_lock/unlock with guard(raw_spinlock) (feedback from Thomas Gleixner)
- 0004: Added newline between variable declaration and code in plic_probe (feedback from Thomas Gleixner)
- 0004: Extended generic_handle_domain_irq call to single line (feedback from Thomas Gleixner)

Changes in v4:
- 0002: Simplified commit message to focus on hardware bug (feedback from Conor Dooley)
- 0002: Added Conor's Acked-by
- 0004: Renamed PLIC_QUIRK_CLAIM_REGISTER to PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM
  to be more specific (feedback from Samuel Holland)
- 0004: Added Samuel's Acked-by

Changes in v3:
- 0002: Updated commit message to clarify that DP1000 is an SoC and CP100
  is a core (feedback from Conor Dooley)
- 0004: Renamed dp1000_* functions to cp100_* and updated commit message to
  clarify the hardware bug is in the UR-CP100 core implementation, not
  specific to the DP1000 SoC
- 0004: Moved quirk check out of hot interrupt path by creating separate
  plic_handle_irq_cp100() function and selecting handler at probe time
- 0004: Use existing handler->enable_save[] array instead of stack allocation
- 0004: Use readl_relaxed()/writel_relaxed() for better performance

Changes in v2:
- 0002: Changed compatible string pattern to SoC+core: ultrarisc,dp1000-plic
  with ultrarisc,cp100-plic fallback (suggested by Krzysztof and Vivian)
- 0004: Driver now matches on ultrarisc,cp100-plic (core) instead of dp1000 (SoC)
- All patches: Added submitter Signed-off-by to complete DCO chain

 .../sifive,plic-1.0.0.yaml                    |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/irqchip/irq-sifive-plic.c             | 126 +++++++++++++++++--
 3 files changed, 118 insertions(+), 10 deletions(-)

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
