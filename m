Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DE1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZTJ8gm7+SvtMbWdj5FipBM/3otlkgk7Nt3Uh6bg3fw=; b=WllIoqz8ZiEtjc
	ROYe4GbBgDLlSNo7BcQH9qNbyMzTuZDkJKdDs5biD67pPyDavkmZxty7AwVuEnKFOd+IhUx1ZO35d
	fD+o064ZR20iSJlLhCMA4EjtgB6+L/6/dX2QHbSdRCgATK2O5Z0A++VUf2RGzWn9Nti4Zbkzdr/RZ
	D3wenVgbIsciKG37hSPbphif1GJQT5F7YDUo4mI2lAoml/vILc8yqbBIEI/iAQa8cptqDdr+FMQTC
	8GpbrdKVOenS08QeXgugw9UxNsYOkZtMKUZEJ0IuHdR660MeMH3nv6iC5XNuWnioPRXYe0ki+peH6
	Tz6QdnHAte8D+jx+2taw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAj2-0000000FdTl-1dgg;
	Fri, 12 Apr 2024 06:49:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAiw-0000000FdON-2lL2
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so5422355ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904561; x=1713509361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=c8ianW2qsiC1LdnvaFt0gjmxZUeVS5ymV65lwf7lDR1UZcEvaHkkIXrhXl+41AQUSq
         6DREcIQKw68/JDuF//FXsLE6KEw5lqpcKNGbCw3WAjGe4A3RZkk4vwQoI7va8wY/Re5D
         rOj943dq3WkHn0d7jbs+Fw/Ju2uRUR2su9hTRMIFhI7uVE/SuKXVkeDhb8n0XEJn7b8D
         1QopLttYvtfURteSx98C0Nyvqt3+lzllVGQsxkXt4vbIgyAyI1/FnJLmtdVMlSO/Lu+3
         gzrtO0KdMu+si70eQV6Xz79ndjsf3SijIrZtsVnwfdgEJjG4TZTXNltL1EXqLTBaovZh
         JPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904561; x=1713509361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=qZ0hQOqM1yE9m6gP6Agdiubx8AMjnrBdNEQEQCUtbjcR1rY9w/F4NYku0IDt4vaOb2
         am2Wol8wSIybwigcYcoEuySfzNeumuBscbVP5t/WTCtHBDtimLlPAeNEvGLJ1/mEtAI6
         BgePR4fSU0EbrLZkYiD9wl4lJsQ14dXNnbhqd7E+DzEgrJe21Ytx4Te9IM+8/KDJ1geU
         lqfwKnMa2Wi4HY4RnfGMnBnP3QXOoYK8Yng0CQhLwmUmwgs9yqv0ZYtAUx7J36PjOxJL
         /ZH9H15M6HbfHWubgTjJK3OQMplL6UxLOL4uz2lpapXa1hR7cgCYgksnTvAchKvAdyAE
         oBQg==
X-Gm-Message-State: AOJu0Yz6ONARNqlQFqQnkSUkiy6zjwMKyZaYnIkLP1gMEyTIgLnIv7Q5
	liY4x4IL0sSadxxpmk4zeyB8Ih97c15gcprb9STz2js0f0jj3BWQH/20BKqi3LA=
X-Google-Smtp-Source: AGHT+IGm9y8I11+R6SyRv/t5G6RHmcLUsT36+9WxupmJkWY3E0gV+Me9Ik9kATEAv67/WzjE2CXInQ==
X-Received: by 2002:a17:902:f711:b0:1e0:157a:846c with SMTP id h17-20020a170902f71100b001e0157a846cmr1494556plo.55.1712904561015;
        Thu, 11 Apr 2024 23:49:21 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:20 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:49:01 +0800
Subject: [PATCH v4 5/9] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-5-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
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
X-CRM114-CacheID: sfid-20240411_234922_884207_5531BDDD 
X-CRM114-Status: UNSURE (   8.27  )
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
---
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
