Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6FDE810AD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brTOKmW2+HZ2KwyMQfL1zh2qiV6PEoTX85mAFGHm2wo=; b=2o1hYF2cSX1lvl
	NIp3sjirMQBo+20iv9d04wTr3RFNJakDeCD+Rgeqf432Uqhf7POAoFhoIgywHuVXvfllk3iWIrCst
	gQ5OwGdqlnkiXpajkNBMcjfTUr99NqS0RxyePTW7wVPbCpRCJsJv174jVuXVswCZmD+8CWLEmvoom
	ywOWQKrEtbRUV5yO62mk3U5K2PlLp1YGuu9EyQVwTKDywiaKTS05hohROWJeGeZuDJHN2ZDSv5RxS
	SoRW6b8wH5dB4Z5/i6WgEpGsYEHbRQzVo+sQ+L7M7MZI1Z7B7VL+q7LzWiTLPNw7plwVuO2YOAB1s
	B7+eoUsJr4e5Vvn45GKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQPf-000PKy-2U;
	Wed, 27 Sep 2023 09:00:55 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQPc-000PIR-30
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:00:54 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-57b67c84999so5802528eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805250; x=1696410050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XISMEEuxEHPo83QIpIC+HgJvoMzURdyaENZ58w85qI=;
        b=hEolCXw/f6EcNRlDAC8MoCvO3UgsJplB843b7AtL1Oaah8Fhp7Gr+xK+71kA3lT1oF
         vDVZqwY98dIBPfkdkFkiB0aa2aZNLLztxGN50wWablefvY8eJNZVmRRqqI2zgx3dZpX/
         XGvAlh/cXUDIwr2+7/fVYwwNLhI+UXHLW6iM35PX1UI9F2H40dszIyNQ2dZ/3zTcYaZU
         aKmGkGroqPGobqueS/J4Uty0WnsFc8N4lRTnT0fX38h7gSXShXbPxviceeVtsOZj/MId
         4vIWqUCzcfmNvK88UPfPRTnPIxJIeTGsbcOw9hSOXNn7UL34T4RILF5vJwl+VBiM7zHg
         VXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805250; x=1696410050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XISMEEuxEHPo83QIpIC+HgJvoMzURdyaENZ58w85qI=;
        b=BlaeFYo69Wdw6gqDf6dysf603tjThdLiI63lFpQ7YNj7EVmg/LO/bYQpj+61bFPzyS
         1M/bmHNkx0N7CxkOWOf/9iASxlYluEC8fReyFZ+fLSsXJ298A8OrvnEcJk72Uts9Fdm8
         gh0iGcpqHWDC4iupEYfwGr0szGws6i3SRoinf9rbCMtMZ/n1v3QLNsvYBpnC7mEV0dvj
         WDH9m5SzOdQPbjnrdYtATN30L5N66gp+k0tW4LrLTwd194PQf/cGGCzUBSKW5vFB14Z5
         FXM46y0pf8M7nsXKwgK2wS5TjZpqAQkl/mA9skv/Fm1tTI1cyN2caA6ZxOB98U5Dou0I
         JOzg==
X-Gm-Message-State: AOJu0YyFa2PvP26f8Jb+CMChR8Qtfg//ale1OmmvuPVrhbxdo7AwSwT+
	MFYrJMUQ2e8xB1c2WWUASWA=
X-Google-Smtp-Source: AGHT+IFUyHthVzniBAXCYOq3vUTRDSWKmjX+zEks2b8BgJUOzB+OHdp/JRDiqWdgmgmIiIaljSSsbw==
X-Received: by 2002:a4a:6c58:0:b0:57b:6ab1:87c9 with SMTP id u24-20020a4a6c58000000b0057b6ab187c9mr1523375oof.0.1695805250702;
        Wed, 27 Sep 2023 02:00:50 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm1373103oob.33.2023.09.27.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:00:50 -0700 (PDT)
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
Cc: Chen Wang <unicornxw@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
Date: Wed, 27 Sep 2023 17:00:42 +0800
Message-Id: <97c14be89af91d47e4d7b2313d7348ca12f393fd.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020052_975486_44173D0C 
X-CRM114-Status: GOOD (  12.48  )
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

Add DT binding documentation for the SOPHGO's SG2042 Soc [1] and the
Milk-V Pioneer board [2].

Link: https://en.sophgo.com/product/introduce/sg2042.html [1]
Link: https://milkv.io/pioneer [2]

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 .../devicetree/bindings/riscv/sophgo.yaml     | 28 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
new file mode 100644
index 000000000000..4e8fd3c6a6ff
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
+  - Chen Wang <unicornxw@gmail.com>
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
index 90f13281d297..9114a14ce991 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20063,6 +20063,12 @@ F:	drivers/char/sonypi.c
 F:	drivers/platform/x86/sony-laptop.c
 F:	include/linux/sony-laptop.h
 
+SOPHGO DEVICETREES
+M:	Chao Wei <chao.wei@sophgo.com>
+M:	Chen Wang <unicornxw@gmail.com>
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
