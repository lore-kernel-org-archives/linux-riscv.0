Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81775C83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drVtD1qop3WP0rG1W1ZLTILKeF6xZZDGZeWjNuMIBE8=; b=J2b0SdFe4G6XB2
	mE0rK6tBfIJkSVKRD1nYMzybp7Ym4hPS4B5lxILnCuiRFXNsNtFx5ePZbNw1X6JDMmcbBpmA4I8jF
	dTx3swNQi5FPtooiUpDd03g4TCZqerkeBEXJZeFuUJb0AV0u2rBjsvJze8GxRMgXi8Is1oAsWeSUb
	pEc9pEItzWFP2aorDZLbCrRJI4UE19n6/7/cf7iASMt41w29fgTeceE8TtVaprx28SZElCUO6kml1
	+m1myQgE6L/mYZUq2ThITAtSZM9jRHCNSK7noIZxOxsWCmCD1R0r2fsU+Ac6hM9g888fa1AtUEzF2
	SrfhiNSBjeiI3anBTTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuD-00000007HOG-3kwh;
	Wed, 02 Jul 2025 05:21:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpo4-00000007Fre-3EWA
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:14:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23aeac7d77aso36085705ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433292; x=1752038092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqC4VLtB/5V/tfhRhr6dfZ8k+2Am0+dgL1H83VW+Xe4=;
        b=aFHZYwfcgNJb38toeGo4bV2wszltTlLvbnu+3TEem51f/w9FALjAsgHAFDausoWymz
         SS1aa85xglITIIBAcT614qREURskEU1ScwmBpxRh+qXp08/yCPOkr5MB6a5dhdEMnktv
         31krazCE8pgRV54fWnl6zKQHjEUTrwVE+M+pubCKCMs9lbiznFiT9i15IxNRB2FX+uId
         B/RqCHgEjPK6vGp9nGsios9Dtmq07lAOtMOH8P0zqkYFud1wFwRwFqeR6Ozs/QXjKfis
         IklCS1VONYuLO8pHNynP2DqWL7uThnxtyAhMb46UiVbgHjFxaZXxMctkwgXJtNqzep7v
         gqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433292; x=1752038092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqC4VLtB/5V/tfhRhr6dfZ8k+2Am0+dgL1H83VW+Xe4=;
        b=jCCd9p/30rSCJS39G44BhKH3pUoXx87Ryi+yqYctx+GUGY5knv8x6kfB/nkdkLjVxG
         E3lv2qRp4Jb33I7ie+czXBu4rViNsKmDieo5rPRNCHgRCW0zuLPerk/fCuiAzBQP3Y4Y
         jDff/fIC9H4KICuB73jsPreCAZROnfY3t5reDioN8qZWTbEiiZB+qLk9dL63xbFBVYiU
         L9CbDYdgOf3u0ir8qYNT3vHBMpGFUltApVNkeasrbe8d9TvnOEPBRm1nhQX7VRpoNMdA
         jWMyTG/cvQ24kqaxoit48NNrqQYVr3jn7S06Qbtp4ML2UnnjXj1jAVOLrjm4tM5KnLqn
         e8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUvXWmUXVIo5zSdwuHBoa6bchqSatKcZvIWM17RWRma67vVCsdiE/EWPkkh3ufD8MzbAVddkS6AYJQWDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNg9WmDkj9IlU1elE4h2oLlJBea9xcVqyNTwPIemyv8eYHXxIN
	izgFgtaR7P8ndpJGyh8+mJnIo2paR86uO9u9xj+EbUgLB2SgETxj2nB2f2g8M/YvUCo=
X-Gm-Gg: ASbGnctqr6szlGtAviJX4bYmJkt7hSusjjfCFUcBRcumQIosnTCazbG+QqckS9JW+Sk
	aCa1GmQbbUvG0t/Z9bsy6qzZRZgHxtwUzj7KoE8yWWJlgZsi4FfSLWAenKjMoB/1pu8TyNXXp7+
	OSM+ZMUHHYWAqU4f6kjGUNiPiFvFcsNWNED2NQr1Woxq+xbPvdftb+3CiYR7hFBCHn3nGk5u70R
	Tjkn7yIMwIeHGe/LQTzl0FgF8ftCljj+FdZw20CVCiAqAmgU9VQv8FNcxaE5g1bhtP0oPbHBf+g
	iI0EYDpCezX2eq749q25ozRjDehIK9ZUCL5X0DILBLXC06X2THcOgERCGVARcB83D1itzbwLieM
	sfz+slM+z0/a/i8Jp
X-Google-Smtp-Source: AGHT+IGlyNbAZQuDOeCGGhEH6QTSFXwRevz7KU5t+CywLuVwtZ+G8tX33M+R/3t7hDV3PPKWLn7voA==
X-Received: by 2002:a17:902:d2c6:b0:234:8ef1:aa7b with SMTP id d9443c01a7336-23c6e48f8admr18399295ad.20.1751433291916;
        Tue, 01 Jul 2025 22:14:51 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:51 -0700 (PDT)
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
Subject: [PATCH v7 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Wed,  2 Jul 2025 10:43:27 +0530
Message-ID: <20250702051345.1460497-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221452_807290_A69BF6B3 
X-CRM114-Status: GOOD (  11.43  )
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
