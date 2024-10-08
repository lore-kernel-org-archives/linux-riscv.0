Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5359BCED25D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUhzx34cD/ciqgYtDH+wuwEvfBEANjjVWjCER2ggrTw=; b=c1s2izTLf2hOZn
	wLe9sqKISakfusFOgLwAXBMmEEdSwQKp2trgpn2fJaWYOIEKq5lGB+GdcAQbvtGPOtt/UvYf+iMvA
	eC16cySjK+AYlF14Gq8UkMKa6QVYgLZ1h1Rg8p7wBriR3aznKDThD3gKb4/boag/H7yE/oky5gaDS
	CeN4xg3xOmxC6d44dncme+teJB8KQTlG1Bcl10ALyHnmqt9tToCbXNIwWoy6hEZ0S5ASdE6GPGBWU
	kb2fSgWVmIX7nLnyufYm9tho6eww0pohYPyqThjNqU2s8ZaOzhRVU3O9VqiJy3NJRwYyY+9iCGza7
	KKC1fwP4c2dIbUwYw22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0Wj-00000004MIj-1aWT;
	Tue, 08 Oct 2024 03:04:45 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0Wg-00000004MGo-3eqG
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 03:04:44 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3e06853e579so2931372b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 20:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728356682; x=1728961482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVj0JZ+cVfOjaLAf/i9q4f7a0NWdixO3jwQiTDHespQ=;
        b=mp5PEoSMtaLWDGjHXgbMP3oibSmW7zJPcsoA2Ur5Oui8oWivuWbN1EThrfEqDP8tgV
         pcsD0tL3ZCOlIe23RZdn67vqwJEk1wJ8z0+XhyYeitLWBHhCfqmp13O4Nvum8skuuAe1
         YjS/Lzi+jb/dX6tdF+HfpVZ04ESW+IWo8YarSW/q4zxhwZlrf33IFWCAm66T0Wrm9B59
         zd4h9cKAE2Udn7NVcLDu+9EI3PcT1/c7MyXMRrB6zVmNus/yVegxYNPC1KpeOzuUpap/
         ufB1QxKToc7QmkgD3AWJv6JA35tHH1FDsJxDBO+l+BK19aNbA1/lcdy3gTxbO0RmM5c4
         aaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728356682; x=1728961482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVj0JZ+cVfOjaLAf/i9q4f7a0NWdixO3jwQiTDHespQ=;
        b=txbVqux0lm7bhiSdQhR4SNbAt4DbyoHScnNA8DWMLpHFqzo04fn0db8SxiIEqZIjuA
         FkDfQTv3K5Fb0tcBkpO9IhxCu6Hv2F9Pu+aq9DtHzifw6IX8xyPEYjVPdq1f/MZ1s7aT
         xHTHDwfx9Zy7KBlf7Julr37HmpuqKG50hYakHLguiCDCxhxyrFVabumH3mT1TVlkNvPo
         JN4Rp68YNWFTh2mq5RXnFuqTBm0ys5w0fYnRH8Nj/6n3k1dqXI1dn/kMb8u3lYr4SqQd
         oTZUuuWy2D105vx/qBnhRgKAA6c5291Ru7eCSKvWnmzeatkjPsb+uiS+B+qisopsnvu8
         xgSg==
X-Forwarded-Encrypted: i=1; AJvYcCUxPHaGYvLt628i+HOJ0cLyz4SbxIKHO92+4SQveWWNZQKdGmVSFHJbAB8TOfJ/Jw64qiP8WNSmYMGUag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5XxsxJGWucK3H+ARlZCCxBLOJ6tcSVd3bvZycnEwom7IGkJQN
	YLeQurTsuP/UZnXRV3AIGUL/MfVohi1er3vKuemSKMs44tFYVdvi8alQ4rKB
X-Google-Smtp-Source: AGHT+IGf1MJT/PyvOPxEnoprcZ6XuCuypJ2wUdXV9XylGNoyRVkd8fbI1Fm5UNJ1EFp0uIMZBKBF0Q==
X-Received: by 2002:a05:6808:23d1:b0:3e3:a90b:25d5 with SMTP id 5614622812f47-3e3c133e35bmr8119051b6e.18.1728356681788;
        Mon, 07 Oct 2024 20:04:41 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e3cf854961sm1282089b6e.10.2024.10.07.20.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 20:04:40 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v3 3/3] riscv: sophgo: dts: add pwm controller for SG2042 SoC
Date: Tue,  8 Oct 2024 11:04:33 +0800
Message-Id: <960826e94a94c1c0a25261e4081de7fa82dff5f5.1728355974.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728355974.git.unicorn_wang@outlook.com>
References: <cover.1728355974.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_200442_943156_DD263D51 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Chen Wang <unicorn_wang@outlook.com>

SG2042 has one PWM controller, which has 4 pwm output channels.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 4e5fa6591623..048792b30617 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -165,6 +165,14 @@ port2a: gpio-controller@0 {
 			};
 		};
 
+		pwm: pwm@703000c000 {
+			compatible = "sophgo,sg2042-pwm";
+			reg = <0x70 0x3000c000 0x0 0x20>;
+			#pwm-cells = <2>;
+			clocks = <&clkgen GATE_CLK_APB_PWM>;
+			clock-names = "apb";
+		};
+
 		pllclk: clock-controller@70300100c0 {
 			compatible = "sophgo,sg2042-pll";
 			reg = <0x70 0x300100c0 0x0 0x40>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
