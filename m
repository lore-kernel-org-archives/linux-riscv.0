Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D70CA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yO5r4qbnSn5OuJJVNdO6fUYslUdJ0L8/W77ihdAsdDE=; b=QGHFjXI+9N3qQ4
	BUoDtOX1+zbfeluA5SoSjlLUifPGVKjdTQ4vzbzEK2ivf3pjB5lQjKSKntRf1+0sPjpAQDtRX4G6R
	FdkGW0cfxfX6VUocW6Zy8UJGea2OXi+Heis0PVDSu01N0EO3dhWHxx6TRoABdiYi6cUTeGiPdtJLj
	4b9vxO0Z3iPEAsluuisRSThBr7Nc4qye2RcIHx54fuLRbE1C+VpA9Hs6Sb/dLubihF43ifz8PdD6h
	7EOseOtmBKcX205UYXcRTpd0K09wpx9+eBkMBf96miocbTngOM42YWDMnnHBq8JMjY40gbz+YGsYa
	9upy3rKV8kfPCF9a9knw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlPT-00000006Bqc-1aGg;
	Wed, 03 Sep 2025 11:12:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkJO-000000061uy-3Ssn
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 10:01:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so3136265f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1756893712; x=1757498512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=Ia26frc/SpL4JOtTxTAf+XcumHqIeOIINC1O3XexRqfCIGmD5Uj+mE0urXGDtILgiR
         lS4djk6nLPwlFuArJGKrjDqwp7ueVoNdozSGQEGZ6tmyfkpYJPV+9k/X0287naXzyY5k
         AZf3R9SL++8F7wISlSdTLqSpOYDCgc+20u6/SrLfmvpC2ouAFtjRe9UeIERLDYqZbaoi
         DZK7Dd6lYqBVLuW5Cwf92OaIwCsrw9Il88iuD5IwH+2THc9EE3eOKl8P6G/vvHNHqbj5
         NfWnZw607gZKqvG2gmWacYQDGxV3NP9mMzqjIm0QZFxcf7SxAlzocDaxYk0nRCyJ0Tih
         MfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893712; x=1757498512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=tReZaPzOuoSCzYEZ3vR4XLAm4w5sPSoUz75Psf8MsmmqjKIMeL8u8wUupKDzdLHSg/
         nbsaTdF4kP6GHL7WA79VxqScdBxMNMnTk7kCDbA9zI8xhSQz5DB80sgHnNVfSZGUWA1e
         J5irMRktoWKpWAkYWrL6SlOh62ozzetRqa0/9WBMDVktJ8SiTvf1sjMfRahcY7O/sm1c
         DKZ2lGTZBn5UYd+ZBCP3F/k74c/2kFIgRBv9N4eW9Z+cyVyGE+8BcqCLCyXCdfZQmL3R
         EDg0Q0sLGy7NULmWvkIxrsm41EcZwrladICkpBm/c6alg8yiWzaBXg4vT/JqqewircD+
         GShg==
X-Forwarded-Encrypted: i=1; AJvYcCWj16m7ZPuQzJdVOLOxZIlrKJbioIry1ywd8PaLgdNCwEI1CTAWpGeV2JNjtMQ6iGzOGFzV7EmOamuZZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWEI8/DpV8h+SYDlvm5C3fVm2Wvg6/gBmDaDy9J3e0L+V2hsGR
	3bQaUjSE6/6WhPs/KI+DNz3LXaZ5Z2AblvrA50oB8HAqlvl9Q1eQimSfTyDJCZYGjwA=
X-Gm-Gg: ASbGncuIKQhDFbs6wqJSA4S9cssl3o7BNa2HcBKSIiqZzVvktcarIoWbvBvaf5i3+Ll
	n+QtC97MfMC4ReMTC4b6v8EWrWrVO/TesMLkIXgbAotS3F5Cthnk4sqcHaQdJerXijG8VLtlqI9
	AaD5KixpblbEKO1tD+2VR3gR8QWor934GJ5A6gfhJ/EP0DbbOmZGSg3QPwidowzSFrW44XpCmRl
	7jwVQBhH8J4AU3DqDoHwQiGy/l+dag0gZN4O55QVlSv2I7UYGynOmHWMBKlABSx1NIZzq+yOjRF
	edeN+S+HVwHdeC4osQfsmirNO8m0FfVoE5Mi72gdjcvu0HVY1QkHRaHLfvGFqpf4ft+dEoJshym
	IMlT3I27wM0SQ8XHeGBwQKuM3buQ54rGejp7eMiW5SUAhmrmR
X-Google-Smtp-Source: AGHT+IFlZq5oArcxA6dWnPr6LijEjpa+jLN9n3zA6K+uDuCGQ1hNKxqSyhK3P1G01ko5LeH0BDMpxg==
X-Received: by 2002:a05:6000:26c5:b0:3c8:29eb:732e with SMTP id ffacd0b85a97d-3d1df539ea3mr11440863f8f.59.1756893712086;
        Wed, 03 Sep 2025 03:01:52 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7e45:593:64fd:6612])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d729a96912sm10945323f8f.8.2025.09.03.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:01:51 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: linus.walleij@linaro.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
Date: Wed,  3 Sep 2025 12:01:04 +0200
Message-ID: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_030155_103447_28A7339A 
X-CRM114-Status: GOOD (  10.29  )
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

The datasheet lists this signal as PRI_TDI, not PRI_DTI.
Fix the pin name to match the documentation and JTAG naming
convention (TDI = Test Data In).

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 9996b1c4a07e..a3f433b611f7 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -847,7 +847,7 @@ static const struct pinctrl_pin_desc k1_pin_desc[] = {
 	PINCTRL_PIN(67, "GPIO_67"),
 	PINCTRL_PIN(68, "GPIO_68"),
 	PINCTRL_PIN(69, "GPIO_69"),
-	PINCTRL_PIN(70, "GPIO_70/PRI_DTI"),
+	PINCTRL_PIN(70, "GPIO_70/PRI_TDI"),
 	PINCTRL_PIN(71, "GPIO_71/PRI_TMS"),
 	PINCTRL_PIN(72, "GPIO_72/PRI_TCK"),
 	PINCTRL_PIN(73, "GPIO_73/PRI_TDO"),
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
