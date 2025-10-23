Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B945FCCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=avMuz6JA8/TI0EDu/GPGes/kRVNRnA3Iq0YruQ0LI2o=; b=0zVYPG54GUL6pr
	hctYVr72vr62I4N7USWtD82c/KvAqbbt/3pS8kXdPJgiHbwb4/ZgogjTkCqpi6DJ4xPvz1F+N17qU
	2kyWm6A7+Wxvyh9/aFkMpuoNZesWJawf6nub1laYurgarzM4jP3MBe5LQ/mzX3RwGxD+UXZ5dgtU/
	Ja444FNHYO66TLiuqqA8qZu6rZqlJdO5/TtbYJ6X4FyIuUKnThWvDhUfuLPkhRXqV1dtWUQx2ndRF
	uTbm8VOdJ5VjFghOKIPTFcrS9i1B0PdHQn7L8W1S6ugiSJIqZsgwlFSGECF0vBnyTfwkG83FKj/58
	o0y/EvCTF/ZK2IYBkZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxnY-00000006qRR-35z0;
	Thu, 23 Oct 2025 16:04:20 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxnW-00000006qQV-2uqx
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 16:04:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33bc2178d6aso814274a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761235458; x=1761840258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qh+XTkdUsVoqfUCJ1tlaETEztr9dvLetJyhEnaoDJ2E=;
        b=PVcvcMes3rxzc+oNxMKynyTqHRivioSzOjHDIvAf19ap5GUuy/tprH/uoeJZxyp2G7
         y+55gDqB3ViRHcm+f9kLprE7VBCiWYJHtmTNHVW1mFiSwlcreYHUANNE95978xt/Gi8z
         dbfUZX1XrEc4QvTxv/uk3nbObby8TD+zTKgMwZXP/PlEaAYyRcRw/9FfuNBJ7DhogHog
         Td4FCkQ4fJUQzivJdTYkqSsDme95JrRWyFdhH/Xvo2Ovntuo+32b/H4+/uufxpiI9SK2
         aKZQpUGBJEL6SQti/FJaGjN1ltwu/el08PNUo+7bPAYIad719n9xt7PxXppED53ThWBr
         5xRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761235458; x=1761840258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh+XTkdUsVoqfUCJ1tlaETEztr9dvLetJyhEnaoDJ2E=;
        b=YmGVymC0kgcruANf2PPVGtxVJ/lYUfA96gQGBhQF69PUqA3I8ye7R9TewCJdSyAaAJ
         2ilA3axG5mK2de/Ws5/KmDzzfZmSXsayhEFCmGV9/HkJBxzeIgSdtjJu2Ap4f1GcXLhz
         khzCn028Hz1m8ZUzoT3alaopbTAxW7kv98NSgPNcSN3lCNjWPae8P0ahm94mTF9yEST4
         bGltmYsakUooEvI0pbfuQq8C/4BsMPI+PtZMMeoAcFSf8IhhRrPNa04qObblVNHHNFhd
         m8+tnrMiyYV3WixUUUljLbvenNZAYUoMoR7ZN/tYVrEr2PqHisUs+8WvKWRTXG/nT8ef
         oyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpHavynTBGsnJRWOm/mt/BaHbGNmcOv/wh8yx60kWqJtbYQL0PvEM45hQgF4xldNzF7hjOS/FmVs9BuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLdEU46nEyA4jUSk48GHdWjxMWnmc+eR8B/L9s9FZdALGVAQDI
	pKNt9jMr89Fu5ehx+JczyYdSnc02lwpcFaBZ0Y9m7n8t99cPiSmGXbsj
X-Gm-Gg: ASbGncs6mW1PzFNGRsYRlKKRN563ndP1Msj1SOvxLUmUtEbxRfD4Jt9kbkChvboslk6
	/JukxsRzDtFjRM+TA8AoKxjnHCZ7gPIwV5S3MPRRCsWZskEZNnsezT48udNxvE4H6fSE5SGcSH9
	5DKmFNjguXaiv9S6rQL4Hr/X/LgUEUtrt8FR8jejvk8mD9oj1HqYRc/xPzRVWxAxEAVuUzBnrFS
	dk+nroz+LSE+BSv1TwqjART3rvAFNOl6Om2nm5+DZkNlKyEisSctD6nsKnEYJWBFs6ySdgph/vi
	Yva+1eZISgFR6RxOGUf2iCDq+IIE7AMHFoQMqNDyrZT74KuzZap7TkXqPwo7a67jFaU3Q367JYu
	ytRk6ObiL1P95lIn5H4IxHxTgQY1rDZ1m8vT2TDhEoNxnpmIr895nSzsycpVTOcs3n2tWBKCCKL
	jNl2hfkJKwp3/WQcbVfq7d6tSnROt4jVh6vQ==
X-Google-Smtp-Source: AGHT+IEZI4ev2IBH4muhdtA8NDFE8NYLvVDhQkEqcYXbzc7+4M5oYKr1bimv/qoYUS2iAVBmMesOAA==
X-Received: by 2002:a17:90b:3144:b0:335:2b86:f319 with SMTP id 98e67ed59e1d1-33bcf919094mr34693477a91.35.1761235457698;
        Thu, 23 Oct 2025 09:04:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff37afesm2815913a91.1.2025.10.23.09.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 09:04:16 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't populate root node
Date: Thu, 23 Oct 2025 09:04:14 -0700
Message-ID: <20251023160415.705294-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_090418_732556_B59359E3 
X-CRM114-Status: GOOD (  11.23  )
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

Starting with commit 69a8b62a7aa1 ("riscv: acpi: avoid errors caused by
probing DT devices when ACPI is used"), riscv images no longer populate
devicetree if ACPI is enabled. This causes unit tests to fail which require
the root node to be set.

  # Subtest: of_dtb
  # module: of_test
  1..2
  # of_dtb_root_node_found_by_path: EXPECTATION FAILED at drivers/of/of_test.c:21
  Expected np is not null, but is
  # of_dtb_root_node_found_by_path: pass:0 fail:1 skip:0 total:1
  not ok 1 of_dtb_root_node_found_by_path
  # of_dtb_root_node_populates_of_root: EXPECTATION FAILED at drivers/of/of_test.c:31
  Expected of_root is not null, but is
  # of_dtb_root_node_populates_of_root: pass:0 fail:1 skip:0 total:1
  not ok 2 of_dtb_root_node_populates_of_root

Skip those tests for RISCV if the root node is not populated.

Fixes: 69a8b62a7aa1 ("riscv: acpi: avoid errors caused by probing DT devices when ACPI is used")
Cc: Han Gao <rabenda.cn@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/of/of_kunit_helpers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_kunit_helpers.c b/drivers/of/of_kunit_helpers.c
index 7b3ed5a382aa..f6ed1af8b62a 100644
--- a/drivers/of/of_kunit_helpers.c
+++ b/drivers/of/of_kunit_helpers.c
@@ -18,8 +18,9 @@
  */
 void of_root_kunit_skip(struct kunit *test)
 {
-	if (IS_ENABLED(CONFIG_ARM64) && IS_ENABLED(CONFIG_ACPI) && !of_root)
-		kunit_skip(test, "arm64+acpi doesn't populate a root node");
+	if ((IS_ENABLED(CONFIG_ARM64) || IS_ENABLED(CONFIG_RISCV)) &&
+	    IS_ENABLED(CONFIG_ACPI) && !of_root)
+		kunit_skip(test, "arm64/riscv+acpi doesn't populate a root node");
 }
 EXPORT_SYMBOL_GPL(of_root_kunit_skip);
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
