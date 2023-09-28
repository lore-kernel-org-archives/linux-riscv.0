Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480F6CE7AF8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 06:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6V2vnhvZ3jm3st9PBc05HAGXzZ3tZotmMO4Sr7BrtU=; b=Qu9Q82izPdHcya
	7mI9r+PCcwnORbnBRLEbEr5/l7JezIAga8dld5e/Zi39EP2l2FrptfqGTZ6Dm2n3PMNt2+6DEXCiX
	CDp7BvjPi6tUYUiIPECwK4/SYOyy3qvKPONUlhknk+Y3ld0pTJl4U+8ExxZWqI6I2M9cKEr6nQpV3
	9aXywnSgdsOlZjC89qP/y7pqhmfmvh153dRcBKlv+ICkUjvpdkMsdS1vNcoV5v4PVPJday4s+x7FO
	LhdMBvsXreSHxpUFo7KmDkiJNrOHEQI25OOYFKHBP12+jxJgxR03KDIshJo2Kfu5sU54l2GiLj564
	VILqUBzJC51g35ld58PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGQ-002Lga-34;
	Thu, 28 Sep 2023 06:12:42 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGO-002Lfd-3D
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 06:12:42 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-79f82b26abfso435899139f.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695881560; x=1696486360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVI3E1Wd+EtlgSmILdTG/g7O9SZ2R+Drh6P8ny9RejA=;
        b=iuH8M0zdp4Iey+48BJQE9WWT6FsPVNhP3xrWE7JrXO9c0FbT4rrM8lVC0CwdTqdZXY
         9BQbEjx6LU1/Uj1jW6mSzYM3nYf8E/coxxYd9m2nxw+4bLAv8rFQyRLb5i5hqrrzk57O
         ZWxbVa03hxIrtJBebOAMamMFW3sRYOm5IFte6+tHlxcU6ifTK/KF2HHUTIydnrMYbD4B
         sLNHIrfVncLIkfm8tyERter9beAdtEo4FaavghN33MWwHxpy0Bkev3cuadF/3Wyldk3T
         vMlVbO9IiYvhpREUXVObJdGsFil0qF0fyO+bNArjGQWdPxIUty3AeyQ18Uo8eSAClTeJ
         yikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695881560; x=1696486360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVI3E1Wd+EtlgSmILdTG/g7O9SZ2R+Drh6P8ny9RejA=;
        b=i8UBoriUw0RjI5/PiyUVimUDlBwI9lGjr+7TtbS/HenTJDxe1HfBi//y03yzqlbcKI
         G/3f+tm8YgYO/VxFFtfptf4qycUg/9DDgIHv4Jw7qpy7hNWTy/5613/QndgWLhNwG78D
         NP+uK94QmkxM4F76RpuUD7sZmmPGYoo4n6iHDgUxjMp0GsNIDULbe2zLd7rFNnPnJ/dS
         6aD1eLiLBqQuKJZMWQhLHqZ3uycXG2ftJFFrCbMf2IMvs3MA28xhX9R0es7nQ9kiLoFL
         w0Zm7maVacGpFN0mF6SWZUUVUkt5lEnm4xonsP7tIkAEY47EoDSJYClnBmbRve+YI+1/
         IMmg==
X-Gm-Message-State: AOJu0YwptEUVzQEgzKSCdvxRCt63Ym9RWqla6ue6QOzDsOEKXQuFVZr0
	G8fMxT9GPuZ8iPfB19Ezjc3Gjw==
X-Google-Smtp-Source: AGHT+IHxgTAD2C+h+2iRuALF/AignSrzhlWjU3CVwyaBIt0/qhlbz/Hw89uJisFxnDDxg1j5YAH3aQ==
X-Received: by 2002:a05:6e02:1c8e:b0:34d:ea35:842b with SMTP id w14-20020a056e021c8e00b0034dea35842bmr279993ill.27.1695881559675;
        Wed, 27 Sep 2023 23:12:39 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x6-20020a92d306000000b003506f457d70sm4774467ila.63.2023.09.27.23.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:12:39 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v9 02/15] of: property: Add fw_devlink support for msi-parent
Date: Thu, 28 Sep 2023 11:41:54 +0530
Message-Id: <20230928061207.1841513-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928061207.1841513-1-apatel@ventanamicro.com>
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_231241_032258_0FF9D63B 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows fw_devlink to create device links between consumers of
a MSI and the supplier of the MSI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index cf8dacf3e3b8..afdaefbd03f6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1267,6 +1267,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
 DEFINE_SIMPLE_PROP(panel, "panel", NULL)
+DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1356,6 +1357,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
 	{ .parse_prop = parse_panel, },
+	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
