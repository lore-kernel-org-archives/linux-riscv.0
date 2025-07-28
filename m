Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078D6C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+Bxr6xpCJLgZ+RUnh+P7X9QRe5pYliCqKE9NMsqX1w=; b=VYJQc7xMJoAGGo
	ziQmu3kr9hEnliTlMxqM6AQdZYZ7l/rm5Z056cUQlYNfe2QhnzeIvan+4HkEu/xCz/QPh6elHu2xj
	8JYNuUBdm6L/98AJp+zhck/tt6RQXJZvzKGc+jUX0IrUt3EWf1IsUW81L2VVStHblyTK0U9eN3SOh
	mc5OU0OFjqwRZ51V1X3nZFOw/7VHM/yqq9XsUSnNDDbFyVaU16aPANwKv9cMjIi8BQX4cHN4Ce1Ze
	ivrQ+MHh+Tv3bHoT21XBYXnQeQ5PhLlmXLp7xD0+t3U02ZYFZ0l2oCO7kL7zHrgTiHesMQq9BeoUl
	OmArkVttNp1eI9hDMZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKMp-0000000E7zP-3UjM;
	Mon, 28 Jul 2025 09:41:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKMn-0000000E7yJ-20fy
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:41:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31e3d29b0ffso3871528a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695717; x=1754300517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=kYGz/M+Qo09ENIeSKbWzm9f/sxsXEu7Cp6eZs20bYpKQXiVyzEwfvz1claWzhZkPRa
         yUqsf6/alXFqvLs0DpfReV4jbh6Npoffj4xS2i0uMRum8XLuRvQUcwW5qjqn8Yobmecf
         0vRfTbzr51I0VRdHEd6U/Fshs0sl1v7CILRek1nMVtFO78FWlxpNp7UD8uVYlvT2EWka
         R0IaP2jnLztPMma+uAlsoazCKHASYD9Qp3vKw5uK1niZOc884nOgbAG0baQROnjZSzFj
         Q+2ftlDKegER7oZyy1Ts4DIYOhZ7LzpzdiP/iIkdkQ94YFKQodiv9C/4DbufSdcMO5ZZ
         s3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695717; x=1754300517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=gx0zAOfVQk+1h3D9zwyZ5SXlUi4p4p+oYZJH3FRJkeNPveAc9Q+K7jNEGAX4hQ/0oO
         GVt5rZfOzLHPp8uk/VV+h97KKs9sJgziapkUdnj5/+OIZJhUUn1rVfEEkJn7QWW5Qf89
         LaH8R6vcQIRnYHWTGKFVyw8pNGDWz2hdv5QfaTthleaMmAo42mmD5D6hmISrVaZX1s0R
         ouHu104fdQnZ15buMsOz3E0Zr3y2mTtoCIqCQ622CoTLRPcRFPRTFoDmo0TVnQClbT+y
         cpmM7qf0wl+XXllq4udicqJxqE6k+lf+9Kq67uwpAe1f1w95jYYPaOet58+dl/5MQT0B
         d3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHp5BWrX7IsQSWFE6Dwi+A8VqO6OBMob+SaTDDzU/bw8paHMlkIuDjaxgQbiKPPEh1ZoaWiuqxY43Sig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEhdj//MYl6+Nn8PUqIMX4po81domGl7lkbXzB6MFgvRjwjsO6
	d59xlhCQvf1a6D5Xd29QI7Mce3IRiyXfDUEnvjteRJ8vhstNkgYxch1bAm6IJoabvfY=
X-Gm-Gg: ASbGncvFRG1Flbke233yjGDf3aNkTw8Yodc/rqlyAlIIhHDUoH3DlkHvFcPPgGYJ3ZC
	sqMwLsEnQFIlPKpGvWhJf1hj1ihZewZmK04Ssa+5tUMkGH2fMGGBe4dp6NiUEYRKGvfeX9I6Zqk
	USLllT74eInsfU4dBkwCyEIvIIMfqxaq+CClgXo10Troct5PJSTSb8D9nrHfMziGZngSg1EYRZi
	hWkJu7l5GvxCBPT2Iy6m1ljX/yOe/jlfm9VuggcNZVZq5YW0jNLZsZClIE1DnPGkTNWHqSMJr+i
	tSVIdpUv5LF5Ab/daIwbk0GLrHvhqYGi16ZEGxuSFem5Np46c9syANnUOcBqicoVQ2xePztKOJI
	5OSE7bkvcLNXxa+ivThxZtBzXEkvUjxA+fbgSKfRyiibCRdVDOGKwoUlMjpvK
X-Google-Smtp-Source: AGHT+IFhFTqPuSSTK3+8jxndNiXraAgvrolPYd24EgLuqZVd3xcphyV7/2XKTMQF8DKsWkxQNVZhAQ==
X-Received: by 2002:a17:90b:4f43:b0:31f:7b7:4070 with SMTP id 98e67ed59e1d1-31f07b7416amr1816333a91.25.1753695716661;
        Mon, 28 Jul 2025 02:41:56 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:41:56 -0700 (PDT)
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
Subject: [PATCH v9 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Mon, 28 Jul 2025 15:10:14 +0530
Message-ID: <20250728094032.63545-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024157_517832_FAECAD54 
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
