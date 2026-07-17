Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBD5C4451C
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tW7T31GB/lxeVz/vRWT0j0gEHasR86ZzF9/JdfkYNt8=; b=ZavwlN7nlLnIlQ
	awLaB3ssA/rO2ClQXZir5wSRA0pUVuleCNT14kNcLCzi8BifcRKybnaDZPUuffPATUgQm5aGi8JeN
	p3QKmNC8mI1LR0uINMKovwI5Z/CZ32E8bntIQnInJkO4qWFynOTIlZnJ193yfhGBbtYGfN5x/gcxM
	ZclIz2pVBs3AowyNZdm2W6+XNaQ4DpP/bPObDGymN6h7jN+zy0dHInKm/qWj9xQ+0WiitCO9NGX8a
	KLadlTBxha2yUnHG/vUmFQRCJSJqiwDUgrsL08TWjtlt8PXYFGRzotKSbJLkGn2x9s628HpeXXAns
	3dHRU0+kktDTwh2zkJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjq1-00000002WKO-0qnY;
	Fri, 17 Jul 2026 14:46:53 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpz-00000002WII-0uss
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:52 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84847482584so1416586b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299610; x=1784904410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4iqhlVy0zinCT6tWxaIfEaHrxRoNo3m1mEkW0uTKFU=;
        b=lcgAAUq1hi6EWguRgK/6Fscldk3axdZgqbiIArVt+2MYpbth0TrGcu8J9ehKQg4RS5
         4IJPZVwv6LqJKJgmlg6Vf5Tp/cWUzKJ1z23CBy5dypHFxy7IGpqFiQA0piF13zaC+Zlz
         WTnpuT0qw0xRz2ud2fi84zfMq6C/IQU2fFyqAln0zkHIRF/SsVZuW4fJTzOn02KjEsRa
         OwfGHEI5dImvj4iYxK81Utkqp8Zvb/KheD5R1n5sF5U+7wjzWfcQW6rv3Z4F1tZJC8BZ
         +MBWRB2yEA82fhgoGDba7hoAO7KR2lHrNUcb7T5m+m9fcaVwh2tmfkIQ7C3Lr/Ixh+kN
         dxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299610; x=1784904410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4iqhlVy0zinCT6tWxaIfEaHrxRoNo3m1mEkW0uTKFU=;
        b=nnYI/WXVY0cktdZJdDrH6wPY7aK1Q/c0DN9RoWIEC6hlNv2a+UoT6E4DIe4DSUSxL5
         lVcBfKCrGD3hBORak7jhVy/LU6leeqlZtE0FMBhRnHtOfQbSo5GMEtKSh8tHTTOa/wRX
         V+4OWal33Z0VNQWDTBXtlmM+tqfNpyGgKfSaLZ9c4EKvOGJtmnKIB+Kx8WbMhOBVFUhM
         zEoT9Fe2OcPpNriRC46maYOYHRHB5Z81+Z+2nhjYBhxZ2uRYXi3KiEFnlWVMwkTXx5AX
         fJpu0kVdg1drWQzatoqBCtGwQpRNsCeYebgwOzhjSJAHOarwS8PHibSJRihz0pnDdmVH
         HQ0w==
X-Forwarded-Encrypted: i=1; AHgh+RpO8zygegjAkwwLE/xfrYHdmzIEKaSyO/KVboCZ1YT0Y8lHiP4ZIR5Ld12nBVAwORq+U06VsUYCbXKeWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Arcd04JnxXZW+eEeOmnYE0rWGt5D65ZyDTX385WmxNMZIhy/
	0KCCJxEKg+eOYmiDrUslm7FNd1MTK8/Xx06xqe4qhlOk1jRO/Ef3oaEi
X-Gm-Gg: AfdE7clrEH5fJrDzLc8T+93RrsJKrpWrgvqMM1/Rc/o91nIgqwxeKdOyD3kk+8kreOe
	HeN6KrPTt+qUkmWzLQsXc3Kbxoy9WhDBkpiG3Cw1Xp8FlXUjoU2AAhaouy01hXe7PuoqU3YS8vk
	EWzkH/QNQGGvdk/3jBSRepAyXRIIaDBI4haq7X+pgOLp7aDSu4eluxdKqRkWMwPkyrzbAtJwcJF
	WArPKtN6/3VhT5ANtTF0b+1fpQse3J9kILaivKr70TfE7495yKQKsB/tCCr1uoY2ahNqz38d41n
	Mgn6gZtDzpwgdqLD/A/+9vNv/JIdj8+qRxkA92LQHuQM2DFiYascxbE9A5Fg1zdGiVqUHnKATin
	xEWgkIjdOx8NCSd6lh9Rh+nmBD7r34WtcrrZ4RkJlpSnkTf1PpzNwJq8Osbb+9KcEAi9MVSBLGs
	QaxA==
X-Received: by 2002:a05:6a00:1915:b0:842:4982:82f with SMTP id d2e1a72fcca58-84c28544a68mr3002230b3a.2.1784299610233;
        Fri, 17 Jul 2026 07:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:49 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:28 -0700
Subject: [PATCH 4/4] riscv: dts: spacemit: enable SPI0 on K3 CoM260-IFX
MIME-Version: 1.0
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-4-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=zySto7zgwUmAkuL3GnzDZtEv31hl9Eyy1aWzZqxzc28=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkA2RyBpFeLk6C50dYyM3otQZs8eLWGMcaVLS
 TzgiIsbV++JAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpANgAKCRDN9pw2gLgN
 2JA1D/0U07T9IWK44EpFEGxgmNNcLauxIxXRQDji7kkGmtw00Mrhd3m7oejDYO4T791hp0aJ2Kv
 J2HWV6FZ3dYK4PwyKMkf1K+hbczfdbuRnJLLGXQ6Yobc6zqchOCc6UBGpf1G1SCUiXwExI7CLJK
 bYzmu1L0703CMw9yBW+zO8jGzJvgTjow74li40wpWF1ytGx5olGNLudSRPPcuAXzlFmflztO7IR
 qebXLMSXPnrGyuvP9pkoiU+ho6l8KCqZxHFeScvISY+aKyd7I656GFXbb8tYBY8YkBqdBrr/IFx
 H1JV5+PU14gtXSWbXk72Ew8Mgv2lel9QhclPYsYCJjLpfGSqRPAIIhwMO1gmWnNws+O8/ivurj/
 gHG0xE5bvkfkm3NR7/uUXKHZZu4wxHpb/gtaE04JlLDpJmhqJ8BJ2p4t2Dsjsku/PwD7pknQaPq
 69wj9CpyqefvGXMD3UiywmVfFJYfI551YK1VHIpEH+dTcAvUwYd9iqb3333TOgQxqvdQC3cPfyP
 6UnAJgoxTG+XfrGK7LbX87GmKVW3jjASB0p/EvN4Aj/H7m+4LFG62czoRVFdDrAAv3VdXWYBg6U
 XIbrvWcahUgR7F3U+0xVJsLqjh7hAuDR0HrUPYqOk1HMvWCDu9IRPbe/OxPEpKU2yJ1xiYOU2zw
 JcmkMEaVPd5sWBw==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074651_413428_8636F034 
X-CRM114-Status: GOOD (  11.55  )
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

SPI0 is the first enabled PDMA consumer on CoM260-IFX, so enable the
PDMA controller together with SPI0.

The board exposes SPI0 on its 40-pin header:

  pin 19: MOSI
  pin 21: MISO
  pin 23: SCLK
  pin 24: CS0

Define the pinctrl state used by this header wiring, and describe the SPI
NOR on chip select 0 for the current validation setup.

(This was tested using a Winbond W25Q64JV SPI NOR chip.)

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 13 ++++++++++++-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..01a7135df864 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -11,11 +11,22 @@ / {
 	compatible = "spacemit,k3-com260-ifx", "spacemit,k3-com260", "spacemit,k3";
 
 	aliases {
-		serial0 = &uart0;
 		ethernet0 = &eth1;
+		serial0 = &uart0;
+		spi0 = &spi0;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&pdma {
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssp0_2_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..9b7617f3846c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -679,6 +679,27 @@ pwm19-2-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	ssp0_2_cfg: ssp0-2-cfg {
+		ssp0-0-pins {
+			pinmux = <K3_PADCONF(104, 1)>,  /* ssp0 tx */
+				 <K3_PADCONF(105, 1)>,  /* ssp0 rx */
+				 <K3_PADCONF(106, 1)>;  /* ssp0 clk */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		ssp0-1-pins {
+			pinmux = <K3_PADCONF(107, 1)>;  /* ssp0 frm */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
