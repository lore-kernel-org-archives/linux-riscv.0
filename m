Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF59FCCD192
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=smJ+9JSE8ZL9jW06I3AP5/4wbNxi6UCjxnJ51ItYfYY=; b=kZ+UU4iCAnHME5
	nuiF8p/Tl8Lt6QpY0g1uxlevj0eDKuwBwXoShqB8M9EI3UBKVlz2Nd6wtC9k/EwGjPn4fkCohho6/
	d7GLP6o5qlrpOGmGyPwaMaN7RcAmbY7i0alymjlW3OFijtnWEkm+vkBivfBRP3qTrHowjXNu2u6kP
	Pbu7B5aw3hwXp7eJZyfUjpvuzAX2IUYEiXYmX+oEx7mqCeqTQd+ZShNHgYxLD2Sm+olyfSeQa/7iq
	aj9+tUJFRHF7OiX4jp/XViMPlGKdbEHS0xNSLY16erDRTaGbmL7h72M8oDXJXwxBn4ic3eZpJr9ax
	PY4pFac70rsGTc3wIV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92XB-00000001tP2-2WHT;
	Wed, 15 Oct 2025 14:31:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92X9-00000001tOL-1Ol3
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 14:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760538678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J5M2mmh4Ds9HKwtTLyTklITpPz82TYqRilJSnlAqd+M=;
	b=a2U3sNES2qtSSOTKlew8PYEqf+H+7ZjvCqo/ee0fvhjl87zdRh4KB+o8Zah+gbtA99vDCp
	4dhwxQ5d9CPzDp867clLDYWCLc0phBmM6VFJwN3EyvoVUu5MwaT78beyLOpPxD17v6/ObY
	gPEqG3vrFyy5oCSFuGWX+0UboFa04xE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-EsZU7MtEOX6pBcCJUjo-Lg-1; Wed, 15 Oct 2025 10:31:16 -0400
X-MC-Unique: EsZU7MtEOX6pBcCJUjo-Lg-1
X-Mimecast-MFC-AGG-ID: EsZU7MtEOX6pBcCJUjo-Lg_1760538675
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f42b54d159so6616496f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 07:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538674; x=1761143474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5M2mmh4Ds9HKwtTLyTklITpPz82TYqRilJSnlAqd+M=;
        b=Nv08CjdM/5PMJuUAov2YrGt5lEFTEes0tMTAiEjKB/uyz2Vby+jhomIswusdHpZwJJ
         xVDNRRGx7Oh6udYeyZDlJ998lN8ji4nfHeKzfb5bZ4v8r9oUrcuMTJhHjuOkwMnIjeMi
         QaT1u2RdeaayKLhNzTe7WkYLK/LQ+B+8m0iCGbeFhwDhkSg7qWgELDrkavoQ3Vrv933m
         W/gTczp4Nbx4M/un3IANWd3Xo9oNAuyUu6AroT94BF4vLieorotE+zCIbzikIlv5YWPP
         3GyuH48MYbIRMIj+bg6eGqHDd8MUY6+jpQ+5LEAxUBlVyrXOnLvUlFf/D9bemM2vZhdb
         YKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSvjXOImhX2MOUWPE8h8N6FK/ssKO50xD2RPA7YOBWaZvdyGunkG/+jvJJJPeMFFxUaSi4GmZwLrlWlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvF3lg80G3ttZIZwhvkz+Ke59EmwwtMVcV707N9bDt04A1ktTw
	Tu8pov0HHUBv5LHmw9tsDnLDlPd5Jdyas7YyrM657GZYy2f7IpFxIBpPR5oLL07InCo8j+OpmXX
	gDL4eltWZxhdKVCiSopNrHRdpqRHleXZFxvKavhbvn1VymYrZJRtZAjIK+79Nk1im4UxTYw==
X-Gm-Gg: ASbGncuyZX7kknMuhAm5ThduJh/FKpK3ouWocKPCs/fCqJ9moFzEKOx5TElXRfPe9aC
	9+lZyTMllqI9PSSQoH8ye+HHbpUHDIhPwS6dqO/ZFtGLAh8TRoqGtjhehPZ0unc9NiHxdESBSL9
	QwANPdYv5lL75DAcx3G3tWJfxgweLpZWp7kNTSYxJloa2k1GWB5abwLEV+94MiCX0iuJKiBD64z
	xmZ4mxPmx1fPjnufzX3XBGBUiZc6ArCoC73+YLjkZxUcR5UWnlfBoggDIdbRsmcVl73KWGT0T/l
	PE8c1rERJRdUL7+JBre8KT/Rtmi6yPmMdUwnCwAKd5XVjkPykTT8yTQ=
X-Received: by 2002:a05:6000:608:b0:3ee:1125:fb6d with SMTP id ffacd0b85a97d-4266e7ced08mr14869587f8f.9.1760538674474;
        Wed, 15 Oct 2025 07:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmA242wjCu8aNX4QT+rftauK8lKZ1A4bt1SE1thTeCnke23rZ0LcaSiVmzhHvTvt87sNNPuw==
X-Received: by 2002:a05:6000:608:b0:3ee:1125:fb6d with SMTP id ffacd0b85a97d-4266e7ced08mr14869567f8f.9.1760538674014;
        Wed, 15 Oct 2025 07:31:14 -0700 (PDT)
Received: from holism.lzampier.com ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c02377sm32617005e9.6.2025.10.15.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:31:13 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add UltraRISC DP1000 PLIC support
Date: Wed, 15 Oct 2025 15:31:04 +0100
Message-ID: <20251015143108.441291-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WnU1SLyv7NiYbtMaILI7Gryr7Y-4HWF_fSuXgeqjwWg_1760538675
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073119_464742_86BAB516 
X-CRM114-Status: GOOD (  13.10  )
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
