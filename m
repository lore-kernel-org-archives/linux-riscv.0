Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296FFC61CE7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 00:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPt4jBzv4NgZ4seDtFpEFvJRlSyEepaGtPTD1liTAOw=; b=1aj8eF9FjLdath
	j1oHODhDNstj6K+QQ/JUxN7sE9858uEnhK3XYBIduNSsoOckAeNpkwJnziktRu7ElEMsFHFoClWIK
	pmsD8yZr2rtiX/Hx1uWWerDfqImqHv4786QcTB6bzmS9TmVRWtY91Gwigomp7ig3ubbzikTbPjEEe
	grHF7Ad9u5ZeAluyzNNsso49nnpeyLypAffJMQDsO4udIzsBa9ADiBcHUjauI0LHmOcpCEBmCURrp
	wjFXpPT8RtrvE3Hx3J4AU0yt4LQXK3FMcZvbxn5+Gu8IV+N1zqrX7xzS4/ecyP1GYpQ1DuSYV4d5j
	/D4TuKVuz0WpFnpNL3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQXC-00000003C62-28tL;
	Mon, 09 Jun 2025 00:38:42 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSz-000000037WL-3Q7I
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:30:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a6f6d52af7so11443971cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425417; x=1750030217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGqZ6H9vgVgHpW8k4kYrkONK2GRCAnNYk099WHkJuBU=;
        b=PkCNIs+KlFzf/qnqyRC5qpCLd8pFFwPLsvbp0sgY/9FVrRaUa7DEOxfMJMTYNNSaNG
         cHamDsx1rB9uoavogqTUQZN66jYqCtb/OAUMz0okY74x+LGY9jrAeoCZ3TMcv4LukH2h
         R7lE1SCvM1KMqeBEVLYQy1ewDZIKf3zSHm3SIYnZBS8JlJ+bz8y1ZTHCvw0x3ELRANtC
         9MXUBpmICFxjWwZ8qOyvngr3iGVZTmin76envLbEGjPtEwv/2qzWrTGf7ZxZhG5f+fmD
         xiRYvA7KNgHATLJFEf91e9E+EjdwZEpLe+ppQPwlWDxJJzb3ZMjVC04VawWAAjjiYLQ7
         iF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425417; x=1750030217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGqZ6H9vgVgHpW8k4kYrkONK2GRCAnNYk099WHkJuBU=;
        b=sTlr3l+mFY7RvFswd1U9n9kaNyi9SxPISNeMhZNPgHBZayonn1iHe2tr2XrsPUXGYd
         EMslP/0Qrd4fgnRZAN/gAIL8XTYGmHUGwzUYzZUamOQNNBi6JNYUaMNQiYiLZQyV+5cH
         My4Gdb6saRw/XYrv/OJ5FmyFHMXVJp37vr5CEGYyBwQJdc4eUEZLpYLTcovxTtt4IPLm
         r49brojopwlfVqGH0wm81M1fw7A3HmQI0Eu+fLX/ISCelfYvANQQYW9SvWj1dqc0Ti8V
         IR2ye2ZMuHsT1XX5RIc1i9ZVqGiYo3MO+7Ye9E8q/Z+IVdu7M5lj34KzmVBTSoaEgIdQ
         8t0g==
X-Forwarded-Encrypted: i=1; AJvYcCWaDswlP1+X6mOFeazBpyoGxYfIDmr3PzbskclJY7zKozwTeyKExiaD06BCaxnB1jZ9EuFZST+NJQ78VA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGL/WQDYBnpsQrLe3D7VIif+MFXD9iAOp5SsKbvTgTg4xgdz36
	X/Sx1wA3N9sW6O9MgEEo30LRZX0Pl+nMM9gckKSgOYj2UEeTFwqN7H/3
X-Gm-Gg: ASbGncsDghXId49iXVBsYevsCCRW/WZ/x8j/fmI+afonwbimU0lRrSCk/O3Fen2IPWk
	2nGL8RIh98UywWhFeVuqBAe+o+wQIQ87lG4e+nWxRQwCghlV0yGd3Mp+kdAbSLH2+COvh9dI++1
	bbRCkfkQY8l/cmBDwdDP9EZOXeKZaZQZmq7rZlabpoSI3sjRp52YLKgGNssx94Vi/u5zqzJSVMO
	EJw6AYaDArsK5H7aTmI80kYA8zMArydD49F+98FkM3ZgnEF2l0l4r8vfRffKT8tA2rCG5wjl0as
	t3EgrxOWuov4p2voRytAN/B0wW91yOYfvn4Fi9we05a1R5ds
X-Google-Smtp-Source: AGHT+IFxasvm0DM58Er+rulpc8xCIg1aEcLZoSpXNO7+uLu6yJcvr0q0o85JQaJvO6S8Up+1XYUevQ==
X-Received: by 2002:a05:622a:999:b0:4a4:30cf:c213 with SMTP id d75a77b69052e-4a5b9dd44eemr176529811cf.48.1749425416628;
        Sun, 08 Jun 2025 16:30:16 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a611150479sm48333501cf.5.2025.06.08.16.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 10/11] riscv: dts: sophgo: add SG2044 SPI NOR controller driver
Date: Mon,  9 Jun 2025 07:28:34 +0800
Message-ID: <20250608232836.784737-11-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_163017_855914_1270643E 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Longbin Li <looong.bin@gmail.com>

Add SPI NOR device node for SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index be20efd8e2ac..b65e491deb8f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,30 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		spifmc0: spi@7001000000 {
+			compatible = "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x01000000 0x0 0x4000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_AHB_SPIFMC>;
+			interrupt-parent = <&intc>;
+			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPIFMC0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7005000000 {
+			compatible = "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x05000000 0x0 0x4000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_AHB_SPIFMC>;
+			interrupt-parent = <&intc>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPIFMC1>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@7020000000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x70 0x20000000 0x0 0x10000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
