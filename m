Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A789BC83F1D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r93Cjc57wYL84IZjZvOmsDqAApZ2U8aMuquvqY7i51U=; b=drLFZ7WcdDXcVr
	W4HXPJ9dDlnmqxlknBdbflmvuiS5z9WWWIrtCr8jLSTy8mavhiIkhFFq1ik/x2ZpiHaFkykUezrcB
	CNTJYlamys3GQRDpFVoZAr3exfZjhNZ76cTeXv1RZOxdNKLQnA1J/xDf5irrbFYNpZj4w0cOLGPHa
	Dc9FcPtRxck6R26zM/AgwxkfrBvAG+ubFF2guqqrTNP2+hM1MRehcllcdgkdAbARTMCbE22W8+WVa
	+p0X7a4aynXF9O9PG6z/6fiTTh/iifkes78ve6/ZzLudMR5c6z7JYohos93HjWCOi651JcmuaqMHf
	EKWyw9HCEoXcQiOgzWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaId5-0000000FXEp-23Ib;
	Fri, 11 Jul 2025 18:37:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIYp-0000000FWFG-0mnN
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 18:33:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so4126585e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 11:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752258804; x=1752863604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGlAjOiaXk4Ea4ZU7FQtfjdQUVKQwTgsf1DZ7CdrvG8=;
        b=s5AXs6cZQ4gDmUB1k8NcoZ96BuRP7Vo6c2+djnAaE3FPxk+nq/Sdd+AzLr8OvHCZ/S
         8Sm57Tl+rpBpGVTiLgtIPsZfL61GyLyM9LAm4h8gzDGHTOX2yrZ1KGH3BgT1HLJB/wKe
         YmVTMDH0mcAuNp0ret/BX+XCAQyGJFpkUpXI1sctuNAgru1eJgGdb3b6N6jvg0juCWOG
         pgh4s/1pbr/kfyYLdDMYXb0EmKT0r2AHavE6JToACs0n2G4jnRZW6wcQ5558w+BoejWd
         Xy5fCNsHdNGM2E8Miw+smGY86dVmi8eS0hI8BJ/H4gmUexpbyVVMj8iq8k/RGwGyydJ8
         s1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258804; x=1752863604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGlAjOiaXk4Ea4ZU7FQtfjdQUVKQwTgsf1DZ7CdrvG8=;
        b=XxJ2ex4aE2ihwJepv5nP6I78rbNkqCRlqQa9JAROcQA1NzwqyFk9x9i62EK2exclWb
         uE3sEcBY4xbghyE95dwCxo2DOAcIA6Pp4m6rt9sFm4gt/zrPsKg5eT94AaPsqni1znup
         JpvHmJXxZd1Ti5F+dtMi74NVS8zIBFC7AP5suu8jIc/bKPKOBpmvcBEa3BvHhXJTiBR5
         lkwaK1sP9UMgyooZQMFsL/XEuJvmyp3GN2GNcrydrwQxsvt2QbBr6jH4U0NmK/T9p1XH
         D7wWf1UoBqepkI84gebpgw8Zu86B/OYuMuhy4M4dQ5uQIjXh8iwfxhOpZFFrYJlsSC70
         z0bA==
X-Forwarded-Encrypted: i=1; AJvYcCW+xg7t1sVex3Tm8wIL8amEPIbx8IUZ8hxGAdz5bSKwt0IKvn9hNAQUByR36tbfhR4LNQnAbbmzigHv8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPY1RZwpt072OVNSs5DdvwBh/Zm9+DlvjasoBFppCcDCkUE7GD
	edGTh+14OU7K/SjoLkvzTGQGRsbKJJxn8tcAx5jYKotVLjTTne2WoZPVAdrKDpFJwlU=
X-Gm-Gg: ASbGncu03rJ9SHa3yRi7ObOfjEilSzaIz3mN0blu7/tXEmZj2eorsU164nwxmdUPxNK
	vxrm2FJS/wLv7acHNx3GOQPq54dD5Qo0/EubWwp6Xq1Osa+LS+kTuzxp2daPvNVTwbZvcZKC4vl
	uyiJTmPN184aSpGH5CJgn1uv7FgiS2ex5dZV5RfO+4/0wpNWQgxdE8nLpLZI5hCdDJLUgaSNdeL
	6VfGVp9Wak9YJ7HGjq3OWv43QwMufzLQCx8Lg9KQjkKeBMXrfrgY2vhUzk0TBssoc/9IQsI949T
	RTai1TCsqwYVjg9hfonw/j0B9LmtRB3fgmX9hf7fGG0QA4dxbh03fNx/2rW+BnnP1/icpE8cbWt
	6Yz98PhjVd0UDbhbS3o9DLC0d7vdrA9rRqIhae1ZhXMw9SGj0+g==
X-Google-Smtp-Source: AGHT+IG0eptajR/3ce/67Zp32WT9bRB0ErxbOxP9NIp+sKL8MyAm504UpLdi7e8zbMZpfT85BGq8cQ==
X-Received: by 2002:a05:600c:1908:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-4555f895800mr32393375e9.1.1752258803998;
        Fri, 11 Jul 2025 11:33:23 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:bed2:2848:b66c:32d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45601053020sm705205e9.36.2025.07.11.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:33:23 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Fri, 11 Jul 2025 20:32:43 +0200
Message-ID: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113327_463676_2E7FBE0E 
X-CRM114-Status: GOOD (  10.45  )
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

This patchset adds initial device tree support for the OrangePi RV2 board.

The OrangePi RV2 [1] is marketed as using the Ky X1 SoC.
However, after research and testing, it is in fact identical to the 
SpacemiT K1 [2]. My proof:

- Similar integration in the Banana Pi kernel tree [3], which uses the 
  OrangePi RV2 and identifies it as the SpacemiT K1.
- Comparison of the device tree code showing a match to the OrangePi RV2 
  Linux tree [4].
- Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
  confirming it boots and operates correctly.

Patch #1 documents the compatible string for the OrangePi RV2, and 
patch #2 adds its minimal device tree. This enables booting to a serial
console with UART output and blinking a LED, similar to other K1-based 
boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]

Hendrik Hamerlinck (2):
  dt-bindings: riscv: spacemit: Add OrangePi RV2 board
  riscv: dts: spacemit: Add OrangePi RV2 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
