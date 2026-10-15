Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79A0CCA465
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ou0KfJPgzUpyL2RIJLFhLmu0ls64g1ddk07nQ6KGS1w=; b=d6PlGEIryacSPT
	+ieS0ZiZUe9oVcQVc0xmYG04A9RVxaUdrURTPw05zYGv9Itbv4ZUEFSapczlwNEEHa3rSgpfqN77N
	q0QxR4M5I0gVwcUkytpPJEUUzAe/OCExhDQt4FhH4d6mA4kbLoVIADRP6AMlV8ViiDPoVoqXyis42
	UWOZlEVOsNum9urhCmyKhNcizOBFYJds/rvZOG/pKMdvjwCSJ6Jh0riWusFsl+1e55mEC8wPnuSA0
	fH3+unN14kUpU5uDAzASDrKCaQngCIx7vnCm7hEhHK+ADwht7We/dAwAb8gSUe7tw3bcxFEq26dnt
	elHnjBNQ9bj3uyGerlJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQd2-00000001DUC-2Fuc;
	Thu, 15 Oct 2026 18:56:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQcy-00000001DTM-3Vfc
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 18:56:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so45559925e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090591; x=1792695391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=NzO2SB8p2t0x75wGt0DnFjZ26igHtweSJs2JyWR41pYikCHJHF4v1E0gXWBo/vwJ3D
         LxODpsLXldehvnn03Kyg2YNXHX1yCVqtqOHTdhfe1fk+KdljDoN2tjeesOXb0k+93+eb
         F8ji+Nt9D5uHvy+2Ed1JLe5xMI0zrUp71VudLJSSiwmKmNOceUQaolNzXfk0kPWb1Z/B
         ZDdbj9Rwq2FR749erPEEUz2HtPKtAK1UV33qN6nLV24yR1GWSPZ6/yp+WucPPE254EQ2
         Mzz6Y/BE1iHLKRA0jhF7j5+q+8GenXjtypODPDao9Q/H36tYWfeoK4NLYJ10EVLXs/wv
         G7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090591; x=1792695391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=FWDlM+vjtKiv4HllYn/IWt9R985DNb+/dti4AfUe1GuafsUi1nllvXS/I6GnbPV9Mn
         fn9OwW5r/j05GLYf2YJizRsFC0PennCTw/+qZFGAmt5C5+aU80wkqMVEa4B+jYLj01fL
         iiopfu518sgFaGW2zFrSSrXUye0Ergxcg8s/oBBGYTcH+GoefVGxEr40VwpKMb8Rwcsk
         OKgsApcfDw0mZ8z/e5pri31ggaVikUAz9+cCWE/lQwBo3o/V6EvpUK7gAKIu2hKioCHJ
         NKFKF8eQud9E+yuU1Xl7aNz3Pp6BkpnZU19ztF63X7Yd9qWD84jZO51QIkYM9+GyGck+
         Ijyw==
X-Forwarded-Encrypted: i=1; AKwUvByJpmQehmXPax3qGtPnHEGpy1EqfYnPADQCTh5+ga1aOrSQ+APhmRDrLDdCImvAqAZZoXHl9C5WGvDryA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJaznjxEZr0Sni/jNhqOUfjhRjImOiDrJZhvsNGhUDxgeh7IfJJ
	I3NfiGJu3U4hPKcIejhO0U/JqmiFAcckB6TZsCQ1yX0h9lV/ObFgdU+8
X-Gm-Gg: AYBFou3+ELBgKFhlrLYImZ0iBtEfCAitXWzNfN1rLACNxUiqEJabceIlA5t6qKLNM5F
	uYj4GO7Gctg/ct346nkXDbrD6nlH+WerEx+POzx5994pIrvDm5CdZELXXEYbouAip5sDG0if9CH
	ZG+jpvoCY6TmfAaMWetxLtiEIiWigjbXuzsoktIt3ezTpPgtHWhs6rnvxJfMNb/jfU5pbWCOoQB
	k6jRzE6qs6okfCLxYjAJDvzcYS89QDEF2fppi4y626Cmq9+u1RX/hUL+cHsm/dss/opgaMH2k44
	Ww1+1DPvo6kX+RZJ+E4pqd5eh6mocV0Jo9n6DVtS411iEgCDHv66lbNoNwqaOdyteS7hTMQquPw
	746LmlE/L72XRoRZMtQO7XPxcydJToGLVlHKOrPbVMcoSUVgRQ2HxkBM8HhaRIOrwSQiDuiSKIJ
	Wn9a5IB3qReayrdU99e42aE449Q74PHb5wXGPSzktaipFuf1rE44O2bq4XwfD6YmPms7hLzsGfO
	/sgbJPSdfTK624z1ZSvYMcBr5BMISYZPAKc+IYvFw==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr398603945e9.5.1792090590951;
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:05 +0200
Subject: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
MIME-Version: 1.0
Message-Id: <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_115632_897741_8D12770C 
X-CRM114-Status: GOOD (  10.07  )
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

Add device tree node for the Imagination Technologies PowerVR Rogue GPU
(BVNC 36.29.52.182 / BXE-2-32) found in the Spacemit K1 SoC.

The GPU is located at address 0xcac00000 and uses:
- CLK_GPU for core clock from APMU controller
- RESET_GPU for reset control from APMU controller
- K1_PMDOMAIN_GPU for power management from syscon_apmu provider
- IRQ 75 for interrupt handling

Disabled by default; boards enable it individually.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..82cade2f76fe 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,17 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+				status = "disabled";
+			};
 		};
 
 		network-bus {

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
