Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B9EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55A961B48
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C55A961B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3MvipKnYIUYxPKPskEBC16ywvM3a7GPlmFhUl+a+Nk=; b=EBtZ8O74XvLO4m
	D1ga+unkssDkhTtzNbu1Tq/rt7JAatjE6iHO1VMmRfwCyjno5cW+r2YHAsPMRpYpBcuTQqv4HYf1m
	2AP92AoD7YejB6qrALvP5CeDGAq/ZJJ2X1fSPghQnfSLGhcKuxJDej2+e0dGggPcGKNADJQ2p7wr+
	Xt4d5uXPyHC7UDSjbSrb/FbnK0DQBTwJ0TWfJvAzlXCaWHrnA4xIKKc+jlk1gXeLHW/eM10Bng+Vi
	39k2fHwkvSRCf+xdZf0zxc7xYEqTwo/psQTlV0lvR9YPmji0+k6DOg92tculMJ8wZ7bHlFoIEmDCK
	o0bGc6kIQd/sYG7z3FPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmmiy-00HTvj-Qe; Tue, 16 Nov 2021 00:53:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmmik-00HTrI-2N
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 00:53:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id u17so15879683plg.9
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 16:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wt28/gXv7rd70jokBmRNQ4HFfWSUY5adpHknddEwpQM=;
 b=cmoR/uvRZCYHiW23dDQn8hsx2eu3WaFfYi1csQ/NbY3/XY0KBLwp3xh2Oc7aTe1Hdq
 iBMC293nQA5XJadNKCCVuAdTaFWwh9ibzdDZvmPT1hnm2caovByw/VXk0y+uUEw+DGYu
 ZANXmp898h/7gI+GgvhzUsFVNjzBWLIFxwRxKXILMeT2vNKGPxkZoNb1gTCk1Gm3/jb3
 TWPwIbwFTru3IDTyvBNhGEn1Fka95OXRftAZfBMEkMd78Q8JtA6SvCMfZugOuASJYrj4
 7RGqacnnY2xDWKTtmyK662m3DSDU1y5HpThhPLYn3dsLucXmFTngxDj2UXZQuNX1DPRy
 490w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wt28/gXv7rd70jokBmRNQ4HFfWSUY5adpHknddEwpQM=;
 b=cNlU7f8d4Y9z9bjH4jaRyS+qT041U7x/GdKL1nDSwU1odo226jnUJ2sNcIbyz+VeSp
 AxNOkKEYzIWRErnTsgaIv3934Mc82gqEUWtxyZcUfGXgLhl4evqtySKPUpi6qLS+0GL5
 vu+RsMC9BGB5gMwRU9O4Ci/HeUkpwcjlXGGPHCeLZh2pcQaJseRtyMouPDKmn5ANFvW/
 62UoNt3mfJJTRAyEw6EFyhXt7i2anhGzWsGiuft1GC3DM1rgtHdTEdPF0EGXLl9iGnCx
 9yIf9upj9PhHlZsryUM3M0AZyNGYInRYwpBaJ1owCL7MAFzh1gyfJsi2Dsc851SR/z2K
 rLKQ==
X-Gm-Message-State: AOAM530617UHHBJEpdg+vUgjyI2rXugdYouvkgiqm7NhhAOqBWDh87A0
 2hW2s6LvOlfOMe4wYJEpGtM=
X-Google-Smtp-Source: ABdhPJx3oxgmqZPrNfa+Gj01j7IcRdcW1OiyaiwfxsUYOmy8BhuDeJ/HRuCz40hEir8Hs16UtzznVQ==
X-Received: by 2002:a17:90b:1b0a:: with SMTP id
 nu10mr69147337pjb.35.1637023985802; 
 Mon, 15 Nov 2021 16:53:05 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id l21sm435129pjt.24.2021.11.15.16.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:53:05 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 6F9EE900956;
 Tue, 16 Nov 2021 00:53:03 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH] riscv: dts: sifive unmatched: Expose the board ID eeprom.
Date: Tue, 16 Nov 2021 00:52:57 +0000
Message-Id: <eaf9679c4c93b68fd8b7a427ceb8ef59387fe925.1637023980.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_165310_136966_FA01A53E 
X-CRM114-Status: UNSURE (   9.92  )
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

Mark it as read-only as it is factory-programmed with identifying
information, and no executable nor configuration:
- eth MAC address
- board model (PCB version, BoM version)
- board serial number
Accidental modification would cause misidentification which could brick
the board, so marking read-only seem like both a safe and non-constraining
choice.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 305a086e5207..cf8937708829 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -58,6 +58,16 @@ temperature-sensor@4c {
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	eeprom@54 {
+		compatible = "microchip,24c02", "atmel,24c02";
+		reg = <0x54>;
+		vcc-supply = <&vdd_bpro>;
+		label = "board-id";
+		pagesize = <16>;
+		read-only;
+		size = <256>;
+	};
+
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
