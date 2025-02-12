Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8017FC02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 22:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebvPjbQOpn0hhW3Cs3YRmmhXzCfN3tveW8fP0fbxR20=; b=XSOAuxXX6hiiun
	0B1ZBRkEbeIXQtgBr+JGXYJHZ+A3LSMHmqz/Uv1aVMNLqQylroxZYT25PNC28gUhxt4aS+4rR4znW
	CsNhEjOgoMzbZXZ6qLEn3+QLGLNWX8R4hF0Wjb2f8tMDzsHpXuRqhIyb+mPN4Vxo6UCx0lUzFbHKM
	UK/mAI3NnPM1rtXpypG+P5E9OIHwTXQ0aiBuWkQbEMVAsDJDw/XaevtuJz1AfFMNj/XMhzck0hHOk
	e/NBj4+NJmxIAeDQFmlcz3ljt/ANJlvMhoyVJ+QWvFzFMoJrO7zfXMP3CwOyNus3hZc2iA+Cm957O
	yAPCcSkPeQC0WY3DSTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLb2-0000000963n-04Jh;
	Wed, 12 Feb 2025 22:52:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLSd-000000094gE-0Fga;
	Wed, 12 Feb 2025 22:44:04 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso313469a12.2;
        Wed, 12 Feb 2025 14:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400241; x=1740005041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/tKyZfoRbPPUzYf6dFYLKfwilr+YnZbdz/u2PhFyVc=;
        b=F1QEYqDmGR1lD/hAS4AWG8pzPYrDeqZrQr+3/Ua5KmTsWCnMZ4jo2kElUMqRBa6OYh
         x7WvLTMZ9OznxAHn/yVBPIR0G116/r/L+VW0ARP+rQU0x6tlpnXy7eRE7/l0g6oNpvlE
         TdGAiSe7XEk5eD//mGtDZhkXOig69sOQrhAEUggkQjy9h8eMfBTbGe7JOXQ6Ey7ihVdo
         BCgj9zb6DYp7koAVL5fLEz4mDU4TjzqIsgtgTGxlufiOsC5ZLJa9RXasnH69qwvV7CNR
         130aTeaGtB4AAZmLS7O8/K2Va7b43gbFjKU0y562i61RPXWpPcTOAh0qgSnnX6zC6TPt
         Nwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400241; x=1740005041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/tKyZfoRbPPUzYf6dFYLKfwilr+YnZbdz/u2PhFyVc=;
        b=ZVSkNH1UUkoVhBH1nRaSF9IMg97UulStvsbmrc+AftBSGPyZR2wQ76KQnN8PcTvCMu
         k5Sc2g4UDPsXhlM7pO9G3EyPrG3kqnIb8P3uB8r2/BA6QGnOmBI3Q8EVN/nYROuWOQFl
         u+ncKmVPHrb1m8Dh7pIzoTUfsLL+lXzHKgVfU1FmJgL5PlLJZu9cvgyOwrrnBcdgQAUL
         uf1w0GWXwAdn4QW/axaJcc0qM9OaO+ZP0LjzO/ixcWfIzdhNiAYDBTnRzJsUpxI/Uga3
         6DkLkIvgPKaeJQh5rYlKs7ALaChWTdmcDvIiNcSbTnxX6EN/DcytWhi3UpZH2PicB4/c
         uSWw==
X-Forwarded-Encrypted: i=1; AJvYcCU1YL3R0x5ZLvEhkX0AaDnLRgj2yRrPk0JzIlXJe2Ro6A6eTOi8puI1CZfB7pJop7vgjqf7wLeH8NofWioqK6Es@lists.infradead.org, AJvYcCVz4eBJR6lF55G/7l3Xou2Dly0AJPdqERKxJh/rTQLi0T99EEIMj6LEJWnvhWwhlK6uDbJIXQfmTO+JA/M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrNAvKFuP+cWle9h/Wn/r2OfsmT6IjiG1YTlQ7jj9JO2OLpOTJ
	73g9NmX5/3dApPHZPwdIen4SddIVcF3r5cUwI79z/teuTpUrNHmzBkO9FYZT
X-Gm-Gg: ASbGncu+r1rgm8z8zIxP5bjseyGCYcGpHXGEW4VfEi0htOAuGf/T8KE1v+kqr/c3uGQ
	q0aczYZ8uBRLPIQYwSEzfzz7F7F0qoGaSfunPw2L5sC+WchQjQEBfPrnC6X69rsFFgV6kxBZlWw
	gm8VvtSdph2TrYZUbuOhJXEvFzOr1eSsxHmWl8i1kpAm3qcIal4ceD5his+vKwAOPN+jKVMPD/3
	If2RtIbeSeCIBkChKPsRYOCSVz/nHaxqjqMzd13poKFUPMz5D7xfuxtB/Hc3sMe6bAbJ9jeB9pu
	hQhdvAahCJWML2C3wWkpPd1Z9hnd
X-Google-Smtp-Source: AGHT+IGThbpbD+zHTmLwYydd2pJD015cbXimI1bgUbm6s5Na8hc25Axs+PyeizggSaAryF9ylHicfA==
X-Received: by 2002:a17:907:2d12:b0:ab7:a39:db4 with SMTP id a640c23a62f3a-ab7f34ac985mr448671666b.57.1739400241454;
        Wed, 12 Feb 2025 14:44:01 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:44:00 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Wed, 12 Feb 2025 23:43:39 +0100
Message-ID: <20250212224347.1767819-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_144403_097779_0597E75A 
X-CRM114-Status: UNSURE (   8.77  )
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

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..5680b8fb6b12 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -650,6 +651,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1398,6 +1400,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
@@ -1517,6 +1520,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
