Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4315EA4E0A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6BEeXMJ+67eLCHeqKs6BEEmn5JWeRRduiitIL3YFVE=; b=JmZ8j4bzdXtFOh
	Wysx2y7glRICVifb7nsoBD7DTpt9zrzvY7KrCgRxHZQ2iuR1SbyHlGYoTT5q8Avz8b7J+sQ7AqE9O
	51s+Fl1mtAt3X1T+EOqYkXJQPZkLhAI7MDylKxvhXMeMpnbXbhe7OvoM6QgI5xxIg0LkhReihIzBm
	Wjfc1/lePadVY96Mkk/BYN3dLT7+CkQsmtnfSdP9uBW69eN7RbuOGOLBVFsmNgr2Wt7EKjp8/TvQP
	zhT60e/aEQJFmL0Yz5Zho1u6DtIFAnv4IC5tEBATEi0ouaszTFxVQhRE+BLI4oO0Bha+s82KWF29D
	VcMboT3SdMD/w5HkEzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yJ-0000000DKEh-1IZv;
	Mon, 02 Mar 2026 15:14:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yH-0000000DKBG-0J99
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:14:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso39620045e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464447; x=1773069247; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxmhxlsdpHuelB78+3YE0t0LkGzrS5SfPUfh1V6r7eI=;
        b=QGFEL1TIRrfNcHT4hjcsFYVWIfWwuDUAWwdRghrL7TulWYVlDoDP883PuetTV7cCQZ
         D+4CeM8SjBN5UAHLHAu7n2M1xZtan/sJHBqrBiIrZ8unQY+bO4t+QVsIgiVs4jH2XSOb
         OuXJ0k/csTJ+PilMDmeFXRHDUw1spnQnjUL7y7HzOimAsSLPCuhFgCPmT9dmXfiknmDI
         mk/SzLBJXAh/oGwUsuXSZHvyZl2LKZyiuz0FT+aUGbTyxX7sAg7o3n/6EoIOjKa3bbuD
         DBC2fEtfzADUwicnDP2f1c+dlG2jH0ztLKJgVd8qlSk6II8l6KP2v0aDvsAYmv/pKwn3
         2mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464447; x=1773069247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pxmhxlsdpHuelB78+3YE0t0LkGzrS5SfPUfh1V6r7eI=;
        b=s//b9C7yhNMe9Kqm3n+ZkES6ehe1qaZeQWIgnLUk+9ovVDJk9clywljCwFrKMN6G1r
         OaLWsdtaNizaDAtkBaSVQv+roYeGgVQj7k9zUAIgE+6bgw9l7DmMDbfFAUVlZA2LD7yT
         6ojiQ9SvEOuJTgeiXY1T5LZeeiVNtfFnofUwfpuSPMeHziGIuI/aPxoOK2gFaNlnrs3g
         w2h6Wn0KU8CRvFJbGmGsnoa1m1Gt9pRD3zf1lQFJw7JSne6xZhRWoRH6vR5esipWm6y3
         7DSbCRUNBR/k9+wzzO3cu7z7NVuaTGmbRF1WP3BDhtYQrnFlKbwqA244et6YBf0v/q0B
         II/A==
X-Forwarded-Encrypted: i=1; AJvYcCUuteprcb87Iguu2ehyu/o3rqbcVJcEWs1pP8bFCcSXpzRjF0aOXhE5p1Si23g8AJ5FghXttkcAOp1LNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVJtQ7+bfHD6vnFsZZMoqsHOHJ9M2IghnqG3zVJX8IkJn+ZkpU
	OZv+dJLX30U6452yP7oNFzFe+npIZvo9XXH20upxkx+Qlg3O3hg+dNBh
X-Gm-Gg: ATEYQzyWqilBHTa6P12Y6YPWFOhUkQhobTQ5ngZ1mwfZ5bRP7TzAVJ3CBpH24ZyYdyo
	6jcptUV1sdKRSB1xmgpA2aPqJUt1chFp9jt6v8HMumkIOvLjKoefjPk8lTQ5zzu5K9//aDn6z4a
	BumLvJWiJL2ohJgNoBIadfj6GqyKFwqGubt+TOqynx3c5aCDoMjUh3CNxn7pv8BScm4gwfM0hHy
	FPTayZvHCp7uW+SRo1YGtvb3d1Ft8Oiv8p/YEspuGPJwH5OcsYo6RwFJPFl6jC2+vdwGpc8y4Ej
	3oS/bPErUxe7zkBFlRb0yIT82gIAjESubXN6sp6fA7Fq56KcC44xfWRerAcaUSaCJcKVaA6Psl4
	3YdeilsJipm/CE3g4qQKxC+lmAkuc382qCtsVs8If16bvgmhNoC0lMffuRHuR1NGGKBz3gEGxKu
	20S8f10/9MuvLsr/unXfV4Sv2kv1AILSbfe8ZQNfz2tmr+tidi8C14di8gt0yyWteVDw==
X-Received: by 2002:a05:600c:4fc8:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-483c9beaca0mr263703895e9.19.1772464446760;
        Mon, 02 Mar 2026 07:14:06 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:06 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:31 +0100
Subject: [PATCH 10/10] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-10-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071409_158250_4CC54788 
X-CRM114-Status: UNSURE (   9.16  )
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
- Add AIB register properties for hardware voltage switching
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 414b03f5e6480f05f5d7eeaaa0afb4e86425ae36..f22f7427b3370a6b6c1cd8360b33efc2a285f8d0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,24 @@ sd_vqmmc: aldo1 {
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
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&sd_vmmc>;
+	vqmmc-supply = <&sd_vqmmc>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	spacemit,aib-mmc1-io-reg = <0xD401E81C>;
+	spacemit,apbc-asfar-reg = <0xD4015050>;
+	spacemit,apbc-assar-reg = <0xD4015054>;
+	status = "okay";
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
