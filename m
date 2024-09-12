Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81C6EE644F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlzR9XUC3RaBimlQ+O2vV/DOBZKH2DUoCQWEZOBWwi4=; b=sNMNIDoOcWics0
	YjKFuld0FcE+HapLIGo9CZA6I2/6RHzXu418k5RRspar+b6/S3Cqtpa9FLnkVQOdZnaWHk4RK1aqN
	AQSUEWBNkZ8ergxENxNPC8ZO6y3ovUDLpgH6MN4jy12+3NrwxAKRXim0WfnQVxFDEaO3YfyJbkO8i
	GMOqDjk9jquuE1H80JAl+pAVHcGsbuVV03JVUEYJ//bNylvK6iv9Ot40BR05CVNjTxUKlOzbo6Obk
	nu9+nbebEtJBnO8n0O56LePw4v8uH+SEzcA2daFCtUV+hpTfhbBXrNTfWvUQPg4SnuWEoHtSdemNV
	5zaQuZiyc0nscjOQZWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soco6-0000000Bvyx-09sZ;
	Thu, 12 Sep 2024 05:55:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soco2-0000000BvxA-3336
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:55:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2054e22ce3fso6439865ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120549; x=1726725349; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a31h58dvirjjptvxje9y9Mqcx9iPDZwg1ciuyTglV0=;
        b=WU0HTw35wxFtyef3+wJxMFqZ9mWcHsleEY3Js7pCRt8YJRMMBIRPCoQv7HMXXmbGZB
         h4eLkgUCN94tYmRa5m33ltwg4NoReE/BKsGFZ7loYO8W39vxYBaNlHCxd6pEWAvmXifr
         lEprr7sQt8Gy+dmXeNTvzdoHhJH0li1LM0ckYsV0xqKOeZ+dPQNv6aLWvTr/rIMiAdCd
         kEk3E+7TMPHGu6c8x5oOnDFXAxAgs+HFRyljYAxV7Qmb0Lznbx+8DeSJzT/ZrTpIU5o6
         X7YoHUmSX1pfViW8xbc5WXmcw6ptcD0IcItsnCNXzTMDoDhid7Vd3U4T9o6Y/NMKGQd3
         oxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120549; x=1726725349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8a31h58dvirjjptvxje9y9Mqcx9iPDZwg1ciuyTglV0=;
        b=tDAq1NyhJRnb3qFQpT23i8n5z5FewXYAyzNYPzw08M5eHRYxkzdYZb6sz4BN1RQxYE
         wC+6Nt7pfJ93wiL2bzKlIufiDa3TzykEWiT69W+Dbv+Kaf4AvFqGdThsyTSTSX0wyPDe
         M0jfexLCImP4M3eZYOJ0NBMl3xO5lHcQ3WDAhrPCNy2OjcHG+ZTLL4skpvm/8RRUdqmd
         HbSkF3PiKA53zmO3Xs0W9vk1oeJdgPxukY76WbjgnNjk2J8eJxWz2N2YwlJ5RRs3tHa2
         3UnZ9a79Azt6x3XZn9T9Bbls67+Ir4Axtjx/fbvqkuDl/a+J56jAwXqBILmeCY/+O5Gt
         YuIA==
X-Gm-Message-State: AOJu0Yzo4fE+NWbM+is1dinyXo0Psyr3pOYeAki8JmLVkk1HNde4CCTa
	3v6Q8X9Ydt6/8fjxv1/LlTuaE7NypkP/lp14ivtzC2CwQyEc/LoOY+/PEISRKyI=
X-Google-Smtp-Source: AGHT+IHKCeM+iDzgTZA8iai8wEAdx48qgNifGNBqlmMlN3z+2F0fcjMXoHNP4W4BOCCsUutd/a9kSQ==
X-Received: by 2002:a17:902:d2ca:b0:207:1848:7221 with SMTP id d9443c01a7336-2076e435f13mr19074275ad.53.1726120549289;
        Wed, 11 Sep 2024 22:55:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:10 -0700
Subject: [PATCH v10 02/14] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-2-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=g0Gsy+5TQh3RSmd39xewdNDSsmzEd+HtR+40T1Y+noY=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpqi6xw2/1SybArcG9ZkvPNr7wOuI2MvGzcmpp08lM
 4gsfHalo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInck2T4wx8msdT1Y+GCg4JJ
 iw/fOWJy7lHE19wTRd83WVxqDmV9ycrI0K+yobbz0fd2lzOdi1gq/n0TaeVWlxX4l5/FcOe1xYd
 lTAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225550_816343_5C919136 
X-CRM114-Status: GOOD (  10.86  )
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

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 8edc8261241a..c0cf6cf56749 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,18 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - thead,c906
+                - thead,c910
+                - thead,c920
+    then:
+      properties:
+        thead,vlenb: false
 
 properties:
   compatible:
@@ -95,6 +107,13 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  thead,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required on
+      thead systems where the vector register length is not identical on all harts, or
+      the vlenb CSR is not available.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
