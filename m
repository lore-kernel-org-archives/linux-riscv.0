Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F3C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ibDyxg1UinH+RgE+JrE2UJbf7sRxAJ4kqHhqqkd8B0=; b=tBNkTJGt0ZjlsF
	IQ6T8fBDnS8xB8uGDba6wcCaFO5nml/W9JhcIHDEh2xbQLTYOjA4FnyklDmI8JKIKpNhMOm0ur819
	URB1BENy5mHvBWFEJnERkcKdsJxvyx3oJOQsg5bD9IEuUh64jqhYc5d+v/JEQVWb/CrGJEbCgjE4s
	3rJmNEyRsOZAuNpkZ9DCSCM+nAdxodyU2qs2mmhtCJnZ5jc/elaeABevvWD0tmsKtDluod4wS7uUt
	ManYkVk4uXQ2smz0iUibO5mWWg2G3G7fNHIg8qvvvkyOPb1ji4QeFfkhlTH/0eF/QjKBCx7STafdB
	F7RK9Kwp+ynAcG/TFAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WqR-00E2Ro-14;
	Mon, 13 Nov 2023 13:19:15 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WqO-00E2Qb-0o
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:19:13 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-587b1231dbeso2504643eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 05:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881550; x=1700486350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cILQpOBvb+TfKiK6ZQZxVGfG6yumttRB0ZdBq3qtuMo=;
        b=N0r1esIp8XrEd+ZtiZsT2ygKS47G65rLndgrJBgYr9Vx08vvqBsvxCJeuxLmreJKQR
         TMT4Wn0Ms5JWzByPyMfxxbLfhNeciwkiJBAbN+wbggvBK2g+HiR6pCgp0Jmqk7WID9WZ
         euRdd4HqkdApr/XFDPVkGAnZ/qxmj1vbvUi9J+oKjlZNW6hxPzyEp1MQlHwn8wYdoMx4
         +3VB0Q9f8mPrkh5AczDab/femgCUghQSc0mDGg9K7aJYZt/2m/RX9KKFo/Xq2gA0tAWs
         PQo0H5KN0QptpBC/170SqYI1Yy/pqoVPEdHyaL3QvxIynjOrZLTfIfpVBZUehwjnI/7Y
         QJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881550; x=1700486350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cILQpOBvb+TfKiK6ZQZxVGfG6yumttRB0ZdBq3qtuMo=;
        b=uIu4kWMb/jAJpWnzz43LL+CFUGpHH9KkkmV/hhBUfviv6kD3WGKpjTZPhl1/GIfHbi
         /9MtMF/REl4BJAGhncsQT2Q7sSCUSFCs892LE5Or2I0yjjue8N1VIg+Cp6z8ixO4TGPE
         d7Q8WA4Bt5iHxauuUYfV7739DVdxM/or+o5r1mN+bPwqemU8yltWU42sjEhXfn9NNL73
         LIW5REof2ZX8ipZdb4emwWQMcKV8+KTlyW+qpntQRkbpecRK4HV8FoaebLbcF/uOkSZe
         jGLhPefcgpQwAFqQg01lPlYzU8qmlWiTmuMtTKMBIh4NMFKtT2WgYpWcMI+EO8eVnj3l
         liRw==
X-Gm-Message-State: AOJu0YxbBfsI0cDDcM73icieKUL6v5QBqQA6lJ24MiyOAGne6764VZsz
	W6Yt/Ogh8MK4wW9Th2IK/LkZMZ5vp6EyKg==
X-Google-Smtp-Source: AGHT+IHGu08XC660yZ66f68Mmebro0V2bn0R5bRMPD2XBiV2hiZPo8vFmbjyr+ZUlNTWZ4ylkZhGwg==
X-Received: by 2002:a4a:851d:0:b0:581:d922:e7f3 with SMTP id k29-20020a4a851d000000b00581d922e7f3mr6288302ooh.9.1699881550098;
        Mon, 13 Nov 2023 05:19:10 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id j15-20020a4aab4f000000b0057327cecdd8sm908572oon.10.2023.11.13.05.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:19:09 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 2/5] dt-bindings: soc: sophgo: Add Sophgo syscon module
Date: Mon, 13 Nov 2023 21:19:02 +0800
Message-Id: <3c286171af30101b88f0aaf645fb0a7d5880ac0a.1699879741.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699879741.git.unicorn_wang@outlook.com>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_051912_288802_B2E60511 
X-CRM114-Status: GOOD (  11.79  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add documentation to describe Sophgo System Controller Registers for
SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../soc/sophgo/sophgo,sg2042-syscon.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
new file mode 100644
index 000000000000..829abede4fd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-syscon
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@30010000 {
+        compatible = "sophgo,sg2042-syscon", "syscon";
+        reg = <0x30010000 0x1000>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
