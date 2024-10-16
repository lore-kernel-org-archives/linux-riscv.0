Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317C8D20687
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUhzx34cD/ciqgYtDH+wuwEvfBEANjjVWjCER2ggrTw=; b=EhBYzM40wwM8mj
	O9nXzxpy6LZBHqTZeD2+S4LvdZB0pnPW3eyvyBySYCnTupJPzj2DfuDnWeu0o9+AO/61WH9euU6Pi
	tyBlEzDqxELojDP5+GieRlrgdH2n/+Ub9myf83D+Leks93PUg3w6xvKgZEqydFByfnnnKLo4hq+TB
	MiUfBfP4l9dB6kD/pUqdhmH5pWii6JxeUhfC6d2FQ/d15hPQGK5NPrSTSLb+7gQztIhgbiWMhtk+h
	ZgMgTf3zQRE9qQuop5Zj9ntn/0so2t5wEyXfNZzOVlZ9Jw1zYEe1H4HvYAawH55S3eiG7+evI6ZG9
	BEs0KIHXxe34PMMlq2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rmV-00000009zzW-3Lum;
	Wed, 16 Oct 2024 00:20:51 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rmS-00000009zyX-2HRv
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 00:20:49 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2886e2b878dso1671024fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 17:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729038048; x=1729642848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVj0JZ+cVfOjaLAf/i9q4f7a0NWdixO3jwQiTDHespQ=;
        b=ITzuCofJnRMIuRvywfxclFAPZW/YYm9TVKZo5HJ/Zuu+r+MC2OC4PF6E1sXatC6bMB
         1cATa70kv+drNSsWlC0S1o9EaEek+1HFAlkO+1uluhwzjYb+Ht4sIdeLVux9H1Z4SrSv
         zJdLivDBwpWuHYGOfPieBQA8PVhodRnAKets3azYRC0rw/b0F67PylJOY2V0rUWYM6rQ
         f7cLvhIWNQi3O89G7uJcFmeM4IEwNX5Zud2dIi80hLjfrkitEl4Q6AnE5ZKEInDzPIbG
         yfp7/cr6ee35U53RaQa3/y2lchO2FuYGrzcCPXqpcibYykqIzl+Wit7WsaQT4Pd4PMrE
         ZLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729038048; x=1729642848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVj0JZ+cVfOjaLAf/i9q4f7a0NWdixO3jwQiTDHespQ=;
        b=SBO5qPYQ1wRsKVimqx/ClxGYe7w/VK8yCgaIvz02/JqS+t1ZHhDj3ZBexsvRL/DgoU
         xBv/A2UOVLSpFRuQ+eF+a45mrRCC3HAFEReuUdEu4BpYJddnM5gyN5UpubdvCZ7Q68LD
         0wdgrg097zxV23pFWNXYJQvu4CbgLUzcIV1U6wux4mq4myDIjG+s0cYC8rDUlWqQTEfX
         5oBSOQlGAKF2nn88hF8zU1EWgb1AAnmC+SSFlxjyO9EAJFWm6blB1H6UCSuWXtUqiHxP
         iqC+C4R8ZKxvngH1FplncArtmG6YN5qEPtRsyoorjmTiEg3NI4g6ulJi48agpgnYuLt7
         q3cA==
X-Forwarded-Encrypted: i=1; AJvYcCVK2D7LRShuwwqqH1gwBQuJRBYWEqCAV8xSEJGE1xGla7S+UUzPY/CDysJF7pDRQt+YHWJDQmuvgqM9aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIlIApIcWA710jl/fJ1uIWQEP+J1rE/dps+TTeduL5hBcSZ8Uy
	KaaFnv5jiaTVJDEzcFeonn25pic4An3RZ5EAn0YhJz+egBM2V6Ta
X-Google-Smtp-Source: AGHT+IHvf7ouPtaSG82xKb3eFmMLOpPLuTSfsOfTvP7DU8b6q07TaVWaTqCFDJB3CQRdG09P+SIIXg==
X-Received: by 2002:a05:6870:a692:b0:286:f24f:c231 with SMTP id 586e51a60fabf-28887376bfcmr7450243fac.25.1729038047659;
        Tue, 15 Oct 2024 17:20:47 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-288dab8a172sm623857fac.6.2024.10.15.17.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 17:20:47 -0700 (PDT)
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
Subject: [PATCH v4 3/3] riscv: sophgo: dts: add pwm controller for SG2042 SoC
Date: Wed, 16 Oct 2024 08:20:40 +0800
Message-Id: <56550a6c9ba94c170d32b1f7c076b6faee42ae9f.1729037302.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729037302.git.unicorn_wang@outlook.com>
References: <cover.1729037302.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_172048_608675_1567778D 
X-CRM114-Status: UNSURE (   8.92  )
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
