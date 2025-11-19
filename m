Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED4CF31B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fyc7xr9zwqvWvSMuIvVe90uZrxeFS+Xmnz48U0WBTQ=; b=SGfC58feyNqBZf
	R6jzAJ1IVJ2taaUEJUTo8e3wdjGD7+kkzum2pe6C30ZsmdF6M4T0p0gSwCucAqJYi1U8BvdgeqMbw
	yfscj8VIxdqDYVCM62N50LqE48brMl6s/bfVs/GRADXLsO+yxXyno3WcaCyzNVUFx2xkD3kl81Pw+
	hXpQB6bITS6l5ByRbcioMsvf2HD6eE/k4/fB+W8C87tefeGBupG6g87MJEY63WkJj0Q2kVhGpBPYp
	EVvwqPjS5UsA19r+eAlKHDKOQNwkr65cr/WuFCEutv/D5cfRV3qEiCz1UHrxNJq8Kp+3i6uGo2Qy6
	oD2BDQNkWjkzvUdDCg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgke-000000034IL-1ko6;
	Wed, 19 Nov 2025 11:53:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgkb-000000034Hm-3fZK
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 11:53:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-297dd95ffe4so59790345ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553209; x=1764158009; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkVhmhWJH2xsEzSbcMaRRrW6ia9B2Vv7NsUx82PuIzs=;
        b=NMt4c3ciFDhrHOG7YjW8wOPX2KVEMzNjE+Gn5U78Y0pqFfKi5j0tCuMTcRwKEIawtt
         7ikhSzDwVHaov8UUhh8dmkqOZVYEXI8aA/tD+jbG4AHlO5FW4x/Ruo/XhaLzKe39hg6Q
         erIaVKgEehI+ZlK/VFm3HCPrYBew3xXj1CyxbKw/4BLnSyqTiXOmlvQqVr/U7ITC4xPp
         BA1EIsL2wSFIw1DdwPru54y5Fg3CurksHqi/vGxeUADj1rCcndsmDeza5esIXvPDGSNs
         5hTQBibD0B+x6HTIeox5OhDAEw7aVxgIeWa3v4e31IvspDsCAjybOKa8dGhPID97DVRL
         QEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553209; x=1764158009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkVhmhWJH2xsEzSbcMaRRrW6ia9B2Vv7NsUx82PuIzs=;
        b=S/GXhf4aqrJW5VHbkqP9hyaSYMQWaWAbj40yTsM6uZAheT+kvOFLagJTcmWlz7cJ0n
         61OsMj93TiXWws3OiAzkI7SQOviCH8yPP38Zlozu8vcMGK2Hkf4a7VZteGUCzcsJCOve
         IqxKoYB+uC4I9v7o/qejxglsKQnhRpu8ax6dKVV/cz8lrRaSFkMYEjswBgLuZBwdHX0q
         yeln5+3jnzvBHWMvzasW+qqSdP8t5HZ4S5Hug1Q1F4Fb3hf4C4I2rx3UDext8OCleeB3
         miqMxVKHZ9+sFOLcrOnZhaJjDzBV/z8bn1On8gxtJFXOv0T3j2z438AeLiaRtltR0qP1
         HdCg==
X-Forwarded-Encrypted: i=1; AJvYcCXVkR0rFxrPOuh4GcZ0qcVxcgpW6EQCHoGDej2LaL0dW9IKRDyQf9GWHZS757C+O6UewVOKXYyREtkGiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhtHp5DzI+GSd+sD9D5wpHRcKICdd5u12kC2qu9D7Essgyo3Fo
	2DOY0pgMVn470c8HJuxCMRVymcVQXkzXiaNtFcNKL4lrl4m2XiKBGyTe
X-Gm-Gg: ASbGncvceDNq5UuKqwblqbGwrKVPrWwYpkWcqClsXpzPs91tvGV+iGbE94yAq5iee+2
	M3KbRM4uo8L0p8tQFmh2j8ZW/0CBUPjbtibsYJ7lXHYFSe2WHnOwah2C4sbc+wCzGJWXPMt+mmk
	1qwyPyDxth2qFYAH+wpQKURjpuaQC7f6QvV66nbvGJWCddzS05Xrx6YzM6G/lpMWm/a4J8PmnmL
	g/M4iuk+QuZn4WCrIkPC7/NuNpQcCHhcYE5ABYMUU8fItOR79ZcYxm2P1GvyFQTvPwP2M8rR4Kt
	uGwoOUfP0Tz3AO3W7qlqS9JEYd/GAuzYOSLTXayTEFifX+qMT82aqhzYmHgRwM1DBPKm9QOiH5x
	2O8EyL9hSuuf/F2ChN64TZ416TrrWUgsPhAheeCu1k0axBtpC7SW9jmWcPFYYDLhfZ3aBuXsSI4
	3LYaLCDVY=
X-Google-Smtp-Source: AGHT+IGL6W4IRdUG3Pykh/ul7KcrmSUrOtfZbl9NcCQYrIiiCus1KZ/lienOW5Q0rnK8Jh29js+QlQ==
X-Received: by 2002:a17:902:e788:b0:295:ac70:10c4 with SMTP id d9443c01a7336-2986a74b0ecmr232959175ad.47.1763553209081;
        Wed, 19 Nov 2025 03:53:29 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm206818055ad.91.2025.11.19.03.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:28 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:44 +0800
Subject: [PATCH 2/3] i2c: k1: add reset support
MIME-Version: 1.0
Message-Id: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=1326;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=wTE8n3djZOFBW0Hn/pyVrrtw+swJ6pskokEvgXPqj2g=;
 b=5RS6cTQPwPDN1vYMenh1/T6oCu1CCVSmO2dMgtFDaHcqcKQ5jm6tl9fU0b/ialCby2DQo8WcY
 UhTQmN0qij1BbrInMIivwpwRgL5t5RjCVIFFOS2v5J35vm0U4BBgqtw
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_035329_922967_D2F89842 
X-CRM114-Status: GOOD (  11.89  )
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

Add reset control handling to the K1 I2C driver.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612..64d817d8315d 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
 	void __iomem *base;
 	int irq;
 	u32 clock_freq;
+	struct reset_control *resets;
 
 	struct i2c_msg *msgs;
 	u32 msg_num;
@@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	i2c->resets = devm_reset_control_get_optional(dev, NULL);
+	if (IS_ERR(i2c->resets))
+		return dev_err_probe(dev, PTR_ERR(i2c->resets),
+				    "failed to get reset\n");
+
+	reset_control_assert(i2c->resets);
+	udelay(2);
+	reset_control_deassert(i2c->resets);
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
