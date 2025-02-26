Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A48C19F32
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 23:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rf02fFXdStTcS3sgK1leKOI8091SyxFLmOgII+WGkmY=; b=3lGCplBZuhfULA
	HfJ5OvVSIEs0IRz+Rheyl0GE7T2L1E2WfpbARyjmj4WecWKnsrsuDduVSU38nC7xRAtYzBiGkHHcp
	hrqmeABB8/sDvuie6jhS0G4MMUx7CmPSySRQQEkR3bGHF+8S6M5SFH98UUwqmORFPF0JnyO+NIt98
	ywx+0Xap7HsZ9RRJVB95hmSYyU5TQaaT3QCUIzoj+FuguOMajUfnSEKr8WbJbLdIfI/WMaL+ZHVH2
	NVtgjABh16OHDHeLaaHUVb5cW0tZiSmkl7szn/E34t9qRAm0/dyOHaPHB4Anp108INz3FwMBPC9Bg
	LLl8F163je3m5XnqgiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3X-00000005j3g-48U4;
	Wed, 26 Feb 2025 23:43:11 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3U-00000005j1g-3v0h
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 23:43:10 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c09a30e14dso60399585a.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 15:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613388; x=1741218188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3ZZcc6aFlJ+Kl9Jw+kBevA1072SNgIuZeodxvN8Etc=;
        b=ai/7WAMO7AKHqUOnQUqG0LDwdJmH8mJK6F2NRvBAQUGvsC9cqUv9LTHS8W/jTED0j4
         0V+9dabUccyCKg2STg4m+i408cQLWVRydY53qsz3w4HL/O+GuE9hXCP9UXnt6J1cyKBW
         bxF/wqdP7Aea44zoMPT/5qlYx9ShyEsNlZlnIfc8lXCQ1knE9AjNWY2Uc5Q9VXzVlr5W
         S0LLQqVGWwBvGu+Y5BuMQWGdicH7Ramh3NdLHN03r7Fp0p+1im7FH3QM4na9k1BrworF
         rZZEunUoYYx1PHRU8Wq28LPsx4hvM0XKF285FqnMFg74sOM4jTK4K65ppW9bNFA9Fr7S
         HDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613388; x=1741218188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3ZZcc6aFlJ+Kl9Jw+kBevA1072SNgIuZeodxvN8Etc=;
        b=R8V4n6wINBkE2YJdZO2Hv60kJ2/KUgmoIp5uPDUmBz0vGS8khUtXWN/L+zMzk1lN9Q
         egdW6iyMIr5PM0ps0rlwmYo2XocjLThjMaunurp4JN6DAQW26Ok0sAixmwhlIOCFlGpY
         g7ORPdRX1G9xyMM5GmxSBexTkiLjAotjIW2CHqXGjwAkGrXer7NWoq6LspeFb7Y2sYKQ
         D4HvicidCXJnHyu475HsooYAntnWA+2HJSLsehdk1kOdKxqa2tfTv66zABnsRmnQVn9j
         vt1YmMIIkFNnxMxgWFu8/W8F/xhTY9nYe+thMhOftL3pcViDNg7aaUTh/qlPuP784ktJ
         ktow==
X-Forwarded-Encrypted: i=1; AJvYcCVT+icqAFvVBD7MjylUNYQKW4q44zvh6bztPapqm/k0tXoHZdlVudYAal3rdHnIGGV2M6WMlnGz10VA0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo4WOwWBOcZSZGrM0vKX8TPP3Nwn+q5oPum2GDXvx9XhxVu6GN
	zzTDyfQvZLhehJ8vpfPfjWeoTtoyWhBQiR25B5Jmjq5vPRRra6iS
X-Gm-Gg: ASbGncv0X0/3ZACOvFXkwVWk234426pr6RXu5wVgrNSE8J3nw3jYTS/IASHpM8GOs0U
	MiersJ78jqeI2AWmf9LpZCKu7MF9wyUBgjjNWW0yTy/nJeX/l3p6mWyDbTmiYkfAOng2QmpoVwT
	limO9Gq68zqe47pwmRSFTduOjIfkxW3Jfw7n+Z0zummb3dwQVeauOy76xS16rkcGuDuezes1jzC
	lFOrlt9fgLLhL6jY8YYgNvIF26WMQaJzTya0EEtaioSorqcQ2ub1kQq38VlDRw5hawtxwz5nf5r
	6A==
X-Google-Smtp-Source: AGHT+IGD3BiOa/Df2rVPvpy/tGOHarw9GjKQY9DsMSLrCoKOy4FTIEiF7wxb91QFop6oTXwxGEZsUA==
X-Received: by 2002:a05:620a:24c1:b0:7c0:a3bd:a779 with SMTP id af79cd13be357-7c23c04868amr1554444085a.47.1740613387864;
        Wed, 26 Feb 2025 15:43:07 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36ff0f756sm24200285a.61.2025.02.26.15.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/5] reset: simple: add support generic reset-simple device
Date: Thu, 27 Feb 2025 07:42:31 +0800
Message-ID: <20250226234234.125305-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_154308_974568_4DD6FDB6 
X-CRM114-Status: UNSURE (   9.52  )
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

Add support for generic bit reset device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 4b08f8d70942..0681f2db7459 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -149,6 +149,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "brcm,bcm4908-misc-pcie-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "reset-simple" },
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
