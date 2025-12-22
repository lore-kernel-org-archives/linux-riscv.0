Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711C2E674AD
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBbr8uNzX6ohvp/VOdTx+XST4nlnn/EkO1Et6UJ79ug=; b=ugxvDecfq3Nqp5
	4NtuUck2zIBGNlRPES6kKNYUOkSNxIvr3uDs1xw0Xjva9KLJtAh9eBWzz5EwIDQthtMyom2XJKfvG
	qAqVf005N72R/xDAwa0I0ZOTxphdYuq7vg26lQ+qqlE/1JypAh5L3cympkkTQ3zPPhQ5tF5HM89It
	jiLRoBO2hDmpO7hAy2Y5UpPtetB3c1yWaFeE0mfxHOEw3qynCYB9xGtK1bjq7KWWmmxVmCHiJGTbd
	HCVL2oKjCu4n1vUzzyvMdnQj781GaRgPgtmqlA3MuwsnOy4hjk0pWC/RDEP/wXh+DCD3DIAPan2FE
	rDV1oA9NC/mOwnvwmdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfds-0000000DmeI-2KOg;
	Mon, 22 Dec 2025 13:08:04 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfdp-0000000Dmcb-0QHB
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:08:03 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-8035e31d834so1294198b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408880; x=1767013680; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkOHhVohKsGIoIuLcaXjm92Us2r7m97EVQ3rEIH1/FI=;
        b=AmQCm11UZ48mTaRZeEtSIc+Exmhd/Zr2YlIEfN9QWWovjs3/jMnH0DQiexFafcsMgJ
         mdzD2w6J4KGBvAnqXwqyRsm/f+JC5GsqJAfNmpN8Te68/QJ8LDUN6I4iM1F1TSNoMQpe
         rXJmgWDkr/uCxDKQ/AsG9lYZRUIENZsfSEIU+/RTwMwyvQOfu9K4mJzgx9evuhFuUPL1
         rJENQneFArux0coKjE8TQT0lRi8Skqg9Jt0QT5Gc/Dh+UzVtZ333KSsjW9fn81ckJZoa
         JQ60zpFT8M2Vd+yBhBzEm4lzeefxuPqzyzKPw0SXYVWUQVuGcDinEKZS/VM9mD+xpvmf
         Kkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408880; x=1767013680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkOHhVohKsGIoIuLcaXjm92Us2r7m97EVQ3rEIH1/FI=;
        b=YC7b1QBOXqB7ma0AduUEhjuXjRN1fA5J6mZqz/znnrfFANA/H7mtkvIBB3LOVhfxEa
         IdKGyorgjWNyIxu6woBiBjeRKxcUmbWJdClhUzHC1AJd/7NGCokr96d/UseJChAUlNH/
         N8Iyjq8jz4mf7/JZ8JmmKX7Eg/L/kMIAgveBpmhgSJpgys/rtYN4hObhru65wPBNE4cI
         mXkuy6U1t/H5kE9qDpyAHnz0FXFM4zD7Cho/Qa7CphiwZ8itEgV38xlsI4GxDcuiXIIL
         x89vmG/OpPHOmkZx5Jn+zEWeyAa9IeTRIzAVNoIDV4J5VAV1/p7FUH4pUyJ7uPJxauCK
         f8UA==
X-Forwarded-Encrypted: i=1; AJvYcCWx6nB/lOnOG2nYPB57UfEgkAi5bAzsx89wRXcZdUI+dQEgs7K8aB74fbY/mWxaT+o0DfZtYAYtO+8XYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRoNK0V28NHSyxEPpqeLI0Cb2I6tvBVbjFDbrFLjwm6nW4CLx+
	4gHsX5Lhmtom83X9+JMqFiZCKZMULoReMhXv81oJ+tcxhSBnMxsF1Dztz5mIikBM/KI=
X-Gm-Gg: AY/fxX5LLgdrpXlWd67yCue+g6IriWfElUTAM+IM25TdpC2sRyu9mJfC/z183C1j4hp
	QkSggxiVQ+FFPK64vWth0ewtBZBpKFDcmGRJ5ipibH5WflDI9N7HI7TToQyYYf/EQYymWBh4wjP
	M78yaUbfLpqhZLZaJGDjT9E3cSDKSL1hycgbgQNZSXqp6mw31L7sLLGFztimXkpC/2a9Kaf1hTD
	CbFVvPLbzph/cWrabeOFNQjEitloR7Jb4BjZ4TV863D3N6tyrGJ9s0DeC/8cr7ro10I+9G/oJ89
	yu3kLz4YNewVZkElr06tvMEkLLgAKYttmLIgSF//wTsGpxK46wCkp38ZR99JWueQ1ozVP7zD26g
	EbZypfiTIa6o23+VtnlaxRzJS6rmE0oT2QBbZgEuYHARCyg1eRQcavzs97uaMO4/uaQZ/lZYEII
	7oT3KD7i+OPCL+DX0dJDamKJAxCa79bEk=
X-Google-Smtp-Source: AGHT+IEVVJo9wYrbvjovvz34oXELviGUYat3B+h9KiQImiYaXL0x/LFxPhkuEtVr9NEz35uNWiLhaQ==
X-Received: by 2002:a05:6a20:9189:b0:366:14ac:e1d9 with SMTP id adf61e73a8af0-376aaff470amr10935543637.63.1766408880374;
        Mon, 22 Dec 2025 05:08:00 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:00 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:19 +0800
Subject: [PATCH v2 09/13] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com>
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
X-CRM114-CacheID: sfid-20251222_050802_622545_933EB8AE 
X-CRM114-Status: UNSURE (   9.73  )
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
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a6b9d7e3edf86ecfb117ba72e295ef097bdc9831..ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -160,12 +160,26 @@ properties:
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
@@ -178,6 +192,24 @@ properties:
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
