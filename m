Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9A7C369B2
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89wYVJCKdNzDhT6MTMc335I6fLx+mqwBrNrgOnAreXU=; b=ymtvzPhI486hOq
	vjzGq6jU/JIP4fY9nEXY8tnV3Jzni7+i/lwrnKIEzd3iY6MgTJjII6okBjYX/2FHtFV11FpHelrjB
	TAcErm7lXegVJ48hZwDgzQgeh97f04WtY/Y8o1SDZxlSj2qWL73/liivNZILP0+v6HR6IcoNn1n4D
	JzZw8rsruaUBGTzRDAS/wEUo9u7WjqXCyhItbLbMRUGdxYvpVLTyyoHzTDuZgU5OuRHj/Y9uTYOrT
	+hGfM/7Jl2hgtLyBfOPkmUq4hSkqh8VAgZh1LFH5Rxur/2JLPeAHc4KaTCvlQ38xkFUa39xiprsBH
	LQYj2rK8lOJWkKoKbX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45w4-00000000GMf-2kZr;
	Sun, 13 Apr 2025 22:36:20 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45w2-00000000GJe-3e2J
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:36:20 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so36377556d6.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583777; x=1745188577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daviB1cPKUPKVTzlHwAPUCR9r/kY67ATms+WR51ErJw=;
        b=OVNpUH79byAyNZKGGZJSXwuzvXeBx1CwZy9gnWMctEQzH+gU98tXn31u7DsxKTMQ23
         JmR21PlksSK9i28J8k33FZTxtN2X8sZx4/wR6GwwOTA1gcHLkpQ0hZFdYlyT5yaeyX/r
         VbT9sj8AlZ5VwHmoi73GYvy/FQVmyEzaEd7s6nb40stJapJ/QCEHCfa8myzI2OhqltuT
         tskkcPMiK6KsMG4+bvULo82Q+c9BHndPvDN2GYIzEW1oRxO4BL3YEOYU+KkLl1UvEymU
         yD3vv3BmAwECKwARquJ0SBk1/xWsMUC1pj51H6a72K0vnq7lIO3Hke9WmXgksNGIbmOW
         1vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583777; x=1745188577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daviB1cPKUPKVTzlHwAPUCR9r/kY67ATms+WR51ErJw=;
        b=Gp8PxUYmYLkvUvo6s3rrh9s/6aofh3PYt15KZrkxqffEBvxum9c1x/GGrIlN8tPPfc
         CBaTk+/pLtSgjlDhW8iEAfQRqsE3UCAEDRt2L6y1Bc3O/UdYZa+K7RJQdAhFH3n0dkDa
         q/RwPn4D7wgLUA/JgpjP3nypY21IFE1agZeUPn6fQZiZuhOjZBhu9amAQEQI7DjGsLDW
         OJA/iHbbfuO+EBhHGTq+NSf/VdqfIRZKud9MyuEakeTd6jXD2hpPOwviBqEvu+k5Tt+A
         6GPXrhP6EoYvFEhlHnC4eXf6dJL6bIqoaRAzJS4it++RAuTXE8ap918Kdmm8ZCs5H+JU
         I59g==
X-Forwarded-Encrypted: i=1; AJvYcCW7d8IjtP5VX1VhDY4gDYkZ4yFIJD8+94EWuC5ArVTMJ1LjVoSNshKvD8upkgUGDpVaX/dGeOW5ka6YAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT3Y38qDLkNNoKFTOXxL6J5qkhjIDKcY9jimDiFdr4olJvkbZR
	8TRhPta4UCEoJR1kwfYJd2+0q9OGlmXNjGf4/+zqwUsinisEroXv
X-Gm-Gg: ASbGnctc1tMiGXzPEGh1bjg51s8ep/zPmWXq9VAi7+lyDjm5aIOJWkdSb9z0z2BiGte
	yO1m8/5NUW4mruPyHKHtSY0VWgWPjOazqSmg1TIDZnrZ0ym4Tzy/Jl0H6F+NsvvP/+FgnxFJtt+
	GOv8ZN9mezF4dxwV6+gUMUg4uXi1prBI9ci0sWy/7l6NiOqiFjtf6rVDJJrDEWsEZAfyxF2KCBn
	uPb6QoVYjH7rL0g80f9CgL/lYv+yQ+Zi/0hlptlgoOTRg6NuFbUQMUfE0+zipgLqBazQrU/hMMg
	mtXYejxVMXA4b8O4
X-Google-Smtp-Source: AGHT+IH7HeWo8kUCZYyXEzOfMHfoiorUFdL+FJ/xQY39VdlD+gIfOhemdYptpXdGIj9JLJ3nuLc1RA==
X-Received: by 2002:a05:620a:4045:b0:7c5:49c9:e4ae with SMTP id af79cd13be357-7c7af1528bemr1539566485a.32.1744583777535;
        Sun, 13 Apr 2025 15:36:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7b82dcaaesm290676885a.89.2025.04.13.15.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:16 -0700 (PDT)
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
Subject: [PATCH v2 08/10] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
Date: Mon, 14 Apr 2025 06:35:02 +0800
Message-ID: <20250413223507.46480-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153618_911547_6A6EDDF3 
X-CRM114-Status: UNSURE (   8.59  )
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

Add compatible string for Sophgo SG2044 SoC I2C controller which can be
used specifically for the SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 98567dc791c3..d904191bb0c6 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mscc,ocelot-i2c
+              - sophgo,sg2044-i2c
               - thead,th1520-i2c
           - const: snps,designware-i2c
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
