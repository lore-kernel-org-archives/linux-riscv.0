Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E049C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 03:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRqlt1oER9dWnpq35cpRgQpxGueABn3xCvRS31kOds0=; b=ZjL3VTTCCYHxZP
	hqv28l921kfyzYhYukwztfcEVBKk/ZXVF61htt+t5s+SHRx1R2D8Im7TtyqF5Z/2NKltRNOG8zwip
	heRVtarkay8jPTwKjeWqHaYM9AdpBXWgJaNfGPaCatdS7KbXRv1cXalLw8tQPc54MGIGUJxTqRTiG
	+fMKeSwPJ05FTT74ZO4Y8nxlbfYE/lO4OdwFntNGauT7GngQrWGJHTIabwalUvHXLb+NFzKfcXMHO
	5xSlJDdV4HVaC0q/pp+2u1FhiilrgZiffXxfac4ARVgwgEUv/eN+zTz8XuFHnlnbsfR1ZVB+eaEyy
	j5gar89E5tztFe/Ea0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSvJ-0000000HY3B-3Zas;
	Sat, 25 Jul 2026 03:19:37 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSvH-0000000HY1P-1mIV
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 03:19:36 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca034c989e2so560503a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 20:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949575; x=1785554375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSv4z6+j0ETigrrBAdkCkvY/jDNAOWHrT+gEbT1n1Mw=;
        b=eDbjJKk0vAH03Z6ZtjRFJ+CAPt+vjg+jM49y6yPkVSzDwWgAiJVAKXTpSf30vgWFcy
         FHyumjf0LcDNtU47MZGQaO4PiDQAEnYPkaqRpPc5bkrWtO/Z9w6fgs+XfoLD89pwFvM6
         cox8/GdKfh9u0P63Jfz0bV1K2EoqOAk8sJkxWWWfbeqjavfowKg6m/vZKMrHqogypHkN
         qlMFOyl+PFXlNNeg7WFo9h+T2Sl2X/5KDvk9nOzNOjSJ+IlY3+qbFxCK4KbhtsL9JpVE
         xFN2hsA2kMROC12n8ig8x+ocSTBTf6SPCC9pKAlq5hjE9dxAMerusqAli7F/4rFsIuFS
         2t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949575; x=1785554375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSv4z6+j0ETigrrBAdkCkvY/jDNAOWHrT+gEbT1n1Mw=;
        b=bK0jInZ8/eRhIsB2RO0nZnur+W3PgMiAatVye4Pe3zCebymdaQkdXE3FlxZ6mQz52Q
         Sfnck0MJpOxGgxxgSQX8HpOQ+ENGDROpxC/xdcvMGnS5N3Qnov8x4mqCvOfbvI+c7TjY
         IJFN6pwmawoEosQS/3qTG3TdCSRAyerGyf7L4ckM2GH26Bim8PGoSYDYLjb6bu3WC9lq
         FjVQ25HFsuK+f6rKjL0AN2AX1kx1pK6tSGrx8NR1VwRj4ZwqHNfvHEy0V+hJFD9VlJsu
         Ad+jiBd1sD++nCG4LeFIOIY5Va2i4al6TOCq52ppu4cBvLSsj6Dul+tm3ehWNg07ulAL
         1suA==
X-Forwarded-Encrypted: i=1; AHgh+RohijSpmbKrfj5a/0TcHnHSjGj3HunF9HrD6cSaunzxb4LH54dKi78kpHxHM6yNbYr77HOzWCcGtjz/BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCWJb8Qc5cdaAF8kY49UqR0wumvdJ1YGvH/KclEhzkYbGcKivB
	504+MJUmQo6qDAbYconj/MU51r7ApIcjjtWnoNRvRiEUov4Pu4H/gSHc
X-Gm-Gg: AR+sD13KJ5asTC/hjeSdBR65O9vv6vlmfmtmxMKavuQVh+sTyAx8I/A5mKgLAGzsJ2i
	lgINDlU3wE7dnf1/bUTr6+vN73QUR4CDpJ/KCQiTeryFYCEzb5yJaVgyVdFcp1XgSWhWRtVG94/
	ZFQPsE4Z2N59fAvsbBM514phDOjsqyNezsA9QQNukuAKwfIPKN4Y3BmYr+h7y4dKqxTePWWRdY9
	iAe5IHSRsBqN1O75ypqLu7LvKpBRpkZW7o68T9DKDqpImaPkLv/pFkyTAzeUAdn3oySjkop3MKZ
	wMtqbIsIPKMt5pkD3oMLUvkSYTCl/aEp4jSL9KwQagOV8c9vPa7QQzVUHjky0G7jvzhq80eMKyw
	GaGaaF0N4Irk+SCcFB0dnd4rAn8r63saWtYKh+98NTlS/LtpVDsItfVc=
X-Received: by 2002:a05:6a00:298a:b0:845:c906:5ff5 with SMTP id d2e1a72fcca58-84e5944d694mr613698b3a.30.1784949574747;
        Fri, 24 Jul 2026 20:19:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:33 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:48 -0400
Subject: [PATCH 16/17] riscv: dts: spacemit: k3-com260-ifx: enable the
 DisplayPort output
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-16-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_201935_484909_C11E58CA 
X-CRM114-Status: UNSURE (   8.81  )
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

CoM260-IFX carries a single DisplayPort output, so the second DPU and
the DisplayPort controller it feeds are enabled.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..114d0e02fed9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -19,3 +20,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_3_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 2f36eba20f1e..dbe8db4a8b76 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -22,6 +22,17 @@ dp1-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	dp1_3_cfg: dp1-3-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(72, 4)>;	/* dp1 hpd */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
