Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F114C369B1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAJhRIYus6/kdOwG+FjLqsEKh1br8KD2IsKGLwjpiJU=; b=A4WfKewSIW3klB
	YH36JMG275a85bB5OyEe8YbMR3B5e8kW4dh2GCN6DZXpeIipZoMCSl14Y65KSGuhF/Eg9pknpus5O
	tl2cUYUbW3C0zWXUTkIsl53ksWnQn5SIHZvfMVuJ+wDE7C5K/F2Ex6zzDSJOZPksVMe13HDOPU/d4
	/0aFBaQq+e65/pLOUtJYQiDEXZR5vcPhT4ZUARJpvtjfylREi/RRofmYwc2W64zjCO9+/JIPfv+1z
	kTXebsW1nCiUtPrX8PEdVdE7v0xdaa39J+vzc94wvgUIUjmTxPcj3tZe1TiDqQGrGa5/51G9cot7m
	eZjN+k05KgSupViUpQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESF-0000000DvGl-19vL;
	Fri, 11 Apr 2025 13:29:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EEa-0000000DsXn-3Bqx
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:15:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227cf12df27so15754515ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377352; x=1744982152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMxmUF14/8mW48hBEyGMdh9vHYA4geBoHm6tUaBcjb4=;
        b=Wykr6qrLxwUrWbg4ZxJ/93BmMAc0F7S7TxF+5+ihG0X9dhbF0sX2fj2FZhH2iIgCdG
         64m94klG7mwxu4ZudXuHM1+SWirHGoK4bzD6teH4FOyvjKnPTd2+ILIXCy3dXr3hd5Vc
         tvC0iavT3eCJO4md5AKEddpKRLMLquFLPNdiI6IeYjhUJbtk7Ki0VXM28JNsgNUxZsuR
         2YLeB7hajxsCAXosVMwkbddC6euruC9oDu6McE5kIs6+PkPaP8ejVG0KvLEfijsUNCJE
         t0o+VOEM9bydkIwHV3Du4UEuh8o9u7VNCHh7K9+Fx2YfATa77s1mWCog5tv4tDWA9cmH
         CM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377352; x=1744982152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMxmUF14/8mW48hBEyGMdh9vHYA4geBoHm6tUaBcjb4=;
        b=J3HvBtX2FxvMDqZwO4ag9M+1HOZYX1M2T+Upy8xencvdQTvHbvZbq7q1oIqixtAdeW
         t71l/PkJ3YqCOJMbo0dksUBmrMOPng7FcLIwpZf4AVoK3yXKQvuVVjYugGifKn1PPzgD
         s2zAJjGbUaTvWXNBLJ43aajKES2ZDGznCUMra07MgLTUsHRy88QswOAeGg7E3lJ/3jfk
         9xa8zRhucKFxfFJVWf28G/3L6UEJwrWX0Nke31bbJpKFg4vgGWAXiTJ7ExQZH8FrUCgT
         QchE2NDeoP6FvuG0it5yhpNSZ++pVAyM2nIPiaG/abAPWAQZ1UO8HRn4VUbZLmPWE9CM
         7W3g==
X-Forwarded-Encrypted: i=1; AJvYcCVuQFG48TJmftr1rxt59d5blqTMBCPJfZHFvyInuTqFxFTm29PirsflbugNdUxX2ePoJPaRq+zRj7Jm0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIS3AZfLvcUTvNRESgC0oUbLDeI1uPhSBskGnklLdtc5pOnhqz
	Ll9eDX4VR3NIKB//kqp9j5zbNXRT9rCMoV3txZmnWerD6Y4NPygxYQ++R3FzkXE=
X-Gm-Gg: ASbGncvvGbSORCHKJAk2lBfg4XSYkdrpk+6L8YMv9JNU9qBopoCCenl67ntL8MnFx5O
	mZkEum1P99Rai4JJGq+NfTSKyuEQwbSMLHmLHZZJy/LFA+IRDKunn01Ilt8OXEF+Ek0VVY/jBIK
	NKlg1E/vlEJsv2+jeZQ86g2zdWNrIvHQJ8qaUwYMPSmoUZBL1B6h1bOaYy7ENI5JCietPN1ZRCQ
	At64vpx+LZbhlgIah8jHvQm6RkkPfCapIMnxfACzM2IpwFlFrAAqIL8MrE6S2WFeXBc9EN3dtvm
	p8QWa0qndDqzCsWYEmFogKBEHslE+Ko=
X-Google-Smtp-Source: AGHT+IF38ohQyrU5BVLNrtAgCLmegI1hrqaZkZmcE1Ga97hpdeODRbY1vYS67kKK1t7zEi3qN8rF9A==
X-Received: by 2002:a17:903:1b2f:b0:221:751f:cfbe with SMTP id d9443c01a7336-22bea0abfecmr45250655ad.19.1744377352063;
        Fri, 11 Apr 2025 06:15:52 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:51 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 4/9] pwm: pxa: add support for spacemit K1
Date: Fri, 11 Apr 2025 21:14:18 +0800
Message-ID: <20250411131423.3802611-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061552_798695_7F323BFB 
X-CRM114-Status: UNSURE (   9.72  )
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

Add SpacemiT K1 support to the PWM PXA driver by extending the
of_match table with the appropriate compatible string.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/pwm/pwm-pxa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index dd9c6af0f672..3835eba824b9 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -37,6 +37,7 @@ static const struct platform_device_id pwm_id_table[] = {
 	{ "pxa27x-pwm", HAS_SECONDARY_PWM },
 	{ "pxa168-pwm", 0 },
 	{ "pxa910-pwm", 0 },
+	{ "spacemit-k1-pwm", 0 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, pwm_id_table);
@@ -149,6 +150,7 @@ static const struct of_device_id pwm_of_match[] = {
 	{ .compatible = "marvell,pxa270-pwm", .data = &pwm_id_table[0]},
 	{ .compatible = "marvell,pxa168-pwm", .data = &pwm_id_table[0]},
 	{ .compatible = "marvell,pxa910-pwm", .data = &pwm_id_table[0]},
+	{ .compatible = "spacemit,k1-pwm",    .data = &pwm_id_table[0]},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pwm_of_match);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
