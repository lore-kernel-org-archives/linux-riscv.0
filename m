Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AE7C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRhTt+FamGtgfzjLwGDON7pfk+fMFhCMUb2NGvuYFVA=; b=ZJimeL+PqnN52i
	yJIvYF5WodoOLz9r3Ber9oeqWu9ipJqFZLbAwf/l+MituvMCnYTVrUBlyH0K43nfE5mPRWYI9Lgi4
	bzfON64dnCwycSO0zTP+Pj85JQbSBNgvPopg0yrd+E5aJtlCb6/EzCBpxO+DXfCYlVJBbD/AQGafp
	ZkNxESybfqaJINEhgDbN+2UVDKk/qqCyPD9CSxiiixFf+lsK3VCUJYV74Naolmdh8JCPSjJ8juayU
	eidP/sJIQgqpEqSqbs77HSDeqMSrZyP1zTXRk7ISW9egZenereekhCt+jTRGhNbcC3IyykKKGR7/a
	wFhxPXZj6ErYWREsqfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gkb-000000091Md-0VCC;
	Tue, 29 Apr 2025 08:55:37 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ggV-000000090JJ-0RFD
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 08:51:24 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so3998813a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 01:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916682; x=1746521482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHJACfgxHpPYnkt6IQy+Z0WabgJ033p5WN25OiCcmgQ=;
        b=tFAsUomlmt3jEBksxTp1IXqjKtlveGh4eE+Ijho1F2hTy/dp3h73gXZvmz8btiDIa2
         8BkOqkR/V0mUMZCkGqV5/3qRj/YjJJVj+ypMUykK5DFfCMXB1CUfyZRBReCNWgAPGjXz
         kNOL9ZjTwiB01CmWaPF1mf58iQvFFmEX1U+4ioRTPBd053eGh3pb+8y05OQ+sKiUPAlw
         cqLzyfPA9/1LS6VsiJg25vtza/+nTDdMQyhz7frNj8yNkYh7Jho+5ZeBx+ag1y/CPp1z
         hnk56DWrfo78/uKKegdtsqGTr70KeGa+4yDNnsSqCrIu8pQ+V6xCUqsy4+CKmbAXTDs1
         GIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916682; x=1746521482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHJACfgxHpPYnkt6IQy+Z0WabgJ033p5WN25OiCcmgQ=;
        b=OIlybqZKacwN7xONW2d+nwP9rA1wXQ42mRgRRgY12h/8BjHMUi9V0+CTOkfIFbLcDX
         tw2mZ8/uGeGispdo0+bLuLsJmaTuQCsefraAAyQTtzruK54msb5QflaCDj3nWqw4FcML
         i1LzNqs0C7n4gTu3ekdRaVqLVcsgpU2W5w5JBz0oF8UsxT/3KTjrL23uFncKGI/7kQ56
         DXvLzJSCLTnegbEq9Y32BwWohVW8xYmh43Eg3vt/uq8m/+YQucgmbvMY8I2XnTCHI1H4
         jONtPRYZZB/rHzfvFFY7hGI0d/5XoNc8/UtoG0dyBVTvUNqipvnyvZG4EcmZ2YwKmiFx
         x79A==
X-Forwarded-Encrypted: i=1; AJvYcCUCxoKoV8nA4UF0hrq7Qr9Cq2pG2Abtl0oRkdLgMwFXevrJoNXsVlKdAjhA4ZK5MG6O/FCwkCSdt1s0yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwglLdhpKEkQsYto+yp1anklRIfjJSVcHFV4mSgfSL6aVUP7zwt
	/wG61PzkgYrljNP/lv1VgibNxLeFl6CXupz5h4umZGkCLkuHlD2uNNvViB++Zbw=
X-Gm-Gg: ASbGncs00NVXg4BW+RoMk7hUgWoSmKWreDJAhScymH1jIJ0fTIRs5C1vpRmezOAPs46
	kddmVKc5CkkwWuib60fo6YT0/wlbBUgqc8cmThTkC0ZzY/cwafDQ1urW80m0gO8Yp+5aAmgyF9v
	LJniA68BXMW/19txAyyFGwxMRuCye6qugrziJ8LDmmJNnVXipJb7Umza8zHzPUOatPTRsZxVmsz
	JLLDzr2/3cRZUpzj7J6lZiLiGo8pVrnTcRWqxCJK2tDX/3eEySPemvBCn1YeS9ZPrC35M1ZJ4Qh
	VChKwLYj+MuK7PaTJtXU2OMLG3FCVy62OQ5BlFHqQok9PgHC/65DQMILaOfzBt90h5kcr9XCVF7
	NlTs0xBWH00TCeCY=
X-Google-Smtp-Source: AGHT+IFZEuQ6sdfjCY7tfFhs7M5WchmJ8YCpC4/JeiDTSPbAo3pUkubrMOUkP8IaSDenvQAkORYC5A==
X-Received: by 2002:a05:6a20:12cc:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-20955d042b0mr2744549637.3.1745916682223;
        Tue, 29 Apr 2025 01:51:22 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:21 -0700 (PDT)
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
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 1/6] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
Date: Tue, 29 Apr 2025 16:50:43 +0800
Message-ID: <20250429085048.1310409-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015123_152607_8CCB2E59 
X-CRM114-Status: GOOD (  14.48  )
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

Additionally, this patch adjusts the required value of the #pwm-cells
property for the new compatible string:
- For "spacemit,k1-pwm", #pwm-cells must be set to 3.
- For existing Marvell compatibles, #pwm-cells remains 1.

Background of #pwm-cells change is by an ongoing community discussion
about increasing the #pwm-cells value from 1 to 3 for all Marvell PXA PWM
devices. These devices are currently the only ones whose bindings do not
pass the line index as the first argument. See [1] for further details.

[1] https://lore.kernel.org/all/cover.1738842938.git.u.kleine-koenig@baylibre.com/

Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: When compatible string contains "spacemit,k1-pwm", #pwm-cells must be 3
    Added Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2
v2: Accept spacemit,k1-pwm as a compatible string, when used in conjunction
    with the fallback marvell,pxa910-pwm

 .../bindings/pwm/marvell,pxa-pwm.yaml         | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..8df327e52810 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -11,26 +11,47 @@ maintainers:
 
 allOf:
   - $ref: pwm.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pwm
+    then:
+      properties:
+        "#pwm-cells":
+          const: 3
+    else:
+      properties:
+        "#pwm-cells":
+          const: 1
+          description: |
+            Used for specifying the period length in nanoseconds.
 
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
     maxItems: 1
 
   "#pwm-cells":
-    # Used for specifying the period length in nanoseconds
-    const: 1
+    description: Number of cells in a pwm specifier.
 
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
