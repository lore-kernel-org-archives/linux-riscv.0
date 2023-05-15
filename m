Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FE7C7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPOmBnDKUzaLNpjMKag/GNP1hLNKaXRWk4EYIgWuYx4=; b=iNXz0RKrnATPYL
	WiiB9CVbTqral9oe4c1L3qJMghTP16Qh9uXRp1YpY0fxothPsBXc+/1Q7S6jIK9Zvikb5JIlz7OBf
	7xpQQx8xMb9viIeRxuKqMlDKv7E9MEONKRxxzKFEEcnPEhFere8Fln2XgnNaBfkBmUo6Iy85PP47R
	J+ChAGGI1XSRW2BM2/kv8IOcTUFY+gxwSHwIG+9SZJTIqfKUug0N9MPlH6Ul8aZ7Vgh3ND3jUrlYD
	V5UxLrDtcu9YYHUDbntt7PcKKF9KPBdzneojdDd8TM7Q7q2ExYMveK5V+SCchNTYRwoUHb8EotXHO
	w5uRNWC5JKZA9oiYO3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5l-000zd8-2J;
	Mon, 15 May 2023 05:49:53 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5j-000zcJ-2V
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:49:52 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5208be24dcbso8783691a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=dzjo8FojeRcnufXLfXC0KBxuYEA22LD3hfHOwXg4ZDuLKLv0BrqZuH8SGOB++jp5uO
         wzKiYKHcGFS22nfktsiZ/0soliO+6KwkV1F/CT4cSacQXjZNHJvQslYLfkfOySySRtSC
         8UjaZJDHoN+NS64WsDBJKuPA3FJoVOmbNNpbeSntaVz+MYmRbJtjWSbb0awzzHpNTzQM
         iMrORsenLXTKP1MfGL3i50980w+juwmbTsihGPxC1TFAomikj8sy7z3tZ5zOxuVobKLf
         PO/dJlkFK4Nme80wJtwvZuMrtkTbpTOttq+0KOfxO/f5tg65WVxizgRj349mCeC4zcqw
         YAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=KSnfoTxcqkfSvmmsanObUAh64E2zZcDkPePkVpC2Xo1By5kiZe2k8SC0uoEXctreqw
         QFfqexx9ESAXQDDtd+BUaoP2iqf8yGCyZ4FJOeMZYUU36xweGTKMWPx2DNjPQVTEdVFk
         5wOCoCn3gmQelZVVu7XuNAfcEUnwoRBomUXKpxB6wSSYHcCEkKbgSU+fC4YWVHG4UOkN
         1LugV5H9lAO21ct8PCmGkb1lBb/w31tSnzH2pPaBh37Ll4owhgutTwwSeStbXrVxoSkb
         YFNJxNw2qdPJya/sYguu9mykncOSTm+Obg8CB08ehdOwIzIeSOoiZkVlF9y+64SU2TNB
         Wmgw==
X-Gm-Message-State: AC+VfDzbmD/2Gbu5vLV7UUblFMVGjOLL/0G80TFE+ay8yvvbPnb7j0od
	wUqi8jsR0As6LqeXUm28rwkwE2dElXcoexhdpG0=
X-Google-Smtp-Source: ACHHUZ5Z2n4/ARSq3kgTidyaSTNrk+RwN40D33bxOlnfkr8ZPEoD5Bs6K7sM3BLGphGdcRXft9Eprw==
X-Received: by 2002:a17:902:e5cf:b0:1ad:e3a8:3bf with SMTP id u15-20020a170902e5cf00b001ade3a803bfmr12750021plf.21.1684129790858;
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 02/21] platform/surface: Disable for RISC-V
Date: Mon, 15 May 2023 11:19:09 +0530
Message-Id: <20230515054928.2079268-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_224951_812614_44DBE793 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled
in allmodconfig build. However, RISC-V doesn't support sub-word
atomics which is used by this driver and hence allmodconfig
build will fail.

There is currently no plan to support this driver for RISC-V. So,
disable this driver for RISC-V even when ACPI is enabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/surface/aggregator/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/Kconfig b/drivers/platform/surface/aggregator/Kconfig
index c114f9dd5fe1..88afc38ffdc5 100644
--- a/drivers/platform/surface/aggregator/Kconfig
+++ b/drivers/platform/surface/aggregator/Kconfig
@@ -4,7 +4,7 @@
 menuconfig SURFACE_AGGREGATOR
 	tristate "Microsoft Surface System Aggregator Module Subsystem and Drivers"
 	depends on SERIAL_DEV_BUS
-	depends on ACPI
+	depends on ACPI && !RISCV
 	select CRC_CCITT
 	help
 	  The Surface System Aggregator Module (Surface SAM or SSAM) is an
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
