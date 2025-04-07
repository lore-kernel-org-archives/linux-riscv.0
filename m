Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE87C3600C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eYH/Rjz07FZGjDpMtUp83r0T/OvpSbryeRvRwiBl0c=; b=0n9l1IDJAsQWdr
	V9Bgt9YFEnXn065Cv+UGf3zdhVGzbqc/1MXvRFIsKY02jEou7Eq1AIZuqgmN4zboiqS08OgidKXtL
	VA6j33oPhD74U0PqNMYn/+rqUM0cuhH/DDObDqAa2MYKd8q2XQet8/4zOpsjEaZkEaip70vkNpL5W
	nnXozgfWo+qgJ9p/1qym9wBEKNGle5LroN7vdjp2tH1VtC7fZi6YLRu4E6J+GSSVQizN5ggUeVuhp
	fiy5JpmQcu1hMsaRVLw4XJ/WNAusNwxLZV7J1Vb6bdf7L8cgwESOyIOk7c1uaEbZXK/DLgPTag9Yo
	yyq1VRr1ZNTGHKRTVB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axQ-0000000G5TI-2hok;
	Mon, 07 Apr 2025 01:07:24 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axN-0000000G5Pk-02b2
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:22 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4775ce8a4b0so72296601cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988040; x=1744592840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrYRh8veKbR/WK++iUDgB0vjWe+7SJfZOYD+1QkYjj4=;
        b=QESbPWjqybUY+iQKGD82rpfKu+ujJCS8WE9KqFFnUB9Up/fCPVUlKVQ5u/qHvUY8yf
         N5Jg/1zAVuM4Vsle1Dj/yQGvLDO8+lhFcF9jeXsQ7siuq8D7RTbxsl6pqNXyWFusJp79
         vEVj8Nxpyedqc8ab5b0yg7TymL17o39kOCU5GHVlqVz6KC2a79EnWgUWGyW2/x9/Mp86
         KVdblxA9R0qzG2QcCF7YY0vCAGDs1fMMlgsGWZOYUMzapwYXlCW2pyO6gCctjwggc3Ee
         kIlVf0ngGOGi7Eo6xF81gjKKz3Jc7ZJ4lZXQA91F8pDKsmJTlWhTLJFfPngDGZeoyyO5
         qHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988040; x=1744592840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrYRh8veKbR/WK++iUDgB0vjWe+7SJfZOYD+1QkYjj4=;
        b=ae0cOEnqU4NeeKRx+yJ9hLFNU3pEC6ILOh4FUTolHqcjMBGY3lNyDYXPJPm4Syx57v
         aW/IwldmTBCxVvuK17G/D0cBgBAj0ef1Z0+1mUfQRASHXgLuyb+PLYhGpgHfPmzKmqYN
         Bqj2c9lL7GKIr529Rjq1szCePCVtGDAI/IsFVtqq42CkDSUO0bOVKC6cKUD4SdNS96Bd
         PDgA0Co1GpWNSFql0EXqOlYywZKNKFuWShllusAeX8OKX318deyVirul71vedtoC86Fx
         HDbdFYMlVnZvqUVN0FujThZR/0jHqSXLuqAkRwqlyh4GXG7iHZxbYxXeqXPH+fNakjOL
         bCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVweOtV8NS3y1x1kumt8BS4vwcMYnsh2Cp1zqeMsFbuB/07HZ7V0PZIqyn06CfB4n9EwvUywpmHt7Vhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzTIDmIqrCIIJvCfeXyqtEjHeeWXE3wv2F083oHJ1wLdsUyoez
	228c3cYVBbQPNHqO50PF8y9zTVd9+rQo5b1bdt6mj/ju7cWI/hG/
X-Gm-Gg: ASbGncvqRl3I3YjRPkpM5MJOO+J82rJld3dtesSdNciZ9q7NCElWBKKQeMW/nta/j0O
	6XT9rvaR+UmHTyodZyTXWHROjH4xNOIf7m6em4roZTGY9VTXKks8cqdx/S0cJXGb7Nc3oVgIz7H
	cZAyNAuAZgYR3nlzvdAdfxq9KhL+CzT+fxOK6XKg81d9KQnWcS6RLT5A3v6EZZp3c3DleocfO+X
	N0QEkvgKccdwWo4CsjENP2JY0dbXIomyzdBq2jeDja3mDtnmQszRWBqt90OzQJ4As0t8o7SS1Bv
	U9L0zktWqWvFKFDW1F3X
X-Google-Smtp-Source: AGHT+IF7NSVs2pn61LScnRGHsXZgfeBT74D3nMQV8mVDwQLJa+8ffQmAQysOQ6zzmkdzOgl32XpRIA==
X-Received: by 2002:a05:622a:11c9:b0:474:f1b5:519c with SMTP id d75a77b69052e-479249a8342mr185000501cf.32.1743988039684;
        Sun, 06 Apr 2025 18:07:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1443a6sm53214521cf.78.2025.04.06.18.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:18 -0700 (PDT)
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
	ghost <2990955050@qq.com>,
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
Subject: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
Date: Mon,  7 Apr 2025 09:06:12 +0800
Message-ID: <20250407010616.749833-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180721_055181_6D75FEA7 
X-CRM114-Status: UNSURE (   8.67  )
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
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index bc5d0fb5abfe..677b39865af0 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -38,6 +38,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: Sophgo SoCs I2C controller
+        items:
+          - const: sophgo,sg2044-i2c
+          - const: snps,designware-i2c
       - description: T-HEAD TH1520 SoCs I2C controller
         items:
           - const: thead,th1520-i2c
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
