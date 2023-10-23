Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A500C25B41
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oroy76SzILL1mjoKXPntLhNApgHV8DDDJSfFQRFjAso=; b=iP2E6pJQXgrYnS
	UCJhefTEEeqNYx2iY5lZplbWh9hTyCmX8YRfrzySShWAER9Z9MEdvX+pCnk3txNYoeuXC/lc11/As
	242GtVoSvpP6yzDvctnatPp//GHe1mexLInSV9H2owCwqNAOm+0R9rlmiQYqr6AG3cbSHVKm4S9od
	TwOStFiINIMlVBeFNT9ndktAVdXdIWrpRsRaRvAIHPIyXSW7suxBMIzpa2hHOx62jTCBAf1oIAkwX
	c4Bbsd9blYM9P1ggSYNM4PhDSNlsY7LrgV/jRK0GzpIcdwN/JhuDgdG2kCKBXe5TKnzAmkvHxnEte
	zT09YI3tjMm4t/XNIOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJa-006kvE-22;
	Mon, 23 Oct 2023 08:29:34 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJX-006kt2-11
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:29:32 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b89ab5ddb7so3021987b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049767; x=1698654567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yC7lpeLF6zJ2U1K9d3gKHK6RO2c15uLNrRvH89Y0oYM=;
        b=aTH14A3Bc+c+5Nt8Uq5fxGhO7qV4N1qJl9UJo85Jq/Wd/Wq6Z2qbLxTkJIXiQLHhYF
         Cowh76SyFeFkV9nqCUgZLHpHk9crD/j75eIByRCR1RtDcH8OTPp+Hz8gMHa5cVDQfwtz
         fgEQcZeS8JWDNlTwqA03PMkgYC0sj0+HOm213GgmPVuvnyB1EnT9uBIyl5eMFqUD54Dd
         TadhOGv5AszYCX5s9Ic7prTkyk2kcZKLMO9v5b76Xrk5p6g6+p/zegtAJrPdWOLO1ysY
         8/2fsLgKTqEBRSAdjyMrzugtYgLY3XwioFHzX9q9PC4+jtSG1LwWsmKegF7vDEo6PK31
         FL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049767; x=1698654567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yC7lpeLF6zJ2U1K9d3gKHK6RO2c15uLNrRvH89Y0oYM=;
        b=ATij3HM1kjvZ5RzWUjwna5Z+DNreEn6q4LtF8MlYIhm379VY0O6So9B4dKdNcAPXq8
         4MGKRQfycpKzOPd6s2sw/pyKf8S//aPm+UaBdLq30hIORb1rxGmavSKu4OyTahKsS4bq
         AjnjrTvib5RZQyW1IJdDCbfIIVapkCk6FXdP/+nfdJAmtacfQDjcqkLtdTeCjiWFKhQE
         dfWGgZZenzt8ziZAZnxeGou33CzJKWBm/lrO8L6M6SI+TIf6pCqfsgUlUnQ2S4ZG46aP
         M8ntUAfqzZiMRoduuc5gT+WXt9pcc07fMj3nlUNOGzY/0yOQJRllRb+OyaDjfUAAHg6j
         HEXg==
X-Gm-Message-State: AOJu0YxJpuvfS2pdAyykd6Cdil1ogEyXsU53+GjpjXXLlOpIPY5bS8rV
	CPY/7lKuy4cSphLbuXAJ8md1Eg==
X-Google-Smtp-Source: AGHT+IHCH1nMZJNeGDEKv3u1kEAVWCuStY+cy0vOx97pHNcDM4nqv54AkAVkcpOIZIr2dvR9THZ/jQ==
X-Received: by 2002:a05:6a20:a108:b0:14c:daa9:5e22 with SMTP id q8-20020a056a20a10800b0014cdaa95e22mr10514808pzk.45.1698049766796;
        Mon, 23 Oct 2023 01:29:26 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:29:26 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 01/12] riscv: Introduce CONFIG_RISCV_PSEUDO_NMI
Date: Mon, 23 Oct 2023 16:29:00 +0800
Message-Id: <20231023082911.23242-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012931_357161_899A4484 
X-CRM114-Status: UNSURE (   7.13  )
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

This commit introduces a new config RISCV_PSEUDO_NMI to control
whether enabling the pseudo NMI feature on RISC-V.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..487e4293f31e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -669,6 +669,16 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
+config RISCV_PSEUDO_NMI
+	bool "Support for NMI-like interrupts"
+	depends on !RISCV_M_MODE
+	default n
+	help
+	  Adds support for mimicking Non-Maskable Interrupts through the use of
+	  CSR_IE register.
+
+	  If unsure, say N.
+
 config ARCH_SUPPORTS_KEXEC
 	def_bool MMU
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
