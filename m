Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4792C48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 21:07:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E15861185
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 21:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E15861185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rSVJQ4MlBxhHZf79V5vYIeNH+ql6A97ruUUm8/3LxTk=; b=z53NW6RyzMi46z
	0TppMXYxeSztHTjr0wD5EX9SZxMjI2otkh+viUqIhGgUM0YJlOcMOeN/wSOKofIrnLQz6GgrTzlex
	xsE+LzlWwqWY9ye7urRe0rbwp9+p1QEkgIQBWieiQEEQ5VdvsNBYdGUDd8rBG2hJr/jcphHnzkH2+
	Pq4vZMblOZpVzVBvmU1S6g5xM6XK4ty4MHllh9S7f+n5rKS/5qwmLws7IX2Htx1j9G5j8BJSlv5c1
	fD0JvOs+6DHKC98gSgD9fO2rGWgNULJWysfhypT0v5WoS8/3VyFNGgZTPRwIFe/hdF3EOjKAa5EEG
	GWYspe9CTL/uWyZtGshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltckN-007ikx-Ay; Wed, 16 Jun 2021 21:06:51 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltckJ-007ikC-QY
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 21:06:49 +0000
Received: by mail-qt1-x82a.google.com with SMTP id r20so3044754qtp.3
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 14:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RzCkdN6tX+XXHrDMHqqK2lwdNxaG8bekFdU3KiKb3g8=;
 b=fEjHUWuUuxhXnKnLWoNLL8+HboKzbXkB6JoS9lUjPwp6gWmzwBeL56hn2Or+BJKYjP
 sCu7V8xb98zpioJiXd6PNWWrIzycWoMvpZaAdUxH8dlcRlqSKiDn8eUpC5vBgKFYmyzd
 bT6wa0WYUdU3JXNcY6o63T7YbD5QXc1iKrbH2HqTY4rKG80rT1SW/0NdBuMeOQyFgaRG
 /UkKfn9TSEdyGMf5AesLE5MazV719VvSqxMP5pKJ9/sbOe2s9wYnWLOD27JDam3nBNiV
 QLOPubykOvl4nZkgmjITZQk4TSFGQu61crI/N9mC3E3XhjAtTIeY3El/L2N8t/dm8l39
 d/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RzCkdN6tX+XXHrDMHqqK2lwdNxaG8bekFdU3KiKb3g8=;
 b=SDMo8L+JA7UwVuqHmILMzxU+rRZoVWXGcZboAut7no0ciFxA1DI4w05ppw9YHZ9wGY
 P8PE3Pa/1ddYPjDI4GwTuaKMMcbtCnPCLvWpumJuQuuGFGwAhQpE9KVkZSO/1eWCHsxE
 Ba7ihUW/xfAGVNA3ybgxsNjqPiD8foJ2ECedGi6tWDn2Mm3sIYymWnWuykWSrYMBAod/
 JVAdR0XEGOGhsBTKVP5nFC89+6XAzhNBBiZyr3rvTzEaTKpohowVYn1Pe6orjgfhyEUN
 NC48TZN39gKc+E0KUobsrIwc5szEANeQbmKgopdBEqc3iH+9OwsU8dyqap8CGTZ9Womh
 k/9w==
X-Gm-Message-State: AOAM532Xz283UaNWqfzfG/sXA6UyiAQffHcVzHltHLsaC8xSGG1Tvb+N
 C/uuesz9RRyVi9ro/8sBLoPBTg==
X-Google-Smtp-Source: ABdhPJzLx7sY5g0vFN6W0143lePOO4l12P8xpneWC77bY6jV6jIC13p4/yF3O1aIeaUkW0UI07LxXg==
X-Received: by 2002:ac8:7301:: with SMTP id x1mr1789285qto.56.1623877605948;
 Wed, 16 Jun 2021 14:06:45 -0700 (PDT)
Received: from localhost.localdomain ([172.58.43.164])
 by smtp.gmail.com with ESMTPSA id j7sm348075qkd.21.2021.06.16.14.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:06:45 -0700 (PDT)
From: Drew Fustini <drew@beagleboard.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] dt-bindings: riscv: add starfive jh7100 compatibles
Date: Wed, 16 Jun 2021 13:27:00 -0700
Message-Id: <20210616202654.578870-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_140647_967479_2C589F7C 
X-CRM114-Status: GOOD (  11.74  )
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

Add DT binding documentation for the StarFive JH7100 Soc [1] and the
BeagleV Starlight JH7100 board [2].

[1] https://github.com/starfive-tech/beaglev_doc
[2] https://github.com/beagleboard/beaglev-starlight

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
Note: my patch to add 'starfive' to vendor-prefixes.yaml was applied by
Rob back on June 2:
https://lore.kernel.org/linux-devicetree/20210602163200.GA3513985@robh.at.kernel.org/

I ran dt_binding_check and dtbs_check: 

  $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml 
  CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
  DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml

  $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
  CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml

The files jh7100.dtsi and jh7100-beaglev-starlight.dts are in the
process of being cleaned up for submission. The current downstream is:
https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive

 .../devicetree/bindings/riscv/starfive.yaml   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
new file mode 100644
index 000000000000..4deae9f5c60d
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/starfive.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive SoC-based boards
+
+maintainers:
+  - Michael Zhu <michael.zhu@starfivetech.com>
+  - Drew Fustini <drew@beagleboard.org>
+
+description:
+  SiFive SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: beagle,beaglev-starlight-jh7100
+          - const: starfive,jh7100
+
+      - items:
+          - const: starfive,jh7100
+
+additionalProperties: true
+
+...
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
