Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53ABC04FF9
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKeOL1Uvz7avTyxtKrxJrrk7tTYR5BizqjmefhC7oGw=; b=fJjs+rbfQ37xqL
	hq7RiCkXiKMBzBnTZcAiFCqdc/05nHO1KWmoRwG/Z7XF1aQEHzD1teUT+g9XfG4OWsJxxpyOIg+F0
	FllsB1cQpXcpQOF5PuD+7+1r2Oo0Z1B4fsCYaDamHY5l2w8i3Gu3k1IoBjMOWYe1g8R6jDpBh+F9/
	0KHJMby+5xDXjrMOYMwwT17l826E81Gs9SAIOxuaz/fUWcajpeUCVkqyA8VYRaWGiLsHhtgqANSp5
	h95Bs+Dhzp/2ZBwuKMzePL+BHzv9NR7ufHeBFUGiINu4XYgqjpxjFUy4vJs/0vMksVDfZ3ntg6fo9
	qLHidHktvFW1ojOr/oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBN-0000000Akhf-3G3n;
	Tue, 16 Apr 2024 04:12:33 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaB2-0000000AkNE-0Oa5
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:15 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-22ed075a629so2392207fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240724; x=1713845524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix+javIgp733xv2R/th8q6ndEXpLyg6dF47BfihNDR4=;
        b=VuBlGUGKicYS4mK5uWkFLyKBUAj2DS9V22fJju/5u5J7hRfUWkPKm5SFtyraZbuj67
         8zSvxD2IJVPowpBQBU01gibMXJremMNOrCvsg00eJzs00KgesjYpwua6Xi4acjzlbjPC
         k4slTus04ZPURUQ3epdZ4pQ1i8edEVM0CQJU0Roy3yMRvGePOlTTw6gx2JGDcS7s3G8V
         TlmxpIgpRpoCgjJPd4TAYwh2/ntYz1JsMRDUfYs2brD4jCBw2jMqV4rZYZxBt5D/L5Ln
         S6Y5uVJFOqatnBBvkl1Punw7ggKA8LqCtVo5lHfGHs1nxFcCuKB0SJ4bW6TPJ2gpWhst
         E/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240724; x=1713845524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix+javIgp733xv2R/th8q6ndEXpLyg6dF47BfihNDR4=;
        b=W6iI7za3qKGhuLDwa+NLMeUWfcqZLYaLwXFm4xHHz9MYQw1PwAKuO+YypbilPJWYQL
         aXBdXt+Z14KB8wQ1QkjdfuEyPkmL+e5IpPNSC0yc0CLarpSpNzl4PBCBaLFLmDI+it8m
         W/aaN+caQGAsGF2EDTf2RjXEsjXPXIrLay/6qq0zLjc9qaE8aidrc6ObLs8x3YZ9grjF
         3vyvlZDwGyOlCSk7ZS7lcLpfFqKezPvdhxnTWN3UJVQlqbFrIFU/v4oLVczReZjMNbFk
         CeqxswbsVo3TDJWKjnw0yl9OTgxNHvZV36qRuWjLTt6qKUncRNEj32asnu7ymS2pNV+0
         Qo6w==
X-Gm-Message-State: AOJu0Yy/3Xf3KVS+gkkHnsM9FdZWg24nIO7en8INY3D6VLV19g5zM7MF
	br0NIaSiHI+pzAfd7t0pklw7NahHoZ3DbbAmSlO3H+cRMBVyX/lFZLXvy7KAXLepGc2NpTNc5w+
	E
X-Google-Smtp-Source: AGHT+IGbXDdvkRXDVqIhB5dqemFYTdy2m0goN60loDY2Leve+0R5Bqf0uSbuOhPnRHK/s9fJTR1bFg==
X-Received: by 2002:a05:6870:1584:b0:22e:912f:252b with SMTP id j4-20020a056870158400b0022e912f252bmr15110674oab.2.1713240724489;
        Mon, 15 Apr 2024 21:12:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:03 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:11:59 -0700
Subject: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1713;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=LQrrqBv9wvdBWycpaHPL+H3slFz3ptTYlzHL6vN3eX8=;
 b=pEvFaJ5tW8BRTsoIuU0vqAG3GqiyA34hephuzDd9Vt/mEXWI8V3M05nZxnw3RjeGomtNhqbaB
 ebM2WLKfKRbCojcWa3e7jXDiV067vSqaTtljUUTJYSibWxbVYFA+rxO
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211213_384431_B652603A 
X-CRM114-Status: UNSURE (   7.77  )
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

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
35e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
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
