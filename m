Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9A8CCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 00:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znOU/NOOYjcGydkUBslfQVVa9BMw24PRZ+mXjCOHq28=; b=oVCnIkWWAQZFqU
	vbxoau2N3ucM9BHcvILrQR9Tek83vCHSksBGe3/Yvzys5f21iddKe4snFecBgLATEh2BjzPO4ymtF
	O0mrTn/39OsWjorrznb1rU2r2c7Bmy5n5wxDdYcZ2Z9DdRADKmE/Da7nmHr+zso0U/5mr4oB+3LS5
	UPqj/evjIVRDss6kCd/GnT85+EbCcILpYYDzHXmFSFlQ4EA6fxAyDP5pt+EIxjWzzFqM8i0gIgYxg
	Zg+LId3whdHTM/D4stt/91OfTKDQcTuIn9tej2OG3Pu2sa3LcoB9I5prQRRL1jF6uLw6q3XkAC/bP
	Vps5yUDYtRs2BQ4Z2waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtn1-0000000GqK1-3iC8;
	Wed, 29 Oct 2025 00:11:47 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtmz-0000000GqIo-3zhZ
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 00:11:47 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-79599d65f75so58059866d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 17:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696705; x=1762301505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY8bhJKucZnnINBzQA9olEneaOdGJdRswVhKUMSP1Ts=;
        b=lhL422FSZIXjZIG4j1N4lYc7APE9z4cVz0+h6hfVpEgGlS8KhuGXHGJpStR5SU9l8H
         ktjl2KChQkfhALwx27XfS9HGmNFOEbD/QRw8tc+zoVIHKCYPQYmC2cRPOZvztbHV+RzR
         UZpCqPpkorUj3b+8sSEB24Pu3AXZxUNQa6UFlvBKLZ69BDWaDcZjC66fywtaS+prkZOE
         +/jR/DOPHcUbcyn54zau4qo1kFQPD8FG+848z+L7Uh7iaMcfHfqBMwUmLt9fmeRg6AD2
         QQgFAmePLwfJrbObEYnGrQUfszJUa9tontNTMXlmpI+lhrrFKe/mNfw10eNJ0KKXfCUN
         Vmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696705; x=1762301505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY8bhJKucZnnINBzQA9olEneaOdGJdRswVhKUMSP1Ts=;
        b=Ce2MoYxI4RQHdZGZNkVCto4bUOcvdw/KvQ210e5Vj7ZqNDA8zaDSRa4hMXV1K10rUK
         cWrGWiuYMG0oO0D2TVh+qun5WXb9AtbpNClMKhqaD6EnL4r0Iq2OW8oioxqKWCp2hoMR
         Djzqfbxcpy6Y4+fGSD/7hP8cmbK2tL8OtPDLn4iGRBXxydf6/VCIWNr8NP+brK8sEVBw
         FeJ447jIgUE50aJ02RSicsrD8dOVK1N/43jBfodRcPA8j0S/9nxlVVHnyWV4fiTYAtaM
         +lp1n+s0x2AZUuFRVap1RIYjvtdX+AgXwH6Q8SrQNH5DJMUxGxN6jmGmzgQNFxv1Hngv
         UgBw==
X-Forwarded-Encrypted: i=1; AJvYcCVDAgseFTnoA++ZCv2SEksgBX4ZAKskf65+tbCVvAlOpHs5JaXeOvkgAaHVVTaoUgHICeGqWXye4MFtaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYCvEBzzVQPkXr+VCU1t+MIQBiRuVnf48wE8J94XhdWZs+AFAD
	Y46AvFIJkuk38Fo7j3QIENvQdXvRZhsToHfzzvw4L15kb1WLu7Fz1u+R
X-Gm-Gg: ASbGncvVQd5Rz6vJTSEAqc4zxqYFqMwshKaOgSOgoXH9+le3CLttvw/G+Z1xVdc3l1o
	L7qg8rusA+14dOOa6IMJtUUl1L3IJzlLJ9ExkTnQ4AxFayksgX3cLmcQNPl/SpSBYHTlQherJXP
	Z7zLy17C+9+/2u8/GrXVAN6UH2ImeT8oD82Jrr7lHsLLDQNrHe8gEsKMwCV6wCctDngFbm8Mwqv
	TeaDbe/QjHq7u4UiK7S72nbO+F53UpP0hqj0xZOK2BvN8tGsbdmalghTZGkxIMUX4GP1AwyDtEH
	ZRqx3YnjX4qh7J+gMKiz9Bvg+wJAXSfpxEy1ZEb0dSN7AKFwTlNL6dUr26NA4z5wynY1S3ua96k
	Gg8NiWQ8TlYvPqPFbrL5L3O26MvIl+eyKTYmp3VsdY4lBYoZpAcd8Kl5EaLWpQRoCpM/FEH5xUI
	TqWv449YVR8wGZLDMd7jDgJ5ZLgRkeuHC2WlB0cuULmMOH
X-Google-Smtp-Source: AGHT+IFN5MZFLx9fkQvrL/pSdC8MVt0wRfB5OAM1X9WBFBf8yJncnQ4OXZoamPK6a6ubNICmvj6aog==
X-Received: by 2002:ad4:5be5:0:b0:87c:a4f:afd3 with SMTP id 6a1803df08f44-88009afd0a8mr14232506d6.16.1761696704672;
        Tue, 28 Oct 2025 17:11:44 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:44 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Tue, 28 Oct 2025 20:10:49 -0400
Message-ID: <20251029001052.36774-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_171146_000957_A7DDBB68 
X-CRM114-Status: GOOD (  13.28  )
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

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994b..68aace728223a 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..174c194e1301d
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		spi3 = &spi3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
