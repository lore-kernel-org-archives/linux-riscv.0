Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A84D711D3
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 01:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6m8UHr+3pXGBOvveHpCq3fkli48/bRyzuTL2kfxnUY=; b=lV483eaKvB4D6Y
	R8yG5qZQX6BvksN/MaIKsWr3vkjvjb8P0PIKnSPz0hDpRVq6ygrClVTE3G3d/Od7v8hhKiuqq8AMM
	OhJmMym+BPalX7nfVzKTHlnV8Od5DGnyeq1uyq0UONC/+0eWTJYcuXN2DIyBWK1dRNbJpT4Y1NJxR
	V9GV54hcJuKasUh5m1yUMfhvIROMgduY7lgmNwAWsO9ZA8A5CMQWX4b2TWVQpwD79sQWFSFJw3UGR
	dmVPpQg9UdlCpF4vhtY/bmwBEHnu6jAXmoMqxN/66enW0WRgidaqVoL4Xv6t1p8GFh2PKJv4G92ux
	xRpeUiDKjfqTXniyTCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPJH-00000009Qt3-0jfS;
	Fri, 19 Dec 2025 01:29:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPJE-00000009QsH-3TEx
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 01:29:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0a95200e8so11775565ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107772; x=1766712572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQga6H56NgMAhDmuMLtpPzFbNPail5D+bj27HRwKHs8=;
        b=IQR0JkyJkdljTujanBVX+v53TyKQT8khNwKU9KsouvNp4063+BpfBt0CAYY9cw1t1W
         o3ba1Vef7Z442udk+BBdoEevmlop6gNje2c295cFCjRn8ITnJob4yfJYiceqfc1anp1W
         1h5dotp+/7x7d13b9YntYVj/NGKonHeFueLeiSMpyr9O0nmlx5fqdepl4/FkcX3hD8U/
         cYevfAzThrXMWQsR2ksGepDOft9UL5c2rzYTu7psLIBtYRYCEpD3Sj7WBxQR/6V9dTva
         tF3PK7K6i7n1kR8RZDSC6xPSeAE/zHQH6TEW5/URgx2oNHSUTmOoORPgXIehFbODdQZC
         e9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107772; x=1766712572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQga6H56NgMAhDmuMLtpPzFbNPail5D+bj27HRwKHs8=;
        b=LnPdb4QEEg3m6GVAFapKvrmUqe8Sc56+bLb9wyVMSaZ7cAfwUgU0vAXZsYhiAHMLB4
         VO6WH973GBstK4yVckC7rWssIQT2q/bBwaOaY4DQA9uwTJf6kYaAYAGWtn47QyMils3i
         ajEiqGZowdvrmfNbTjWVR/3JbFN5N1W9RHYPi6mYhxI6i/vLWW2D3YrdYgDo9AtuI6nx
         pWtqIm8y9nhQ0Ex9etYV/bXdDOq6FoYTX+DOHH5TKhwA51e7I3H+Dj8Rwg0XGiip66/7
         VnguANYTmlB5UNa19FZdASGO+BRpZWeYU1WBHo888vC6pAbRZOX2fHWRyuJ1hTQODtFv
         GbVw==
X-Forwarded-Encrypted: i=1; AJvYcCWfEXVKbZLLg7N5yXXlRqoBmhFNvoUfSo3pia185oWH/PASCcExj+gxjqLIGhcTYwolinHB0E/jMAEnSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEB0BTAwUkVlxVrXtkKZVlhLOMpOnknyD99TRw66cxF8MD+IFS
	etxfIEX8fFuPcEKCZJv44BsrH+a9+9i8hN4b6k8/+sDLFwf4DCBhTTnt
X-Gm-Gg: AY/fxX504mXgye7QoAc36c9H3b71KoQ2fSb4CD6s9QpUfIv9DsiZae9rcTsf42LxLOL
	DFJYSVfjh3ZyDQh4vcuLTxIgFjQF0WD/aa6grKRTAG4PwgV57mbhR2irqaOy9rnvFRHuVTKZl5i
	HzkSLMBYuG2aTdIHdi99txb0Wqa9qA6NNpk13o622Jh3XcVGNz+QdBhnBkz+FLDyOg41bZYgi7E
	oBXdQlLBDTBSmW9FXq851i2dITi3RRRg06r1XKPBnUVD64NwdVFs8a7f3pR90L/Xxo6+vakDnZ2
	cw5NGBwAW+8jznKZbPgD+I8CcwcSN2cOitJs6zYe4DZL8nqzTeCVs8dWsJHq1ONtH1LRf5TLE+o
	BaB6nk67NVMzOAUQFi84Z1ggrU6V3gZG5zWkwog4CVH+rK37AGFKAYtrB4qh4Bzafel3yNFcNmi
	6ZDPEWekYxFg==
X-Google-Smtp-Source: AGHT+IHMJ6kEWYKA6O5Q+cLJMQcvpcOIDvA3plPH9xUduwHOUSXGLhy5v5hS/sYcHwSl1ox8HAe/gw==
X-Received: by 2002:a05:7022:b92:b0:119:e55a:9be7 with SMTP id a92af1059eb24-121721aab58mr1352297c88.3.1766107771841;
        Thu, 18 Dec 2025 17:29:31 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254d369sm3053035c88.16.2025.12.18.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:31 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/2] clk: spacemit: Hide common clock driver from user controller
Date: Fri, 19 Dec 2025 09:28:18 +0800
Message-ID: <20251219012819.440972-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
References: <20251219012819.440972-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_172932_871660_5C872A4F 
X-CRM114-Status: GOOD (  10.35  )
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

Since the common clock driver is only a dependency for other spacemit
clock driver, it should not be enabled individually, so hide this in
the Kconfig UI and let other spacemit clock driver select it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/Kconfig | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
index 3854f6ae6d0e..3351e8bc801d 100644
--- a/drivers/clk/spacemit/Kconfig
+++ b/drivers/clk/spacemit/Kconfig
@@ -1,19 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+menu "Clock support for SpacemiT platforms"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+
 config SPACEMIT_CCU
-	tristate "Clock support for SpacemiT SoCs"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
+	tristate
 	select AUXILIARY_BUS
 	select MFD_SYSCON
-	help
-	  Say Y to enable clock controller unit support for SpacemiT SoCs.
-
-if SPACEMIT_CCU
 
 config SPACEMIT_K1_CCU
 	tristate "Support for SpacemiT K1 SoC"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select SPACEMIT_CCU
 	help
 	  Support for clock controller unit in SpacemiT K1 SoC.
 
-endif
+endmenu
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
