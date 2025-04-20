Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B75C369C2
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Apr 2025 07:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xi2O02aqqMvVVAgEtSfxSrww/8hKGGHTBEN4cDhlvmA=; b=alJDqxlr0i7r3N
	kkAvxnXf8pgH7+f58jZuqwclcIU6OeeOHQtG0G1rmLNbKLaxZiCP1LSC/LU0D+j+QHTbyUsX5HdgW
	UYCyI+aRXLWT8DauNA4TGA9hWRoxV7ldqSsvezCsgQ5JjAQbrHQCWdkr2Q0RuuyaRZCi0ObHS7EPX
	QUAAq6LNgMDOdAf2DbAQr2C/zeExVMtDpXvdK/IxRnjIqyipfM2PCtTnuDw72i4s7kv6n9nnptL+V
	ao8uu/vb9nSns5uEUBkpvKP+NlskpJaqHbvjWO44zBYoayfHpXoZtTB3TvFLaewsDi1cBmDwAVn9H
	kXmEnwMjLKHI1Cwg/W/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6OkX-00000002Igm-2yY2;
	Sun, 20 Apr 2025 07:05:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6OkV-00000002Ifw-2pNL
	for linux-riscv@lists.infradead.org;
	Sun, 20 Apr 2025 07:05:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2729408b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 20 Apr 2025 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132755; x=1745737555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82p2hGF43l3nHL3xd1lQgBU5B0CP4KmhX25rKqULFWk=;
        b=wICmt5K5aOgjowVLtaoNjE/L9+ywZ1dsdPqt0GCqRGwyz2odFCU3fElqB10ujdV44f
         aOpLLiGVTlICHAbngp6CwNzFk0XUfpzAq0HXXJSCxHBXmF2IpmZ+WyyTDva0X+UR9tem
         5GCulkFMI8f0eatr1PFQvCEkIGjssnL+8KM52AvviyWC60GJs+4k/xL8XCjtziUVeCbS
         eTa9XFLt+oL6j3vq7Q1aA5s3pAIaPrMF4KboqGYqIUqBbobb8NsnIeRq4XvbHh1He1Y3
         1m8kG9LUI+dif2dYkOO8CqCG63TQQScDdyvg5xJ/9rhJBBE2+K4Tnu7G6YF5fLTEIVkL
         Ax4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132755; x=1745737555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82p2hGF43l3nHL3xd1lQgBU5B0CP4KmhX25rKqULFWk=;
        b=t9bywayuqmAS94LOBgAw7O6C0NaYOS7Nv9/QAiJKYZcspE+szIsUy1TcpNp5ak93e+
         AFeQZp/hUpjszu3MaimtXDwE7FzKOwNq9yeHsUxhgtmk2Ik5CtJy1YJJ2DufyBopBFjF
         egez4lOS673vhdt+5aRb6Sdj4wOuHvwEVOtSFy3aeX3TYf77Iwqs0epl1+w9C+XGWInS
         OQ/sEZzbR0x+RENRHV8ceZuCDY/5J1PvlMgoQjO/c75E7KzM0nlVE/GBBUOLpQNjxQ+4
         hzDssJRcwKanA8APM4okWWoRocwfM7dUYGnP5owDaZk8KY6K76vyvGhQj5KxdcXc+9Vo
         aiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP91uXTaXmSlaalWknc08rP8wRZkrb58a/lti3WuiY/153epseLP0hPW/rq5oC4Ios9LAAbDjuZGTZUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeJizhrnlEO716zGj9PekyL3CK9Nox6TFrLh09PQuaIJH1eaR4
	Jgn3WvymRBODGGSFl465OnKnqOO4q5pTV7BOsB9OtcZnEVB10jGa5RlDDwMz/x0=
X-Gm-Gg: ASbGncs2Es9lwyDhsBWEDl/zgBSQG0JGRCTh2Wyi3j5Ne9Z9VDqXF8g95RieOPKce3b
	+BSQbcpL+bwWFBSI4MHjumXqEy5bxNQZkGyrgWiDr81UO+tv3XUGfyxkTAQoYPG2wzJrZk4S0N/
	g1jYMmchc87TcI/prFnoKLYviEFKDaY3gpept8XvpZbaTfHNRZb8ESZkDu/M3+ZY5vMLhNgNQa3
	ZyvykjeruHHhXtftJB7wxs/obs8BPBUunj+KWm/iDSUhpYXiOBrtIftslK1hRBAN2awCHPlj/rK
	FcE6NEwvTrpYtw+yJYNnBWuUYNnkxQ==
X-Google-Smtp-Source: AGHT+IGlKkNRMGUbwKmTBceKff072Fm/DzOacdnjFvDMw7BvjtUfzlAQ7rY/VZVOV3UNRwKeqrDsWw==
X-Received: by 2002:a05:6a20:6f92:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-203cbc75495mr11575555637.25.1745132754866;
        Sun, 20 Apr 2025 00:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:54 -0700 (PDT)
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
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 5/6] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Sun, 20 Apr 2025 15:02:50 +0800
Message-ID: <20250420070251.378950-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_000555_711329_0C54F5E2 
X-CRM114-Status: GOOD (  11.13  )
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

The SpacemiT K1 SoC uses PWM_PXA driver.

Update the Kconfig file for the PWM_PXA driver to allow
the SpacemiT K1 SoC to use it.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change

 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4731d5b90d7e..6731669e724e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -493,7 +493,7 @@ config PWM_PCA9685
 
 config PWM_PXA
 	tristate "PXA PWM support"
-	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
+	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Generic PWM framework driver for PXA.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
