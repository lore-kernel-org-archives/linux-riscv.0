Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD9CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+Bxr6xpCJLgZ+RUnh+P7X9QRe5pYliCqKE9NMsqX1w=; b=YHLTSB33h45D5y
	QQ0bz2GwVgh7LL6LXGjySLJZ4TC7hHxlXaG1n3He6RQ12HbEL3zkEgMvCiIIOEey9WHDVpbSXW0rb
	y2xyBqJOKP0bX4AwZ9g3KdC5tJgOLPRyq+Cx3P+rNe4tT8csrufWP3PpTKD3CbLANRdHVt69j7r2i
	riPEbx9PSSYG2Us+vVLL15/kW+y0YiCc6qNqts5pngdSqtU3h9P6lDiEU6PY3LSrbk+ELnpznE/gv
	W6emvYSYn4oet7v4UFsoRNRqTibHBhMgBcGGBFx5gT7myhQCtNQa7f6NIbSZfWDv40vdAevLCSsS/
	PKbLDG+r5efmh/L1xACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrD1-00000006R8S-0Vfk;
	Mon, 18 Aug 2025 04:10:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCz-00000006R75-0rBn
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:10:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24457f47000so29392145ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490256; x=1756095056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=fuJCzs8QaZBs8MIAAU7Eafm4fKwaRP0+h4CFp1hJ6kz0REPbj2iJjVdMR65rG8Ldxk
         HbJYxMOnPrEoAtE8v8/mjrC6VSimdHEPnrWeppZ8JXoOmNzmtvby7X87nFeF8LRiGkev
         8NTc7dnCLm7G0VzYYpSBLVYUpX5EeoedgEktv/F+T3InSDNyT11pCNMv20p13fiPddpg
         2y+LJkOxn8JCYhuK+itZXEgpXQRGnQgXjejGEYLgJz2xoebK+CVXo5jGJ6D7SXK9Nt/O
         A6QT6wPzP/VK+MxPmdWq6X74ZIYLirY8bctp3iAOQGJf28iSwJgzW6IAOLoxtZF2iLrK
         B08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490256; x=1756095056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=Rea6Odc9na9bOvVnr4wIdGpa7Yshca+uoGJS0OpYKQxC4xyllxqB+yf1492RwAn2T9
         DhgPy+jPwIx5sdtQvZSR1QS1ZdCgvSQhZuf7G9TjSmSXAPa01V9/xc2cjmKNPKH6RkQ5
         kt0JwFkQhRGltQFIbRa1dKcneVoHvU5D7P7S1iTB2wlKECoDRENDkYkPupjhTepTl7wR
         w60pG7XM2aEwCAW562e9IHcYrAdtUay1lF0Flw9O1OUmq752Izlmrb/Udk2JtuA58oBf
         e8i1ztkp9UNdR+TV0A75Bq71htuU8sUpBP3zpZder4kRKmfipbnNvjRrgoaM/phOMMjI
         WL7w==
X-Forwarded-Encrypted: i=1; AJvYcCX0ToYaeKSPcTZo+dhtx7ZQRn6tsRerxwrA3Mx1F79GKAQOngQ+CoRw1rmfKQqMpmyO0hf5IX2o2rytcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwPiDEDCgbybxSggB45UONcoUMgPJnR90cPpdzVyHTMQhmDCyE
	kgves+ni4Tl6bMKGiUu1JPp5Nd55xQQoxROFlXRDIrALBXVYDQntdkR3GH570OyUHTU=
X-Gm-Gg: ASbGnctXQURIb+5Y2ZGA9SdfrfehOh9c6u7U/zNJItZGXbcYtYWWN0B4Djm2B4LCtsD
	vGfpt6NAndsjzfBJ/+s0qammrUagM1INpzex9BFx4WRyf6NK5Vvi9mI6AT5XAwE7+GahepBbteP
	mcH3YlqAuL0tClcU3mGvuDSXhuxdS4lQ0eWa/A/o4LkiG2zbRiMPmYGs6LomnKZZ0Yknz1AW8Ks
	6Y3WjRZkO7ZAlr0+F+VpeDzW7qycIgTO6UJ0VAi5npSgx9kSMxktXfmB52wlUbAQqRXS4YbV65f
	Olb18aAbg+GDw2vxnK99vHC/XXd5WS9BUWR8Ig8qNi//ySboIlt+SDbfq1OOCLc9Iv6SDjkEy9e
	JnxtYGbJelvRpBmxqR1oUKF+wP2TWIi4oBYWiq15AVg0zf6iv9A+1/A==
X-Google-Smtp-Source: AGHT+IHeYI/gJKhVi0ejI5JAJv+DItCCeU8H2nRnY+2JhkO9bcHtEjh5t07sN3PKPK/WfAop4xC+yg==
X-Received: by 2002:a17:902:e848:b0:240:72e9:87bb with SMTP id d9443c01a7336-2446d934b0dmr122949965ad.42.1755490256221;
        Sun, 17 Aug 2025 21:10:56 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:10:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v10 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Mon, 18 Aug 2025 09:39:02 +0530
Message-ID: <20250818040920.272664-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211057_247682_63A8172C 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add common memcpy APIs for copying u32 array to/from __le32 array.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/byteorder/generic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index c9a4c96c9943..b3705e8bbe2b 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -173,6 +173,22 @@ static inline void cpu_to_le32_array(u32 *buf, unsigned int words)
 	}
 }
 
+static inline void memcpy_from_le32(u32 *dst, const __le32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = le32_to_cpu(src[i]);
+}
+
+static inline void memcpy_to_le32(__le32 *dst, const u32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = cpu_to_le32(src[i]);
+}
+
 static inline void be16_add_cpu(__be16 *var, u16 val)
 {
 	*var = cpu_to_be16(be16_to_cpu(*var) + val);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
