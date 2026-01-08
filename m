Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69009D185EC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oe1dZWcpqHXZGZGYkYc4+lL1hHAkTDBc5RWpplpO0TM=; b=VFwQq5tk1saIqK
	MTWPfQRhqs9cSbufwbZANVvQBK3RowSPFEG4X9/PSgD/Ivpth9gdyRo9JsQs+cwPDtuhww/ocTIRl
	JDJA1ftJK1/T63y49GGj2SVdeFM26KQWaA9MkbQAHT4yF7QYRbv4jn0N5LynOfifGOmn/SOKfBpUI
	NkycQ8JuuhGhaPV6EQ0PglA6KJuD+yhOpQ/vVo4qRFMmxZupIPamOiIj440/SOHl5lylQf76KR23q
	ZIquZF4zIcgIujcef8u05A0yWGlmuf7jgEkoGYQVJGrp+PV+AlKYh4+7K1tmSub94UHdu6QReqrsL
	y7jtivHfwm0A7MPb6+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6x-0000000H01C-00oe;
	Thu, 08 Jan 2026 12:27:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6t-0000000GzzI-15z7
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:27:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2123631b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875246; x=1768480046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwaC+shKtPHF9hxjazt9bdYtYDRjr/r6esw6vyxkzGA=;
        b=qsiJKco4AhHfu9sjnqYrkLZ0lv+SPOxxJmK+KB2czqLuV6XVgPFFEjtWIass4cTD+E
         xhdqc5PrYLgfJghEouhMjCtO4gwt1TRErZbZV1AnzOOiZCGPuQHuyl79/RCD64kcQCMN
         h48JS9K7pBnsrKpOvFGoe97h6DbkE6hHkGgbX+ehENsaCjukTfszHcCKV1Ql3RGyIARQ
         Fis8PrrA5YZIaFgBOU2pfV46tC1pqwcja8m+8D0o+b4DBJI4Ve77oVeJ8T76dtj6qVCk
         JJAwyJ8OPfD3h6iFdVgbmcfBxH5cmgIixxN7YNK3ZyvkbRzV1eK9Z+DaEbLomdFbLHxW
         Bo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875246; x=1768480046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mwaC+shKtPHF9hxjazt9bdYtYDRjr/r6esw6vyxkzGA=;
        b=mOEQye8vJNSEE4UbrP1Eny/ZC5cYZKcJ0e/hAFxji41v/6TI745QYe0wBzbI2tb33Y
         0/0tn/sNOrO7f3OESdztMjh5U3areFglQq+In05idLy9LANQ4a6SYvjZOP/1TLoDckoG
         I0vvdscRGF9mnwZTR1/q/RZiyO2AHPWTRCfaVs2hArAygiIn9YW7mGI3eh/v8RobBUxH
         rbNYpgH41dkDFD7h3yJzoojYVC8o4P7dgtq6dJ6r419SV30bdV7Nf5s1lAyt3GApFV0g
         ciweJaa0Cq/8l4QsJXIwCWrlrhXWX5SXpbzV2t1vIqnXkrxxa0uHqkukSVtAZKeyE75r
         4N4w==
X-Forwarded-Encrypted: i=1; AJvYcCUHk8yRdoR82eyR2Pz+V34c/3NhkpRkdlPZXAaaH6pI16jG7CnIkGibkAZGUhYnX4oREXVDn9lZTCdZcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM9bSPjfsnZnD5ygI2QoJU15rvCeQDm+Ii6xkOMb4WIDj1n7Pu
	//gmD+dB0frFB2l/Lc4QpAyPt58w8+C1k4s94yJBkJJVokEbvbU/I2qtmL6ZfVjuDbQ=
X-Gm-Gg: AY/fxX5kHstuJurCmvG7CtRfWBhptMRRMGtzUOepDIOmnHn7l5SJ7eDbtBodW8rF96r
	6e3XYKNglIG+9JX901FM2lyhCmeVMEnYJ4NN8FT0Ah+I3oJWTpG0SOQUi+MBrmiN30QIaPrDQmn
	1pt+lHf6Iwk9j8UcbBskGtnAZ6Ka91muEoj4ouR8/4Bm48ir7VlPNHOvr9p2q1cfdRXz/BCGV4+
	u0Mn3oMDIdksuzbD5gU9TL3crZLPQIRumzoqUrAxijgzqH5fCbxyW2iXlhz+QRB2NxArHyGu912
	0crEAdChu1azXyvmOFvSHegbxVK/vDm/cDy7nBBOiS5/OWWSy3gOwYISeJcgVVO3G/33xW+q4CE
	tvkkO/VAs9wVWIrEPTZ2K8tTCbyrSo9XSA2M0U6VoisISLT3l3dpHSKLhJXrkEdSrPdX7hjwWrC
	GWE8ToqekuAox5a5QT47fj1BybDs4+uljl9QquNNd6wQ==
X-Google-Smtp-Source: AGHT+IGhCCDZv7bjh6IErkPehfJ2jVcvReECzkxUQUoLDLwfeIJZYdhcoUvkJgdrBLVOE06Ipe/4/g==
X-Received: by 2002:a05:6a00:1bc8:b0:7aa:ac12:2c2e with SMTP id d2e1a72fcca58-81b7d8563a8mr5548416b3a.25.1767875246380;
        Thu, 08 Jan 2026 04:27:26 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:58 +0800
Subject: [PATCH v3 07/11] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-7-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042727_311940_7B0A5E50 
X-CRM114-Status: GOOD (  12.23  )
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

Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
(commit b1d806605f87 "Updated to ratified state.").

They are introduced as new extension names for existing features and
regulate implementation details for RISC-V Profile compliance. According
to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they are
mandatory for the following profiles:

 - za64rs: Mandatory in RVA22U64, RVA23U64
 - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64

Ziccrse specifies the main memory must support "RsrvEventual", which is
one (totally there are four) of the support level for Load-Reserved/
Store-Conditional (LR/SC) atomic instructions. Thus it depends on Zalrsc.

Ziccamoa specifies the main memory must support AMOArithmetic, among the
four levels of PMA support defined for AMOs in the A extension. Thus it
depends on Zaamo.

Za64rs defines reservation sets are contiguous, naturally aligned, and a
maximum of 64 bytes. Za64rs is consumed by two extensions: Zalrsc and
Zawrs. Zawrs itself depends on Zalrsc too.

Based on the relationship that  "A" = Zaamo + Zalrsc, add the following
dependencies checks:
 Za64rs -> Zalrsc or A
 Ziccrse -> Zalrsc or A
 Ziccamoa -> Zaamo or A

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Update the commit message to explain the relationship of Za64rs,
     Ziccrse, Ziccamoa, Zalrsc and A.
    Add dependency checks.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index e026b366c8f5dbe7d6988d3ed374183c165de35a..ee2cdd3856b91a5bbf486e8a2da0986269e82a2b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -237,6 +237,12 @@ properties:
             as ratified at commit 4a69197e5617 ("Update to ratified state") of
             riscv-svvptc.
 
+        - const: za64rs
+          description:
+            The standard Za64rs extension for reservation set size of at most
+            64 bytes, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zaamo
           description: |
             The standard Zaamo extension for atomic memory operations as
@@ -378,6 +384,27 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccamoa
+          description:
+            The standard Ziccamoa extension for main memory (cacheability and
+            coherence) must support all atomics in A, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: ziccif
+          description:
+            The standard Ziccif extension for main memory (cacheability and
+            coherence) instruction fetch atomicity, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for main memory (cacheability and
+            coherence) must support misaligned loads and stores, as ratified
+            in RISC-V Profiles Version 1.0, with commit b1d806605f87 ("Updated
+            to ratified state.")
+
         - const: ziccrse
           description:
             The standard Ziccrse extension which provides forward progress
@@ -780,6 +807,18 @@ properties:
         then:
           contains:
             const: b
+      # Za64rs and Ziccrse depend on Zalrsc or A
+      - if:
+          contains:
+            anyOf:
+              - const: za64rs
+              - const: ziccrse
+        then:
+          oneOf:
+            - contains:
+                const: zalrsc
+            - contains:
+                const: a
       # Zcb depends on Zca
       - if:
           contains:
@@ -821,6 +860,16 @@ properties:
         then:
           contains:
             const: f
+      # Ziccamoa depends on Zaamo or A
+      - if:
+          contains:
+            const: ziccamoa
+        then:
+          oneOf:
+            - contains:
+                const: zaamo
+            - contains:
+                const: a
       # Zvfbfmin depends on V or Zve32f
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
