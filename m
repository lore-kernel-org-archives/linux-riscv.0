Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555B7C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLRr2HvHLUV841LKd0eO2KbCVyiwBLlyr2ULTeSYSq4=; b=lizQdju7dZQZjK
	h9z/IwOEPWQpwz77WNfMJjQGIiG1pH6iMfOXTIrOFzJhDaN2K8y3nFvVzXgVnkNc238+x9+yyjaGd
	x1NIhDepFS0pCyRC8CuVLsdaaaFMUu8uaOU2D0AXXpTuOBxsZYEnkQ2FhvodMsHvlJLCeLj2tA8dX
	p2RYBOD+0k37jDNLa6MQdK4XQd3uzZ9O7VxbJE3JUgdZmoOs11xkuXo7Ea21I4BRaL39JPEkPMr1p
	oA97rNyi7oBLXYvQlp443UuXjulEduDAY9Osi0EGdDjizfeBjsrcBECUWoWsO3g64yxK6B2LbaRiR
	SvvazoG3E+20mhSSWIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64r-00000006DNq-35nm;
	Tue, 24 Jun 2025 16:00:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4hL-00000005vKq-0iMK
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:32:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4530921461aso4861625e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775550; x=1751380350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVbEF9kewOwZre8oZmBAEAxpHXBpu+7cKLNa/Clhms0=;
        b=c9OdITG6f7pwC6jZmsApAj1cZeKqtwvfaWFx5re9gC/ujHPAMMTd6eLFt3p3UNAeIH
         v1NkwkmlVZ3OnkoLX7MgzQg0u38gMYQCDgRl+4SxNC05dW4lz55bbpxu5BXwb+WQ46Sl
         eLkwRHz8GRD1Bket0cisSxszFm266HZXeyh2aG2ea5xSFkYESkxHcNV4XHoetwleGqbI
         ObELjgR2lAkF1Z1aAE26i+mmDCwlHukCyDSYkPatkcRRA4/kTfHJRs9mlfqn/3QAkY3u
         sNV+7N3dv/KkvCRMG8O2aGel4z6kPSaWv1eP/zkf90Qrla8QLOcEYVEvN+dOXQgq2RSi
         tvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775550; x=1751380350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVbEF9kewOwZre8oZmBAEAxpHXBpu+7cKLNa/Clhms0=;
        b=kp0fEgJSdk8bbW+tEj+eN8IJkN4cca+XDNz4pi9GZMRX2aSrLn85bNeAMgt36FScpr
         LOvJDtVPnlDfxvDSXQx+gd4MrfNXY/KZ7DBV0srYiDowPVQ65zQKAOl0EvRh3ttXTO4s
         /6M1U42Zsketfc/yOB3oiuzQAPN/7TmUDpnbXSulPoa20cBqSEzujMMlXWUrFl3Jf43h
         7CB7kG9a2mq9fuwNhmpL58N5J8uPir/ixpJ/ayfikrHRfvIKR1jiXQDC6rgGKlpxUDUR
         TSmfeag61/FGWgJeYlXBOCgBh+GGMYOliijfxgdA9oPKFXeiHkv5nWh8R+xCB3lIfCdQ
         vSCA==
X-Gm-Message-State: AOJu0Yzk+D3Uc04tXQmRuvlK5eo1WmttcMF8dzWYWzBFZl1F9DZtKBHd
	NwRYRojxiyzOL5Ip3ARYlL0mSaowh8T37S2P6EXANi6e8KQobDZzLGzcZGRaZmzzfdg=
X-Gm-Gg: ASbGncv9DA0GdNGXCQevPvLITbZj8n9JS4gqazVY5QgCUpyQXpOFs7Bip+FwFhqcDwJ
	EoFKW5B9FTg0VtdQhHdkxyxC32gNjY8ed+rbkOUtDfF/fFsN0/XrSAp8ic/w53cBcpXfoOu7Csr
	cbNdOzxjbNsVdPGkSkgvwv7+GE1FgXSh1t2Tliqjr/lFm5O2uWV7l7Sqk2C4dorhGr98kCYYAkV
	yZzrB5BoYA8GXJfNSQLc5LFfGH4lzLZtbbEb5aDgTkgPTcJ7m587ikxa1DeD6zRUGB3UYTw2Gpc
	pW1rXZeOy5zgzILcxHLMbEX0j1Nu/NjBfqlFCcKFRm2cpFMFTUOgBrMU7TTikc0B0yM=
X-Google-Smtp-Source: AGHT+IGqsN8V2Kqq4ukhS8ZiL+K2QB+8bClwqfh0d/aBfYgnP752Jp9v7Ul1nPRg7YWzqlJ9R0sP7w==
X-Received: by 2002:a05:600c:468e:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-453656bab67mr174529765e9.31.1750775549662;
        Tue, 24 Jun 2025 07:32:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:19 +0200
Subject: [PATCH 2/5] pwrseq: extend build coverage for pwrseq drivers with
 COMPILE_TEST=y
MIME-Version: 1.0
Message-Id: <20250624-pwrseq-match-defines-v1-2-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2ehPYsnzhfIr+Sl5KtygAfKZml3wCVfX6aGvffUmSwc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb5/ZD6cGNe0SODQu8G6MTV2TyemaIWJGr8n
 IbX+Krmp36JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+QAKCRARpy6gFHHX
 cnh4D/0eF9mZsgltwhV+c03clkM4zPTtNKVX04B9cuU4X5DVbI0KgJvcPhVe6Z+gnMMDNlUlWkW
 v3r86iHn4p+K9ChVY/FfX7chS7YFtby/vtXUUaD4Ktefsyi05sD+gd1HoVKfGlZ8e5AnXrPvPIW
 c/6JzP64+G7QUnMKONgwaPVAhCAv9Rx/ty4eoj5WZokPtwhxAYxG2BqkKUMpOq0wRVRLx7M9vYb
 rOPr5v8vQBIacA9NxL/nQpr+6J1YMSBsIGbcASAf6EwdhZ4IgwsN1jvuIVm+IHsN/jy7DbpHys+
 B0ZIwglXIdg+432uOpCtZyS5twVOHuM512PaIhGWsJuFemzx2DAO2gixScYleFb322TqpVg8wxz
 /WcQCk8ojYAM2AICYS6E/YKWUvPjuQtJFpQKGTk1HX1PMcqjp1DkIvvBQRmfOTS/KxsROJcFutJ
 CrJVNlzROukJYtbFWCKqBNvG0MHBRhmSIdyLZdVnqj8Rz2dWYxnxZsMxJBlKz3olyZL21dNHYtR
 mIBQywymAMf7dYb1RrNaN10rF464jtFrMvoVaJ8haulYyjKw77wMRY91WreQLs0LMVKPsuhID0b
 DS7Aa5GzGBI1qsnh4zmgeDUqOxLcw9hgbytxNMlSH88ooZpYC8gIsnIRSwCm3lv8up+Eh7m4pmC
 lvBl8uUD1T+K8Vw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_073231_220516_BFA59F9E 
X-CRM114-Status: GOOD (  11.19  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable building the pwrseq drivers with COMPILE_TEST enabled. This makes
it easier to build-test them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 0f118d57c1ceddc03954c006f99b5990acf546d4..280f92beb5d0ed524e67a28d1c5dd264bbd6c87e 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -16,7 +16,7 @@ if POWER_SEQUENCING
 config POWER_SEQUENCING_QCOM_WCN
 	tristate "Qualcomm WCN family PMU driver"
 	default m if ARCH_QCOM
-	depends on OF
+	depends on OF || COMPILE_TEST
 	help
 	  Say Y here to enable the power sequencing driver for Qualcomm
 	  WCN Bluetooth/WLAN chipsets.
@@ -29,7 +29,7 @@ config POWER_SEQUENCING_QCOM_WCN
 
 config POWER_SEQUENCING_TH1520_GPU
 	tristate "T-HEAD TH1520 GPU power sequencing driver"
-	depends on ARCH_THEAD && AUXILIARY_BUS
+	depends on (ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST
 	help
 	  Say Y here to enable the power sequencing driver for the TH1520 SoC
 	  GPU. This driver handles the complex clock and reset sequence

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
