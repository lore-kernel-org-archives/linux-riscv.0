Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A4CD4842
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKuZhDwbLlthwWgdXxSBA4gYuk2yXvXtZ6jTH6e4sQg=; b=dBQH5Kw5eh/6SV
	uWyr08vlpLKNBal9NDuiUuEAA2Uix/cLbDLAUWu1CPlK0fj5P0nl2cWZVBjkVxlYF0rmZETlbQzUg
	Fl8qw+8n8EicfSdQ10/U6lS6ZC5TiL3C5QejbK3kVA/r5jDzXU6R39QQKTJtw5pUEwFdmK7nTwgJ3
	yATngOUI3+4SrJ9SA70iRw0FPziCjaR3lel1jhZcG02y2BdZq2swq6WylkO0tj9Vuvo8vlIRwgvsW
	+sL17bYz+cg8XK5JY3Bn4/xhXjjJxpkJGtun8Tq/EhfEJVrRB9ocLk7FwJs4Rj+xW4EwgNB4FJcs0
	cJdjwpn45yINQSZEo+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPR-0000000Co7S-00oW;
	Mon, 11 May 2026 08:54:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPP-0000000Co5D-26t9
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-448528f4e69so2369204f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489678; x=1779094478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxFL8JcBleXAhQJnczy/XDAFmLI/O3K8Gh9JfAxOPq4=;
        b=coOH4XU0ZZs46r/PsyvQHdIrtabsXBMkLahlGfzRN3NVHh3NHksYSH2vVv8+EwVWGu
         VJADDc9QfLL0p2mens1m3pf5QzYd4X/+T95qDWBFqWisWDbLLJA9DVKZp5tcrK+UqwKJ
         duozO3RpfQAwl3MwYhDmbcYkXi3xIIu6wiZsWJubDS1yKjWz/IL5rDai+EarfYVuT3QH
         OmgFtamG4Ci1w1YYXkvYK7Rfpbnqlw+FbBO8TMNGsK+Ya8HaCA+K6bCALpZP/w/QBPFo
         YiDhzTLl5X6yblOmHzYK8cjmtmeiQk/G9vWztMfWBFJ9d/SrNG29LfAsIX6zw6Dftc59
         FACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489678; x=1779094478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxFL8JcBleXAhQJnczy/XDAFmLI/O3K8Gh9JfAxOPq4=;
        b=jZEFgJ2nKbimTIYjbjF3dB2i4EpATQf5MedWjXioBgSgtd4O37oYxAUI86iEfUXUs6
         LssVOI8w5C3peoXflo3OxIZwpoM80UBk/IdZhVEgIEkj1BPGi9EgEsaSnkMkqWnFaj2I
         9yRbQmMYRe59DOnbvBNAULdcvQ3ujYWNl2Hka33tGOXu0BnJ4BT/APEIhE/PsrmuORJX
         dyjRGtqSSBD3KNZLe/8/ZFwSjCA44A7NFqn0CK0MLZyc9fZMsSc4yKOnMFV+n7OR5wMP
         6z1BmF8jH4bjoXH4i+wqPpDktEZ81mAPKugNk7w0KySsiUQkFoowk15q4DjhI5oeTG9/
         NRtg==
X-Forwarded-Encrypted: i=1; AFNElJ8Fa7t9ScL73oxES+k52PUG64cceB+NlX/WQKWZZsCiu7Aoo/Ygms/12Jb6tq7NLpKvr4Mv0HJrrnllzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHwgWi0myS7+5y4mYzkBqQTPkst3VfFZHaFqMumyeQdirz4zbx
	31zAB9l+eV9GSr+NJaOf0VdDLezE8FuX5MEWsfOkA8Vo20hM90eBSOz1
X-Gm-Gg: Acq92OFp+g1TS63DpG2+D3O9m8TG1a2k1Wt93hNVSO/ZOf4IgroJjzb7SrIb4JcJD+M
	Pdw+3fvsxEUwaYcYyN4Eac19s25ndkP/yj0VvLa20HhySqvk9ElQuBEWg5+oPeKx6PMAOdxO85N
	J/KAzkixq+SCkmMrSNyU1O9u6nEzNP2J+sRDf1U66jKxFHGDJdnjeXrwvZBqYs9DMEP61tVibFa
	DzUJufUpXlLqHRR656jK8wMcpEKDFnmSkUYqRhzi20gcVb/iEM2mqlE9s9HRLqglsoeHhO6iaZ+
	G1iO/e0zokhf2ItIqYLjTPudAUZ2D7q7BEFuNj6QY+X6KGQOdRGxdU+EA+x99q6E37W4pHCdCxH
	JLOl+dRSDmLLVrBWZxPlsGwt/Yaa47BspeXuhOZSI4js9JCEsAgfIUTTf4au6T7zFP4uAgYOWod
	J5jx09X7FKYFl14RQVr0PcxIN0VP6wUrWjTMnHcq10NW8XsBnv6Jd7CY9CykR2KA88zw==
X-Received: by 2002:a05:6000:178d:b0:44a:b3c4:a04c with SMTP id ffacd0b85a97d-4546310a50dmr19851770f8f.30.1778489677417;
        Mon, 11 May 2026 01:54:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:01 +0200
Subject: [PATCH v9 6/8] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260511-orangepi-sd-card-uhs-v9-6-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015439_665286_9B797A7F 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
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
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index c95ca38e3d4a..1ed76e0ff806 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -202,7 +202,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -319,3 +319,22 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
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
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
