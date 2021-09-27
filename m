Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FDFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228A160184
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 228A160184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qObNwjIvXT5yrTKVR21r5gVCNSvrpoFpCB02UU3n61U=; b=Xy5EeyguhpDO3X
	jN+CjtLpo2yCuU8E9lvq41KCDrFGZiKKUk5h7ttWpIQ6b3UqdWqvL6jsPDeY622G4vJUZ2lYFSYe0
	kdQboN601UdYoO2EME3gdB59xe3xzXb2NCm1A/bSQiEwHzN2LcXl88Jetpl0qRho3lCeRWxpSu8ti
	b3sBYMVlsC6Jg0/6CiPF6eIEEODlGjicc6hZVeRrNOGrt8kt++H8nm3QV86YAhOr9c4yYZyHfQmUq
	jHVb5sprEZx5S8Qi60nZj5e5qGqsDlxqkN1HH+MioQbRy8DUnYokp3PaA/hHQ+9dCL8BxiHbHaamw
	Ai40Fqqpq1Z872WU4Icw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUq67-002gaD-24; Mon, 27 Sep 2021 12:51:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUq5y-002gUk-Ge
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 12:51:01 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E4261402D9
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632747053;
 bh=SyASrYorVTAId0TEMO105U7AUWnylOwqoa8kfxON3jE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=vfQ4LX+VFyA8BvK/3NUb+tMI6uNuf0YvCTldR1jv+F4WCudVFBgshsEB77iyMoPAx
 kNgUmH9+m70q90NmIfa8Ud9NVpzFpfJMZ6SNU/5GqV9SV12n59Af4sRn21z5CP2Ohw
 QiFkbXGwLXUXBIMe4pu3gXB9pIx95BO010Mo5RhGaWpIR8K4M9RRRr1zo8nwkuq6EQ
 eMXrq8+usk32w4jBYsnpw5pOTnbvnSn9xQQaVxuzmSI00SRfmq8o4vXoW0f+IBhf6k
 WI7nBdMVL5N9/OOj1P7AzQh4iMVdHIHVowRtkFve3AfkDZlJmXX9+4mMGUndz2BLk9
 DndwNDcLzW+KA==
Received: by mail-lf1-f70.google.com with SMTP id
 s28-20020a056512203c00b003f42015e912so15751242lfs.4
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SyASrYorVTAId0TEMO105U7AUWnylOwqoa8kfxON3jE=;
 b=0parsxpulTZlKX58AWouC4lVwkhMI1fzjUuj/q4w7tH30k33UbLWdkofGy9quXvLuN
 pp+ra/HepVwMuRQ54g5hM6gmR775ZQIww1dqqMr1/4ocFPgGW7BuxGIYYeX4UN2nnzsH
 WRnl1gdN7k0KS3MUPNtxC3SjVHry41nNI6RwLbcnr9TRZo3eBlsM9VaiWrf0/R1t6xXG
 4IbOJhNQZ4aD9pqOrBbciPFCnbaS2UDNTutYSA2uQl96Q4AFom5YgdQcN4CbFAJIl3FN
 2Wc/NLnHNPzqjOCG9HfSvtcQLKwds47giSc1Xnytwuc4DWY4TONqKyLl064HyergdVPr
 n8/A==
X-Gm-Message-State: AOAM530U2QodlXScICXq6D3eZJ5POEj9qRNhB2JnPJtt7aA4RXUx+yO1
 LMx9gy6NHri5tCRmVWcm8sWHCCo0SwUpUy5OL0ExRs/ewAJsm8fRl5KJs58R2/lbN4VdBt/WwCT
 HJAAJaYir8EF0xtnT0Z1/bIqOwqETPi/HjWXYFwDgZtlj4w==
X-Received: by 2002:a2e:a782:: with SMTP id c2mr29270306ljf.458.1632747052645; 
 Mon, 27 Sep 2021 05:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycBjgE5omkxVTRNXAq3XyHF8zrpabI33eB8OG82RLQU8OwyqzbTmKcsU4pMNaQM29AXA8IbQ==
X-Received: by 2002:a2e:a782:: with SMTP id c2mr29270295ljf.458.1632747052477; 
 Mon, 27 Sep 2021 05:50:52 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id v28sm1592102lfi.22.2021.09.27.05.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 05:50:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v4 4/6] riscv: dts: microchip: drop duplicated MMC/SDHC node
Date: Mon, 27 Sep 2021 14:50:42 +0200
Message-Id: <20210927125044.20046-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
References: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_055058_826134_F9EF2FA4 
X-CRM114-Status: GOOD (  14.11  )
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

Devicetree source is a description of hardware and hardware has only one
block @20008000 which can be configured either as eMMC or SDHC.  Having
two node for different modes is an obscure, unusual and confusing way to
configure it.  Instead the board file is supposed to customize the block
to its needs, e.g. to SDHC mode.

This fixes dtbs_check warning:
  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: $nodename:0: 'sdhc@20008000' does not match '^mmc(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v3:
1. Keep two interrupts.
2. Add comment.

Changes since v1:
1. Move also bus-width, suggested by Geert.
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 11 ++++++-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 29 ++-----------------
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 07f1f3cab686..fc1e5869df1b 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -51,8 +51,17 @@ &serial3 {
 	status = "okay";
 };
 
-&sdcard {
+&mmc {
 	status = "okay";
+
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	card-detect-delay = <200>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 };
 
 &emac0 {
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 1d04c661bccf..b15e93d1702b 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -262,39 +262,14 @@ serial3: serial@20104000 {
 			status = "disabled";
 		};
 
-		emmc: mmc@20008000 {
+		/* Common node entry for emmc/sd */
+		mmc: mmc@20008000 {
 			compatible = "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88 89>;
 			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
-			bus-width = <4>;
-			cap-mmc-highspeed;
-			mmc-ddr-3_3v;
-			max-frequency = <200000000>;
-			non-removable;
-			no-sd;
-			no-sdio;
-			voltage-ranges = <3300 3300>;
-			status = "disabled";
-		};
-
-		sdcard: sdhc@20008000 {
-			compatible = "cdns,sd4hc";
-			reg = <0x0 0x20008000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
-			interrupts = <88>;
-			pinctrl-names = "default";
-			clocks = <&clkcfg 6>;
-			bus-width = <4>;
-			disable-wp;
-			cap-sd-highspeed;
-			card-detect-delay = <200>;
-			sd-uhs-sdr12;
-			sd-uhs-sdr25;
-			sd-uhs-sdr50;
-			sd-uhs-sdr104;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
