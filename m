Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7223E674AD
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3Pai1AM4YHXXDbdjS+OE40v9oDNagbDayzHf+hGJnA=; b=FtBcbOJdQeKGE4
	6wRHFgeeKRY7aM9MgzeXGIlLHMfK4pYQgoxhyS9Kikg96NeuP8dAXfLW3n3PpAQNJY12ccA2G1G5G
	Elp0hdTiCwM3Ov456AbZFM0fKUb4+r8Q1pNGdsl7e6XkRT7TMmoZScna7IFsGnSDD8Do9yHXxks4k
	InbKlDGa1B89rj71KG2MP/HhJsQNKqCn/kRUirYt5O7/eEyfaoJSiT6TL6BReYna7vh+VeAcLf7Gd
	it53owBo/4mHdQtmiWI6o4yzy3XCHq4/O/bCGHM0vxyoebQwPWIS9sqA8FbvNHY8BZRRARq6FltZ8
	r5h6T/7VGKENb0mc7RIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfe2-0000000Dmjk-47mU;
	Mon, 22 Dec 2025 13:08:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfe0-0000000Dmi5-1qrv
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:08:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so3575071b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408891; x=1767013691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UGeHuXe1WkpRh7lAuv6WjtJBbiZ85uUpTEhyAT5GGU=;
        b=oNO9FhKTtQ6UH7f9WYhlRGbCE1dntvNCqqv2n3xF94mNvWjEbNzaZnKk0ShqZ1/tbC
         FuWeJQpr54m0iQyozziAZ0cxoURkU0vhnFIgzFFqWr164Rpua2PRRu3Fkdo7fgFC1BHH
         yQYsWr8Fyi5fktrvYhoxD25/Oyn+EUtY6mbx228J+h7SgKXi9DWKqNXimg2t9nKjdYUo
         7/n+gKcW9G0iagVFpNdIgrLRHsdOTJTwdU2N2nLqEoZjfDeMeK2P3AjMZ2Yp4uvkkJfI
         YXd0Z4JWfHArleCCPBrG8CkvBbRHhIz7J1338LOYXxgawgfw1OeE29g3RGImElWiYtoB
         x4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408891; x=1767013691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4UGeHuXe1WkpRh7lAuv6WjtJBbiZ85uUpTEhyAT5GGU=;
        b=sO2UHzYnHCv+lYOWuIsvSqJfGkC/BtmTsuNFeYuf07Q4//+PLTG0WOl5ffrT7CE8CF
         b/4sk9WbWJ09udNSmuAkTaXQeS+/eE8/3Gf5dtlI8mUw6UlyvLBlATm98jtDQzSSmQ+H
         rhQX57APdOlW1fMwcNEpwLilT85bvsRnmdbKHKpgDa1VFFi6mq5kNfrsXzaLp7RPgId0
         tFjNdvgwodPLmp7d9zvvXnUu8TQjlkPE2S1BaQBLg6JwPesMxPKoxna62L7FLfVVc+0e
         oJWg/p0rAWmmjo9pNWLbI32cOqty24XB/xg6LCu4Vu+SkfnC3gfYb+mLF+DBK2cWgXIS
         rz2g==
X-Forwarded-Encrypted: i=1; AJvYcCVNw1yMnHj+esDrK7V1zgM3meFp0tx4CUA4VST/wVHQX8l9VOBl/PoT2wZkf7C6jLZscPA0sAWX5WZVWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvUu9ab6aerpnjzOmMzrPow/4bHJMoYVFBtR9HwlL6RLoeX5Yj
	O+/bcj6IgQQfDUFfRtLars4xn0JX5LiMVfFgInaaaXbVSv2p4/E+8l8Y7Tg9jTgfGIA=
X-Gm-Gg: AY/fxX5/WJdJZ098DCzu6egxdVv3uM+sHH7yGlZpVYp9r+ursb3juKFxoP+YQqVjF+l
	lKEIEZk3rXHItxnrIXllb1r7DGBnqpdsXaPNtRYjnmyxtOc8S6C/MIHWU6kb719CdXSv000tChd
	hiZFso0z+Z1eG2F1k5D/Ze2DytQSDi/9mOj+fUGQpYow5M5cvXqU5Gf8OoZlfhImxZ4zAIX06Oz
	A2Bp5jaJIFZIr0CpP53m4Sl8wp4HWqnEZGfV2YswDFLPxFIFV7mjd9kXGcFrs9N04ANDOHjV75J
	TlHmrGPOXn53bzNTsITvARvDKM6sEQHOkBogcg23BKKf61Mp61jJ0Ev6pukfPo6tKLEki1zlCgh
	3eq87eCb9+8HpqCyJYTP6CAE8tfBuyOEASC7XX/zMqDnBQs9/M3ER+S80U3bwV6XPbsgUuaF/hE
	JKEgtVPDKH2Lrm4ps4WI5klugsEyqJh5U=
X-Google-Smtp-Source: AGHT+IHHPuN3hCtZKFz2kz+Wvy3Izr0+e/klWfBzpYbVvra66xOr1F8o2wRbCo2GQASyMyGdljfeaw==
X-Received: by 2002:a05:6a20:3ca2:b0:363:e4d7:2c34 with SMTP id adf61e73a8af0-376aa8f384dmr10273525637.57.1766408891406;
        Mon, 22 Dec 2025 05:08:11 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:11 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:20 +0800
Subject: [PATCH v2 10/13] dt-bindings: riscv: Add Sha and its comprised
 extensions
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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
X-CRM114-CacheID: sfid-20251222_050812_540448_C3411070 
X-CRM114-Status: GOOD (  11.97  )
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

Add descriptions for the Sha extension and the seven extensions it
comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen.

Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
"rva23/rvb23 ratified") as a new profile-defined extension that captures
the full set of features that are mandated to be supported along with
the H extension.

Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
b1d806605f87 "Updated to ratified state").

The requirement status for Sha and its comprised extension in RISC-V
Profiles are:
 - Sha: Mandatory in RVA23S64
 - H: Optional in RVA22S64; Mandatory in RVA23S64
 - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
 - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
 - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64

Add schema checks to enforce that Sha implies the presence of all its
comprised extensions.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c..1066b7e65dab89704dbac449db4aa5605c95b9d3 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,57 @@ properties:
             version of the privileged ISA specification.
 
         # multi-letter extensions, sorted alphanumerically
+        - const: sha
+          description: |
+            The standard Sha extension for augmented hypervisor extension as
+            ratified in RVA23 Profiles Version 1.0, with commit 0273f3c921b6
+            ("rva23/rvb23 ratified").
+
+            Sha captures the full set of features that are mandated to be
+            supported along with the H extension. Sha comprises the following
+            extensions: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
+            Shvstvecd, and Ssstateen.
+
+        - const: shcounterenw
+          description: |
+            The standard Shcounterenw extension for support writable enables
+            in hcounteren for any supported counter, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: shgatpa
+          description: |
+            The standard Shgatpa extension indicates that for each supported
+            virtual memory scheme SvNN supported in satp, the corresponding
+            hgatp SvNNx4 mode must be supported. The hgatp mode Bare must
+            also be supported. It is ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shtvala
+          description: |
+            The standard Shtvala extension for htval be written with the
+            faulting guest physical address in all circumstances permitted by
+            the ISA. It is ratified in RISC-V Profiles Version 1.0, with
+            commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvsatpa
+          description: |
+            The standard Shvsatpa extension for vsatp supporting all translation
+            modes supported in satp, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvala
+          description: |
+            The standard Shvstvala extension for vstval provides all needed
+            values as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvecd
+          description: |
+            The standard Shvstvecd extension for vstvec supporting Direct mode,
+            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
         - const: smaia
           description: |
             The standard Smaia supervisor-level extension for the advanced
@@ -186,6 +237,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssstateen
+          description: |
+            The standard Ssstateen extension for supervisor-mode view of the
+            state-enable extension, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as
@@ -813,6 +870,28 @@ properties:
                 const: zbb
             - contains:
                 const: zbs
+      # sha comprises the following extensions
+      - if:
+          contains:
+            const: sha
+        then:
+          allOf:
+            - contains:
+                const: h
+            - contains:
+                const: shcounterenw
+            - contains:
+                const: shgatpa
+            - contains:
+                const: shtvala
+            - contains:
+                const: shvsatpa
+            - contains:
+                const: shvstvala
+            - contains:
+                const: shvstvecd
+            - contains:
+                const: ssstateen
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
