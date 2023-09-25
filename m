Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF6CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0giazkFhDlio9N2N7/RT7Nde9ilmKWA4Xjk4o0xgwnQ=; b=w94j3dSnK6TUwf
	qwHSHIr4fBp+WNNVukMvaTvcYRoJMYvxtNAAyNAMPAJh6kTgGavQmckESwFO9xzAGJgCwXuuQLXQT
	MOgChItkJZcfvqkgXYFnJpPQ1TTNlTUFYx8fikotRdaLftiv8U/GUjL089SmLRznPQ0oy6otdKv4f
	ZEqbWsw46ERMng38+Bi/aFxZRU/i6oiFUwDGlQxQJyR2ctyHGNwuD12PhY3NqOHCrnrvuFYZv27aD
	XchE0cjP6rEqgFBr7mhpcg5duYqdrvNbtCGbgc79O8T+CcvSzge9VQ4m6TidrlehqTT7MPuzbsnLZ
	wjJOly3V3kOp3SQnUHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklo6-00EM8S-2A;
	Mon, 25 Sep 2023 13:39:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklo2-00EM6V-0P
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:39:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c465d59719so42285795ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649161; x=1696253961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsJSyEFV+awfjzqWEQrKDCJAKL6BoM6HZkqImf1ste0=;
        b=j3k3E2h/x8/Q/pQPVkZLfvETwA9JHlSLfKTBSPUc/r4PnIJKdIuZHhNEnJxWkgswPZ
         LFA3fYadErVB/P8QcqZWEJUJ4v4oI372nIQSxctFNss1rjmUlkey4C14ZVMiGNLtmIBA
         0AOCxIGxdzh2uV66OJ/LHv7eZQGPrK1H68MrMQgHiUZ66gF1xrx5Hpv0osZNnfqWun7u
         Mh9PZZEQk0kdSvRAygKCw5nxkS9UBcBz7/Zs6C18+Fm5L54jBfiJTae6xcfjtEF0TjNq
         84iHBZrkROPMaJPZo+x4oJbmkw9B1xN/tDrEWoM/NElGesbIP+c88pjUZJuCrRoiNlZS
         ugZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649161; x=1696253961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsJSyEFV+awfjzqWEQrKDCJAKL6BoM6HZkqImf1ste0=;
        b=D/qYO+twceCYOWeowNZ7Vhp4O9l8lgY0O0ux/7oHiPnlgl/Y23MDsHibPDMG16UMVx
         09dcGWT7G8m/1DWDJmUP6k0m24lAbjwsGZnRX7CTYr9br64KnRx0vLi56r0ZFQMSJgQR
         FPx2TUYl6bDx0hG1o3zVoUSWNEepI5rO1sMX4sxJgr8CzKoUPuq0W9sBMUl4ry69n8/H
         z6GS/9HWxBQqQrkJvRVKnLS1slYGbobINSIVQU6a94yZ64Vu3Em0oCthWG546NP6yRY/
         u4LBIip5TNIuV5YygkG3Qopma4wLxuGzWr6vpufF6/aXt1Pr8+mLE/5MAOyXgLFeCExR
         VO4w==
X-Gm-Message-State: AOJu0YzOVtBLBc22n5Qijrs3GWLM7ZtP+AHYUlchht8bd7Wnf5xhrnlJ
	hdkfp7t64swI+Aj4euJKOBjEaw==
X-Google-Smtp-Source: AGHT+IGqj9n3VQj53FXQlpdMHVR+4bQF5JgIjkaYGnLOH0hemDoUwEedX5Qz4D6VU5amsUQF9Mm5Cg==
X-Received: by 2002:a17:903:32cf:b0:1c6:1ac5:144c with SMTP id i15-20020a17090332cf00b001c61ac5144cmr2569000plr.40.1695649161179;
        Mon, 25 Sep 2023 06:39:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/9] dt-bindings: riscv: Add XVentanaCondOps extension entry
Date: Mon, 25 Sep 2023 19:08:51 +0530
Message-Id: <20230925133859.1735879-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063922_171996_6ABAA337 
X-CRM114-Status: UNSURE (   8.36  )
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

Add an entry for the XVentanaCondOps extension to the
riscv,isa-extensions property.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 36ff6749fbba..cad8ef68eca7 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,13 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: xventanacondops
+          description: |
+            The Ventana specific XVentanaCondOps extension for conditional
+            arithmetic and conditional-select/move operations defined by the
+            Ventana custom extensions specification v1.0.1 (or higher) at
+            https://github.com/ventanamicro/ventana-custom-extensions/releases.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
