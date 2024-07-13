Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A86AC3DA42
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jul 2024 22:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wFWcCMGCjbuw2F0baKsW/9QtNnrd1m8WOb5jRKUUJo=; b=mx6Eb/VHokAxS1
	wSkHtMivXv7o7hcHv+vRdsWBJ/TzbFWeOyNZFiTEnqAA37P6XgOjDoAwGoaFRk3amkt66uoZ6Ol/U
	+KYg0VAWfZMoVLl2x5aCpF2KLE8Ow/YkO+mN/9kLK/yfrYO6f6uSDiAphr02t4DpdQ0rv6noblWlJ
	YY6OLg/rAA7SLLgjR6JrjW6NVCC+oZPj6ars4IuGp76/C8w3rNChqBKtIYFGWYl9eVE2eHIY1kAYB
	e2L91QRm8SdYZD4A/EjJGtn9A4KFPaeev0HX3MQIl19SKOs8xZjCTHy1MaksGElhUeQVujLviBdqy
	K1NHP4eBtfVecp4OBPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlLE-00000003IYl-0OXy;
	Sat, 13 Jul 2024 22:35:44 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlKt-00000003IQS-2sla
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jul 2024 22:35:25 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-80557928673so176827139f.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Jul 2024 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910122; x=1721514922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9djOW17Hq6Bkvn3DcF8Wpe8/RB5nd3f1kRECjv6cq8=;
        b=XTzm4Az4gs+dDzdBEIdJYJvzpezTpalrJ2lwOQvY56nN0e97+utz9o0bZcO14qmfnp
         JwGFbnf9bHoZ1ZUy5dCPwQvvTo7EK3wk1tlqphSWlez4zcPmWbgtPE7FA8eZKEPIKFPU
         qF7VLJluSBSc/NoSSsDBw6ysfB3ilxJsGEDXCUlZSV495+FgtLKru/SzOXG2dMnWAJ2Q
         Jlb7JThTktXilKxy0+M4qfUPGr+4YfHuwcIUggWd7znUREp+u3BAVCkfBLGWHvSzKclL
         K6GB+K3eucY6YgCev+MrYYGnSiKCzWO2Kygx2r8ed4fnfbAjvD0lpDTmrMEqfDIn8CwZ
         8Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720910122; x=1721514922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9djOW17Hq6Bkvn3DcF8Wpe8/RB5nd3f1kRECjv6cq8=;
        b=B+S6jJLjMJ7v7uwZ9+9a0ZQ61eM0scy9AkaDMVrdxPsV6rHp5Y8Sxp00iNlUt1/uZJ
         ZgzwNBKfXOddVWAjtzeSriv/N0++5nhI95wPAZquFfle0kx1XwWF/hziUCIr7+HAWAgl
         Z2woZkUrBSrFgoQft+AdEKbD4vp7F5Ei2mcxJwQjq3R6FmMbmM6xMEYzy4MWlY69wIlz
         0m5N0xekL8zxP4BSlx+Dl65JW74Rdn/9d1g4k+ZN3MNNbpy4iwKs/mNU5ONzNHkPqp2p
         VXgzOKJKavmYyHf2Da3cF/f6HbBFsWHgwgckWJOhvFJHAGnptiV/5jDegUvwoQ4Q0XMs
         9tZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgZUlUdY8qDiUsyK1Xfwtc+ik5yda7V9NWDiYIkgBa0WW5FBTf2HezZP/Ounk/g9LrtjFe1KbXkzwf6lsOPBXAV7mxmEgMiww68+pYfcMB
X-Gm-Message-State: AOJu0YzRiXmsdiycrXmUBmYnTRZCoAF1GwDGso91qVqCsUJpwhsWTzX9
	SrLIGarNJ60oulPM81NUk6cD4sGoKiUtdmv8TGTmDnbN7gTzEawfVHk5MqawJ7Y=
X-Google-Smtp-Source: AGHT+IGNoMVxgXKi4Huov/Am3Ivchl0iprmp4ADpiiyaxEKkK4U/SDRcp1yh3lV7jZtqlVQMYQIEhg==
X-Received: by 2002:a05:6e02:1aaa:b0:37a:a9f0:f263 with SMTP id e9e14a558f8ab-38a5910a9dbmr198272225ab.20.1720910122467;
        Sat, 13 Jul 2024 15:35:22 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 15:35:22 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Sat, 13 Jul 2024 15:35:10 -0700
Subject: [PATCH RFC net-next 1/4] dt-bindings: net: snps,dwmac: allow
 dwmac-3.70a to set pbl properties
MIME-Version: 1.0
Message-Id: <20240713-thead-dwmac-v1-1-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=1130;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=L968+RrYNmrkLCbknalApiDQwXty2dLJdHRIixXyCag=;
 b=L3rqLpVjtvL21xgmZs17aB0F6yoEoEFcG/yalWgNg23k2p7NGXFOeub8Bz4u6U8EICTfuR3s6
 7Lx5UJrPN2QAxVkpjpSt/mOQiqvngcDggj0buGRWYjAWtMSM++8boGB
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_153523_770950_0DC2EAB5 
X-CRM114-Status: UNSURE (   7.11  )
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

From: Jisheng Zhang <jszhang@kernel.org>

snps dwmac 3.70a also supports setting pbl related properties, such as
"snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20230827091710.1483-2-jszhang@kernel.org
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 21cc27e75f50..0ad3bf5dafa7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -584,6 +584,7 @@ allOf:
               - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
+              - snps,dwmac-3.70a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
               - snps,dwmac-5.20

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
