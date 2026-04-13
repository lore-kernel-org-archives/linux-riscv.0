Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55ADEBFD05
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjB5AICRuVEym7dvbg03DMrrLMdb9flNDHfQeJlKA04=; b=iBGYNmUzJfvsQb
	aHrRiQ209/CC6zwDtleM1MlhCA/3VkK8aVrHMtX2bvq6tPhIp0m1XuwapLcZ8tGFsmSympowxc1jo
	+QpMKZjwSqvspahCPVs6T5Ml9Ad+ES1dJQR5dF8LBVKlAkRN/0fdz6+i/PGGa1Xeyh7KHXydbtfdc
	4uEr0toMmdltMX8QX5fOxoER51pMHsh4IhFygDOg9KGLjvggcQUB0sNJYTkkmjQSQydsEWnidOT8q
	xgiqXsr8ra5NvQ9d0eThX054G67dahLmTAzYuxSzvazp2TdCRApvqJOE8FJog69zIQO6XoX6/4d3W
	PBn4owZeTUiXW11PYzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBfh-0000000F8KU-0bEq;
	Mon, 13 Apr 2026 07:25:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBfe-0000000F8JT-3BaM
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:25:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43cfce3a195so2498888f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065120; x=1776669920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=EATJZhyBUkHcuMacprK2QWUK1bNoKlxzd1CODBiVtGyVdEn25g1BdR4bPJzvqOeF/9
         Ri6xRMQgG2nMb6hKWYLYJVzOcB4qznQnpmOng/3IfQPDULfRD/W4iIycvInhmPIdpjDH
         5QZmttN4fNtB7QfsqrEqiRbmDdBToks6bGngG57bDJVpbm6Xche44HRYt7ECsfRVzRQb
         lUKf/Ty+3fVpBAqS1OZMopafjRmQAAaLvSSV87sczc2ZP2+4A1BE/pmaeDxxCySOF9OE
         oy4S9tTwZAlpBeINSEruNweBB7EBqwm1em3S7fD5uQggn0MhGt0YpXh46qri8WjHNtdB
         hyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065120; x=1776669920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=f+gUPMONmGXcoEzN+p5u2+0byll0G19RnxGuN8okHNBWO19EuC4GAb+s2sRgIRTuMm
         3SbpHtbjT66FY8YS6Qr+Z3nIqM6q/7RqoezkGd2umItiHuhvANmznXqdg8/WJiEdLJ9W
         B6AyDECr9KK1cwMjjQgtmVb99G/BSFPEVmMaD8ZMZT1URkq8QXwAffOaugPop0L1ZC7P
         kORl4e9YJNBo/HWXwWmFyIyGeTvHFftm6JYlyihDV741gCtHC3Up8L6hYddVhHwYhxje
         /7crIX0mpXt0gHJkJclWj6QKQYituyF5DY6JODQVL3TswgXnhe4rw789OPi0/Xaz5DjW
         +CFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oOZzpA+maxAKbOarlJf88z1vmpV76bh8B0o+l1oPRTqfllH81acXdpMLEtUwkUzytap2nJb0jiyyUCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCW32sabbQGYdHd4O2KgXY0iR/nrEr4oE5u0rARcuiBYVgc6sj
	9bqUWhObzk6/R/+GT/FWNPJeiSpxHr03wxNXjme0BsG+obEZezGpi58U
X-Gm-Gg: AeBDietcIdFVM+55p+diqg0unKMYwibBGntLybx29VDh0SSH5cwlnno8mSrmvIe9+qI
	iMOz1o/uYvzcc5niZi7TPZeHCSeG6Wqwsdsqs26SjsTT8nh5SnQ9WxXzFzzA9T/C0hda47t9WZD
	jUV712MqWovf2A2YWE/Q9hf0KD5qWZ1xNPmfGCQ+JzIjHQJ0ItYBvTMj7PN4FAnzRf2M3STRKqO
	GBh46Xbg+pSAyczLhxsDQqJTrIx3eyWP26mQJXZ9e8IrHDWGqUHBVkMUIHLfg+v/S3TI2mvumoQ
	dCKrcB9aY6eoBNZBuJkCavKzj39JjstNXT7I9zrrD1rPF0vuI1SdkeqHnXp8XW277iJwigosYui
	F68Yiz8wRmT6iJ2iECiDH11L4kxJcU4X8NwBIQPrzJ6/7SRr5QOEBC2FE36hPXPMPbKaiIyx4Z8
	p2vKdUfPh9ZtjXTadpYViJDRD/Lwl22vNDxVB7IZwLdTTJayu8llF3GmmGPEqEZqNF
X-Received: by 2002:a05:6000:24c3:b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-43d762e7865mr5391556f8f.7.1776065120340;
        Mon, 13 Apr 2026 00:25:20 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm330441f8f.32.2026.04.13.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:25:19 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
Date: Mon, 13 Apr 2026 09:24:43 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002522_822009_BB6B36E3 
X-CRM114-Status: UNSURE (   9.79  )
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
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f..34d202af909f 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,18 @@ properties:
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
@@ -62,4 +74,7 @@ examples:
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
