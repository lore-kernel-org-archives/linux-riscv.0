Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17159C83F27
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnesLCBelnxnZNHWp4MYnYnVB5zwdpTCryiSB7Hgtyo=; b=ShNB1P0r2w/S8R
	i9wzxVgLfouO91PGb0jNo4AH7ZP6Huzg9uuTADDaPZMSsnBPjxTbLkFRZ7jqjjTMGops3ETJyUZ8W
	bw2yrm5g/p9V0l+r4p2QujnIt5q3jkPLMLYqi7FPzx8MlLA74rmfvQVs7gqTXIQFszEABXNsr3iWG
	8AJQq611w8jL/inVBphVIbgG841vi8pPst0/PhGCZ+SGy/ShtvT8bMc+5KffkICzeUFw6vuDcsGmp
	jQG5M7s/TPrv66VEYOV7H8qi0EXQVbub+Gg1My1XDJpjc6d69AnrcCjcROfq7/7yhHUzRl2Psyzuf
	V18QHHalPKA2xb7mF/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyO-00000001rV4-1tdS;
	Mon, 14 Jul 2025 09:59:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFg5-00000001oG5-0mGX
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:40:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so2697105e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486052; x=1753090852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ldfd3zKYA1234Y8Fp1Vc0yI6IvJCQoMDmBQmNhJG3pA=;
        b=Tw1UxQ+X6EJrKXt0oa0BRzupPS/ubLaUMCbRSKE19LMgpEU7hJiqZ60lJoYt2ibCoH
         qOJAdCezBBA5qgNbzk+Vsi2P3QT46J+9MDGkHgeDZNNqi0OJ66+xgLj1LEWhdJRbH7sQ
         vgAYqnmHtUo6Xo1Cwq/ur/ywDnJl8gwK/gQiRvjgKHUPqh5tA1X+IwFbF34T/HxMXVVf
         5amm+SkowPMFQDoH2/DGqkbTaamkh1987/YXULS2qwutAPglraGVOhkt1llGhcsdFbeP
         +UUpVlXTG6w1x3i20TUrZh6R5LxgSp+hFJ9tRS+npC/QhLbiUaL/ecgh8OQQ7i5itPn9
         loxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486052; x=1753090852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ldfd3zKYA1234Y8Fp1Vc0yI6IvJCQoMDmBQmNhJG3pA=;
        b=vpbIYj52Gd4MHxMLJMl/tFMYb38GLZPPwbpu2FO/45o7kYKDQMPXnkEWhAxtIJgsc9
         dhABrXwL+GKDQcZkl6VyzuXrU+DJZmok9CwpKrwxMM9KSXYczPTx5g2t1HMolTgV9xEB
         2QlksIggHUPupPMlGF7FOlUk3fpedxSnRP/yRoLNmYuqfbD4AyNwHKZFiWm3cy/TfCPZ
         rPa1KPv+tLfOgYVrVSsmM0LZt7vU0VJwcbYtPfJm5ChBEhR1r0cUyN2QpiYh+lDPcB/7
         o7OjX09FEOjlaoR0TTA7O9m3IMK2B9vmaXL0QZsD/v1TervOLPTEwU7IUoInRIfBQJac
         JePw==
X-Forwarded-Encrypted: i=1; AJvYcCXlC+tJ8Z2Aa1+4MkA9Nh49DXU1+ugZGAWybqf4zrqbSBg1ehgBbdQC6Q58KCPtPInwyi0Ov7DWT4iuoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMfUz2bsFBYcOo1Q875bFJqKw2gwPsdy6vUOqk8IarygpgSs+K
	XBrZhEPfu7KGRmrSWtCmocqgIsDQjEhUpcAE8DC4BnE1LgC3nrPkddyB3RZzxnx1Qxk=
X-Gm-Gg: ASbGncssFHOW4HvBkj0eLw62hoeKXcEvAkdiDrWOh5FfQDFp871OxQ92ATLySzDwdhb
	JLgDBSvOop7H+YzB6mQvyhxnRJKfgq5DNEH/Pokj9O3xYcBI/IEuYJnwrhXTCrDHSVZonWzPvg0
	BaDorBl8XIrEP9shJc2QLe1KoXJuQAzLeFHWN5a/mRg4LU1So/9Ayi6kIAJGrihXRNICF9dDGlo
	weLbcdQAEU3jGKZgc6sB8xQZxIvNicZv5/FJ6jc/88Lu0T5aIX/J0AL3wbr7k0S7VI0a8DandLi
	t1ILAOlHXreFbn2MPt2sCdaeM/bsC2FPKYw/B0tFFdkTN0v2NOOh4/Gomrxu/c5gTYzjKjlb8w=
	=
X-Google-Smtp-Source: AGHT+IHBUTHXXfV/sAbab2DTdMAgIRdSFUuzZnhKWqGYxvLkdc88i2Qw/Sud4EEPv8EFPz7tb3aRDQ==
X-Received: by 2002:a05:6000:270b:b0:3a5:3b93:be4b with SMTP id ffacd0b85a97d-3b5f189621cmr8029790f8f.25.1752486051776;
        Mon, 14 Jul 2025 02:40:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:51 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:34 +0800
Subject: [PATCH v3 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
MIME-Version: 1.0
Message-Id: <20250714-working_dma_0701_v2-v3-7-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024053_226231_813D46FA 
X-CRM114-Status: UNSURE (   8.64  )
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

Enable the PDMA0 on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: adjust pdma0 position, ordering by name alphabetic
v2: added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..310dbd42d99f2ac150356c2128a6e16d1723d19f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,10 @@ &emmc {
 	status = "okay";
 };
 
+&pdma0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..15b814aabe10c0a21ece9f0d42264c775b505bb5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,10 @@ chosen {
 	};
 };
 
+&pdma0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
