Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E9BC71133
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzbcRqlhTmyvqWEZUsfK49fuMHFCrHxAR/njc8jGBuI=; b=JK5Q24wG0vwov4
	+LV9K4Z9A/yGcvZO0SaH8puJ9petn1Kw1DLqVu8dCRvo2+28SiHc/DA4BnaKyPe6OfqlQMSdM+bH0
	3WjXxVEpr4z7TUEA5B8xkCkYTqQRvxhju2+evN4TOWfqxh3L6sM3dNdvQaeAPggnOZNjIQBBpgcEb
	8ZFLd9/bF0Obf103wKLj8ceDgBIGhZfArrKHWuZW/q1eJqMtVhxhkRlzThaaradesKFlfzc2RbZk5
	DQjHuE3kn+RsumuGODq8RLNsczmI25s9Q2RTkxJlKdlvQb9DOwqN76yJn+cDG5m20I/a1vdgVT1p1
	TkO8Q9pIfMmHlGdcELdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5n-0000000AZFR-3Piw;
	Wed, 11 Jun 2025 16:14:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL34-00000009tqF-2uMt
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 12:59:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2363616a1a6so18940445ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646762; x=1750251562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgXKWx6LT0v0t2kW4DENrP//N1tJL1EVc4tejq3gXuU=;
        b=P4kVb2SmpZTYX7oCsPzd/JT5WLjBej99jL6EUdU1FeXhvg11gQzj4Otbvk1zqF00hG
         3t5by7q7W3HNqqh7RNLuAtjWuW/hrNUdQAbeJyXqvf7As6bAspX3R9Es1ft4mzenSglC
         eXV1TQ4rYAaVg4USZlVa5BebC5Jw67ndcM+u8kX6cOcpOr5ifHi/h42eaIlQJB9dfuoi
         R5Aq5cbOlv2c9zhRWRewf4F4CE0nPHznCm195yiz4Xq2zHz00I3xkDR9too7yoyCLUEJ
         R9G9sLCs4AI1m86EHFoQH/wPmT0L5/ZZTRVARBf+49J93fE61X8Z7AVZJO4B4fm3jzJA
         yOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646762; x=1750251562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgXKWx6LT0v0t2kW4DENrP//N1tJL1EVc4tejq3gXuU=;
        b=MPSxD1nUGB07TzxlOz+jJFR6Pfu6MX6y5om3uChI2WqpNBIJ/DtbO1BJyyNlMpMf0R
         qmVOJLS5Xwv1XFcBWqjyiZQzq8IaueUSuQe7i4Gkdz7StIfH5buQy1+E99YtixHWY9Cc
         fvxIvsnt5SuMQ9ssCXP3wZbIp43rkYdygW+X1tLJIUFu7btatKGODqVwhGJtJ73PDHeW
         vOQYuHYTZNT/Pwn4pCrMK5FYaHu+IKdQm35egc+W3FX8MBjvdG5flo8ujOGM7yczX/ph
         sX1wShPyU5gCFOaSkG6yq+8Imue6k+A0nWH56ixfLtVSjNPIFrWddNKq6KpSUTs2g/B7
         fUTw==
X-Forwarded-Encrypted: i=1; AJvYcCV3mt2SCVBGQ+7SYP9jzcWWlyHY5ZzBJuNJ2YL8n7bNBD16yG3Uq0wbMk0M/BgI26Plwpt2Ozd9vQZV9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE6IJRpVbDNWIRa3Msq35OCvnN6JzONmC0m+NiopTFijXFwOIa
	xRxrS2PyVl1CVzO40pGjnAccISBATMbPmX0VVyVrNfq76PstbIffKRtXzSXqey39ZCU=
X-Gm-Gg: ASbGncvNFI0L6g+JBh/1k+De1bH3ZezGMghIEhZfXWoqasa5RmVxAibvFkZNleZpK83
	a2jGDovvP+7eKw2VlpnCttrMtrv3OyL/c5Vk5xc8qfm2IGAJThxhlcPiLU/F6kreKCUUyiWXV38
	LzRJW4fAuTnTrb707AKI6BAOp6QJ/4lYK5Rd/+H0+fDYKbv/4+B9jEThs/vMKC5EjHpdT1iPySM
	lmghnrjqDJjwjnWoeHFhank8KKLlg4gc386Ninka0M42xTgPGODCThmv/Wnx46Psc9c3xHY87Tf
	ANr5fH5klJnYEHbs+akAJs/1v9hWI86EATE7O2NODKJw2lSywc0vUXH/eacyA6+PGF2dCrPOvCz
	FVJCDh7V3lS9x2yF5KzA2cgdwg/pkr134
X-Google-Smtp-Source: AGHT+IHP+0owmszooM6L86XNZc5ha8+zkwg20Qojl6bQqCgBkl02MT2JBYiauh7dcDoSUFp6EUtZTQ==
X-Received: by 2002:a17:902:f78b:b0:234:b131:15a with SMTP id d9443c01a7336-23641a8aad8mr44833385ad.4.1749646761961;
        Wed, 11 Jun 2025 05:59:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:21 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
Date: Wed, 11 Jun 2025 20:57:16 +0800
Message-ID: <20250611125723.181711-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055922_729793_8D112754 
X-CRM114-Status: GOOD (  11.41  )
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

Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
controller in the Marvell MMP DMA device tree bindings. This enables:

- Support for SpacemiT PDMA controller configuration
- New optional properties for platform-specific integration:
  * clocks: Clock controller for the DMA
  * resets: Reset controller for the DMA

Also, add explicit #dma-cells property definition to avoid
"make dtbs_check W=3" warnings about unevaluated properties.

The #dma-cells property is defined as 2 cells to maintain compatibility
with existing ARM device trees. The first cell specifies the DMA request
line number, while the second cell is currently unused by the driver but
required for backward compatibility with PXA device tree files.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
index d447d5207be0..e117a81414bd 100644
--- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
@@ -18,6 +18,7 @@ properties:
       - marvell,pdma-1.0
       - marvell,adma-1.0
       - marvell,pxa910-squ
+      - spacemit,pdma-1.0
 
   reg:
     maxItems: 1
@@ -32,6 +33,21 @@ properties:
       A phandle to the SRAM pool
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  clocks:
+    description: Clock for the controller
+    maxItems: 1
+
+  resets:
+    description: Reset controller for the DMA controller
+    maxItems: 1
+
+  '#dma-cells':
+    const: 2
+    description:
+      The first cell contains the DMA request number for the peripheral
+      device. The second cell is currently unused but must be present for
+      backward compatibility.
+
   '#dma-channels':
     deprecated: true
 
@@ -52,6 +68,7 @@ allOf:
           contains:
             enum:
               - marvell,pdma-1.0
+              - spacemit,pdma-1.0
     then:
       properties:
         asram: false
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
