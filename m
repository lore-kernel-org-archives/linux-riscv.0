Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E4AC369AE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a28HTc5elvXN7WSYf/Cwqe6Qo114WHsBbg5s92aUxcQ=; b=TJByTtMj9s6oVG
	xaJFF4y/EQ0OJzXRpKQd+Mhp63xtLOvr9sA+QasJAg5ixsaflW8yTZYsoEg369gmZLkCThH8Kjwsf
	fI1BHM28jghpIT6tfRNHwnBLQOEWQYvq6F1U65Pl+/ByIulQ17taNmIPywrKvnpbGyD0E6llLsiNu
	FAJOBkFWOVMcy+s0jr/3/Uq0HAeswgYSSdyNb/d7rmDgNE/Ki5+rtcKHdCcbBCCDx4Q2nouRzge2j
	8raq4q/eAmvTShidxQWNFuVKCHElfFOUBYs+CKv4sZsks8LDvJH4zpTrpbZvZxMz2i30pwcT4+Nzk
	P9arNtccL/+Av9fmwQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vh-00000000G3q-0op8;
	Sun, 13 Apr 2025 22:35:57 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vf-00000000G35-0mZq
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:35:56 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6e8f254b875so35551546d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583754; x=1745188554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lZgrCqn4zngJRfX+93MR+1Yhh+ysY9LollV+OpmUio=;
        b=be1gI/HSlbkGKJpOZHwrr//DLdaYLMkUIjopgp1PKW/OVLZsUWSpu6VWVxWweDvq1T
         Yy2BotwG5lKfsVN3WngQ8+tKZqBQObIKaXpi+nsC001W3P/5s3JMtyc34nB2pFP1GWyC
         tpbzwDcnwprQL9BcV3Ron4K7C34BdmxihQ58LL3Y8hAv8NGaS8L3NkgMme0a3YN3ypVV
         zf6nv95RMPwujX+BBmfCkMSo++c7evpKaQUvmXmVTcN7TAwH52b34y/PV5GanJpLyYiT
         vQ61PFjNkghGiYI8XvS8h7JbCFwXhwgPa0UEaEOcH9HAtGIM0BnsrX9X0LvcX2eMG2Mn
         scig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583754; x=1745188554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lZgrCqn4zngJRfX+93MR+1Yhh+ysY9LollV+OpmUio=;
        b=vDQbq2azyQci06Jske5o5kp05FmYw0hSMJdoq6QaG+b9kGftRt/PgmtCXkN7Bypnec
         feZ9PCelCDguN8egXc8D7euF5gOhJ39oNg4mUKgqI/IJ8orry7pfF7+bTH9WPNU0Jhll
         hdBY0QjwWqUlj/qpQYrNVr0pAVswK5UIMTdwT/XZcfWlCaDtZr7pIiMqAsPVcQb7oLc7
         us+Maxse8r5bzpmWwrNyJpSxC1BUkRxx0V817E/t0UnYOoiDMgqsPLhSUUZ+aBcMPkrK
         V2zjK6NrA6zx4yPzpEyB2pNlzoBvmM5Gy1mAz8tE8dvkw2tflrCieif6yNuTGfP0GdKJ
         8ooQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPwY5SxlsdzqCtzPIZK2Ajj4IBB6lMtOWUg2YlRNFFxGfKkOD0H9vCBJ1egN8dVNSFQe6K8AztEfo5tg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5CIL92xFeV9E83ELvPGZRAEr8agh5OlDf6uocJ0wk5bfSd28P
	xhB0cTNAss8m4sRQ22wFXQhfu6/KaQo62cVDxr22LIXwncgOdg0z
X-Gm-Gg: ASbGncsYe1LWo1QwXounRDef+WkIb4gWjm6GJ5bsN5cm5vmypqRyYenvvdzbgLvFCQt
	/DLzpBXSLX3gSNrLirx8oHM4uj3k7UwH5GGWYuLjPXrhwUq2GGzZ6vpz1EyaNllkT4o4tNCVrxP
	KsYmG0/AyWi8GjsBd2Qd8YFeiVREOz6uVbGwgQ/aBaMWGj8Fsxwc3E8BN8XP9Z3BjGLRmaYoVto
	usMlfg0xheshYxmtVm9z74km4ECKgk3U4IRoUVccxehPFYJuVbslShYeKGRhFcf+OjI69AnKg+j
	idmFx7mcOEgD2DeX
X-Google-Smtp-Source: AGHT+IG8shp+cdQMktaiCiqRlTfz3GoUb3+xi/ND48l0w/3Coj1X/4luu+R/cZPmG6Hdy/95WINopQ==
X-Received: by 2002:a05:6214:e4a:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f23f15b763mr155629336d6.38.1744583753719;
        Sun, 13 Apr 2025 15:35:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de837f9dsm71293886d6.0.2025.04.13.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: i2c: dw: merge duplicate compatible entry.
Date: Mon, 14 Apr 2025 06:34:55 +0800
Message-ID: <20250413223507.46480-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153555_333212_3E58560D 
X-CRM114-Status: UNSURE (   8.08  )
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

Each vendor have an items entry of its own compatible, It is needless
and some can be merged as it share the same base "snps,designware-i2c"
compatible.

Merge the duplicate compatible entry into one item entry.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index bc5d0fb5abfe..98567dc791c3 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -32,15 +32,12 @@ properties:
           - const: renesas,r9a06g032-i2c  # RZ/N1D
           - const: renesas,rzn1-i2c       # RZ/N1
           - const: snps,designware-i2c
-      - description: Microsemi Ocelot SoCs I2C controller
-        items:
-          - const: mscc,ocelot-i2c
-          - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
-      - description: T-HEAD TH1520 SoCs I2C controller
-        items:
-          - const: thead,th1520-i2c
+      - items:
+          - enum:
+              - mscc,ocelot-i2c
+              - thead,th1520-i2c
           - const: snps,designware-i2c
 
   reg:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
