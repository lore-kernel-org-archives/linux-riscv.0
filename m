Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35B3D637D7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JyoL5/6XvZwAhuNRmgXnuRSiMj0Mh7Li/zRK4/xtq0=; b=nnuNGX6O6bEWec
	J9Jr54NQmDLK87iMSZCCUv8VLGfC61WWhrudO2z5q4kimo+r5Ngoqyg4VO5A6PceEsQzymmirmCut
	3vxoX4G+/7rUsySDxEtc1657dQxJiY++4R0XlkoZo6sZY8lQGJLF6HHGSyx/LbFM86VAUVCFNpIo+
	5gYSobT8dzg1rtv2qGWlVyxdhd8jtA4gRoYWC+DJbeQTELTOat/glBMxzV8cBWJkW5wGao+Gg7dtH
	d8wY1IE1lJMNCIkd35/aK9mnpIawjjtMo4/UJt5u1CF46cm9XdOOLcG8QEFu8dUabweDFlhD4tt0h
	4WnqncgfyoCXzPBQpfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUD-00000008WRw-2tHB;
	Thu, 14 Nov 2024 02:21:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUA-00000008WQY-0HNb
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:21:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c805a0753so790845ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550889; x=1732155689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPmq++gF8XYGDxo6W13nX8EQcKxVsBpCdjyPJHQ9PEA=;
        b=MYEHXJ1vKm5HnepJDvH3ZszG7M9Jujxu/cFc9zo3NJvf1bda1lDHsXbnWD8heLudei
         YN2teWDutj6VLnlCUsTWIDSInz/QcCZAi9NPVrF1o3ZmMUjIqNI3xFecKxG7kzl45pk3
         iYymKOU4h1O3zQeQJZF+lORlmNx/9n2UqhFcNE/3GD27DHWE/+TkHvyI6cemQg72UtMc
         8eSNgxnkD4SFpmLwvUImk0yk0warjGVL5MggF02Pb+bMeA4MKJLLhH4exISB48ZCHMeP
         atjL1HODC6q+DnYZB3YVvkPTlmcY6FMzHQO0Hu3pvdvbpFS2gdGdqTZ1m0Mr/X6xqbfr
         INsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550889; x=1732155689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPmq++gF8XYGDxo6W13nX8EQcKxVsBpCdjyPJHQ9PEA=;
        b=FvX/eUKIResr7xVf9A7sV+gxT3be9wISTTj0vG/ptIg6ZEOTa9unoAEwbyldARMSWK
         BzwTfEwEtRKhLqdri9gZhnVRmMhjI5UsrUb6PgQlYkeKefufZ0ZCW3fhTx1Xm9LRTnwf
         g6haS30a21rDrOVnLxQ4qnxwqLDEPHAuNGan8YFYRxFD6lctWKfeKOTIhTBOVxkLA4F8
         Fv/pSRDWmdPBtFZWiEwwD5DufVGmna63Apiu2qIQRCI4PP/FulsemIkLa/t77YjyGcYY
         /YMrYWIrqiGO9b2delVjymfyQCucZmFjD/XcgwCheu5P8NXlcQrWHpq0T1NMSXpPjE/x
         Q8WA==
X-Gm-Message-State: AOJu0Yziyu2Lf6lrLH7ExiKkB7TeMBs1/L2fTbM8f3STmkxMyd9Arq0K
	gNURXXlu3KX7bHs908MQM7zW80CxxEXetlxjG9NW1szInLKSheWKDH4TcBJNB4k=
X-Google-Smtp-Source: AGHT+IHXs/UC6QXlbxwq/AZdRi0iAZKUws7q6EQOv882glnYxGWHkVDGfxYYccs3BY2ZiZF6gsz8bQ==
X-Received: by 2002:a17:902:d2c3:b0:20c:3d9e:5f2b with SMTP id d9443c01a7336-21183e709bfmr255058245ad.57.1731550889082;
        Wed, 13 Nov 2024 18:21:29 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:07 -0800
Subject: [PATCH v11 01/14] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20241113-xtheadvector-v11-1-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=nHDw9Tbf0xjTwaOoBZTvzecuhEW8GNONUj+jLJdHZ5U=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3DyxIyu8k/tv/KntPBMbFSKaMMV3s+xp5ss60xkb3
 lXkrX/RUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQ+fWD4ZyY1Q62Gp9u6tt5+
 kuvbiOC/kz62z13y4dbsiOyXebX7DRn+l+ckfXB4zmJ3iWHF1IyPGX6G1/5xf3Be1bRS2MNpacJ
 7LgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182130_153216_8C723C32 
X-CRM114-Status: UNSURE (   7.37  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index af7e5237b2c0..b49278e2f2aa 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -593,6 +593,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -600,6 +604,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
