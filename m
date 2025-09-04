Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EABCA1014
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ER+OHQi9o8HqH2hgeBuhTE6gJ8cNWBU2SO64N8+rc30=; b=VqdIGCGzYyyCnz
	u+SEWfRVf1V+jDCdO8D2qQFe4O8nkD5Wi9r90HGzsG9S/uYBwqrh/lekFZVZdA8xpT1H4j7ghPriy
	p/tu4IDujWBS8zEvyJYpXvFwnynIbFS2qCnKIr7im0b34gOkrVhdjkbakequcXWKKI722moouCYFW
	b+QFBNfrkrhfdQY0X9KO+KeKD+tqZMDCCLAoReBVTtAqPovxjeNm7w5K/cONnqmycHhsXbPreTEUt
	+6zBQeIbhVDJ0vad0xhA8OcVcWIaPovDAf4CfU8nc7Byfe9K6yozC5ZoL3+IFgMZkzH6FF5grWQmH
	85/xqioqGJ/GHo7BvgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Do-00000008XpP-2fUZ;
	Thu, 04 Sep 2025 03:01:12 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Dm-00000008XoS-23dt
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 03:01:11 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-30cce86052cso409519fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 20:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954869; x=1757559669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHYoZy1BbbBb9vcfhdtPl15TFAqdbk6Ii/kfuxxPco0=;
        b=kxpKa3VXFDODoUbhne4cutRDod7u7jb/WSNdzvjmVd16NMXgy0ZDDdzaIBtCqYRyow
         3SE0OeSzH1iRXZ8v7XycM2ku/P/3WCB6uCgwGUYtjaZDkMo0zgjKsK8iRZSugk1dE523
         MjmCUrvtmCUrjh/O3NWPGeRRPJWTCGHz54FQsiwiJ0aUQViwlpGxEMm5lijkSO/MjN7r
         hPLRjhb4NBBhAW7oAsUC3SBVwaZrejcb0fjz2G3jQI8FoxuoljhIWpCLZRlz+OkBuNYc
         iWWx3CQJxND+1QUU0FeVEimoGz9NzE+Ezzr0TyJPx//mTR/RtkGddMnxUclQCdlVt2e2
         QpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954869; x=1757559669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHYoZy1BbbBb9vcfhdtPl15TFAqdbk6Ii/kfuxxPco0=;
        b=HAa8KC9qS26FZVNsV+XQC95eZ5qTn1g8FbHWk7HoyTkcF8gDLRI7R95a3/xyKW1sL5
         MFRt8oKgGiZEXmPc08+WLuJRfJnXVAp+aFTQe3+U817RAlr/wicPV8usWByzfk1f28z+
         IrzQ9WivB8QJ4jAbTI6z7g+bPdJTxZhkjdO6ZBfFZmUeTrpF3u07Xw7BtxoCWqHPPflT
         R8+/vYXBxd9fcCYE62QoR1jsfOZHnQwEtvsj3ORpyYdbGIEIu2CaVN10szscDADWmn4m
         z8YQHtIiRm83TghJN6yEUlCSi8Z8Uw9IfddhQHtzGCABujezjnS4sNmXhe/cNgJQd4iW
         zHbA==
X-Forwarded-Encrypted: i=1; AJvYcCW3vLFlvSmmPbhtpWFeM6t94A+5F6KRgH458zG4YH5kJU8xem9TRj+1cBZl+f9oUZVYAZgfQOtUjx7L4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS4zhWJusP4v9096q3zk92BnN9A4YJaidcx9OJjl5OCaXDfhou
	GguMgmwrsmhOsNQYN417i//NJb7cZOpt1UtuYCnal7jyIbHqDUmKv1FV
X-Gm-Gg: ASbGncsXZxNMfqlT+RU2zpa+qxnR1OhCRHmvlYahJQbUk7MgyyrD9p7JSlES2wIALdQ
	BaFPttjtzs0jyKxkl7+x2bgnI0HxQQ5f2el2JcnonYhoGyJeSL1Ca/RSSuCCmIpcS4gPfyluQ05
	T7Zuw8zLVJ/S3Vy86PNyeWUvWeOcMp0Us0Kyg6+rta6VJ04jdMWvcfdvGcx6TmIX5vLh7zI5B5i
	OhV4Yg8EJ4W9Jx7Nrn0Buu5UDtFcTB4Z8HuAB4SUn5lBcZbVCBUm3kPQa7WfrQHR4PFYNelGqvl
	J8iafX58aWUfAcvNVFa7mvJbLod5kmUuKtLyO8ILkjyaobUZm+dmoVP2R1wUbOwfV0t+DhIyHpE
	tBbWY3+1xTryTzRZe07YZ2g8AZsacze0X
X-Google-Smtp-Source: AGHT+IEeO2nVtWYZaHo8wP52NN3KXbpMpsy1+TD/jG7mcZ7sL45J2EgJViHSBD5Zz1bzVMdn3YTMAw==
X-Received: by 2002:a05:6870:a90f:b0:315:9e4e:4f7f with SMTP id 586e51a60fabf-3196307efbbmr10158685fac.4.1756954869501;
        Wed, 03 Sep 2025 20:01:09 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-319c704f44csm1327722fac.2.2025.09.03.20.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:01:08 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v3 2/3] riscv: sophgo: dts: sg2044: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Thu,  4 Sep 2025 11:00:59 +0800
Message-Id: <c38b9b1682af978473705b7e70b6faaa36fe5024.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756953919.git.unicorn_wang@outlook.com>
References: <cover.1756953919.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_200110_529746_FC62FC7F 
X-CRM114-Status: GOOD (  11.01  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Fixed msi irq type to be the correct type, although this
field is not used.

Tested-by: Inochi Amaoto <inochiama@gmail.com> # Sophgo SRD3-10
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6ec955744b0c..320c4d1d08e6 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -214,7 +214,7 @@ msi: msi-controller@6d50000000 {
 			reg-names = "clr", "doorbell";
 			#msi-cells = <0>;
 			msi-controller;
-			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			msi-ranges = <&intc 352 IRQ_TYPE_EDGE_RISING 512>;
 			status = "disabled";
 		};
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
