Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CAED277D0
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qfzvat1hXNvW8dB8AHZhCMxctlqJ8DTL0/18jdNWqHE=; b=l79YxGbFughJlL
	7Y6bTflDbLfct3c9SQHzYV8CYMPCg4ZF9bV4kgb3ixmM30N0CIjhMYwZBShr/JA3LRPx6A1Vyk7nU
	UOL6+jS+ed97AoDYvVTzRjfuN5asJAGOEhDaXtEsjTo13iDzPxhVyfpckIm7bVfrl1sxygdusLDkX
	ojMNCD0LwV8XXv6PiNrcwVLYEts1BZvXE/2jG2WLe7f1YudRoPGI4gpO7kY3MrDX7jbXZbVbC6K8Z
	+kFUKs6ajysMeviiPWMqnaT4nhwTmetdMJXYG2mS7M1EXgpP8HKHmmaakUeQ+TZeEkQFR3EdLF4Ef
	l0dOn4qvs2e34z1ZsfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROh-00000003GCR-2qbZ;
	Sat, 10 Jan 2026 05:20:23 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROc-00000003GAX-3wl7
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:20:21 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a081c163b0so34013025ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022418; x=1768627218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zN0jIJOhzutug7gLJze8M0eK2qEZ0NMWNu3NtKdrP8=;
        b=K/lmRd3Qn4Ydrw2Fb3xyzvN2QVYxsvzyyGzoGrcYYT1rCKGR4yLcZ8sJsbpnXyuI19
         0+cM4sqxQtDiJB/E+Ed9QBFqgVNDSAExWzV3ZyMHM2+nJkY2HumIbtDBbAhYRn+/C5Lm
         /LoYTuUms1I4musqXocte++SYHMEWOXixQ8zFHQnTfza4/CXU6UxfnojIhma/DquSRVT
         mY9C3QcHgV2WAUiW6efcB9JtUyH+BOfsg7LCCZsb5oWp3OU/6PmF6OZgfrQus6iz9ALY
         KIlDPScfFLy2gDbN7x8nZLOCxtvk0ubNwwTEdnCE4UjP4XWhT36CVB3plH2Wxg5jI2kT
         1Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022418; x=1768627218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zN0jIJOhzutug7gLJze8M0eK2qEZ0NMWNu3NtKdrP8=;
        b=mrt/HCOVF4I/aIg22u5pmiuM8g2xOQRtxC+NDwCzDlFi+bR2yFs96UvPLqx0tXteal
         bqO4U8qaNyIC8122Ye5c/LZFvwlOchBW7OvgvTjRsxRrgjd80QdCcu0Wlv8Ty5Cv15E3
         8ez7lxmhHvU/ibhg1F5bZ0nwsayWXw0TrRfIshpLyZ1jl7NqHV12chEuelU4oM4/4zAA
         11Z01gJERZY7ppZNxfmd3yVSzQaaBeuPAUkUPWirXu+/Q3ut11f2xICoVOnEG4dXLj1G
         AjNcIx0IaK4jHXObU239rDVh0BGfGoRtxh8/5DKAinVZxqQC+lW0h4L+h9+2Rlp7wn1C
         MlRg==
X-Forwarded-Encrypted: i=1; AJvYcCUbnrQr67AgQNBti4sNGhQNeP402+gyACGJjanVUkJBjmcqQV22+K0OR47mZSgTxBeVfxGnbfLEn6Z4Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhJ9SXmsERocJFKQ7jN4UAGtOqKgY/YkcX1qWKE7piZfE7+4Xz
	dZTAukn2cx9NdcGizEcK6hGqnlmXIVbeDBPC1NQP9vwZ8+xax4S754U+nE7+iicDt6o=
X-Gm-Gg: AY/fxX5nmYGtpgxEVERLbqbp34Z+NXW7KndjDY8qGeBLpQFceMG9IMVZjy4UjolWfFN
	NhNWk/UUMczGUbhE6WFKACguZZtEi0p6AHEGK+nnUr6tQt0a+aSRqieIHLetjLJoIht2hRIkgJT
	AFkq254H2yri48i9blJ1uVmiYaYiXES62F1JFJzzopCH2aZCX7OQnIN1ACkW1P9XSuy5VMY93Mk
	PF4mH7qjnCgiLNllqYT6AtFO9R4IdvFZJoz5DhGoTkE65k8WIxuJwPI8KEFVKZAgD5MFk0Clj+n
	no/n2040oTOxBpRPx5yqbQg+VWwf1TOjtgxta9WJhqAMDU//PKpJU+lFoDohnH7FA8u7rAHYuVy
	mUg+QdnmLCzct5WtP/HL1Y5Vv6O7HlG6aTxCFUXyEVLouYebOOm2jrO0arEHSBQaQwYbWOnOV6x
	NrOYQ1y4jrxKB/D5Dzoi2Uc7M7hhI2YTtC5X2wzJpupqcZeEAyym88vw==
X-Google-Smtp-Source: AGHT+IG/YASZ5bP0G4QlJrDOO/Py+JE5tERCJ+CHN75BwBTQicN0ixi/wKAyrG96pxluUrT44Q9eFg==
X-Received: by 2002:a17:903:124d:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a3ee4902d6mr98631605ad.44.1768022418148;
        Fri, 09 Jan 2026 21:20:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:17 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:20 +0800
Subject: [PATCH v4 08/11] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-8-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_212020_574323_44E513D1 
X-CRM114-Status: GOOD (  10.11  )
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

Add descriptions for five new extensions: Ssccptr, Sscounterenw, Sstvala,
Sstvecd, and Ssu64xl. These extensions are ratified in RISC-V Profiles
Version 1.0 (commit b1d806605f87 "Updated to ratified state.").

They are introduced as new extension names for existing features and
regulate implementation details for RISC-V Profile compliance. According
to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, their
requirement status are:

 - Ssccptr: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Sscounterenw: Mandatory in RVA22S64, RVA23S64
 - Sstvala: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Sstvecd: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Ssu64xl: Optional in RVA20S64, RVA22S64; Mandatory in RVA23S64

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No change.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 345624326e9f..900270e8d22e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -161,12 +161,26 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccptr
+          description: |
+            The standard Ssccptr extension for main memory (cacheability and
+            coherence) hardware page-table reads, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
         - const: sscofpmf
           description: |
             The standard Sscofpmf supervisor-level extension for count overflow
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: sscounterenw
+          description: |
+            The standard Sscounterenw extension for support writable enables
+            in scounteren for any supported counter, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as
@@ -179,6 +193,24 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: sstvala
+          description: |
+            The standard Sstvala extension for stval provides all needed values
+            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
+        - const: sstvecd
+          description: |
+            The standard Sstvecd extension for stvec supports Direct mode as
+            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
+        - const: ssu64xl
+          description: |
+            The standard Ssu64xl extension for UXLEN=64 must be supported, as
+            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
         - const: svade
           description: |
             The standard Svade supervisor-level extension for SW-managed PTE A/D

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
