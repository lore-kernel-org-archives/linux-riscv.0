Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE45EDB7CA
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DELVea02X8jCWzVGPlU082sKFoVQFPmppKjCgFUJAE=; b=MGRkVDobBMYTEA
	imRWKhJ+1vKC0PNTSHnuliAQOHXs3iDSVaBHCwhkWNvqrO6JMOmOFA6Nv+9MTTeF8BjySNvUnjkB8
	1yqNn5nXjHpBLRMZPStYxBNFGGBE3FIhcRilJYkg4pEdaOxLtoRcGkU6qIpqhGqweWDOlieFtAv1C
	KPjtpW8YeK7v1i3uG+teB1Xcr8/tqmHuZJCIVflOzeHgWeYkATzCmHRCODWj9tC5gt2qfGjrJXJSD
	JmyNFx5Wf2b9U4F2ZH2fMMxIyvhh+nvN1lf73fZJm/VwefND8f3wE7as/vLhA+YJNa6/6eC3w31D3
	bOO+ZCDF7JWEW/EXd8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lC-000000068g8-3ABD;
	Tue, 07 Apr 2026 08:26:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lA-000000068ej-1UUG
	for linux-riscv@bombadil.infradead.org;
	Tue, 07 Apr 2026 08:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fpUyjvSyTbzy5QP1Zl/gUHmx4JmgzxN5EinAbVZD5Nw=; b=cbFe86fW9eHtnoRJgxokonAsXf
	/YENnjXBg7HBGpy7rzXAd3LlGL6+a4CE4u3LF4TmVLHOIo3r1Wvsp+1C4XHfCxaEKgM5rvYF0uYoZ
	qhXD7Ji3wiW9eu8G4RCy51K7Jl1sTfZEnRu2cdGrHXxy9EPvZ8lBzT/54JtcWvkPOyxOsrb4yPq5/
	/2//7/42QvKevfe122TNLduMkf3bsApy0/EaE3eahEzrSoLijAO1iNUM+pnRpBa5nYq3PqIb6i+Ic
	lOwzdtDqN5tnvjxboavP3mu+ZX/B+zZIUkAtsPx6uJoyQIRfd0oCr+pfJmXIDngyoZWKNc8TBnc3y
	LAIMEdew==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1l6-00000007pe2-1o0f
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so3844899f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550362; x=1776155162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpUyjvSyTbzy5QP1Zl/gUHmx4JmgzxN5EinAbVZD5Nw=;
        b=QBbM0TNnpv8C+L8VU36VnMxxKQDUyZjkJZRz0lCuSN1m2oiTNwBMx4L0AwbvFr+Jdq
         pDyDxpRirVYkMfVXjO6abi4z+xyKMRla7kylzzMyyAA7dmtzYrDM1761BrGsL7KLfpTy
         9yqRXzJiOXrXn9TZlrpLsO7GhegPptcpce7SmK9X3P/tNCzg6airQJJ8xD+h9EtmxBkP
         QqXrcD2OmIxDmx9Cc2QUSTcuzpz4syGMldWUpzKVpg0GEiYvAnbs+vR/1jlwEgWHluhS
         1y6nqGfbezJ/Nx+myqEqlseTpU1a6jZmnxtX4oZdyQNitAPNrGQDYDOlabBuKbIj/Mu+
         7Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550362; x=1776155162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpUyjvSyTbzy5QP1Zl/gUHmx4JmgzxN5EinAbVZD5Nw=;
        b=SGPud3STA2yEDDvjuRRCaU7drIZvw4mx898qteaijf8fXHs7/kAbi2q2j8/j6iuy/X
         Ba/eKHSX9Ze3CgVMPxVyHxfhIAWHhb50/LhpdLBHpnesHKcZ9R+6ZpMySe94GjsSoIMS
         PKSzr3ngdgBMtIDPZiLMydcb4v+H3kJYxyOhxcDu1vEmzdj6V/iKvyipviSPA+QlVzuu
         ooeF9znc9B/K7/lg8WArICB2aDQLJoBtxfW1RIcRTNaN/xW+PaaEpqrJgihi5VkIfkzf
         7Ns5AYYwFNwU+Nm0gi9KuQ9OKtdpyzA+iUFvphKKHNUm5ZV/iReKkm4SVomxJkhAs8jU
         GmRA==
X-Forwarded-Encrypted: i=1; AJvYcCXBa4FELuSYtnRw+xpLmLpw+FOdxugQ56+wi5Cl/D4csaTQ4W9BfXsvbWsP3r0+E9WimA4cG47EIelpaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXWIan4Mr4rmhqKy6Vntrj3KXFkqyPZ7yVz2/w+3uUZjd8d+8L
	7u7hKdXJbbPfrpQDNF/TcEbIkraU5TxDZ1W/OBd13tmF1kjMChbw+Cl/
X-Gm-Gg: AeBDiev9vi8ZLre2RlZL9RfDewHVd+iBsFscCA8j7PjGxqnh5cOOG1D/Nj715ear+MR
	WzM4Wtpeuo1xWbX+zf2msMBTDkJHPGYBGBHYObnNGF1I/TgyaBROXrkhm+6P+hWR1JYY/IBfiAW
	ioBtlauJoQdS4M8UfDCpuuu3oO6dscJA2enrCn4ZlWO4VcWkHI+EraoSp4BnVIf0//zMojidfyH
	aPP0pYQTPAK9D+8Zvsm4wfhtFcYoNLVGQKOmLUxqFFNY5JFg0JoDlUSH95UrpzwdhM26+GE0ziG
	dana29+h83dkTMtLJaWEqKRYDFqATOjYoQJF5LrldBuY+QiwzM/0zviRYNFkxN94BjsjRJXyRqH
	PM7RcaXKYy0wWBUFAleoF8RXJ/4rROULDtIDYYR6DrQtcSpepxvdqZ7SEm7qE2IKBIR5vnuMaVC
	yHxklkimGicWqcJ/U+gIVGbWabj/9w74AyNIT/SwmLvCDDWbD0Eo1bvmyapuazhmcj
X-Received: by 2002:a05:6000:61e:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-43d29295ffdmr22629143f8f.14.1775550362070;
        Tue, 07 Apr 2026 01:26:02 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:01 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:21 +0200
Subject: [PATCH v6 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-1-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092604_721461_5572467F 
X-CRM114-Status: UNSURE (   9.15  )
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

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..932fccc609bf8dbaf3ecfe09d9e610852ac7afa0 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - $ref: sdhci-common.yaml#
 
 properties:
   compatible:
@@ -44,6 +45,18 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
+
 required:
   - compatible
   - reg
@@ -62,4 +75,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
