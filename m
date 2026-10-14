Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E3DCC6B29
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aD1YT+v3IZ6qIG3RSwkchp6JTE+yIsFW/0DJ2mjbM0=; b=TD2OznmLD5Ok2X
	dtTYMsYFM++dZ4ifzZrg7FIcIjlKN5bjmsQYnw7Y4DoRMg3IboBAcTx5or3FxbZbVne5MqmJs/2XE
	X3nELUm3yh0ISeCe8ZXpFXOlSIwxn4FHD3qqv5lIGEZxo898grz8BlGWtcKZETI1AF8ghFArLTDOa
	M3OZIWgM63DiKmQtOQSDCNQ0QvgVuGE9Nkq5cP4JTd5acjSSEdTK9+rGSA9eZ6ev1UFGAwA4RdRQS
	KuphkuNyABPl3VxTjcx5rDzOxR9RVLntq5w8aK97U6/YF/vIarVm+lnT70JALTlImFrtdLRmgjxRG
	7eaR3x72ap/TejexX3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuEx-0000000Es1w-30NC;
	Wed, 14 Oct 2026 08:21:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuEw-0000000Es0S-1gBv
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yVCZM5zURPRE62cvJS0zNIsVrphYetwj1gaMWhP5efk=; b=nO7oo667DCNt8J1FSGQGyq/tBS
	AhZaSDVg87S7ei+TyLhZnz8znzRDrqiQzc60ecxBw0KpJq33rhVHbp+vagJIHXoCzQSLi7jQ8BLJ0
	LYMzykqFy/+FVrzsQ3bi7ZYYEw4IRlO/cH/dnkwbV0Q6cr/4dSWvQbGQE18wymanN0ugg49+8OG66
	tqTOYpuC2TjyHgg6a9PG30yfF7yOG2HWjyjdoNQpatZkgDPaXT7SgWLdXuyE0fR+qopDkRS3BwFKU
	GRwC9Ao8tnDN8E4h6v/cEGRWkbbCc/e/mGGBuyp9/l6ShrnH+HEOVOLuAC6IYp+okr1qiIRwupcFz
	7nfrA9Lw==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuEt-0000000GUiq-0bWk
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 08:21:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2362400a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966089; x=1792570889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVCZM5zURPRE62cvJS0zNIsVrphYetwj1gaMWhP5efk=;
        b=VJPWNbk/pi14CtSWdduvaEexCh6yqwUM5eGhJVf/veCCoxXu2KysLZFu6lW0ddE38c
         7DNNwpKMWsYSuloeACoyt7hIeQFV5T8JCY3+xpzEnQrEKi6aSDPhgyZZjoYOwZ20EJSu
         pH8qi9hhoilPHQdePUn93LyKenn8dnR1k093o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966089; x=1792570889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVCZM5zURPRE62cvJS0zNIsVrphYetwj1gaMWhP5efk=;
        b=BfhUxBIKTMV4eOCe+zXdFg6zHOGn9/WWDApgYB+TSKff31QxWQcOHI0WATHzs6yPKb
         zjDoNjuAm0lI8NqBU/lbAEPkwJlm2HCYifhAo8sxOK8nu+ghsdEefSMZpny/2dyqLTbP
         CN8ORH2zN9fbI0iPzR+trCJvi0SDfRCpKy+WNOsORL6JqP1szvcRpzy3/rdT/+8A55Xd
         8+lwFnAI5pVDh5ouA6HBNBBOQbgFyYCyCjWVXdVCqIpyRAdCiAy3UbecBDZ4LO0rngOU
         apkabUVlR2h8v8JP8fdztYZ8Qdw1t/vaCDQMDzweBjDQJXrMG8jGFg+OHhnQ5pZoM9gQ
         4Z+Q==
X-Forwarded-Encrypted: i=1; AKwUvByMwN2dx9p4zK6co0+bsGnMm2i7Sg8KtyybbhPFuR8FnCd9/m8C022k2NknA6LgSWXq5+E5yazLdBcRNA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJW9Nnqz0Z3QHGwN9IDaMNoVUfoYtKLy0OEi4p9i85JlnJ8w6oE
	eBWDpPV7G/I49ufLaai0kNoKY4rxONpvD89Ep9Mz5Ievum+j+Hz+bL+NgqIdblgyXw==
X-Gm-Gg: AYBFou24rgOnW9wc3oNYINAk38TNvtGqE5t5LRrdJy99Yj69OF/n0dLq2bhxTslMdN1
	l2cdZAchJ/4BjnwhAS5JYewE3LHPSbmQI9i0YD3d3/8+CX8EQtZOjISlQ9evh1kGIwsr+MNVIW6
	tFUM9QGnbqNKCPkr8boayQQijn3Fina+/hg5BXdCfgh/YWtHW3sV1svTMaR8wmR3aXtPV+z7q9F
	i1FWgNE8nMiak8HCE0zdOy1xU+QZo2aq580zU0J/koL32Z5Sa0tKYe9Nye0ilHS28dBlXxHwNtE
	g0bW6pdNaVD+7Jz7yG6aM4y01q69yeOqsWixAd6vq47AmLRgY5QgCLNPOAeQ3zWKOKtIHX2d+VY
	dcrLHRoInbKPfSTeVHGZBUaeXJzxhUiD9nQv33z3v/Iwo9yCmTW0V41w+n8WAuQg5+S3oEuxZkE
	F7ckw/QpkiBfAO1E6m6idrDv9t1pkJsy8JtVhib6dUzmlla5b+bD4ugZkZwlWd13+dSFVQWPHEq
	QFydluCUIYtYoJn7hI/UKeF/Rg/SiWzlDf2DyyuN8qvw52t1P9upXK2qQ==
X-Received: by 2002:a17:90b:2b44:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3ac7842c19bmr520798a91.15.1791966089278;
        Wed, 14 Oct 2026 01:21:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
Date: Wed, 14 Oct 2026 16:20:35 +0800
Message-ID: <20261014082037.1774672-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261014082037.1774672-1-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_092131_659044_E297B965 
X-CRM114-Status: GOOD (  12.09  )
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

Besides hard-wired downstream USB devices, a USB HCD's downstream ports
can also connect to USB connector nodes via OF graph, just like with a
USB hub.

Allow a "ports" child node and describe the possible downstream port
nodes. USB downstream port numbers start at 1.

Also fix up the address portion of hard-wired downstream USB devices to
match.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 45a19d4928af..24df99dfb243 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -29,8 +29,16 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: The downstream facing USB ports
+
+    patternProperties:
+      "^port@[1-9a-f][0-9a-f]?$":
+        $ref: /schemas/graph.yaml#/properties/port
+
 patternProperties:
-  "^.*@[0-9a-f]{1,2}$":
+  "^.*@[1-9a-f][0-9a-f]?$":
     description: The hard wired USB devices
     type: object
     $ref: /schemas/usb/usb-device.yaml
-- 
2.56.0.212.g129ede20d9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
