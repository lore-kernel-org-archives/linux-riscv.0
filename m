Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81476EC01C3
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxktsPD6MzMv1QMHfWJW8IlIbSePxZPPbIYV9Ha4r6k=; b=VxxeZRUjRupVnI
	l42Ws8mWUX7mIVYw6oqtoDFK0epQ1bozjnNSkA64zVM3c4TywLfvCgZMHQ2wTcEH8Ctp+KsTra06U
	erxahz+VZKTkG8ihQJjN+pe59omShxuIfvzuY0ZjJmjbYeGrMplWweXWiQm1+1uy7cXXWJzonLvkp
	ATSCmkqNZ+0YjUNbjlQAutEDu4TgrJdXtXHrtjusv/Gd26jijepl1ez3MwQk1rr5fXD7bQB96NGAi
	JIn4aMh1wV7Gon33a9keSvKXSr2NOoxxxelda4ymcV2sVmg55eHOqWRqexqPLGBd8NX6lSR5U/+W6
	1AzxX4uAFm5Cu8NDiaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNs-0000000GU5a-2LHT;
	Mon, 23 Mar 2026 10:19:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNp-0000000GU3J-0SDu
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so23568745e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261179; x=1774865979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=CfbfBnfkH5a/e5r2ESiAtSyF3Cvp0448OUfYX5D29GlMAqf/QRa8BG8u00rgalSlYf
         LVkuuprjbe6KkXCh0sDnxy/N7dlag3yoVzYc/71tjt90AgdnnSrnXxpRdGpVAhHUl68g
         IEMDTnxCnlZfhUJws+O3bBOffyQ1qgDrBPzTcAS+LC681Xa/Jvy1HN8TyuMH6KdYHt48
         ghDlp8s2JzMFBksMnosWTABB74YdXa3/BdFEn47Hze/UtOVvgiTU/TtgJVb1wllYMjip
         KC2Z0wQWj9PIdgdZQS6COXRbeI2Y6Y4oMKNlyZr5KpMb97UW5hfxT00vnv2IJ9RJE2b8
         P1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261179; x=1774865979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=B2eQHPIZgGrFLGp2cvwPP2rLcS/wVKNL2gUfsTW4yD9pbw8jzLodZyqUdxtcj5akLt
         0SAj1uaLvkm3XK5sjv57N2sceg7UcJx7lVVtazMd7tVDExWBj64TZ2Rh192RWew2jCzg
         hBzmHZPJ01ZxJR+sNT9tpr+wirFpEbhExd3Ol4M+MrCxfM1lquJhuFkDI9XBmnU4cbJj
         C0yK8r2MJ8wPu6ddUWkKwohYzUIBNLxnS7q3DeM5XH6cL6pweXCf07oL2tiPRMGETPnc
         3tHN2VGd+ftyDglHtr1/vC8xyKTE6cVztGxUZmlTqyIIBlRgKS7bhklot+wZVzvZx+di
         bKQw==
X-Forwarded-Encrypted: i=1; AJvYcCUNqB9mf2Pew5r1V65erieko9jWH020XgYec0pigxira3abZO+fLAusv17io/KDJ2NWLhAihq201EqTXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0oMCUU/aE5olBLyzjMrrRHSBW779KoMq7TzkrODb6EvniarqZ
	9cqFhyS3eNfBSl5qOnJcTvYZlpqN6519ryN3OAqPL3VziCaIeuQC6rq2
X-Gm-Gg: ATEYQzxnA9OU/IyuJERnlMs4Mhc2RRwP4x6v3KTXC18tnyXvri3nXm4Wq/CvYVTkoM3
	WnYDiY3tbbFL3Or1NXXeUOzVnmMvGPe1O4vXbtjBtphXpdTPzKN79Qw4YiWuk8zBpLKyntyIhsG
	qN5T2GzDuAeanqGgdpTr6A0U3rVhJ2psS/BCbepu+ijOdsQGUPGLD7fuf+rRIS+sEMfyXPl+/8W
	PY//C3LCVWekqFz5iFg23GqKxqrr/Gz96tOx0heGa0v76++Iu+INl+HatyLhvbv9snV3tTGpZqw
	PrIgjOUA0woyiZZJ1/D2If1UbstRVDSNA4fLV0+VaM3xjZxnKoqrtIAWSZZZJL9MFnd3E6MhPVr
	WFG6seLSjSRtpRhSpMqjYIRJGSdIweFRwvocEIXXLMLbjPpar2vlfZ3xcuVQSi/Tvcd3lpYPu4V
	0KG3ZT6fZw/SfEZG3r8FeUmShytgxhi3uItSAfF9+c/ZmCUcU5mQNA+Z5tNQDYw+x/w7lj8aVT2
	Ro=
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr153371395e9.5.1774261179356;
        Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:09 +0100
Subject: [PATCH v4 6/8] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260323-orangepi-sd-card-uhs-v4-6-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
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
X-CRM114-CacheID: sfid-20260323_031941_174263_45A87C4C 
X-CRM114-Status: UNSURE (   8.60  )
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
