Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A27FC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 01:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJuG6BuxlsqFU+2QTWP5oCDpAWmK0DN+GiTAy8n3/c=; b=3el2iro9wpO75e
	ANBjv69CE75/s9hytC90cJiDAs6W/SGQE3I+fwwn3XipqkK8LKSlH71GxYi7yMga0Ej1lEA0lP0NW
	4vP9f4bK1ACujaXbbBzfrlatvCcP2v7SW1i9BQmd4WR0T80q2aFzFYDe1r02gopz/W0FOl2w6DsZO
	1T11mlZG7At3pKV5ZnGZjlJRRk+VRK2lmgQzvzE9EDDO8znnBlHkZ7ssw1ytNaBbLEEgFaRedOOyl
	zODBB/4sJguv2TCkLnvjVYnTukzqnkXuc4RHH8RmNnfib1FDQK9CRVIwVomUaKaWtaap5fgpJbPG2
	aNxOKuKozvYsA+i+3d1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdl-00000009Vzm-0rEN;
	Sun, 21 Apr 2024 01:05:09 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdR-00000009VjW-3HJw
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:04:51 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c7498041cfso1081468b6e.2
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661488; x=1714266288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=qfyJy/IGlNV34xQZrvsb9NEDzLGf/68oGKsXRiVw/irnR/Tv1G7L1bceDPS30dkSNL
         0C1z9xnmXlSD2jONq3tEF5K2cbxTKuomnxyCx2mFECbxNj07OPsJOs33QY9VrLZ5ofeG
         OtYIA4l1O+t2DTHCT9TtUvAfDdbFC75c+ux1s2DQ5FJJmFgPNaduc5EErIU21YoeIRhw
         bfNIVapF7ydhZKdPgJnlUI4KVszj4qO+iA9lHxcLW2pLPu13UWFG0Khyu61CFBv1BURT
         XqFR2ggg3gTQi6Dk7RibXBWDzOZpLXQiTcgGBjbFbeeeuFdnO4t+trR6DKFxcQN7OvEZ
         vahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661488; x=1714266288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=R/X64sGWFDSE+1J0VPpavDl0BcjkdlaJM6AAut4ycBvn6dcd54HNf9Oz9XfZHDjdnn
         XuHOMcAyDVHcAmjukFPg+IwO3bR6h6R3nkE1cd4kyUZ1LtCjSw/iOgL+Qdzd+EQJfYlw
         s9H6SMJ5squNFTMlnkMww9paWAj91IBJM0Wm03xd8N3gwrnDhQljY32Q6TfBadljfDKo
         h9icOg6X+bNQK1UZOvBbgCH2rn4MqH8KAFBq/IKA/5Ms/DN58mxXW2lJQQHqZbpPu+TY
         Q8d2VL8kkA07hFyV0coH1uztI0SS8YMnNhdioFuO4IoTZGUgPHGclbbs902zupGIDCcN
         q9Jw==
X-Gm-Message-State: AOJu0YyL9H4Gy+L+A8scjwpwhJvHzxG9UyyIIX7fdq4t2Q+el0kFf73d
	SocSY4bbcqHh1D5RFfjNdHcOWpukqVCTZWQSX6csGr5wRmeR9qQAXCqRt6oyJtM=
X-Google-Smtp-Source: AGHT+IFq/Adya3X5OsyBfgam4Py8iCCXOM0I3DHx7Tj1w0OCBjG5XiXen2SuCIRXr0J4ExNrUaelmQ==
X-Received: by 2002:a05:6808:57:b0:3c7:498c:fcf7 with SMTP id v23-20020a056808005700b003c7498cfcf7mr6687183oic.14.1713661488526;
        Sat, 20 Apr 2024 18:04:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:34 -0700
Subject: [PATCH v3 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-2-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=hyulu9icMTNXwLbjflf7C0Xl5YeTMltbQ2XLA8QN51kHOlvp6FCWy/LJXmE38OxRPEc+aM8R1
 YR6kgYopZ1+CPQKnzpkvwUuYvw2Yq/0HsKWNdYaDF2yitkGCndYdvnc
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180449_934212_2FFA35D1 
X-CRM114-Status: UNSURE (   7.52  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
