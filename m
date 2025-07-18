Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82347C83F34
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwjVbCemCYCRXF0ipjKpiG2qRx7ot4DsNofusXpc7nQ=; b=ycn++pykehHCp/
	jQaAXqo952llcU8daK9JC+k9qu2Olz1XxFnGus/wZq+DAeyz5cWc0857JzWjey7Das1VmlX+CcnN/
	D1kFw3bAGYMYzt4SsCv+O5FHg+r+lFL2fDky/ZZ7oGrc6SMPWF3n8cExRWo60bwjZ5R6S6OoYqF9m
	S79lVq1dQCcvFLsBuqsddFbUBr6nNs4l1l9pq2q2dWewZ8Wxt+C5DxaN+baWB/5nKfO8m94DhCT7D
	1btVrUmlMS1FgfwWVZwNP63GvluO/8DACRITKNFWKE7uqxWldTW58onLsEnfVTPWswDKkp33AbzIA
	m/F0SDWHbPH6CW1TEZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgw8-0000000C6Rv-41vN;
	Fri, 18 Jul 2025 08:59:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucghh-0000000C4i2-1ryY
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 08:44:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso1469200f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Jul 2025 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828267; x=1753433067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIjJ267yEtDnmiN+Y1fTBADY4HhOVJqHNJYRhatCK9Q=;
        b=yBYGVIT8jIm+bmX1fGGCKzjoMlExEKPJ/s4/zvLbUMyGfnRo+hSEa6r87NCUtYjsdv
         ppbBeCRK2EPlao50u3pWGkSDgAVbiDSDGx3+GbPK9bmMScDAZHoEH+5/Kgbcl4ck1SPA
         KY1u0I407rdCYOIiHCIuTWPJGOWxIL8N4tiJHnFpBkC/lIu7t2RvUfqP7aGTIzbX1TUQ
         L4GfFdV04GqEBksRlXnyGmM9faHDFIUspTzyl0SpaHhxbBzNdTYpA8D1NTdcQLK+YTRe
         yZTOU1FeeNYVyq0jRXLtVs0fx/q+qY5j7371Cwm7mgI1gHUnRsxshUFlIPwp12Tft3yh
         /Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828267; x=1753433067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIjJ267yEtDnmiN+Y1fTBADY4HhOVJqHNJYRhatCK9Q=;
        b=LoEQLlYhBm51JZbT8MfQcPV721q7COf17SesNm6Aly/fLUlrFjdqgps1RKTV8aR0WT
         kKJlc+mBzRWdqvYCVPV5wqpXGwnG1XEXFJ0sHEd0sKw2zTxGaprDJmBpaDud494VTXpn
         JQQYwuyOn+l8M7jqCYroUyG2gxfy2pvYD2yVUPpvlwWv57IERUJoN89WPgeVHAet1Ed9
         Ld0hEn/8rPQC8cyOX0l7HJYH0WfUsXwkGlFXC8ayOBH5osBUVhW0BP1Urg0yWOy/7HFN
         qhJN27i/CCa7KkoUxEiXLqdT3vZDHtfzREEi+snqyXd/EfLb4rwd1oOsMm42mjIHszbr
         Tvfw==
X-Forwarded-Encrypted: i=1; AJvYcCUWn1alPrOarzy9VBe7ka+cduBCWnD2dj+7IKwin5/uOC5ZYk9N6cXn7/sjPRyA6VPyfYrvMieh89GDsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWzRJ9JilzMyNxtmmnUlmUlktDZO51PkosVbQYBia0yPzA6zP6
	TPf+dyFJkWosSxteYiMVyXb2vSjdt1naHY+cVl6TAMwO+Nb5JVs/orFgpOd4zUmKbf8=
X-Gm-Gg: ASbGncvZDUVokIHXlJxtsF/dSeiU6E4H+b7hPEP8+DGcYg4nXMk1GM7evHt9+GfdoQX
	S5l47cI3IXoIogQ/dlDlC/0Xf+RLD0kdCyjyAicd/y8guzhysvDw5rwWF35YCUjcv5PDrhDQF38
	T5/1yC5xjEZwwIjs3veXZC3Rzg/8vlI/pzmgNJpxV5W9R45neELbBdIQk8s1vcXPXNXWeMbgLx7
	rSQKX6UYvy4QahEphL5I1a+70iJAKxAqAIQ/XVuqnA4N1rAeHxd+ZfFFX7iiwELdBNf1KCpZDO3
	a6ieq0rUn4DjHBWZLrLuhlbDQaNrWX0whvvaaIWWdFqHuauQrsvzx/XTK7xMbm+KU8+OjU6aqLN
	w2G7nc6bx32kr5e3Yah/q7+xrQKcjdL3GM6qig5lITy1UnQf4
X-Google-Smtp-Source: AGHT+IHMJeUs8RlmFkrQ9WTk0wqJZT629erQHVUIzMmI6akez7WS0GHbIEYfQ+fiZr6Q6Fy6PniGIg==
X-Received: by 2002:a05:6000:2385:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3b60e4c2194mr8115453f8f.15.1752828267262;
        Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:26 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Fri, 18 Jul 2025 10:43:38 +0200
Message-ID: <20250718084339.471449-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_014429_713687_F9793177 
X-CRM114-Status: UNSURE (   7.72  )
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

Document the compatible string for the OrangePi RV2 board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: No changes.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 077b94f10dca..c56b62a6299a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - xunlong,orangepi-rv2
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
