Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5AFCD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BStSvoik35Ud637ZYC6EiW7gMel1F0TktPQ4Zl/W5/o=; b=rny0i4ZPNlRAG4
	eiOsw45zEEavsvCXjIfIsFhv0Flj3OzdTgyvBwqqnuIvp2OsDQdII6tgaH+RBt63GWd0kIA4zbqy0
	bgMc3EPcq9HcKwHi/4QuwamdvxTAKmkZ9YJKXUS8Qn0FBnIdRYwBy81Vq2QrKBs2XmgSa3dIbml4r
	TQNlSyJlzD+682pM/rMTpZm4knKK3Q0g/YF1QWeblr6Sk0Y1wKCBbYl90khCsAuLn8zpV8AA1Pq8h
	d4xZwZc0cVxzQNA7jZRag+tdHgYTR68lViiLD03/UX12YFJTLAEPx0uVLR6ExYDCVsO+8UUhd7hWr
	MFZQrshYe3T+bwZ+JrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgd5-00000004dhj-3msk;
	Wed, 20 May 2026 13:06:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgd3-00000004dh7-0IWw
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 13:06:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44c350a5b87so2960812f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282387; x=1779887187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quzmPB2mAFZ3y1nGKH7QHLGF8YVjh01j8l7CgpxBccw=;
        b=mC5f/Rpolzr5gAwhJP53g5K+9S0Xd/QUICbjQXyFMtkq2skwv0/7w8Jm8Zstm4DP1L
         eF0rsC8/mUuk/SOK/rTENuag9M61XZeFK2aY+XaPw3yDciJgh0OYsPiypCuFnXU9BhJU
         FM6fvPoHUgfxHaHAwXjXF1vd4Da+MmSoZAbpLaZz+hVOj7V6pf/8zlHYHN3hUylAY/aT
         1vbedbZcC00VBC37ygtW01McEEX9YkzXyKrSDlZ9fYA0tjI9vA/oKYNzmEFl/Acq5ctV
         dLTZrq83rOS+Q82B5u/yXXktYdUYpoJe8T8ujm/zY45ENDaGjnrjYIpSsoKVSK5s7Kp5
         pzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282387; x=1779887187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quzmPB2mAFZ3y1nGKH7QHLGF8YVjh01j8l7CgpxBccw=;
        b=SVDNtYzGhSCYmIBR42KwCrQiiEBEiy1f/ka6M16DAm/leKX+6K1aLL8kX646nlKNT5
         hkcss3dr0DtJoIntmdTqnKWQAJZZJXRxNfXgG1zpAEVFBX8J1dfVfkuSD7Ac562CfqxQ
         dSBdq9moLSOSnGLziqOsmDfmC30/tNNMYk1d91jsET92dfJQ3INs0VqkNCLiqdX6XnxT
         5WdCJDfqK8+uHFsbkAVniZ3mP9ZuDXI80RHAjAK1MtaTAZNI0P/1AetDcc6hRJeXZNrO
         54e961WgGcKOJOGVh3ZLLOP0ErugAMug9B5t87fuYnDffIU+1MfKa7A2qRZv6x+Znnzo
         q1Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/BOWAhdqH1vdVq/e5VuYzGOyvAn3a7r20m3iGGGp0VmvlPxZepU1luWA8QjDw6rdlUszyPMTFnCI9Z0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTiJWLundK3nALMDxBXbMZzFGx6QXVvbk0J+j8xG4xQagPdoz/
	y+BZurnAliXYupQHGUfLiBcbB5p4I9X5bfN+s1+TM3k1LKg1ziNo7BIu
X-Gm-Gg: Acq92OHqFrehJ9Xb+g6SLA1nNDmLfwu6+b7tbOTa9sO29xxaezv7QYq49CjcG/CNDaB
	wJZxLHGko0X5Rk6UgvljjC8LjGp5p+bzkmGRHr93jmIC8X7zf/+5f8atd1v3AW+P2tk5LHl5Eak
	RbUqMLCn4RAztrgkIeRaWpDQYESF4JOQXYvTxGDIIl7S0iHW1Ic6Q4avYkmhjfFIOY7aMRy2Crb
	z/e3yV4v1PF4uMOpS7NHlgwt6PaMXf3PITFtqDmEfHc4pWsDUM2TYi24NgIX0iEJRbckhb4JD4k
	iufiN2cJEdjEF0oSje6Eoxr61BmdRvvtIBgpBQAQVU/XhDX64a8YpuTQH3MQSkkkb+ztoLd/A4x
	iA/b2UnTLURSd5fWmffpUrjptP0dBGwQ0zJvzWuSECS99FlHS5OsLavXUXs5HjEwHcRekMC6nrH
	oTydxd8/quiZ5f6hrd9B3XTOXHX2Ik/TCaz90eAV7z18hG0U6R8wtr+pGMVBvOFuqlIoxa
X-Received: by 2002:a05:6000:2c09:b0:45e:73b9:fdeb with SMTP id ffacd0b85a97d-45e73b9fe1amr25795817f8f.8.1779282386765;
        Wed, 20 May 2026 06:06:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-141-216.net-htp.de. [89.182.141.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe2464sm55001966f8f.32.2026.05.20.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:06:26 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Iker Pedrosa <ikerpedrosam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11] riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
Date: Wed, 20 May 2026 15:06:23 +0200
Message-ID: <20260520130624.1763487-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_060629_129227_54AA2AEA 
X-CRM114-Status: GOOD (  11.64  )
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

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with internal pull-up support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Signed-off-by: Andre Heider <a.heider@gmail.com>
---

Hi,

this is just a rebase of Iker's v10 4/4 patch[0] on top of my merged
musepi-pro series[1].

[0] https://lore.kernel.org/all/20260515-orangepi-sd-card-uhs-v10-4-094af27e310d@gmail.com/
[1] https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/


 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 4aef287353cab..0d809e4ad3b1f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -19,6 +19,8 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -218,7 +220,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -384,3 +386,21 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
