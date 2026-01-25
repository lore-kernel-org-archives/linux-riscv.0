Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE129E63C82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 05:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxOHPUCIMYKYBW22CoPZ61JNxZ/WUSci+KiEvIlyomw=; b=OLuo3ASmU8BqtR
	PHwc6rBiIed8aTRzaW9DjnqhLkivCA0BkmE2ESX3vodGtH+E7w/wKX3M2cVPPAauJ4qsC/UXCtu7v
	amP/4YF/UZe9HM/Ul6hzxhh5Df81nS26PL/7JWzFKzpQau0+MzMFqXnbkf+lAHIaD0X7iidcCiGAy
	bv2XSoXHuGOyBUn6AXk7aCPn646wfZedYCqb28oYyC8a30BqY/wXs02yvPY2cknOqKU7C0A4D7D2D
	Lz2FVKDnunCrFvd1HrRy3MRRkSu2HWUdhma3pD9rNqQLMt4UaViqoXil0rl2XonIRNgWtUDNVu8Q+
	Sc8KhguKedCzMng22/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjsz5-0000000AsqE-2Hso;
	Sun, 25 Jan 2026 05:48:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjsz2-0000000AspR-3ehz
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 05:48:25 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-81f39438187so1811409b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 21:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769320104; x=1769924904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+hFQkKCXgC1aoBhH/+QMxC/tTL+ChXS3LVeT09Vue4=;
        b=uIhBtbMwSQHaVxhzJ2fUlEwpC9V/WYedxKV0kBxh6MiIb1eQQrpnaWx6FUFofzPGAQ
         naxl6RwK9Kz/tOhAwcOtBwnYLXDwCGK7SKoYVi4/nn0tFPXp+buYIoGGXNWWLjGJ7rFH
         rBeVjrCI03LYed8mV+kZkuSqU2LWdAldSJwJ/tU8dgREN6Xf+CBWzkANun08kdt2GMm2
         BJrdvh7euVxi51lJpLLydszRmIa+vTN82KQPd76aDuQaD05pffqYHjeatqwM0ZTrG8KA
         RNbnC31y7LLT9fEYis/uF8mEBA7lKKjgqO5A6nc0egF1JYnrZGoIeGKKx6BvH6NlTwui
         rlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769320104; x=1769924904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+hFQkKCXgC1aoBhH/+QMxC/tTL+ChXS3LVeT09Vue4=;
        b=fLE7/hIdVosQv2DX2O1zPA3ZTSgTUANKf/YEtNZXVVPY250iQxqmQSFXaZ+wv2bbn7
         AUXraonVJdHRpDP2HOKWvbiB6HA7XzD0JSqGeXLO++oTCH228Rl4GY2i+WpOwFNn1l9S
         22Uxmyzf44nvhNdeY6Zd2Jn1pBgEbkXbKzjK2bb0ieK7ZJObdADuvf91MqKe+bOJh4Oq
         iCDbo3gEBzbEoweRRWXw9cYaosm5LxwkJPeI+lr6RmWF8BIYLvZhnb/3cL1601suuDLZ
         TZjmWZX/y3gbtTEiaHyNwbCk8ESVORmxHG/Tg65XPkpkUe83tICvn1Ti8RiItXulUDST
         JXMg==
X-Forwarded-Encrypted: i=1; AJvYcCUQHlYCwJ6YowadbXJFBea2sGKJBxNzxGYe4CODBEzTLj4D8cWuPOgBlUgyiqTcCZjmuGf0k82UIXGu6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwERKpw9O0gMWW0strJlR0ZKsXydkZuNj/LQ1/+Aab+wIum3/GI
	uYgO/G4pFOZvCWUSjShmnTWh3wGPYiA9QxZCT725LP/rDn3TwJdicG99o4oMPVOBoB0=
X-Gm-Gg: AZuq6aIrSh5vgU+CQU92CS3t84W/OMixw7q4msIHllib/4eAcTJajD6CYYJJPjM464c
	+VBLkK+gMOUe8TIsXiC0vTWL4+nxHnyB6JXYHpeFOkzAGwMUsApLqUoVJuUGAl+BXL8Cpmce2/8
	1Ze4adbd5Le/GPPhGJrQKJJLXp5Gash5GwXsd6DilQJr/geFyyeqWiCrrvpGe511extQitUGIiD
	23Qse/iOzecbvLFEEQbI0IEqEJTikMZRwS9m1ZzgqzD/SF6XMUnHA/5csESONCYenc7Zj/Vsv0p
	em46GMvcFEfSfximh92B1WReMeGNiKcAYSODEZm7VmlLstDK/t97aoFQh1ZYt50RMcYGrNrq89/
	r+XiVBIKDovtWoG4uLYqvJ+bHfRK1t4etKNORvM2tjRBrFzwitjCBZBxDUs0oLI3JgX08B0xq6x
	YrUSF6iewsLl1CJj8EGIAM0fiX6zHs/2s=
X-Received: by 2002:a05:6a21:790:b0:2bf:183c:ac86 with SMTP id adf61e73a8af0-38e9f114abemr636293637.25.1769320103914;
        Sat, 24 Jan 2026 21:48:23 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f1ebesm5680016a12.19.2026.01.24.21.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 21:48:23 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 25 Jan 2026 09:36:06 +0800
Subject: [PATCH v2 1/3] dt-bindings: riscv: Add Supm extension description
MIME-Version: 1.0
Message-Id: <20260125-supm-ext-id-v2-1-1e3b9714c860@riscstar.com>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
In-Reply-To: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_214824_921579_CCB2AB9D 
X-CRM114-Status: GOOD (  10.77  )
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

Add description for the Supm extension. Supm indicates support for pointer
masking in user mode. Supm is mandatory for RVA23S64.

Add dependency check that Supm requires either Smnpm or Ssnpm.

The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
state") of riscv-j-extension.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add dependency check for Sump.
    Put the check blok after single-letters and before Z*.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index c6ec9290fe07..2b0a8a93bb21 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -262,6 +262,23 @@ properties:
             ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
             ("Updated to ratified state.")
 
+        - const: supm
+          description: |
+            The standard Supm extension for pointer masking support in user
+            mode (U-mode) as ratified at commit d70011dde6c2 ("Update to
+            ratified state") of riscv-j-extension.
+
+            Supm represents a combination of underlying hardware capability
+            (Smnpm or Ssnpm), U-mode consumer privilege level, and M/S-mode
+            software configuration that enables pointer masking for U-mode.
+
+            DO NOT include this property in device trees targeting privileged
+            system software (S-mode or M-mode).
+
+            This property is only appropriate in device trees provided to
+            U-mode software where the next-higher-privilege-mode supports
+            Smnpm or Ssnpm and enables it for U-mode.
+
         - const: svade
           description: |
             The standard Svade supervisor-level extension for SW-managed PTE A/D
@@ -907,6 +924,16 @@ properties:
         then:
           contains:
             const: b
+      # Supm depends on Smnpm or Ssnpm
+      - if:
+          contains:
+            const: supm
+        then:
+          oneOf:
+            - contains:
+                const: smnpm
+            - contains:
+                const: ssnpm
       # Za64rs and Ziccrse depend on Zalrsc or A
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
