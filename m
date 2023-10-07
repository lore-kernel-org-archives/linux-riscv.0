Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87EDE936FB
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pYC0zWVa2cS4shEUSwE54EgKjzTrD52ekZlug/NcdA=; b=UfI6aEdKKcnrVP
	4L4rtHI33Cism1j5w/ZCCYuKqjua2jZAwOV7BJ0A7d4I2iySTfilH3jHipgX/UW83tQ44VfloMd5H
	K/F8HgbyzQrG4AjwTY84n/SRX/EdPOCiSRwleAC+2F+Z/jRh4nc98E8WbpA//Az4LeCy5hRel/mlu
	Ud78gBmPPSK0EDcOfhA5TODHhmw5pAqzaa2TagPKzzhH3fKP3BADdFe2woLuwi5vr4fgHEWmoFgiE
	QrrT6N1vzZttGytfBPpBeRvMTfyHAtkh63gCRaC/tv35D3u9KAtavdkrQTcQp8RaFZvN8jKkoXMFr
	btgrmujeZmX9wJm5wKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp29V-0078wF-1p;
	Sat, 07 Oct 2023 07:55:09 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp29T-0078vp-0o
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:55:08 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6c4c594c0eeso1943084a34.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665306; x=1697270106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryYe+4hTs/lT5K6FlfyObupupFe/pcvu0b9Q5/wUL1M=;
        b=fiB64vpWxiBKv1f3wVDfDgVD+TmtDlw0jCj+a65EIW7llIuHfFmWPincdbj1Z7oPaH
         jOdZRV7u3F+fjHKaw0UFnHY+KcTAyGXWXMfJyTW3cWUiCRUHQatDHZ2PPz2mHVaoy/o0
         2JNoF61w2WIxkRhjcvPROCQQo6G+2l3FQZN6KOBGCH0Doj1Jn/BiQrYScGiJFpL1tTqW
         L4Rlj+SsKZJeCeyN7+SMvv/PD9MJRqvNJf82rLBY3ex0CPuCCfE907MxTIurpiTKzXeQ
         3XTEHTOMWWAAay8GSrLmEJzkDQa7L9CHsFgDu7UJNxBdy8qbu1sub9dqcW4NfcwEcIHu
         n92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665306; x=1697270106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryYe+4hTs/lT5K6FlfyObupupFe/pcvu0b9Q5/wUL1M=;
        b=kJ02CVPN6u5xZb48HZ2+xpHnQNMJSgfXjVqvGmr7SGlek8pWcgjI4JQqYf0cJhj9Lg
         bl7svIDJ5ntuXitqEzhaNc3QpBkV9ihIwfADIfc3yELD5PPDshXLvGAi0+YfA1IBaY/l
         IIOK5vEKoZcLEUO5aKwmf1ncEA8lS5lk2WeIQ3dtowy7df7RNos+OQzCh4h4zubp6z7f
         0Nj+TskqYmFfGaEDudHZEFpwsi7v9vG2GhQ83WdHQ94p20ZRMTRrR0q04TWWcTsl5s0B
         kbOLF/OG0ru05nixp4O2L7wehGcHfQHqyaFZDaicRzmFL0yEn0t+8ZXCOcXB0LAtVhqj
         2rtg==
X-Gm-Message-State: AOJu0YxQGTQSLqX0dUplOHcoKrhltT8cwCKqCdJRyS+BoO9u/Jq9b/Pe
	1rGCzLZaDdn70gw+YTU6bpY=
X-Google-Smtp-Source: AGHT+IG0oGie2gn1UZAZKInf1Muw6xUGB/yyMzA0RALsvPDE58pt/DOR+AOGCHdfPBUuqoth2Xt6gg==
X-Received: by 2002:a9d:638f:0:b0:6c0:ef3c:5ab4 with SMTP id w15-20020a9d638f000000b006c0ef3c5ab4mr11091996otk.0.1696665306434;
        Sat, 07 Oct 2023 00:55:06 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id l6-20020a0568301d6600b006ba864f5b37sm830853oti.12.2023.10.07.00.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:55:06 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 03/10] dt-bindings: riscv: add sophgo sg2042 bindings
Date: Sat,  7 Oct 2023 15:54:59 +0800
Message-Id: <230fa937009078bfda56a2f84392d20b848d9944.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005507_291806_C8151CCB 
X-CRM114-Status: GOOD (  11.68  )
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

Add DT binding documentation for the SOPHGO's SG2042 Soc [1] and the
Milk-V Pioneer board [2].

Link: https://en.sophgo.com/product/introduce/sg2042.html [1]
Link: https://milkv.io/pioneer [2]

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/sophgo.yaml     | 28 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
new file mode 100644
index 000000000000..8adb5f39ca53
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SoC-based boards
+
+maintainers:
+  - Chao Wei <chao.wei@sophgo.com>
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  Sophgo SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - milkv,pioneer
+          - const: sophgo,sg2042
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..97cb8abcfeee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20063,6 +20063,12 @@ F:	drivers/char/sonypi.c
 F:	drivers/platform/x86/sony-laptop.c
 F:	include/linux/sony-laptop.h
 
+SOPHGO DEVICETREES
+M:	Chao Wei <chao.wei@sophgo.com>
+M:	Chen Wang <unicorn_wang@outlook.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
+
 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
 M:	Takashi Iwai <tiwai@suse.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
