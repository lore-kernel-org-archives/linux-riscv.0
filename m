Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54393EDB7D2
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpMQovNu5XCOU6iElC5B80G+EZRLAApD91Tkda24VHw=; b=Z+uKpVFW4BvyIS
	h5j6RdkuIkdoiVBQOAwVpdJIRYyMDs13YsgwqIxlQTIKZCbaKCuNDl3BK3MBlrD1vPblSnAT2MNVV
	XB2UKDW+vj209EIhEum5hIDcgHBLQ32sqPFfY5k7KOvUoLliWS9b6aqNEJIoeeOZGtaCGgX1/Dm2w
	QWAiYbJ6M2+W0h2tXjyzRhFjiJP4bSs3yU6wmN7/YLHoRi71YWYs0TLCPRGQrK2GN+BDIZ4YxVWB6
	W2xPmbc7IAljWCKv1W2olEum9Vg3430qFvCkkMG2aRzXvbDqIi/HrwhX1S9sOsmxYmqa9zKBxCnPO
	mNl+2Bfc2W9YxhjUatuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lF-000000068hZ-0A5J;
	Tue, 07 Apr 2026 08:26:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lD-000000068fp-1Pxd
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so2251592f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550369; x=1776155169; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4Odv7xUvMFtyNhPTKS3HH3RP8ayug8koOlIGuCJxko=;
        b=fQDBOcTmqY51L/bi+M/1S/Z/R2oFfOMxoObL0LQpGXWepVi926/2T+JfByDVMLKlKw
         95EF9XaA0XyddeK08uCb11+7/lmMHwdQiqyzvZOvkr0k2GfUeYhilFqCbcAk5MVBtNUi
         /48cewLY9oBDkbiL7Dkq+lzn1la5j17tUBOK+pHV+2Jibl+6QXVUK2NClk+WxNNHaNnI
         4Swjx52kKbIcHfVUXPqRfz3N7Abv3HiYOqBv293mYbvZL6otNYd/larwrBOsoGBuRqNG
         HpX3xIUweqUNaEnPWtjTB0XvXMQUPrmhFRkrNeidjAeMkHUy1iqp0rCP1fLhEC9pWMXb
         Rofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550369; x=1776155169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4Odv7xUvMFtyNhPTKS3HH3RP8ayug8koOlIGuCJxko=;
        b=K0n4FF6cWsfZCXj+0mBL20iLNd/UNqJ7qZa6e833B8NzpYBnXivCgcxxfdaZKH+B5v
         NFYFkB9NaKtYJbayYk7zlNyIsGdRB6vgLr7mAsTVj6hv/08Bu7KFALDdD3dwQCmgD2xF
         mQb26SQ1ig/xW3cogkfn6OEKh3Irsysjd26eBgMvWeXBTX8jj7nqew/MqZJTQohPOkVv
         9k+/MDq+kNqYdz3dHDDCeK9BEWDvYbbrsvYry2sE273zf1w75NcOh6AdXgjNy6RDtJmt
         MxPZzqKkJtw7wLJ/giwh3QDutZ/KWHmrwEnKQeI4JY/AvRj7Z7uylKcjfKO6xGWnK4Pc
         vXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzSs8aJxmTkDvb3MwADsTb+YNJvsgvMfp92yEQjuvX5rihEyNfmHNNV7BpLGwnprka7qh8SkqKxrmsoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwalLLHrhVY4nX2xtGyw8pImTeuK8ez3diBV4pkVpT2y0YTYL7B
	TW521iQnEiA+CLCNJDPUnIpoEg/fEtx6P7hJNVUbUcgIA9CW3N9B9yXZ
X-Gm-Gg: AeBDies+ibCZ2rFTOT6DFk4ycv6LQpYNu9upvg5YNnmAneS0aUS+4NNBJB0m7Hhr52l
	WCQsaUz40tUdplKkqDQleudjWVrvzND/GVvTtPfLnWLrthWKxkgsISHSnD6EK1Wp5sIyFhRB0yf
	6UQ4cmURwCu6fj8CjfU/5lr5RXdTt9eWjmSuvEWoBORHoLutAwAdJsmq1oYoBaaxdvSUTR21LpZ
	4in3Z6oeP3v8gjkZd81mnqu/s7Ah5s717Ep9BHdekIMx7hxmKSBBwIxBCK8rS+CScy3lPnVmRNe
	k5ICOZ/yeLyHWdZjYbv5XuJ8ExQn1s2tabghr3IYVOLNMQ4CJgXMivohPx5oQgcdTDJ6AiyCHM1
	D6U8wGFTG3CSfIYHDcar4uqvPUQeAxLA2RnNlPcSWktvCMbMN9ni8sxdB8WpujQalnvThk2Z+qw
	qxJ9XrAcRm/2odleNizIFYFoEEAcBTrLzBSxezsUGOOA0G2dawbUYf9Gkboj0/hGwu
X-Received: by 2002:a5d:5f82:0:b0:43d:439b:e102 with SMTP id ffacd0b85a97d-43d439be12bmr7817683f8f.10.1775550369145;
        Tue, 07 Apr 2026 01:26:09 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:08 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:25 +0200
Subject: [PATCH v6 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-5-b5b8a1b2bfc8@gmail.com>
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
X-CRM114-CacheID: sfid-20260407_012611_418152_4F959F15 
X-CRM114-Status: UNSURE (   9.45  )
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

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66022d27307de73a6ea3287e97441..b3c472a0783b99091662d2d3516aa7fec4b3c3a3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,44 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c970a609253d4b0ca2a4fcbf06bb8e3..28949f804610c60b7fa89d957507be32e3b49f34 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1211,6 +1211,19 @@ emmc: mmc@d4281000 {
 				interrupts = <101>;
 				status = "disabled";
 			};
+
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH0>;
+				reset-names = "axi", "sdh";
+				interrupts = <99>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
