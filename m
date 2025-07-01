Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D041C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 05:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uj0l+DQy5K8s925kUs5LvGOp3igEKXFXG3+jhg08FJU=; b=CtbhMztj1McRPE
	EdreZdYrr0OV89J+N42tLYbF9sooSiNgC2nipuAZ48Jd0RJCAHkAOWeXy+lUEEygLJJBUmYP4tdop
	HPFfdbXsYWR2O92K//ld0KYF6RLOjcIY90Ao0HpuvhVSITbmJUIRUGb4w8UeBaRf9ZvpGsgn6Ee9t
	2wzzYKreBgkVP+Z0YHojs8hdcadQk7qAL6VtxNE19OutJSn2mIsFyWXwiafmEegR5521wekJjqXCU
	OeTRstcTsYyTCfdFsx4RTrytmlp/5j4T/xMwfZpRW23ncLfBBqYElmIUcoTvHw6puDJdGIaFUERiZ
	6sbScAzF17TdI2UxodYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWThF-000000043dC-1ZUa;
	Tue, 01 Jul 2025 05:38:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWThC-000000043aK-114u
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 05:38:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235ea292956so25137325ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 22:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348297; x=1751953097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBY768blUCx3GgOj3PZ2sE3UTLG71MWHW7v9NvluTM0=;
        b=neeNwQN0lq6nMzC9t9PX6uvl/P5k2HMpHfUXf0G0x7wCltlbdRwtTkHNvdc51Q6D21
         12mmB8L5L4PCawUUczaeGjqeClbs9GdxSSFqiAaaP0DVb/0+w1xrvhmq5w6+cbbVCDOV
         dMHMdGB+nBjLuSqi3Mddqj843jtJT7r+7/Xbf8SKtfYd6f9PPtSWynmvaK9Vbarxg/70
         2tYaRAjcnDLErYJivRUYGJlMwuYwn70uV5/BLkXx/CRKi57rOIfBPKLoXNi4r79Oh3pO
         G0gha/Nv0eXc/VlMGcph6YF8/g2k2DxGE1QTYdFOBDmMsQD3QiKc8Tb7/CQOU7WPbuWn
         zdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348297; x=1751953097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBY768blUCx3GgOj3PZ2sE3UTLG71MWHW7v9NvluTM0=;
        b=gOjd+PhXXgAHbRD1TsVs/efebl8gvDMAUPgE6mRdisIHAkXL/KlgnSDu1uefGKBcqv
         QTdt1jiUAvQ0AozjCTOyeST6cLiAP7KHSEAh8MDCrnv3f1JrhFsBZug0OiCSXi0/mXJe
         WWyFmjEns6rxOt5vDr6Mi+CSkz3ZEn/vswegLDmy0KtVLhSMPDPxXPw/9Oi04iBi3rXJ
         yFkHZUsdT0VhemPBoec8cGekdByrDfFCB2NB5lwrxQOpT6gIxoYZ1KnFr0JgTx9Mb1jS
         tRofbS1Icr/5yFqbjDPALeR6+3lZr4eDevyIGfhDwiZDWZXhn+RQzDy4KCQ4Bfs4/4lW
         YnOA==
X-Forwarded-Encrypted: i=1; AJvYcCXdIqv16UQ3W9t+xA219fROxruEEbw5zUBgYRVQuyo2dWr/ywK2gdF7TtzIgSUjqttfPPjUdEDtyt3NKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywitl4pxK0ULaskofTjpwoseLUbeWKSNDFdUiNfNu9Mk3bSnIoh
	E9bOdd16lYDAfCGhLBnDypxELAgNoSCfFeAHyMqcveCoJtTo0l5Cb5kMDt1spOpw92M=
X-Gm-Gg: ASbGncv2hsqUuTXECE6S8jPDSYE4hLOQiEvJ8BQE178F6rj5N+qYTBrvLGjC4nipr3F
	zZBRGLAinxMQypmykfWHfU3lS4VXGc9L1JrJkL/6IE2fzEOpD4d2DxdalDoW4Jitw6qR055NNwV
	G5CVsh/ybYZE4OGA6vBYpTqUdEcfCHvV1dcIAxLYpy+Venl6jkjxdKHZe/ALErY4iyJJMjSyQV8
	kAAnfoRZP4wKkMdlNNKpfUOWG026Sd4RI0r1cFe3QGJeHqXuVD3QqL7I8Neu7qqwQgsI7s5pL0L
	cdVnE3APccs/yoZBTW73NZEzI/WoKiVatHEyS18=
X-Google-Smtp-Source: AGHT+IHwDteRU6Yz8aP+7dgjVpXAB0rA+2JkOitsu+96XwoftfjHHSIxcqXxmNoS+PXV1A0eJAitSg==
X-Received: by 2002:a17:902:d603:b0:234:8c64:7885 with SMTP id d9443c01a7336-23ac48b6862mr236842415ad.53.1751348297431;
        Mon, 30 Jun 2025 22:38:17 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:17 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:01 +0800
Subject: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
MIME-Version: 1.0
Message-Id: <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_223818_293522_046C30EF 
X-CRM114-Status: UNSURE (   8.38  )
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

Enable the PDMA0 on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..39133450e07f2cb9cb2247dc0284851f8c55031b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -45,3 +45,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..afb88ddf36eb8e5e3bf74fa29f9bc006e45814e7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -25,3 +25,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
