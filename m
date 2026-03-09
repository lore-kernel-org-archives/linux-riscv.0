Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2CEEFCD9B
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RjCHEmVRQhxU5YJhWpjdkzI4t1wHeWWgsuvhIu3vhs=; b=fAprglyrF++73+
	mw1gtL0pGpP3ngneGkCCENyZCsykwV6boqLRe4mNt1p1jyGgC0CkX5z7zOqMIO8J/kjV5RJK/cHWd
	IJVI65+pjGJkOQJnnOcw1KJtG168wCI7+cDsufBhHey7dN0X8jDbwB8qvIiUQzv01V4A2iCCdJQEU
	bM+lcBypDoytd1Ac1w8A9u8cUjsg7xo+3NRqsf9AoqPuFJRmLz71QvCUm9GTGC5ZpOWRTMOS9unmD
	GQPBVLq1EkNHUpFGT52K1N0SJcN2tfzSVvfhVulkiaHqaWQeC1+Ca9dCRmrUokBD6Tlduk57kqSMp
	DMoDNhtO1dMwSwCihVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYya-00000007CxL-45Sa;
	Mon, 09 Mar 2026 11:40:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyZ-00000007CvG-0PVd
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so1529284f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056441; x=1773661241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njsRP4EImn90P32g9UPmNNWBlL1/zM1gb0xUIcz/r+Q=;
        b=TmqB/5uqJGJRJ/ImbojNi58CkTlGo0PDQgLTxt/X9rc5HLPk12ZsO8WoaMldsZ99o5
         8QCtfFUc0IYd6im94iLTFtmPynrACK8pV8pdFZ/xHtV2LaQrrC3qLhu3k6klFAn8Tnwq
         R5dQpHwIWvKQdT6IbOOZ8R2XSAvCx/5KtDtw37YQanvOiiTe2nnFOQxbRvAWxVCHlnEX
         zUc+ynzMFxAHP134JgsmUL6BtifMYZ7kDxPPaz2au9Eb2QvmlU/HqfYdelF1kgmP9N3y
         LdKiteTJCe4S9JYv1DMpMSKy/DeqgJMDwGdm/OWjOguA5btN/kRQv/RGqn2Dlw2H5+wd
         lcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056441; x=1773661241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njsRP4EImn90P32g9UPmNNWBlL1/zM1gb0xUIcz/r+Q=;
        b=j8iI9BMD6SnMQre2PjN5UTCaAPBWJ39/H6qQ3ifLVcO9kB++tdoFWpjX5fcNJSbinq
         LymRs4WTpUGQwUwJEhvXMBdwwbpYteN9kmghG+tvFJVaFGOcFDsvu/TuRYE/C8KJ3rJZ
         HUfOuFOcREVb9LT9S5ZW8/uwoiZcPznQQStD8cm96tAf43uCezOCIShGbvWoA/yNPYWK
         GH++MUF23HdFmlEpP3KbMYZkM9Aw2G0jK75xWjfXd2QWYWQ0hAcvLZHkHskY6ywtbHr2
         3Bj09R00GHBVCGFQ9Mk7NdcrL/zJgEPUfkWrvqYGtS86SPJq6m6WFyLbH4UUqUp+GbZH
         PGwA==
X-Forwarded-Encrypted: i=1; AJvYcCW7iD+fmo4QUwTXY/sfSKWC9p1JwNKRrXC06txTAQwBD3BMATAMvKarfCcXHY7w4vca9r/vwD1XRvfNIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr5PqW0ogrbmGxhds8QN7Go9CyNPB5iOalsuMrYCCs/2a1WGOu
	KCRQs7RiWNTWJd1O6M4wuhU7TJRMdyrLxQzp7PR9ynba7Dgwhebn2uCV
X-Gm-Gg: ATEYQzz4hOWYBIo0apLsDcVJmCerFamT9J8YSwH05hidY5AnQWB4BYpiw8t4f13QQhW
	KJajQqOdPExUPFGm+6dyVIwDvtueR0WHxR4TKZC1RJjG2AxiDJN5p/EZOkU3pxxr8pYihSGp71Z
	DdzUGOOVepAPex4wVt326pUAMFmTsyMGons5vMnX0Yq0q6rv/MIjwMZQPW8xr0yTunLan7o1L5l
	9NW1F0NvgsMRE5hTiW+umWroqGCcVXs1QgNAJ7KUy4fw7eDCUdppgk1q7CTd+p3lHKyDQ51pj11
	ynjEfHRb88VhjeJjQ+UbaSl/SJqaZtdJ4gWxki8dQaIklyypNb6ovA5201W/yPDlSEYlL0L7s/m
	Qjg5n0YjCXqQu0cMSqcWQMK3jpDjfzU4er8c68hexkGtYXo8JglbsL22wcHcekSPXk9H1NXAKPZ
	9J5J3fWr1oXc9qwgTpdb6OKclZxxTCeXo7I3pNoIq+PNAPTfFRTTSMNhzkft9dylWA
X-Received: by 2002:a05:6000:61e:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-439da67bf28mr20283499f8f.34.1773056441001;
        Mon, 09 Mar 2026 04:40:41 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:40 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:17 +0100
Subject: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044043_177820_7C90D9B9 
X-CRM114-Status: UNSURE (   8.65  )
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

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 414b03f5e6480f05f5d7eeaaa0afb4e86425ae36..361135269801f436703b6f1d768c91325a52f07f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ sd_vqmmc: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&sd_vmmc>;
+	vqmmc-supply = <&sd_vqmmc>;
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
