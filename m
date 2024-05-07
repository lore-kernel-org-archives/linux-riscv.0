Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E090C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 04:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0JM5uWq/zDmElrCt9KmHHze44TFzjxvsJeAEnlZr2s=; b=y2FsLa8dxBwkrA
	6saEF9vxygxN5mZ/pXup5E+LJQl+uiVddgX0O9LWdfl3jbH6xaV6gcRK0JLS1eT2SZ7xmGKEDDapS
	5S9ZjozDdg6HvLogR/SwkjCYJ0vc3vXp4vAqdKZZ1xFwVRW+Pdi8Dv4pSjiXaad9bvX7CobCoockn
	KQGdAbWG6OMGo7P1mhXYIYvSb0fQwYJHqPc9S/K3722664n4thZbbEv58rBlMIdeTt46ufsjZupPk
	aKRoqmzzUrY6wyIHmjhGJVoETjXcC5b/+Iqo6lyxF456NEFu3rSKCZ2eJz3l7dfvRpK5hsK3hGm0U
	pht5eHJ1Tt+7S88cSTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Ctb-00000009d4E-2Y0o;
	Tue, 07 May 2024 04:57:43 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtU-00000009cya-0vpR
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 04:57:38 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5b2089a8154so879916eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 21:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1715057854; x=1715662654; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlABhhrgRN0kCKTe4nIKDePb7LoVOzv5TW57AJaUw7o=;
        b=MIoAV0CmCYrnUYxBx7qY4WuIK/qDQkDEKdoNJrkD+0EYnm17vEz35lrNaE7XW5XQ+8
         KSc4+wB58C5AljAty8xNjDxp7Ee/H2CNG7QvHBd0M/8DvK22AprbOsdTSml6s7f/pW7R
         HibIcMtmehV04em/574UnU4dg9MkNb1T8Z9MopV1C73LPbItmzG+rf1G2sb1XjjolHVV
         ldZoY8DBmvbIL7vrXSR/NKOb0dtVpwQKCXAqBJb/5PnPpudA/EjZkwr+DsMU/UqBwWeK
         RHEN3j4KbAaYFcoaDvPDD9lOi085aHqQQX0ThFf9EY5GuOs/WbhRB662zjTRVBgFqpuN
         AooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715057854; x=1715662654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlABhhrgRN0kCKTe4nIKDePb7LoVOzv5TW57AJaUw7o=;
        b=bEuvSnJI/8tVs4xD+hqTS/t6VNg7ejZsjfDbQSdO7vqGZwHj19VIBD9ucQ4EMlIzdk
         A2H+s0JSie3dPLwm59yyZljCJUWuLaowGjlw8MmEyuDRt82HFvmVJj9++mzMVLjhc/db
         xf6yEa7TNU0ZenSoWoJOzPbWpjLpOsZUxYvLWW4C6shY35ea8WLN4Q9+LLkeskE4WoEe
         0mk6CVjnzAt6AfLHq33BdO70pabcyOy6Ky+SwPI2tA3MXho/ecm0HoAVWKBFIDCoCa26
         bG4PlA8oOHpj+iVSsJaTCrJdr/gjXY8WIihpJ5chy2iMJZUY0ZMVqaInq3BDiQTNEDmR
         37rQ==
X-Gm-Message-State: AOJu0Yy2eXqh/JZQ8ImV7GZUXLK1fJ7/MTQMgT/j5Zcea1T/Ljuv+Cyj
	5qQ2jGjaxefBLPGaWa6NfaDazfaEffdCMaJbqUIl706E4G1/l/qAXUmbc81cQh8=
X-Google-Smtp-Source: AGHT+IF9aeioa8mJUvS+E77WSKbfTcZO5wmap3E6KVCzEyaI/OIUtILJNYssFJf6gtqk3GzjJKwThA==
X-Received: by 2002:a05:6359:a399:b0:17f:87fb:5326 with SMTP id ky25-20020a056359a39900b0017f87fb5326mr13927155rwc.24.1715057854502;
        Mon, 06 May 2024 21:57:34 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:6870:7119:e255:c3a0])
        by smtp.gmail.com with ESMTPSA id o14-20020a637e4e000000b005f80aced5f3sm8987249pgn.0.2024.05.06.21.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 21:57:34 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 06 May 2024 21:55:17 -0700
Subject: [PATCH RFC v3 4/7] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
MIME-Version: 1.0
Message-Id: <20240506-th1520-clk-v3-4-085a18a23a7f@tenstorrent.com>
References: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
In-Reply-To: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715057849; l=1160;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=6PV2bpf3dXOpJag32DfU7y2Gi0ru2guu8y2sRZs5RmA=;
 b=4exMVJ4xzbDXC65KXMLDO8sJeX/DSsbUp2hf1w0Dv6pU91zrS6Osgwql3mmUi6my0DL13QSh7
 VXf/l+EKB0oDAgK0QRc6WSqWYrnUbsMoyXBAkkUFB+hNy9WFwuZt+Y5
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_215736_523353_A9DB0148 
X-CRM114-Status: UNSURE (   7.91  )
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

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..e193f8d9ab8a 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -161,6 +162,14 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+		};
+
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
 			reg = <0xff 0xd8000000 0x0 0x01000000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
