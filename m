Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D076F506D5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HX0g7cUQBonNMmvGNO4/TOoTAQIf0mskYlg+eTwZUhI=; b=kE/5+5KR/CaB4x
	WCi60oqfQMGb+7yDBmSwj2rATex/mjJsAV0XyHhk12yl7vp6s/yg/SA7CoqOFmipFN271qTyZOODd
	2u9noV8Sm6MF6xx3WXrv/Nvnrcm/5XZnKefqzmAlZcXW6mfjFLYWXcZglB8VSrgpWScZzim0nmj3s
	W2/9vxy5y18fNxlOWZ7YP7kUkzlPFzrUCc1pd0b69cQWpg1HHyCmVTDU7duXhFNCAXg/IHTNujPh2
	G/64IRVnSAeN3wjnd1bMuvGGESN26JvkYEDQu26weuBW0DxCw1QSXqeqAm025nhI9PsKD/rqWqM1G
	KT7xu9uGjTDGPTUfu+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28xo-00000004Bat-0hJf;
	Mon, 16 Mar 2026 14:30:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28xm-00000004BZt-3G1i
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=H7U0Z6Pq5BNBGUpIipaToeDztdOq53P+XHlRkPRfqt4=; b=of9yGcONPkpefitRuNAsrCC0mH
	bybtUUTLAmZoXOrzHECrxQt+EXUZPHc0c0SVp9JEzAcSLYfuCZTjq+bsda1Tb72fIiZlqKmwoiEYy
	UkmYO0L6DFOGSHP1+x95U9ULTpE9zYn/mWEUSo6OkVd5xXPb1i62ySRWulBlfkogpcC4BKC+lmSvV
	6r/QVFuj8Tg80PXovY9XXi0Emz1RL+noxwa53iqOBTFo0HKTGB2sRfK3XH8ClR90skbPrUPuAA5zT
	jUh3I3z4EueL8LSkW1Y6SIlV1CLsVNmF3A0DbEFrqCxLAavoFNUJfZFsUWFqejWwHrRvXd10Hy2YC
	M0EBGJ1g==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Yi-00000006tgO-2EAR
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:04:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48541edecf9so50488495e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669879; x=1774274679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7U0Z6Pq5BNBGUpIipaToeDztdOq53P+XHlRkPRfqt4=;
        b=DnFKM6vW4GJChDGvvbVpN+7beR1xFXd5GP2Gdl8kM9agU7aR9D/bUW8kOsniq4Jjrc
         ky2/5eoxI3Sgu2TrZP/eL3FXAub480meaxWyyFku5FussdZsVRDQdsRTDWFUzeat+2hb
         5Otj1aIkOsKmaiKU1Jh9aP1l6E0xD4C5MQj11gw4HIDYAa90juqr8KYk5LjUCs3xovXW
         psweiO7RUICFpU/33dUOfCZ5mqYNAtVQPj664N38kEUIVNgR2CdNGGxhal0Onr7DPtZJ
         c/8P4kPw9Lxqt/3uY+vxeYUCuNE8Ohf6NtXdTZ8wK+6K/aPxO9W3eyrGfOtybhD4tkxm
         QEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669879; x=1774274679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H7U0Z6Pq5BNBGUpIipaToeDztdOq53P+XHlRkPRfqt4=;
        b=PjGExlMTbFbjPWw3x0hmt93HwWPNjjBROc4UQa+mPn4URzM4GA7ZH+5KbnhBy3n5O5
         ZO+Ve3yeyhV4crBqxhvc7ohAgItDgKJk1d+nJAJw5k++GNEXrT0t8vfD4o+9s2qPbCtk
         CC+XkgZtR5TOKM/v2ySRGfGz9Vz2lX7CHXcD67dWDFUYVnUeMT15Lz3DraopOcqxxega
         alHJwtx85YH8oMG/NPoKGMO0Y1l9YQPxldKirP+Qi1sA0e+G8NCt72G4+RD/IgPPvd64
         p3yhtDTbZhXSPiFakbuXTu1tyhkPj4QlJGcbIWUMDVmNU5cfNCedA9lfoZfJIL+wvRv2
         +9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU27GhGmxvvlKpoftk/usvBz2n4CXEFRszNfPuVqn0buONjfZWOd0zggB4AKobt79jp64MP9Z8IXFoZeg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe7nkvNegMCVUaPMpyfuFdbUIHz+/vkgNWhA53VEUvvrsR0XVW
	Lnp672XP93EUBKzmhBauxlxRxeS1GmYSQR/9RtOUEBFlotjhuYdMih0R
X-Gm-Gg: ATEYQzyA6Eh6prqqC9fHeRBBGsTbZaGohmB0EEWNn1D4ytTuneLS89QwSyD4OYaWSC1
	vbuVjccl+aYYtsBY8NwR2MMlBcPMefmD6fdMlL4LrhPaSFeVtdSuL4fsHnKlfyMxORd7ZYiGMuO
	/IhglZMHV2X6320HNlETnzIfwaBYck4hFgF7EgH48iXyYEofWMf37KfOOYydj0iZE3wkZu92H7m
	+h73zNLFLE2KD0ZlYbbgaR9i/jPDCXR3Ny4UIa6ga2FZsj9wCezy+toqAd4oQ62zROi2plVi+x5
	0lIlacPYDwOV0B3/9NUlZ1Atky52t7b+K2vAkwNa/wLFG4FZl6piXJ3uT7L9AmllZpvXvKN0+0p
	cmmOlyMvdrmJLbNGV6wlL+MZrbIYAtHdrSIWWLzpgsnuECa/iRyV1SCYMS0zpR++9wzrGafnDoy
	mw/HTuo1yMS/8wCHq5czDIgHF53npeAV/Bg7MBBci48vKZlcHDHq4jej+VCqriGDyN
X-Received: by 2002:a05:600c:81c5:b0:485:3812:36da with SMTP id 5b1f17b1804b1-485566cf00bmr199399265e9.9.1773669878422;
        Mon, 16 Mar 2026 07:04:38 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:34 +0100
Subject: [PATCH v3 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260316-orangepi-sd-card-uhs-v3-6-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
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
X-CRM114-CacheID: sfid-20260316_140440_640546_CC7A045B 
X-CRM114-Status: UNSURE (   8.25  )
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
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index f1533c99881dbf38e16cff5e91e33253cfa7a56d..aff23846085d22d1e9cd77434bffd2816ad59e12 100644
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
