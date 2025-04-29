Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A438BC3ABAC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOP7MvcTTa5kRPNNuaUPt13rIqYOrqqRxXGjKwPPp30=; b=eupKOHW0wnf6ss
	km1/5QtaQY7K+Y7vnBVjy9eWAcrzSSU/MtvCob7Di377f7CHOfs0yI6YvF4K6dmPe61/8InC8Hk6I
	4fOxl2QsmS6bFqHbuhhnHu8AUQCY27Xkh0xgxV8kXp3eoQVU6PM9MRn31i3neqP0h4uAt+UWyCG2G
	IcPrjTYSXhvsi3Fd3agPxzxZwhJ8hv/Af6Mw7viAoPbuvXNqq1we7xxr0vAVllB1UtAabTK5I26LQ
	cPcx/SqLrP3alHqUbYtwb2Gx6Pt0BExCveOUfRerQvOjUtSn9f1p7e+jKlZBEBvWdOUpPu0vOcExG
	EdlH8vbpJCJKsSJ14wIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gmZ-000000091sc-1oTX;
	Tue, 29 Apr 2025 08:57:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ghE-000000090aI-3QKr
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 08:52:09 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-736a72220edso5692782b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916728; x=1746521528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSBQlgtaQud3VdsTPycKFsE/56jYgj1sJoxgbag7Muo=;
        b=FSXH9EDULvRfpJXKXpPUb2GX3qHX8C1eILxZw8ynuQdHI9zXnz4Mb5+WiSkZ7gYorr
         qhQWsY+ZjiViCOtv0l+IGUmWeSg75OpgXxvtChxw9FgCN/ANbXKKVu3qG1c9rFhbPri7
         w2Qzwc52LHpxX/7yrsQUKCw8sIdiYNvi12a3HzWGkZ15cK+0NLnKKxUphQterSleqvjB
         GXMVspl8766SArlwpkFS7lq8ByrMuKckqiI+dN2LyBUDGkLL90kFB6xIu9K95jFcAgNx
         K+g+C5jQ6JijlEngFK+CvOf0lGuV2bazu5mR6ETAHg4OjSayJRNHy0+URpYVoPVBJKWW
         FGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916728; x=1746521528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSBQlgtaQud3VdsTPycKFsE/56jYgj1sJoxgbag7Muo=;
        b=LbP0kxvly3dCMJOdNqk/dh8dAFaEraWI88QtOlSdsIbYeTKvctmgbkKv8IyTwHNWih
         XkgWaXPYtDFXcfxaA+5yC5JiH4cxNlKLQSx2f+EJmyeycrbzUOcX+KU8EZWCqE6Uodc2
         hVcI+tkcKYUMQxrMikJn7i4UYUMxX8F0iYGo1yya3N9/wJ5GmgNpOLRomsgLIsPb9UX6
         e8c7YMVzPFlEuvPDIbWcFOMWNeAYUU2lEIm9MYC8TzynKCnNoaIjkWdt9Eo5Q8giOxMC
         jgnqUIUj/D9P/qgQa0N2karz1m2dyocRnDIoYn1gohlMnyQhPyR3vgqb49oeBwyvuFe6
         wyMg==
X-Forwarded-Encrypted: i=1; AJvYcCXbdNECEyw+vJp6epCLEM9U2EsAVCjgnrih1AZYHnflf1gIoEBwU+VMY0tHWPCqzlea1quggBUjLjZGtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YytQtywxUNQNEocAdvYWcugeO7osRLgVPAsJMjNiTCwApQ/7O5Q
	agzG2STMp0Fy7RQkj4vnTbKvI0FSnnTD70lyqe+Y5lihs06sg2054FS2RVwPt8c=
X-Gm-Gg: ASbGnct2IYy9G0Lp7ypbIGcx8z+V2Hbp1Vp64/SlyXxM6Qx2DLbE/cboWZb6rPt+ia3
	Wou71ITN6O6vr7BjcRjkVOx7vY5uLfoYg9EHG13RU7AGT1fG/7GgFNVqOAjDE0qNCJN+A4fwgyI
	J4jwoDVlqpXa7CWjvfcj6Jom4kzKWO+EP+ZTqBuhKJqoRKXmEEeVfQa64q5IHg9L5qRDDPwk1nM
	/Y1aFtT48vjIWErFrUKL/nFnmj1j7xzQ00+TQFxXNkfxFtlD0roTNdq7D+0Nup1/DWP9fnijqF9
	zY4IdcK0gkD5Wc7oDq/hmatBkwSRTJ4tSzVnxcvoCllIIdECR4qkE6fgf+SNYIXsI3UQ15X6yiA
	EAdb1c38hhn25y5c=
X-Google-Smtp-Source: AGHT+IFKhORMMaDYdgpl/9rwoGwyfPRj2XbuzQCabPPPwxwDnPG2aYuvtb08xMFG1iEWZeP3qzi2Vw==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:6e71:e55 with SMTP id adf61e73a8af0-2095907d1bamr3201920637.6.1745916728038;
        Tue, 29 Apr 2025 01:52:08 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:52:07 -0700 (PDT)
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
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 5/6] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Tue, 29 Apr 2025 16:50:47 +0800
Message-ID: <20250429085048.1310409-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015208_851670_3F24023D 
X-CRM114-Status: GOOD (  11.73  )
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
v3: No change
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
