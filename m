Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F675C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxdIgPjBntlo4CYEoQffLOspI+/6WUGiepBeKPWdsfI=; b=XZWwsxFlr4Sci8
	6yZiex4vvCQQK8kTYWTuDBQO8hjwRdJIRlR1Dwj5e+CywlbC9LmtIOuByHgz4uxvIyINOnRaQGThj
	NpCsxAuEFKHaOcX8vLFNtTG0y/Q+spUui3PqrIQZ0grcQ7ENt0rsKDrhJAfGIWbOkXqbge8CJdvRv
	6aji1xRDM8XMi0SJpZ930fGlJNOGCKwEzYAF4zrF9Do1eu7HXyPWJGWB1cZDn6UznMiC7RWqpeA03
	DCcfh7C3XcSEWXJOpDd5Xf0CF2gwBOx5FsQ7xCjJlONokqbmjPNV/8PNcA+54uYtwr5ky5q0E1phj
	+nTKJBgPxC2aih4EAfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MW1-00000002y1q-0Ivg;
	Wed, 15 May 2024 21:50:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MVx-00000002y16-3T1t
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 21:50:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6f4f2b1c997so4276642b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 14:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715809821; x=1716414621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=b9FAtQiyi5b+Q4aLKP3ImQsvuN8Gh2A5dJ43cUKyOx/q60K8J1hed9iPaHwM+V94mg
         2Z37FkwgCgYF3QLMCzhVjYPxM8kWZOVpa7R1KCsUsyJ0EYFDH8LyxFJPXQOYm3op07wO
         v+XfBIDtiIRTdOixXgXfJ17cuc9q84aqSaetfO99mCgXn9VptFk1zbpsWGB6zdU0Jlw5
         QaNY+dAZ3vGrKxtqJ7Zj4OQjbE38OV6RYZlNB8SIZWw/abKze8nLhcCT4ii6Q44eym8s
         xoyysCyHT9e8GYsqytWR0nJas9gTwCflUVzLW3CICqq0c+AD7NvHOZ5DuHePghGkd9e9
         Z/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715809821; x=1716414621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=bbQjRDnK26Aep5Rdowk0eGgxaaFpxzpQdk+qHrUJIU5sDZPjCQnUek+MnvKsXM1024
         TpeuTFAMjLEcqe9QjADagUf5IyvmgODorUjJ3VmQj/CPvievclmwe7NGdhAAYFCQoLgh
         QZxcMKeULesEfHuHtrp9g873tMYa3iRd7yyAbE/ordCke9/2QrZHJUeU+xcyJlahdVfO
         EEO8wExHAedMomkDs1c/2Rp0rlU0PQF+pcPbA7HKJOVkc9VPFUjEAaKlhG7gn1Fn4w+T
         vi6TTu5wtRk+yNiXvHADNAmsFvmN1brao7q37XynTa24+Zek0mpoNIbPZzMH57SI0/DL
         5t2w==
X-Forwarded-Encrypted: i=1; AJvYcCVqhKqMW5i6nlH93MM1rpvLzmq5QnM4H3UXFW488P4DWZoB6r34BxPpqjuAUINz8Fb9P8Wa108SroqRREi9FLbDoXYjCpBVkq0efnCoxKY8
X-Gm-Message-State: AOJu0Yz6obORdvwiHMYR4rhnjHKPqB4ei5U3BSFEZfPLZkeLtno0v53P
	4b0Glyb21XA0rZhnMFZTDp1Niwh4WmtUr7oQftwAgVb4Kl79Tg9gsO+Y5Ie2j3s=
X-Google-Smtp-Source: AGHT+IFsZDH3c2GXDRmHQLCIoSiEcZ0a5ddtSOWNg9FgZfKDHYSHsFO/0FQn2GUTuXxIMbxBQu2wOQ==
X-Received: by 2002:a05:6a20:1592:b0:1af:db2d:d36b with SMTP id adf61e73a8af0-1afde0dc165mr18300987637.15.1715809820987;
        Wed, 15 May 2024 14:50:20 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm11638629b3a.60.2024.05.15.14.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 14:50:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 15 May 2024 14:50:14 -0700
Subject: [PATCH 1/2] dt-bindings: riscv: cpus: add a vlen register length
 property
MIME-Version: 1.0
Message-Id: <20240515-add_vlenb_to_dt-v1-1-4ebd7cba0aa1@rivosinc.com>
References: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
In-Reply-To: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715809814; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=OabNk8cbio1djlt/U5FF9VWWX6n6P5WbWbhRJmAG1nfw3J1jyCrjDDkdq2E8KtaKRT0aNk1NT
 j36KygdeOEsCz/srxtO56/4zFPug+AAO7ZrlDW7IcH1IxdkviKKs/Xk
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_145021_907930_47E7B836 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..edcb6a7d9319 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,12 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required in
+      systems where the vector register length is not identical on all harts.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
