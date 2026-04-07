Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266C1EDB7CF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pi3uoBDXTqvYvjqQMtdUz2GokEwUqnIwbp99v7Gh0kg=; b=wQgIVfEDWwqWT0
	4Nn9M/VxT8iSa3NUMS3UmHx+LcP7Ew+NQb0i4xMjRomhbq+V1OnmA9bsSWcoceTqkyG9Or3FT7L8A
	4ddrd7H78M1iY+MGP58J1ZhjdcDpkFsdnza4mXPnzz9TqLsfmWZGH6KkimUXZXcr0nB1Y1427j2iw
	YHS2xc14F3bvu9+J4KQSFpieYhaehp24jL7uO+Dz6FdfRbDNh04ZCbDWbzObcF3fC3/CnYV71MTC2
	XaLJ2LfYq93JVbGpBbRWs5UXhJAPOcl2z6WNZphGlIPr+exNB2KUD5v1xqaKd9bIEnYGCZlMxwumj
	UPt6o0zEPFAHQj5Vh8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lJ-000000068kj-2oJQ;
	Tue, 07 Apr 2026 08:26:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lG-000000068i5-3S7P
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so4001567f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550373; x=1776155173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KR1DjVt7yf8BAFWkx8gfMXo+nWfoRdvH9vj0RlDPuXA=;
        b=U5IAGggEaCIse890OmzCppoogQmqPdUrxSu5cZ68jObr9keX8l6Km4FZrfuHbRk45N
         scKkhIH8piaPe6rBwhruKuA/OrwZbzXrTInuPTfq+Mk0Fs4zA0NeMWkQjiVSa+p1GvGP
         frKGJCFVPwyBT6cX3wR2GJzvpl5A0W1LfODKt1tkLzZFJY9xggWfpNKLpM84yY8NCkUP
         vgo4V1lTrfhccJrqJlpEGqUQS5oVIN2Zlpmnad2PTDXCaIcaLg6twYwhqdQgsxd/vJUL
         09GNz0P1KajqoIYXLOsnA6QtEXgAYXWfhjzvWXiTbzkqmRNPmrKAN4+XEAYUkxZemsO5
         dd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550373; x=1776155173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR1DjVt7yf8BAFWkx8gfMXo+nWfoRdvH9vj0RlDPuXA=;
        b=qdwdJHVRIFUe0WzseBLHQF9zw4ZXsX110K8xEU18sF1tE+5MT09JE7uH0ukxfxXd4i
         TnTr6K8ZiWPYOJZdSz9kcFlQDOC4aNb1daFHI0qkByJ0tODyzweEBOfSatNb2ri/sI2j
         JE9xEAco4BpOjCStfUaZWnD4o0Fe1dymU+mW6fmXuJgdXI9Sf1G0fGGChUCNK7wKccD7
         MFVHmjonQWpu1++qnPRVTVnsQQPv46+R5pUYuysuLXhoYrpIuwXALZ5rupZAWop01SMf
         oxR2cJ1CreIomIJ3nnJPtv7yOF6En4TXhrn0NJcJULpT5G31Ihf1vPIub3RGqsObH8qh
         qNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCI/aWIVNrtci32sOEnxpqmEppSaC1TbEFNthyL9A0SeQ70ixnfgYl8G3DVigp0TQVyWMblJWRi5mQyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWr5hzyjG/PcrtkJhG0cVD+bh8NtjTykNnz2Sf1fFPgfJo6/iD
	e/cbq9QmeGpYiu5dLDVT/UvXQb5au+Uftx0yzN6LBinV3HGsTUXesEc0
X-Gm-Gg: AeBDievmM5qirz6ioR3UburD2H/omYmzamSbosb05o0wbHIrSdCi7qusMkv1D/1YgUX
	pEDjz74ghmjysy7vl28DMxUzDZZpv0KSEi1oQq9cuGXWW5GIcAupU7gsQuyhvaN+XHonar+o3fo
	8RG1GupXmmjvWHJWqxxgm/lx1yEWdjUVyl5Mjqb5A/V1RXuMp7wRI+WBAsyIDfpGfu3cOGQMsJE
	+IiXl+A434EbAJUQueE8TeDDpt0A/dtsyH6KQX2DU9K/pUpGKuPSxnzkABwDOgSspi9pSxNAelv
	IHq1Q0jrfCFTuk9aJSyiYXUSOyUfqK/X6ocHJXotQtud4VBL6YnZ11PqCV0eXiO9BMgwwo9Sn6X
	dk6Fk4bnt3e5DrNFtFu7BPYWEPAlGm7IPuSJusmX+vcIH1NDrbg/KBZZ52yNscCQtJa5PDQ3bgU
	JBl6hEdM2BjZ38QTPA6BNhTkdssYDIWbMBGV5fQlMd/zZv4o1mXs5OSfkPR8HxuWAv6+z99Jwzp
	14=
X-Received: by 2002:a05:6000:18a9:b0:439:c2b6:d5d8 with SMTP id ffacd0b85a97d-43d292db1b2mr22596880f8f.36.1775550372704;
        Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:27 +0200
Subject: [PATCH v6 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-7-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_012614_886247_06F9E251 
X-CRM114-Status: UNSURE (   8.46  )
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
index 9c417a483f6bad6e60617cf8d5400ca079588726..95cfb4681ced8f539693717e718a3633c35989d5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
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
