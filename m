Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1085CCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=31qVF/Dt3bVT06OwWhM0XDLm5WeZuFFyy86PAQ7Mxj0=; b=LHsE14Py7d5cTE
	Y/m1omB2YvD/bYu8k63MxaOpaGNHO0Rr7Z4GpQ0Z2hfTpd1OrR21Mj/PGmLj3GMkDBQijMDMCbnfD
	PnigPiayYntRQkHQtNdBX9+g1c+EgIB42B5I2uiJ4ZV4dj8IQqyfX5DH2mZuz+KAmbZ3pjOlROMiJ
	j6oqeDDxdK/ok8prpxcEJkQfD515b5kH0LuK9v/RRJednmxVR+AT41AhXo6pGYW5jMGClZeLQt6Zb
	QJmh1IelVxSB5HmDD5jQ/UZ6ms4drTGoV7a1HuJMTZPoYwnbpcemOCHYGcLT1Az3zGx6ouHL9sVgY
	JQn/cNCfUISxisxyfsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIE-00000008jiT-0d4a;
	Fri, 24 Oct 2025 08:37:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIB-00000008ji0-0gtx
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 08:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761295018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6IP4CrvhUC+N+aJ86duEZEGJ5HwVmI6olhQdQ4mkTgo=;
	b=Rc00sIytAtbZ7JgwW6Mzg83tSbPTZqtY2tYu0ix3BDcVcislP8nQjNzfs3wwNF1CxxvFrA
	EGDE5oI9GdMm+klTXZgcJXhLAbrrkQesjIYEwpa1pjk/4gnKkEz4X7siXwgC3vFYQY8GqI
	nNvfMNlTczz5zaLPvW8bykCbcpxEOD8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-rOrXh7EqNSuLTKfk45QIBg-1; Fri, 24 Oct 2025 04:36:56 -0400
X-MC-Unique: rOrXh7EqNSuLTKfk45QIBg-1
X-Mimecast-MFC-AGG-ID: rOrXh7EqNSuLTKfk45QIBg_1761295016
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42705afbf19so1161956f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 01:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295015; x=1761899815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IP4CrvhUC+N+aJ86duEZEGJ5HwVmI6olhQdQ4mkTgo=;
        b=LqFB2GG5wTpcYIno8KxTf48b9Hu+tpy+YWA3taTQl0INxPAqPuiTmO05IMonRf/BNV
         rwuaSS/M8iXN6/Wxo9VZ2sgsu/sRA+6tA3KAamEtMDM6XIePjUHqKdVja5IRrsXqPPuv
         FsXMkvCFuNdSno1zMfQ+Mg/AYHGRHmiMV13GujAkzezteBAPw4hurut25Mxt3wX9cr24
         vsjVyPHxHox5JeHxMUy6tEGty4Bu0B1LL/cPtIQaLbP/0P6+SMOmd0Zd4JY9i/9LgEjW
         Q6FIPo5ENURLbQgV7ZPODiBpo91kAhoVzWkfGo05XgB191BM8pnwChPkAgp9QhxBp9+0
         J62w==
X-Forwarded-Encrypted: i=1; AJvYcCXGmF40eGVT7Sq1YNr+oGNy5YjAknMbvHLOnxzPfT/FJRBG8cmVbFEe2EU3d/TNZLez38Cbr7kt5cYdyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYProutpK60JUISU/SFUqtYc78Ncoml4nLG+QHAXMSVR660DaE
	y8EtCrcMEjRVtedtJEqyUB0kmZSf/gnLMC0MS23jfPXhx7PduIKDJaVMS1kthhjukTQMD8riCZl
	RhUVUE5xRtHF1dMyotcnJri5iEe1uLa4N+ARQPcyhB0wafD2SnGRUclNGN5Aa9tU70aw+eg==
X-Gm-Gg: ASbGncs0Z6Y5nItX1Ltg0WfvaI+Q857cYFbREdCwHGez2YQscHmBtY5d8TqQyrUr53G
	Xg1Gll0ukqSYXtW43uu1pY9mdOQ61ZiKOiN5Ro2d6CPK3oqeh1uwv+fWB+fnNnGzVKCqCG3xorR
	iC5adaguEIY8WUmZpMcNhqE47vjnoj+oAaiUapmtbMwg7rZNLBeXBLQRS9Eo4T+cXGHUbGNVp5K
	aR66ev+VIwoqm3e1FCOgy5owDUSL+sk4sqhzFTf/L/BIc9ZUteqciG1oSBQzQc2m5TMSQJaH7Kf
	2WiLya3VUCXCLngv36jSwPZBNsZfF/JXFz9a4AGFqFvVUuojrzIDmKSDAfs8yfmNO4MPRBhWVGQ
	5RjUYTn9y
X-Received: by 2002:a05:6000:2486:b0:429:8b4a:c3b4 with SMTP id ffacd0b85a97d-4298f50eb44mr1420045f8f.5.1761295015436;
        Fri, 24 Oct 2025 01:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA0nB2sR3hVRzBJN7DXMuBj2PcK0Ip1C+Sl00x3e48btGKdsyMquC1DjN94eGd/K76AwujjA==
X-Received: by 2002:a05:6000:2486:b0:429:8b4a:c3b4 with SMTP id ffacd0b85a97d-4298f50eb44mr1420017f8f.5.1761295015023;
        Fri, 24 Oct 2025 01:36:55 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e77dasm8111636f8f.2.2025.10.24.01.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:36:54 -0700 (PDT)
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
Date: Fri, 24 Oct 2025 09:36:39 +0100
Message-ID: <20251024083647.475239-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R8N1hrWLWfEZd6UuxFqCTpXaCthXAiN_MOtb8DKJh_o_1761295016
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013659_453572_CF593267 
X-CRM114-Status: GOOD (  13.96  )
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
