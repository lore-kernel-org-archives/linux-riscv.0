Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD1EE7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Y/HVI3KHUFyM2Q2ziqc/TbUnXNFaGx3TfUVAqb1nyc=; b=5Fds2P9kXITE5B
	YaMssFAkFzIvzNmkvgC7wRRzdPBK8INeWpW8DqWlTKQyqOnWpdfFSzx/jd4gwvgfVX4NSMj79fhRM
	dfIgFIrOuoxedR77OXCoE9rmHkQg5PJBdJ6ACp1ByArQ5QnZrsqapIp8K/xi35nyAT6XGLHECiv0P
	VxcD/vSPQ3J47slceiAnjFcGBNVN8VcnL4vtPDHhCiQWdpHx+sH8Wa8CqHMZHtJUzakroQtuXr9Te
	5/XbZ2ZvpCAJqxLpndxPZmfgUtuG6CVIf6KUm6FfEvgAGIUyxa7ST6Oxp0naaFvRYRPYg14d+ewKE
	Shx1Hjo1MPWNbVuQYYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo40v-000Nzk-1h;
	Wed, 04 Oct 2023 15:42:17 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo40s-000Nyx-2j
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:42:16 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-57e40f0189aso1301495eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434132; x=1697038932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnxaBYdRGKVgJldzBvlLszd95TgiOglWQuyS4MNphf0=;
        b=RYp4NgbVEYtWPOPOXE8XHqI2aWNLxxtbZIlYzXBFS96qDqMkGUasFwGloFdGZPW9Ug
         Qm/C8eHo5GWdn4mr6IWjYi6ynBY/Kxgiuaz8/twRKKFRSGRso5DjmjJin5FL60Wiz2zo
         FwwLXVCBaCgWcSpSaXAjTgNYoWTvHVllRlwVJOj+R7hhSCEN4zOnkK3UWV6OiKgKojV/
         Zs4o04yaykH4ByPx8jQny+t4/UeQJwzC6Gk7LvqenO+eKNFXHRaxwHG4V63vUrj6uChI
         Gznnzh+hBFLvOCVmXJkgX2d0EgM2yA0XMpX5bXtut+cgt/V9VjYicXmJHibDgpSfCtCa
         p20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434132; x=1697038932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnxaBYdRGKVgJldzBvlLszd95TgiOglWQuyS4MNphf0=;
        b=NV3PHca70UYy9INMbf4C+mDhESymiCoj0haMwz8E8A+NSVnNesjj9Jm0VDRj8U8/eS
         qLa3xuaSbZO0MH+pUPAfWEnopY0JlR1tGT1hQP2QjCoi30L1l2wD9WC5gUJRXV8XYI0R
         LBlfOk8wMoblm0wO97FY7+knP0oVk4KzXYLq/+g+SYsSPteKzq/QKdeP1lrmwnKSmOOM
         GvXzLZZtT/JYN3Tog1i4r5us3JyR05jZCaMe7pYUQAgp+ZUQnr44hLTs3vL1Zpm/hMZv
         iPvK+CuVHCxhnZ2aLG+ruqNSgM7XWveshvu/BdRLnRMmJjuChNHb8EBKM7YD5hpcUuQP
         tu6g==
X-Gm-Message-State: AOJu0YxR1R0NSPG9NdlsEHA7oNmzDoCaaobXPEKeugZECD8lwKNtjQOS
	FIrUc8ZzOdJjyY5l7s+LJHE=
X-Google-Smtp-Source: AGHT+IEQbM2bZQBMikxUSN8+tNBqkEpBzn/Q1qrIXW/53+hljMBT5wP0e0XQ6KwfcYnOIkCY6UfnuA==
X-Received: by 2002:a05:6820:220e:b0:56c:cd0c:1d67 with SMTP id cj14-20020a056820220e00b0056ccd0c1d67mr2315269oob.7.1696434131744;
        Wed, 04 Oct 2023 08:42:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id f65-20020a4a5844000000b0057dd74ad3casm672580oob.41.2023.10.04.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:42:11 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 03/10] dt-bindings: riscv: add sophgo sg2042 bindings
Date: Wed,  4 Oct 2023 23:42:03 +0800
Message-Id: <c8107a1ef18071ee6555a2368567f3554a673f97.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084214_884409_91A85799 
X-CRM114-Status: GOOD (  12.13  )
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
