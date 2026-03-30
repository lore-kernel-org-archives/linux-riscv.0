Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C214FC72A3
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxktsPD6MzMv1QMHfWJW8IlIbSePxZPPbIYV9Ha4r6k=; b=0vl7pDuQbsiFjD
	VXLh7QXGHtVHTaeZ+6LlhQauPNebG2zAnkdC83PsYWthFULYqOXsJh0SjHg39Tv+GOdnGVzH3ufRF
	uBXoZY5W80aMVmRA/CHMmymXrhuaGJEm3MhDDc0ZUqEpRiNqRaeKU63uCUaYlppOHPuJN3L8WfzJA
	b5dXjZPjmc/SatxJyY4X4RSgbZfz8/NBt6SIiQP3b27NL/MdosWK8wTIChXvFeWz+2qAFoVz30Pp9
	VrqUD/164EyAVQWx9H6NVIS8yF4mqFRJ8u9g8B6enWD7RDYDoMkHLcp7mjw+yL+4GGqxcK3Pp2agZ
	9v30DYEfN9l9EnDRNC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788v-0000000At0W-11c1;
	Mon, 30 Mar 2026 08:38:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788r-0000000Asw4-2H81
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-483487335c2so44271095e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859916; x=1775464716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=nABRkIyw7Bxj1hs/RxCAsH1RF72hrOqzIKz7Ev6JC7qJ85N8IpIetXPWnoIlw7o/Oi
         zmnPpgJTnNmhoMoak1ryNbbXvWVM/apfCsslqduRyHW1SqvH6QJPLUqCNKLBGupJMHNj
         K1frXu/QYIL0x6OciSW1ZY0qvO2RSlyx+7G3GvP60l0Tg9Qi2DywrzZaToBIxQ12Wtru
         51BQgfqmZi/yijF0jeWEiV567HQeQRxgXaszWzf4Ekz2gsYZUVgEEC1EPDLZPdjqiTRt
         xbtqd6tV4mUD7dGJTq6qmyP6uWDFbgmRp2GPXH+y/TGlqveSl6arnMJcqGHGWlFpt0wG
         YYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859916; x=1775464716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=bJAtTB6eJyz80lWU0BsbEpYfqqUzTtretHzaiVyW6YkTyIObAOdkpzvAWsj5+mhaiX
         /iO/1DXcN889U4wX0RppMFTagHGAkrtcUBaNMQkFd7RCsHJd0jr5mCdXHGgDVxoh/hTl
         6WrC+fMbIV9Wl4doXmlFiy4YzU3UGRdXxIQHy7ElceI3ijHK42cIKb3njKCd8h4rts7E
         h96KlFqD90MK+wi/B4CX/OPEGMhNzSPfv6bvg9tNNgSObD+WpraXpnbBXMxlS3056JM5
         J2P7PDAHRqd9VkwEvTTXUw/jr4N4y3aiVba9G6bMu/1+7Obz1Ornvak+uunfN9kxqJqb
         gvAA==
X-Forwarded-Encrypted: i=1; AJvYcCVw+TJPWeKVsoRhJkNHNLko9R4GVg18ihXDbUiPDWWLAHmBkg/ZJ0G6T6T8v28HZp1jP8icePxLJbfQFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+SHKnPh5W1+b/RXTvt4zhvF7KV6yCgUpxFWLlA75rC6b7xF3
	rXSeRVjQFYZ44JrtHFJ3TfwoBjRNYer/IC9wmOY0K9J0Z7FsccvnWKNy
X-Gm-Gg: ATEYQzxu3q6g8qbjyiOXmpWXn9RaI+mRlm1QgPopkVnkvj/1t0k2Qb0iaJv/xYq2bWA
	ep768kGyMjiJIgoXdnZ1zF+Kh3FKmxWgn398DJ82h7z6Y33wAXLOa3rkWWxFgZHmI00vsh/skCR
	o73L3pxzT6JntcSnqlsLo3/n5CXuAqNBe7+uFAW34TYcgwmohdUZq5XpJuPxlzT87vWCO7YQSIJ
	Z56ObTFAelrn4yzgEZP75UqMU9oKZv9z/HzbGIR1fapyJOHZl7jkV2rNdUlacq1azPEpsLPF8GS
	Om/tFZkcV6N59AwDptMQnYYURQ+OQNzogL+TY4/DPv1SfE4Ym3sZPDdkkIVe9usTa3podgDiTZQ
	o5CpwgdOQx7/cAuHzNJ1O8vzs+b4BE9LAL04kVDq4yAzr1FSoNjrGv0JWiD3bK3PHu9mua822bf
	Cwf8qzFimh/nrrYo7vlbU0npjSTVLgJYL7Wzqx8gG0Vr0GY3ttmvOA0PClIwZCJn5Z
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr213736895e9.17.1774859915529;
        Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:08 +0200
Subject: [PATCH v5 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-7-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013837_601468_60E21BF4 
X-CRM114-Status: UNSURE (   8.56  )
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

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6bad6e60617cf8d5400ca079588726..5f823611c969eb0e15546862228ae4f65375675a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
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
+	vmmc-supply = <&buck4>;
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
