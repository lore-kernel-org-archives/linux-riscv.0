Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08B0C28B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 05:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ALgyFLVZnseje63vfov43u44aq3sK2K0p+0znRiChqA=; b=wjq4RolgriI01B
	X3AMpOsUk/DR5EBTItpJ8YNSqXm7FQmjkxriGUFRGIx4RqzRQciDN5j/FqOiFNEXGLJhKIgUg6Ryt
	4Y/c1UQBzHwJiiY+PXENIoBg4XQMw+xzgvl77fEowlzILbDDMQ3cz/oi/DaHq9EfDfX56C4wQdq7T
	wdE3wEu3MgM+2XES6FVsKDNdz0O1T1lXOUGfhg8FVUivOKukYgiGUta9oauqz/Ax7gtSs1TvHhzTA
	UVuGux/o44oGJzTjDlOJJ14OIUAO262LqI0DgB5pLS8aqU96JdzZcJmeg/PcLCIoCLY8Mpybw/UHd
	KKOVPK/s40VBL9iQadVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trs2F-00000004e1i-2cLq;
	Tue, 11 Mar 2025 05:20:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trs1e-00000004dxn-3p0Z
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 05:19:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2254e0b4b79so1268185ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741670373; x=1742275173; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i/dt0ZX89cRHtWHaB/kc777cnfXfjLxAIjIrBqsq1Y=;
        b=cpiFeJ5eYnWUJF8KoQ0p35SOrf/Do+jQy8jUkzGKXuVPLHuC5Eo5wsHHbbFwXxOLCQ
         XGP//hcIhRqKlQ5WDqgI2uB+iWoGicdMwyBfjMcTwKRxteY3IxzbbBgnIifuLyhRPhGW
         HWpxIlUjTXx41wNVIHRFnLdsUNYD07Cfx/V2RNswZMn3JPiNihngASFxGuWEFkJyXK6v
         TldV+j0mZpzx4y2uxe7cAhIqNiF54vto/BDLNjQMHm5Hn7DbaerGrx7O0Lz9ouutS5iw
         n26Vjb/NEjlBurWkKEDLaaI4A5qnFNLFLd1Q2Hb2zyVPn4felgqHj1I1VEAye9Jr16b5
         dBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741670373; x=1742275173;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+i/dt0ZX89cRHtWHaB/kc777cnfXfjLxAIjIrBqsq1Y=;
        b=SjWcumeeI3t8uO3jFBy8eu9CpvEVHutQY+TSJYVkVatp8Rql54Eem3pONR3Xz5gTKY
         MLa3Ju/nFPvcrhXp0QW8cAxZImvBz3nRLjgjFsHBx5UaOfdmAHAXZvCp4lc4fQgtCk+d
         0/COt7juPEJxhy63zxveXbDOCjBMiBL2JxS6GeUBFMdNGkfIs46e6REIG0GDP1gpJAWP
         OFWr1AYIcFJTBvx8Gxatqoyezm2T0D/kSEjKDhk1TsYGIoSK9o28I5+TVTN0Z2F7tFf7
         othxTcDRl8EiHXoRjZ0SNKqoGhjHXDv/c8PmG61Vr1AJed7uVe/NGY2XIk3hGkrnlfJ/
         nwhg==
X-Forwarded-Encrypted: i=1; AJvYcCWIUheIfbQFDaLGqrc1oCRwHyZmVdzfOG0+fbbyoa/9cgjXX+b3wSVD3b4KWqCGfjVRtAymSvKF9aA5Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGa1PM4dNfKSaqYJF+qQ3IeiMygY0TQRHHrbHF/NgplgKF++zn
	o1EDX0PYoQ3XJI5LbfZ9wA4zEj1Z6K3zRm9uWQ29ltT6B9NVlJOzmYoLGQ/o43g=
X-Gm-Gg: ASbGnctYxGCkFpmqvckmb1IYi2TFRFbe5ab0h9mkoXOEDIBTGygzWgD86qvfXfO2z+c
	qTYsu41x/A/5WzEgSocQeL9re/kQQ7nPEFixTNQEzpJs2Z45TIEGsYeHixXe//iVWkq3bCaa0Ac
	WcySu5YzZQeF685PrE2natpRP7cvv5PVDXs96+/VFgQjamVVGtwapBOhbxL8XO/y//i/6vKAS0W
	JxatlSAsBDxTgMpRddEjMeb95UuPutji7muDnarMjviWRzO3MOvz3V7+CyNXCgbFRmAs/OLpnM2
	srEPTzShwkmV3cEMUJj2SM5k5zp9c9qymjimTtS1jU7crO1m4CdQye4VzD7r4vAq5DU=
X-Google-Smtp-Source: AGHT+IEntr734nFZJCJi9wFIrZS3LNF88PAO3SBZe3Z3mk94wDz9J7xsCrG6KvNbYGMyW21bfvgtPw==
X-Received: by 2002:a17:902:d48f:b0:224:1219:934b with SMTP id d9443c01a7336-22428c099abmr227046695ad.50.1741670372831;
        Mon, 10 Mar 2025 22:19:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e9fbfsm88597995ad.92.2025.03.10.22.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 22:19:32 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Nick Hu <nick.hu@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] dt-bindings: timer: Add SiFive CLINT2
Date: Tue, 11 Mar 2025 13:19:03 +0800
Message-Id: <20250311051903.3825-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_221934_962882_A06A6535 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add compatible string and property for the SiFive CLINT v2.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 76d83aea4e2b..93d74c504b5f 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -36,6 +36,9 @@ properties:
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
           - const: sifive,clint0        # SiFive CLINT v0 IP block
+      - items:
+          - const: sifive,clint2        # SiFive CLINT v2 IP block
+        description: SiFive CLINT v2 is the HRT that supports the Zicntr
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
@@ -62,6 +65,22 @@ properties:
     minItems: 1
     maxItems: 4095
 
+  sifive,fine-ctr-bits:
+    description: The width in bits of the fine counter.
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: sifive,clint2
+then:
+  properties:
+    sifive,fine-ctr-bits:
+      maximum: 15
+else:
+  properties:
+    sifive,fine-ctr-bits: false
+
 additionalProperties: false
 
 required:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
