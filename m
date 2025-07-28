Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B045C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvZ46h5X8hE16pRWYyYIGOCsGCORXnD8nZWWzq9pgjg=; b=n7sECGrUfnd2eR
	KJhVvVBvNqObF57/Et/ntnJkvq532eoORkflu9sEWruqb9VFN5P8wWuP/bSyVRvIAnbdPe8QRVyoH
	riXf3mTUNJdoGZxMube0Myn2SYlqHsZ6jqgU8qYllzP9jejapvjeaN3OVA+9akMEVnJqygRHlbCCN
	pIsLMiicI34JYeD2dUObhxf6Mk8hRsKJ7h+zN2zSMsNZCJxDRG7EoysYkq/zBbCLdA+gAufNoYvcu
	9iiLGCSOr7+3Zycqhn8/gWxfIf/TAE1qAMD55BMMzFCZTSLAXz3Ml11h0PVWW4TQSvH0qzmLhsSg9
	zoPapgbNpOzk/CT5FsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOpQ-0000000EfrN-0b9y;
	Mon, 28 Jul 2025 14:27:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOiO-0000000Eerm-3FtR
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 14:20:33 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-75ce8f8a3a1so2588143b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753712432; x=1754317232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fCuuegqOgh7yiTp50CPz7MDoO4s4zlMG+vfGbQq2dc=;
        b=jZtq5NUYWXtlc2ZeTs57slzKin/70KUVnJdQBuJ0QkuinDje+PlyeWaALsBz3wUkJM
         t2pNsxI3SKrCeBnLhzwp4lxHoFgdf96VU/BGAa/pQ2cBQ1BWe2jVtFcYgZjXTx/TCndM
         EsRPZf6MCVOl9F4RkHtaBL6qiPsavjhyIgpR6M7XCAUwNO3ocwv5vW7p/Rh7s/eYsGsP
         AJ5Jt+/LCKrJm9E0VbpWhbU5fLi+Ta1QEVSFkBaxs87F1lWQsZfz/wn/YBlvnCZuMsPh
         y0eXjdnFDP1qDr2zCJhWP6SGCP0ENy+0u9nWPKGu8K7Y1vqZnCHPvfSf7tJL+79Ss8DA
         mjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712432; x=1754317232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fCuuegqOgh7yiTp50CPz7MDoO4s4zlMG+vfGbQq2dc=;
        b=SRyJr4MwQ9CZ7CcWA0iWG5s12sKHmUbkmKAH54325jihdXHLlbP2DpvSBpeajqpyuT
         yrH9NH5rFA3XkYEaC71fPm9VpC9DblXiOi5cXr8J5DBZQyuKtHcE0ww0Lt/+RuhLeyya
         dgMAXq8/zZwhU8Xt5D5gcqYTkthKB7sKUWkKLOP7qXCDSeE/0KSEnrca+hc6jzbh4HV7
         nk5RMpQ5S2uEswlfuZeqHoMBRPnBOZIftuqhOBDVdOHQyrMGlfT9lenw06wFzqcRHfDC
         BKXNyW8F6o36GupUBGz9cgTBGK5flk+EWgWRA8uksJRI6Oh3aDCS6rolqiSOSHQMUf2H
         4TJw==
X-Forwarded-Encrypted: i=1; AJvYcCWYVcWkNpNWjf0fGf0tl1s8HxFHGI3qvMR9xvrKiKjpWwB1G4T48hP6Mr87kIdVHaXXijPMNIQlG0WIPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgb6ekYgeoG/19K6ceYE9g1yRJtEc3XwiM2BNhJQP/GCdHEa7a
	ECPU2bHoLf0Auz1TiMS3xcF9ARLDGqghdDmru6dZk4N6kx8czySp7EP0
X-Gm-Gg: ASbGncvE4mDH5CrdChHzRKYAd0uNZ9iLE+QkwfNXo/t7fdKUCNPtVJrdGIgsBZXqxXd
	uC8EiUosO1EtmVdSRosOMgQ0y+h+YIw+V7exPI0168Y0FlK+kwhmL48L62hPHW7nUwaJdca8S3o
	P/RKSPd6ELU9T+WyEVVSzfz0LQdz7OyAGzNHc7xqTH348A8P5qdmtAz/jP6aWe9wp+aohJS0Ril
	/YUmnI83geee/S7tpR4Yn07AePS5cfwGnp+jtyWahSAFlmhgd8OHWTxEjWWvpjd/HAwIhY4St+7
	MhlFkSqwKLn/krnO2AV59YBcQ2rABzXPX7Vog0YHk8htaIBxMY32llBzPjfLHkLktItnaJhv1xY
	uJE51Kol47wzbyzL+GsYhqb+MHKHNqtVi
X-Google-Smtp-Source: AGHT+IEObfYk/Wz6SuT7jPbvRWcLuE1W9sEClVf+JDsYA2szDPxZRsKWqL3+hYUXv4qBE7HxdUFs+g==
X-Received: by 2002:a05:6a00:4fcf:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-763389ac8ddmr17218955b3a.16.1753712431742;
        Mon, 28 Jul 2025 07:20:31 -0700 (PDT)
Received: from localhost ([2408:8256:2284:4127:de49:6dc9:a446:157a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76408feb725sm5638582b3a.60.2025.07.28.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:20:31 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 28 Jul 2025 22:20:15 +0800
Subject: [PATCH v3 1/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for
 SSPA
MIME-Version: 1.0
Message-Id: <20250728-k1-clk-i2s-v3-1-5d7579f02227@linux.spacemit.com>
References: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
In-Reply-To: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753712415; l=860;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=PxJJD5BdYiecz3+HAlAUv0mqXDsb9508pUsTSJAhu14=;
 b=AR0VW6KLcEEQ1zKFa+FXIaRCpIsXGTDIiSgdsPRiKOVyzjaJvdb7zMJtedM2MZ2oc3qcz5rlq
 kuoNFsP3bN4DgKsQQIamO7iA44EY3wLztWmhbxcN0QtEPsV+5GMDkBb
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_072032_820003_FE9784E6 
X-CRM114-Status: UNSURE (   9.60  )
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

In order to use the virtual clock SSPAx_I2S_BCLK in the device tree and
register it in the driver, this patch introduces the macro definition.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 35968ae98246609c889eb4a7d08b4ff7360de53b..9be578953d71e79e93eb10eaa35b47b97812e826 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -179,6 +179,8 @@
 #define CLK_SSPA1_BUS		97
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
+#define CLK_SSPA0_I2S_BCLK	100
+#define CLK_SSPA1_I2S_BCLK	101
 
 /* APMU clocks */
 #define CLK_CCI550		0

-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
