Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180C8C001DC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 21:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+FhYxv//Eh7X7pZkPNZb/FFViwyr0B3VUNlpHj+IPs=; b=g9Z6zomE1INYQI
	6ZMjj1nhLvzgwtL2xsIo8HcbeOZhgpFOJE6sohhTc4XrwVnjX8mVHvWifnTAcWNt6nLPEQOvrVx+L
	iy49eTPYvDqTD94Dim2ye6KYCtIrSQjBZuDnzDHILWPEieQx2WmPQfQ69M4foZLObPjsbOp2XamNs
	vfJqDSONHp6LBqhDRR/wOSDLj9eoTd0yKBQBZbwz0NBHP3N14ymE2Uv5/KnOySCr7wNVqf6/DzZhB
	7VwUNIaSNltAAweW+9KgeTqhGlzZto5sG+frHpDbhnBRzr0QvnLPJRDQh9qh2V+lHKnpH+woK5vKs
	cXjIFJt3uICvhfxtMAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNKa9-00HM8A-1y;
	Sat, 22 Jul 2023 21:56:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNKZz-00HM5Q-2b
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 21:56:07 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-66c729f5618so2918713b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690062958; x=1690667758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0JNllw6YvIs6jSDaAjTSNP2MDXmmerUxHA1NZNjLJQ=;
        b=uZOWBr3aaueto5xP/qXeJbRJbn0+RTbLPvbcirdo8Ffeagz8iCHCs+N8ScoNHKAR+j
         iv4TW4KcTuonLswXb2c/PkmJFpFz51Y3imRmpVFuuKnFswOgLZ97viYAiiJ4Q0PTwdTw
         Tysdox8ZvktE++Sr2PfauiPWVX8v2zHU6mgY5LM8KWK/GpUNh9BCdQfwS2UEMM/ramYo
         k19nJzbUj3EnuH2QLDWmB8eTI+WDcl2vhDjgvM7/P6n52YJT5yO6FX5jCc/EBOIb8gAf
         HIxVfm0p3fEwMsO6wheT1oEYzOJZ063bH0eLjRElS4MlqAaA2XPDPnb7VWbdS30u/AsW
         ENXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690062958; x=1690667758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0JNllw6YvIs6jSDaAjTSNP2MDXmmerUxHA1NZNjLJQ=;
        b=KN2KCFTG+fXWVMfnaeY440N9bHIXQS2aZGjQG7nBhfVHI5K+JEjguj2u+hiU7ac3cp
         nsSkKTOFtRQgQZfhVFr4elLgE8S/Xi/MqZLWh28+KXoD17T89N0bGn17pB+QBQYN52V9
         0WG0f7XPc4N6NZKPPmdkYHEuWNLescxONapJv8zSvdNqBfI4EadmXPEHNhhxlE+DtAzk
         jF7xYS1QBnhDU13CF7GYpRYzkGBYDC3aYegBU45mnp0ypXLG7Xf5a1FZohvTcV5izCEW
         w/QPtc/LvcPwMK8h7kp0oyWBaUoaOET0JxKW3kH3zSXmnKMVGQ43Vu3bPGyN5SQQyH6U
         h59g==
X-Gm-Message-State: ABy/qLaUqTl1etwrs6Uu2BWOsewzeI9l8d+K2qfvWrrgk8nwUoZ4dES/
	D/YLo8Uqt8pn08JOIH04KtmrGg==
X-Google-Smtp-Source: APBJJlElPqAGVAXFzDAGu3qSK+Asy0AZaCO/U/XwWIwm+ZAhMWhOE0kKZtF1s7sCXUOlBljg7Xj1Mw==
X-Received: by 2002:a05:6a20:4310:b0:11f:c1a1:8c with SMTP id h16-20020a056a20431000b0011fc1a1008cmr7856875pzk.54.1690062958091;
        Sat, 22 Jul 2023 14:55:58 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2a8c:966f:392d:7230])
        by smtp.gmail.com with ESMTPSA id e23-20020a633717000000b0056368adf5e2sm5517642pga.87.2023.07.22.14.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 14:55:57 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Sat, 22 Jul 2023 14:55:40 -0700
Subject: [PATCH 2/3] dt-bindings: riscv: Add BeagleV Ahead board
 compatibles
MIME-Version: 1.0
Message-Id: <20230722-upstream-beaglev-ahead-dts-v1-2-ccda511357f4@baylibre.com>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690062955; l=897;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=tidwSbBXYqHL7QLAqHRbgz7GOIH+ZD2CBcsPW6ALH0o=;
 b=wz/iUY0XPRM3CLWBMCPorTf2YRAlE9UOWlPEJn/mBs7UuUiP3tnw7Af+gWJgqGvnZsWKUs+kR
 DhcA5sk4jxGAvZnmBVkpD3MGrKDWSCq19X7IMgs2NpMimouDBVKAz3E
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_145559_851424_BAB8DF72 
X-CRM114-Status: UNSURE (   7.79  )
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

Document the compatible strings for the BeagleV Ahead board which uses
the T-Head TH1520 SoC.

Link: https://beagleboard.org/beaglev-ahead
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index e62f6821372e..3b8b24812a24 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -24,6 +24,11 @@ properties:
           - const: sipeed,lichee-module-4a
           - const: thead,th1520
 
+      - description: BeagleV Ahead single board computer
+        items:
+          - const: beagle,beaglev-ahead
+          - const: thead,th1520
+
 additionalProperties: true
 
 ...

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
