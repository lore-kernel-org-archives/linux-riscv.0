Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B56C369D1
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Apr 2025 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqNL4WN+6ySlAzfXB81GbPdw0quUV3KV9E80ufk659w=; b=YNVVuLVdENKrQs
	lSj50kL3uW1bjm2zVVJv74ytdL4LKNpVP4tUDPGPLH3H4En4h0Zg64zWvcWW3rwIEniCUCbRKK5ny
	zXRuLAybKGcD23/vt14BhziXGDosEOtJPwaJQmnkpNUy3wQ978hVkgCNgKifOJ3VZjH3WjGlrfXQg
	oGJROFXwXIrIR4EgJxOvpMQkplNeMpgFy3jr72ripkFJ3MU25WmxIHOFxtpMMghk5gV0TeLqpBIZN
	+TLE/FHtDTyduRU3w2e1/MEF1Oiuf6BlyNC1YpPVXdBHu2ZEkq0pD8HJ4QdCn1lGOrzST71gug0M8
	5C/q5vGJC9ug5HmrNfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6OjL-00000002IEW-0WJ8;
	Sun, 20 Apr 2025 07:04:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6OjI-00000002IDP-1XzW
	for linux-riscv@lists.infradead.org;
	Sun, 20 Apr 2025 07:04:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4048873b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 20 Apr 2025 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132679; x=1745737479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEr4zoqSDPSh3q/NPZGQ8bjJudfKjj9SBhXWOyMRmJg=;
        b=KCATg4uNJoPjVFf+Oq/RXG+8tMS2uNah0oCVjJQzRuV3/XOyc23w6zbDiNOzyN40+a
         qJYuWDT/DdHpb0w2r/Fw+uCPyfe1d10N5hcrd6hADYcIl02c7PTHeMTd3DuC8xqa6Gxm
         01b6NtHBPTzvgPQNqIVWefqf8cEy8z6TEEtLJLEcXrNTTD0osTZdUcrcFb/5hNE4ETt/
         jdyCBuXhmD/RK7sjURIVhf2Ceon0BmFX2dhp0vVy57rLzB6l6NP6rsnKIMvTNL/xI/Be
         PhlyiVLJz473VefFCA11hrfMjoVXVtUSqfVdutzqGSQjR0SIwvpk8LNwCeLW4EUmWt/N
         SBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132679; x=1745737479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEr4zoqSDPSh3q/NPZGQ8bjJudfKjj9SBhXWOyMRmJg=;
        b=xO35kXW+pP/QLnMUz/J4MNGbwPGppr+4R+b4Db9q6DdEpRL/CghR/5jhzbNxSLx/Ud
         iX42LzpE6p9qwJsJOXnhJkqX7ILw/KWWMztMbnlLbzp5SJkIo6vKFMEAT5Dmbf97byhE
         EZlEmUqwTebQq+PVC7sEJDqKku9AveCJ6U0br6VZ2ftSqEDxD61wKUDlvG9FI55EKcFm
         YKah/dNwUvBjaikmj/T1OkSvRJpSul1TQFQ19MdB1oCAHEqceMHvC6WUgbNH7a8Due/E
         JUmwiELxhcIHoBee4ob7nbp5q8h18A/lqg8OKbjaETsNKZb01WaWCTiLeQ4bmg3K2Gzh
         kR9g==
X-Forwarded-Encrypted: i=1; AJvYcCUtBxXKg2N68fEtbu+TRhqlfcHvPsVdOS80rHB/IOyDAHDjXFxzmi/o/FYI/wNUkO/G6ybdQbdlu7pVuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaotZBufF0SEeW+c5D3bOYUmH7f+oTf6zk9GiJVqXpRyIfuaII
	t0Df16GyVtOJzi/j+VcrH/qdcYojSrbigXv9hCQF384B+wjsAO8Y8eY15yTEBB0=
X-Gm-Gg: ASbGncupYwPR+jFRkEnQibqUuyw/xEJ+5WnyJ8WAKKOCJPRQQwlLzv6+lPfS2Dzw4Ff
	92CGgk6qV2+LSEoBNs0rCPqrQjaL/VHF0dlqcltWTqABDlSxtsiwrJV92wX08uDWe2mLb+xj5HV
	C5gFZUoDRszw/0rdMJmL52CZZ0uc6ec2iTctkzTRDzce414yZ+sNoMR+v6ha0GSjV5OVXuNxH5F
	HlcTbHO2+oRJF2mGsQCPzyR+3D8QRxfWLgnIEI9MUku/nZAT3dmPx9s2azB6U9Js8eozzAYt1NS
	Ib8WAxveBqxv7z6heAYwo/Yt0OQVAg==
X-Google-Smtp-Source: AGHT+IGtYXVmqBAFmbk7LXbpDxQMyWUw0KBDYgsDqkcEnZhWP8dgPJ0odqZrRswxh/DPQhqrHeH9wA==
X-Received: by 2002:a05:6a20:9f46:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-203cbc056f1mr13712467637.1.1745132679468;
        Sun, 20 Apr 2025 00:04:39 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:04:39 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 1/6] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
Date: Sun, 20 Apr 2025 15:02:46 +0800
Message-ID: <20250420070251.378950-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_000440_407008_953F6765 
X-CRM114-Status: GOOD (  12.11  )
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

The SpacemiT K1 SoC reuses the Marvell PXA910-compatible PWM controller
with one notable difference: the addition of a resets property. To make
the device tree pass schema validation (make dtbs_check W=3), this patch
updates the binding to accept spacemit,k1-pwm as a compatible string, when
used in conjunction with the fallback marvell,pxa910-pwm.

Support for the optional resets property is also added, as it is required
by the K1 integration but was not present in the original Marvell bindings.

Since the PWM reset line may be deasserted during the early bootloader
stage, making the resets property optional avoids potential
double-deassertion, which could otherwise cause flickering on displays
that use PWM for backlight control.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Accept spacemit,k1-pwm as a compatible string, when used in conjunction
    with the fallback marvell,pxa910-pwm

.../bindings/pwm/marvell,pxa-pwm.yaml           | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..0d97333c7fee 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -14,11 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - marvell,pxa250-pwm
-      - marvell,pxa270-pwm
-      - marvell,pxa168-pwm
-      - marvell,pxa910-pwm
+    oneOf:
+      - enum:
+          - marvell,pxa250-pwm
+          - marvell,pxa270-pwm
+          - marvell,pxa168-pwm
+          - marvell,pxa910-pwm
+      - items:
+          - const: spacemit,k1-pwm
+          - const: marvell,pxa910-pwm
 
   reg:
     # Length should be 0x10
@@ -31,6 +35,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
