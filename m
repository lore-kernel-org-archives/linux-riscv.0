Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F112BD5B854
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 01:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vRZglKLEfA20MvheyOFNHhpTkP9X8TSERp3667OJO9Q=; b=n0vX4nBt10Yosa
	EgfXvm4/QpMvUod0RgmauFsccycKCOXyUKIoCD/hCFpDA9HN5NGTBoZeeFJho8it75gPVBMEtPG8a
	PXMKTPF/LKybHR/jrX1t7pVeMdZrBWOQms28i4kJJeij4HR5FY96yKn+IZIxDJDGcYufpPn5xw2Ao
	h9zhlOVTv96H0SKKPEetekAv6NDLasTl/MN854iXgOCM7zHbR2u3slwQxO0pqM5tcutKOhcrDEgg7
	vDIPmnIwmzE7ABHewK8kajygfUi3dd/uRM5CyP/UmzyCQ3zzkoHrfNPAZKfzrtaHzofC5Ac44lMuQ
	QMRSxJJIA553k5oF/eFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5azc-0000000Cr4P-36u0;
	Tue, 29 Oct 2024 01:25:56 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5axE-0000000Cqkd-2Ywv
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 01:23:30 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-28896d9d9deso2348032fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 18:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165006; x=1730769806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sk1dZREUQVGIecYh311eheCmxNasMewq/5f/DZTF0Vs=;
        b=Ca7r5d+RFlt07zhLMmU19k6RuCgyZ3pOCzggQv7KJXbRwSm7frtgvd1ft05AdnsnoI
         qt7RCiErwvT5lmgx16DpVwwZtCzb7RCu6m3GdC0IQGOCaWWU/Be49qHNt6FfmEv8H54k
         f8dXdGBUjEZsqBR9FKgpM8Jxrd25On3WfPQ4a/etQ5vpnkTnfVtqQARQsYT10YmeSZy8
         NWU7FW4HJOwh1BzIFfhonAOmZJYTrtBowbAizqW4GdOPv3pt5QEpU6Mk3v9eCzhorX4T
         Bkf6cHTw0Km7S2D5G0q0kavsyEKxrHOzFppKen5YcuQ4NopOEZ2w4sTLT/h6OLmMljAo
         G+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165006; x=1730769806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sk1dZREUQVGIecYh311eheCmxNasMewq/5f/DZTF0Vs=;
        b=To8Ojsdfu2EYNBVonYekI0p6ViQ06n+sk/hvof73g3Ek6T+T4PhZiCPpfUbeUnBcLz
         k8CbqdtPHH3rF5lM8y4H3D7KLhr3cPF4pjMikjqXJb+Cm750s4qvsrSREzmIqpakAoyy
         K44fYkR5lANeBwdfcPPNy1KlNCVaMw1PkRANDfwLyG78sIOfGyPn0c8zk9OzoFSjFH3W
         QIagQhlGtkAMqIrsfh315ae4unnEZcL+PAHTl9empgbpdqf4MaVOZNDQA3vUeRnJn8hq
         Vx8I4thfnGvsQ+FHPz5MUU/NO4+sCkOs3lkqX6AR9ddJWwW4XBcU+e4dV8XXTk2CoaoM
         z/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXzkYe01xhTrSG5nFU7OaK4CwAZKh1dSCdoFZpc6gjLbag9MaV4yjtHDIgjS8cJ4wgNxS3nY/+85dIKCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5hd+/Mlbw4G1VCOg5tq5yBcBKOI9t7kQy1TqY0zoADxDew5Ym
	DD9KOys7UKsxrcLtOdQd05LkjEh9F8FDdvfJw38+E/bwrKNqGlz3
X-Google-Smtp-Source: AGHT+IHWlqEV6BxbZIE4WDegspeRBJZliX4tFPnZbewy2MWHbK07FHcV9Rw3Pe924sDNMakmCs4aYQ==
X-Received: by 2002:a05:6870:912a:b0:288:6d23:5f24 with SMTP id 586e51a60fabf-29051d493d3mr9099606fac.31.1730165006551;
        Mon, 28 Oct 2024 18:23:26 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2903824c853sm2494682fac.51.2024.10.28.18.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:23:25 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	inochiama@outlook.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
Date: Tue, 29 Oct 2024 09:23:12 +0800
Message-Id: <20241029012312.3448287-1-unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_182328_675860_B35AD1AD 
X-CRM114-Status: GOOD (  10.53  )
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

From: Chen Wang <unicorn_wang@outlook.com>

It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
<dt-bindings/pinctrl/pinctrl-cv1800b.h>.

Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
index 1e6a55afe26a..feb4785a3fac 100644
--- a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
@@ -58,7 +58,7 @@ patternProperties:
           pinmux:
             description: |
               The list of GPIOs and their mux settings that properties in the
-              node apply to. This should be set using the GPIOMUX or GPIOMUX2
+              node apply to. This should be set using the PINMUX or PINMUX2
               macro.
 
           bias-pull-up:

base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
