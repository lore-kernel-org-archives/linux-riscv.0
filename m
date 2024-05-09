Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA7CC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCAybphNqTGOB6whYk7913vVV6z/zF2ypULyuw0i/+o=; b=X1KftCVYla8Vj2
	XDrV+Hwus53r7CFEMRcjOjTFXt9ypelj6aYBERRnatRHODZxjzrdpmjem/6+kTDapEQ6W8rrOHK+B
	XYFJIxEtMsTWjIR1gonOtcG4MNfQuOs31A0WZCYkZAiC+p0QU1y3SLznAomHgqVqlUYAPPw+P2fEs
	pPYqGsMvoQCOoGHDyszB5i4AHoRaYlfTx9EdpHeciUICZDTj7pEgJVsaf6ffnJTahYVqyWJFT0X6u
	l3c27DWzg1H6YUWD8XFAdRLbVi8H5gsUCRxbLhqiHEgBh+JO4Bt6tI1kwAonTEqPIAW/wYYRBd0/6
	xQU4+1rC1k/rcAkpXVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cQ-000000022Q9-1RMb;
	Thu, 09 May 2024 16:27:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cM-000000022Ma-36ed
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1eca195a7c8so8593095ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272057; x=1715876857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlKJTA+y4FZTs32pZYAJnhXlsU7CxhYFnIn7J/LCVc0=;
        b=Du+7adFqnmnBV5nC/V0q3KKY8IAZkADjIyXLSUk3feKKAgVjzXdkhvAbqqQzT0cMEE
         JB93Hll/lILbGlEPv/3heoNtIytYHFluXYexZenG0M/YzQZsvXrdbZdDJsOk+xBTSsCU
         ivRyLEsDPXCHRsJQSScy8JFB8Lv3UhnpNqYIBj7J2EeS+bLCb4xfQjqgVjo3auiKA56D
         NLzsudvkBzWaVjMGB468RH8pV+hlTG9Eb9AhXq7hMPrKAKuUQM6C9WXcer++CJl23u98
         TAcLl4Tasp8V1hjQCkQT3nH4O436XBkyNxthRip6cqnhg6duFxuNw1xUD+skiEYGkUVl
         Izmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272057; x=1715876857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlKJTA+y4FZTs32pZYAJnhXlsU7CxhYFnIn7J/LCVc0=;
        b=CiJ04F/99lCZ8ZHtylrPzMQs+996qoXH+47YhuAyk75wrCFYCgP5V//VQLlBSCWLgp
         xCkr1Dj/bvtau9kF34WHvoN8aq60wlykvAZrA4tFc06+tXgYVq6g8sLMKWcCH9/TJyqa
         1rcOaqmvTWhweNAwkctNGcLaneyjSWc84ES1/5fln52CLTjNuDtfKIA4/Ccol18Fym4W
         kud3ObZPxCt7bzt+truJ5a8f76Fnzm4FzH9I1y/780PNqTQz9rr9lJhCJAQ7oG3/z9Z7
         K2ZUfo+8sEmzLeiuiqOxNoXSHp9YWMHeFlTfXj2b7PA2NgeXG1A58NA1LHFq4kuERq4m
         Hmyg==
X-Gm-Message-State: AOJu0YwLgIKWnmwSS5mBY46rQ8U4dM8IKoyWIvkv++ebF3XNdTs+/DyZ
	aG8mcowvkvfzhSySyKJ1IKC5HzXWbl1I7QtbbT4R5o2Ahy10Bl9wW0HGY2cbUeI=
X-Google-Smtp-Source: AGHT+IEszGbwB/vNXrttRGOidBoOwpuhaJiBy+bYw1u/tAahtS9W1vF9JRL7sPHMpNOzMB5IXCQqvg==
X-Received: by 2002:a17:902:c086:b0:1e4:8c64:33a2 with SMTP id d9443c01a7336-1ef44059be4mr1058755ad.68.1715272057380;
        Thu, 09 May 2024 09:27:37 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:37 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:54 +0800
Subject: [PATCH v5 4/8] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-4-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_092739_025543_BA686CB4 
X-CRM114-Status: UNSURE (   9.33  )
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

Add description for Zve32x Zve32f Zve64x Zve64f Zve64d ISA extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v5:
 - Reorder this patch prior than the first patch that uses them. (Conor)
Changelog v3:
 - Correct extension names and their order (Stefan)
Changelog v2:
 - new patch since v2
---
 .../devicetree/bindings/riscv/extensions.yaml      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..cfed80ad5540 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -381,6 +381,36 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zve32f
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve32x
+          description:
+            The standard Zve32x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64d
+          description:
+            The standard Zve64d extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64f
+          description:
+            The standard Zve64f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64x
+          description:
+            The standard Zve64x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
         - const: zvfh
           description:
             The standard Zvfh extension for vectored half-precision

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
