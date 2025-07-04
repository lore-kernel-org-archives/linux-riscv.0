Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CDCC83F0D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+Bxr6xpCJLgZ+RUnh+P7X9QRe5pYliCqKE9NMsqX1w=; b=JCwaviQVxS8BY0
	9mO/E/DQXlXf+gRFCQD/w1kERKZDbpC3RILij30GmUEHXo9RoQGhpbZTFauITX0hmLvaVTNG3CKkq
	G9MpRqueCp9SVMlXOP9uzEGZBtbxRuw8vwH5X0aIRd3ENADq699ZuU5zDl6iwqGL4waZE4fmWBYzA
	iAPVIOKcloxUTaYNm45CemxEFTw7eBWb4O+GKMOuCL6g7dxQ/pWkevLkY6QDUK+RNiHosvZ7onGzL
	7ZTVajeF965rp2pXTAsRGwCm74GK52TnnHJkURg140bZIK1b25sGnBk8zgrK1hdRP/miex00J0ZVJ
	r2xr4HGeMJjjdffP/aDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVy-0000000DUuF-1D2o;
	Fri, 04 Jul 2025 07:07:18 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaU9-0000000DURY-1xh8
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:05:26 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso505348a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612725; x=1752217525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=BesGh8hFC9OdrZR/Ihk9NC/14P8FRnjNbxufUzvcl4ZNFhoAABUw7CPPJ49k5JHWji
         hpikhQpoPN4H4kPbHa05z/ZvZ0UE/reUrOjRhQEGetFR8Im+3zONtRhR9bIsJuANP12X
         9vtm/0UXrCqB4x6oStoOgc28rS7BvOHtgNErQ1QyNu+WoyISPX9mR2MQz5OKiZipDQsY
         ltgmhYth8FaP/aV82Sfv6GvAxz1Ex+2klsnGa/BXqsN9DfZYERSXBc+9Rxgi8Yzs63Fa
         O5TxMJy7g6JvKF7shsVqOKcfWzclxnpKpt1OGdUIboGE0hVd4/P1gVPkFq4smZ5faqU3
         w7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612725; x=1752217525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=CN8E4xvHOLzh/fnH+yGVH/8z0vfLh1HvU1FDI084me6tP+7IdmYmnAMpD7pW+HyPNe
         XFyt65xVeGx/z3JbGOMPsB0eIYN3IfCLNYJH2DpHEUANRSzD6mzslsdBKW1pNmDv5URl
         LdMH0f2VoETgfX+970Bl9VzChdLIkKPZTd9IIKEa5KAY3UpHgfSDjgLUVnnokNVMLTiW
         jQ2LpfcHWLYK43HJQCx0XZAl1qj0UNiiTydb3HkEzU3+6j8VE+qjFH5Qi4dpAOGvfPAA
         gycz7PrcKNbzY/1rZ4NuduO8jStoOGL+EqMun+yDtgZLzwAEFxswNOGa3wh9BG7mW9Qr
         E0qg==
X-Forwarded-Encrypted: i=1; AJvYcCUmm627OHd2MbeN+2BLNhcK/ebFkYUa+uW8e3cgdm2JSbXjgllRw6LdRROKqt211IfxngjOc1QTQUj0MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYc2Iz4II0U2NREK1v5ADRyTOTaUORFXNnk0l/Vxr4HvbRLhKc
	Ve5gLYRgalYjCP6pzjooXN3E4Wj3mL1D2W6obHLhlU+omBE7kEQgdEtIq4SwCdy9UxM=
X-Gm-Gg: ASbGncuNQrRJZXjBHRgXGTorlS3JJaCjlJsQuIRHNFA4DD7PEnaeB656PmN2oslc3qv
	vhRLu87W8oe/nxqmX+TtLIVTjqISezo3pytjZDOeXIPwY3Gh0SPWPzsv/JBvt/wCm7FvH1vDk+q
	K4mFwnYkat2F84VPsWHu7cNHCSmiL5RDQKqoFbTjDjj0H76y8Gox/9Nng52cX5bi7Yfn3GkQawA
	liYoxrNH8GhdDWVBZ2nYCgMccpBnG2H+mCKFkH7LeOLWerbsCACNrVMRe6J66dgUzsWzW9qqqWr
	j/ldX04QhF1M3z/A1jp4ES/eh//mNVrFFQ8kBx7SG2x/ilam3OCqp13rypCQ/i9fcdPeVEqcKH6
	9UlP2cBXjwzS8SRbYD0wEA7iLsg==
X-Google-Smtp-Source: AGHT+IG2Wztw0stW3yOl6KCgbq0+m25wabHOLxe0e4i/arpNNnZE0epPwB2VK7aaXsKsyXh0wihgNQ==
X-Received: by 2002:a17:90b:2f0d:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-31aac44b34emr2635726a91.9.1751612724260;
        Fri, 04 Jul 2025 00:05:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:23 -0700 (PDT)
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
Subject: [PATCH v8 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Fri,  4 Jul 2025 12:33:38 +0530
Message-ID: <20250704070356.1683992-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000525_501954_F424D3B8 
X-CRM114-Status: GOOD (  10.40  )
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
