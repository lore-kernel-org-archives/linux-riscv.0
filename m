Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D79C27C5F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsEcspKFdoTSV6zwu1xY+SCqYLOi0irGXAjnoYdbJ88=; b=joYEPnjbYLF5It
	d4iP1E/03LTEGB6JErqDaNQhGuPN5xwTRRnb9KRWeM/I6/5T4PI5E1ru81GpMj14ell4usuB3VD3N
	l44Qs2PaJdJ0fAmz562Xppa5zTqQoSfep3+Xukc60KGTqixRu7YeiUjlrqjGqR/L5IQoVA17Tyby+
	SUIdXy7p0dEhpp+IT28NeSqyJ4ri4pLgWssOAkMj5ksGk1AwJH94s8+MthLKLV6DLuzjzROPxcOZN
	3a5Bd4ghfASN23OO5YjCOI0rC9R57gPPcn2iEQWNi4G9hh9u64C5zCFPnwgXV9+qtJbEpxSIx/3+O
	SbnUHOXyudVlrJK+xRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWue-00000003mQm-3AH4;
	Mon, 10 Jun 2024 04:45:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWua-00000003mOx-3Q0j
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:42 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7041f4553ccso1867780b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994739; x=1718599539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnsoWpv70BH6qIUNn0TaawjhriEvRFbQJi7Pz4BWmlk=;
        b=1l6ZmtYBEKVS6G4HaUAG2BieTQlChUtl5jFoeFgLeWWhUL18r0csoIf8i4QYfdLKS/
         eYfTMqSySAw0l5QFUlx4jVaPtixnu27JSEiwmjALmUXcJD33XmUUPS6Uxp/eMq1qu/nz
         N9X2tigzs3Qct4GA6z2xh64DSRYoXXAUJGYL/gWrjeKitdTBc0eMl7tz/fSwwBHrlOA5
         u5NnnUfEu8yRxdfAraio+VS5KHOwWh6jRYGeRznl7byAw3+Psnc+5CtMUfpCGoPvfwxw
         icTJWnEQlLS5TiF5wTSJg6qP7q3AYToPREmv0xNXU8AyRqOu95rSIdaA3Jti1Hy0FO/m
         0Tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994739; x=1718599539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnsoWpv70BH6qIUNn0TaawjhriEvRFbQJi7Pz4BWmlk=;
        b=G7R6SQLKyxtPjmQ90O82f2MTXfdlnnKcZyQluGV2Gjti3MjBB6MZLlNMSQkITxfRse
         eEr+COXO7Qc3HOsJ+xyeOAYzcTN84IfroivvzNf/8RbCrsZc1pxy9Yapo4iyYjCyqDIi
         +NBf1bVreQIwwAEaiHQ85oZgbfOJlnzyx0IFsOeK3xzHv9ZFtqsaJ6ak4zSMHi8KLHAZ
         pg3thVoV1hmHxf9o9wfkkmD5fBoRdoaSTgTgBNpa+M1jAHhNiE6pdyx2duHU2YpiFB2E
         Aj4P4z/RS0jsoKaHds8arAvr0oAQbySYH0LeGNA58S7V8sOXXIYgHWMZvNDQU6FzYzhu
         woJA==
X-Gm-Message-State: AOJu0YyOlidHx2BwU/L04FOCbaoLozf9/8qh5H86MBGmHATvvo3iRU9A
	ngA6eF3swSCS3QFOcKVYRPd9lAXxG4PRvOuZf284gHqp2FuK7sZmBxN+2FmJybo=
X-Google-Smtp-Source: AGHT+IGAB+vWm0sGCNa81cmJyCujrQf8On8Y+GxMGYRiKcexYZGA6hr44N3kBkh31p7uFMVCcWAQvA==
X-Received: by 2002:a05:6a20:3c88:b0:1b6:4151:6158 with SMTP id adf61e73a8af0-1b641516226mr4498267637.47.1717994739324;
        Sun, 09 Jun 2024 21:45:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:07 -0700
Subject: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=1303;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=kilTkVt6+s7AVwl0Le2KXls/6mRYwW97PnRFwTEsmd0=;
 b=4RRz7xmpcb7CA1ZMWQZlS9J8l2HdlB2OzfAfqDm1wbd8Q0dPdolWk/sqmZ90bsZ3IlYTtYYew
 po+8/cap559D5Bi2X+IDlt6JHWqySfqydxCXpaM/iRpkxwpTP5F3ksW
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214540_894286_A2A2FC8B 
X-CRM114-Status: GOOD (  10.19  )
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
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index 301912dcd290..5e578df36ac5 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -28,6 +28,13 @@ properties:
           - const: sipeed,lichee-module-4a
           - const: thead,th1520
 
+thead,vlenb:
+  $ref: /schemas/types.yaml#/definitions/uint32
+  description:
+    VLEN/8, the vector register length in bytes. This property is required in
+    systems where the vector register length is not identical on all harts, or
+    the vlenb CSR is not available.
+
 additionalProperties: true
 
 ...

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
