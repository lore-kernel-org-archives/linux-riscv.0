Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA31C04FF8
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8aoWbXWV6U6l/voI477qA9hh6DBr5sbmOGevvva47I=; b=HQqFmNzWulmkK3
	vm5btK4tellWCU++mha9alCmIeyxBCrLN0CqPHGvgVYhyrshHlzQT7bArRIzOcFFWEDfmOlHI26Ji
	4ydbA56iPleqizCy/VnPpKdNw1FhYdTf/nc287VB2NZqCIdXa6/SzOfaKeD+ULtFXK+xmbM1XlgZA
	FvkJeoKNy/jcgY+VE+EKysKH90F5iyYC0WGEO6yQRHN4N6ovYU7NMIp/PwgwB2bNpYIKoiRqKyPLT
	Ad6MbDCoCA3l0FOYmcr/nnbkgax1Y/nrNRY9uYi6YWvkdgwc/fjVSIj8fYtojQMdT6zowMh6eP7ob
	xpakIN2+5VrIUJdb8SXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Gy-0000000FAjf-0DvT;
	Fri, 12 Apr 2024 04:12:20 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GK-0000000FA8u-1iKd
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ed267f2936so458219b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895099; x=1713499899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWqc2R+QwLGH/IfsTNU6nT9Ab7JPZj7mZyuCi9mmuFw=;
        b=Zm2f+R+yFfRjblQmyP1pbOCOQ5tBFffjIQK+4UafEB+J3I64MTZiT7gPsNja8qVApd
         pn6zckbQCJk8ZH56rnBtR+9dNwewNmC9nWTxEJ+pzDlGuswFAq7oKAyJeK/I6/G0M4ne
         6N/OD9tcHt9Nvyb0xGhh9O/ZgGip9oYVEMhCfGvze1nFhN0aO2y6iLB+Sy/NqS7D15ZA
         Dc5u7veL/KegK0spZoPjWBXkVeH+oIlEcxlP9lmOSil5QJSFdmY1NbH+P9LDxBABzPTJ
         /QJ7M1vF45EmqxDDjIE2/tvgHdPEPZ8NXiLPxuYpNLz1gk1Ji/THG/KXBDM7nj2eZMdt
         wVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895099; x=1713499899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWqc2R+QwLGH/IfsTNU6nT9Ab7JPZj7mZyuCi9mmuFw=;
        b=fbOgfJapccQ26HshMcAS4n7ol3nsNSDKgYRV1HAnkOvttcHboJD3jl75vcAw9uHgKK
         h0EH5bV4RAIrdRGlqGc9gAGNXJAssq8yANCO7vI+84up5vgeISZza+pvGOkoewI5kpKo
         zE1WYrQBRJFmeoiR1sYYMQInjRTxhsK+dgzmzw2u9xCjypD4/m+U+YQa6tVa+QULWRPt
         i9kA4eStbhgykCiNPwOicpNhHCuFtzmUkNymyDZvq3TguKPdE6HduvZrQ8s9BcYGEdcj
         /MEw/2RNRiTD54/harstR4H626cv6GVsKnKdOrCH03lJZhjrDVwZBNH8ZKO0x05WRLdH
         xgeA==
X-Gm-Message-State: AOJu0Yz3/3tNyBX4rE/cvw0VH6q6rlKRqMQ3vbl3641xUYCf8GVVyFz0
	EN0p2/F8ijqmTFSi0v2iqcJb6eePnyRnxeMsgmr9AUBSjzv2lyjjOaxs7qlNlaM=
X-Google-Smtp-Source: AGHT+IHR8fyFIq+7WC6olvISWPBZK+gSc8ZAQhMIz1TmsOcAmc6LE/xL4APsxczTe2i3JCQDGgyNtw==
X-Received: by 2002:a05:6a00:806:b0:6ec:ebf4:3e8a with SMTP id m6-20020a056a00080600b006ecebf43e8amr2047750pfk.15.1712895099099;
        Thu, 11 Apr 2024 21:11:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:09 -0700
Subject: [PATCH 03/19] dt-bindings: riscv: Add xtheadvector ISA extension
 description
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-3-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1501;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=l5D95hH8FM7SAtXGBZJnPbxh68jDhVeawec/Y+8YVoI=;
 b=g99SP4A1lgLMiz1vYVHPQl2CSYAS31y2/mI95/W4kMq8xSrBcd147B21RPTt1pu84X46SsDbu
 sCCD1ypar9sBo0X1VI4kzwjHCwYOf738ze2tE7vdJ3RSGPYSdl2CrhM
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211140_925561_AD5C8DC3 
X-CRM114-Status: UNSURE (   7.19  )
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
Github page [1].

[1] https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadvector.adoc

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..3fd9dcf70662 100644
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
@@ -484,5 +488,10 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation.
+
 additionalProperties: true
 ...

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
