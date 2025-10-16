Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B55CCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQoQ4Zu1YF0y/9pouhINtSemTLvQXuikYRt68CoRHTQ=; b=EUVlZkAszvoSdd
	WHC3Vb8IGl5dROxx7ztpKzqMsMOFw3/IB3xCChuRX/Cs16Yj/ejk3kQAvxdRHw4EQ2CAR5sRl62Lo
	u5VM4R5Xn2uHUtU2K82xJ4iRwy9rf9Jihbwij85GoAmFPUj750K5v7zShpPXWTGNvg9oLS+9N9o0s
	tDKijeA1xp6nMD77SEwsZUun6NQmx0vLwBV6I95gYUyEOLxDje0PAoS3EOqOuO+vJsGtHRq+U/3MA
	sSFdXwcQSAlisuiPSiN0qJaAsU9cbIbjM0C/+KNi7VkFpmhUgkg4YODiJeWFBU6nnDfjlDvXyYM0N
	4BiSXkiQaK9Jriw3B33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ja2-000000040mz-2Xot;
	Thu, 16 Oct 2025 08:43:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JZz-000000040l7-1zfY
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 08:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760604200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KyahKcL6o8P6t63WLrfexNsD9TFdcn7bX2OSqJHfXIw=;
	b=VrDwf8wVgwc7tOoEzMfKokWY4DpT6DkeA75bWKHCr43CFrlC0/K0BPz7lSXtnTVl89b/uS
	6kV/f/ZqwuwjHmYPc5l7Ku2SqAmb9QApAGpGjYz5JqFiU3ovKy2fjQu0lxKMRMBdG0Dys6
	kXi1usLjvcO+rOTUcMyJhvuZ3QwBFOA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-hDN2u2bgOIK0VtQnXX6OIg-1; Thu, 16 Oct 2025 04:43:19 -0400
X-MC-Unique: hDN2u2bgOIK0VtQnXX6OIg-1
X-Mimecast-MFC-AGG-ID: hDN2u2bgOIK0VtQnXX6OIg_1760604198
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ef9218daf5so1178265f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 01:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760604198; x=1761208998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyahKcL6o8P6t63WLrfexNsD9TFdcn7bX2OSqJHfXIw=;
        b=YZDZwaHvYdEXadIxyCQW8xnd/34D36qAAPHJohvTV6N6vm02L0GTorXqNldzNGl8Lj
         4qklDCITCjP7z+4iSZAeuaq4GPFPVtmtDAp/uKoPT3KnpyxbKX8etVMwdOmuhiL4iXwi
         8BrJA1RVEXR2mD1zVsTG6HzUIa8MYKxjnhyKOLusEglt6IM6wbQ2jUwiCpAq4YUXb6zC
         +4NCxrRKZHEAWQ/GhO/YY7OCxQu7QOMchaGdX4F80CcZpSETo4ULHMgPW9iXXGL9cQWm
         6D7+jouqwOI8P8qpR34R/9Xgv3DDfR4mPIB8aOrWOPQd0OQqmcuR4I7o0H0YDkC8hlAF
         CKTA==
X-Forwarded-Encrypted: i=1; AJvYcCXAvrRX71tiGVAtqedYZ6u0n/er3+6pSD+mn5NC43irGPyn3WAaE823hNLWHvJkptblyTHFtDyKqVQrxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3vZNAri0f8g+3ZCur7SDoZrOxwP3Cbot3Rv65z+vtJUqkQDPD
	wBRNCmWV+NHcyeTfE3Ev5oW6cFZYQEve39AM8Q5ySxKLniLAjtq4khVTrNx73DfeA0l/RL7KfYx
	Eev3x72G7Kvy6dFVdpWgxo13g90E9Xf/QRmqv6lw8CokegEGoSRT+CSEWO9AT5obAJ5OM8A==
X-Gm-Gg: ASbGnctuXOh75PXN2uUkdOWbrgvMzU88HoJ1q13baYQGFn1ITNaMBmxjQ/21eAe/sRC
	pOobaSRWfPysHWtAcW3K1FQgNRP4yKzZnKOF1jFDDdL67u4Jx1VdBKeaptuUd//ehucbwRMGM4X
	mtukZ7FSKYcFBxitxCaWKExgktuw54Q+1XYFP9FHb0A6Rw+ACwJJfZgpigZ/gpkM0EMe/MEAwDh
	3Oelb8VObabOhDU90xjK5k8dLvJswkT+uc8qAGCW8dyHv4NHsChdcDqC7vmkLR+ebHG/lsTGYk7
	PyxPH8N5E+N0IwygY7dmXQH/MfBuTnVOqxQgtOn/bctpxpsLeWTVcgdmueA9a8GJLeBp9jsnWn1
	vGVcI+koK
X-Received: by 2002:a05:6000:258a:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-42666ab9644mr19953868f8f.12.1760604197823;
        Thu, 16 Oct 2025 01:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmUip1A/UhHh5kW3to9yCpKQOreBcpH/mjED2mEB7/ANZ11yhrQVq4qbsxmTXCWdy+ciYqEA==
X-Received: by 2002:a05:6000:258a:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-42666ab9644mr19953856f8f.12.1760604197410;
        Thu, 16 Oct 2025 01:43:17 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33047565f8f.45.2025.10.16.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:43:16 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Add UltraRISC DP1000 PLIC support
Date: Thu, 16 Oct 2025 09:42:53 +0100
Message-ID: <20251016084301.27670-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dl35U1GLcRKxIKv2cEd3ijuHxSz6lBGz60pTaMJL_0Q_1760604198
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_014323_584194_519CB004 
X-CRM114-Status: GOOD (  13.66  )
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

Charles Mirabile (2):
  dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
  irqchip/plic: add support for UltraRISC DP1000 PLIC

Lucas Zampieri (1):
  dt-bindings: vendor-prefixes: add UltraRISC

Changes in v5:
- 0003: Added brackets around conditional in cp100_isolate_pending_irq (feedback from Thomas Gleixner)
- 0003: Reordered variables in reverse fir tree order in cp100_get_hwirq (feedback from Thomas Gleixner)
- 0003: Replaced raw_spin_lock/unlock with guard(raw_spinlock) (feedback from Thomas Gleixner)
- 0003: Added newline between variable declaration and code in plic_probe (feedback from Thomas Gleixner)
- 0003: Extended generic_handle_domain_irq call to single line (feedback from Thomas Gleixner)

Changes in v4:
- 0002: Simplified commit message to focus on hardware bug (feedback from Conor Dooley)
- 0002: Added Conor's Acked-by
- 0003: Renamed PLIC_QUIRK_CLAIM_REGISTER to PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM
  to be more specific (feedback from Samuel Holland)
- 0003: Added Samuel's Acked-by

Changes in v3:
- 0002: Updated commit message to clarify that DP1000 is an SoC and CP100
  is a core (feedback from Conor Dooley)
- 0003: Renamed dp1000_* functions to cp100_* and updated commit message to
  clarify the hardware bug is in the UR-CP100 core implementation, not
  specific to the DP1000 SoC
- 0003: Moved quirk check out of hot interrupt path by creating separate
  plic_handle_irq_cp100() function and selecting handler at probe time
- 0003: Use existing handler->enable_save[] array instead of stack allocation
- 0003: Use readl_relaxed()/writel_relaxed() for better performance

Changes in v2:
- 0002: Changed compatible string pattern to SoC+core: ultrarisc,dp1000-plic
  with ultrarisc,cp100-plic fallback (suggested by Krzysztof and Vivian)
- 0003: Driver now matches on ultrarisc,cp100-plic (core) instead of dp1000 (SoC)
- All patches: Added submitter Signed-off-by to complete DCO chain

 .../sifive,plic-1.0.0.yaml                    |  3 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/irqchip/irq-sifive-plic.c             | 94 ++++++++++++++++++-
 3 files changed, 98 insertions(+), 1 deletion(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
